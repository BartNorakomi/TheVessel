
CurveDownBlock1:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage0TOPfrom0to1:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom0to1.bin"
	CurveDownPage0TOPAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom0to1.bin"
	CurveDownPage0TOPWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom0to1.bin"

;8001

	BlockCurveDownPage0BOTTOMfrom0to1:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom0to1.bin"
	CurveDownPage0BOTTOMAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom0to1.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom0to1.bin"

;819F

	BlockCurveDownPage1TOPfrom0to1:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom0to1.bin"
	CurveDownPage1TOPAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom0to1.bin"
	CurveDownPage1TOPWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom0to1.bin"

;81A0

	BlockCurveDownPage1BOTTOMfrom0to1:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom0to1.bin"
	CurveDownPage1BOTTOMAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom0to1.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom0to1.bin"

;833E

	BlockCurveDownPage0TOPfrom1to2:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom1to2.bin"
	CurveDownPage0TOPAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom1to2.bin"
	CurveDownPage0TOPWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom1to2.bin"

;833F

	BlockCurveDownPage0BOTTOMfrom1to2:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom1to2.bin"
	CurveDownPage0BOTTOMAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom1to2.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom1to2.bin"

;8847

	BlockCurveDownPage1TOPfrom1to2:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom1to2.bin"
	CurveDownPage1TOPAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom1to2.bin"
	CurveDownPage1TOPWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom1to2.bin"

;8848

	BlockCurveDownPage1BOTTOMfrom1to2:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom1to2.bin"
	CurveDownPage1BOTTOMAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom1to2.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom1to2.bin"

;8D50

	BlockCurveDownPage0TOPfrom2to3:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom2to3.bin"
	CurveDownPage0TOPAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom2to3.bin"
	CurveDownPage0TOPWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom2to3.bin"

;8D51

	BlockCurveDownPage0BOTTOMfrom2to3:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom2to3.bin"
	CurveDownPage0BOTTOMAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom2to3.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom2to3.bin"

;91A1

	BlockCurveDownPage1TOPfrom2to3:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom2to3.bin"
	CurveDownPage1TOPAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom2to3.bin"
	CurveDownPage1TOPWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom2to3.bin"

;91A2

	BlockCurveDownPage1BOTTOMfrom2to3:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom2to3.bin"
	CurveDownPage1BOTTOMAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom2to3.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom2to3.bin"

;95F2

	BlockCurveDownPage0TOPfrom3to4:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom3to4.bin"
	CurveDownPage0TOPAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom3to4.bin"
	CurveDownPage0TOPWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom3to4.bin"

;95F3

	BlockCurveDownPage0BOTTOMfrom3to4:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom3to4.bin"
	CurveDownPage0BOTTOMAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom3to4.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom3to4.bin"

;99D3

	BlockCurveDownPage1TOPfrom3to4:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom3to4.bin"
	CurveDownPage1TOPAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom3to4.bin"
	CurveDownPage1TOPWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom3to4.bin"

;99D4

	BlockCurveDownPage1BOTTOMfrom3to4:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom3to4.bin"
	CurveDownPage1BOTTOMAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom3to4.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom3to4.bin"

;9DB4

	BlockCurveDownPage0TOPfrom4to5:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom4to5.bin"
	CurveDownPage0TOPAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom4to5.bin"
	CurveDownPage0TOPWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom4to5.bin"

;9DB5

	BlockCurveDownPage0BOTTOMfrom4to5:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom4to5.bin"
	CurveDownPage0BOTTOMAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom4to5.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom4to5.bin"

;A262

	BlockCurveDownPage1TOPfrom4to5:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom4to5.bin"
	CurveDownPage1TOPAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom4to5.bin"
	CurveDownPage1TOPWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom4to5.bin"

;A263

	BlockCurveDownPage1BOTTOMfrom4to5:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom4to5.bin"
	CurveDownPage1BOTTOMAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom4to5.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom4to5.bin"

;A710

	BlockCurveDownPage0TOPfrom5to6:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom5to6.bin"
	CurveDownPage0TOPAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom5to6.bin"
	CurveDownPage0TOPWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom5to6.bin"

;A711

	BlockCurveDownPage0BOTTOMfrom5to6:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom5to6.bin"
	CurveDownPage0BOTTOMAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom5to6.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom5to6.bin"

;AA7A

	BlockCurveDownPage1TOPfrom5to6:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom5to6.bin"
	CurveDownPage1TOPAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom5to6.bin"
	CurveDownPage1TOPWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom5to6.bin"

;AA7B

	BlockCurveDownPage1BOTTOMfrom5to6:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom5to6.bin"
	CurveDownPage1BOTTOMAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom5to6.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom5to6.bin"

;ADE4

	BlockCurveDownPage0TOPfrom6to7:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom6to7.bin"
	CurveDownPage0TOPAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom6to7.bin"
	CurveDownPage0TOPWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom6to7.bin"

;ADE5

	BlockCurveDownPage0BOTTOMfrom6to7:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom6to7.bin"
	CurveDownPage0BOTTOMAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom6to7.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom6to7.bin"

;B292

	BlockCurveDownPage1TOPfrom6to7:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom6to7.bin"
	CurveDownPage1TOPAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom6to7.bin"
	CurveDownPage1TOPWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom6to7.bin"

;B293

	BlockCurveDownPage1BOTTOMfrom6to7:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom6to7.bin"
	CurveDownPage1BOTTOMAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom6to7.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom6to7.bin"

;B740

	BlockCurveDownPage0TOPfrom7to8:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom7to8.bin"
	CurveDownPage0TOPAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom7to8.bin"
	CurveDownPage0TOPWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom7to8.bin"

;B741

	BlockCurveDownPage0BOTTOMfrom7to8:	equ CurveDownBlock1
	CurveDownPage0BOTTOMChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom7to8.bin"
	CurveDownPage0BOTTOMAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom7to8.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom7to8.bin"

;BAA3

	BlockCurveDownPage1TOPfrom7to8:	equ CurveDownBlock1
	CurveDownPage1TOPChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom7to8.bin"
	CurveDownPage1TOPAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom7to8.bin"
	CurveDownPage1TOPWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom7to8.bin"

