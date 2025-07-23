# Image properties
$headerSize = 7
$width = 256
$height = 106
$totalPixels = $width * $height

for ($index = 23; $index -gt 1; $index--) {
    $prev = $index - 1

    $image1Path = "{0}b.SR5" -f $index      # CURRENT image
    $image2Path = "{0}b.SR5" -f $prev       # PREVIOUS image

    $changedPixelsPath = "changedpixels{0}b{1}b.bin" -f $index, $prev
    $addressesPath = "addresses{0}b{1}b.bin" -f $index, $prev
    $outputInstructionsPath = "writeinstructions{0}b{1}b.bin" -f $index, $prev

    # Read files
    $data1 = [System.IO.File]::ReadAllBytes($image1Path)
    $data2 = [System.IO.File]::ReadAllBytes($image2Path)

    # Validate file sizes
    if ($data1.Length -ne $data2.Length -or ($data1.Length - $headerSize) -ne $totalPixels) {
        Write-Warning "Skipping $image1Path → $image2Path due to invalid file size."
        continue
    }

    # Prepare output data
    $changedBytes = New-Object System.Collections.Generic.List[byte]
    $groupAddresses = New-Object System.Collections.Generic.List[byte]
    $writeInstructions = New-Object System.Collections.Generic.List[byte]

    # Compare and group differences
    $i = 0
    while ($i -lt $totalPixels) {
        $byte1 = $data1[$i + $headerSize]
        $byte2 = $data2[$i + $headerSize]

        if ($byte1 -ne $byte2) {
            # Found start of a run
            $start = $i
            $run = 0

            while (($i -lt $totalPixels) -and ($data1[$i + $headerSize] -ne $data2[$i + $headerSize])) {
                $changedBytes.Add($data2[$i + $headerSize])  # Store target pixel (older)
                $run++
                $i++
            }

            # Calculate x/y
            $x = $start % $width
            $y = [math]::Floor($start / $width)

            # Write group address: [x][y+64]
            $groupAddresses.Add([byte]$x)
            $groupAddresses.Add([byte]($y + 64))

            # Write instruction stream
            $writeInstructions.AddRange([byte[]](0xED, 0xA3, 0xED, 0xA3, 0xD9))

            for ($j = 0; $j -lt $run; $j++) {
                $writeInstructions.Add(0xED)
                $writeInstructions.Add(0xA3)
            }

            # Check if more changes follow
            $nextChangeExists = $false
            for ($check = $i; $check -lt $totalPixels; $check++) {
                if ($data1[$check + $headerSize] -ne $data2[$check + $headerSize]) {
                    $nextChangeExists = $true
                    break
                }
            }

            if ($nextChangeExists) {
                $writeInstructions.Add(0xD9) # More groups coming
            } else {
                $writeInstructions.Add(0xC9) # Last group, end with C9
            }
        } else {
            $i++
        }
    }

    # Write outputs
    [System.IO.File]::WriteAllBytes($changedPixelsPath, $changedBytes.ToArray())
    [System.IO.File]::WriteAllBytes($addressesPath, $groupAddresses.ToArray())
    [System.IO.File]::WriteAllBytes($outputInstructionsPath, $writeInstructions.ToArray())

    Write-Host "Generated:"
    Write-Host "- $changedPixelsPath"
    Write-Host "- $addressesPath"
    Write-Host "- $outputInstructionsPath"
}
