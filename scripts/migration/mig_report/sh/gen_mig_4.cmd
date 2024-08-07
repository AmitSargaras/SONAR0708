@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating MIG Report 4 ...
db2 -tf ..\sql\mig_report_4.sql -l %LOG_PATH%\mig_report_4.log

echo -------------------------------------
echo Exporting MIG Report 4 ...
db2 -tf ..\sql\generate_report_4.sql -l %LOG_PATH%\generate_report_4.log

echo -------------------------------------
echo Moving MIG Report 4 ...

mkdir ..\reports\mig_Report_4
move mig_4_*.csv ..\reports\mig_Report_4