;BAA4

	BlockCurveDownPage1BOTTOMfrom7to8:	equ CurveDownBlock1
	CurveDownPage1BOTTOMChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom7to8.bin"
	CurveDownPage1BOTTOMAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom7to8.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom7to8.bin"

;BE06

	BlockCurveDownPage0TOPfrom8to9:	equ CurveDownBlock1
	CurveDownPage0TOPChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom8to9.bin"
	CurveDownPage0TOPAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom8to9.bin"
	CurveDownPage0TOPWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom8to9.bin"

;BE07

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock2:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage0BOTTOMfrom8to9:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom8to9.bin"
	CurveDownPage0BOTTOMAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom8to9.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom8to9.bin"

;84AA

	BlockCurveDownPage1TOPfrom8to9:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom8to9.bin"
	CurveDownPage1TOPAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom8to9.bin"
	CurveDownPage1TOPWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom8to9.bin"

;84AB

	BlockCurveDownPage1BOTTOMfrom8to9:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom8to9.bin"
	CurveDownPage1BOTTOMAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom8to9.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom8to9.bin"

;8955

	BlockCurveDownPage0TOPfrom9to10:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom9to10.bin"
	CurveDownPage0TOPAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom9to10.bin"
	CurveDownPage0TOPWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom9to10.bin"

;8956

	BlockCurveDownPage0BOTTOMfrom9to10:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom9to10.bin"
	CurveDownPage0BOTTOMAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom9to10.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom9to10.bin"

;8CC0

	BlockCurveDownPage1TOPfrom9to10:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom9to10.bin"
	CurveDownPage1TOPAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom9to10.bin"
	CurveDownPage1TOPWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom9to10.bin"

;8CC1

	BlockCurveDownPage1BOTTOMfrom9to10:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom9to10.bin"
	CurveDownPage1BOTTOMAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom9to10.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom9to10.bin"

;902B

	BlockCurveDownPage0TOPfrom10to11:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom10to11.bin"
	CurveDownPage0TOPAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom10to11.bin"
	CurveDownPage0TOPWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom10to11.bin"

;902C

	BlockCurveDownPage0BOTTOMfrom10to11:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom10to11.bin"
	CurveDownPage0BOTTOMAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom10to11.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom10to11.bin"

;956E

	BlockCurveDownPage1TOPfrom10to11:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom10to11.bin"
	CurveDownPage1TOPAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom10to11.bin"
	CurveDownPage1TOPWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom10to11.bin"

;956F

	BlockCurveDownPage1BOTTOMfrom10to11:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom10to11.bin"
	CurveDownPage1BOTTOMAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom10to11.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom10to11.bin"

;9AB1

	BlockCurveDownPage0TOPfrom11to12:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom11to12.bin"
	CurveDownPage0TOPAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom11to12.bin"
	CurveDownPage0TOPWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom11to12.bin"

;9AB2

	BlockCurveDownPage0BOTTOMfrom11to12:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom11to12.bin"
	CurveDownPage0BOTTOMAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom11to12.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom11to12.bin"

;9DE0

	BlockCurveDownPage1TOPfrom11to12:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom11to12.bin"
	CurveDownPage1TOPAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom11to12.bin"
	CurveDownPage1TOPWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom11to12.bin"

;9DE1

	BlockCurveDownPage1BOTTOMfrom11to12:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom11to12.bin"
	CurveDownPage1BOTTOMAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom11to12.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom11to12.bin"

;A10F

	BlockCurveDownPage0TOPfrom12to13:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom12to13.bin"
	CurveDownPage0TOPAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom12to13.bin"
	CurveDownPage0TOPWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom12to13.bin"

;A110

	BlockCurveDownPage0BOTTOMfrom12to13:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom12to13.bin"
	CurveDownPage0BOTTOMAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom12to13.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom12to13.bin"

;A5CF

	BlockCurveDownPage1TOPfrom12to13:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom12to13.bin"
	CurveDownPage1TOPAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom12to13.bin"
	CurveDownPage1TOPWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom12to13.bin"

;A5D0

	BlockCurveDownPage1BOTTOMfrom12to13:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom12to13.bin"
	CurveDownPage1BOTTOMAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom12to13.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom12to13.bin"

;AA8F

	BlockCurveDownPage0TOPfrom13to14:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom13to14.bin"
	CurveDownPage0TOPAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom13to14.bin"
	CurveDownPage0TOPWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom13to14.bin"

;AA90

	BlockCurveDownPage0BOTTOMfrom13to14:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom13to14.bin"
	CurveDownPage0BOTTOMAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom13to14.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom13to14.bin"

;AE03

	BlockCurveDownPage1TOPfrom13to14:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom13to14.bin"
	CurveDownPage1TOPAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom13to14.bin"
	CurveDownPage1TOPWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom13to14.bin"

;AE04

	BlockCurveDownPage1BOTTOMfrom13to14:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom13to14.bin"
	CurveDownPage1BOTTOMAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom13to14.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom13to14.bin"

;B177

	BlockCurveDownPage0TOPfrom14to15:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom14to15.bin"
	CurveDownPage0TOPAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom14to15.bin"
	CurveDownPage0TOPWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom14to15.bin"

;B178

	BlockCurveDownPage0BOTTOMfrom14to15:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom14to15.bin"
	CurveDownPage0BOTTOMAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom14to15.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom14to15.bin"

;B614

	BlockCurveDownPage1TOPfrom14to15:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom14to15.bin"
	CurveDownPage1TOPAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom14to15.bin"
	CurveDownPage1TOPWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom14to15.bin"

;B615

	BlockCurveDownPage1BOTTOMfrom14to15:	equ CurveDownBlock2
	CurveDownPage1BOTTOMChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom14to15.bin"
	CurveDownPage1BOTTOMAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom14to15.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom14to15.bin"

;BAB1

	BlockCurveDownPage0TOPfrom15to16:	equ CurveDownBlock2
	CurveDownPage0TOPChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom15to16.bin"
	CurveDownPage0TOPAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom15to16.bin"
	CurveDownPage0TOPWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom15to16.bin"

