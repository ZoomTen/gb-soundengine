@echo off
echo Creating linkfile...
cmd /c makelinkgbs.bat %1
echo Assembling GBS...
rgbasm -o%1.obj %1.asm
echo Linking GBS..
xlink95 %1.txt
echo Done.
del %1.obj
del %1.txt
dd if=%1.gbs of=data.bin skip=1136 bs=1
dd if=%1.gbs of=header.bin bs=1 count=112
copy /b header.bin+data.bin %1_out.gbs
del header.bin
del data.bin
del %1.gbs
@echo on