@echo off

set /p NAME=Please enter production build no:

pushd C:\dev\cms\branches\CLIMS_P3\bin

call "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:update /path:"C:\dev\cms\branches\CLIMS_P3" /notempfile /closeonend:2
call dev clean -l C:\dev\cms\branches\CLIMS_P3\build\logs\clean.log
call dev compile -l C:\dev\cms\branches\CLIMS_P3\build\logs\compile.log
call dev dist-unix -l C:\dev\cms\branches\CLIMS_P3\build\logs\dist.log
call dev ear
call dev buildnumber "%NAME%" "C:\dev\cms\branches\CLIMS_P3\build\dist\cms.ear"

popd

PAUSE