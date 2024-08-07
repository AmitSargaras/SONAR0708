@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connect to database ...

call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start checking against actual table ...

echo %date% - %time% Validate: Actual Table ...
db2 CALL AUTO_VALIDATE_ACTUAL_TABLE

echo -------------------------------------
echo %date% - %time% Script end.