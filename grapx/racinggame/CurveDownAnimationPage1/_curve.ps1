Add-Type -AssemblyName System.Drawing

# Image resolution
$width = 256
$height = 84
$extraHeight = 128
$totalHeight = $height + $extraHeight

# Color palette indices
$COLOR_GRASS = 4    # Grass
$COLOR_ROAD  = 11   # Road
$COLOR_EDGE  = 1    # Road Edges
$COLOR_BLUE  = 6    # Sky

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
    [System.Drawing.Color]::FromArgb(128, 128, 128)   # 11 (Road - Grey)
)

$steps = 60
for ($step = 0; $step -lt $steps; $step++) {
    $hillHeight = 30 * ($step / ($steps - 1))

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
        $easeT = [math]::Pow($t, 2)
        $yOffset[$line] = [math]::Round($hillHeight * $easeT)
        $centerX[$line] = $width / 2
        $roadWidth[$line] = $roadWidthBottom + ($roadWidthTop - $roadWidthBottom) * $t
    }

    $minY = $totalHeight - 1 - ($height - 1) + $yOffset[$height - 1]
    if ($minY -lt 0) { $minY = 0 }

    # Fill grass
    for ($y = 0; $y -lt $totalHeight; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $pixels[$y * $width + $x] = $COLOR_GRASS
        }
        $filled[$y] = $true
    }

    # Fill top blue sky bar
    for ($y = 0; $y -lt $minY; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $pixels[$y * $width + $x] = $COLOR_BLUE
        }
        $filled[$y] = $true
    }

    $drawnLines = @()
    $drawnParams = @()

    for ($line = 0; $line -lt $height; $line++) {
        $y = $totalHeight - 1 - $line + $yOffset[$line]
        if ($y -lt 0 -or $y -ge $totalHeight) { continue }

        $filled[$y] = $true
        $drawnLines += $y

        $cx = [math]::Floor($centerX[$line])
        $rw = [math]::Floor($roadWidth[$line])
        $leftEdge = $cx - [math]::Floor($rw / 2)
        $rightEdge = $cx + [math]::Floor($rw / 2)

        $drawnParams += @{ Y = $y; CenterX = $cx; RoadWidth = $rw; LineIdx = $line }

        for ($x = $leftEdge; $x -le $rightEdge; $x++) {
            if ($x -ge 0 -and $x -lt $width) {
                $pixels[$y * $width + $x] = $COLOR_ROAD
            }
        }

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

    $drawnLines = $drawnLines | Sort-Object
    for ($i = 0; $i -lt ($drawnLines.Count - 1); $i++) {
        $startY = $drawnLines[$i]
        $endY = $drawnLines[$i + 1]
        $gap = $endY - $startY - 1
        if ($gap -le 0) { continue }

        $startParam = $drawnParams | Where-Object { $_.Y -eq $startY }
        $endParam = $drawnParams | Where-Object { $_.Y -eq $endY }

        for ($yFill = $startY + 1; $yFill -lt $endY; $yFill++) {
            $t = ($yFill - $startY) / ($endY - $startY)

            $cx = [math]::Floor($startParam.CenterX + ($endParam.CenterX - $startParam.CenterX) * $t)
            $rw = [math]::Floor($startParam.RoadWidth + ($endParam.RoadWidth - $startParam.RoadWidth) * $t)
            $leftEdge = $cx - [math]::Floor($rw / 2)
            $rightEdge = $cx + [math]::Floor($rw / 2)

            for ($x = $leftEdge; $x -le $rightEdge; $x++) {
                if ($x -ge 0 -and $x -lt $width) {
                    $pixels[$yFill * $width + $x] = $COLOR_ROAD
                }
            }

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