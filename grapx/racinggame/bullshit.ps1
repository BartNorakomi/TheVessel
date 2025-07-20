Add-Type -AssemblyName System.Drawing

# Define paths
$imagePath = "TrackAnalyze.bmp"
$outputPath = "list.txt"

# Check if the image exists
if (-not (Test-Path $imagePath)) {
    Write-Error "File not found: $imagePath"
    exit
}

# Load the bitmap
$bitmap = [System.Drawing.Bitmap]::FromFile($imagePath)
$width = $bitmap.Width
$height = $bitmap.Height

# Define target colors and a mapping to labels
$colorMap = @{
    "105105105" = "P0"
    "107107107" = "P1"
}
$targetColors = $colorMap.Keys

# Initialize output lists
$adjustedYList = @()
$labelList = @()
$previousColorKey = $null

# Scan each horizontal line
for ($y = 0; $y -lt $height; $y++) {
    for ($x = 0; $x -lt $width; $x++) {
        $pixel = $bitmap.GetPixel($x, $y)
        $colorKey = "$($pixel.R)$($pixel.G)$($pixel.B)"

        if ($targetColors -contains $colorKey) {
            # Always add the label for this color (P0 or P1)
            $labelList += "$($colorMap[$colorKey]),"

            # Only add Y if color is different from previous
            if ($colorKey -ne $previousColorKey) {
                $adjustedY = $y - 389
                $adjustedYList += "$adjustedY-2,"
                $previousColorKey = $colorKey
            }

            break  # Next line
        }
    }
}

# Join output lines
$line1 = $adjustedYList -join ' '
$line2 = $labelList -join ' '

# Write to file
@($line1, $line2) | Set-Content -Path $outputPath -Encoding ASCII

Write-Host "Done. Output written to $outputPath"
