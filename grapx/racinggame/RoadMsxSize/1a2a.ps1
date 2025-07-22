# File paths
$image1Path = "1a.SR5"
$image2Path = "2a.SR5"

$changedPixelsPath = "changedpixels1a2a.bin"
$addressesPath = "addresses1a2a.bin"
$outputInstructionsPath = "writeinstructions1a2a.bin"

# Image properties
$headerSize = 7
$width = 256
$height = 106
$totalPixels = $width * $height

# Read files
$data1 = [System.IO.File]::ReadAllBytes($image1Path)
$data2 = [System.IO.File]::ReadAllBytes($image2Path)

# Validate file sizes
if ($data1.Length -ne $data2.Length -or ($data1.Length - $headerSize) -ne $totalPixels) {
    Write-Error "One of the image files is not the correct size after skipping the header."
    exit
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
            $changedBytes.Add($data2[$i + $headerSize])
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

# Write changed pixels file
[System.IO.File]::WriteAllBytes($changedPixelsPath, $changedBytes.ToArray())

# Write addresses file
[System.IO.File]::WriteAllBytes($addressesPath, $groupAddresses.ToArray())

# Write instruction stream output
[System.IO.File]::WriteAllBytes($outputInstructionsPath, $writeInstructions.ToArray())

Write-Host "Done. Generated:"
Write-Host "- Changed pixels: $changedPixelsPath"
Write-Host "- Addresses: $addressesPath"
Write-Host "- Instructions: $outputInstructionsPath"
