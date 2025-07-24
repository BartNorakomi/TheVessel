$outputFile = "CurveLeftEndDataFiles.asm"
$startFrame = 1
$endFrame = 75
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
CurveLeftEndBlock${blockNum}:  			equ   (`$-RomStartAddress) and (romsize-1) / RomBlockSize
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

for ($i = $startFrame; $i -le $endFrame; $i++) {
    $j = $i - 1
    foreach ($page in 0, 1) {
        foreach ($region in "TOP", "BOTTOM") {
            # Build file paths
            $changedPixelsFile = ".\CurveLeftEndAnimationPage${page}\${region}changedpixelsfrom${i}to${j}.bin"
            $addressesFile     = ".\CurveLeftEndAnimationPage${page}\${region}addressesfrom${i}to${j}.bin"
            $writeInstrFile    = ".\CurveLeftEndAnimationPage${page}\${region}writeinstructionsfrom${i}to${j}.bin"

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
            $blockLabel = "BlockCurveLeftEndPage${page}${region}from${i}to${j}"
            $prefix     = "CurveLeftEndPage${page}${region}ChangedPixelsfrom${i}to${j}"
            $addr       = "CurveLeftEndPage${page}${region}Addressesfrom${i}to${j}"
            $instr      = "CurveLeftEndPage${page}${region}WriteInstructionsfrom${i}to${j}"

            Add-Content -Path $outputFile -Encoding ascii -Value "`t${blockLabel}:	equ CurveLeftEndBlock${blockNum}"
            Add-Content -Path $outputFile -Encoding ascii -Value "`t${prefix}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "`tincbin ""..\grapx\RacingGame\CurveLeftEndAnimationPage${page}\${region}changedpixelsfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value "`t${addr}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "`tincbin ""..\grapx\RacingGame\CurveLeftEndAnimationPage${page}\${region}addressesfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value "`t${instr}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "`tincbin ""..\grapx\RacingGame\CurveLeftEndAnimationPage${page}\${region}writeinstructionsfrom${i}to${j}.bin"""

            # Update ROM usage
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
