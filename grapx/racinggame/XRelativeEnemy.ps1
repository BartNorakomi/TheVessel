# GeneratePerspectiveXTable.ps1
# Generates PerspectiveXTable.asm with LINEAR x-coordinates for enemyX = -100, centerX = 128

# Constants
$xStart = 30   # x at depth 0
$xEnd = 120    # x at depth 9370

# Function to calculate screen x-coordinate (linear)
function GetScreenX([float]$depth) {
    # Linear interpolation from xStart to xEnd
    $x = $xStart + ($xEnd - $xStart) * ($depth / 9370)
    
    # Floor to integer
    return [math]::Floor($x)
}

# Generate x-values for depths 9370 down to 0 in steps of 100
$xValues = @()
for ($depth = 9370; $depth -ge 0; $depth -= 100) {
    $x = GetScreenX $depth
    $xValues += $x
}

# Output to PerspectiveXTable.asm in reverse order
$output = $xValues | ForEach-Object { "db $_" }
$output = $output[-1..-($output.Length)]  # Reverse the array
$asmContent = $output -join "`n"

# Write to file
$filename = "PerspectiveXTable.asm"
$asmContent | Out-File -FilePath $filename -Encoding ASCII
Write-Host "Generated $filename"