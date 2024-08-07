@echo off

set MSG_DIR=D:\integrosource\abcms\trunk\scripts\migration\arbs_dc\file

call ..\set_db2_env.cmd

call dc_load_ab100.cmd %MSG_DIR%\AB100.csv dump_ab100.txt dc_ab100_log.txt csv

db2 call setDCRegion('DC_AB100', 'AB100')

db2 call setValuationType('DC_AB100')

db2 call "DC_RUN_AB100"

call dc_load_ab101.cmd %MSG_DIR%\AB101.csv dump_ab101.txt dc_ab101_log.txt csv

db2 call setDCRegion('DC_AB101', 'AB101')

db2 call setValuationType('DC_AB101')

db2 call "DC_RUN_AB101"

call dc_load_ab102.cmd %MSG_DIR%\AB102.csv dump_ab101.txt dc_ab102_log.txt csv

db2 call setDCRegion('DC_AB102', 'AB102')

db2 call setValuationType('DC_AB102')

db2 call "DC_RUN_AB102"

call dc_load_ab103.cmd %MSG_DIR%\AB103.csv dump_ab103.txt dc_ab103_log.txt csv

db2 call setDCRegion('DC_AB103', 'AB103')

db2 call setValuationType('DC_AB103')

db2 call "DC_RUN_AB103"