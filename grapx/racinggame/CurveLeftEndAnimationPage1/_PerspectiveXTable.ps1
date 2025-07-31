Add-Type -AssemblyName System.Drawing

$StartY = 88

for ($i = 0; $i -le 78; $i++) {
    $InputPath = "$i.bmp"
    $OutputPath = "$i.asm"

    if (-not (Test-Path $InputPath)) {
        Write-Warning "File not found: ${InputPath}"
        continue
    }

    # Load the image
    $bmp = [System.Drawing.Bitmap]::FromFile($InputPath)

    # Validate dimensions
    if ($bmp.Width -ne 256 -or $bmp.Height -ne 212) {
        Write-Warning "Skipping ${InputPath}: Image must be exactly 256x212 pixels."
        $bmp.Dispose()
        continue
    }

    $outputLines = @()

    for ($y = $StartY; $y -lt $bmp.Height; $y++) {
        $x = 0
        $found = $false

        while ($x -lt $bmp.Width) {
            $pixel = $bmp.GetPixel($x, $y)

            if (-not $found -and $pixel.R -eq 128 -and $pixel.G -eq 128 -and $pixel.B -eq 128) {
                $startX = $x
                $length = 0
                $found = $true

                while ($x -lt $bmp.Width) {
                    $pixel = $bmp.GetPixel($x, $y)
                    if ($pixel.R -eq 128 -and $pixel.G -eq 128 -and $pixel.B -eq 128) {
                        $length++
                        $x++
                    } else {
                        break
                    }
                }

                $outputLines += "db $startX,$length"
                break
            }

            $x++
        }

        if (-not $found) {
            $outputLines += "db 0,0"
        }
    }

    $bmp.Dispose()
    Set-Content -Path $OutputPath -Value $outputLines
    Write-Host "Processed ${InputPath} -> ${OutputPath}"
}

Write-Host "All done."
