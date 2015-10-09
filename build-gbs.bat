@echo off

::SET GBS FILE NAME HERE::
set gbs=gbstest

echo Assembling GBS...
rgbasm -o%gbs%.obj %gbs%.asm

echo Linking GBS..
rgblink -o %gbs%.gbs %gbs%.obj

echo Done.

del %gbs%.obj

dd if=%gbs%.gbs of=data.bin skip=1136 bs=1
dd if=%gbs%.gbs of=header.bin bs=1 count=112
copy /b header.bin+data.bin %gbs%_out.gbs

del header.bin
del data.bin
del %gbs%.gbs

pause

@echo on