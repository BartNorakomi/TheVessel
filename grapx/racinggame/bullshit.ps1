Add-Type -AssemblyName System.Drawing

# Image resolution
$width = 256
$height = 196
$extraHeight = 15  # height of white rectangle
$totalHeight = $height + $extraHeight

# Road parameters
$roadWidthBottom = 250
$roadWidthTop = 20
$edgeLineWidthBottom = 10
$centerLineWidth = 12
$centerStripeWidthBottom = [math]::Floor($centerLineWidth / 2)
$centerStripeWidthTop = 1

# Curve parameters
$curveStartX = $width / 2
$curveEndX = $curveStartX - 100  # adjust curvature here
$linesCount = $height

# Create full bitmap and graphics
$bmp = New-Object System.Drawing.Bitmap $width, $totalHeight
$g = [System.Drawing.Graphics]::FromImage($bmp)

# Fill top white bar
$g.FillRectangle([System.Drawing.Brushes]::White, 0, 0, $width, $extraHeight)

# Fill background below the white rectangle (your road area)
$g.FillRectangle([System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(30,200,30)), 0, $extraHeight, $width, $height)

# Brushes
$roadBrush = [System.Drawing.Brushes]::DarkGray
$edgeBrush = [System.Drawing.Brushes]::LightGray
$centerLineBrush = [System.Drawing.Brushes]::White

# Arrays for curvature
$centerX = New-Object 'float[]' $height
$roadWidth = New-Object 'float[]' $height

for ($line = 0; $line -lt $height; $line++) {
    $t = $line / ($height - 1)
    $easeT = [math]::Pow($t, 6)
    $centerX[$line] = $curveStartX + ($curveEndX - $curveStartX) * $easeT
    $roadWidth[$line] = $roadWidthBottom + ($roadWidthTop - $roadWidthBottom) * $t
}

for ($line = 0; $line -lt $height; $line++) {
    $y = $totalHeight - 1 - $line  # Flip Y and offset by white bar
    $cx = [math]::Floor($centerX[$line])
    $rw = [math]::Floor($roadWidth[$line])
    $leftEdge = $cx - [math]::Floor($rw / 2)
    $rightEdge = $cx + [math]::Floor($rw / 2)

    $g.FillRectangle($roadBrush, $leftEdge, $y, $rw, 1)

    $edgeLineWidth = $edgeLineWidthBottom + (2 - $edgeLineWidthBottom) * $line / ($height - 1)
    if ($edgeLineWidth -lt 2) { $edgeLineWidth = 2 }

    $g.FillRectangle($edgeBrush, $leftEdge, $y, [math]::Floor($edgeLineWidth), 1)
    $g.FillRectangle($edgeBrush, $rightEdge - [math]::Floor($edgeLineWidth) + 1, $y, [math]::Floor($edgeLineWidth), 1)

    $centerStripeWidth = $centerStripeWidthBottom + ($centerStripeWidthTop - $centerStripeWidthBottom) * $line / ($height - 1)
    if ($centerStripeWidth -lt 1) { $centerStripeWidth = 1 }
    $centerStripeWidth = [math]::Floor($centerStripeWidth)

    $centerStripeOffset = [math]::Floor($rw / 4)
    $centerStripeLeftX = $cx - $centerStripeOffset - [math]::Floor($centerStripeWidth / 2)
    $centerStripeRightX = $cx + $centerStripeOffset - [math]::Floor($centerStripeWidth / 2)

    $g.FillRectangle($centerLineBrush, $centerStripeLeftX, $y, $centerStripeWidth, 1)
    $g.FillRectangle($centerLineBrush, $centerStripeRightX, $y, $centerStripeWidth, 1)
}

# Save the bitmap
$outputPath = ".\curved_road_with_header.bmp"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Bmp)
Write-Host "Image saved to: $outputPath"

# Dispose
$g.Dispose()
$bmp.Dispose()
