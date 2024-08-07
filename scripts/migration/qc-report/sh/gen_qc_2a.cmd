@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating QC Report 2a ...
db2 -tf ..\sql\qc_report_2a.sql -l %LOG_PATH%\qc_report_2a.log

echo -------------------------------------
echo Exporting QC Report 2a ...
db2 -tf ..\sql\generate_report_2a.sql -l %LOG_PATH%\generate_report_2a.log

echo -------------------------------------
echo Moving QC Report 2a ...

mkdir ..\reports\QC_Report_2a
move QC_2a_*.csv ..\reports\QC_Report_2a
