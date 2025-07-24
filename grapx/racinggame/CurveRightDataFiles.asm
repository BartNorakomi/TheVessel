
CurveRightBlock1:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0TOPfrom0to1:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom0to1.bin"
	CurveRightPage0TOPAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom0to1.bin"
	CurveRightPage0TOPWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom0to1.bin"

;8001

	BlockCurveRightPage0BOTTOMfrom0to1:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom0to1.bin"
	CurveRightPage0BOTTOMAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom0to1.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom0to1.bin"

;8064

	BlockCurveRightPage1TOPfrom0to1:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom0to1.bin"
	CurveRightPage1TOPAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom0to1.bin"
	CurveRightPage1TOPWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom0to1.bin"

;8065

	BlockCurveRightPage1BOTTOMfrom0to1:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom0to1.bin"
	CurveRightPage1BOTTOMAddressesfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom0to1.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom0to1:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom0to1.bin"

;80C8

	BlockCurveRightPage0TOPfrom1to2:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom1to2.bin"
	CurveRightPage0TOPAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom1to2.bin"
	CurveRightPage0TOPWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom1to2.bin"

;80C9

	BlockCurveRightPage0BOTTOMfrom1to2:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom1to2.bin"
	CurveRightPage0BOTTOMAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom1to2.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom1to2.bin"

;816B

	BlockCurveRightPage1TOPfrom1to2:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom1to2.bin"
	CurveRightPage1TOPAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom1to2.bin"
	CurveRightPage1TOPWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom1to2.bin"

;816C

	BlockCurveRightPage1BOTTOMfrom1to2:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom1to2.bin"
	CurveRightPage1BOTTOMAddressesfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom1to2.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom1to2:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom1to2.bin"

;820E

	BlockCurveRightPage0TOPfrom2to3:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom2to3.bin"
	CurveRightPage0TOPAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom2to3.bin"
	CurveRightPage0TOPWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom2to3.bin"

;820F

	BlockCurveRightPage0BOTTOMfrom2to3:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom2to3.bin"
	CurveRightPage0BOTTOMAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom2to3.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom2to3.bin"

;8395

	BlockCurveRightPage1TOPfrom2to3:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom2to3.bin"
	CurveRightPage1TOPAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom2to3.bin"
	CurveRightPage1TOPWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom2to3.bin"

;8396

	BlockCurveRightPage1BOTTOMfrom2to3:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom2to3.bin"
	CurveRightPage1BOTTOMAddressesfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom2to3.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom2to3:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom2to3.bin"

;851C

	BlockCurveRightPage0TOPfrom3to4:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom3to4.bin"
	CurveRightPage0TOPAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom3to4.bin"
	CurveRightPage0TOPWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom3to4.bin"

;851D

	BlockCurveRightPage0BOTTOMfrom3to4:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom3to4.bin"
	CurveRightPage0BOTTOMAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom3to4.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom3to4.bin"

;867B

	BlockCurveRightPage1TOPfrom3to4:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom3to4.bin"
	CurveRightPage1TOPAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom3to4.bin"
	CurveRightPage1TOPWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom3to4.bin"

;867C

	BlockCurveRightPage1BOTTOMfrom3to4:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom3to4.bin"
	CurveRightPage1BOTTOMAddressesfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom3to4.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom3to4:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom3to4.bin"

;87DA

	BlockCurveRightPage0TOPfrom4to5:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom4to5.bin"
	CurveRightPage0TOPAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom4to5.bin"
	CurveRightPage0TOPWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom4to5.bin"

;87DB

	BlockCurveRightPage0BOTTOMfrom4to5:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom4to5.bin"
	CurveRightPage0BOTTOMAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom4to5.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom4to5.bin"

;8F73

	BlockCurveRightPage1TOPfrom4to5:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom4to5.bin"
	CurveRightPage1TOPAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom4to5.bin"
	CurveRightPage1TOPWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom4to5.bin"

;8F74

	BlockCurveRightPage1BOTTOMfrom4to5:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom4to5.bin"
	CurveRightPage1BOTTOMAddressesfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom4to5.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom4to5:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom4to5.bin"

;970C

	BlockCurveRightPage0TOPfrom5to6:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom5to6.bin"
	CurveRightPage0TOPAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom5to6.bin"
	CurveRightPage0TOPWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom5to6.bin"

;970D

	BlockCurveRightPage0BOTTOMfrom5to6:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom5to6.bin"
	CurveRightPage0BOTTOMAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom5to6.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom5to6.bin"

;9F49

	BlockCurveRightPage1TOPfrom5to6:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom5to6.bin"
	CurveRightPage1TOPAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom5to6.bin"
	CurveRightPage1TOPWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom5to6.bin"

;9F4A

	BlockCurveRightPage1BOTTOMfrom5to6:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom5to6.bin"
	CurveRightPage1BOTTOMAddressesfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom5to6.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom5to6:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom5to6.bin"

;A786

	BlockCurveRightPage0TOPfrom6to7:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom6to7.bin"
	CurveRightPage0TOPAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom6to7.bin"
	CurveRightPage0TOPWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom6to7.bin"

;A787

	BlockCurveRightPage0BOTTOMfrom6to7:	equ CurveRightBlock1
	CurveRightPage0BOTTOMChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom6to7.bin"
	CurveRightPage0BOTTOMAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom6to7.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom6to7.bin"

;AFCE

	BlockCurveRightPage1TOPfrom6to7:	equ CurveRightBlock1
	CurveRightPage1TOPChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom6to7.bin"
	CurveRightPage1TOPAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom6to7.bin"
	CurveRightPage1TOPWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom6to7.bin"

;AFCF

	BlockCurveRightPage1BOTTOMfrom6to7:	equ CurveRightBlock1
	CurveRightPage1BOTTOMChangedPixelsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom6to7.bin"
	CurveRightPage1BOTTOMAddressesfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom6to7.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom6to7:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom6to7.bin"

;B816

	BlockCurveRightPage0TOPfrom7to8:	equ CurveRightBlock1
	CurveRightPage0TOPChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom7to8.bin"
	CurveRightPage0TOPAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom7to8.bin"
	CurveRightPage0TOPWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom7to8.bin"

;B817

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock2:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom7to8:	equ CurveRightBlock2
	CurveRightPage0BOTTOMChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom7to8.bin"
	CurveRightPage0BOTTOMAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom7to8.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom7to8.bin"

;8839

	BlockCurveRightPage1TOPfrom7to8:	equ CurveRightBlock2
	CurveRightPage1TOPChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom7to8.bin"
	CurveRightPage1TOPAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom7to8.bin"
	CurveRightPage1TOPWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom7to8.bin"

;883A

	BlockCurveRightPage1BOTTOMfrom7to8:	equ CurveRightBlock2
	CurveRightPage1BOTTOMChangedPixelsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom7to8.bin"
	CurveRightPage1BOTTOMAddressesfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom7to8.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom7to8:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom7to8.bin"

;9073

	BlockCurveRightPage0TOPfrom8to9:	equ CurveRightBlock2
	CurveRightPage0TOPChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom8to9.bin"
	CurveRightPage0TOPAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom8to9.bin"
	CurveRightPage0TOPWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom8to9.bin"

;9074

	BlockCurveRightPage0BOTTOMfrom8to9:	equ CurveRightBlock2
	CurveRightPage0BOTTOMChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom8to9.bin"
	CurveRightPage0BOTTOMAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom8to9.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom8to9.bin"

;991A

	BlockCurveRightPage1TOPfrom8to9:	equ CurveRightBlock2
	CurveRightPage1TOPChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom8to9.bin"
	CurveRightPage1TOPAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom8to9.bin"
	CurveRightPage1TOPWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom8to9.bin"

;991B

	BlockCurveRightPage1BOTTOMfrom8to9:	equ CurveRightBlock2
	CurveRightPage1BOTTOMChangedPixelsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom8to9.bin"
	CurveRightPage1BOTTOMAddressesfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom8to9.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom8to9:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom8to9.bin"

;A1C1

	BlockCurveRightPage0TOPfrom9to10:	equ CurveRightBlock2
	CurveRightPage0TOPChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom9to10.bin"
	CurveRightPage0TOPAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom9to10.bin"
	CurveRightPage0TOPWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom9to10.bin"

;A1C2

	BlockCurveRightPage0BOTTOMfrom9to10:	equ CurveRightBlock2
	CurveRightPage0BOTTOMChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom9to10.bin"
	CurveRightPage0BOTTOMAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom9to10.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom9to10.bin"

;AA64

	BlockCurveRightPage1TOPfrom9to10:	equ CurveRightBlock2
	CurveRightPage1TOPChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom9to10.bin"
	CurveRightPage1TOPAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom9to10.bin"
	CurveRightPage1TOPWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom9to10.bin"

;AA65

	BlockCurveRightPage1BOTTOMfrom9to10:	equ CurveRightBlock2
	CurveRightPage1BOTTOMChangedPixelsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom9to10.bin"
	CurveRightPage1BOTTOMAddressesfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom9to10.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom9to10:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom9to10.bin"

;B307

	BlockCurveRightPage0TOPfrom10to11:	equ CurveRightBlock2
	CurveRightPage0TOPChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom10to11.bin"
	CurveRightPage0TOPAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom10to11.bin"
	CurveRightPage0TOPWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom10to11.bin"

;B308

	BlockCurveRightPage0BOTTOMfrom10to11:	equ CurveRightBlock2
	CurveRightPage0BOTTOMChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom10to11.bin"
	CurveRightPage0BOTTOMAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom10to11.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom10to11.bin"

;BB5C

	BlockCurveRightPage1TOPfrom10to11:	equ CurveRightBlock2
	CurveRightPage1TOPChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom10to11.bin"
	CurveRightPage1TOPAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom10to11.bin"
	CurveRightPage1TOPWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom10to11.bin"

;BB5D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock3:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom10to11:	equ CurveRightBlock3
	CurveRightPage1BOTTOMChangedPixelsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom10to11.bin"
	CurveRightPage1BOTTOMAddressesfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom10to11.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom10to11:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom10to11.bin"

