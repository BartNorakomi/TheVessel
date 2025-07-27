Add-Type -AssemblyName System.Drawing

# Image resolution
$width = 256
$height = 84
$extraHeight = 128
$totalHeight = $height + $extraHeight

# Color palette indices
$COLOR_GRASS = 4    # Grass
$COLOR_ROAD  = 11   # Road
$COLOR_BLUE  = 6    # Sky
$COLOR_EDGE  = 1    # Road Edges

# Road dimensions
$roadWidthBottom = 250
$roadWidthTop = 20
$edgeLineWidthBottom = 10

# Define palette colors
$palette = @(
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 0 (Unused)
    [System.Drawing.Color]::FromArgb(255, 255, 0),    # 1 (Road Edges - Yellow)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 2 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 3 (Unused)
    [System.Drawing.Color]::FromArgb(30, 200, 30),    # 4 (Grass - Green)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 5 (Unused)
    [System.Drawing.Color]::FromArgb(100, 180, 255),  # 6 (Sky - Blue)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 7 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 8 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 9 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 10 (Unused)
    [System.Drawing.Color]::FromArgb(128, 128, 128),  # 11 (Road - Grey)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 12 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0),        # 13 (Unused)
    [System.Drawing.Color]::FromArgb(0, 0, 0)         # 14 (Unused)
)

function GenerateRoadPixels([int]$curveAmount) {
    $curveStartX = $width / 2
    $curveEndX = $curveStartX + $curveAmount

    # Full 8-bit pixel buffer before packing
    $pixels = New-Object 'Byte[]' ($width * $totalHeight)

    # Arrays for geometry
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
    }
    return $pixels
}

function SaveFrame([byte[]]$pixels, [int]$index) {
    # Convert to 4-bit packed data
    $packed = New-Object 'Byte[]' ($width * $totalHeight / 2)
    for ($i = 0; $i -lt $pixels.Length; $i += 2) {
        $left = $pixels[$i] -band 0x0F
        $right = if ($i + 1 -lt $pixels.Length) { $pixels[$i + 1] -band 0x0F } else { 0 }
        $packed[$i / 2] = ($left -shl 4) -bor $right
    }

    # Save raw file using index (no zero-padding)
    $rawFilename = "$index.sr5"
    [System.IO.File]::WriteAllBytes($rawFilename, $packed)
    Write-Host "Saved 4-bit raw: $rawFilename"

    # Save BMP output
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

# Generate full curved frame 1 (curveAmount = -2)
$pixelsCurve1 = GenerateRoadPixels -2

# Define vertical segments (Y ranges)
$segments = @(
    @{start=128; end=149},  # segment 1
    @{start=149; end=170},  # segment 2
    @{start=170; end=191},  # segment 3
    @{start=191; end=212}   # segment 4
)

# Save frames 1 to 4: cumulative reveal of segments of curved frame 1
for ($segIndex = 0; $segIndex -lt $segments.Count; $segIndex++) {
    # Start with straight pixels each time
    $pixelsOverlay = [byte[]]::new($pixelsStraight.Length)
    [Array]::Copy($pixelsStraight, $pixelsOverlay, $pixelsStraight.Length)

    # Overlay cumulative segments from 0 up to segIndex
    for ($i = 0; $i -le $segIndex; $i++) {
        $seg = $segments[$i]
        for ($y = $seg.start; $y -lt $seg.end; $y++) {
            if ($y -ge 0 -and $y -lt $totalHeight) {
                for ($x = 0; $x -lt $width; $x++) {
                    $offset = $y * $width + $x
                    $pixelsOverlay[$offset] = $pixelsCurve1[$offset]
                }
            }
        }
    }

    SaveFrame $pixelsOverlay $index
    $index++
}

# Generate remaining curved frames from curveAmount = -4 to -150 stepping by -2
for ($curveAmount = -4; $curveAmount -ge -150; $curveAmount -= 2) {
    $pixelsCurve = GenerateRoadPixels $curveAmount
    SaveFrame $pixelsCurve $index
    $index++
}