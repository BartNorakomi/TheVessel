# Output file name
$outputFile = "ForceMovePlayerAgainstCurvesTable2.asm"

# Write header
"ForceMovePlayerAgainstCurvesTable:" | Out-File $outputFile
"db " | Out-File $outputFile -Append

# Start values
$maxX = 148
$stepX = 4
$maxY = 255
$divisor = 1666

# Generate values
for ($x = 0; $x -le $maxX; $x += $stepX) {
    $line = @()
    for ($y = 0; $y -le $maxY; $y++) {
        $value = [math]::Floor(($x * $y) / $divisor)
        $line += "$value"
        # Output lines in chunks of 16 values per db line
        if ($line.Count -eq 16) {
            ("db " + ($line -join ", ")) | Out-File $outputFile -Append
            $line = @()
        }
    }
    # Write any remaining values in the last line
    if ($line.Count -gt 0) {
        ("db " + ($line -join ", ")) | Out-File $outputFile -Append
    }
}