;8854

	BlockCurveRightPage0TOPfrom11to12:	equ CurveRightBlock3
	CurveRightPage0TOPChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom11to12.bin"
	CurveRightPage0TOPAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom11to12.bin"
	CurveRightPage0TOPWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom11to12.bin"

;8855

	BlockCurveRightPage0BOTTOMfrom11to12:	equ CurveRightBlock3
	CurveRightPage0BOTTOMChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom11to12.bin"
	CurveRightPage0BOTTOMAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom11to12.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom11to12.bin"

;90FB

	BlockCurveRightPage1TOPfrom11to12:	equ CurveRightBlock3
	CurveRightPage1TOPChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom11to12.bin"
	CurveRightPage1TOPAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom11to12.bin"
	CurveRightPage1TOPWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom11to12.bin"

;90FC

	BlockCurveRightPage1BOTTOMfrom11to12:	equ CurveRightBlock3
	CurveRightPage1BOTTOMChangedPixelsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom11to12.bin"
	CurveRightPage1BOTTOMAddressesfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom11to12.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom11to12:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom11to12.bin"

;99A2

	BlockCurveRightPage0TOPfrom12to13:	equ CurveRightBlock3
	CurveRightPage0TOPChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom12to13.bin"
	CurveRightPage0TOPAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom12to13.bin"
	CurveRightPage0TOPWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom12to13.bin"

;99A3

	BlockCurveRightPage0BOTTOMfrom12to13:	equ CurveRightBlock3
	CurveRightPage0BOTTOMChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom12to13.bin"
	CurveRightPage0BOTTOMAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom12to13.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom12to13.bin"

;A1DE

	BlockCurveRightPage1TOPfrom12to13:	equ CurveRightBlock3
	CurveRightPage1TOPChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom12to13.bin"
	CurveRightPage1TOPAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom12to13.bin"
	CurveRightPage1TOPWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom12to13.bin"

;A1DF

	BlockCurveRightPage1BOTTOMfrom12to13:	equ CurveRightBlock3
	CurveRightPage1BOTTOMChangedPixelsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom12to13.bin"
	CurveRightPage1BOTTOMAddressesfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom12to13.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom12to13:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom12to13.bin"

;AA1A

	BlockCurveRightPage0TOPfrom13to14:	equ CurveRightBlock3
	CurveRightPage0TOPChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom13to14.bin"
	CurveRightPage0TOPAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom13to14.bin"
	CurveRightPage0TOPWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom13to14.bin"

;AA1B

	BlockCurveRightPage0BOTTOMfrom13to14:	equ CurveRightBlock3
	CurveRightPage0BOTTOMChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom13to14.bin"
	CurveRightPage0BOTTOMAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom13to14.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom13to14.bin"

;B30C

	BlockCurveRightPage1TOPfrom13to14:	equ CurveRightBlock3
	CurveRightPage1TOPChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom13to14.bin"
	CurveRightPage1TOPAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom13to14.bin"
	CurveRightPage1TOPWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom13to14.bin"

;B30D

	BlockCurveRightPage1BOTTOMfrom13to14:	equ CurveRightBlock3
	CurveRightPage1BOTTOMChangedPixelsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom13to14.bin"
	CurveRightPage1BOTTOMAddressesfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom13to14.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom13to14:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom13to14.bin"

;BBFE

	BlockCurveRightPage0TOPfrom14to15:	equ CurveRightBlock3
	CurveRightPage0TOPChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom14to15.bin"
	CurveRightPage0TOPAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom14to15.bin"
	CurveRightPage0TOPWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom14to15.bin"

;BBFF

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock4:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom14to15:	equ CurveRightBlock4
	CurveRightPage0BOTTOMChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom14to15.bin"
	CurveRightPage0BOTTOMAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom14to15.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom14to15.bin"

;8889

	BlockCurveRightPage1TOPfrom14to15:	equ CurveRightBlock4
	CurveRightPage1TOPChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom14to15.bin"
	CurveRightPage1TOPAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom14to15.bin"
	CurveRightPage1TOPWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom14to15.bin"

;888A

	BlockCurveRightPage1BOTTOMfrom14to15:	equ CurveRightBlock4
	CurveRightPage1BOTTOMChangedPixelsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom14to15.bin"
	CurveRightPage1BOTTOMAddressesfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom14to15.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom14to15:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom14to15.bin"

;9113

	BlockCurveRightPage0TOPfrom15to16:	equ CurveRightBlock4
	CurveRightPage0TOPChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom15to16.bin"
	CurveRightPage0TOPAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom15to16.bin"
	CurveRightPage0TOPWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom15to16.bin"

;9114

	BlockCurveRightPage0BOTTOMfrom15to16:	equ CurveRightBlock4
	CurveRightPage0BOTTOMChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom15to16.bin"
	CurveRightPage0BOTTOMAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom15to16.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom15to16.bin"

;9935

	BlockCurveRightPage1TOPfrom15to16:	equ CurveRightBlock4
	CurveRightPage1TOPChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom15to16.bin"
	CurveRightPage1TOPAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom15to16.bin"
	CurveRightPage1TOPWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom15to16.bin"

;9936

	BlockCurveRightPage1BOTTOMfrom15to16:	equ CurveRightBlock4
	CurveRightPage1BOTTOMChangedPixelsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom15to16.bin"
	CurveRightPage1BOTTOMAddressesfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom15to16.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom15to16:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom15to16.bin"

;A157

	BlockCurveRightPage0TOPfrom16to17:	equ CurveRightBlock4
	CurveRightPage0TOPChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom16to17.bin"
	CurveRightPage0TOPAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom16to17.bin"
	CurveRightPage0TOPWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom16to17.bin"

;A158

	BlockCurveRightPage0BOTTOMfrom16to17:	equ CurveRightBlock4
	CurveRightPage0BOTTOMChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom16to17.bin"
	CurveRightPage0BOTTOMAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom16to17.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom16to17.bin"

;AA7F

	BlockCurveRightPage1TOPfrom16to17:	equ CurveRightBlock4
	CurveRightPage1TOPChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom16to17.bin"
	CurveRightPage1TOPAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom16to17.bin"
	CurveRightPage1TOPWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom16to17.bin"

;AA80

	BlockCurveRightPage1BOTTOMfrom16to17:	equ CurveRightBlock4
	CurveRightPage1BOTTOMChangedPixelsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom16to17.bin"
	CurveRightPage1BOTTOMAddressesfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom16to17.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom16to17:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom16to17.bin"

;B3A7

	BlockCurveRightPage0TOPfrom17to18:	equ CurveRightBlock4
	CurveRightPage0TOPChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom17to18.bin"
	CurveRightPage0TOPAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom17to18.bin"
	CurveRightPage0TOPWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom17to18.bin"

;B3A8

	BlockCurveRightPage0BOTTOMfrom17to18:	equ CurveRightBlock4
	CurveRightPage0BOTTOMChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom17to18.bin"
	CurveRightPage0BOTTOMAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom17to18.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom17to18.bin"

;BBF0

	BlockCurveRightPage1TOPfrom17to18:	equ CurveRightBlock4
	CurveRightPage1TOPChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom17to18.bin"
	CurveRightPage1TOPAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom17to18.bin"
	CurveRightPage1TOPWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom17to18.bin"

;BBF1

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock5:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom17to18:	equ CurveRightBlock5
	CurveRightPage1BOTTOMChangedPixelsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom17to18.bin"
	CurveRightPage1BOTTOMAddressesfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom17to18.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom17to18:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom17to18.bin"

;8848

	BlockCurveRightPage0TOPfrom18to19:	equ CurveRightBlock5
	CurveRightPage0TOPChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom18to19.bin"
	CurveRightPage0TOPAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom18to19.bin"
	CurveRightPage0TOPWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom18to19.bin"

;8849

	BlockCurveRightPage0BOTTOMfrom18to19:	equ CurveRightBlock5
	CurveRightPage0BOTTOMChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom18to19.bin"
	CurveRightPage0BOTTOMAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom18to19.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom18to19.bin"

;90A0

	BlockCurveRightPage1TOPfrom18to19:	equ CurveRightBlock5
	CurveRightPage1TOPChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom18to19.bin"
	CurveRightPage1TOPAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom18to19.bin"
	CurveRightPage1TOPWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom18to19.bin"

;90A1

	BlockCurveRightPage1BOTTOMfrom18to19:	equ CurveRightBlock5
	CurveRightPage1BOTTOMChangedPixelsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom18to19.bin"
	CurveRightPage1BOTTOMAddressesfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom18to19.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom18to19:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom18to19.bin"

;98F8

	BlockCurveRightPage0TOPfrom19to20:	equ CurveRightBlock5
	CurveRightPage0TOPChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom19to20.bin"
	CurveRightPage0TOPAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom19to20.bin"
	CurveRightPage0TOPWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom19to20.bin"

;98F9

	BlockCurveRightPage0BOTTOMfrom19to20:	equ CurveRightBlock5
	CurveRightPage0BOTTOMChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom19to20.bin"
	CurveRightPage0BOTTOMAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom19to20.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom19to20.bin"

;A206

	BlockCurveRightPage1TOPfrom19to20:	equ CurveRightBlock5
	CurveRightPage1TOPChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom19to20.bin"
	CurveRightPage1TOPAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom19to20.bin"
	CurveRightPage1TOPWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom19to20.bin"

;A207

	BlockCurveRightPage1BOTTOMfrom19to20:	equ CurveRightBlock5
	CurveRightPage1BOTTOMChangedPixelsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom19to20.bin"
	CurveRightPage1BOTTOMAddressesfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom19to20.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom19to20:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom19to20.bin"

;AB14

	BlockCurveRightPage0TOPfrom20to21:	equ CurveRightBlock5
	CurveRightPage0TOPChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom20to21.bin"
	CurveRightPage0TOPAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom20to21.bin"
	CurveRightPage0TOPWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom20to21.bin"

;AB15

	BlockCurveRightPage0BOTTOMfrom20to21:	equ CurveRightBlock5
	CurveRightPage0BOTTOMChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom20to21.bin"
	CurveRightPage0BOTTOMAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom20to21.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom20to21.bin"

