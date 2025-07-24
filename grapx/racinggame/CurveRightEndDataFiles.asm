
CurveRightEndBlock1:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0TOPfrom1to0:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom1to0.bin"
	CurveRightEndPage0TOPAddressesfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom1to0.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom1to0.bin"

;8001

	BlockCurveRightEndPage0BOTTOMfrom1to0:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom1to0.bin"
	CurveRightEndPage0BOTTOMAddressesfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom1to0.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom1to0.bin"

;8064

	BlockCurveRightEndPage1TOPfrom1to0:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom1to0.bin"
	CurveRightEndPage1TOPAddressesfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom1to0.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom1to0.bin"

;8065

	BlockCurveRightEndPage1BOTTOMfrom1to0:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom1to0.bin"
	CurveRightEndPage1BOTTOMAddressesfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom1to0.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom1to0:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom1to0.bin"

;80C8

	BlockCurveRightEndPage0TOPfrom2to1:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom2to1.bin"
	CurveRightEndPage0TOPAddressesfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom2to1.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom2to1.bin"

;80C9

	BlockCurveRightEndPage0BOTTOMfrom2to1:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom2to1.bin"
	CurveRightEndPage0BOTTOMAddressesfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom2to1.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom2to1.bin"

;816B

	BlockCurveRightEndPage1TOPfrom2to1:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom2to1.bin"
	CurveRightEndPage1TOPAddressesfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom2to1.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom2to1.bin"

;816C

	BlockCurveRightEndPage1BOTTOMfrom2to1:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom2to1.bin"
	CurveRightEndPage1BOTTOMAddressesfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom2to1.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom2to1:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom2to1.bin"

;820E

	BlockCurveRightEndPage0TOPfrom3to2:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom3to2.bin"
	CurveRightEndPage0TOPAddressesfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom3to2.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom3to2.bin"

;820F

	BlockCurveRightEndPage0BOTTOMfrom3to2:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom3to2.bin"
	CurveRightEndPage0BOTTOMAddressesfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom3to2.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom3to2.bin"

;8395

	BlockCurveRightEndPage1TOPfrom3to2:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom3to2.bin"
	CurveRightEndPage1TOPAddressesfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom3to2.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom3to2.bin"

;8396

	BlockCurveRightEndPage1BOTTOMfrom3to2:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom3to2.bin"
	CurveRightEndPage1BOTTOMAddressesfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom3to2.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom3to2:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom3to2.bin"

;851C

	BlockCurveRightEndPage0TOPfrom4to3:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom4to3.bin"
	CurveRightEndPage0TOPAddressesfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom4to3.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom4to3.bin"

;851D

	BlockCurveRightEndPage0BOTTOMfrom4to3:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom4to3.bin"
	CurveRightEndPage0BOTTOMAddressesfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom4to3.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom4to3.bin"

;867B

	BlockCurveRightEndPage1TOPfrom4to3:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom4to3.bin"
	CurveRightEndPage1TOPAddressesfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom4to3.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom4to3.bin"

;867C

	BlockCurveRightEndPage1BOTTOMfrom4to3:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom4to3.bin"
	CurveRightEndPage1BOTTOMAddressesfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom4to3.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom4to3:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom4to3.bin"

;87DA

	BlockCurveRightEndPage0TOPfrom5to4:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom5to4.bin"
	CurveRightEndPage0TOPAddressesfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom5to4.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom5to4.bin"

;87DB

	BlockCurveRightEndPage0BOTTOMfrom5to4:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom5to4.bin"
	CurveRightEndPage0BOTTOMAddressesfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom5to4.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom5to4.bin"

;8F73

	BlockCurveRightEndPage1TOPfrom5to4:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom5to4.bin"
	CurveRightEndPage1TOPAddressesfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom5to4.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom5to4.bin"

;8F74

	BlockCurveRightEndPage1BOTTOMfrom5to4:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom5to4.bin"
	CurveRightEndPage1BOTTOMAddressesfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom5to4.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom5to4:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom5to4.bin"

;970C

	BlockCurveRightEndPage0TOPfrom6to5:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom6to5.bin"
	CurveRightEndPage0TOPAddressesfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom6to5.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom6to5.bin"

;970D

	BlockCurveRightEndPage0BOTTOMfrom6to5:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom6to5.bin"
	CurveRightEndPage0BOTTOMAddressesfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom6to5.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom6to5.bin"

;9F49

	BlockCurveRightEndPage1TOPfrom6to5:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom6to5.bin"
	CurveRightEndPage1TOPAddressesfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom6to5.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom6to5.bin"

;9F4A

	BlockCurveRightEndPage1BOTTOMfrom6to5:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom6to5.bin"
	CurveRightEndPage1BOTTOMAddressesfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom6to5.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom6to5:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom6to5.bin"

;A786

	BlockCurveRightEndPage0TOPfrom7to6:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom7to6.bin"
	CurveRightEndPage0TOPAddressesfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom7to6.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom7to6.bin"

;A787

	BlockCurveRightEndPage0BOTTOMfrom7to6:	equ CurveRightEndBlock1
	CurveRightEndPage0BOTTOMChangedPixelsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom7to6.bin"
	CurveRightEndPage0BOTTOMAddressesfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom7to6.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom7to6.bin"

;AFCE

	BlockCurveRightEndPage1TOPfrom7to6:	equ CurveRightEndBlock1
	CurveRightEndPage1TOPChangedPixelsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom7to6.bin"
	CurveRightEndPage1TOPAddressesfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom7to6.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom7to6.bin"

;AFCF

	BlockCurveRightEndPage1BOTTOMfrom7to6:	equ CurveRightEndBlock1
	CurveRightEndPage1BOTTOMChangedPixelsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom7to6.bin"
	CurveRightEndPage1BOTTOMAddressesfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom7to6.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom7to6:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom7to6.bin"

;B816

	BlockCurveRightEndPage0TOPfrom8to7:	equ CurveRightEndBlock1
	CurveRightEndPage0TOPChangedPixelsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom8to7.bin"
	CurveRightEndPage0TOPAddressesfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom8to7.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom8to7.bin"

;B817

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock2:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom8to7:	equ CurveRightEndBlock2
	CurveRightEndPage0BOTTOMChangedPixelsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom8to7.bin"
	CurveRightEndPage0BOTTOMAddressesfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom8to7.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom8to7.bin"

;8839

	BlockCurveRightEndPage1TOPfrom8to7:	equ CurveRightEndBlock2
	CurveRightEndPage1TOPChangedPixelsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom8to7.bin"
	CurveRightEndPage1TOPAddressesfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom8to7.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom8to7.bin"

;883A

	BlockCurveRightEndPage1BOTTOMfrom8to7:	equ CurveRightEndBlock2
	CurveRightEndPage1BOTTOMChangedPixelsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom8to7.bin"
	CurveRightEndPage1BOTTOMAddressesfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom8to7.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom8to7:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom8to7.bin"

;9073

	BlockCurveRightEndPage0TOPfrom9to8:	equ CurveRightEndBlock2
	CurveRightEndPage0TOPChangedPixelsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom9to8.bin"
	CurveRightEndPage0TOPAddressesfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom9to8.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom9to8.bin"

;9074

	BlockCurveRightEndPage0BOTTOMfrom9to8:	equ CurveRightEndBlock2
	CurveRightEndPage0BOTTOMChangedPixelsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom9to8.bin"
	CurveRightEndPage0BOTTOMAddressesfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom9to8.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom9to8.bin"

;991A

	BlockCurveRightEndPage1TOPfrom9to8:	equ CurveRightEndBlock2
	CurveRightEndPage1TOPChangedPixelsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom9to8.bin"
	CurveRightEndPage1TOPAddressesfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom9to8.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom9to8.bin"

;991B

	BlockCurveRightEndPage1BOTTOMfrom9to8:	equ CurveRightEndBlock2
	CurveRightEndPage1BOTTOMChangedPixelsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom9to8.bin"
	CurveRightEndPage1BOTTOMAddressesfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom9to8.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom9to8:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom9to8.bin"

;A1C1

	BlockCurveRightEndPage0TOPfrom10to9:	equ CurveRightEndBlock2
	CurveRightEndPage0TOPChangedPixelsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom10to9.bin"
	CurveRightEndPage0TOPAddressesfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom10to9.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom10to9.bin"

;A1C2

	BlockCurveRightEndPage0BOTTOMfrom10to9:	equ CurveRightEndBlock2
	CurveRightEndPage0BOTTOMChangedPixelsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom10to9.bin"
	CurveRightEndPage0BOTTOMAddressesfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom10to9.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom10to9.bin"

;AA64

	BlockCurveRightEndPage1TOPfrom10to9:	equ CurveRightEndBlock2
	CurveRightEndPage1TOPChangedPixelsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom10to9.bin"
	CurveRightEndPage1TOPAddressesfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom10to9.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom10to9.bin"

;AA65

	BlockCurveRightEndPage1BOTTOMfrom10to9:	equ CurveRightEndBlock2
	CurveRightEndPage1BOTTOMChangedPixelsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom10to9.bin"
	CurveRightEndPage1BOTTOMAddressesfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom10to9.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom10to9:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom10to9.bin"

;B307

	BlockCurveRightEndPage0TOPfrom11to10:	equ CurveRightEndBlock2
	CurveRightEndPage0TOPChangedPixelsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom11to10.bin"
	CurveRightEndPage0TOPAddressesfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom11to10.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom11to10.bin"

;B308

	BlockCurveRightEndPage0BOTTOMfrom11to10:	equ CurveRightEndBlock2
	CurveRightEndPage0BOTTOMChangedPixelsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom11to10.bin"
	CurveRightEndPage0BOTTOMAddressesfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom11to10.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom11to10.bin"

;BB5C

	BlockCurveRightEndPage1TOPfrom11to10:	equ CurveRightEndBlock2
	CurveRightEndPage1TOPChangedPixelsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom11to10.bin"
	CurveRightEndPage1TOPAddressesfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom11to10.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom11to10.bin"

;BB5D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock3:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom11to10:	equ CurveRightEndBlock3
	CurveRightEndPage1BOTTOMChangedPixelsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom11to10.bin"
	CurveRightEndPage1BOTTOMAddressesfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom11to10.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom11to10:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom11to10.bin"

;8854

	BlockCurveRightEndPage0TOPfrom12to11:	equ CurveRightEndBlock3
	CurveRightEndPage0TOPChangedPixelsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom12to11.bin"
	CurveRightEndPage0TOPAddressesfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom12to11.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom12to11.bin"

