$outputFile = "CurveDownDataFiles.asm"
$startFrame = 0
$endFrame = 59
$RomBlockSize = 16KB
$romBaseAddress = 0x8000

# Helper to get file size safely
function Get-FileSize($path) {
    if (Test-Path $path) {
        return (Get-Item $path).Length
    } else {
        return 0
    }
}

# Clear or create output file
Set-Content -Path $outputFile -Value "" -Encoding ascii

$blockNum = 1
$script:currentBlockSize = 0

# Write new block header function
function Write-BlockHeader($blockNum) {
    @"
CurveDownBlock${blockNum}:  			equ   (`$-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

"@ | Add-Content -Path $outputFile -Encoding ascii

    $script:currentBlockSize = 0
}

# Write block footer
function Write-BlockFooter() {
    @"
	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

"@ | Add-Content -Path $outputFile -Encoding ascii
}

# Start first block
Write-BlockHeader $blockNum

for ($i = $startFrame; $i -lt $endFrame; $i++) {
    $j = $i + 1
    foreach ($page in 0, 1) {
        foreach ($region in "TOP", "BOTTOM") {
            # Build file paths
            $changedPixelsFile = ".\CurveDownAnimationPage${page}\${region}changedpixelsfrom${i}to${j}.bin"
            $addressesFile     = ".\CurveDownAnimationPage${page}\${region}addressesfrom${i}to${j}.bin"
            $writeInstrFile    = ".\CurveDownAnimationPage${page}\${region}writeinstructionsfrom${i}to${j}.bin"

            # Get file sizes
            $sizeChanged = Get-FileSize $changedPixelsFile
            $sizeAddr    = Get-FileSize $addressesFile
            $sizeInstr   = Get-FileSize $writeInstrFile

            $realDataSize = $sizeChanged + $sizeAddr + $sizeInstr

            # Check if this fits in current ROM block
            if (($script:currentBlockSize + $realDataSize) -gt $RomBlockSize) {
                Write-BlockFooter
                $blockNum++
                Write-BlockHeader $blockNum
            }

            # Labels and data block
            $blockLabel = "BlockCurveDownPage${page}${region}from${i}to${j}"
            $prefix     = "CurveDownPage${page}${region}ChangedPixelsfrom${i}to${j}"
            $addr       = "CurveDownPage${page}${region}Addressesfrom${i}to${j}"
            $instr      = "CurveDownPage${page}${region}WriteInstructionsfrom${i}to${j}"

            Add-Content -Path $outputFile -Encoding ascii -Value "`t${blockLabel}:	equ CurveDownBlock${blockNum}"
            Add-Content -Path $outputFile -Encoding ascii -Value "`t${prefix}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "`tincbin ""..\grapx\RacingGame\CurveDownAnimationPage${page}\${region}changedpixelsfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value "`t${addr}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "`tincbin ""..\grapx\RacingGame\CurveDownAnimationPage${page}\${region}addressesfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value "`t${instr}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "`tincbin ""..\grapx\RacingGame\CurveDownAnimationPage${page}\${region}writeinstructionsfrom${i}to${j}.bin"""

            # ✅ Correct: Update ROM usage before computing address comment
            $script:currentBlockSize += $realDataSize

            # Calculate ROM address after this entry
            $romAddress = $romBaseAddress + $script:currentBlockSize
            $romAddressHex = '{0:X4}' -f $romAddress
            Add-Content -Path $outputFile -Encoding ascii -Value "`n;$$${romAddressHex}`n"
        }
    }
}

# Final block close
Write-BlockFooter
