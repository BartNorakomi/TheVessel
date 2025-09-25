# Hardcoded values — change as needed
$input  = "map01.tmx"
$output = "map01.map"
$packer = ".\pack.exe"   # pack.exe must be in the same folder as this script

# Load the TMX file
if (-not (Test-Path $input)) {
    Write-Error "Input file '$input' not found."
    exit 1
}

[xml]$tmx = Get-Content -Path $input

$width    = [int]$tmx.map.width
$height   = [int]$tmx.map.height
$mapSize  = $width * $height
$rawData  = [byte[]]::new($mapSize)

Write-Host "Converting '$input' ($width x $height) → '$output'"

# Use first visible tile layer
$layer = $tmx.map.layer | Where-Object { $_.visible -ne "0" } | Select-Object -First 1

if (-not $layer) {
    Write-Error "No visible layers found in '$input'"
    exit 1
}

$tileValues = $layer.data.InnerText -replace "\s", "" -split ","

if ($tileValues.Length -ne $mapSize) {
    Write-Error "Tile count mismatch: expected $mapSize, got $($tileValues.Length)"
    exit 1
}

# Convert tile GIDs to bytes
for ($i = 0; $i -lt $mapSize; $i++) {
    $gid   = [int]$tileValues[$i]
    $value = $gid - 1
    if ($value -lt 0) { $value = 0 }
    $rawData[$i] = [byte]($value -band 0xFF)
}

# Write full map file (no filtering of 0x14)
Set-Content -Path $output -Value $rawData -Encoding Byte

Write-Host "Done. Wrote $($rawData.Length) bytes to '$output'"

# --- Run pack.exe on the output file ---
if (-not (Test-Path $packer)) {
    Write-Error "Packer '$packer' not found in current folder."
    exit 1
}

Write-Host "Packing '$output' with '$packer'..."
& $packer $output
if ($LASTEXITCODE -ne 0) {
    Write-Error "Packing failed with exit code $LASTEXITCODE"
    exit 1
}

Write-Host "Packing complete."
