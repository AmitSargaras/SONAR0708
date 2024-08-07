DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=EONCMS
DB_USER=EONCMS
DB_PASSWD=eoncms
DB_SCHEMA=EONCMS

pushd checklist-backup

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 import from checklist_template_trx.ixf of ixf messages checklist_template_trx.txt "insert into transaction (transaction_id, from_state, user_id, transaction_type, creation_date, transaction_date, reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc, legal_name, legal_id, customer_name, customer_id, trx_origin_country, trx_origin_organisation, trx_segment, user_info, cur_trx_history_id, team_type_id, team_membership_id)"

"$DB2_HOME"/bin/db2move "$DB_SCHEMA" import

popd