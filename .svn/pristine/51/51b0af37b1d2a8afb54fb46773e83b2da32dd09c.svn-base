@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connecting to database %DB_NAME% ...
db2 CONNECT TO %DB_NAME% USER %DB_USER% USING %DB_PASSWD%

echo %date% - %time% Forcing of all connection ...
db2 QUIESCE DATABASE IMMEDIATE FORCE CONNECTIONS
db2 CONNECT RESET

echo %date% - %time% Restore database in progress ...
db2 RESTORE DATABASE %DB_NAME% FROM %DB_RESTOREPATH% WITH 2 BUFFERS BUFFER 1024 REPLACE EXISTING WITHOUT ROLLING FORWARD WITHOUT PROMPTING

echo %date% - %time% Activating the database %DB_NAME% ...
REM db2 ACTIVATE DATABASE %DB_NAME%
db2 CONNECT TO %DB_NAME% USER %DB_USER% USING %DB_PASSWD%
db2 UNQUIESCE DATABASE
db2 CONNECT RESET

echo -------------------------------------
echo %date% - %time% Restore process completed.