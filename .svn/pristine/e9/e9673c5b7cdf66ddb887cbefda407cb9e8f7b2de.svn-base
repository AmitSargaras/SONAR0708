mkdir ..\checklist-backup

pushd ..\checklist-backup

db2 connect to ABCLIMS user db2admin using db2admin

db2 set current schema=ABCLIMS

db2 export to checklist_template_trx.ixf of ixf messages checklist_template_trx.txt select transaction_id, from_state, user_id, transaction_type, creation_date, transaction_date, reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc, legal_name, legal_id, customer_name, customer_id, trx_origin_country, trx_origin_organisation, trx_segment, user_info, cur_trx_history_id, team_type_id, team_membership_id from transaction where transaction_Type in ('DOCITEM', 'TEMPLATE')

db2move ABCLIMS export -tn CMS_DOCUMENT_GLOBALLIST,CMS_DOCUMENT_ITEM,CMS_DOCUMENT_MASTERLIST,CMS_DOCUMENT_PROPERTY,CMS_STAGE_DOCUMENT_PROPERTY,STAGE_DOCUMENT_GLOBALLIST,STAGE_DOCUMENT_ITEM,STAGE_DOCUMENT_MASTERLIST

popd