;B3A0

	BlockCurveRightPage1TOPfrom20to21:	equ CurveRightBlock5
	CurveRightPage1TOPChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom20to21.bin"
	CurveRightPage1TOPAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom20to21.bin"
	CurveRightPage1TOPWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom20to21.bin"

;B3A1

	BlockCurveRightPage1BOTTOMfrom20to21:	equ CurveRightBlock5
	CurveRightPage1BOTTOMChangedPixelsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom20to21.bin"
	CurveRightPage1BOTTOMAddressesfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom20to21.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom20to21:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom20to21.bin"

;BC2C

	BlockCurveRightPage0TOPfrom21to22:	equ CurveRightBlock5
	CurveRightPage0TOPChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom21to22.bin"
	CurveRightPage0TOPAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom21to22.bin"
	CurveRightPage0TOPWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom21to22.bin"

;BC2D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock6:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom21to22:	equ CurveRightBlock6
	CurveRightPage0BOTTOMChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom21to22.bin"
	CurveRightPage0BOTTOMAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom21to22.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom21to22.bin"

;8842

	BlockCurveRightPage1TOPfrom21to22:	equ CurveRightBlock6
	CurveRightPage1TOPChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom21to22.bin"
	CurveRightPage1TOPAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom21to22.bin"
	CurveRightPage1TOPWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom21to22.bin"

;8843

	BlockCurveRightPage1BOTTOMfrom21to22:	equ CurveRightBlock6
	CurveRightPage1BOTTOMChangedPixelsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom21to22.bin"
	CurveRightPage1BOTTOMAddressesfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom21to22.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom21to22:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom21to22.bin"

;9085

	BlockCurveRightPage0TOPfrom22to23:	equ CurveRightBlock6
	CurveRightPage0TOPChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom22to23.bin"
	CurveRightPage0TOPAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom22to23.bin"
	CurveRightPage0TOPWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom22to23.bin"

;9086

	BlockCurveRightPage0BOTTOMfrom22to23:	equ CurveRightBlock6
	CurveRightPage0BOTTOMChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom22to23.bin"
	CurveRightPage0BOTTOMAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom22to23.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom22to23.bin"

;98FB

	BlockCurveRightPage1TOPfrom22to23:	equ CurveRightBlock6
	CurveRightPage1TOPChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom22to23.bin"
	CurveRightPage1TOPAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom22to23.bin"
	CurveRightPage1TOPWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom22to23.bin"

;98FC

	BlockCurveRightPage1BOTTOMfrom22to23:	equ CurveRightBlock6
	CurveRightPage1BOTTOMChangedPixelsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom22to23.bin"
	CurveRightPage1BOTTOMAddressesfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom22to23.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom22to23:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom22to23.bin"

;A171

	BlockCurveRightPage0TOPfrom23to24:	equ CurveRightBlock6
	CurveRightPage0TOPChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom23to24.bin"
	CurveRightPage0TOPAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom23to24.bin"
	CurveRightPage0TOPWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom23to24.bin"

;A172

	BlockCurveRightPage0BOTTOMfrom23to24:	equ CurveRightBlock6
	CurveRightPage0BOTTOMChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom23to24.bin"
	CurveRightPage0BOTTOMAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom23to24.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom23to24.bin"

;AAD7

	BlockCurveRightPage1TOPfrom23to24:	equ CurveRightBlock6
	CurveRightPage1TOPChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom23to24.bin"
	CurveRightPage1TOPAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom23to24.bin"
	CurveRightPage1TOPWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom23to24.bin"

;AAD8

	BlockCurveRightPage1BOTTOMfrom23to24:	equ CurveRightBlock6
	CurveRightPage1BOTTOMChangedPixelsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom23to24.bin"
	CurveRightPage1BOTTOMAddressesfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom23to24.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom23to24:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom23to24.bin"

;B43D

	BlockCurveRightPage0TOPfrom24to25:	equ CurveRightBlock6
	CurveRightPage0TOPChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom24to25.bin"
	CurveRightPage0TOPAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom24to25.bin"
	CurveRightPage0TOPWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom24to25.bin"

;B43E

	BlockCurveRightPage0BOTTOMfrom24to25:	equ CurveRightBlock6
	CurveRightPage0BOTTOMChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom24to25.bin"
	CurveRightPage0BOTTOMAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom24to25.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom24to25.bin"

;BD31

	BlockCurveRightPage1TOPfrom24to25:	equ CurveRightBlock6
	CurveRightPage1TOPChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom24to25.bin"
	CurveRightPage1TOPAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom24to25.bin"
	CurveRightPage1TOPWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom24to25.bin"

;BD32

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock7:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom24to25:	equ CurveRightBlock7
	CurveRightPage1BOTTOMChangedPixelsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom24to25.bin"
	CurveRightPage1BOTTOMAddressesfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom24to25.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom24to25:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom24to25.bin"

;88F3

	BlockCurveRightPage0TOPfrom25to26:	equ CurveRightBlock7
	CurveRightPage0TOPChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom25to26.bin"
	CurveRightPage0TOPAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom25to26.bin"
	CurveRightPage0TOPWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom25to26.bin"

;88F4

	BlockCurveRightPage0BOTTOMfrom25to26:	equ CurveRightBlock7
	CurveRightPage0BOTTOMChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom25to26.bin"
	CurveRightPage0BOTTOMAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom25to26.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom25to26.bin"

;90E4

	BlockCurveRightPage1TOPfrom25to26:	equ CurveRightBlock7
	CurveRightPage1TOPChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom25to26.bin"
	CurveRightPage1TOPAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom25to26.bin"
	CurveRightPage1TOPWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom25to26.bin"

;90E5

	BlockCurveRightPage1BOTTOMfrom25to26:	equ CurveRightBlock7
	CurveRightPage1BOTTOMChangedPixelsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom25to26.bin"
	CurveRightPage1BOTTOMAddressesfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom25to26.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom25to26:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom25to26.bin"

;98D5

	BlockCurveRightPage0TOPfrom26to27:	equ CurveRightBlock7
	CurveRightPage0TOPChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom26to27.bin"
	CurveRightPage0TOPAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom26to27.bin"
	CurveRightPage0TOPWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom26to27.bin"

;98D6

	BlockCurveRightPage0BOTTOMfrom26to27:	equ CurveRightBlock7
	CurveRightPage0BOTTOMChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom26to27.bin"
	CurveRightPage0BOTTOMAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom26to27.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom26to27.bin"

;A221

	BlockCurveRightPage1TOPfrom26to27:	equ CurveRightBlock7
	CurveRightPage1TOPChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom26to27.bin"
	CurveRightPage1TOPAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom26to27.bin"
	CurveRightPage1TOPWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom26to27.bin"

;A222

	BlockCurveRightPage1BOTTOMfrom26to27:	equ CurveRightBlock7
	CurveRightPage1BOTTOMChangedPixelsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom26to27.bin"
	CurveRightPage1BOTTOMAddressesfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom26to27.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom26to27:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom26to27.bin"

;AB6D

	BlockCurveRightPage0TOPfrom27to28:	equ CurveRightBlock7
	CurveRightPage0TOPChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom27to28.bin"
	CurveRightPage0TOPAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom27to28.bin"
	CurveRightPage0TOPWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom27to28.bin"

;AB6E

	BlockCurveRightPage0BOTTOMfrom27to28:	equ CurveRightBlock7
	CurveRightPage0BOTTOMChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom27to28.bin"
	CurveRightPage0BOTTOMAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom27to28.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom27to28.bin"

;B328

	BlockCurveRightPage1TOPfrom27to28:	equ CurveRightBlock7
	CurveRightPage1TOPChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom27to28.bin"
	CurveRightPage1TOPAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom27to28.bin"
	CurveRightPage1TOPWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom27to28.bin"

;B329

	BlockCurveRightPage1BOTTOMfrom27to28:	equ CurveRightBlock7
	CurveRightPage1BOTTOMChangedPixelsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom27to28.bin"
	CurveRightPage1BOTTOMAddressesfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom27to28.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom27to28:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom27to28.bin"

;BAE3

	BlockCurveRightPage0TOPfrom28to29:	equ CurveRightBlock7
	CurveRightPage0TOPChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom28to29.bin"
	CurveRightPage0TOPAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom28to29.bin"
	CurveRightPage0TOPWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom28to29.bin"

;BAE4

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock8:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom28to29:	equ CurveRightBlock8
	CurveRightPage0BOTTOMChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom28to29.bin"
	CurveRightPage0BOTTOMAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom28to29.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom28to29.bin"

;87B9

	BlockCurveRightPage1TOPfrom28to29:	equ CurveRightBlock8
	CurveRightPage1TOPChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom28to29.bin"
	CurveRightPage1TOPAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom28to29.bin"
	CurveRightPage1TOPWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom28to29.bin"

;87BA

	BlockCurveRightPage1BOTTOMfrom28to29:	equ CurveRightBlock8
	CurveRightPage1BOTTOMChangedPixelsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom28to29.bin"
	CurveRightPage1BOTTOMAddressesfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom28to29.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom28to29:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom28to29.bin"

;8F73

	BlockCurveRightPage0TOPfrom29to30:	equ CurveRightBlock8
	CurveRightPage0TOPChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom29to30.bin"
	CurveRightPage0TOPAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom29to30.bin"
	CurveRightPage0TOPWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom29to30.bin"

;8F74

	BlockCurveRightPage0BOTTOMfrom29to30:	equ CurveRightBlock8
	CurveRightPage0BOTTOMChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom29to30.bin"
	CurveRightPage0BOTTOMAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom29to30.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom29to30.bin"

;99C4

	BlockCurveRightPage1TOPfrom29to30:	equ CurveRightBlock8
	CurveRightPage1TOPChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom29to30.bin"
	CurveRightPage1TOPAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom29to30.bin"
	CurveRightPage1TOPWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom29to30.bin"