;BAB2

	BlockCurveDownPage0BOTTOMfrom15to16:	equ CurveDownBlock2
	CurveDownPage0BOTTOMChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom15to16.bin"
	CurveDownPage0BOTTOMAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom15to16.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom15to16.bin"

;BE50

	BlockCurveDownPage1TOPfrom15to16:	equ CurveDownBlock2
	CurveDownPage1TOPChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom15to16.bin"
	CurveDownPage1TOPAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom15to16.bin"
	CurveDownPage1TOPWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom15to16.bin"

;BE51

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock3:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage1BOTTOMfrom15to16:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom15to16.bin"
	CurveDownPage1BOTTOMAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom15to16.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom15to16.bin"

;839E

	BlockCurveDownPage0TOPfrom16to17:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom16to17.bin"
	CurveDownPage0TOPAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom16to17.bin"
	CurveDownPage0TOPWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom16to17.bin"

;839F

	BlockCurveDownPage0BOTTOMfrom16to17:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom16to17.bin"
	CurveDownPage0BOTTOMAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom16to17.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom16to17.bin"

;88EB

	BlockCurveDownPage1TOPfrom16to17:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom16to17.bin"
	CurveDownPage1TOPAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom16to17.bin"
	CurveDownPage1TOPWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom16to17.bin"

;88EC

	BlockCurveDownPage1BOTTOMfrom16to17:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom16to17.bin"
	CurveDownPage1BOTTOMAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom16to17.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom16to17.bin"

;8E38

	BlockCurveDownPage0TOPfrom17to18:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom17to18.bin"
	CurveDownPage0TOPAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom17to18.bin"
	CurveDownPage0TOPWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom17to18.bin"

;8E39

	BlockCurveDownPage0BOTTOMfrom17to18:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom17to18.bin"
	CurveDownPage0BOTTOMAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom17to18.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom17to18.bin"

;9138

	BlockCurveDownPage1TOPfrom17to18:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom17to18.bin"
	CurveDownPage1TOPAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom17to18.bin"
	CurveDownPage1TOPWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom17to18.bin"

;9139

	BlockCurveDownPage1BOTTOMfrom17to18:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom17to18.bin"
	CurveDownPage1BOTTOMAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom17to18.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom17to18.bin"

;9438

	BlockCurveDownPage0TOPfrom18to19:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom18to19.bin"
	CurveDownPage0TOPAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom18to19.bin"
	CurveDownPage0TOPWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom18to19.bin"

;9439

	BlockCurveDownPage0BOTTOMfrom18to19:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom18to19.bin"
	CurveDownPage0BOTTOMAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom18to19.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom18to19.bin"

;995B

	BlockCurveDownPage1TOPfrom18to19:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom18to19.bin"
	CurveDownPage1TOPAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom18to19.bin"
	CurveDownPage1TOPWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom18to19.bin"

;995C

	BlockCurveDownPage1BOTTOMfrom18to19:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom18to19.bin"
	CurveDownPage1BOTTOMAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom18to19.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom18to19.bin"

;9E7E

	BlockCurveDownPage0TOPfrom19to20:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom19to20.bin"
	CurveDownPage0TOPAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom19to20.bin"
	CurveDownPage0TOPWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom19to20.bin"

;9E7F

	BlockCurveDownPage0BOTTOMfrom19to20:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom19to20.bin"
	CurveDownPage0BOTTOMAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom19to20.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom19to20.bin"

;A1EB

	BlockCurveDownPage1TOPfrom19to20:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom19to20.bin"
	CurveDownPage1TOPAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom19to20.bin"
	CurveDownPage1TOPWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom19to20.bin"

;A1EC

	BlockCurveDownPage1BOTTOMfrom19to20:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom19to20.bin"
	CurveDownPage1BOTTOMAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom19to20.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom19to20.bin"

;A558

	BlockCurveDownPage0TOPfrom20to21:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom20to21.bin"
	CurveDownPage0TOPAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom20to21.bin"
	CurveDownPage0TOPWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom20to21.bin"

;A559

	BlockCurveDownPage0BOTTOMfrom20to21:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom20to21.bin"
	CurveDownPage0BOTTOMAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom20to21.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom20to21.bin"

;AA08

	BlockCurveDownPage1TOPfrom20to21:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom20to21.bin"
	CurveDownPage1TOPAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom20to21.bin"
	CurveDownPage1TOPWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom20to21.bin"

;AA09

	BlockCurveDownPage1BOTTOMfrom20to21:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom20to21.bin"
	CurveDownPage1BOTTOMAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom20to21.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom20to21.bin"

;AEB8

	BlockCurveDownPage0TOPfrom21to22:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom21to22.bin"
	CurveDownPage0TOPAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom21to22.bin"
	CurveDownPage0TOPWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom21to22.bin"

;AEB9

	BlockCurveDownPage0BOTTOMfrom21to22:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom21to22.bin"
	CurveDownPage0BOTTOMAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom21to22.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom21to22.bin"

;B214

	BlockCurveDownPage1TOPfrom21to22:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom21to22.bin"
	CurveDownPage1TOPAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom21to22.bin"
	CurveDownPage1TOPWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom21to22.bin"

;B215

	BlockCurveDownPage1BOTTOMfrom21to22:	equ CurveDownBlock3
	CurveDownPage1BOTTOMChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom21to22.bin"
	CurveDownPage1BOTTOMAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom21to22.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom21to22.bin"

;B570

	BlockCurveDownPage0TOPfrom22to23:	equ CurveDownBlock3
	CurveDownPage0TOPChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom22to23.bin"
	CurveDownPage0TOPAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom22to23.bin"
	CurveDownPage0TOPWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom22to23.bin"

;B571

	BlockCurveDownPage0BOTTOMfrom22to23:	equ CurveDownBlock3
	CurveDownPage0BOTTOMChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom22to23.bin"
	CurveDownPage0BOTTOMAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom22to23.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom22to23.bin"

