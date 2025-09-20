# Step 1: Split .sc5 files that don't contain "Part"
Get-ChildItem -Path . -Filter *.sc5 | Where-Object {
    $_.BaseName -notmatch "Part"
} | ForEach-Object {
    $filePath = $_.FullName
    $fileName = $_.BaseName
    $dir = $_.DirectoryName

    # Read the entire file as bytes
    $bytes = [System.IO.File]::ReadAllBytes($filePath)

    # Skip the first 7 bytes (header)
    $startOffset = 7

    # Safety check for Part1
    if ($bytes.Length -le $startOffset) {
        Write-Host "Skipping $fileName.sc5 (too small)"
        return
    }

    # Create Part1
    $part1Bytes = $bytes[$startOffset..([Math]::Min($startOffset + 16384 - 1, $bytes.Length - 1))]
    $part1Path = Join-Path $dir "$fileName`Part1.sc5"
    [System.IO.File]::WriteAllBytes($part1Path, $part1Bytes)

    # Create Part2
    $part2Offset = $startOffset + 0x4000
    if ($bytes.Length -gt $part2Offset) {
        $part2Bytes = $bytes[$part2Offset..([Math]::Min($part2Offset + 10752 - 1, $bytes.Length - 1))]
        $part2Path = Join-Path $dir "$fileName`Part2.sc5"
        [System.IO.File]::WriteAllBytes($part2Path, $part2Bytes)
    }

    Write-Host "Processed $fileName.sc5 -> Part1 & Part2 created"
}

# Step 2: Remove all-FF 128-byte blocks from Part1 and Part2 files
Get-ChildItem -Path . -Filter *.sc5 | Where-Object {
    $_.BaseName -match "Part"
} | ForEach-Object {
    $filePath = $_.FullName
    $bytes = [System.IO.File]::ReadAllBytes($filePath)

    $blockSize = 128
    $newBytes = New-Object System.Collections.Generic.List[byte]

    for ($i = 0; $i -lt $bytes.Length; $i += $blockSize) {
        $end = [Math]::Min($i + $blockSize, $bytes.Length)
        $block = [byte[]]$bytes[$i..($end - 1)]   # cast to byte[]

        # check if the block is entirely 0xFF
        if (($block | Select-Object -Unique).Count -eq 1 -and $block[0] -eq 0xFF) {
            continue
        }

        $newBytes.AddRange($block)
    }

    if ($newBytes.Count -lt $bytes.Length) {
        [System.IO.File]::WriteAllBytes($filePath, $newBytes.ToArray())
        Write-Host "Removed all-FF blocks from $($_.Name) -> $($newBytes.Count) bytes remain"
    } else {
        Write-Host "$($_.Name) unchanged"
    }
}

# Step 3: Pack all .sc5 files that have "Part" in their name
Get-ChildItem -Path . -Filter *.sc5 | Where-Object {
    $_.BaseName -match "Part"
} | ForEach-Object {
    Write-Host "Packing $($_.Name)..."
    & ".\pack.exe" $_.Name
}
