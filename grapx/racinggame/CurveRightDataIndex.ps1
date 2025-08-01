﻿$outputFile = "CurveRightDataIndex.asm"

# Clear or create file with header comment
" ; CurveRightDataIndex generated by script" | Out-File -Encoding ascii $outputFile

for ($i = 0; $i -le 75 - 1; $i++) {
    $j = $i + 1
    foreach ($page in 0, 1) {
        foreach ($region in "TOP", "BOTTOM") {
            $block = "BlockCurveRightPage${page}${region}from${i}to${j}"
            $changed = "CurveRightPage${page}${region}ChangedPixelsfrom${i}to${j}"
            $addr = "CurveRightPage${page}${region}Addressesfrom${i}to${j}"
            $instr = "CurveRightPage${page}${region}WriteInstructionsfrom${i}to${j}"

            # Final flag formula
            if ($region -eq "TOP") {
                $flag = $page * 2
            } else {
                $flag = $page * 2 + 1
            }

            $line = "db $block, $flag | dw $changed, $addr, $instr"

            # Comment out if region is TOP
            if ($region -eq "TOP") {
                $line = "; " + $line
            }

            Add-Content -Path $outputFile -Encoding ascii -Value $line
        }
    }
}