;BB00

	BlockCurveDownPage1TOPfrom22to23:	equ CurveDownBlock3
	CurveDownPage1TOPChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom22to23.bin"
	CurveDownPage1TOPAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom22to23.bin"
	CurveDownPage1TOPWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom22to23.bin"

;BB01

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock4:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage1BOTTOMfrom22to23:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom22to23.bin"
	CurveDownPage1BOTTOMAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom22to23.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom22to23.bin"

;858F

	BlockCurveDownPage0TOPfrom23to24:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom23to24.bin"
	CurveDownPage0TOPAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom23to24.bin"
	CurveDownPage0TOPWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom23to24.bin"

;8590

	BlockCurveDownPage0BOTTOMfrom23to24:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom23to24.bin"
	CurveDownPage0BOTTOMAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom23to24.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom23to24.bin"

;8886

	BlockCurveDownPage1TOPfrom23to24:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom23to24.bin"
	CurveDownPage1TOPAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom23to24.bin"
	CurveDownPage1TOPWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom23to24.bin"

;8887

	BlockCurveDownPage1BOTTOMfrom23to24:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom23to24.bin"
	CurveDownPage1BOTTOMAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom23to24.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom23to24.bin"

;8B7D

	BlockCurveDownPage0TOPfrom24to25:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom24to25.bin"
	CurveDownPage0TOPAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom24to25.bin"
	CurveDownPage0TOPWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom24to25.bin"

;8B7E

	BlockCurveDownPage0BOTTOMfrom24to25:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom24to25.bin"
	CurveDownPage0BOTTOMAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom24to25.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom24to25.bin"

;90EF

	BlockCurveDownPage1TOPfrom24to25:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom24to25.bin"
	CurveDownPage1TOPAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom24to25.bin"
	CurveDownPage1TOPWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom24to25.bin"

;90F0

	BlockCurveDownPage1BOTTOMfrom24to25:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom24to25.bin"
	CurveDownPage1BOTTOMAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom24to25.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom24to25.bin"

;9661

	BlockCurveDownPage0TOPfrom25to26:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom25to26.bin"
	CurveDownPage0TOPAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom25to26.bin"
	CurveDownPage0TOPWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom25to26.bin"

;9662

	BlockCurveDownPage0BOTTOMfrom25to26:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom25to26.bin"
	CurveDownPage0BOTTOMAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom25to26.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom25to26.bin"

;99AC

	BlockCurveDownPage1TOPfrom25to26:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom25to26.bin"
	CurveDownPage1TOPAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom25to26.bin"
	CurveDownPage1TOPWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom25to26.bin"

;99AD

	BlockCurveDownPage1BOTTOMfrom25to26:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom25to26.bin"
	CurveDownPage1BOTTOMAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom25to26.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom25to26.bin"

;9CF7

	BlockCurveDownPage0TOPfrom26to27:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom26to27.bin"
	CurveDownPage0TOPAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom26to27.bin"
	CurveDownPage0TOPWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom26to27.bin"

;9CF8

	BlockCurveDownPage0BOTTOMfrom26to27:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom26to27.bin"
	CurveDownPage0BOTTOMAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom26to27.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom26to27.bin"

;A1F0

	BlockCurveDownPage1TOPfrom26to27:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom26to27.bin"
	CurveDownPage1TOPAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom26to27.bin"
	CurveDownPage1TOPWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom26to27.bin"

;A1F1

	BlockCurveDownPage1BOTTOMfrom26to27:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom26to27.bin"
	CurveDownPage1BOTTOMAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom26to27.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom26to27.bin"

;A6E9

	BlockCurveDownPage0TOPfrom27to28:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom27to28.bin"
	CurveDownPage0TOPAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom27to28.bin"
	CurveDownPage0TOPWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom27to28.bin"

;A6EA

	BlockCurveDownPage0BOTTOMfrom27to28:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom27to28.bin"
	CurveDownPage0BOTTOMAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom27to28.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom27to28.bin"

;AAB6

	BlockCurveDownPage1TOPfrom27to28:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom27to28.bin"
	CurveDownPage1TOPAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom27to28.bin"
	CurveDownPage1TOPWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom27to28.bin"

;AAB7

	BlockCurveDownPage1BOTTOMfrom27to28:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom27to28.bin"
	CurveDownPage1BOTTOMAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom27to28.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom27to28.bin"

;AE83

	BlockCurveDownPage0TOPfrom28to29:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom28to29.bin"
	CurveDownPage0TOPAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom28to29.bin"
	CurveDownPage0TOPWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom28to29.bin"

;AE84

	BlockCurveDownPage0BOTTOMfrom28to29:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom28to29.bin"
	CurveDownPage0BOTTOMAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom28to29.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom28to29.bin"

;B2AC

	BlockCurveDownPage1TOPfrom28to29:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom28to29.bin"
	CurveDownPage1TOPAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom28to29.bin"
	CurveDownPage1TOPWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom28to29.bin"

;B2AD

	BlockCurveDownPage1BOTTOMfrom28to29:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom28to29.bin"
	CurveDownPage1BOTTOMAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom28to29.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom28to29.bin"

;B6D5

	BlockCurveDownPage0TOPfrom29to30:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom29to30.bin"
	CurveDownPage0TOPAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom29to30.bin"
	CurveDownPage0TOPWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom29to30.bin"

;B6D6

	BlockCurveDownPage0BOTTOMfrom29to30:	equ CurveDownBlock4
	CurveDownPage0BOTTOMChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom29to30.bin"
	CurveDownPage0BOTTOMAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom29to30.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom29to30.bin"

;BAD5

	BlockCurveDownPage1TOPfrom29to30:	equ CurveDownBlock4
	CurveDownPage1TOPChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom29to30.bin"
	CurveDownPage1TOPAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom29to30.bin"
	CurveDownPage1TOPWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom29to30.bin"

;BAD6

	BlockCurveDownPage1BOTTOMfrom29to30:	equ CurveDownBlock4
	CurveDownPage1BOTTOMChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom29to30.bin"
	CurveDownPage1BOTTOMAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom29to30.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom29to30.bin"

