@echo off&SETLOCAL

FOR /f "tokens=1-4 delims=/-. " %%G IN ('date /t') DO (call :s_fixdate %%G %%H %%I %%J)
goto :set_env

:s_fixdate
if "%1:~0,1%" GTR "9" shift
FOR /f "skip=1 tokens=2-4 delims=(-)" %%G IN ('echo.^|date') DO (
  set %%G=%1&set %%H=%2&set %%I=%3)
goto :eof

:set_env
::echo Day:[%dd%]  Month:[%mm%]  Year:[%yy%]
ENDLOCAL&SET MMYYYY=%mm%%yy%
