mkdir ..\user-backup

pushd ..\user-backup

db2 connect to ABCLIMS user db2admin using db2admin

db2 set current schema=ABCLIMS

db2 export to user_team_trx.ixf of ixf messages exp_user_team_trx_log.txt select * from transaction where transaction_Type in ('USER', 'TEAM', 'TEAM_FUNCTION_GRP')

db2move ABCLIMS export -tn CMS_TEAM,CMS_TEAM_COUNTRY_CODE,CMS_TEAM_FUNCTION_GRP,CMS_TEAM_MEMBER,CMS_TEAM_MEMBERSHIP,CMS_TEAM_ORGANISATION_CODE,CMS_TEAM_ORG_GROUP_CODE,CMS_TEAM_SEGMENT_CODE,CMS_TEAM_CMS_SEGMENT_CODE,CMS_USER,CMS_AUTHENTICATION,CMS_PASSWORD_HISTORY,STAGE_TEAM,STAGE_TEAM_COUNTRY_CODE,STAGE_TEAM_FUNCTION_GRP,STAGE_TEAM_MEMBER,STAGE_TEAM_MEMBERSHIP,STAGE_TEAM_ORGANISATION_CODE,STAGE_TEAM_SEGMENT_CODE,STAGE_TEAM_CMS_SEGMENT_CODE,STAGE_USER

popd