select 'Record loaded: ' || char(count(*)) as ACTUAL_RECORD_CA002 from CMS_NPL m, SI_TEMP_SEMA_CA002 t 
where source_id = 'SEMA' and m.ACCOUNT_NUMBER = t.ACCOUNT_NO and t.IS_VALID = 'Y';