;8855

	BlockCurveRightEndPage0BOTTOMfrom12to11:	equ CurveRightEndBlock3
	CurveRightEndPage0BOTTOMChangedPixelsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom12to11.bin"
	CurveRightEndPage0BOTTOMAddressesfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom12to11.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom12to11.bin"

;90FB

	BlockCurveRightEndPage1TOPfrom12to11:	equ CurveRightEndBlock3
	CurveRightEndPage1TOPChangedPixelsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom12to11.bin"
	CurveRightEndPage1TOPAddressesfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom12to11.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom12to11.bin"

;90FC

	BlockCurveRightEndPage1BOTTOMfrom12to11:	equ CurveRightEndBlock3
	CurveRightEndPage1BOTTOMChangedPixelsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom12to11.bin"
	CurveRightEndPage1BOTTOMAddressesfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom12to11.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom12to11:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom12to11.bin"

;99A2

	BlockCurveRightEndPage0TOPfrom13to12:	equ CurveRightEndBlock3
	CurveRightEndPage0TOPChangedPixelsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom13to12.bin"
	CurveRightEndPage0TOPAddressesfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom13to12.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom13to12.bin"

;99A3

	BlockCurveRightEndPage0BOTTOMfrom13to12:	equ CurveRightEndBlock3
	CurveRightEndPage0BOTTOMChangedPixelsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom13to12.bin"
	CurveRightEndPage0BOTTOMAddressesfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom13to12.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom13to12.bin"

;A1DE

	BlockCurveRightEndPage1TOPfrom13to12:	equ CurveRightEndBlock3
	CurveRightEndPage1TOPChangedPixelsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom13to12.bin"
	CurveRightEndPage1TOPAddressesfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom13to12.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom13to12.bin"

;A1DF

	BlockCurveRightEndPage1BOTTOMfrom13to12:	equ CurveRightEndBlock3
	CurveRightEndPage1BOTTOMChangedPixelsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom13to12.bin"
	CurveRightEndPage1BOTTOMAddressesfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom13to12.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom13to12:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom13to12.bin"

;AA1A

	BlockCurveRightEndPage0TOPfrom14to13:	equ CurveRightEndBlock3
	CurveRightEndPage0TOPChangedPixelsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom14to13.bin"
	CurveRightEndPage0TOPAddressesfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom14to13.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom14to13.bin"

;AA1B

	BlockCurveRightEndPage0BOTTOMfrom14to13:	equ CurveRightEndBlock3
	CurveRightEndPage0BOTTOMChangedPixelsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom14to13.bin"
	CurveRightEndPage0BOTTOMAddressesfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom14to13.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom14to13.bin"

;B30C

	BlockCurveRightEndPage1TOPfrom14to13:	equ CurveRightEndBlock3
	CurveRightEndPage1TOPChangedPixelsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom14to13.bin"
	CurveRightEndPage1TOPAddressesfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom14to13.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom14to13.bin"

;B30D

	BlockCurveRightEndPage1BOTTOMfrom14to13:	equ CurveRightEndBlock3
	CurveRightEndPage1BOTTOMChangedPixelsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom14to13.bin"
	CurveRightEndPage1BOTTOMAddressesfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom14to13.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom14to13:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom14to13.bin"

;BBFE

	BlockCurveRightEndPage0TOPfrom15to14:	equ CurveRightEndBlock3
	CurveRightEndPage0TOPChangedPixelsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom15to14.bin"
	CurveRightEndPage0TOPAddressesfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom15to14.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom15to14.bin"

;BBFF

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock4:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom15to14:	equ CurveRightEndBlock4
	CurveRightEndPage0BOTTOMChangedPixelsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom15to14.bin"
	CurveRightEndPage0BOTTOMAddressesfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom15to14.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom15to14.bin"

;8889

	BlockCurveRightEndPage1TOPfrom15to14:	equ CurveRightEndBlock4
	CurveRightEndPage1TOPChangedPixelsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom15to14.bin"
	CurveRightEndPage1TOPAddressesfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom15to14.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom15to14.bin"

;888A

	BlockCurveRightEndPage1BOTTOMfrom15to14:	equ CurveRightEndBlock4
	CurveRightEndPage1BOTTOMChangedPixelsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom15to14.bin"
	CurveRightEndPage1BOTTOMAddressesfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom15to14.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom15to14:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom15to14.bin"

;9113

	BlockCurveRightEndPage0TOPfrom16to15:	equ CurveRightEndBlock4
	CurveRightEndPage0TOPChangedPixelsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom16to15.bin"
	CurveRightEndPage0TOPAddressesfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom16to15.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom16to15.bin"

;9114

	BlockCurveRightEndPage0BOTTOMfrom16to15:	equ CurveRightEndBlock4
	CurveRightEndPage0BOTTOMChangedPixelsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom16to15.bin"
	CurveRightEndPage0BOTTOMAddressesfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom16to15.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom16to15.bin"

;9935

	BlockCurveRightEndPage1TOPfrom16to15:	equ CurveRightEndBlock4
	CurveRightEndPage1TOPChangedPixelsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom16to15.bin"
	CurveRightEndPage1TOPAddressesfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom16to15.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom16to15.bin"

;9936

	BlockCurveRightEndPage1BOTTOMfrom16to15:	equ CurveRightEndBlock4
	CurveRightEndPage1BOTTOMChangedPixelsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom16to15.bin"
	CurveRightEndPage1BOTTOMAddressesfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom16to15.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom16to15:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom16to15.bin"

;A157

	BlockCurveRightEndPage0TOPfrom17to16:	equ CurveRightEndBlock4
	CurveRightEndPage0TOPChangedPixelsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom17to16.bin"
	CurveRightEndPage0TOPAddressesfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom17to16.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom17to16.bin"

;A158

	BlockCurveRightEndPage0BOTTOMfrom17to16:	equ CurveRightEndBlock4
	CurveRightEndPage0BOTTOMChangedPixelsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom17to16.bin"
	CurveRightEndPage0BOTTOMAddressesfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom17to16.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom17to16.bin"

;AA7F

	BlockCurveRightEndPage1TOPfrom17to16:	equ CurveRightEndBlock4
	CurveRightEndPage1TOPChangedPixelsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom17to16.bin"
	CurveRightEndPage1TOPAddressesfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom17to16.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom17to16.bin"

;AA80

	BlockCurveRightEndPage1BOTTOMfrom17to16:	equ CurveRightEndBlock4
	CurveRightEndPage1BOTTOMChangedPixelsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom17to16.bin"
	CurveRightEndPage1BOTTOMAddressesfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom17to16.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom17to16:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom17to16.bin"

;B3A7

	BlockCurveRightEndPage0TOPfrom18to17:	equ CurveRightEndBlock4
	CurveRightEndPage0TOPChangedPixelsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom18to17.bin"
	CurveRightEndPage0TOPAddressesfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom18to17.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom18to17.bin"

;B3A8

	BlockCurveRightEndPage0BOTTOMfrom18to17:	equ CurveRightEndBlock4
	CurveRightEndPage0BOTTOMChangedPixelsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom18to17.bin"
	CurveRightEndPage0BOTTOMAddressesfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom18to17.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom18to17.bin"

;BBF0

	BlockCurveRightEndPage1TOPfrom18to17:	equ CurveRightEndBlock4
	CurveRightEndPage1TOPChangedPixelsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom18to17.bin"
	CurveRightEndPage1TOPAddressesfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom18to17.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom18to17.bin"

;BBF1

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock5:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom18to17:	equ CurveRightEndBlock5
	CurveRightEndPage1BOTTOMChangedPixelsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom18to17.bin"
	CurveRightEndPage1BOTTOMAddressesfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom18to17.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom18to17:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom18to17.bin"

;8848

	BlockCurveRightEndPage0TOPfrom19to18:	equ CurveRightEndBlock5
	CurveRightEndPage0TOPChangedPixelsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom19to18.bin"
	CurveRightEndPage0TOPAddressesfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom19to18.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom19to18.bin"

;8849

	BlockCurveRightEndPage0BOTTOMfrom19to18:	equ CurveRightEndBlock5
	CurveRightEndPage0BOTTOMChangedPixelsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom19to18.bin"
	CurveRightEndPage0BOTTOMAddressesfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom19to18.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom19to18.bin"

;90A0

	BlockCurveRightEndPage1TOPfrom19to18:	equ CurveRightEndBlock5
	CurveRightEndPage1TOPChangedPixelsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom19to18.bin"
	CurveRightEndPage1TOPAddressesfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom19to18.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom19to18.bin"

;90A1

	BlockCurveRightEndPage1BOTTOMfrom19to18:	equ CurveRightEndBlock5
	CurveRightEndPage1BOTTOMChangedPixelsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom19to18.bin"
	CurveRightEndPage1BOTTOMAddressesfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom19to18.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom19to18:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom19to18.bin"

;98F8

	BlockCurveRightEndPage0TOPfrom20to19:	equ CurveRightEndBlock5
	CurveRightEndPage0TOPChangedPixelsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom20to19.bin"
	CurveRightEndPage0TOPAddressesfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom20to19.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom20to19.bin"

;98F9

	BlockCurveRightEndPage0BOTTOMfrom20to19:	equ CurveRightEndBlock5
	CurveRightEndPage0BOTTOMChangedPixelsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom20to19.bin"
	CurveRightEndPage0BOTTOMAddressesfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom20to19.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom20to19.bin"

;A206

	BlockCurveRightEndPage1TOPfrom20to19:	equ CurveRightEndBlock5
	CurveRightEndPage1TOPChangedPixelsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom20to19.bin"
	CurveRightEndPage1TOPAddressesfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom20to19.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom20to19.bin"

;A207

	BlockCurveRightEndPage1BOTTOMfrom20to19:	equ CurveRightEndBlock5
	CurveRightEndPage1BOTTOMChangedPixelsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom20to19.bin"
	CurveRightEndPage1BOTTOMAddressesfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom20to19.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom20to19:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom20to19.bin"

;AB14

	BlockCurveRightEndPage0TOPfrom21to20:	equ CurveRightEndBlock5
	CurveRightEndPage0TOPChangedPixelsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom21to20.bin"
	CurveRightEndPage0TOPAddressesfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom21to20.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom21to20.bin"

;AB15

	BlockCurveRightEndPage0BOTTOMfrom21to20:	equ CurveRightEndBlock5
	CurveRightEndPage0BOTTOMChangedPixelsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom21to20.bin"
	CurveRightEndPage0BOTTOMAddressesfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom21to20.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom21to20.bin"

