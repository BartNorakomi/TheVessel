$outputFile = "CurveLeftDataFiles.asm"
$startFrame = 0
$endFrame = 15  # Adjust as needed
$RomBlockSize = 16KB  # 16 * 1024

# Helper to get file size safely
function Get-FileSize($path) {
    if (Test-Path $path) {
        return (Get-Item $path).Length
    } else {
        Write-Warning "File not found: $path"
        return 0
    }
}

# Clear or create output file
Set-Content -Path $outputFile -Value "" -Encoding ascii

$blockNum = 1
$currentBlockSize = 0

# Write new block header function
function Write-BlockHeader($blockNum) {
    @"
CurveLeftBlock${blockNum}:  			equ   (`$-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

"@ | Add-Content -Path $outputFile -Encoding ascii
    $global:currentBlockSize = 0
}

# Write new block footer function
function Write-BlockFooter() {
    @"
	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block


"@ | Add-Content -Path $outputFile -Encoding ascii
}

# Start first block
Write-BlockHeader $blockNum

for ($i = $startFrame; $i -lt $endFrame; $i++) {
    $j = $i + 1
    foreach ($page in 0, 1) {
        foreach ($region in "TOP", "BOTTOM") {
            # Build file paths for size check (actual relative paths on disk)
            $changedPixelsFile = ".\CurveLeftAnimationPage${page}\${region}changedpixelsfrom${i}to${j}.bin"
            $addressesFile = ".\CurveLeftAnimationPage${page}\${region}addressesfrom${i}to${j}.bin"
            $writeInstrFile = ".\CurveLeftAnimationPage${page}\${region}writeinstructionsfrom${i}to${j}.bin"

            # Get sizes
            $sizeChanged = Get-FileSize $changedPixelsFile
            $sizeAddr = Get-FileSize $addressesFile
            $sizeInstr = Get-FileSize $writeInstrFile

            # Approximate overhead for labels and equ lines (in bytes)
            $overhead = 60

            # Total bytes to add for this block
            $totalSize = $sizeChanged + $sizeAddr + $sizeInstr + $overhead

            # If adding this block exceeds RomBlockSize, close current block and start a new one
            if (($currentBlockSize + $totalSize) -gt $RomBlockSize) {
                Write-BlockFooter
                $blockNum++
                Write-BlockHeader $blockNum
            }

            # Write block equ label
            $blockLabel = "BlockCurveLeftPage${page}${region}from${i}to${j}"
            $prefix = "Page${page}${region}ChangedPixelsfrom${i}to${j}"
            $addr = "Page${page}${region}Addressesfrom${i}to${j}"
            $instr = "Page${page}${region}WriteInstructionsfrom${i}to${j}"

            # Write to output file with original incbin relative paths (as assembler expects)
            Add-Content -Path $outputFile -Encoding ascii -Value "	${blockLabel}:	equ CurveLeftBlock${blockNum}"
            Add-Content -Path $outputFile -Encoding ascii -Value "	${prefix}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "	incbin ""..\grapx\RacingGame\CurveLeftAnimationPage${page}\${region}changedpixelsfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value "	${addr}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "	incbin ""..\grapx\RacingGame\CurveLeftAnimationPage${page}\${region}addressesfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value "	${instr}:"
            Add-Content -Path $outputFile -Encoding ascii -Value "	incbin ""..\grapx\RacingGame\CurveLeftAnimationPage${page}\${region}writeinstructionsfrom${i}to${j}.bin"""
            Add-Content -Path $outputFile -Encoding ascii -Value ""

            $currentBlockSize += $totalSize
        }
    }
}

# Close last block
Write-BlockFooter
