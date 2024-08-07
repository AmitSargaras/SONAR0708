@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating MIG Report 5 ...
db2 -tf ..\sql\mig_report_5.sql -l %LOG_PATH%\mig_report_5.log

echo -------------------------------------
echo Exporting MIG Report 5 ...
db2 -tf ..\sql\generate_report_5.sql -l %LOG_PATH%\generate_report_5.log

echo -------------------------------------
echo Moving MIG Report 5 ...

mkdir ..\reports\mig_Report_5
move mig_5_*.csv ..\reports\mig_Report_5
