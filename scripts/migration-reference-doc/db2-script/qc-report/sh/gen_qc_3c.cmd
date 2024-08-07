@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating QC Report 3c ...
db2 -tf ..\sql\qc_report_3c.sql -l %LOG_PATH%\qc_report_3c.log

echo -------------------------------------
echo Exporting QC Report 3c ...
db2 -tf ..\sql\generate_report_3c.sql -l %LOG_PATH%\generate_report_3c.log

echo -------------------------------------
echo Moving QC Report 3c ...

mkdir ..\reports\QC_Report_3c
move QC_3c_*.csv ..\reports\QC_Report_3c