;B3A0

	BlockCurveRightEndPage1TOPfrom21to20:	equ CurveRightEndBlock5
	CurveRightEndPage1TOPChangedPixelsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom21to20.bin"
	CurveRightEndPage1TOPAddressesfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom21to20.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom21to20.bin"

;B3A1

	BlockCurveRightEndPage1BOTTOMfrom21to20:	equ CurveRightEndBlock5
	CurveRightEndPage1BOTTOMChangedPixelsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom21to20.bin"
	CurveRightEndPage1BOTTOMAddressesfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom21to20.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom21to20:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom21to20.bin"

;BC2C

	BlockCurveRightEndPage0TOPfrom22to21:	equ CurveRightEndBlock5
	CurveRightEndPage0TOPChangedPixelsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom22to21.bin"
	CurveRightEndPage0TOPAddressesfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom22to21.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom22to21.bin"

;BC2D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock6:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom22to21:	equ CurveRightEndBlock6
	CurveRightEndPage0BOTTOMChangedPixelsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom22to21.bin"
	CurveRightEndPage0BOTTOMAddressesfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom22to21.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom22to21.bin"

;8842

	BlockCurveRightEndPage1TOPfrom22to21:	equ CurveRightEndBlock6
	CurveRightEndPage1TOPChangedPixelsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom22to21.bin"
	CurveRightEndPage1TOPAddressesfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom22to21.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom22to21.bin"

;8843

	BlockCurveRightEndPage1BOTTOMfrom22to21:	equ CurveRightEndBlock6
	CurveRightEndPage1BOTTOMChangedPixelsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom22to21.bin"
	CurveRightEndPage1BOTTOMAddressesfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom22to21.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom22to21:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom22to21.bin"

;9085

	BlockCurveRightEndPage0TOPfrom23to22:	equ CurveRightEndBlock6
	CurveRightEndPage0TOPChangedPixelsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom23to22.bin"
	CurveRightEndPage0TOPAddressesfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom23to22.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom23to22.bin"

;9086

	BlockCurveRightEndPage0BOTTOMfrom23to22:	equ CurveRightEndBlock6
	CurveRightEndPage0BOTTOMChangedPixelsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom23to22.bin"
	CurveRightEndPage0BOTTOMAddressesfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom23to22.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom23to22.bin"

;98FB

	BlockCurveRightEndPage1TOPfrom23to22:	equ CurveRightEndBlock6
	CurveRightEndPage1TOPChangedPixelsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom23to22.bin"
	CurveRightEndPage1TOPAddressesfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom23to22.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom23to22.bin"

;98FC

	BlockCurveRightEndPage1BOTTOMfrom23to22:	equ CurveRightEndBlock6
	CurveRightEndPage1BOTTOMChangedPixelsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom23to22.bin"
	CurveRightEndPage1BOTTOMAddressesfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom23to22.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom23to22:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom23to22.bin"

;A171

	BlockCurveRightEndPage0TOPfrom24to23:	equ CurveRightEndBlock6
	CurveRightEndPage0TOPChangedPixelsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom24to23.bin"
	CurveRightEndPage0TOPAddressesfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom24to23.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom24to23.bin"

;A172

	BlockCurveRightEndPage0BOTTOMfrom24to23:	equ CurveRightEndBlock6
	CurveRightEndPage0BOTTOMChangedPixelsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom24to23.bin"
	CurveRightEndPage0BOTTOMAddressesfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom24to23.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom24to23.bin"

;AAD7

	BlockCurveRightEndPage1TOPfrom24to23:	equ CurveRightEndBlock6
	CurveRightEndPage1TOPChangedPixelsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom24to23.bin"
	CurveRightEndPage1TOPAddressesfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom24to23.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom24to23.bin"

;AAD8

	BlockCurveRightEndPage1BOTTOMfrom24to23:	equ CurveRightEndBlock6
	CurveRightEndPage1BOTTOMChangedPixelsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom24to23.bin"
	CurveRightEndPage1BOTTOMAddressesfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom24to23.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom24to23:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom24to23.bin"

;B43D

	BlockCurveRightEndPage0TOPfrom25to24:	equ CurveRightEndBlock6
	CurveRightEndPage0TOPChangedPixelsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom25to24.bin"
	CurveRightEndPage0TOPAddressesfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom25to24.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom25to24.bin"

;B43E

	BlockCurveRightEndPage0BOTTOMfrom25to24:	equ CurveRightEndBlock6
	CurveRightEndPage0BOTTOMChangedPixelsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom25to24.bin"
	CurveRightEndPage0BOTTOMAddressesfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom25to24.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom25to24.bin"

;BD31

	BlockCurveRightEndPage1TOPfrom25to24:	equ CurveRightEndBlock6
	CurveRightEndPage1TOPChangedPixelsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom25to24.bin"
	CurveRightEndPage1TOPAddressesfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom25to24.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom25to24.bin"

;BD32

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock7:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom25to24:	equ CurveRightEndBlock7
	CurveRightEndPage1BOTTOMChangedPixelsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom25to24.bin"
	CurveRightEndPage1BOTTOMAddressesfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom25to24.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom25to24:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom25to24.bin"

;88F3

	BlockCurveRightEndPage0TOPfrom26to25:	equ CurveRightEndBlock7
	CurveRightEndPage0TOPChangedPixelsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom26to25.bin"
	CurveRightEndPage0TOPAddressesfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom26to25.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom26to25.bin"

;88F4

	BlockCurveRightEndPage0BOTTOMfrom26to25:	equ CurveRightEndBlock7
	CurveRightEndPage0BOTTOMChangedPixelsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom26to25.bin"
	CurveRightEndPage0BOTTOMAddressesfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom26to25.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom26to25.bin"

;90E4

	BlockCurveRightEndPage1TOPfrom26to25:	equ CurveRightEndBlock7
	CurveRightEndPage1TOPChangedPixelsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom26to25.bin"
	CurveRightEndPage1TOPAddressesfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom26to25.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom26to25.bin"

;90E5

	BlockCurveRightEndPage1BOTTOMfrom26to25:	equ CurveRightEndBlock7
	CurveRightEndPage1BOTTOMChangedPixelsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom26to25.bin"
	CurveRightEndPage1BOTTOMAddressesfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom26to25.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom26to25:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom26to25.bin"

;98D5

	BlockCurveRightEndPage0TOPfrom27to26:	equ CurveRightEndBlock7
	CurveRightEndPage0TOPChangedPixelsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom27to26.bin"
	CurveRightEndPage0TOPAddressesfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom27to26.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom27to26.bin"

;98D6

	BlockCurveRightEndPage0BOTTOMfrom27to26:	equ CurveRightEndBlock7
	CurveRightEndPage0BOTTOMChangedPixelsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom27to26.bin"
	CurveRightEndPage0BOTTOMAddressesfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom27to26.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom27to26.bin"

;A221

	BlockCurveRightEndPage1TOPfrom27to26:	equ CurveRightEndBlock7
	CurveRightEndPage1TOPChangedPixelsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom27to26.bin"
	CurveRightEndPage1TOPAddressesfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom27to26.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom27to26.bin"

;A222

	BlockCurveRightEndPage1BOTTOMfrom27to26:	equ CurveRightEndBlock7
	CurveRightEndPage1BOTTOMChangedPixelsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom27to26.bin"
	CurveRightEndPage1BOTTOMAddressesfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom27to26.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom27to26:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom27to26.bin"

;AB6D

	BlockCurveRightEndPage0TOPfrom28to27:	equ CurveRightEndBlock7
	CurveRightEndPage0TOPChangedPixelsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom28to27.bin"
	CurveRightEndPage0TOPAddressesfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom28to27.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom28to27.bin"

;AB6E

	BlockCurveRightEndPage0BOTTOMfrom28to27:	equ CurveRightEndBlock7
	CurveRightEndPage0BOTTOMChangedPixelsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom28to27.bin"
	CurveRightEndPage0BOTTOMAddressesfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom28to27.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom28to27.bin"

;B328

	BlockCurveRightEndPage1TOPfrom28to27:	equ CurveRightEndBlock7
	CurveRightEndPage1TOPChangedPixelsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom28to27.bin"
	CurveRightEndPage1TOPAddressesfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom28to27.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom28to27.bin"

;B329

	BlockCurveRightEndPage1BOTTOMfrom28to27:	equ CurveRightEndBlock7
	CurveRightEndPage1BOTTOMChangedPixelsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom28to27.bin"
	CurveRightEndPage1BOTTOMAddressesfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom28to27.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom28to27:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom28to27.bin"

;BAE3

	BlockCurveRightEndPage0TOPfrom29to28:	equ CurveRightEndBlock7
	CurveRightEndPage0TOPChangedPixelsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom29to28.bin"
	CurveRightEndPage0TOPAddressesfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom29to28.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom29to28.bin"

;BAE4

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock8:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom29to28:	equ CurveRightEndBlock8
	CurveRightEndPage0BOTTOMChangedPixelsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom29to28.bin"
	CurveRightEndPage0BOTTOMAddressesfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom29to28.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom29to28.bin"

;87B9

	BlockCurveRightEndPage1TOPfrom29to28:	equ CurveRightEndBlock8
	CurveRightEndPage1TOPChangedPixelsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom29to28.bin"
	CurveRightEndPage1TOPAddressesfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom29to28.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom29to28.bin"

;87BA

	BlockCurveRightEndPage1BOTTOMfrom29to28:	equ CurveRightEndBlock8
	CurveRightEndPage1BOTTOMChangedPixelsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom29to28.bin"
	CurveRightEndPage1BOTTOMAddressesfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom29to28.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom29to28:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom29to28.bin"

;8F73

	BlockCurveRightEndPage0TOPfrom30to29:	equ CurveRightEndBlock8
	CurveRightEndPage0TOPChangedPixelsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom30to29.bin"
	CurveRightEndPage0TOPAddressesfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom30to29.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom30to29.bin"

;8F74

	BlockCurveRightEndPage0BOTTOMfrom30to29:	equ CurveRightEndBlock8
	CurveRightEndPage0BOTTOMChangedPixelsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom30to29.bin"
	CurveRightEndPage0BOTTOMAddressesfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom30to29.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom30to29.bin"

;99C4

	BlockCurveRightEndPage1TOPfrom30to29:	equ CurveRightEndBlock8
	CurveRightEndPage1TOPChangedPixelsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom30to29.bin"
	CurveRightEndPage1TOPAddressesfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom30to29.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom30to29.bin"

