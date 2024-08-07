DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cms
DB_USER=cms
DB_PASSWD=cms
DB_SCHEMA=cms

echo "----------------------------------------------";
echo "export user setup... ";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 export to user_team_trx.ixf of ixf messages exp_user_team_trx_log.txt "select * from transaction where transaction_Type in ('USER', 'TEAM')"

"$DB2_HOME"/bin/db2move "$DB_SCHEMA" export -tn CMS_TEAM,CMS_TEAM_COUNTRY_CODE,CMS_TEAM_MEMBER,CMS_TEAM_MEMBERSHIP,CMS_TEAM_ORGANISATION_CODE,CMS_TEAM_SEGMENT_CODE,CMS_TEAM_CMS_SEGMENT_CODE,CMS_USER,CMS_AUTHENTICATION,CMS_PASSWORD_HISTORY,STAGE_TEAM,STAGE_TEAM_COUNTRY_CODE,STAGE_TEAM_MEMBER,STAGE_TEAM_MEMBERSHIP,STAGE_TEAM_ORGANISATION_CODE,STAGE_TEAM_SEGMENT_CODE,STAGE_TEAM_CMS_SEGMENT_CODE,STAGE_USER