;99C5

	BlockCurveRightPage1BOTTOMfrom29to30:	equ CurveRightBlock8
	CurveRightPage1BOTTOMChangedPixelsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom29to30.bin"
	CurveRightPage1BOTTOMAddressesfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom29to30.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom29to30:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom29to30.bin"

;A415

	BlockCurveRightPage0TOPfrom30to31:	equ CurveRightBlock8
	CurveRightPage0TOPChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom30to31.bin"
	CurveRightPage0TOPAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom30to31.bin"
	CurveRightPage0TOPWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom30to31.bin"

;A416

	BlockCurveRightPage0BOTTOMfrom30to31:	equ CurveRightBlock8
	CurveRightPage0BOTTOMChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom30to31.bin"
	CurveRightPage0BOTTOMAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom30to31.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom30to31.bin"

;AC1E

	BlockCurveRightPage1TOPfrom30to31:	equ CurveRightBlock8
	CurveRightPage1TOPChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom30to31.bin"
	CurveRightPage1TOPAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom30to31.bin"
	CurveRightPage1TOPWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom30to31.bin"

;AC1F

	BlockCurveRightPage1BOTTOMfrom30to31:	equ CurveRightBlock8
	CurveRightPage1BOTTOMChangedPixelsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom30to31.bin"
	CurveRightPage1BOTTOMAddressesfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom30to31.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom30to31:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom30to31.bin"

;B427

	BlockCurveRightPage0TOPfrom31to32:	equ CurveRightBlock8
	CurveRightPage0TOPChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom31to32.bin"
	CurveRightPage0TOPAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom31to32.bin"
	CurveRightPage0TOPWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom31to32.bin"

;B428

	BlockCurveRightPage0BOTTOMfrom31to32:	equ CurveRightBlock8
	CurveRightPage0BOTTOMChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom31to32.bin"
	CurveRightPage0BOTTOMAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom31to32.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom31to32.bin"

;BC72

	BlockCurveRightPage1TOPfrom31to32:	equ CurveRightBlock8
	CurveRightPage1TOPChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom31to32.bin"
	CurveRightPage1TOPAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom31to32.bin"
	CurveRightPage1TOPWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom31to32.bin"

;BC73

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock9:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom31to32:	equ CurveRightBlock9
	CurveRightPage1BOTTOMChangedPixelsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom31to32.bin"
	CurveRightPage1BOTTOMAddressesfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom31to32.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom31to32:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom31to32.bin"

;884A

	BlockCurveRightPage0TOPfrom32to33:	equ CurveRightBlock9
	CurveRightPage0TOPChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom32to33.bin"
	CurveRightPage0TOPAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom32to33.bin"
	CurveRightPage0TOPWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom32to33.bin"

;884B

	BlockCurveRightPage0BOTTOMfrom32to33:	equ CurveRightBlock9
	CurveRightPage0BOTTOMChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom32to33.bin"
	CurveRightPage0BOTTOMAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom32to33.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom32to33.bin"

;90E7

	BlockCurveRightPage1TOPfrom32to33:	equ CurveRightBlock9
	CurveRightPage1TOPChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom32to33.bin"
	CurveRightPage1TOPAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom32to33.bin"
	CurveRightPage1TOPWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom32to33.bin"

;90E8

	BlockCurveRightPage1BOTTOMfrom32to33:	equ CurveRightBlock9
	CurveRightPage1BOTTOMChangedPixelsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom32to33.bin"
	CurveRightPage1BOTTOMAddressesfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom32to33.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom32to33:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom32to33.bin"

;9984

	BlockCurveRightPage0TOPfrom33to34:	equ CurveRightBlock9
	CurveRightPage0TOPChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom33to34.bin"
	CurveRightPage0TOPAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom33to34.bin"
	CurveRightPage0TOPWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom33to34.bin"

;9985

	BlockCurveRightPage0BOTTOMfrom33to34:	equ CurveRightBlock9
	CurveRightPage0BOTTOMChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom33to34.bin"
	CurveRightPage0BOTTOMAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom33to34.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom33to34.bin"

;A31F

	BlockCurveRightPage1TOPfrom33to34:	equ CurveRightBlock9
	CurveRightPage1TOPChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom33to34.bin"
	CurveRightPage1TOPAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom33to34.bin"
	CurveRightPage1TOPWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom33to34.bin"

;A320

	BlockCurveRightPage1BOTTOMfrom33to34:	equ CurveRightBlock9
	CurveRightPage1BOTTOMChangedPixelsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom33to34.bin"
	CurveRightPage1BOTTOMAddressesfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom33to34.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom33to34:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom33to34.bin"

;ACBA

	BlockCurveRightPage0TOPfrom34to35:	equ CurveRightBlock9
	CurveRightPage0TOPChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom34to35.bin"
	CurveRightPage0TOPAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom34to35.bin"
	CurveRightPage0TOPWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom34to35.bin"

;ACBB

	BlockCurveRightPage0BOTTOMfrom34to35:	equ CurveRightBlock9
	CurveRightPage0BOTTOMChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom34to35.bin"
	CurveRightPage0BOTTOMAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom34to35.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom34to35.bin"

;B473

	BlockCurveRightPage1TOPfrom34to35:	equ CurveRightBlock9
	CurveRightPage1TOPChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom34to35.bin"
	CurveRightPage1TOPAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom34to35.bin"
	CurveRightPage1TOPWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom34to35.bin"

;B474

	BlockCurveRightPage1BOTTOMfrom34to35:	equ CurveRightBlock9
	CurveRightPage1BOTTOMChangedPixelsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom34to35.bin"
	CurveRightPage1BOTTOMAddressesfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom34to35.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom34to35:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom34to35.bin"

;BC2C

	BlockCurveRightPage0TOPfrom35to36:	equ CurveRightBlock9
	CurveRightPage0TOPChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom35to36.bin"
	CurveRightPage0TOPAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom35to36.bin"
	CurveRightPage0TOPWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom35to36.bin"

;BC2D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock10:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom35to36:	equ CurveRightBlock10
	CurveRightPage0BOTTOMChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom35to36.bin"
	CurveRightPage0BOTTOMAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom35to36.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom35to36.bin"

;8912

	BlockCurveRightPage1TOPfrom35to36:	equ CurveRightBlock10
	CurveRightPage1TOPChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom35to36.bin"
	CurveRightPage1TOPAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom35to36.bin"
	CurveRightPage1TOPWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom35to36.bin"

;8913

	BlockCurveRightPage1BOTTOMfrom35to36:	equ CurveRightBlock10
	CurveRightPage1BOTTOMChangedPixelsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom35to36.bin"
	CurveRightPage1BOTTOMAddressesfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom35to36.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom35to36:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom35to36.bin"

;9225

	BlockCurveRightPage0TOPfrom36to37:	equ CurveRightBlock10
	CurveRightPage0TOPChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom36to37.bin"
	CurveRightPage0TOPAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom36to37.bin"
	CurveRightPage0TOPWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom36to37.bin"

;9226

	BlockCurveRightPage0BOTTOMfrom36to37:	equ CurveRightBlock10
	CurveRightPage0BOTTOMChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom36to37.bin"
	CurveRightPage0BOTTOMAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom36to37.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom36to37.bin"

;9A70

	BlockCurveRightPage1TOPfrom36to37:	equ CurveRightBlock10
	CurveRightPage1TOPChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom36to37.bin"
	CurveRightPage1TOPAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom36to37.bin"
	CurveRightPage1TOPWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom36to37.bin"

;9A71

	BlockCurveRightPage1BOTTOMfrom36to37:	equ CurveRightBlock10
	CurveRightPage1BOTTOMChangedPixelsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom36to37.bin"
	CurveRightPage1BOTTOMAddressesfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom36to37.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom36to37:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom36to37.bin"

;A2BB

	BlockCurveRightPage0TOPfrom37to38:	equ CurveRightBlock10
	CurveRightPage0TOPChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom37to38.bin"
	CurveRightPage0TOPAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom37to38.bin"
	CurveRightPage0TOPWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom37to38.bin"

;A2BC

	BlockCurveRightPage0BOTTOMfrom37to38:	equ CurveRightBlock10
	CurveRightPage0BOTTOMChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom37to38.bin"
	CurveRightPage0BOTTOMAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom37to38.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom37to38.bin"

;ABC6

	BlockCurveRightPage1TOPfrom37to38:	equ CurveRightBlock10
	CurveRightPage1TOPChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom37to38.bin"
	CurveRightPage1TOPAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom37to38.bin"
	CurveRightPage1TOPWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom37to38.bin"

;ABC7

	BlockCurveRightPage1BOTTOMfrom37to38:	equ CurveRightBlock10
	CurveRightPage1BOTTOMChangedPixelsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom37to38.bin"
	CurveRightPage1BOTTOMAddressesfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom37to38.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom37to38:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom37to38.bin"

;B4D1

	BlockCurveRightPage0TOPfrom38to39:	equ CurveRightBlock10
	CurveRightPage0TOPChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom38to39.bin"
	CurveRightPage0TOPAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom38to39.bin"
	CurveRightPage0TOPWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom38to39.bin"

;B4D2

	BlockCurveRightPage0BOTTOMfrom38to39:	equ CurveRightBlock10
	CurveRightPage0BOTTOMChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom38to39.bin"
	CurveRightPage0BOTTOMAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom38to39.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom38to39.bin"

;BD0E

	BlockCurveRightPage1TOPfrom38to39:	equ CurveRightBlock10
	CurveRightPage1TOPChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom38to39.bin"
	CurveRightPage1TOPAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom38to39.bin"
	CurveRightPage1TOPWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom38to39.bin"

;BD0F

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock11:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom38to39:	equ CurveRightBlock11
	CurveRightPage1BOTTOMChangedPixelsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom38to39.bin"
	CurveRightPage1BOTTOMAddressesfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom38to39.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom38to39:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom38to39.bin"

;883C

	BlockCurveRightPage0TOPfrom39to40:	equ CurveRightBlock11
	CurveRightPage0TOPChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom39to40.bin"
	CurveRightPage0TOPAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom39to40.bin"
	CurveRightPage0TOPWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom39to40.bin"

