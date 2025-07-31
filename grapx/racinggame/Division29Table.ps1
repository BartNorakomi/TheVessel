# Output file name
$outputFile = "Division29Table.asm"

# Range and divisor
$maxValue = 9370
$divisor = 29

# Generate the list of integer divisions for even numbers only
$results = for ($i = 0; $i -le $maxValue; $i += 2) {
    [math]::Floor($i / $divisor)
}

# Join the results with commas
$output = $results -join ","

# Write to file
Set-Content -Path $outputFile -Value $output

Write-Host "File 'Division29Table.asm' created with integer divisions of even numbers from 0 to $maxValue by $divisor."