;BED5

	BlockCurveDownPage0TOPfrom30to31:	equ CurveDownBlock4
	CurveDownPage0TOPChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom30to31.bin"
	CurveDownPage0TOPAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom30to31.bin"
	CurveDownPage0TOPWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom30to31.bin"

;BED6

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock5:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage0BOTTOMfrom30to31:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom30to31.bin"
	CurveDownPage0BOTTOMAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom30to31.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom30to31.bin"

;851B

	BlockCurveDownPage1TOPfrom30to31:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom30to31.bin"
	CurveDownPage1TOPAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom30to31.bin"
	CurveDownPage1TOPWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom30to31.bin"

;851C

	BlockCurveDownPage1BOTTOMfrom30to31:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom30to31.bin"
	CurveDownPage1BOTTOMAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom30to31.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom30to31.bin"

;8A37

	BlockCurveDownPage0TOPfrom31to32:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom31to32.bin"
	CurveDownPage0TOPAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom31to32.bin"
	CurveDownPage0TOPWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom31to32.bin"

;8A38

	BlockCurveDownPage0BOTTOMfrom31to32:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom31to32.bin"
	CurveDownPage0BOTTOMAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom31to32.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom31to32.bin"

;8DE4

	BlockCurveDownPage1TOPfrom31to32:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom31to32.bin"
	CurveDownPage1TOPAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom31to32.bin"
	CurveDownPage1TOPWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom31to32.bin"

;8DE5

	BlockCurveDownPage1BOTTOMfrom31to32:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom31to32.bin"
	CurveDownPage1BOTTOMAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom31to32.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom31to32.bin"

;9191

	BlockCurveDownPage0TOPfrom32to33:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom32to33.bin"
	CurveDownPage0TOPAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom32to33.bin"
	CurveDownPage0TOPWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom32to33.bin"

;9192

	BlockCurveDownPage0BOTTOMfrom32to33:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom32to33.bin"
	CurveDownPage0BOTTOMAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom32to33.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom32to33.bin"

;969B

	BlockCurveDownPage1TOPfrom32to33:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom32to33.bin"
	CurveDownPage1TOPAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom32to33.bin"
	CurveDownPage1TOPWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom32to33.bin"

;969C

	BlockCurveDownPage1BOTTOMfrom32to33:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom32to33.bin"
	CurveDownPage1BOTTOMAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom32to33.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom32to33.bin"

;9BA5

	BlockCurveDownPage0TOPfrom33to34:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom33to34.bin"
	CurveDownPage0TOPAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom33to34.bin"
	CurveDownPage0TOPWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom33to34.bin"

;9BA6

	BlockCurveDownPage0BOTTOMfrom33to34:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom33to34.bin"
	CurveDownPage0BOTTOMAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom33to34.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom33to34.bin"

;9F19

	BlockCurveDownPage1TOPfrom33to34:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom33to34.bin"
	CurveDownPage1TOPAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom33to34.bin"
	CurveDownPage1TOPWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom33to34.bin"

;9F1A

	BlockCurveDownPage1BOTTOMfrom33to34:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom33to34.bin"
	CurveDownPage1BOTTOMAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom33to34.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom33to34.bin"

;A28D

	BlockCurveDownPage0TOPfrom34to35:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom34to35.bin"
	CurveDownPage0TOPAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom34to35.bin"
	CurveDownPage0TOPWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom34to35.bin"

;A28E

	BlockCurveDownPage0BOTTOMfrom34to35:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom34to35.bin"
	CurveDownPage0BOTTOMAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom34to35.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom34to35.bin"

;A7BE

	BlockCurveDownPage1TOPfrom34to35:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom34to35.bin"
	CurveDownPage1TOPAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom34to35.bin"
	CurveDownPage1TOPWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom34to35.bin"

;A7BF

	BlockCurveDownPage1BOTTOMfrom34to35:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom34to35.bin"
	CurveDownPage1BOTTOMAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom34to35.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom34to35.bin"

;ACEF

	BlockCurveDownPage0TOPfrom35to36:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom35to36.bin"
	CurveDownPage0TOPAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom35to36.bin"
	CurveDownPage0TOPWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom35to36.bin"

;ACF0

	BlockCurveDownPage0BOTTOMfrom35to36:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom35to36.bin"
	CurveDownPage0BOTTOMAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom35to36.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom35to36.bin"

;B081

	BlockCurveDownPage1TOPfrom35to36:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom35to36.bin"
	CurveDownPage1TOPAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom35to36.bin"
	CurveDownPage1TOPWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom35to36.bin"

;B082

	BlockCurveDownPage1BOTTOMfrom35to36:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom35to36.bin"
	CurveDownPage1BOTTOMAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom35to36.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom35to36.bin"

;B413

	BlockCurveDownPage0TOPfrom36to37:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom36to37.bin"
	CurveDownPage0TOPAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom36to37.bin"
	CurveDownPage0TOPWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom36to37.bin"

;B414

	BlockCurveDownPage0BOTTOMfrom36to37:	equ CurveDownBlock5
	CurveDownPage0BOTTOMChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom36to37.bin"
	CurveDownPage0BOTTOMAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom36to37.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom36to37.bin"

;B99D

	BlockCurveDownPage1TOPfrom36to37:	equ CurveDownBlock5
	CurveDownPage1TOPChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom36to37.bin"
	CurveDownPage1TOPAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom36to37.bin"
	CurveDownPage1TOPWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom36to37.bin"

;B99E

	BlockCurveDownPage1BOTTOMfrom36to37:	equ CurveDownBlock5
	CurveDownPage1BOTTOMChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom36to37.bin"
	CurveDownPage1BOTTOMAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom36to37.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom36to37.bin"

;BF27

	BlockCurveDownPage0TOPfrom37to38:	equ CurveDownBlock5
	CurveDownPage0TOPChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom37to38.bin"
	CurveDownPage0TOPAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom37to38.bin"
	CurveDownPage0TOPWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom37to38.bin"

;BF28

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock6:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage0BOTTOMfrom37to38:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom37to38.bin"
	CurveDownPage0BOTTOMAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom37to38.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom37to38.bin"