;883D

	BlockCurveRightPage0BOTTOMfrom39to40:	equ CurveRightBlock11
	CurveRightPage0BOTTOMChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom39to40.bin"
	CurveRightPage0BOTTOMAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom39to40.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom39to40.bin"

;91C0

	BlockCurveRightPage1TOPfrom39to40:	equ CurveRightBlock11
	CurveRightPage1TOPChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom39to40.bin"
	CurveRightPage1TOPAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom39to40.bin"
	CurveRightPage1TOPWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom39to40.bin"

;91C1

	BlockCurveRightPage1BOTTOMfrom39to40:	equ CurveRightBlock11
	CurveRightPage1BOTTOMChangedPixelsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom39to40.bin"
	CurveRightPage1BOTTOMAddressesfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom39to40.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom39to40:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom39to40.bin"

;9B44

	BlockCurveRightPage0TOPfrom40to41:	equ CurveRightBlock11
	CurveRightPage0TOPChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom40to41.bin"
	CurveRightPage0TOPAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom40to41.bin"
	CurveRightPage0TOPWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom40to41.bin"

;9B45

	BlockCurveRightPage0BOTTOMfrom40to41:	equ CurveRightBlock11
	CurveRightPage0BOTTOMChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom40to41.bin"
	CurveRightPage0BOTTOMAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom40to41.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom40to41.bin"

;A2AF

	BlockCurveRightPage1TOPfrom40to41:	equ CurveRightBlock11
	CurveRightPage1TOPChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom40to41.bin"
	CurveRightPage1TOPAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom40to41.bin"
	CurveRightPage1TOPWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom40to41.bin"

;A2B0

	BlockCurveRightPage1BOTTOMfrom40to41:	equ CurveRightBlock11
	CurveRightPage1BOTTOMChangedPixelsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom40to41.bin"
	CurveRightPage1BOTTOMAddressesfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom40to41.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom40to41:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom40to41.bin"

;AA1A

	BlockCurveRightPage0TOPfrom41to42:	equ CurveRightBlock11
	CurveRightPage0TOPChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom41to42.bin"
	CurveRightPage0TOPAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom41to42.bin"
	CurveRightPage0TOPWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom41to42.bin"

;AA1B

	BlockCurveRightPage0BOTTOMfrom41to42:	equ CurveRightBlock11
	CurveRightPage0BOTTOMChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom41to42.bin"
	CurveRightPage0BOTTOMAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom41to42.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom41to42.bin"

;B3F4

	BlockCurveRightPage1TOPfrom41to42:	equ CurveRightBlock11
	CurveRightPage1TOPChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom41to42.bin"
	CurveRightPage1TOPAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom41to42.bin"
	CurveRightPage1TOPWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom41to42.bin"

;B3F5

	BlockCurveRightPage1BOTTOMfrom41to42:	equ CurveRightBlock11
	CurveRightPage1BOTTOMChangedPixelsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom41to42.bin"
	CurveRightPage1BOTTOMAddressesfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom41to42.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom41to42:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom41to42.bin"

;BDCE

	BlockCurveRightPage0TOPfrom42to43:	equ CurveRightBlock11
	CurveRightPage0TOPChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom42to43.bin"
	CurveRightPage0TOPAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom42to43.bin"
	CurveRightPage0TOPWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom42to43.bin"

;BDCF

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock12:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom42to43:	equ CurveRightBlock12
	CurveRightPage0BOTTOMChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom42to43.bin"
	CurveRightPage0BOTTOMAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom42to43.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom42to43.bin"

;87DB

	BlockCurveRightPage1TOPfrom42to43:	equ CurveRightBlock12
	CurveRightPage1TOPChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom42to43.bin"
	CurveRightPage1TOPAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom42to43.bin"
	CurveRightPage1TOPWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom42to43.bin"

;87DC

	BlockCurveRightPage1BOTTOMfrom42to43:	equ CurveRightBlock12
	CurveRightPage1BOTTOMChangedPixelsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom42to43.bin"
	CurveRightPage1BOTTOMAddressesfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom42to43.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom42to43:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom42to43.bin"

;8FB7

	BlockCurveRightPage0TOPfrom43to44:	equ CurveRightBlock12
	CurveRightPage0TOPChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom43to44.bin"
	CurveRightPage0TOPAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom43to44.bin"
	CurveRightPage0TOPWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom43to44.bin"

;8FB8

	BlockCurveRightPage0BOTTOMfrom43to44:	equ CurveRightBlock12
	CurveRightPage0BOTTOMChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom43to44.bin"
	CurveRightPage0BOTTOMAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom43to44.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom43to44.bin"

;97E8

	BlockCurveRightPage1TOPfrom43to44:	equ CurveRightBlock12
	CurveRightPage1TOPChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom43to44.bin"
	CurveRightPage1TOPAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom43to44.bin"
	CurveRightPage1TOPWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom43to44.bin"

;97E9

	BlockCurveRightPage1BOTTOMfrom43to44:	equ CurveRightBlock12
	CurveRightPage1BOTTOMChangedPixelsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom43to44.bin"
	CurveRightPage1BOTTOMAddressesfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom43to44.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom43to44:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom43to44.bin"

;A019

	BlockCurveRightPage0TOPfrom44to45:	equ CurveRightBlock12
	CurveRightPage0TOPChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom44to45.bin"
	CurveRightPage0TOPAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom44to45.bin"
	CurveRightPage0TOPWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom44to45.bin"

;A01A

	BlockCurveRightPage0BOTTOMfrom44to45:	equ CurveRightBlock12
	CurveRightPage0BOTTOMChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom44to45.bin"
	CurveRightPage0BOTTOMAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom44to45.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom44to45.bin"

;A9FA

	BlockCurveRightPage1TOPfrom44to45:	equ CurveRightBlock12
	CurveRightPage1TOPChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom44to45.bin"
	CurveRightPage1TOPAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom44to45.bin"
	CurveRightPage1TOPWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom44to45.bin"

;A9FB

	BlockCurveRightPage1BOTTOMfrom44to45:	equ CurveRightBlock12
	CurveRightPage1BOTTOMChangedPixelsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom44to45.bin"
	CurveRightPage1BOTTOMAddressesfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom44to45.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom44to45:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom44to45.bin"

;B3DB

	BlockCurveRightPage0TOPfrom45to46:	equ CurveRightBlock12
	CurveRightPage0TOPChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom45to46.bin"
	CurveRightPage0TOPAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom45to46.bin"
	CurveRightPage0TOPWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom45to46.bin"

;B3DC

	BlockCurveRightPage0BOTTOMfrom45to46:	equ CurveRightBlock12
	CurveRightPage0BOTTOMChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom45to46.bin"
	CurveRightPage0BOTTOMAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom45to46.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom45to46.bin"

;BB5C

	BlockCurveRightPage1TOPfrom45to46:	equ CurveRightBlock12
	CurveRightPage1TOPChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom45to46.bin"
	CurveRightPage1TOPAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom45to46.bin"
	CurveRightPage1TOPWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom45to46.bin"

;BB5D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock13:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom45to46:	equ CurveRightBlock13
	CurveRightPage1BOTTOMChangedPixelsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom45to46.bin"
	CurveRightPage1BOTTOMAddressesfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom45to46.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom45to46:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom45to46.bin"

;8780

	BlockCurveRightPage0TOPfrom46to47:	equ CurveRightBlock13
	CurveRightPage0TOPChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom46to47.bin"
	CurveRightPage0TOPAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom46to47.bin"
	CurveRightPage0TOPWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom46to47.bin"

;8781

	BlockCurveRightPage0BOTTOMfrom46to47:	equ CurveRightBlock13
	CurveRightPage0BOTTOMChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom46to47.bin"
	CurveRightPage0BOTTOMAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom46to47.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom46to47.bin"

;91AF

	BlockCurveRightPage1TOPfrom46to47:	equ CurveRightBlock13
	CurveRightPage1TOPChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom46to47.bin"
	CurveRightPage1TOPAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom46to47.bin"
	CurveRightPage1TOPWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom46to47.bin"

;91B0

	BlockCurveRightPage1BOTTOMfrom46to47:	equ CurveRightBlock13
	CurveRightPage1BOTTOMChangedPixelsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom46to47.bin"
	CurveRightPage1BOTTOMAddressesfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom46to47.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom46to47:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom46to47.bin"

;9BDE

	BlockCurveRightPage0TOPfrom47to48:	equ CurveRightBlock13
	CurveRightPage0TOPChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom47to48.bin"
	CurveRightPage0TOPAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom47to48.bin"
	CurveRightPage0TOPWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom47to48.bin"

;9BDF

	BlockCurveRightPage0BOTTOMfrom47to48:	equ CurveRightBlock13
	CurveRightPage0BOTTOMChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom47to48.bin"
	CurveRightPage0BOTTOMAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom47to48.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom47to48.bin"

;A387

	BlockCurveRightPage1TOPfrom47to48:	equ CurveRightBlock13
	CurveRightPage1TOPChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom47to48.bin"
	CurveRightPage1TOPAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom47to48.bin"
	CurveRightPage1TOPWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom47to48.bin"

;A388

	BlockCurveRightPage1BOTTOMfrom47to48:	equ CurveRightBlock13
	CurveRightPage1BOTTOMChangedPixelsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom47to48.bin"
	CurveRightPage1BOTTOMAddressesfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom47to48.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom47to48:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom47to48.bin"

;AB30

	BlockCurveRightPage0TOPfrom48to49:	equ CurveRightBlock13
	CurveRightPage0TOPChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom48to49.bin"
	CurveRightPage0TOPAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom48to49.bin"
	CurveRightPage0TOPWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom48to49.bin"

;AB31

	BlockCurveRightPage0BOTTOMfrom48to49:	equ CurveRightBlock13
	CurveRightPage0BOTTOMChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom48to49.bin"
	CurveRightPage0BOTTOMAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom48to49.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom48to49.bin"

;B31D

	BlockCurveRightPage1TOPfrom48to49:	equ CurveRightBlock13
	CurveRightPage1TOPChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom48to49.bin"
	CurveRightPage1TOPAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom48to49.bin"
	CurveRightPage1TOPWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom48to49.bin"

