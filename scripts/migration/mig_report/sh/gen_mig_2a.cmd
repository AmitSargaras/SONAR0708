@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating MIG Report 2a ...
db2 -tf ..\sql\mig_report_2a.sql -l %LOG_PATH%\mig_report_2a.log

echo -------------------------------------
echo Exporting MIG Report 2a ...
db2 -tf ..\sql\generate_report_2a.sql -l %LOG_PATH%\generate_report_2a.log

echo -------------------------------------
echo Moving MIG Report 2a ...

mkdir ..\reports\mig_Report_2a
move mig_2a_*.csv ..\reports\mig_Report_2a
