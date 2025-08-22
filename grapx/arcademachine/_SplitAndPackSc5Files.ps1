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

# Step 2: Pack all .sc5 files that have "Part" in their name
Get-ChildItem -Path . -Filter *.sc5 | Where-Object {
    $_.BaseName -match "Part"
} | ForEach-Object {
    Write-Host "Packing $($_.Name)..."
    & ".\pack.exe" $_.Name
}
