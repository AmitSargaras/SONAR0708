select 'Record loaded: ' || char(count(*)) as CUSTOMER_MAIN_TABLE from SCI_LE_MAIN_PROFILE where source_id = 'MIMB';

select 'Record loaded: ' || char(count(*)) as AA_TABLE from SCI_LSP_LMT_PROFILE where source_id = 'MIMB';

select 'Record loaded: ' || char(count(*)) as LIMIT_TABLE from SCI_LSP_APPR_LMTS where source_id = 'MIMB';

select 'Record loaded: ' || char(count(*)) as MARKETABLE_SEC_TABLE from CMS_MARKETABLE_SEC
where CMS_COLLATERAL_ID in (select CMS_COLLATERAL_ID from CMS_SECURITY where source_id = 'MIMB');

select 'Record loaded: ' || char(count(*)) as COLLATERAL_CASH_TABLE from CMS_CASH 
where CMS_COLLATERAL_ID in (select CMS_COLLATERAL_ID from CMS_SECURITY where source_id = 'MIMB');

select 'Record loaded: ' || char(count(*)) as PRICE_FEED_TABLE from CMS_PRICE_FEED;