;B31E

	BlockCurveRightPage1BOTTOMfrom48to49:	equ CurveRightBlock13
	CurveRightPage1BOTTOMChangedPixelsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom48to49.bin"
	CurveRightPage1BOTTOMAddressesfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom48to49.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom48to49:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom48to49.bin"

;BB0A

	BlockCurveRightPage0TOPfrom49to50:	equ CurveRightBlock13
	CurveRightPage0TOPChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom49to50.bin"
	CurveRightPage0TOPAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom49to50.bin"
	CurveRightPage0TOPWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom49to50.bin"

;BB0B

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock14:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom49to50:	equ CurveRightBlock14
	CurveRightPage0BOTTOMChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom49to50.bin"
	CurveRightPage0BOTTOMAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom49to50.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom49to50.bin"

;8AA9

	BlockCurveRightPage1TOPfrom49to50:	equ CurveRightBlock14
	CurveRightPage1TOPChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom49to50.bin"
	CurveRightPage1TOPAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom49to50.bin"
	CurveRightPage1TOPWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom49to50.bin"

;8AAA

	BlockCurveRightPage1BOTTOMfrom49to50:	equ CurveRightBlock14
	CurveRightPage1BOTTOMChangedPixelsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom49to50.bin"
	CurveRightPage1BOTTOMAddressesfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom49to50.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom49to50:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom49to50.bin"

;9553

	BlockCurveRightPage0TOPfrom50to51:	equ CurveRightBlock14
	CurveRightPage0TOPChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom50to51.bin"
	CurveRightPage0TOPAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom50to51.bin"
	CurveRightPage0TOPWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom50to51.bin"

;9554

	BlockCurveRightPage0BOTTOMfrom50to51:	equ CurveRightBlock14
	CurveRightPage0BOTTOMChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom50to51.bin"
	CurveRightPage0BOTTOMAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom50to51.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom50to51.bin"

;9D0D

	BlockCurveRightPage1TOPfrom50to51:	equ CurveRightBlock14
	CurveRightPage1TOPChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom50to51.bin"
	CurveRightPage1TOPAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom50to51.bin"
	CurveRightPage1TOPWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom50to51.bin"

;9D0E

	BlockCurveRightPage1BOTTOMfrom50to51:	equ CurveRightBlock14
	CurveRightPage1BOTTOMChangedPixelsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom50to51.bin"
	CurveRightPage1BOTTOMAddressesfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom50to51.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom50to51:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom50to51.bin"

;A4C7

	BlockCurveRightPage0TOPfrom51to52:	equ CurveRightBlock14
	CurveRightPage0TOPChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom51to52.bin"
	CurveRightPage0TOPAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom51to52.bin"
	CurveRightPage0TOPWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom51to52.bin"

;A4C8

	BlockCurveRightPage0BOTTOMfrom51to52:	equ CurveRightBlock14
	CurveRightPage0BOTTOMChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom51to52.bin"
	CurveRightPage0BOTTOMAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom51to52.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom51to52.bin"

;AC79

	BlockCurveRightPage1TOPfrom51to52:	equ CurveRightBlock14
	CurveRightPage1TOPChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom51to52.bin"
	CurveRightPage1TOPAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom51to52.bin"
	CurveRightPage1TOPWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom51to52.bin"

;AC7A

	BlockCurveRightPage1BOTTOMfrom51to52:	equ CurveRightBlock14
	CurveRightPage1BOTTOMChangedPixelsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom51to52.bin"
	CurveRightPage1BOTTOMAddressesfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom51to52.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom51to52:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom51to52.bin"

;B42B

	BlockCurveRightPage0TOPfrom52to53:	equ CurveRightBlock14
	CurveRightPage0TOPChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom52to53.bin"
	CurveRightPage0TOPAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom52to53.bin"
	CurveRightPage0TOPWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom52to53.bin"

;B42C

	BlockCurveRightPage0BOTTOMfrom52to53:	equ CurveRightBlock14
	CurveRightPage0BOTTOMChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom52to53.bin"
	CurveRightPage0BOTTOMAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom52to53.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom52to53.bin"

;BD7F

	BlockCurveRightPage1TOPfrom52to53:	equ CurveRightBlock14
	CurveRightPage1TOPChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom52to53.bin"
	CurveRightPage1TOPAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom52to53.bin"
	CurveRightPage1TOPWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom52to53.bin"

;BD80

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock15:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom52to53:	equ CurveRightBlock15
	CurveRightPage1BOTTOMChangedPixelsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom52to53.bin"
	CurveRightPage1BOTTOMAddressesfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom52to53.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom52to53:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom52to53.bin"

;8953

	BlockCurveRightPage0TOPfrom53to54:	equ CurveRightBlock15
	CurveRightPage0TOPChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom53to54.bin"
	CurveRightPage0TOPAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom53to54.bin"
	CurveRightPage0TOPWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom53to54.bin"

;8954

	BlockCurveRightPage0BOTTOMfrom53to54:	equ CurveRightBlock15
	CurveRightPage0BOTTOMChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom53to54.bin"
	CurveRightPage0BOTTOMAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom53to54.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom53to54.bin"

;924D

	BlockCurveRightPage1TOPfrom53to54:	equ CurveRightBlock15
	CurveRightPage1TOPChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom53to54.bin"
	CurveRightPage1TOPAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom53to54.bin"
	CurveRightPage1TOPWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom53to54.bin"

;924E

	BlockCurveRightPage1BOTTOMfrom53to54:	equ CurveRightBlock15
	CurveRightPage1BOTTOMChangedPixelsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom53to54.bin"
	CurveRightPage1BOTTOMAddressesfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom53to54.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom53to54:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom53to54.bin"

;9B47

	BlockCurveRightPage0TOPfrom54to55:	equ CurveRightBlock15
	CurveRightPage0TOPChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom54to55.bin"
	CurveRightPage0TOPAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom54to55.bin"
	CurveRightPage0TOPWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom54to55.bin"

;9B48

	BlockCurveRightPage0BOTTOMfrom54to55:	equ CurveRightBlock15
	CurveRightPage0BOTTOMChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom54to55.bin"
	CurveRightPage0BOTTOMAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom54to55.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom54to55.bin"

;A309

	BlockCurveRightPage1TOPfrom54to55:	equ CurveRightBlock15
	CurveRightPage1TOPChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom54to55.bin"
	CurveRightPage1TOPAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom54to55.bin"
	CurveRightPage1TOPWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom54to55.bin"

;A30A

	BlockCurveRightPage1BOTTOMfrom54to55:	equ CurveRightBlock15
	CurveRightPage1BOTTOMChangedPixelsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom54to55.bin"
	CurveRightPage1BOTTOMAddressesfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom54to55.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom54to55:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom54to55.bin"

;AACB

	BlockCurveRightPage0TOPfrom55to56:	equ CurveRightBlock15
	CurveRightPage0TOPChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom55to56.bin"
	CurveRightPage0TOPAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom55to56.bin"
	CurveRightPage0TOPWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom55to56.bin"

;AACC

	BlockCurveRightPage0BOTTOMfrom55to56:	equ CurveRightBlock15
	CurveRightPage0BOTTOMChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom55to56.bin"
	CurveRightPage0BOTTOMAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom55to56.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom55to56.bin"

;B438

	BlockCurveRightPage1TOPfrom55to56:	equ CurveRightBlock15
	CurveRightPage1TOPChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom55to56.bin"
	CurveRightPage1TOPAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom55to56.bin"
	CurveRightPage1TOPWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom55to56.bin"

;B439

	BlockCurveRightPage1BOTTOMfrom55to56:	equ CurveRightBlock15
	CurveRightPage1BOTTOMChangedPixelsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom55to56.bin"
	CurveRightPage1BOTTOMAddressesfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom55to56.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom55to56:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom55to56.bin"

;BDA5

	BlockCurveRightPage0TOPfrom56to57:	equ CurveRightBlock15
	CurveRightPage0TOPChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom56to57.bin"
	CurveRightPage0TOPAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom56to57.bin"
	CurveRightPage0TOPWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom56to57.bin"

;BDA6

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock16:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom56to57:	equ CurveRightBlock16
	CurveRightPage0BOTTOMChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom56to57.bin"
	CurveRightPage0BOTTOMAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom56to57.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom56to57.bin"

;88D1

	BlockCurveRightPage1TOPfrom56to57:	equ CurveRightBlock16
	CurveRightPage1TOPChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom56to57.bin"
	CurveRightPage1TOPAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom56to57.bin"
	CurveRightPage1TOPWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom56to57.bin"

;88D2

	BlockCurveRightPage1BOTTOMfrom56to57:	equ CurveRightBlock16
	CurveRightPage1BOTTOMChangedPixelsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom56to57.bin"
	CurveRightPage1BOTTOMAddressesfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom56to57.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom56to57:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom56to57.bin"

;91A3

	BlockCurveRightPage0TOPfrom57to58:	equ CurveRightBlock16
	CurveRightPage0TOPChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom57to58.bin"
	CurveRightPage0TOPAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom57to58.bin"
	CurveRightPage0TOPWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom57to58.bin"

;91A4

	BlockCurveRightPage0BOTTOMfrom57to58:	equ CurveRightBlock16
	CurveRightPage0BOTTOMChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom57to58.bin"
	CurveRightPage0BOTTOMAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom57to58.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom57to58.bin"

;99F1

	BlockCurveRightPage1TOPfrom57to58:	equ CurveRightBlock16
	CurveRightPage1TOPChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom57to58.bin"
	CurveRightPage1TOPAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom57to58.bin"
	CurveRightPage1TOPWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom57to58.bin"

;99F2

	BlockCurveRightPage1BOTTOMfrom57to58:	equ CurveRightBlock16
	CurveRightPage1BOTTOMChangedPixelsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom57to58.bin"
	CurveRightPage1BOTTOMAddressesfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom57to58.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom57to58:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom57to58.bin"