;82AF

	BlockCurveDownPage1TOPfrom37to38:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom37to38.bin"
	CurveDownPage1TOPAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom37to38.bin"
	CurveDownPage1TOPWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom37to38.bin"

;82B0

	BlockCurveDownPage1BOTTOMfrom37to38:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom37to38.bin"
	CurveDownPage1BOTTOMAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom37to38.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom37to38.bin"

;855F

	BlockCurveDownPage0TOPfrom38to39:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom38to39.bin"
	CurveDownPage0TOPAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom38to39.bin"
	CurveDownPage0TOPWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom38to39.bin"

;8560

	BlockCurveDownPage0BOTTOMfrom38to39:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom38to39.bin"
	CurveDownPage0BOTTOMAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom38to39.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom38to39.bin"

;8AE2

	BlockCurveDownPage1TOPfrom38to39:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom38to39.bin"
	CurveDownPage1TOPAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom38to39.bin"
	CurveDownPage1TOPWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom38to39.bin"

;8AE3

	BlockCurveDownPage1BOTTOMfrom38to39:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom38to39.bin"
	CurveDownPage1BOTTOMAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom38to39.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom38to39.bin"

;9065

	BlockCurveDownPage0TOPfrom39to40:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom39to40.bin"
	CurveDownPage0TOPAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom39to40.bin"
	CurveDownPage0TOPWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom39to40.bin"

;9066

	BlockCurveDownPage0BOTTOMfrom39to40:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom39to40.bin"
	CurveDownPage0BOTTOMAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom39to40.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom39to40.bin"

;9339

	BlockCurveDownPage1TOPfrom39to40:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom39to40.bin"
	CurveDownPage1TOPAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom39to40.bin"
	CurveDownPage1TOPWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom39to40.bin"

;933A

	BlockCurveDownPage1BOTTOMfrom39to40:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom39to40.bin"
	CurveDownPage1BOTTOMAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom39to40.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom39to40.bin"

;960D

	BlockCurveDownPage0TOPfrom40to41:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom40to41.bin"
	CurveDownPage0TOPAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom40to41.bin"
	CurveDownPage0TOPWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom40to41.bin"

;960E

	BlockCurveDownPage0BOTTOMfrom40to41:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom40to41.bin"
	CurveDownPage0BOTTOMAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom40to41.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom40to41.bin"

;9BD3

	BlockCurveDownPage1TOPfrom40to41:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom40to41.bin"
	CurveDownPage1TOPAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom40to41.bin"
	CurveDownPage1TOPWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom40to41.bin"

;9BD4

	BlockCurveDownPage1BOTTOMfrom40to41:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom40to41.bin"
	CurveDownPage1BOTTOMAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom40to41.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom40to41.bin"

;A199

	BlockCurveDownPage0TOPfrom41to42:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom41to42.bin"
	CurveDownPage0TOPAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom41to42.bin"
	CurveDownPage0TOPWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom41to42.bin"

;A19A

	BlockCurveDownPage0BOTTOMfrom41to42:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom41to42.bin"
	CurveDownPage0BOTTOMAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom41to42.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom41to42.bin"

;A50D

	BlockCurveDownPage1TOPfrom41to42:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom41to42.bin"
	CurveDownPage1TOPAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom41to42.bin"
	CurveDownPage1TOPWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom41to42.bin"

;A50E

	BlockCurveDownPage1BOTTOMfrom41to42:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom41to42.bin"
	CurveDownPage1BOTTOMAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom41to42.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom41to42.bin"

;A881

	BlockCurveDownPage0TOPfrom42to43:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom42to43.bin"
	CurveDownPage0TOPAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom42to43.bin"
	CurveDownPage0TOPWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom42to43.bin"

;A882

	BlockCurveDownPage0BOTTOMfrom42to43:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom42to43.bin"
	CurveDownPage0BOTTOMAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom42to43.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom42to43.bin"

;AD73

	BlockCurveDownPage1TOPfrom42to43:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom42to43.bin"
	CurveDownPage1TOPAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom42to43.bin"
	CurveDownPage1TOPWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom42to43.bin"

;AD74

	BlockCurveDownPage1BOTTOMfrom42to43:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom42to43.bin"
	CurveDownPage1BOTTOMAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom42to43.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom42to43.bin"

;B265

	BlockCurveDownPage0TOPfrom43to44:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom43to44.bin"
	CurveDownPage0TOPAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom43to44.bin"
	CurveDownPage0TOPWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom43to44.bin"

;B266

	BlockCurveDownPage0BOTTOMfrom43to44:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom43to44.bin"
	CurveDownPage0BOTTOMAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom43to44.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom43to44.bin"

;B59D

	BlockCurveDownPage1TOPfrom43to44:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom43to44.bin"
	CurveDownPage1TOPAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom43to44.bin"
	CurveDownPage1TOPWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom43to44.bin"

;B59E

	BlockCurveDownPage1BOTTOMfrom43to44:	equ CurveDownBlock6
	CurveDownPage1BOTTOMChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom43to44.bin"
	CurveDownPage1BOTTOMAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom43to44.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom43to44.bin"

;B8D5

	BlockCurveDownPage0TOPfrom44to45:	equ CurveDownBlock6
	CurveDownPage0TOPChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom44to45.bin"
	CurveDownPage0TOPAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom44to45.bin"
	CurveDownPage0TOPWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom44to45.bin"

;B8D6

	BlockCurveDownPage0BOTTOMfrom44to45:	equ CurveDownBlock6
	CurveDownPage0BOTTOMChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom44to45.bin"
	CurveDownPage0BOTTOMAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom44to45.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom44to45.bin"

;BDF3

	BlockCurveDownPage1TOPfrom44to45:	equ CurveDownBlock6
	CurveDownPage1TOPChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom44to45.bin"
	CurveDownPage1TOPAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom44to45.bin"
	CurveDownPage1TOPWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom44to45.bin"

;BDF4

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock7:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage1BOTTOMfrom44to45:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom44to45.bin"
	CurveDownPage1BOTTOMAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom44to45.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom44to45.bin"

