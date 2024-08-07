pushd ..\checklist-backup

db2 connect to ABCLIMS user db2admin using db2admin

db2 set current schema=ABCLIMS

db2 import from checklist_template_trx.ixf of ixf messages checklist_template_trx.txt insert into transaction (transaction_id, from_state, user_id, transaction_type, creation_date, transaction_date, reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc, legal_name, legal_id, customer_name, customer_id, trx_origin_country, trx_origin_organisation, trx_segment, user_info, cur_trx_history_id, team_type_id, team_membership_id)

db2move ABCLIMS import

popd