@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating QC Report 4 ...
db2 -tf ..\sql\qc_report_4.sql -l %LOG_PATH%\qc_report_4.log

echo -------------------------------------
echo Exporting QC Report 4 ...
db2 -tf ..\sql\generate_report_4.sql -l %LOG_PATH%\generate_report_4.log

echo -------------------------------------
echo Moving QC Report 4 ...

mkdir ..\reports\QC_Report_4
move QC_4_*.csv ..\reports\QC_Report_4
