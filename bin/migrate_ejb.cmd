
set /p NAME=Please enter ejb name:

pushd C:\dev\cms\branches\CLIMS_P3\bin

call "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:update /path:"C:\dev\cms\branches\CLIMS_P3" /notempfile /closeonend:2
call dev clean -l C:\dev\cms\branches\CLIMS_P3\buildlog\clean.log
call dev compile -l C:\dev\cms\branches\CLIMS_P3\buildlog\compile.log
call dev dist-cms-jar -l C:\dev\cms\branches\CLIMS_P3\buildlog\dist.log
call dev migrateejb wls2was "%NAME%"