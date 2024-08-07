pushd ..\user-backup

db2 connect to ABCLIMS user db2admin using db2admin

db2 set current schema=ABCLIMS

db2 select count(*) from transaction where transaction_type in ('USER', 'TEAM', 'TEAM_FUNCTION_GRP')

db2 delete from transaction where transaction_type in ('USER', 'TEAM', 'TEAM_FUNCTION_GRP')

db2 select count(*) from transaction where transaction_type in ('USER', 'TEAM', 'TEAM_FUNCTION_GRP')

db2 import from user_team_trx.ixf of ixf messages imp_user_team_trx_log.txt insert into transaction

db2move ABCLIMS import

popd