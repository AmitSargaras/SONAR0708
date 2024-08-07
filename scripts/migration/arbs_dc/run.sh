export MSG_DIR=/integrosource/abcms/trunk/scripts/migration/arbs_dc/file

. ../set_db2_env.sh

. dc_load_ab100.sh $MSG_DIR/AB100.csv dump_ab100.txt dc_ab100_log.txt csv

"$DB2_HOME"/bin/db2 call setDCRegion('DC_AB100', 'AB100')

"$DB2_HOME"/bin/db2 call setValuationType('DC_AB100')

"$DB2_HOME"/bin/db2 call "DC_RUN_AB100"

. dc_load_ab101.sh $MSG_DIR/AB101.csv dump_ab101.txt dc_ab101_log.txt csv

"$DB2_HOME"/bin/db2 call setDCRegion('DC_AB101', 'AB101')

"$DB2_HOME"/bin/db2 call setValuationType('DC_AB101')

"$DB2_HOME"/bin/db2 call "DC_RUN_AB101"

. dc_load_ab102.sh $MSG_DIR/AB102.csv dump_ab101.txt dc_ab102_log.txt csv

"$DB2_HOME"/bin/db2 call setDCRegion('DC_AB102', 'AB102')

"$DB2_HOME"/bin/db2 call setValuationType('DC_AB102')

"$DB2_HOME"/bin/db2 call "DC_RUN_AB102"

. dc_load_ab103.sh $MSG_DIR/AB103.csv dump_ab103.txt dc_ab103_log.txt csv

"$DB2_HOME"/bin/db2 call setDCRegion('DC_AB103', 'AB103')

"$DB2_HOME"/bin/db2 call setValuationType('DC_AB103')