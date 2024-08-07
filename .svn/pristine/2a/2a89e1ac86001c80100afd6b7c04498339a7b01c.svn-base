@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating QC Report 5 ...
db2 -tf ..\sql\qc_report_5.sql -l %LOG_PATH%\qc_report_5.log

echo -------------------------------------
echo Exporting QC Report 5 ...
db2 -tf ..\sql\generate_report_5.sql -l %LOG_PATH%\generate_report_5.log

echo -------------------------------------
echo Moving QC Report 5 ...

mkdir ..\reports\QC_Report_5
move QC_5_*.csv ..\reports\QC_Report_5
