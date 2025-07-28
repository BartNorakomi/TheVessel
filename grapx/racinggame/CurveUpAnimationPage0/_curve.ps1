Add-Type -AssemblyName System.Drawing

# Image resolution
$width = 256
$height = 84
$extraHeight = 128
$totalHeight = $height + $extraHeight

# Color palette indices
$COLOR_GRASS = 0    # Grass
$COLOR_LINEINROAD = 1   # Lines in Road
$COLOR_ROAD  = 2    # Road
$COLOR_BLUE  = 6    # Sky
$COLOR_EDGE  = 14   # Road Edges

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

$steps = 60
for ($step = 0; $step -lt $steps; $step++) {
    # - 50 for going up, +50 for going down
    $hillHeight = -40 * ($step / ($steps - 1))  # From 0 to -20 in 10 steps
    #$hillHeight = 30 * ($step / ($steps - 1))  # From 0 to -20 in 10 steps

    # Pixel buffer and filled lines tracker
    $pixels = New-Object 'Byte[]' ($width * $totalHeight)
    $filled = New-Object 'bool[]' $totalHeight

    # Arrays for geometry
    $centerX = New-Object 'float[]' $height
    $roadWidth = New-Object 'float[]' $height
    $yOffset = New-Object 'int[]' $height

    # Calculate vertical offsets per road line
    for ($line = 0; $line -lt $height; $line++) {
        $t = $line / ($height - 1)
        $easeT = [math]::Pow($t, 2)  # easing
        $yOffset[$line] = [math]::Round($hillHeight * $easeT)
        $centerX[$line] = $width / 2
        $roadWidth[$line] = $roadWidthBottom + ($roadWidthTop - $roadWidthBottom) * $t
    }

    # Calculate min Y after offset (smallest shifted line)
    $minY = $totalHeight - 1 - ($height - 1) + $yOffset[$height - 1]
    if ($minY -lt 0) { $minY = 0 }

    # Fill the entire pixel buffer with grass by default (ground)
    for ($y = 0; $y -lt $totalHeight; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $pixels[$y * $width + $x] = $COLOR_GRASS
        }
        $filled[$y] = $true
    }

    # Fill the top blue bar dynamically from y=0 down to minY (exclusive)
    for ($y = 0; $y -lt $minY; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $pixels[$y * $width + $x] = $COLOR_BLUE
        }
        $filled[$y] = $true
    }

    # Keep track of which output lines we drew on
    $drawnLines = @()
    $drawnParams = @()  # Store parameters for each drawn line

    # Draw road lines shifted by vertical offset
    for ($line = 0; $line -lt $height; $line++) {
        $y = $totalHeight - 1 - $line + $yOffset[$line]
        if ($y -lt 0 -or $y -ge $totalHeight) { continue }

        $filled[$y] = $true
        $drawnLines += $y

        $cx = [math]::Floor($centerX[$line])
        $rw = [math]::Floor($roadWidth[$line])
        $leftEdge = $cx - [math]::Floor($rw / 2)
        $rightEdge = $cx + [math]::Floor($rw / 2)

        # Store parameters
        $drawnParams += @{ Y = $y; CenterX = $cx; RoadWidth = $rw; LineIdx = $line }

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

    # Fill gaps between drawn road lines with interpolated road fill
    $drawnLines = $drawnLines | Sort-Object
    for ($i = 0; $i -lt ($drawnLines.Count - 1); $i++) {
        $startY = $drawnLines[$i]
        $endY = $drawnLines[$i + 1]
        $gap = $endY - $startY - 1
        if ($gap -le 0) { continue }

        # Get parameters for start and end lines
        $startParam = $drawnParams | Where-Object { $_.Y -eq $startY }
        $endParam = $drawnParams | Where-Object { $_.Y -eq $endY }

        for ($yFill = $startY + 1; $yFill -lt $endY; $yFill++) {
            $t = ($yFill - $startY) / ($endY - $startY)

            # Interpolate center and road width
            $cx = [math]::Floor($startParam.CenterX + ($endParam.CenterX - $startParam.CenterX) * $t)
            $rw = [math]::Floor($startParam.RoadWidth + ($endParam.RoadWidth - $startParam.RoadWidth) * $t)
            $leftEdge = $cx - [math]::Floor($rw / 2)
            $rightEdge = $cx + [math]::Floor($rw / 2)

            # Road fill
            for ($x = $leftEdge; $x -le $rightEdge; $x++) {
                if ($x -ge 0 -and $x -lt $width) {
                    $pixels[$yFill * $width + $x] = $COLOR_ROAD
                }
            }

            # Edges
            $edgeLineWidth = $edgeLineWidthBottom + (2 - $edgeLineWidthBottom) * ($startParam.LineIdx + ($endParam.LineIdx - $startParam.LineIdx) * $t) / ($height - 1)
            if ($edgeLineWidth -lt 2) { $edgeLineWidth = 2 }
            $edgeLineWidth = [math]::Floor($edgeLineWidth)

            for ($x = $leftEdge; $x -lt ($leftEdge + $edgeLineWidth); $x++) {
                if ($x -ge 0 -and $x -lt $width) {
                    $pixels[$yFill * $width + $x] = $COLOR_EDGE
                }
            }
            for ($x = ($rightEdge - $edgeLineWidth + 1); $x -le $rightEdge; $x++) {
                if ($x -ge 0 -and $x -lt $width) {
                    $pixels[$yFill * $width + $x] = $COLOR_EDGE
                }
            }

            # Center stripes
            $centerStripeWidth = $centerStripeWidthBottom + ($centerStripeWidthTop - $centerStripeWidthBottom) * ($startParam.LineIdx + ($endParam.LineIdx - $startParam.LineIdx) * $t) / ($height - 1)
            if ($centerStripeWidth -lt 1) { $centerStripeWidth = 1 }
            $centerStripeWidth = [math]::Floor($centerStripeWidth)

            $centerStripeOffset = [math]::Floor($rw / 4)
            $centerStripeLeftX = $cx - $centerStripeOffset - [math]::Floor($centerStripeWidth / 2)
            $centerStripeRightX = $cx + $centerStripeOffset - [math]::Floor($centerStripeWidth / 2)

            for ($x = $centerStripeLeftX; $x -lt ($centerStripeLeftX + $centerStripeWidth); $x++) {
                if ($x -ge 0 -and $x -lt $width) {
                    $pixels[$yFill * $width + $x] = $COLOR_LINEINROAD
                }
            }
            for ($x = $centerStripeRightX; $x -lt ($centerStripeRightX + $centerStripeWidth); $x++) {
                if ($x -ge 0 -and $x -lt $width) {
                    $pixels[$yFill * $width + $x] = $COLOR_LINEINROAD
                }
            }
        }
    }

    # Save 4-bit packed SR5 file
    $packed = New-Object 'Byte[]' ($width * $totalHeight / 2)
    for ($i = 0; $i -lt $pixels.Length; $i += 2) {
        $left = $pixels[$i] -band 0x0F
        $right = if ($i + 1 -lt $pixels.Length) { $pixels[$i + 1] -band 0x0F } else { 0 }
        $packed[$i / 2] = ($left -shl 4) -bor $right
    }
    $sr5Filename = "$step.sr5"
    [System.IO.File]::WriteAllBytes($sr5Filename, $packed)
    Write-Host "Saved SR5: $sr5Filename"

    # Save preview BMP
    $bmp = New-Object System.Drawing.Bitmap $width, $totalHeight
    for ($y = 0; $y -lt $totalHeight; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $colorIndex = $pixels[$y * $width + $x]
            $color = $palette[$colorIndex]
            $bmp.SetPixel($x, $y, $color)
        }
    }
    $bmpFilename = "$step.bmp"
    $bmp.Save($bmpFilename, [System.Drawing.Imaging.ImageFormat]::Bmp)
    Write-Host "Saved BMP: $bmpFilename"
    $bmp.Dispose()
}