;A23F

	BlockCurveRightPage0TOPfrom58to59:	equ CurveRightBlock16
	CurveRightPage0TOPChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom58to59.bin"
	CurveRightPage0TOPAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom58to59.bin"
	CurveRightPage0TOPWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom58to59.bin"

;A240

	BlockCurveRightPage0BOTTOMfrom58to59:	equ CurveRightBlock16
	CurveRightPage0BOTTOMChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom58to59.bin"
	CurveRightPage0BOTTOMAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom58to59.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom58to59.bin"

;AAA2

	BlockCurveRightPage1TOPfrom58to59:	equ CurveRightBlock16
	CurveRightPage1TOPChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom58to59.bin"
	CurveRightPage1TOPAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom58to59.bin"
	CurveRightPage1TOPWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom58to59.bin"

;AAA3

	BlockCurveRightPage1BOTTOMfrom58to59:	equ CurveRightBlock16
	CurveRightPage1BOTTOMChangedPixelsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom58to59.bin"
	CurveRightPage1BOTTOMAddressesfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom58to59.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom58to59:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom58to59.bin"

;B305

	BlockCurveRightPage0TOPfrom59to60:	equ CurveRightBlock16
	CurveRightPage0TOPChangedPixelsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom59to60.bin"
	CurveRightPage0TOPAddressesfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom59to60.bin"
	CurveRightPage0TOPWriteInstructionsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom59to60.bin"

;B306

	BlockCurveRightPage0BOTTOMfrom59to60:	equ CurveRightBlock16
	CurveRightPage0BOTTOMChangedPixelsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom59to60.bin"
	CurveRightPage0BOTTOMAddressesfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom59to60.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom59to60.bin"

;BB2D

	BlockCurveRightPage1TOPfrom59to60:	equ CurveRightBlock16
	CurveRightPage1TOPChangedPixelsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom59to60.bin"
	CurveRightPage1TOPAddressesfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom59to60.bin"
	CurveRightPage1TOPWriteInstructionsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom59to60.bin"

;BB2E

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock17:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom59to60:	equ CurveRightBlock17
	CurveRightPage1BOTTOMChangedPixelsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom59to60.bin"
	CurveRightPage1BOTTOMAddressesfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom59to60.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom59to60:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom59to60.bin"

;8827

	BlockCurveRightPage0TOPfrom60to61:	equ CurveRightBlock17
	CurveRightPage0TOPChangedPixelsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom60to61.bin"
	CurveRightPage0TOPAddressesfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom60to61.bin"
	CurveRightPage0TOPWriteInstructionsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom60to61.bin"

;8828

	BlockCurveRightPage0BOTTOMfrom60to61:	equ CurveRightBlock17
	CurveRightPage0BOTTOMChangedPixelsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom60to61.bin"
	CurveRightPage0BOTTOMAddressesfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom60to61.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom60to61.bin"

;90E7

	BlockCurveRightPage1TOPfrom60to61:	equ CurveRightBlock17
	CurveRightPage1TOPChangedPixelsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom60to61.bin"
	CurveRightPage1TOPAddressesfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom60to61.bin"
	CurveRightPage1TOPWriteInstructionsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom60to61.bin"

;90E8

	BlockCurveRightPage1BOTTOMfrom60to61:	equ CurveRightBlock17
	CurveRightPage1BOTTOMChangedPixelsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom60to61.bin"
	CurveRightPage1BOTTOMAddressesfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom60to61.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom60to61:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom60to61.bin"

;99A7

	BlockCurveRightPage0TOPfrom61to62:	equ CurveRightBlock17
	CurveRightPage0TOPChangedPixelsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom61to62.bin"
	CurveRightPage0TOPAddressesfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom61to62.bin"
	CurveRightPage0TOPWriteInstructionsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom61to62.bin"

;99A8

	BlockCurveRightPage0BOTTOMfrom61to62:	equ CurveRightBlock17
	CurveRightPage0BOTTOMChangedPixelsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom61to62.bin"
	CurveRightPage0BOTTOMAddressesfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom61to62.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom61to62.bin"

;A3F0

	BlockCurveRightPage1TOPfrom61to62:	equ CurveRightBlock17
	CurveRightPage1TOPChangedPixelsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom61to62.bin"
	CurveRightPage1TOPAddressesfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom61to62.bin"
	CurveRightPage1TOPWriteInstructionsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom61to62.bin"

;A3F1

	BlockCurveRightPage1BOTTOMfrom61to62:	equ CurveRightBlock17
	CurveRightPage1BOTTOMChangedPixelsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom61to62.bin"
	CurveRightPage1BOTTOMAddressesfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom61to62.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom61to62:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom61to62.bin"

;AE39

	BlockCurveRightPage0TOPfrom62to63:	equ CurveRightBlock17
	CurveRightPage0TOPChangedPixelsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom62to63.bin"
	CurveRightPage0TOPAddressesfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom62to63.bin"
	CurveRightPage0TOPWriteInstructionsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom62to63.bin"

;AE3A

	BlockCurveRightPage0BOTTOMfrom62to63:	equ CurveRightBlock17
	CurveRightPage0BOTTOMChangedPixelsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom62to63.bin"
	CurveRightPage0BOTTOMAddressesfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom62to63.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom62to63.bin"

;B546

	BlockCurveRightPage1TOPfrom62to63:	equ CurveRightBlock17
	CurveRightPage1TOPChangedPixelsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom62to63.bin"
	CurveRightPage1TOPAddressesfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom62to63.bin"
	CurveRightPage1TOPWriteInstructionsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom62to63.bin"

;B547

	BlockCurveRightPage1BOTTOMfrom62to63:	equ CurveRightBlock17
	CurveRightPage1BOTTOMChangedPixelsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom62to63.bin"
	CurveRightPage1BOTTOMAddressesfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom62to63.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom62to63:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom62to63.bin"

;BC53

	BlockCurveRightPage0TOPfrom63to64:	equ CurveRightBlock17
	CurveRightPage0TOPChangedPixelsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom63to64.bin"
	CurveRightPage0TOPAddressesfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom63to64.bin"
	CurveRightPage0TOPWriteInstructionsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom63to64.bin"

;BC54

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock18:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom63to64:	equ CurveRightBlock18
	CurveRightPage0BOTTOMChangedPixelsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom63to64.bin"
	CurveRightPage0BOTTOMAddressesfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom63to64.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom63to64.bin"

;883F

	BlockCurveRightPage1TOPfrom63to64:	equ CurveRightBlock18
	CurveRightPage1TOPChangedPixelsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom63to64.bin"
	CurveRightPage1TOPAddressesfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom63to64.bin"
	CurveRightPage1TOPWriteInstructionsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom63to64.bin"

;8840

	BlockCurveRightPage1BOTTOMfrom63to64:	equ CurveRightBlock18
	CurveRightPage1BOTTOMChangedPixelsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom63to64.bin"
	CurveRightPage1BOTTOMAddressesfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom63to64.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom63to64:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom63to64.bin"

;907F

	BlockCurveRightPage0TOPfrom64to65:	equ CurveRightBlock18
	CurveRightPage0TOPChangedPixelsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom64to65.bin"
	CurveRightPage0TOPAddressesfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom64to65.bin"
	CurveRightPage0TOPWriteInstructionsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom64to65.bin"

;9080

	BlockCurveRightPage0BOTTOMfrom64to65:	equ CurveRightBlock18
	CurveRightPage0BOTTOMChangedPixelsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom64to65.bin"
	CurveRightPage0BOTTOMAddressesfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom64to65.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom64to65.bin"

;99F4

	BlockCurveRightPage1TOPfrom64to65:	equ CurveRightBlock18
	CurveRightPage1TOPChangedPixelsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom64to65.bin"
	CurveRightPage1TOPAddressesfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom64to65.bin"
	CurveRightPage1TOPWriteInstructionsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom64to65.bin"

;99F5

	BlockCurveRightPage1BOTTOMfrom64to65:	equ CurveRightBlock18
	CurveRightPage1BOTTOMChangedPixelsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom64to65.bin"
	CurveRightPage1BOTTOMAddressesfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom64to65.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom64to65:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom64to65.bin"

;A369

	BlockCurveRightPage0TOPfrom65to66:	equ CurveRightBlock18
	CurveRightPage0TOPChangedPixelsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom65to66.bin"
	CurveRightPage0TOPAddressesfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom65to66.bin"
	CurveRightPage0TOPWriteInstructionsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom65to66.bin"

;A36A

	BlockCurveRightPage0BOTTOMfrom65to66:	equ CurveRightBlock18
	CurveRightPage0BOTTOMChangedPixelsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom65to66.bin"
	CurveRightPage0BOTTOMAddressesfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom65to66.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom65to66.bin"

;AC01

	BlockCurveRightPage1TOPfrom65to66:	equ CurveRightBlock18
	CurveRightPage1TOPChangedPixelsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom65to66.bin"
	CurveRightPage1TOPAddressesfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom65to66.bin"
	CurveRightPage1TOPWriteInstructionsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom65to66.bin"

;AC02

	BlockCurveRightPage1BOTTOMfrom65to66:	equ CurveRightBlock18
	CurveRightPage1BOTTOMChangedPixelsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom65to66.bin"
	CurveRightPage1BOTTOMAddressesfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom65to66.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom65to66:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom65to66.bin"

;B499

	BlockCurveRightPage0TOPfrom66to67:	equ CurveRightBlock18
	CurveRightPage0TOPChangedPixelsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom66to67.bin"
	CurveRightPage0TOPAddressesfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom66to67.bin"
	CurveRightPage0TOPWriteInstructionsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom66to67.bin"

;B49A

	BlockCurveRightPage0BOTTOMfrom66to67:	equ CurveRightBlock18
	CurveRightPage0BOTTOMChangedPixelsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom66to67.bin"
	CurveRightPage0BOTTOMAddressesfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom66to67.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom66to67.bin"

;BD21

	BlockCurveRightPage1TOPfrom66to67:	equ CurveRightBlock18
	CurveRightPage1TOPChangedPixelsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom66to67.bin"
	CurveRightPage1TOPAddressesfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom66to67.bin"
	CurveRightPage1TOPWriteInstructionsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom66to67.bin"