;99C5

	BlockCurveRightEndPage1BOTTOMfrom30to29:	equ CurveRightEndBlock8
	CurveRightEndPage1BOTTOMChangedPixelsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom30to29.bin"
	CurveRightEndPage1BOTTOMAddressesfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom30to29.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom30to29:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom30to29.bin"

;A415

	BlockCurveRightEndPage0TOPfrom31to30:	equ CurveRightEndBlock8
	CurveRightEndPage0TOPChangedPixelsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom31to30.bin"
	CurveRightEndPage0TOPAddressesfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom31to30.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom31to30.bin"

;A416

	BlockCurveRightEndPage0BOTTOMfrom31to30:	equ CurveRightEndBlock8
	CurveRightEndPage0BOTTOMChangedPixelsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom31to30.bin"
	CurveRightEndPage0BOTTOMAddressesfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom31to30.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom31to30.bin"

;AC1E

	BlockCurveRightEndPage1TOPfrom31to30:	equ CurveRightEndBlock8
	CurveRightEndPage1TOPChangedPixelsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom31to30.bin"
	CurveRightEndPage1TOPAddressesfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom31to30.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom31to30.bin"

;AC1F

	BlockCurveRightEndPage1BOTTOMfrom31to30:	equ CurveRightEndBlock8
	CurveRightEndPage1BOTTOMChangedPixelsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom31to30.bin"
	CurveRightEndPage1BOTTOMAddressesfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom31to30.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom31to30:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom31to30.bin"

;B427

	BlockCurveRightEndPage0TOPfrom32to31:	equ CurveRightEndBlock8
	CurveRightEndPage0TOPChangedPixelsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom32to31.bin"
	CurveRightEndPage0TOPAddressesfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom32to31.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom32to31.bin"

;B428

	BlockCurveRightEndPage0BOTTOMfrom32to31:	equ CurveRightEndBlock8
	CurveRightEndPage0BOTTOMChangedPixelsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom32to31.bin"
	CurveRightEndPage0BOTTOMAddressesfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom32to31.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom32to31.bin"

;BC72

	BlockCurveRightEndPage1TOPfrom32to31:	equ CurveRightEndBlock8
	CurveRightEndPage1TOPChangedPixelsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom32to31.bin"
	CurveRightEndPage1TOPAddressesfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom32to31.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom32to31.bin"

;BC73

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock9:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom32to31:	equ CurveRightEndBlock9
	CurveRightEndPage1BOTTOMChangedPixelsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom32to31.bin"
	CurveRightEndPage1BOTTOMAddressesfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom32to31.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom32to31:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom32to31.bin"

;884A

	BlockCurveRightEndPage0TOPfrom33to32:	equ CurveRightEndBlock9
	CurveRightEndPage0TOPChangedPixelsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom33to32.bin"
	CurveRightEndPage0TOPAddressesfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom33to32.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom33to32.bin"

;884B

	BlockCurveRightEndPage0BOTTOMfrom33to32:	equ CurveRightEndBlock9
	CurveRightEndPage0BOTTOMChangedPixelsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom33to32.bin"
	CurveRightEndPage0BOTTOMAddressesfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom33to32.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom33to32.bin"

;90E7

	BlockCurveRightEndPage1TOPfrom33to32:	equ CurveRightEndBlock9
	CurveRightEndPage1TOPChangedPixelsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom33to32.bin"
	CurveRightEndPage1TOPAddressesfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom33to32.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom33to32.bin"

;90E8

	BlockCurveRightEndPage1BOTTOMfrom33to32:	equ CurveRightEndBlock9
	CurveRightEndPage1BOTTOMChangedPixelsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom33to32.bin"
	CurveRightEndPage1BOTTOMAddressesfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom33to32.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom33to32:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom33to32.bin"

;9984

	BlockCurveRightEndPage0TOPfrom34to33:	equ CurveRightEndBlock9
	CurveRightEndPage0TOPChangedPixelsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom34to33.bin"
	CurveRightEndPage0TOPAddressesfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom34to33.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom34to33.bin"

;9985

	BlockCurveRightEndPage0BOTTOMfrom34to33:	equ CurveRightEndBlock9
	CurveRightEndPage0BOTTOMChangedPixelsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom34to33.bin"
	CurveRightEndPage0BOTTOMAddressesfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom34to33.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom34to33.bin"

;A31F

	BlockCurveRightEndPage1TOPfrom34to33:	equ CurveRightEndBlock9
	CurveRightEndPage1TOPChangedPixelsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom34to33.bin"
	CurveRightEndPage1TOPAddressesfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom34to33.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom34to33.bin"

;A320

	BlockCurveRightEndPage1BOTTOMfrom34to33:	equ CurveRightEndBlock9
	CurveRightEndPage1BOTTOMChangedPixelsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom34to33.bin"
	CurveRightEndPage1BOTTOMAddressesfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom34to33.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom34to33:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom34to33.bin"

;ACBA

	BlockCurveRightEndPage0TOPfrom35to34:	equ CurveRightEndBlock9
	CurveRightEndPage0TOPChangedPixelsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom35to34.bin"
	CurveRightEndPage0TOPAddressesfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom35to34.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom35to34.bin"

;ACBB

	BlockCurveRightEndPage0BOTTOMfrom35to34:	equ CurveRightEndBlock9
	CurveRightEndPage0BOTTOMChangedPixelsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom35to34.bin"
	CurveRightEndPage0BOTTOMAddressesfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom35to34.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom35to34.bin"

;B473

	BlockCurveRightEndPage1TOPfrom35to34:	equ CurveRightEndBlock9
	CurveRightEndPage1TOPChangedPixelsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom35to34.bin"
	CurveRightEndPage1TOPAddressesfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom35to34.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom35to34.bin"

;B474

	BlockCurveRightEndPage1BOTTOMfrom35to34:	equ CurveRightEndBlock9
	CurveRightEndPage1BOTTOMChangedPixelsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom35to34.bin"
	CurveRightEndPage1BOTTOMAddressesfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom35to34.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom35to34:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom35to34.bin"

;BC2C

	BlockCurveRightEndPage0TOPfrom36to35:	equ CurveRightEndBlock9
	CurveRightEndPage0TOPChangedPixelsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom36to35.bin"
	CurveRightEndPage0TOPAddressesfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom36to35.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom36to35.bin"

;BC2D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock10:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom36to35:	equ CurveRightEndBlock10
	CurveRightEndPage0BOTTOMChangedPixelsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom36to35.bin"
	CurveRightEndPage0BOTTOMAddressesfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom36to35.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom36to35.bin"

;8912

	BlockCurveRightEndPage1TOPfrom36to35:	equ CurveRightEndBlock10
	CurveRightEndPage1TOPChangedPixelsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom36to35.bin"
	CurveRightEndPage1TOPAddressesfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom36to35.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom36to35.bin"

;8913

	BlockCurveRightEndPage1BOTTOMfrom36to35:	equ CurveRightEndBlock10
	CurveRightEndPage1BOTTOMChangedPixelsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom36to35.bin"
	CurveRightEndPage1BOTTOMAddressesfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom36to35.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom36to35:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom36to35.bin"

;9225

	BlockCurveRightEndPage0TOPfrom37to36:	equ CurveRightEndBlock10
	CurveRightEndPage0TOPChangedPixelsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom37to36.bin"
	CurveRightEndPage0TOPAddressesfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom37to36.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom37to36.bin"

;9226

	BlockCurveRightEndPage0BOTTOMfrom37to36:	equ CurveRightEndBlock10
	CurveRightEndPage0BOTTOMChangedPixelsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom37to36.bin"
	CurveRightEndPage0BOTTOMAddressesfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom37to36.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom37to36.bin"

;9A70

	BlockCurveRightEndPage1TOPfrom37to36:	equ CurveRightEndBlock10
	CurveRightEndPage1TOPChangedPixelsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom37to36.bin"
	CurveRightEndPage1TOPAddressesfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom37to36.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom37to36.bin"

;9A71

	BlockCurveRightEndPage1BOTTOMfrom37to36:	equ CurveRightEndBlock10
	CurveRightEndPage1BOTTOMChangedPixelsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom37to36.bin"
	CurveRightEndPage1BOTTOMAddressesfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom37to36.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom37to36:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom37to36.bin"

;A2BB

	BlockCurveRightEndPage0TOPfrom38to37:	equ CurveRightEndBlock10
	CurveRightEndPage0TOPChangedPixelsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom38to37.bin"
	CurveRightEndPage0TOPAddressesfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom38to37.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom38to37.bin"

;A2BC

	BlockCurveRightEndPage0BOTTOMfrom38to37:	equ CurveRightEndBlock10
	CurveRightEndPage0BOTTOMChangedPixelsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom38to37.bin"
	CurveRightEndPage0BOTTOMAddressesfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom38to37.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom38to37.bin"

;ABC6

	BlockCurveRightEndPage1TOPfrom38to37:	equ CurveRightEndBlock10
	CurveRightEndPage1TOPChangedPixelsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom38to37.bin"
	CurveRightEndPage1TOPAddressesfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom38to37.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom38to37.bin"

;ABC7

	BlockCurveRightEndPage1BOTTOMfrom38to37:	equ CurveRightEndBlock10
	CurveRightEndPage1BOTTOMChangedPixelsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom38to37.bin"
	CurveRightEndPage1BOTTOMAddressesfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom38to37.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom38to37:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom38to37.bin"

;B4D1

	BlockCurveRightEndPage0TOPfrom39to38:	equ CurveRightEndBlock10
	CurveRightEndPage0TOPChangedPixelsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom39to38.bin"
	CurveRightEndPage0TOPAddressesfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom39to38.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom39to38.bin"

;B4D2

	BlockCurveRightEndPage0BOTTOMfrom39to38:	equ CurveRightEndBlock10
	CurveRightEndPage0BOTTOMChangedPixelsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom39to38.bin"
	CurveRightEndPage0BOTTOMAddressesfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom39to38.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom39to38.bin"

;BD0E

	BlockCurveRightEndPage1TOPfrom39to38:	equ CurveRightEndBlock10
	CurveRightEndPage1TOPChangedPixelsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom39to38.bin"
	CurveRightEndPage1TOPAddressesfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom39to38.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom39to38.bin"

;BD0F

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock11:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom39to38:	equ CurveRightEndBlock11
	CurveRightEndPage1BOTTOMChangedPixelsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom39to38.bin"
	CurveRightEndPage1BOTTOMAddressesfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom39to38.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom39to38:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom39to38.bin"

