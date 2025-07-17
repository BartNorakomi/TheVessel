# Hardcoded values — change these as needed
$input = "map03.tmx"
$output = "map03.map"

# Load the TMX file
if (-not (Test-Path $input)) {
    Write-Error "Input file '$input' not found."
    exit 1
}

[xml]$tmx = Get-Content -Path $input

$width = [int]$tmx.map.width
$height = [int]$tmx.map.height
$mapSize = $width * $height
$rawData = [byte[]]::new($mapSize)

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
    $gid = [int]$tileValues[$i]
    $value = $gid - 1
    if ($value -lt 0) { $value = 0 }
    $rawData[$i] = [byte]($value -band 0xFF)
}

# Write raw byte map
Set-Content -Path $output -Value $rawData -Encoding Byte

Write-Host "Done. Wrote $mapSize bytes to '$output'"
