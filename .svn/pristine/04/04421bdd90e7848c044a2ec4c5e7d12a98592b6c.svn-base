@echo off
SETLOCAL

REM ######################################################################
REM # Utility tool to grab files from a folder to a specific folder in a
REM # hierarchy manner.
REM # 
REM # Usage: grab.cmd [patch.file] [task] [from] [to]
REM # Example: grab.cmd patch.txt release . .\patch
REM #
REM # With above example, list of files in patch.txt will be grab from 
REM # current directory to .\patch folder, and the task is release
REM #
REM # Task available:
REM # 1. source 
REM # 	(will only grab the source, for all folders)
REM # 2. release
REM # 	(will only grab release files
REM # 	 i. \src, will grab .class from build\classes instead
REM #	 ii. \test, \scripts, \bin, \mock will be skipped)
REM #
REM # Contents inside the [patch.file] must started from the trunk folder
REM # ie. \3rdpartylib\integrobase.jar, \src\com\integrosys\...
REM # So, first character must start with '\'
REM # Files are separated by the line feed, like how we send patch mail.
REM #
REM ######################################################################

SET FILE_LIST=%~f1
SET TASK=%2
SET SRC=%~f3
SET DEST=%~f4

echo [info] Usage: grab.cmd [patch.file] [task:source^|release] [from] [to]

if "%FILE_LIST%" == "" (
	echo [warn] Please provide patch listing file name
	echo [warn] It should be put into current directory
	echo [info] 1 example grab.cmd patch.txt source \from\some\where \to\some\where
	goto :end
)

if not exist "%FILE_LIST%" (
	echo [error] The patch file [%FILE_LIST%] does not exists
	goto :end
)

if "%TASK%" == "" (
	echo [warn] please provide the task, either 'source' or 'release'
	echo [info] 2 example grab.cmd patch.txt source \from\some\where \to\some\where
	goto :end
)

if "%TASK%" == "source" goto :checksource
if "%TASK%" == "release" goto :checksource
echo [error] The task must be one of the value 'source' or 'release',
echo [error] which used to determine whether to grab the source or release files
goto :end

:checksource
if "%SRC%" == "" (
	echo [warn] please provide the source to be grab, eg. . for current directory
	echo [info] 3 example grab patch.txt release \from\some\where \to\some\where
	goto :end
)

if not exist "%SRC%" (
	echo [error] The destionation [%SRC%] does not exists
	goto :end
)

if "%DEST%" == "" (
	echo [warn] please provide the destination, eg. .\patch
	echo [info] example grab_patch.cmd patch.txt .\patch
	goto :end
)

if not exist "%DEST%" (
	echo [error] The destionation [%DEST%] does not exists
	goto :end
)

echo ------------------------------------------------------------------------
echo [info] Patch List File: [%FILE_LIST%], The Task is [%TASK%]
echo [info] Grab from [%SRC%] to destination [%DEST%]
echo ------------------------------------------------------------------------
echo.


REM # Loop through everyline in the patch file list
FOR /F "tokens=1,2,3 delims=." %%i in ( %FILE_LIST% ) do call :dograb %%~pi %%i %%j %%k
goto :end

:dograb
SET FOLDER=%1
SET FLAT_FILE_WO_EXT=%2
SET EXT=%3
SET POSSIBLE_EXT=%4
IF "%FOLDER:~0,1%" == "\" (SET FOLDER=%FOLDER:~1%)

if "%TASK%" == "release" goto :release
if "%TASK%" == "source" goto :source
goto :end

:release
if /I "%FOLDER:~0,4%" equ "test" (
	echo [info] the 'test' folder will be skipped
	goto :end
)

if /I "%FOLDER:~0,7%" equ "scripts" (
	echo [info] the 'scripts' folder will be skipped
	goto :end
)

if /I "%FOLDER:~0,3%" equ "bin" (
	echo [info] the 'bin' folder will be skipped
	goto :end
)

if /I "%FOLDER:~0,4%" equ "mock" (
	echo [info] the 'mock' folder will be skipped
	goto :end
)

REM # files in \src folder, shall grab .class instead
REM # inner class will be catered using wildcard, ie. XXX*.class
if /I "%FOLDER:~0,3%" equ "src" (
	echo [info] Copying from [%SRC%\build\classes\%FLAT_FILE_WO_EXT:~5%*.class] to [%DEST%\build\classes\%FOLDER:~4%]
	if not exist %DEST%\build\classes\%FOLDER:~4% (mkdir %DEST%\build\classes\%FOLDER:~4%)
	copy /Y %SRC%\build\classes\%FLAT_FILE_WO_EXT:~5%*.class %DEST%\build\classes\%FOLDER:~4% >NUL
	goto :end
)

if not exist %DEST%\%FOLDER% (mkdir %DEST%\%FOLDER%)
if not "%POSSIBLE_EXT%" == "" goto :do-release-double-dot
goto :do-release-single-dot

:do-release-double-dot
echo [info] Copying from [%SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT%.%POSSIBLE_EXT%] to [%DEST%\%FOLDER%]
copy /Y %SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT%.%POSSIBLE_EXT% %DEST%\%FOLDER% >NUL
goto :end

:do-release-single-dot
echo [info] Copying from [%SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT%] to [%DEST%\%FOLDER%]
copy /Y %SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT% %DEST%\%FOLDER% >NUL
goto :end

:source
if not "%POSSIBLE_EXT%" == "" goto :do-source-double-dot
goto :do-source-single-dot

:do-source-double-dot
echo [info] Copying file [%SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT%.%POSSIBLE_EXT%] to [%DEST%\%FOLDER%]
if not exist %DEST%\%FOLDER% (mkdir %DEST%\%FOLDER%)
copy /Y %SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT%.%POSSIBLE_EXT% %DEST%\%FOLDER% >NUL
goto :end

:do-source-single-dot
echo [info] Copying file [%SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT%] to [%DEST%\%FOLDER%]
if not exist %DEST%\%FOLDER% (mkdir %DEST%\%FOLDER%)
copy /Y %SRC%\%FLAT_FILE_WO_EXT:~1%.%EXT% %DEST%\%FOLDER% >NUL

:end
ENDLOCAL