;883C

	BlockCurveRightEndPage0TOPfrom40to39:	equ CurveRightEndBlock11
	CurveRightEndPage0TOPChangedPixelsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom40to39.bin"
	CurveRightEndPage0TOPAddressesfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom40to39.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom40to39.bin"

;883D

	BlockCurveRightEndPage0BOTTOMfrom40to39:	equ CurveRightEndBlock11
	CurveRightEndPage0BOTTOMChangedPixelsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom40to39.bin"
	CurveRightEndPage0BOTTOMAddressesfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom40to39.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom40to39.bin"

;91C0

	BlockCurveRightEndPage1TOPfrom40to39:	equ CurveRightEndBlock11
	CurveRightEndPage1TOPChangedPixelsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom40to39.bin"
	CurveRightEndPage1TOPAddressesfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom40to39.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom40to39.bin"

;91C1

	BlockCurveRightEndPage1BOTTOMfrom40to39:	equ CurveRightEndBlock11
	CurveRightEndPage1BOTTOMChangedPixelsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom40to39.bin"
	CurveRightEndPage1BOTTOMAddressesfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom40to39.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom40to39:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom40to39.bin"

;9B44

	BlockCurveRightEndPage0TOPfrom41to40:	equ CurveRightEndBlock11
	CurveRightEndPage0TOPChangedPixelsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom41to40.bin"
	CurveRightEndPage0TOPAddressesfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom41to40.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom41to40.bin"

;9B45

	BlockCurveRightEndPage0BOTTOMfrom41to40:	equ CurveRightEndBlock11
	CurveRightEndPage0BOTTOMChangedPixelsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom41to40.bin"
	CurveRightEndPage0BOTTOMAddressesfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom41to40.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom41to40.bin"

;A2AF

	BlockCurveRightEndPage1TOPfrom41to40:	equ CurveRightEndBlock11
	CurveRightEndPage1TOPChangedPixelsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom41to40.bin"
	CurveRightEndPage1TOPAddressesfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom41to40.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom41to40.bin"

;A2B0

	BlockCurveRightEndPage1BOTTOMfrom41to40:	equ CurveRightEndBlock11
	CurveRightEndPage1BOTTOMChangedPixelsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom41to40.bin"
	CurveRightEndPage1BOTTOMAddressesfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom41to40.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom41to40:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom41to40.bin"

;AA1A

	BlockCurveRightEndPage0TOPfrom42to41:	equ CurveRightEndBlock11
	CurveRightEndPage0TOPChangedPixelsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom42to41.bin"
	CurveRightEndPage0TOPAddressesfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom42to41.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom42to41.bin"

;AA1B

	BlockCurveRightEndPage0BOTTOMfrom42to41:	equ CurveRightEndBlock11
	CurveRightEndPage0BOTTOMChangedPixelsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom42to41.bin"
	CurveRightEndPage0BOTTOMAddressesfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom42to41.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom42to41.bin"

;B3F4

	BlockCurveRightEndPage1TOPfrom42to41:	equ CurveRightEndBlock11
	CurveRightEndPage1TOPChangedPixelsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom42to41.bin"
	CurveRightEndPage1TOPAddressesfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom42to41.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom42to41.bin"

;B3F5

	BlockCurveRightEndPage1BOTTOMfrom42to41:	equ CurveRightEndBlock11
	CurveRightEndPage1BOTTOMChangedPixelsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom42to41.bin"
	CurveRightEndPage1BOTTOMAddressesfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom42to41.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom42to41:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom42to41.bin"

;BDCE

	BlockCurveRightEndPage0TOPfrom43to42:	equ CurveRightEndBlock11
	CurveRightEndPage0TOPChangedPixelsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom43to42.bin"
	CurveRightEndPage0TOPAddressesfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom43to42.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom43to42.bin"

;BDCF

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock12:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom43to42:	equ CurveRightEndBlock12
	CurveRightEndPage0BOTTOMChangedPixelsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom43to42.bin"
	CurveRightEndPage0BOTTOMAddressesfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom43to42.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom43to42.bin"

;87DB

	BlockCurveRightEndPage1TOPfrom43to42:	equ CurveRightEndBlock12
	CurveRightEndPage1TOPChangedPixelsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom43to42.bin"
	CurveRightEndPage1TOPAddressesfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom43to42.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom43to42.bin"

;87DC

	BlockCurveRightEndPage1BOTTOMfrom43to42:	equ CurveRightEndBlock12
	CurveRightEndPage1BOTTOMChangedPixelsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom43to42.bin"
	CurveRightEndPage1BOTTOMAddressesfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom43to42.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom43to42:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom43to42.bin"

;8FB7

	BlockCurveRightEndPage0TOPfrom44to43:	equ CurveRightEndBlock12
	CurveRightEndPage0TOPChangedPixelsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom44to43.bin"
	CurveRightEndPage0TOPAddressesfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom44to43.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom44to43.bin"

;8FB8

	BlockCurveRightEndPage0BOTTOMfrom44to43:	equ CurveRightEndBlock12
	CurveRightEndPage0BOTTOMChangedPixelsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom44to43.bin"
	CurveRightEndPage0BOTTOMAddressesfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom44to43.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom44to43.bin"

;97E8

	BlockCurveRightEndPage1TOPfrom44to43:	equ CurveRightEndBlock12
	CurveRightEndPage1TOPChangedPixelsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom44to43.bin"
	CurveRightEndPage1TOPAddressesfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom44to43.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom44to43.bin"

;97E9

	BlockCurveRightEndPage1BOTTOMfrom44to43:	equ CurveRightEndBlock12
	CurveRightEndPage1BOTTOMChangedPixelsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom44to43.bin"
	CurveRightEndPage1BOTTOMAddressesfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom44to43.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom44to43:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom44to43.bin"

;A019

	BlockCurveRightEndPage0TOPfrom45to44:	equ CurveRightEndBlock12
	CurveRightEndPage0TOPChangedPixelsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom45to44.bin"
	CurveRightEndPage0TOPAddressesfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom45to44.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom45to44.bin"

;A01A

	BlockCurveRightEndPage0BOTTOMfrom45to44:	equ CurveRightEndBlock12
	CurveRightEndPage0BOTTOMChangedPixelsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom45to44.bin"
	CurveRightEndPage0BOTTOMAddressesfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom45to44.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom45to44.bin"

;A9FA

	BlockCurveRightEndPage1TOPfrom45to44:	equ CurveRightEndBlock12
	CurveRightEndPage1TOPChangedPixelsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom45to44.bin"
	CurveRightEndPage1TOPAddressesfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom45to44.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom45to44.bin"

;A9FB

	BlockCurveRightEndPage1BOTTOMfrom45to44:	equ CurveRightEndBlock12
	CurveRightEndPage1BOTTOMChangedPixelsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom45to44.bin"
	CurveRightEndPage1BOTTOMAddressesfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom45to44.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom45to44:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom45to44.bin"

;B3DB

	BlockCurveRightEndPage0TOPfrom46to45:	equ CurveRightEndBlock12
	CurveRightEndPage0TOPChangedPixelsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom46to45.bin"
	CurveRightEndPage0TOPAddressesfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom46to45.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom46to45.bin"

;B3DC

	BlockCurveRightEndPage0BOTTOMfrom46to45:	equ CurveRightEndBlock12
	CurveRightEndPage0BOTTOMChangedPixelsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom46to45.bin"
	CurveRightEndPage0BOTTOMAddressesfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom46to45.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom46to45.bin"

;BB5C

	BlockCurveRightEndPage1TOPfrom46to45:	equ CurveRightEndBlock12
	CurveRightEndPage1TOPChangedPixelsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom46to45.bin"
	CurveRightEndPage1TOPAddressesfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom46to45.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom46to45.bin"

;BB5D

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock13:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom46to45:	equ CurveRightEndBlock13
	CurveRightEndPage1BOTTOMChangedPixelsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom46to45.bin"
	CurveRightEndPage1BOTTOMAddressesfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom46to45.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom46to45:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom46to45.bin"

;8780

	BlockCurveRightEndPage0TOPfrom47to46:	equ CurveRightEndBlock13
	CurveRightEndPage0TOPChangedPixelsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom47to46.bin"
	CurveRightEndPage0TOPAddressesfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom47to46.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom47to46.bin"

;8781

	BlockCurveRightEndPage0BOTTOMfrom47to46:	equ CurveRightEndBlock13
	CurveRightEndPage0BOTTOMChangedPixelsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom47to46.bin"
	CurveRightEndPage0BOTTOMAddressesfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom47to46.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom47to46.bin"

;91AF

	BlockCurveRightEndPage1TOPfrom47to46:	equ CurveRightEndBlock13
	CurveRightEndPage1TOPChangedPixelsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom47to46.bin"
	CurveRightEndPage1TOPAddressesfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom47to46.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom47to46.bin"

;91B0

	BlockCurveRightEndPage1BOTTOMfrom47to46:	equ CurveRightEndBlock13
	CurveRightEndPage1BOTTOMChangedPixelsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom47to46.bin"
	CurveRightEndPage1BOTTOMAddressesfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom47to46.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom47to46:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom47to46.bin"

;9BDE

	BlockCurveRightEndPage0TOPfrom48to47:	equ CurveRightEndBlock13
	CurveRightEndPage0TOPChangedPixelsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom48to47.bin"
	CurveRightEndPage0TOPAddressesfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom48to47.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom48to47.bin"

;9BDF

	BlockCurveRightEndPage0BOTTOMfrom48to47:	equ CurveRightEndBlock13
	CurveRightEndPage0BOTTOMChangedPixelsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom48to47.bin"
	CurveRightEndPage0BOTTOMAddressesfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom48to47.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom48to47.bin"

;A387

	BlockCurveRightEndPage1TOPfrom48to47:	equ CurveRightEndBlock13
	CurveRightEndPage1TOPChangedPixelsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom48to47.bin"
	CurveRightEndPage1TOPAddressesfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom48to47.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom48to47.bin"

;A388

	BlockCurveRightEndPage1BOTTOMfrom48to47:	equ CurveRightEndBlock13
	CurveRightEndPage1BOTTOMChangedPixelsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom48to47.bin"
	CurveRightEndPage1BOTTOMAddressesfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom48to47.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom48to47:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom48to47.bin"

;AB30

	BlockCurveRightEndPage0TOPfrom49to48:	equ CurveRightEndBlock13
	CurveRightEndPage0TOPChangedPixelsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom49to48.bin"
	CurveRightEndPage0TOPAddressesfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom49to48.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom49to48.bin"

