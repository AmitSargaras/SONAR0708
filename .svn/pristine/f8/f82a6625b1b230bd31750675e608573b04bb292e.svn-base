. ./setenv.sh
. ./connect.sh

"$DB2_HOME"/bin/db2 -tf mig_create_temp_table_for_property_state_patching.sql -l mig_create_temp_table_for_property_state_patching.log

"$DB2_HOME"/bin/db2 "RUNSTATS ON TABLE EONCMS.CMS_PROPERTY_STATE_TEMP ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL"

"$DB2_HOME"/bin/db2 "RUNSTATS ON TABLE EONCMS.CMS_PROPERTY ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL"

"$DB2_HOME"/bin/db2 "RUNSTATS ON TABLE EONCMS.CMS_STAGE_PROPERTY ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL"

echo `date +"%Y/%m/%d %H:%M:%S"` Loading property_state ... 
"$DB2_HOME"/bin/db2 "LOAD FROM property_state.csv OF DEL modified by dateformat=\"YYYYMMDD\" timestampformat = \"YYYYMMDD\" coldel0x7C method P (1,2) savecount 200000 messages "property_state.log" insert into CMS_PROPERTY_STATE_TEMP (SCI_SECURITY_DTL_ID, STATE_CODE) NONRECOVERABLE"
