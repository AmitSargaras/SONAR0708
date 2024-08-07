@echo off

set MSG_DIR=C:\integrosource\abcms\trunk\scripts\migration

call set_db2_env.cmd

REM call mig_CS.cmd %MSG_DIR%\COMMTSPRCS01.csv dump_file_cs.txt COMMTSPRCS01_log.txt csv

REM db2 call setSourceAndRegion('MIG_CS', 'TSPR', 'COMMTSPRCS01')

rem call mig_ab100.cmd %MSG_DIR%\CORPQUANAB10002901.csv dump_file_ab100.txt CORPTSPRAB10002901_log.txt csv

rem db2 call setSourceAndRegion('MIG_AB100', 'TSPR', 'CORPTSPRAB10002901')

rem db2 call setSourceAndRegion('MIG_CHARGE_AB100', 'TSPR', 'CORPTSPRAB10002901')

rem db2 call setSourceAndRegion('MIG_PLEDGOR_AB100', 'TSPR', 'CORPTSPRAB10002901')

rem db2 call setSourceAndRegion('MIG_VAL_AB100', 'TSPR', 'CORPTSPRAB10002901')

REM call mig_CS.cmd %MSG_DIR%\CORPTSPRCS02901.csv dump_file_cs.txt CORPTSPRCS02901_log.txt csv

REM db2 call setSourceAndRegion('MIG_CS', 'TSPR', 'CORPTSPRCS02901')

REM call mig_DC.cmd %MSG_DIR%\CORPTSPRDC02901.csv dump_file_dc.txt CORPTSPRDC02901_log.txt csv

REM db2 call setSourceAndRegion('MIG_DC', 'TSPR', 'CORPTSPRDC02901')

REM call mig_GT.cmd %MSG_DIR%\CORPTSPRGT02901.csv dump_file_gt.txt CORPTSPRGT02901_log.txt csv

REM db2 call setSourceAndRegion('MIG_DC', 'GT', 'CORPTSPRGT02901')

REM call mig_OT.cmd %MSG_DIR%\CORPTSPROT02901.csv dump_file_ot.txt CORPTSPROT02901_log.txt csv

REM db2 call setSourceAndRegion('MIG_OT', 'GT', 'CORPTSPROT02901')

REM call mig_PT.cmd %MSG_DIR%\CORPTSPRPT02901.csv dump_file_pt.txt CORPTSPRPT02901_log.txt csv

call mig_PT.cmd %MSG_DIR%\data.csv dump_file_pt.txt data_log.txt csv

db2 call setSourceAndRegion('MIG_PT', 'TSPR', 'CORPTSPRPT02901')

db2 call setSourceAndRegion('MIG_CHARGE_PT', 'TSPR', 'CORPTSPRPT02901')

db2 call setSourceAndRegion('MIG_PLEDGOR_PT', 'TSPR', 'CORPTSPRPT02901')

db2 call setSourceAndRegion('MIG_VAL_PT', 'TSPR', 'CORPTSPRPT02901')

call mig_PT.cmd %MSG_DIR%\data1.csv dump_file_pt.txt data1_log.txt csv

db2 call setSourceAndRegion('MIG_PT', 'QUAN', 'CORPQUANPT70102901')

db2 call setSourceAndRegion('MIG_CHARGE_PT', 'QUAN', 'CORPQUANPT70102901')

db2 call setSourceAndRegion('MIG_PLEDGOR_PT', 'QUAN', 'CORPQUANPT70102901')

db2 call setSourceAndRegion('MIG_VAL_PT', 'QUAN', 'CORPQUANPT70102901')

REM db2 call setSourceAndRegion('MIG_OT', 'PT', 'CORPTSPRPT02901')
