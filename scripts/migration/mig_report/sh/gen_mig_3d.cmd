@echo off

if %DB_SCHEMA% == "" (
  call connect.cmd
)

echo -------------------------------------
echo Generating MIG Report 3d ...
db2 -tf ..\sql\mig_report_3d.sql -l %LOG_PATH%\mig_report_3d.log

echo -------------------------------------
echo Exporting MIG Report 3d ...
db2 -tf ..\sql\generate_report_3d.sql -l %LOG_PATH%\generate_report_3d.log

echo -------------------------------------
echo Moving MIG Report 3d ...

mkdir ..\reports\mig_Report_3d
move mig_3d_*.csv ..\reports\mig_Report_3d
