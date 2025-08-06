param (
    [string]$InputPath = "input.bmp",
    [string]$OutputPath = "output.png"
)

# Load required assemblies
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Drawing

function Load-BitmapImage {
    param ([string]$path)
    $img = New-Object System.Windows.Media.Imaging.BitmapImage
    $img.BeginInit()
    $img.UriSource = New-Object System.Uri($path, [System.UriKind]::Absolute)
    $img.CacheOption = [System.Windows.Media.Imaging.BitmapCacheOption]::OnLoad
    $img.EndInit()
    return $img
}

function Convert-ToDrawingBitmap {
    param ([System.Windows.Media.Imaging.BitmapSource]$bmpSource)
    $ms = New-Object System.IO.MemoryStream
    $encoder = New-Object System.Windows.Media.Imaging.BmpBitmapEncoder
    $encoder.Frames.Add([System.Windows.Media.Imaging.BitmapFrame]::Create($bmpSource))
    $encoder.Save($ms)
    $ms.Seek(0, 'Begin') | Out-Null
    return [System.Drawing.Bitmap]::FromStream($ms)
}

# Load BMP
try {
    $wicImg = Load-BitmapImage -path (Resolve-Path $InputPath)
    $bmp = Convert-ToDrawingBitmap -bmpSource $wicImg
} catch {
    Write-Host "❌ ERROR: Failed to open '$InputPath' — it may not be a readable image file."
    exit 1
}

# Configuration
$spriteSize = 16
$spritesPerRow = 15
$yellow = [System.Drawing.Color]::FromArgb(255, 255, 255, 0)

$width = $bmp.Width
$height = $bmp.Height
Write-Host "Image size: $width x $height"

# Initialize jagged bool array to track used pixels
$used = @()
for ($x = 0; $x -lt $width; $x++) {
    $used += ,@(for ($y = 0; $y -lt $height; $y++) { $false })
}

$sprites = @()
$nonAlignedX = @()
$maxVerticalRows = [Math]::Floor(($height - $spriteSize) / 16)

# Extract sprites
for ($row = 0; $row -le $maxVerticalRows; $row++) {
    $yBase = $row * 16
    for ($xBase = 0; $xBase -le $width - $spriteSize; $xBase += 1) {
        if ($used[$xBase][$yBase]) { continue }

        # Find first non-yellow pixel in 16x16 block
        $foundNonYellow = $false
        $offsetX = 0
        $offsetY = 0
        for ($by = 0; $by -lt $spriteSize; $by++) {
            for ($bx = 0; $bx -lt $spriteSize; $bx++) {
                $px = $bmp.GetPixel($xBase + $bx, $yBase + $by)
                if ($px.R -ne 255 -or $px.G -ne 255 -or $px.B -ne 0) {
                    $foundNonYellow = $true
                    $offsetX = $bx
                    $offsetY = $by
                    break
                }
            }
            if ($foundNonYellow) { break }
        }

        if (-not $foundNonYellow) { continue }

        # Calculate sprite coordinates
        $spriteX = $xBase + $offsetX
        $spriteY = $yBase + $offsetY

        # Check bounds
        if ($spriteX + $spriteSize - 1 -ge $width -or $spriteY + $spriteSize - 1 -ge $height) {
            continue
        }

        if ($used[$spriteX][$spriteY]) { continue }

        # Check if spriteX is not a multiple of 16
        if ($spriteX % 16 -ne 0) {
            $nonAlignedX += $spriteX
        }

        # Extract sprite
        $rect = [System.Drawing.Rectangle]::new($spriteX, $spriteY, $spriteSize, $spriteSize)
        $sprite = $bmp.Clone($rect, $bmp.PixelFormat)
        $sprites += $sprite

        # Mark pixels as used
        for ($by = 0; $by -lt $spriteSize; $by++) {
            for ($bx = 0; $bx -lt $spriteSize; $bx++) {
                $used[$spriteX + $bx][$spriteY + $by] = $true
            }
        }
    }
}

# Write non-aligned x-coordinates to a text file in db format
$nonAlignedFile = [System.IO.Path]::Combine([System.IO.Path]::GetDirectoryName($OutputPath), "non_aligned_x.txt")
if ($nonAlignedX.Count -gt 0) {
    $dbLine = "db " + ($nonAlignedX -join ",")
    $dbLine | Out-File -FilePath $nonAlignedFile -Encoding UTF8
    Write-Host "📝 Saved non-aligned x-coordinates to: $nonAlignedFile"
} else {
    "; No non-aligned sprites found" | Out-File -FilePath $nonAlignedFile -Encoding UTF8
    Write-Host "📝 No non-aligned sprites found. Saved to: $nonAlignedFile"
}

# Create output image
$outputCols = [Math]::Min($sprites.Count, $spritesPerRow)
$outputRows = [Math]::Ceiling($sprites.Count / $spritesPerRow)
$outputWidth = $spritesPerRow * $spriteSize
$outputHeight = $outputRows * $spriteSize

$outputBmp = New-Object System.Drawing.Bitmap $outputWidth, $outputHeight
$graphics = [System.Drawing.Graphics]::FromImage($outputBmp)
$graphics.Clear([System.Drawing.Color]::Black)

# Draw sprites
for ($i = 0; $i -lt $sprites.Count; $i++) {
    $sprite = $sprites[$i]
    $dx = ($i % $spritesPerRow) * $spriteSize
    $dy = [Math]::Floor($i / $spritesPerRow) * $spriteSize
    $graphics.DrawImage($sprite, $dx, $dy, $spriteSize, $spriteSize)
    $sprite.Dispose()
}

# Save output
$outputBmp.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
$bmpPath = [System.IO.Path]::ChangeExtension($OutputPath, ".bmp")
$outputBmp.Save($bmpPath, [System.Drawing.Imaging.ImageFormat]::Bmp)

# Cleanup
$graphics.Dispose()
$outputBmp.Dispose()
$bmp.Dispose()

Write-Host "✅ Found $($sprites.Count) sprites and saved:"
Write-Host "   PNG: $OutputPath"
Write-Host "   BMP: $bmpPath"