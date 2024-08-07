select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CU001 from SCI_LE_MAIN_PROFILE m, SI_TEMP_SIBS_CU001 t 
where source_id = 'SIBS' and m.LMP_LE_ID = t.CIF_ID and t.IS_VALID = 'Y';

select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CU003 from CMS_BATCH_CIF_FUSION m, SI_TEMP_SIBS_CU003 t 
where source_id = 'SIBS' and m.OLD_LE_ID = t.OLD_CIF_ID and m.NEW_LE_ID = t.NEW_CIF_ID and t.IS_VALID = 'Y';

select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CA001 from SCI_LSP_APPR_LMTS m, SI_TEMP_SIBS_CA001 t 
where source_id = 'SIBS' and m.LMT_ID = t.SRC_LIMIT_ID and t.IS_VALID = 'Y';

select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CA004 from CMS_NPL m, SI_TEMP_SIBS_CA004 t 
where source_id = 'SIBS' and m.ACCOUNT_NUMBER = t.EXTERNAL_SYSTEM_ACCT_NO and t.IS_VALID = 'Y';

select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CO001 from CMS_CASH_DEPOSIT m, SI_TEMP_SIBS_CO001 t 
where source_id = 'SIBS' and m.DEPOSIT_REFERENCE_NUMBER = t.REF_NO 
and m.DEPOSIT_RECEIPT_NUMBER = t.RECEIPT_NUMBER and t.IS_VALID = 'Y';

select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CO002 from CMS_SECURITY m, SI_TEMP_SIBS_CO002 t 
where source_id = 'SIBS' and m.SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID and t.IS_VALID = 'Y';

