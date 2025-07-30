Add-Type -AssemblyName System.Drawing

$InputPath = "0.bmp"
$OutputPath = "0.asm"
$StartY = 128

# Load the image
$bmp = [System.Drawing.Bitmap]::FromFile($InputPath)

# Validate dimensions
if ($bmp.Width -ne 256 -or $bmp.Height -ne 212) {
    Write-Error "Image must be exactly 256x212 pixels."
    exit
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

            $outputLines += "dw $startX,$length"
            break # Only first run per line
        }

        $x++
    }
}

# Write to 0.asm
Set-Content -Path $OutputPath -Value $outputLines

Write-Host "Done. Output saved to $OutputPath"