;BD22

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock19:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom66to67:	equ CurveRightBlock19
	CurveRightPage1BOTTOMChangedPixelsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom66to67.bin"
	CurveRightPage1BOTTOMAddressesfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom66to67.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom66to67:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom66to67.bin"

;8887

	BlockCurveRightPage0TOPfrom67to68:	equ CurveRightBlock19
	CurveRightPage0TOPChangedPixelsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom67to68.bin"
	CurveRightPage0TOPAddressesfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom67to68.bin"
	CurveRightPage0TOPWriteInstructionsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom67to68.bin"

;8888

	BlockCurveRightPage0BOTTOMfrom67to68:	equ CurveRightBlock19
	CurveRightPage0BOTTOMChangedPixelsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom67to68.bin"
	CurveRightPage0BOTTOMAddressesfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom67to68.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom67to68.bin"

;9005

	BlockCurveRightPage1TOPfrom67to68:	equ CurveRightBlock19
	CurveRightPage1TOPChangedPixelsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom67to68.bin"
	CurveRightPage1TOPAddressesfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom67to68.bin"
	CurveRightPage1TOPWriteInstructionsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom67to68.bin"

;9006

	BlockCurveRightPage1BOTTOMfrom67to68:	equ CurveRightBlock19
	CurveRightPage1BOTTOMChangedPixelsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom67to68.bin"
	CurveRightPage1BOTTOMAddressesfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom67to68.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom67to68:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom67to68.bin"

;9783

	BlockCurveRightPage0TOPfrom68to69:	equ CurveRightBlock19
	CurveRightPage0TOPChangedPixelsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom68to69.bin"
	CurveRightPage0TOPAddressesfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom68to69.bin"
	CurveRightPage0TOPWriteInstructionsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom68to69.bin"

;9784

	BlockCurveRightPage0BOTTOMfrom68to69:	equ CurveRightBlock19
	CurveRightPage0BOTTOMChangedPixelsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom68to69.bin"
	CurveRightPage0BOTTOMAddressesfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom68to69.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom68to69.bin"

;A082

	BlockCurveRightPage1TOPfrom68to69:	equ CurveRightBlock19
	CurveRightPage1TOPChangedPixelsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom68to69.bin"
	CurveRightPage1TOPAddressesfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom68to69.bin"
	CurveRightPage1TOPWriteInstructionsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom68to69.bin"

;A083

	BlockCurveRightPage1BOTTOMfrom68to69:	equ CurveRightBlock19
	CurveRightPage1BOTTOMChangedPixelsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom68to69.bin"
	CurveRightPage1BOTTOMAddressesfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom68to69.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom68to69:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom68to69.bin"

;A981

	BlockCurveRightPage0TOPfrom69to70:	equ CurveRightBlock19
	CurveRightPage0TOPChangedPixelsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom69to70.bin"
	CurveRightPage0TOPAddressesfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom69to70.bin"
	CurveRightPage0TOPWriteInstructionsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom69to70.bin"

;A982

	BlockCurveRightPage0BOTTOMfrom69to70:	equ CurveRightBlock19
	CurveRightPage0BOTTOMChangedPixelsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom69to70.bin"
	CurveRightPage0BOTTOMAddressesfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom69to70.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom69to70.bin"

;B0C8

	BlockCurveRightPage1TOPfrom69to70:	equ CurveRightBlock19
	CurveRightPage1TOPChangedPixelsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom69to70.bin"
	CurveRightPage1TOPAddressesfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom69to70.bin"
	CurveRightPage1TOPWriteInstructionsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom69to70.bin"

;B0C9

	BlockCurveRightPage1BOTTOMfrom69to70:	equ CurveRightBlock19
	CurveRightPage1BOTTOMChangedPixelsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom69to70.bin"
	CurveRightPage1BOTTOMAddressesfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom69to70.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom69to70:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom69to70.bin"

;B80F

	BlockCurveRightPage0TOPfrom70to71:	equ CurveRightBlock19
	CurveRightPage0TOPChangedPixelsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom70to71.bin"
	CurveRightPage0TOPAddressesfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom70to71.bin"
	CurveRightPage0TOPWriteInstructionsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom70to71.bin"

;B810

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock20:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage0BOTTOMfrom70to71:	equ CurveRightBlock20
	CurveRightPage0BOTTOMChangedPixelsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom70to71.bin"
	CurveRightPage0BOTTOMAddressesfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom70to71.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom70to71.bin"

;896F

	BlockCurveRightPage1TOPfrom70to71:	equ CurveRightBlock20
	CurveRightPage1TOPChangedPixelsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom70to71.bin"
	CurveRightPage1TOPAddressesfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom70to71.bin"
	CurveRightPage1TOPWriteInstructionsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom70to71.bin"

;8970

	BlockCurveRightPage1BOTTOMfrom70to71:	equ CurveRightBlock20
	CurveRightPage1BOTTOMChangedPixelsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom70to71.bin"
	CurveRightPage1BOTTOMAddressesfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom70to71.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom70to71:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom70to71.bin"

;92DF

	BlockCurveRightPage0TOPfrom71to72:	equ CurveRightBlock20
	CurveRightPage0TOPChangedPixelsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom71to72.bin"
	CurveRightPage0TOPAddressesfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom71to72.bin"
	CurveRightPage0TOPWriteInstructionsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom71to72.bin"

;92E0

	BlockCurveRightPage0BOTTOMfrom71to72:	equ CurveRightBlock20
	CurveRightPage0BOTTOMChangedPixelsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom71to72.bin"
	CurveRightPage0BOTTOMAddressesfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom71to72.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom71to72.bin"

;9AEC

	BlockCurveRightPage1TOPfrom71to72:	equ CurveRightBlock20
	CurveRightPage1TOPChangedPixelsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom71to72.bin"
	CurveRightPage1TOPAddressesfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom71to72.bin"
	CurveRightPage1TOPWriteInstructionsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom71to72.bin"

;9AED

	BlockCurveRightPage1BOTTOMfrom71to72:	equ CurveRightBlock20
	CurveRightPage1BOTTOMChangedPixelsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom71to72.bin"
	CurveRightPage1BOTTOMAddressesfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom71to72.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom71to72:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom71to72.bin"

;A2F9

	BlockCurveRightPage0TOPfrom72to73:	equ CurveRightBlock20
	CurveRightPage0TOPChangedPixelsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom72to73.bin"
	CurveRightPage0TOPAddressesfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom72to73.bin"
	CurveRightPage0TOPWriteInstructionsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom72to73.bin"

;A2FA

	BlockCurveRightPage0BOTTOMfrom72to73:	equ CurveRightBlock20
	CurveRightPage0BOTTOMChangedPixelsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom72to73.bin"
	CurveRightPage0BOTTOMAddressesfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom72to73.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom72to73.bin"

;AA6B

	BlockCurveRightPage1TOPfrom72to73:	equ CurveRightBlock20
	CurveRightPage1TOPChangedPixelsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom72to73.bin"
	CurveRightPage1TOPAddressesfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom72to73.bin"
	CurveRightPage1TOPWriteInstructionsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom72to73.bin"

;AA6C

	BlockCurveRightPage1BOTTOMfrom72to73:	equ CurveRightBlock20
	CurveRightPage1BOTTOMChangedPixelsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom72to73.bin"
	CurveRightPage1BOTTOMAddressesfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom72to73.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom72to73:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom72to73.bin"

;B1DD

	BlockCurveRightPage0TOPfrom73to74:	equ CurveRightBlock20
	CurveRightPage0TOPChangedPixelsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom73to74.bin"
	CurveRightPage0TOPAddressesfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom73to74.bin"
	CurveRightPage0TOPWriteInstructionsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom73to74.bin"

;B1DE

	BlockCurveRightPage0BOTTOMfrom73to74:	equ CurveRightBlock20
	CurveRightPage0BOTTOMChangedPixelsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom73to74.bin"
	CurveRightPage0BOTTOMAddressesfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom73to74.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom73to74.bin"

;BA7B

	BlockCurveRightPage1TOPfrom73to74:	equ CurveRightBlock20
	CurveRightPage1TOPChangedPixelsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom73to74.bin"
	CurveRightPage1TOPAddressesfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom73to74.bin"
	CurveRightPage1TOPWriteInstructionsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom73to74.bin"

;BA7C

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightBlock21:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightPage1BOTTOMfrom73to74:	equ CurveRightBlock21
	CurveRightPage1BOTTOMChangedPixelsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom73to74.bin"
	CurveRightPage1BOTTOMAddressesfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom73to74.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom73to74:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom73to74.bin"

;889D

	BlockCurveRightPage0TOPfrom74to75:	equ CurveRightBlock21
	CurveRightPage0TOPChangedPixelsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPchangedpixelsfrom74to75.bin"
	CurveRightPage0TOPAddressesfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPaddressesfrom74to75.bin"
	CurveRightPage0TOPWriteInstructionsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\TOPwriteinstructionsfrom74to75.bin"

;889E

	BlockCurveRightPage0BOTTOMfrom74to75:	equ CurveRightBlock21
	CurveRightPage0BOTTOMChangedPixelsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMchangedpixelsfrom74to75.bin"
	CurveRightPage0BOTTOMAddressesfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMaddressesfrom74to75.bin"
	CurveRightPage0BOTTOMWriteInstructionsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage0\BOTTOMwriteinstructionsfrom74to75.bin"

;906B

	BlockCurveRightPage1TOPfrom74to75:	equ CurveRightBlock21
	CurveRightPage1TOPChangedPixelsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPchangedpixelsfrom74to75.bin"
	CurveRightPage1TOPAddressesfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPaddressesfrom74to75.bin"
	CurveRightPage1TOPWriteInstructionsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\TOPwriteinstructionsfrom74to75.bin"

;906C

	BlockCurveRightPage1BOTTOMfrom74to75:	equ CurveRightBlock21
	CurveRightPage1BOTTOMChangedPixelsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMchangedpixelsfrom74to75.bin"
	CurveRightPage1BOTTOMAddressesfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMaddressesfrom74to75.bin"
	CurveRightPage1BOTTOMWriteInstructionsfrom74to75:
	incbin "..\grapx\RacingGame\CurveRightAnimationPage1\BOTTOMwriteinstructionsfrom74to75.bin"

;9839

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

