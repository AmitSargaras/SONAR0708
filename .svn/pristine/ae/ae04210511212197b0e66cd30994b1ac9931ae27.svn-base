@echo off

call .\connect.cmd

mkdir logs
mkdir QC_2
mkdir QC_3
mkdir QC_4
mkdir QC_5

cd ..\db2-script\qc-reports\sql

echo ----------
echo schema
echo ----------
db2 -tf qc_report_schema.sql -l qc_report_schema.log

echo -----------------------
echo %date% - %time%  qc report script
echo -----------------------
db2 -tf qc_report_2.sql -l qc_report_2.log

db2 -tf generate_report_2.sql -l generate_report_2.log

move QC_2_*.csv ..\..\..\batch-script\QC_2

db2 -tf qc_report_3.sql -l qc_report_3.log

db2 -tf generate_report_3.sql -l generate_report_3.log

move QC_3_*.csv ..\..\..\batch-script\QC_3

db2 -tf qc_report_4.sql -l qc_report_4.log

db2 -tf generate_report_4.sql -l generate_report_4.log

move QC_4_*.csv ..\..\..\batch-script\QC_4

db2 -tf qc_report_5.sql -l qc_report_5.log

db2 -tf generate_report_5.sql -l generate_report_5.log

move QC_5_*.csv ..\..\..\batch-script\QC_5

move *.log ..\..\..\batch-script\logs

cd ..\..\..\batch-script

echo -------------------------------------
echo %date% - %time% Report Script end.