;851D

	BlockCurveDownPage0TOPfrom45to46:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom45to46.bin"
	CurveDownPage0TOPAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom45to46.bin"
	CurveDownPage0TOPWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom45to46.bin"

;851E

	BlockCurveDownPage0BOTTOMfrom45to46:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom45to46.bin"
	CurveDownPage0BOTTOMAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom45to46.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom45to46.bin"

;886B

	BlockCurveDownPage1TOPfrom45to46:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom45to46.bin"
	CurveDownPage1TOPAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom45to46.bin"
	CurveDownPage1TOPWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom45to46.bin"

;886C

	BlockCurveDownPage1BOTTOMfrom45to46:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom45to46.bin"
	CurveDownPage1BOTTOMAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom45to46.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom45to46.bin"

;8BB9

	BlockCurveDownPage0TOPfrom46to47:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom46to47.bin"
	CurveDownPage0TOPAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom46to47.bin"
	CurveDownPage0TOPWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom46to47.bin"

;8BBA

	BlockCurveDownPage0BOTTOMfrom46to47:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom46to47.bin"
	CurveDownPage0BOTTOMAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom46to47.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom46to47.bin"

;9144

	BlockCurveDownPage1TOPfrom46to47:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom46to47.bin"
	CurveDownPage1TOPAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom46to47.bin"
	CurveDownPage1TOPWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom46to47.bin"

;9145

	BlockCurveDownPage1BOTTOMfrom46to47:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom46to47.bin"
	CurveDownPage1BOTTOMAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom46to47.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom46to47.bin"

;96CF

	BlockCurveDownPage0TOPfrom47to48:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom47to48.bin"
	CurveDownPage0TOPAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom47to48.bin"
	CurveDownPage0TOPWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom47to48.bin"

;96D0

	BlockCurveDownPage0BOTTOMfrom47to48:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom47to48.bin"
	CurveDownPage0BOTTOMAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom47to48.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom47to48.bin"

;9AB5

	BlockCurveDownPage1TOPfrom47to48:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom47to48.bin"
	CurveDownPage1TOPAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom47to48.bin"
	CurveDownPage1TOPWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom47to48.bin"

;9AB6

	BlockCurveDownPage1BOTTOMfrom47to48:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom47to48.bin"
	CurveDownPage1BOTTOMAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom47to48.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom47to48.bin"

;9E9B

	BlockCurveDownPage0TOPfrom48to49:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom48to49.bin"
	CurveDownPage0TOPAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom48to49.bin"
	CurveDownPage0TOPWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom48to49.bin"

;9E9C

	BlockCurveDownPage0BOTTOMfrom48to49:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom48to49.bin"
	CurveDownPage0BOTTOMAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom48to49.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom48to49.bin"

;A342

	BlockCurveDownPage1TOPfrom48to49:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom48to49.bin"
	CurveDownPage1TOPAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom48to49.bin"
	CurveDownPage1TOPWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom48to49.bin"

;A343

	BlockCurveDownPage1BOTTOMfrom48to49:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom48to49.bin"
	CurveDownPage1BOTTOMAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom48to49.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom48to49.bin"

;A7E9

	BlockCurveDownPage0TOPfrom49to50:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom49to50.bin"
	CurveDownPage0TOPAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom49to50.bin"
	CurveDownPage0TOPWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom49to50.bin"

;A7EA

	BlockCurveDownPage0BOTTOMfrom49to50:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom49to50.bin"
	CurveDownPage0BOTTOMAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom49to50.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom49to50.bin"

;ABE1

	BlockCurveDownPage1TOPfrom49to50:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom49to50.bin"
	CurveDownPage1TOPAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom49to50.bin"
	CurveDownPage1TOPWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom49to50.bin"

;ABE2

	BlockCurveDownPage1BOTTOMfrom49to50:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom49to50.bin"
	CurveDownPage1BOTTOMAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom49to50.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom49to50.bin"

;AFD9

	BlockCurveDownPage0TOPfrom50to51:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom50to51.bin"
	CurveDownPage0TOPAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom50to51.bin"
	CurveDownPage0TOPWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom50to51.bin"

;AFDA

	BlockCurveDownPage0BOTTOMfrom50to51:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom50to51.bin"
	CurveDownPage0BOTTOMAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom50to51.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom50to51.bin"

;B48B

	BlockCurveDownPage1TOPfrom50to51:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom50to51.bin"
	CurveDownPage1TOPAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom50to51.bin"
	CurveDownPage1TOPWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom50to51.bin"

;B48C

	BlockCurveDownPage1BOTTOMfrom50to51:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom50to51.bin"
	CurveDownPage1BOTTOMAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom50to51.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom50to51.bin"

;B93D

	BlockCurveDownPage0TOPfrom51to52:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom51to52.bin"
	CurveDownPage0TOPAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom51to52.bin"
	CurveDownPage0TOPWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom51to52.bin"

;B93E

	BlockCurveDownPage0BOTTOMfrom51to52:	equ CurveDownBlock7
	CurveDownPage0BOTTOMChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom51to52.bin"
	CurveDownPage0BOTTOMAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom51to52.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom51to52.bin"

;BC2B

	BlockCurveDownPage1TOPfrom51to52:	equ CurveDownBlock7
	CurveDownPage1TOPChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom51to52.bin"
	CurveDownPage1TOPAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom51to52.bin"
	CurveDownPage1TOPWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom51to52.bin"

;BC2C

	BlockCurveDownPage1BOTTOMfrom51to52:	equ CurveDownBlock7
	CurveDownPage1BOTTOMChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom51to52.bin"
	CurveDownPage1BOTTOMAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom51to52.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom51to52.bin"

;BF19

	BlockCurveDownPage0TOPfrom52to53:	equ CurveDownBlock7
	CurveDownPage0TOPChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom52to53.bin"
	CurveDownPage0TOPAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom52to53.bin"
	CurveDownPage0TOPWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom52to53.bin"

;BF1A

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveDownBlock8:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveDownPage0BOTTOMfrom52to53:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom52to53.bin"
	CurveDownPage0BOTTOMAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom52to53.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom52to53.bin"