;AB31

	BlockCurveRightEndPage0BOTTOMfrom49to48:	equ CurveRightEndBlock13
	CurveRightEndPage0BOTTOMChangedPixelsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom49to48.bin"
	CurveRightEndPage0BOTTOMAddressesfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom49to48.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom49to48.bin"

;B31D

	BlockCurveRightEndPage1TOPfrom49to48:	equ CurveRightEndBlock13
	CurveRightEndPage1TOPChangedPixelsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom49to48.bin"
	CurveRightEndPage1TOPAddressesfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom49to48.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom49to48.bin"

;B31E

	BlockCurveRightEndPage1BOTTOMfrom49to48:	equ CurveRightEndBlock13
	CurveRightEndPage1BOTTOMChangedPixelsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom49to48.bin"
	CurveRightEndPage1BOTTOMAddressesfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom49to48.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom49to48:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom49to48.bin"

;BB0A

	BlockCurveRightEndPage0TOPfrom50to49:	equ CurveRightEndBlock13
	CurveRightEndPage0TOPChangedPixelsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom50to49.bin"
	CurveRightEndPage0TOPAddressesfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom50to49.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom50to49.bin"

;BB0B

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock14:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom50to49:	equ CurveRightEndBlock14
	CurveRightEndPage0BOTTOMChangedPixelsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom50to49.bin"
	CurveRightEndPage0BOTTOMAddressesfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom50to49.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom50to49.bin"

;8AA9

	BlockCurveRightEndPage1TOPfrom50to49:	equ CurveRightEndBlock14
	CurveRightEndPage1TOPChangedPixelsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom50to49.bin"
	CurveRightEndPage1TOPAddressesfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom50to49.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom50to49.bin"

;8AAA

	BlockCurveRightEndPage1BOTTOMfrom50to49:	equ CurveRightEndBlock14
	CurveRightEndPage1BOTTOMChangedPixelsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom50to49.bin"
	CurveRightEndPage1BOTTOMAddressesfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom50to49.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom50to49:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom50to49.bin"

;9553

	BlockCurveRightEndPage0TOPfrom51to50:	equ CurveRightEndBlock14
	CurveRightEndPage0TOPChangedPixelsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom51to50.bin"
	CurveRightEndPage0TOPAddressesfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom51to50.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom51to50.bin"

;9554

	BlockCurveRightEndPage0BOTTOMfrom51to50:	equ CurveRightEndBlock14
	CurveRightEndPage0BOTTOMChangedPixelsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom51to50.bin"
	CurveRightEndPage0BOTTOMAddressesfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom51to50.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom51to50.bin"

;9D0D

	BlockCurveRightEndPage1TOPfrom51to50:	equ CurveRightEndBlock14
	CurveRightEndPage1TOPChangedPixelsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom51to50.bin"
	CurveRightEndPage1TOPAddressesfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom51to50.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom51to50.bin"

;9D0E

	BlockCurveRightEndPage1BOTTOMfrom51to50:	equ CurveRightEndBlock14
	CurveRightEndPage1BOTTOMChangedPixelsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom51to50.bin"
	CurveRightEndPage1BOTTOMAddressesfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom51to50.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom51to50:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom51to50.bin"

;A4C7

	BlockCurveRightEndPage0TOPfrom52to51:	equ CurveRightEndBlock14
	CurveRightEndPage0TOPChangedPixelsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom52to51.bin"
	CurveRightEndPage0TOPAddressesfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom52to51.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom52to51.bin"

;A4C8

	BlockCurveRightEndPage0BOTTOMfrom52to51:	equ CurveRightEndBlock14
	CurveRightEndPage0BOTTOMChangedPixelsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom52to51.bin"
	CurveRightEndPage0BOTTOMAddressesfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom52to51.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom52to51.bin"

;AC79

	BlockCurveRightEndPage1TOPfrom52to51:	equ CurveRightEndBlock14
	CurveRightEndPage1TOPChangedPixelsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom52to51.bin"
	CurveRightEndPage1TOPAddressesfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom52to51.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom52to51.bin"

;AC7A

	BlockCurveRightEndPage1BOTTOMfrom52to51:	equ CurveRightEndBlock14
	CurveRightEndPage1BOTTOMChangedPixelsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom52to51.bin"
	CurveRightEndPage1BOTTOMAddressesfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom52to51.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom52to51:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom52to51.bin"

;B42B

	BlockCurveRightEndPage0TOPfrom53to52:	equ CurveRightEndBlock14
	CurveRightEndPage0TOPChangedPixelsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom53to52.bin"
	CurveRightEndPage0TOPAddressesfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom53to52.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom53to52.bin"

;B42C

	BlockCurveRightEndPage0BOTTOMfrom53to52:	equ CurveRightEndBlock14
	CurveRightEndPage0BOTTOMChangedPixelsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom53to52.bin"
	CurveRightEndPage0BOTTOMAddressesfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom53to52.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom53to52.bin"

;BD7F

	BlockCurveRightEndPage1TOPfrom53to52:	equ CurveRightEndBlock14
	CurveRightEndPage1TOPChangedPixelsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom53to52.bin"
	CurveRightEndPage1TOPAddressesfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom53to52.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom53to52.bin"

;BD80

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock15:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom53to52:	equ CurveRightEndBlock15
	CurveRightEndPage1BOTTOMChangedPixelsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom53to52.bin"
	CurveRightEndPage1BOTTOMAddressesfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom53to52.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom53to52:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom53to52.bin"

;8953

	BlockCurveRightEndPage0TOPfrom54to53:	equ CurveRightEndBlock15
	CurveRightEndPage0TOPChangedPixelsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom54to53.bin"
	CurveRightEndPage0TOPAddressesfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom54to53.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom54to53.bin"

;8954

	BlockCurveRightEndPage0BOTTOMfrom54to53:	equ CurveRightEndBlock15
	CurveRightEndPage0BOTTOMChangedPixelsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom54to53.bin"
	CurveRightEndPage0BOTTOMAddressesfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom54to53.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom54to53.bin"

;924D

	BlockCurveRightEndPage1TOPfrom54to53:	equ CurveRightEndBlock15
	CurveRightEndPage1TOPChangedPixelsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom54to53.bin"
	CurveRightEndPage1TOPAddressesfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom54to53.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom54to53.bin"

;924E

	BlockCurveRightEndPage1BOTTOMfrom54to53:	equ CurveRightEndBlock15
	CurveRightEndPage1BOTTOMChangedPixelsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom54to53.bin"
	CurveRightEndPage1BOTTOMAddressesfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom54to53.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom54to53:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom54to53.bin"

;9B47

	BlockCurveRightEndPage0TOPfrom55to54:	equ CurveRightEndBlock15
	CurveRightEndPage0TOPChangedPixelsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom55to54.bin"
	CurveRightEndPage0TOPAddressesfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom55to54.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom55to54.bin"

;9B48

	BlockCurveRightEndPage0BOTTOMfrom55to54:	equ CurveRightEndBlock15
	CurveRightEndPage0BOTTOMChangedPixelsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom55to54.bin"
	CurveRightEndPage0BOTTOMAddressesfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom55to54.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom55to54.bin"

;A309

	BlockCurveRightEndPage1TOPfrom55to54:	equ CurveRightEndBlock15
	CurveRightEndPage1TOPChangedPixelsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom55to54.bin"
	CurveRightEndPage1TOPAddressesfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom55to54.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom55to54.bin"

;A30A

	BlockCurveRightEndPage1BOTTOMfrom55to54:	equ CurveRightEndBlock15
	CurveRightEndPage1BOTTOMChangedPixelsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom55to54.bin"
	CurveRightEndPage1BOTTOMAddressesfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom55to54.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom55to54:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom55to54.bin"

;AACB

	BlockCurveRightEndPage0TOPfrom56to55:	equ CurveRightEndBlock15
	CurveRightEndPage0TOPChangedPixelsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom56to55.bin"
	CurveRightEndPage0TOPAddressesfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom56to55.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom56to55.bin"

;AACC

	BlockCurveRightEndPage0BOTTOMfrom56to55:	equ CurveRightEndBlock15
	CurveRightEndPage0BOTTOMChangedPixelsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom56to55.bin"
	CurveRightEndPage0BOTTOMAddressesfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom56to55.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom56to55.bin"

;B438

	BlockCurveRightEndPage1TOPfrom56to55:	equ CurveRightEndBlock15
	CurveRightEndPage1TOPChangedPixelsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom56to55.bin"
	CurveRightEndPage1TOPAddressesfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom56to55.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom56to55.bin"

;B439

	BlockCurveRightEndPage1BOTTOMfrom56to55:	equ CurveRightEndBlock15
	CurveRightEndPage1BOTTOMChangedPixelsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom56to55.bin"
	CurveRightEndPage1BOTTOMAddressesfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom56to55.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom56to55:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom56to55.bin"

;BDA5

	BlockCurveRightEndPage0TOPfrom57to56:	equ CurveRightEndBlock15
	CurveRightEndPage0TOPChangedPixelsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom57to56.bin"
	CurveRightEndPage0TOPAddressesfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom57to56.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom57to56.bin"

;BDA6

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock16:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom57to56:	equ CurveRightEndBlock16
	CurveRightEndPage0BOTTOMChangedPixelsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom57to56.bin"
	CurveRightEndPage0BOTTOMAddressesfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom57to56.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom57to56.bin"

;88D1

	BlockCurveRightEndPage1TOPfrom57to56:	equ CurveRightEndBlock16
	CurveRightEndPage1TOPChangedPixelsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom57to56.bin"
	CurveRightEndPage1TOPAddressesfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom57to56.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom57to56.bin"

;88D2

	BlockCurveRightEndPage1BOTTOMfrom57to56:	equ CurveRightEndBlock16
	CurveRightEndPage1BOTTOMChangedPixelsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom57to56.bin"
	CurveRightEndPage1BOTTOMAddressesfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom57to56.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom57to56:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom57to56.bin"

;91A3

	BlockCurveRightEndPage0TOPfrom58to57:	equ CurveRightEndBlock16
	CurveRightEndPage0TOPChangedPixelsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom58to57.bin"
	CurveRightEndPage0TOPAddressesfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom58to57.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom58to57.bin"

;91A4

	BlockCurveRightEndPage0BOTTOMfrom58to57:	equ CurveRightEndBlock16
	CurveRightEndPage0BOTTOMChangedPixelsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom58to57.bin"
	CurveRightEndPage0BOTTOMAddressesfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom58to57.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom58to57.bin"

