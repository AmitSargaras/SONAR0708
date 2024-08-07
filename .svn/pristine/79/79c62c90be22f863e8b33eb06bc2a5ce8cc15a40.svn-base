@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating QC Report 3d ...
db2 -tf ..\sql\qc_report_3d.sql -l %LOG_PATH%\qc_report_3d.log

echo -------------------------------------
echo Exporting QC Report 3d ...
db2 -tf ..\sql\generate_report_3d.sql -l %LOG_PATH%\generate_report_3d.log

echo -------------------------------------
echo Moving QC Report 3d ...

mkdir ..\reports\QC_Report_3d
move QC_3d_*.csv ..\reports\QC_Report_3d
