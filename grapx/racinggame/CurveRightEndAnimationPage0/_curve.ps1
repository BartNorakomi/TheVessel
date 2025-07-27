Add-Type -AssemblyName System.Drawing

# Image resolution
$width = 256
$height = 84
$extraHeight = 128
$totalHeight = $height + $extraHeight

# Color palette indices
$COLOR_GRASS = 0    # Grass
$COLOR_ROAD  = 2    # Road
$COLOR_EDGE  = 14   # Road Edges
$COLOR_LINEINROAD = 1   # Lines in Road
$COLOR_BLUE  = 6    # Sky

# Road dimensions
$roadWidthBottom = 250
$roadWidthTop = 20
$edgeLineWidthBottom = 10
$centerLineWidth = 12
$centerStripeWidthBottom = [math]::Floor($centerLineWidth / 2)
$centerStripeWidthTop = 1

# Define palette colors
$palette = @(
    [System.Drawing.Color]::FromArgb(30, 200, 30),    # 0 (Grass - Green)
    [System.Drawing.Color]::FromArgb(255, 255, 0),    # 1 (Lines in Road - Yellow)
    [System.Drawing.Color]::FromArgb(128, 128, 128),  # 2 (Road - Grey)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 3 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 4 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 5 (Unused)
    [System.Drawing.Color]::FromArgb(100, 180, 255),  # 6 (Sky - Blue)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 7 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 8 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 9 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 10 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 11 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 12 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 13 (Unused)
    [System.Drawing.Color]::FromArgb(255, 165, 0)     # 14 (Road Edges - Orange)
)

function GenerateRoadPixels([int]$curveAmount) {
    $curveStartX = $width / 2
    $curveEndX = $curveStartX + $curveAmount

    $pixels = New-Object 'Byte[]' ($width * $totalHeight)

    $centerX = New-Object 'float[]' $height
    $roadWidth = New-Object 'float[]' $height

    for ($line = 0; $line -lt $height; $line++) {
        $t = $line / ($height - 1)
        $easeT = [math]::Pow($t, 3)
        $centerX[$line] = $curveStartX + ($curveEndX - $curveStartX) * $easeT
        $roadWidth[$line] = $roadWidthBottom + ($roadWidthTop - $roadWidthBottom) * $t
    }

    # Fill top blue bar
    for ($y = 0; $y -lt $extraHeight; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $pixels[$y * $width + $x] = $COLOR_BLUE
        }
    }

    # Draw road
    for ($line = 0; $line -lt $height; $line++) {
        $y = $totalHeight - 1 - $line
        $cx = [math]::Floor($centerX[$line])
        $rw = [math]::Floor($roadWidth[$line])
        $leftEdge = $cx - [math]::Floor($rw / 2)
        $rightEdge = $cx + [math]::Floor($rw / 2)

        # Grass background
        for ($x = 0; $x -lt $width; $x++) {
            $pixels[$y * $width + $x] = $COLOR_GRASS
        }

        # Road fill
        for ($x = $leftEdge; $x -le $rightEdge; $x++) {
            if ($x -ge 0 -and $x -lt $width) {
                $pixels[$y * $width + $x] = $COLOR_ROAD
            }
        }

        # Edges
        $edgeLineWidth = $edgeLineWidthBottom + (2 - $edgeLineWidthBottom) * $line / ($height - 1)
        if ($edgeLineWidth -lt 2) { $edgeLineWidth = 2 }
        $edgeLineWidth = [math]::Floor($edgeLineWidth)

        for ($x = $leftEdge; $x -lt ($leftEdge + $edgeLineWidth); $x++) {
            if ($x -ge 0 -and $x -lt $width) {
                $pixels[$y * $width + $x] = $COLOR_EDGE
            }
        }
        for ($x = ($rightEdge - $edgeLineWidth + 1); $x -le $rightEdge; $x++) {
            if ($x -ge 0 -and $x -lt $width) {
                $pixels[$y * $width + $x] = $COLOR_EDGE
            }
        }

        # Center stripes
        $centerStripeWidth = $centerStripeWidthBottom + ($centerStripeWidthTop - $centerStripeWidthBottom) * $line / ($height - 1)
        if ($centerStripeWidth -lt 1) { $centerStripeWidth = 1 }
        $centerStripeWidth = [math]::Floor($centerStripeWidth)

        $centerStripeOffset = [math]::Floor($rw / 4)
        $centerStripeLeftX = $cx - $centerStripeOffset - [math]::Floor($centerStripeWidth / 2)
        $centerStripeRightX = $cx + $centerStripeOffset - [math]::Floor($centerStripeWidth / 2)

        for ($x = $centerStripeLeftX; $x -lt ($centerStripeLeftX + $centerStripeWidth); $x++) {
            if ($x -ge 0 -and $x -lt $width) {
                $pixels[$y * $width + $x] = $COLOR_LINEINROAD
            }
        }
        for ($x = $centerStripeRightX; $x -lt ($centerStripeRightX + $centerStripeWidth); $x++) {
            if ($x -ge 0 -and $x -lt $width) {
                $pixels[$y * $width + $x] = $COLOR_LINEINROAD
            }
        }
    }
    return $pixels
}