;99F1

	BlockCurveRightEndPage1TOPfrom58to57:	equ CurveRightEndBlock16
	CurveRightEndPage1TOPChangedPixelsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom58to57.bin"
	CurveRightEndPage1TOPAddressesfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom58to57.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom58to57.bin"

;99F2

	BlockCurveRightEndPage1BOTTOMfrom58to57:	equ CurveRightEndBlock16
	CurveRightEndPage1BOTTOMChangedPixelsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom58to57.bin"
	CurveRightEndPage1BOTTOMAddressesfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom58to57.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom58to57:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom58to57.bin"

;A23F

	BlockCurveRightEndPage0TOPfrom59to58:	equ CurveRightEndBlock16
	CurveRightEndPage0TOPChangedPixelsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom59to58.bin"
	CurveRightEndPage0TOPAddressesfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom59to58.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom59to58.bin"

;A240

	BlockCurveRightEndPage0BOTTOMfrom59to58:	equ CurveRightEndBlock16
	CurveRightEndPage0BOTTOMChangedPixelsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom59to58.bin"
	CurveRightEndPage0BOTTOMAddressesfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom59to58.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom59to58.bin"

;AAA2

	BlockCurveRightEndPage1TOPfrom59to58:	equ CurveRightEndBlock16
	CurveRightEndPage1TOPChangedPixelsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom59to58.bin"
	CurveRightEndPage1TOPAddressesfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom59to58.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom59to58.bin"

;AAA3

	BlockCurveRightEndPage1BOTTOMfrom59to58:	equ CurveRightEndBlock16
	CurveRightEndPage1BOTTOMChangedPixelsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom59to58.bin"
	CurveRightEndPage1BOTTOMAddressesfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom59to58.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom59to58:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom59to58.bin"

;B305

	BlockCurveRightEndPage0TOPfrom60to59:	equ CurveRightEndBlock16
	CurveRightEndPage0TOPChangedPixelsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom60to59.bin"
	CurveRightEndPage0TOPAddressesfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom60to59.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom60to59.bin"

;B306

	BlockCurveRightEndPage0BOTTOMfrom60to59:	equ CurveRightEndBlock16
	CurveRightEndPage0BOTTOMChangedPixelsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom60to59.bin"
	CurveRightEndPage0BOTTOMAddressesfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom60to59.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom60to59.bin"

;BB2D

	BlockCurveRightEndPage1TOPfrom60to59:	equ CurveRightEndBlock16
	CurveRightEndPage1TOPChangedPixelsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom60to59.bin"
	CurveRightEndPage1TOPAddressesfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom60to59.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom60to59.bin"

;BB2E

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock17:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom60to59:	equ CurveRightEndBlock17
	CurveRightEndPage1BOTTOMChangedPixelsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom60to59.bin"
	CurveRightEndPage1BOTTOMAddressesfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom60to59.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom60to59:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom60to59.bin"

;8827

	BlockCurveRightEndPage0TOPfrom61to60:	equ CurveRightEndBlock17
	CurveRightEndPage0TOPChangedPixelsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom61to60.bin"
	CurveRightEndPage0TOPAddressesfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom61to60.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom61to60.bin"

;8828

	BlockCurveRightEndPage0BOTTOMfrom61to60:	equ CurveRightEndBlock17
	CurveRightEndPage0BOTTOMChangedPixelsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom61to60.bin"
	CurveRightEndPage0BOTTOMAddressesfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom61to60.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom61to60.bin"

;90E7

	BlockCurveRightEndPage1TOPfrom61to60:	equ CurveRightEndBlock17
	CurveRightEndPage1TOPChangedPixelsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom61to60.bin"
	CurveRightEndPage1TOPAddressesfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom61to60.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom61to60.bin"

;90E8

	BlockCurveRightEndPage1BOTTOMfrom61to60:	equ CurveRightEndBlock17
	CurveRightEndPage1BOTTOMChangedPixelsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom61to60.bin"
	CurveRightEndPage1BOTTOMAddressesfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom61to60.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom61to60:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom61to60.bin"

;99A7

	BlockCurveRightEndPage0TOPfrom62to61:	equ CurveRightEndBlock17
	CurveRightEndPage0TOPChangedPixelsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom62to61.bin"
	CurveRightEndPage0TOPAddressesfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom62to61.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom62to61.bin"

;99A8

	BlockCurveRightEndPage0BOTTOMfrom62to61:	equ CurveRightEndBlock17
	CurveRightEndPage0BOTTOMChangedPixelsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom62to61.bin"
	CurveRightEndPage0BOTTOMAddressesfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom62to61.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom62to61.bin"

;A3F0

	BlockCurveRightEndPage1TOPfrom62to61:	equ CurveRightEndBlock17
	CurveRightEndPage1TOPChangedPixelsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom62to61.bin"
	CurveRightEndPage1TOPAddressesfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom62to61.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom62to61.bin"

;A3F1

	BlockCurveRightEndPage1BOTTOMfrom62to61:	equ CurveRightEndBlock17
	CurveRightEndPage1BOTTOMChangedPixelsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom62to61.bin"
	CurveRightEndPage1BOTTOMAddressesfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom62to61.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom62to61:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom62to61.bin"

;AE39

	BlockCurveRightEndPage0TOPfrom63to62:	equ CurveRightEndBlock17
	CurveRightEndPage0TOPChangedPixelsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom63to62.bin"
	CurveRightEndPage0TOPAddressesfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom63to62.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom63to62.bin"

;AE3A

	BlockCurveRightEndPage0BOTTOMfrom63to62:	equ CurveRightEndBlock17
	CurveRightEndPage0BOTTOMChangedPixelsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom63to62.bin"
	CurveRightEndPage0BOTTOMAddressesfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom63to62.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom63to62.bin"

;B546

	BlockCurveRightEndPage1TOPfrom63to62:	equ CurveRightEndBlock17
	CurveRightEndPage1TOPChangedPixelsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom63to62.bin"
	CurveRightEndPage1TOPAddressesfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom63to62.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom63to62.bin"

;B547

	BlockCurveRightEndPage1BOTTOMfrom63to62:	equ CurveRightEndBlock17
	CurveRightEndPage1BOTTOMChangedPixelsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom63to62.bin"
	CurveRightEndPage1BOTTOMAddressesfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom63to62.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom63to62:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom63to62.bin"

;BC53

	BlockCurveRightEndPage0TOPfrom64to63:	equ CurveRightEndBlock17
	CurveRightEndPage0TOPChangedPixelsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom64to63.bin"
	CurveRightEndPage0TOPAddressesfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom64to63.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom64to63.bin"

;BC54

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock18:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom64to63:	equ CurveRightEndBlock18
	CurveRightEndPage0BOTTOMChangedPixelsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom64to63.bin"
	CurveRightEndPage0BOTTOMAddressesfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom64to63.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom64to63.bin"

;883F

	BlockCurveRightEndPage1TOPfrom64to63:	equ CurveRightEndBlock18
	CurveRightEndPage1TOPChangedPixelsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom64to63.bin"
	CurveRightEndPage1TOPAddressesfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom64to63.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom64to63.bin"

;8840

	BlockCurveRightEndPage1BOTTOMfrom64to63:	equ CurveRightEndBlock18
	CurveRightEndPage1BOTTOMChangedPixelsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom64to63.bin"
	CurveRightEndPage1BOTTOMAddressesfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom64to63.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom64to63:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom64to63.bin"

;907F

	BlockCurveRightEndPage0TOPfrom65to64:	equ CurveRightEndBlock18
	CurveRightEndPage0TOPChangedPixelsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom65to64.bin"
	CurveRightEndPage0TOPAddressesfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom65to64.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom65to64.bin"

;9080

	BlockCurveRightEndPage0BOTTOMfrom65to64:	equ CurveRightEndBlock18
	CurveRightEndPage0BOTTOMChangedPixelsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom65to64.bin"
	CurveRightEndPage0BOTTOMAddressesfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom65to64.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom65to64.bin"

;99F4

	BlockCurveRightEndPage1TOPfrom65to64:	equ CurveRightEndBlock18
	CurveRightEndPage1TOPChangedPixelsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom65to64.bin"
	CurveRightEndPage1TOPAddressesfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom65to64.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom65to64.bin"

;99F5

	BlockCurveRightEndPage1BOTTOMfrom65to64:	equ CurveRightEndBlock18
	CurveRightEndPage1BOTTOMChangedPixelsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom65to64.bin"
	CurveRightEndPage1BOTTOMAddressesfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom65to64.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom65to64:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom65to64.bin"

;A369

	BlockCurveRightEndPage0TOPfrom66to65:	equ CurveRightEndBlock18
	CurveRightEndPage0TOPChangedPixelsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom66to65.bin"
	CurveRightEndPage0TOPAddressesfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom66to65.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom66to65.bin"

;A36A

	BlockCurveRightEndPage0BOTTOMfrom66to65:	equ CurveRightEndBlock18
	CurveRightEndPage0BOTTOMChangedPixelsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom66to65.bin"
	CurveRightEndPage0BOTTOMAddressesfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom66to65.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom66to65.bin"

;AC01

	BlockCurveRightEndPage1TOPfrom66to65:	equ CurveRightEndBlock18
	CurveRightEndPage1TOPChangedPixelsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom66to65.bin"
	CurveRightEndPage1TOPAddressesfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom66to65.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom66to65.bin"

;AC02

	BlockCurveRightEndPage1BOTTOMfrom66to65:	equ CurveRightEndBlock18
	CurveRightEndPage1BOTTOMChangedPixelsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom66to65.bin"
	CurveRightEndPage1BOTTOMAddressesfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom66to65.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom66to65:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom66to65.bin"

;B499

	BlockCurveRightEndPage0TOPfrom67to66:	equ CurveRightEndBlock18
	CurveRightEndPage0TOPChangedPixelsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom67to66.bin"
	CurveRightEndPage0TOPAddressesfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom67to66.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom67to66.bin"

;B49A

	BlockCurveRightEndPage0BOTTOMfrom67to66:	equ CurveRightEndBlock18
	CurveRightEndPage0BOTTOMChangedPixelsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom67to66.bin"
	CurveRightEndPage0BOTTOMAddressesfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom67to66.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom67to66.bin"

