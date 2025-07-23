# Image properties
$headerSize = 0
$width = 256
$height = 106
$totalPixels = $width * $height

for ($index = 0; $index -lt 1; $index++) {
    $next = $index + 1

    $image1Path = "{0}a.SR5" -f $index
    $image2Path = "{0}a.SR5" -f $next

    $data1 = [System.IO.File]::ReadAllBytes($image1Path)
    $data2 = [System.IO.File]::ReadAllBytes($image2Path)

    if ($data1.Length -ne $data2.Length -or ($data1.Length - $headerSize) -ne $totalPixels) {
        Write-Warning "Skipping $image1Path → $image2Path due to invalid file size."
        continue
    }

    foreach ($region in @("TOP", "BOTTOM")) {
        $changedBytes = New-Object System.Collections.Generic.List[byte]
        $groupAddresses = New-Object System.Collections.Generic.List[byte]
        $writeInstructions = New-Object System.Collections.Generic.List[byte]

        if ($region -eq "TOP") {
            $yStart = 0
            $yEnd = 63
            $yOffset = 0
        } else {
            $yStart = 64
            $yEnd = 105
            $yOffset = -64
        }

        $i = 0
        while ($i -lt $totalPixels) {
            $y = [math]::Floor($i / $width)

            if ($y -lt $yStart -or $y -gt $yEnd) {
                $i++
                continue
            }

            $byte1 = $data1[$i + $headerSize]
            $byte2 = $data2[$i + $headerSize]

            if ($byte1 -ne $byte2) {
                $start = $i
                $run = 0

                while ($i -lt $totalPixels) {
                    $curY = [math]::Floor($i / $width)
                    if ($curY -lt $yStart -or $curY -gt $yEnd) {
                        break
                    }

                    if ($data1[$i + $headerSize] -ne $data2[$i + $headerSize]) {
                        $changedBytes.Add($data2[$i + $headerSize])
                        $run++
                        $i++
                    } else {
                        break
                    }
                }

                $x = $start % $width
                $adjustedY = [math]::Floor($start / $width) + $yOffset

                $groupAddresses.Add([byte]$x)
                $groupAddresses.Add([byte]($adjustedY + 64))

                $writeInstructions.AddRange([byte[]](0xED, 0xA3, 0xED, 0xA3, 0xD9))

                for ($j = 0; $j -lt $run; $j++) {
                    $writeInstructions.Add(0xED)
                    $writeInstructions.Add(0xA3)
                }

                $nextChangeExists = $false
                for ($check = $i; $check -lt $totalPixels; $check++) {
                    $checkY = [math]::Floor($check / $width)
                    if ($checkY -ge $yStart -and $checkY -le $yEnd) {
                        if ($data1[$check + $headerSize] -ne $data2[$check + $headerSize]) {
                            $nextChangeExists = $true
                            break
                        }
                    }
                }

                if ($nextChangeExists) {
                    $writeInstructions.Add(0xD9)
                } else {
                    $writeInstructions.Add(0xC9)
                }
            } else {
                $i++
            }
        }

        $changedPixelsPath = "${region}changedpixels${index}a${next}a.bin"
        $addressesPath = "${region}addresses${index}a${next}a.bin"
        $outputInstructionsPath = "${region}writeinstructions${index}a${next}a.bin"

        [System.IO.File]::WriteAllBytes($changedPixelsPath, $changedBytes.ToArray())
        [System.IO.File]::WriteAllBytes($addressesPath, $groupAddresses.ToArray())
        [System.IO.File]::WriteAllBytes($outputInstructionsPath, $writeInstructions.ToArray())

        Write-Host "Generated for ${region}:"
        Write-Host "- $changedPixelsPath"
        Write-Host "- $addressesPath"
        Write-Host "- $outputInstructionsPath"
    }
}
