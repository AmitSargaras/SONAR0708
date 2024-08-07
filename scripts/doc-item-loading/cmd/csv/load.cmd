db2 connect to EONCMS user db2admin using db2admin

db2 set current schema = EONCMS_LOCAL
db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,EONCMS_LOCAL


echo "----------------------------------------------";
echo "Setting up schema and procedures .....";

db2 -tf setup.sql -l setup.log


echo "----------------------------------------------";
echo "Loading Checklist Template Item Setup.....";

echo Loading CC Setup Items ... 
db2 "LOAD FROM cc.csv OF DEL modified by dumpfile="cc.dmp" dumpfileaccessall dateformat=\"YYYYMMDD\" timestampformat = \"YYYYMMDD\" coldel0x2C method P (3,4,5,6,7,8) savecount 200000 messages "cc.log" insert into TMP_DOCUMENT_GLOBALLIST (IS_PRE_APPROVE, DOC_VERSION, IS_FOR_BORROWER, IS_FOR_PLEDGOR, DOCUMENT_CODE, DOCUMENT_DESCRIPTION) FOR EXCEPTION ERR_DOCUMENT_GLOBALLIST NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE"

db2 UPDATE TMP_DOCUMENT_GLOBALLIST SET CATEGORY = 'CC' WHERE CATEGORY IS NULL


echo Loading Security Setup Items ... 
db2 "LOAD FROM sec.csv OF DEL modified by dumpfile="sec.dmp" dumpfileaccessall dateformat=\"YYYYMMDD\" timestampformat = \"YYYYMMDD\" coldel0x2C method P (3,4,5,6,7) savecount 200000 messages "sec.log" insert into TMP_DOCUMENT_GLOBALLIST (IS_PRE_APPROVE, DOC_VERSION, LOAN_APP_TYPE, DOCUMENT_CODE, DOCUMENT_DESCRIPTION) FOR EXCEPTION ERR_DOCUMENT_GLOBALLIST NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE"

db2 UPDATE TMP_DOCUMENT_GLOBALLIST SET CATEGORY = 'S' WHERE CATEGORY IS NULL



echo "----------------------------------------------";
echo "Calling procedure to load to actual .....";

db2 CALL LOAD_DOC_GLOBAL_ITEM


echo "----------------------------------------------";
echo "Moving logs .....";

mkdir logs
move /Y *.log logs\
move /Y *.dmp logs\