;BD21

	BlockCurveRightEndPage1TOPfrom67to66:	equ CurveRightEndBlock18
	CurveRightEndPage1TOPChangedPixelsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom67to66.bin"
	CurveRightEndPage1TOPAddressesfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom67to66.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom67to66.bin"

;BD22

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock19:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom67to66:	equ CurveRightEndBlock19
	CurveRightEndPage1BOTTOMChangedPixelsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom67to66.bin"
	CurveRightEndPage1BOTTOMAddressesfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom67to66.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom67to66:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom67to66.bin"

;8887

	BlockCurveRightEndPage0TOPfrom68to67:	equ CurveRightEndBlock19
	CurveRightEndPage0TOPChangedPixelsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom68to67.bin"
	CurveRightEndPage0TOPAddressesfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom68to67.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom68to67.bin"

;8888

	BlockCurveRightEndPage0BOTTOMfrom68to67:	equ CurveRightEndBlock19
	CurveRightEndPage0BOTTOMChangedPixelsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom68to67.bin"
	CurveRightEndPage0BOTTOMAddressesfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom68to67.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom68to67.bin"

;9005

	BlockCurveRightEndPage1TOPfrom68to67:	equ CurveRightEndBlock19
	CurveRightEndPage1TOPChangedPixelsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom68to67.bin"
	CurveRightEndPage1TOPAddressesfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom68to67.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom68to67.bin"

;9006

	BlockCurveRightEndPage1BOTTOMfrom68to67:	equ CurveRightEndBlock19
	CurveRightEndPage1BOTTOMChangedPixelsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom68to67.bin"
	CurveRightEndPage1BOTTOMAddressesfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom68to67.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom68to67:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom68to67.bin"

;9783

	BlockCurveRightEndPage0TOPfrom69to68:	equ CurveRightEndBlock19
	CurveRightEndPage0TOPChangedPixelsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom69to68.bin"
	CurveRightEndPage0TOPAddressesfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom69to68.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom69to68.bin"

;9784

	BlockCurveRightEndPage0BOTTOMfrom69to68:	equ CurveRightEndBlock19
	CurveRightEndPage0BOTTOMChangedPixelsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom69to68.bin"
	CurveRightEndPage0BOTTOMAddressesfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom69to68.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom69to68.bin"

;A082

	BlockCurveRightEndPage1TOPfrom69to68:	equ CurveRightEndBlock19
	CurveRightEndPage1TOPChangedPixelsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom69to68.bin"
	CurveRightEndPage1TOPAddressesfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom69to68.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom69to68.bin"

;A083

	BlockCurveRightEndPage1BOTTOMfrom69to68:	equ CurveRightEndBlock19
	CurveRightEndPage1BOTTOMChangedPixelsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom69to68.bin"
	CurveRightEndPage1BOTTOMAddressesfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom69to68.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom69to68:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom69to68.bin"

;A981

	BlockCurveRightEndPage0TOPfrom70to69:	equ CurveRightEndBlock19
	CurveRightEndPage0TOPChangedPixelsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom70to69.bin"
	CurveRightEndPage0TOPAddressesfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom70to69.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom70to69.bin"

;A982

	BlockCurveRightEndPage0BOTTOMfrom70to69:	equ CurveRightEndBlock19
	CurveRightEndPage0BOTTOMChangedPixelsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom70to69.bin"
	CurveRightEndPage0BOTTOMAddressesfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom70to69.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom70to69.bin"

;B0C8

	BlockCurveRightEndPage1TOPfrom70to69:	equ CurveRightEndBlock19
	CurveRightEndPage1TOPChangedPixelsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom70to69.bin"
	CurveRightEndPage1TOPAddressesfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom70to69.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom70to69.bin"

;B0C9

	BlockCurveRightEndPage1BOTTOMfrom70to69:	equ CurveRightEndBlock19
	CurveRightEndPage1BOTTOMChangedPixelsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom70to69.bin"
	CurveRightEndPage1BOTTOMAddressesfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom70to69.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom70to69:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom70to69.bin"

;B80F

	BlockCurveRightEndPage0TOPfrom71to70:	equ CurveRightEndBlock19
	CurveRightEndPage0TOPChangedPixelsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom71to70.bin"
	CurveRightEndPage0TOPAddressesfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom71to70.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom71to70.bin"

;B810

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock20:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage0BOTTOMfrom71to70:	equ CurveRightEndBlock20
	CurveRightEndPage0BOTTOMChangedPixelsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom71to70.bin"
	CurveRightEndPage0BOTTOMAddressesfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom71to70.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom71to70.bin"

;896F

	BlockCurveRightEndPage1TOPfrom71to70:	equ CurveRightEndBlock20
	CurveRightEndPage1TOPChangedPixelsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom71to70.bin"
	CurveRightEndPage1TOPAddressesfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom71to70.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom71to70.bin"

;8970

	BlockCurveRightEndPage1BOTTOMfrom71to70:	equ CurveRightEndBlock20
	CurveRightEndPage1BOTTOMChangedPixelsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom71to70.bin"
	CurveRightEndPage1BOTTOMAddressesfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom71to70.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom71to70:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom71to70.bin"

;92DF

	BlockCurveRightEndPage0TOPfrom72to71:	equ CurveRightEndBlock20
	CurveRightEndPage0TOPChangedPixelsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom72to71.bin"
	CurveRightEndPage0TOPAddressesfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom72to71.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom72to71.bin"

;92E0

	BlockCurveRightEndPage0BOTTOMfrom72to71:	equ CurveRightEndBlock20
	CurveRightEndPage0BOTTOMChangedPixelsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom72to71.bin"
	CurveRightEndPage0BOTTOMAddressesfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom72to71.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom72to71.bin"

;9AEC

	BlockCurveRightEndPage1TOPfrom72to71:	equ CurveRightEndBlock20
	CurveRightEndPage1TOPChangedPixelsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom72to71.bin"
	CurveRightEndPage1TOPAddressesfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom72to71.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom72to71.bin"

;9AED

	BlockCurveRightEndPage1BOTTOMfrom72to71:	equ CurveRightEndBlock20
	CurveRightEndPage1BOTTOMChangedPixelsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom72to71.bin"
	CurveRightEndPage1BOTTOMAddressesfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom72to71.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom72to71:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom72to71.bin"

;A2F9

	BlockCurveRightEndPage0TOPfrom73to72:	equ CurveRightEndBlock20
	CurveRightEndPage0TOPChangedPixelsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom73to72.bin"
	CurveRightEndPage0TOPAddressesfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom73to72.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom73to72.bin"

;A2FA

	BlockCurveRightEndPage0BOTTOMfrom73to72:	equ CurveRightEndBlock20
	CurveRightEndPage0BOTTOMChangedPixelsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom73to72.bin"
	CurveRightEndPage0BOTTOMAddressesfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom73to72.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom73to72.bin"

;AA6B

	BlockCurveRightEndPage1TOPfrom73to72:	equ CurveRightEndBlock20
	CurveRightEndPage1TOPChangedPixelsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom73to72.bin"
	CurveRightEndPage1TOPAddressesfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom73to72.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom73to72.bin"

;AA6C

	BlockCurveRightEndPage1BOTTOMfrom73to72:	equ CurveRightEndBlock20
	CurveRightEndPage1BOTTOMChangedPixelsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom73to72.bin"
	CurveRightEndPage1BOTTOMAddressesfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom73to72.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom73to72:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom73to72.bin"

;B1DD

	BlockCurveRightEndPage0TOPfrom74to73:	equ CurveRightEndBlock20
	CurveRightEndPage0TOPChangedPixelsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom74to73.bin"
	CurveRightEndPage0TOPAddressesfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom74to73.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom74to73.bin"

;B1DE

	BlockCurveRightEndPage0BOTTOMfrom74to73:	equ CurveRightEndBlock20
	CurveRightEndPage0BOTTOMChangedPixelsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom74to73.bin"
	CurveRightEndPage0BOTTOMAddressesfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom74to73.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom74to73.bin"

;BA7B

	BlockCurveRightEndPage1TOPfrom74to73:	equ CurveRightEndBlock20
	CurveRightEndPage1TOPChangedPixelsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom74to73.bin"
	CurveRightEndPage1TOPAddressesfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom74to73.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom74to73.bin"

;BA7C

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

CurveRightEndBlock21:  			equ   ($-RomStartAddress) and (romsize-1) / RomBlockSize
	phase 0x8000

	BlockCurveRightEndPage1BOTTOMfrom74to73:	equ CurveRightEndBlock21
	CurveRightEndPage1BOTTOMChangedPixelsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom74to73.bin"
	CurveRightEndPage1BOTTOMAddressesfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom74to73.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom74to73:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom74to73.bin"

;889D

	BlockCurveRightEndPage0TOPfrom75to74:	equ CurveRightEndBlock21
	CurveRightEndPage0TOPChangedPixelsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPchangedpixelsfrom75to74.bin"
	CurveRightEndPage0TOPAddressesfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPaddressesfrom75to74.bin"
	CurveRightEndPage0TOPWriteInstructionsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\TOPwriteinstructionsfrom75to74.bin"

;889E

	BlockCurveRightEndPage0BOTTOMfrom75to74:	equ CurveRightEndBlock21
	CurveRightEndPage0BOTTOMChangedPixelsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMchangedpixelsfrom75to74.bin"
	CurveRightEndPage0BOTTOMAddressesfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMaddressesfrom75to74.bin"
	CurveRightEndPage0BOTTOMWriteInstructionsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage0\BOTTOMwriteinstructionsfrom75to74.bin"

;906B

	BlockCurveRightEndPage1TOPfrom75to74:	equ CurveRightEndBlock21
	CurveRightEndPage1TOPChangedPixelsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPchangedpixelsfrom75to74.bin"
	CurveRightEndPage1TOPAddressesfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPaddressesfrom75to74.bin"
	CurveRightEndPage1TOPWriteInstructionsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\TOPwriteinstructionsfrom75to74.bin"

;906C

	BlockCurveRightEndPage1BOTTOMfrom75to74:	equ CurveRightEndBlock21
	CurveRightEndPage1BOTTOMChangedPixelsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMchangedpixelsfrom75to74.bin"
	CurveRightEndPage1BOTTOMAddressesfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMaddressesfrom75to74.bin"
	CurveRightEndPage1BOTTOMWriteInstructionsfrom75to74:
	incbin "..\grapx\RacingGame\CurveRightEndAnimationPage1\BOTTOMwriteinstructionsfrom75to74.bin"

;9839

	dephase	
	DS RomBlockSize - $ and (RomBlockSize - 1), -1	; fill remainder of block

