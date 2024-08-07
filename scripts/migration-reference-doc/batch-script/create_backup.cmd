@echo off

SET FILE_NAME=%1
IF "%1" == "" (
	echo [error] No file to backup, exit.
	goto end
)

IF NOT EXIST "%1" (
	echo [error] "%1" not exists, exit.
	goto end
)

SET TO_DIR=%2
IF "%2" == "" (
	echo [warn] No directory specified, default to current directory.
	SET TO_DIR=.
) ELSE (
	IF NOT EXIST "%2" (
		echo [info] %2 not exists, attempting to create.
		mkdir %2
	)
)

FOR /f "tokens=1-4 delims=/-. " %%G IN ('date /t') DO (call :fx_fixdate %%G %%H %%I %%J)
goto continue

:fx_fixdate
if "%1:~0,1%" GTR "9" shift
FOR /f "skip=1 tokens=2-4 delims=(-)" %%G IN ('echo.^|date') DO (
   set %%G=%1&set %%H=%2&set %%I=%3)
goto :eof
   
:continue

FOR /f "tokens=*" %%G IN ('time/t') DO set _time=%%G
   SET _time=%_time:~0,2%%_time:~3,2%
   
FOR /f "tokens=*" %%G IN ('echo.^|dir /B %FILE_NAME%') DO (set SHORT_NAME=%%G)

echo [info] copy to %TO_DIR%\%SHORT_NAME%_%yy%%mm%%dd%_%_time%
copy %FILE_NAME% %TO_DIR%\%SHORT_NAME%_%yy%%mm%%dd%_%_time%


:end