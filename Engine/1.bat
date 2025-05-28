DEL C:\Users\bartf\Documents\openMSX\persistent\roms\MSXLegends.rom\MSXLegends.rom.SRAM

tniasm MSXHeroes.asm
rem "C:\Program Files\openMSX\openmsx.exe" -machine Panasonic_FS-A1GT -carta "MSXLegends.rom" -extb -command "set speed 400" -command "set grabinput on" -command "plug joyporta mouse" -command "set throttle off; after time 14 \"set throttle on\""  -ext moonsound


"C:\Program Files\openMSX\openmsx.exe" -machine Panasonic_FS-A1GT -carta "MSXLegends.rom" -command "plug joyporta mouse" -command "set throttle off; after time 6 \"set throttle on\""