function SaveFrame([byte[]]$pixels, [int]$index) {
    $packed = New-Object 'Byte[]' ($width * $totalHeight / 2)
    for ($i = 0; $i -lt $pixels.Length; $i += 2) {
        $left = $pixels[$i] -band 0x0F
        $right = if ($i + 1 -lt $pixels.Length) { $pixels[$i + 1] -band 0x0F } else { 0 }
        $packed[$i / 2] = ($left -shl 4) -bor $right
    }

    $rawFilename = "$index.sr5"
    [System.IO.File]::WriteAllBytes($rawFilename, $packed)
    Write-Host "Saved 4-bit raw: $rawFilename"

    $bmp = New-Object System.Drawing.Bitmap $width, $totalHeight
    for ($y = 0; $y -lt $totalHeight; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $colorIndex = $pixels[$y * $width + $x]
            $color = $palette[$colorIndex]
            $bmp.SetPixel($x, $y, $color)
        }
    }
    $bmpFilename = "$index.bmp"
    $bmp.Save($bmpFilename, [System.Drawing.Imaging.ImageFormat]::Bmp)
    Write-Host "Saved BMP: $bmpFilename"
    $bmp.Dispose()
}

# Generate and save straight road (curveAmount = 0)
$pixelsStraight = GenerateRoadPixels 0
$index = 0
SaveFrame $pixelsStraight $index
$index++

# Generate curved version with small curveAmount (2)
$pixelsCurve6 = GenerateRoadPixels 2

# Define vertical segments to reveal
$segments = @(
    @{start=128; end=130},
    @{start=130; end=133},
    @{start=133; end=140},
    @{start=140; end=174}
)

# Reveal the curve in 4 steps over the straight road
for ($segIndex = 0; $segIndex -lt $segments.Count; $segIndex++) {
    $pixelsOverlay = [byte[]]::new($pixelsStraight.Length)
    [Array]::Copy($pixelsStraight, $pixelsOverlay, $pixelsStraight.Length)

    # Apply all segments from 0 up to current
    for ($i = 0; $i -le $segIndex; $i++) {
        $seg = $segments[$i]
        for ($y = $seg.start; $y -lt $seg.end; $y++) {
            for ($x = 0; $x -lt $width; $x++) {
                $offset = $y * $width + $x
                $pixelsOverlay[$offset] = $pixelsCurve6[$offset]
            }
        }
    }

    SaveFrame $pixelsOverlay $index
    $index++
}

# Continue with full curved road frames from curveAmount = 4 to 150
for ($curveAmount = 4; $curveAmount -le 150; $curveAmount += 2) {
    $pixelsCurve = GenerateRoadPixels $curveAmount
    SaveFrame $pixelsCurve $index
    $index++
}