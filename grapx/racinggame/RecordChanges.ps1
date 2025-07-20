# File paths
$file1 = "nightstriker2.SR5"
$file2 = "nightstriker2Changes.SR5"
$outputFile = "nightstriker2Diff.SR5"

# Image dimensions
$width = 256
$height = 106
$headerSize = 7
$totalPixels = $width * $height
$expectedSize = $headerSize + $totalPixels

# File size check
$size1 = (Get-Item $file1).Length
$size2 = (Get-Item $file2).Length

if ($size1 -lt $expectedSize -or $size2 -lt $expectedSize) {
    Write-Error "One of the files is too small. Expected $expectedSize bytes, got $size1 and $size2."
    exit 1
}

# Read image data (skip header)
$data1 = [System.IO.File]::ReadAllBytes($file1)[$headerSize..($expectedSize - 1)]
$data2 = [System.IO.File]::ReadAllBytes($file2)[$headerSize..($expectedSize - 1)]

# Open binary writer
$fs = [System.IO.File]::Open($outputFile, [System.IO.FileMode]::Create)
$bw = New-Object System.IO.BinaryWriter($fs)

# Compare and group consecutive changed pixels (across rows)
$i = 0
while ($i -lt $totalPixels) {
    if ($data1[$i] -ne $data2[$i]) {
        $start = $i
        $run = 1

        while (
            ($i + $run) -lt $totalPixels -and
            ($data1[$i + $run] -ne $data2[$i + $run]) -and
            ($run -lt 255)
        ) {
            $run++
        }

        # Calculate adjusted values
        $runEncoded = [byte]($run + 2)
        $x = [byte]($start % $width)
        $y = [byte](([math]::Floor($start / $width)) + 64)

        # Write group
        $bw.Write($runEncoded)
        $bw.Write($x)
        $bw.Write($y)

        for ($j = 0; $j -lt $run; $j++) {
            $bw.Write([byte]$data2[$start + $j])
        }

        $i += $run
    } else {
        $i++
    }
}

# End of file marker: 0x02
$bw.Write([byte]2)

# Done
$bw.Close()
$fs.Close()

Write-Host "✅ Diff file written with adjusted run/y values and end marker (0x02)."
