@echo off
echo Assembling GBS...
rgbasm -o%1.obj %1.asm
echo Linking GBS..
rgblink -o %1.gbs %1.obj
echo Done.
del %1.obj
dd if=%1.gbs of=data.bin skip=1136 bs=1
dd if=%1.gbs of=header.bin bs=1 count=112
copy /b header.bin+data.bin %1_out.gbs
del header.bin
del data.bin
del %1.gbs
@echo on
pause