;8652

	BlockCurveDownPage1TOPfrom52to53:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom52to53.bin"
	CurveDownPage1TOPAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom52to53.bin"
	CurveDownPage1TOPWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom52to53.bin"

;8653

	BlockCurveDownPage1BOTTOMfrom52to53:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom52to53.bin"
	CurveDownPage1BOTTOMAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom52to53.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom52to53.bin"

;8CA5

	BlockCurveDownPage0TOPfrom53to54:	equ CurveDownBlock8
	CurveDownPage0TOPChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom53to54.bin"
	CurveDownPage0TOPAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom53to54.bin"
	CurveDownPage0TOPWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom53to54.bin"

;8CA6

	BlockCurveDownPage0BOTTOMfrom53to54:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom53to54.bin"
	CurveDownPage0BOTTOMAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom53to54.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom53to54.bin"

;8E75

	BlockCurveDownPage1TOPfrom53to54:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom53to54.bin"
	CurveDownPage1TOPAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom53to54.bin"
	CurveDownPage1TOPWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom53to54.bin"

;8E76

	BlockCurveDownPage1BOTTOMfrom53to54:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom53to54.bin"
	CurveDownPage1BOTTOMAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom53to54.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom53to54.bin"

;9045

	BlockCurveDownPage0TOPfrom54to55:	equ CurveDownBlock8
	CurveDownPage0TOPChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom54to55.bin"
	CurveDownPage0TOPAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom54to55.bin"
	CurveDownPage0TOPWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom54to55.bin"

;9046

	BlockCurveDownPage0BOTTOMfrom54to55:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom54to55.bin"
	CurveDownPage0BOTTOMAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom54to55.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom54to55.bin"

;962D

	BlockCurveDownPage1TOPfrom54to55:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom54to55.bin"
	CurveDownPage1TOPAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom54to55.bin"
	CurveDownPage1TOPWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom54to55.bin"

;962E

	BlockCurveDownPage1BOTTOMfrom54to55:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom54to55.bin"
	CurveDownPage1BOTTOMAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom54to55.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom54to55.bin"

;9C15

	BlockCurveDownPage0TOPfrom55to56:	equ CurveDownBlock8
	CurveDownPage0TOPChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom55to56.bin"
	CurveDownPage0TOPAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom55to56.bin"
	CurveDownPage0TOPWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom55to56.bin"

;9C16

	BlockCurveDownPage0BOTTOMfrom55to56:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom55to56.bin"
	CurveDownPage0BOTTOMAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom55to56.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom55to56.bin"

;9FA1

	BlockCurveDownPage1TOPfrom55to56:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom55to56.bin"
	CurveDownPage1TOPAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom55to56.bin"
	CurveDownPage1TOPWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom55to56.bin"

;9FA2

	BlockCurveDownPage1BOTTOMfrom55to56:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom55to56.bin"
	CurveDownPage1BOTTOMAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom55to56.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom55to56.bin"

;A32D

	BlockCurveDownPage0TOPfrom56to57:	equ CurveDownBlock8
	CurveDownPage0TOPChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom56to57.bin"
	CurveDownPage0TOPAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom56to57.bin"
	CurveDownPage0TOPWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom56to57.bin"

;A32E

	BlockCurveDownPage0BOTTOMfrom56to57:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom56to57.bin"
	CurveDownPage0BOTTOMAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom56to57.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom56to57.bin"

;A89E

	BlockCurveDownPage1TOPfrom56to57:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom56to57.bin"
	CurveDownPage1TOPAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom56to57.bin"
	CurveDownPage1TOPWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom56to57.bin"

;A89F

	BlockCurveDownPage1BOTTOMfrom56to57:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom56to57.bin"
	CurveDownPage1BOTTOMAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom56to57.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom56to57.bin"

;AE0F

	BlockCurveDownPage0TOPfrom57to58:	equ CurveDownBlock8
	CurveDownPage0TOPChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom57to58.bin"
	CurveDownPage0TOPAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom57to58.bin"
	CurveDownPage0TOPWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom57to58.bin"

;AE10

	BlockCurveDownPage0BOTTOMfrom57to58:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom57to58.bin"
	CurveDownPage0BOTTOMAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom57to58.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom57to58.bin"

;B16C

	BlockCurveDownPage1TOPfrom57to58:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom57to58.bin"
	CurveDownPage1TOPAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom57to58.bin"
	CurveDownPage1TOPWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom57to58.bin"

;B16D

	BlockCurveDownPage1BOTTOMfrom57to58:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom57to58.bin"
	CurveDownPage1BOTTOMAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom57to58.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom57to58.bin"

;B4C9

	BlockCurveDownPage0TOPfrom58to59:	equ CurveDownBlock8
	CurveDownPage0TOPChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPchangedpixelsfrom58to59.bin"
	CurveDownPage0TOPAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPaddressesfrom58to59.bin"
	CurveDownPage0TOPWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\TOPwriteinstructionsfrom58to59.bin"

;B4CA

	BlockCurveDownPage0BOTTOMfrom58to59:	equ CurveDownBlock8
	CurveDownPage0BOTTOMChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMchangedpixelsfrom58to59.bin"
	CurveDownPage0BOTTOMAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMaddressesfrom58to59.bin"
	CurveDownPage0BOTTOMWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage0\BOTTOMwriteinstructionsfrom58to59.bin"

;B9DC

	BlockCurveDownPage1TOPfrom58to59:	equ CurveDownBlock8
	CurveDownPage1TOPChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPchangedpixelsfrom58to59.bin"
	CurveDownPage1TOPAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPaddressesfrom58to59.bin"
	CurveDownPage1TOPWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\TOPwriteinstructionsfrom58to59.bin"

;B9DD

	BlockCurveDownPage1BOTTOMfrom58to59:	equ CurveDownBlock8
	CurveDownPage1BOTTOMChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMchangedpixelsfrom58to59.bin"
	CurveDownPage1BOTTOMAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMaddressesfrom58to59.bin"
	CurveDownPage1BOTTOMWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveDownAnimationPage1\BOTTOMwriteinstructionsfrom58to59.bin"

;BEEF

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

