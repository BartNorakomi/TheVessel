# Load System.Drawing for image handling
Add-Type -AssemblyName System.Drawing

# Paths
$inputPath = "tilemap.bmp"
$outputPath = "tilemap.bin"

# Load bitmap
$bmp = [System.Drawing.Bitmap]::FromFile($inputPath)

# Prepare byte array
$bytes = @()

# Loop over rows (top to bottom)
for ($y = 0; $y -lt $bmp.Height; $y++) {
    # Each pixel is one byte
    for ($x = 0; $x -lt $bmp.Width; $x++) {
        $pixel = $bmp.GetPixel($x, $y)
        $isWhite = ($pixel.R -eq 255 -and $pixel.G -eq 255 -and $pixel.B -eq 255)
        $byte = if ($isWhite) { 1 } else { 0 }
        $bytes += $byte
    }
}

# Write the result to file
[System.IO.File]::WriteAllBytes($outputPath, [byte[]]$bytes)

# Output for confirmation
$byteCount = $bytes.Count
Write-Host "Done. Output size: $byteCount bytes (expected: $($bmp.Height * $bmp.Width))"