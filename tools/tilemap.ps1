# Load System.Drawing for image handling
Add-Type -AssemblyName System.Drawing

# Paths
$inputPath = "tilemap.bmp"
$outputPath = "tilemap.bin"

# Load bitmap
$bmp = [System.Drawing.Bitmap]::FromFile($inputPath)

# Check width is divisible by 8
if ($bmp.Width % 8 -ne 0) {
    Write-Error "Image width must be a multiple of 8."
    exit
}

# Prepare byte array
$bytes = @()

# Loop over rows (top to bottom)
for ($y = 0; $y -lt $bmp.Height; $y++) {
    # Each row gives us (Width / 8) bytes
    for ($byteIndex = 0; $byteIndex -lt ($bmp.Width / 8); $byteIndex++) {
        $byte = 0
        for ($i = 0; $i -lt 8; $i++) {
            $x = ($byteIndex * 8) + $i
            $pixel = $bmp.GetPixel($x, $y)
            $isWhite = ($pixel.R -eq 255 -and $pixel.G -eq 255 -and $pixel.B -eq 255)
            if ($isWhite) {
                $bitPos = 7 - $i
                $byte = $byte -bor (1 -shl $bitPos)
            }
        }
        $bytes += $byte
    }
}

# Write the result to file
[System.IO.File]::WriteAllBytes($outputPath, [byte[]]$bytes)

# Output for confirmation
$byteCount = $bytes.Count
Write-Host "Done. Output size: $byteCount bytes (expected: $($bmp.Height * $bmp.Width / 8))"
