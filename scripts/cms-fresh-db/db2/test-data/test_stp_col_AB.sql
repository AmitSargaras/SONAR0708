/**************************
	Create Main Profile
***************************/
insert into sci_le_main_profile 
(cms_le_main_profile_id, lmp_le_id, lmp_long_name, lmp_short_name,
lmp_legal_const_num, lmp_legal_const_value, LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT, lmp_sgmnt_code_num, lmp_sgmnt_code_value, source_id)
values
(20081104000019, '30264861', 'ABC Company', 'ABC Company', '56', 'C', 'MY', '30264861-0001-BUS', '', '', 'ARBS');

/**************************
	Create Sub Profile
**************************/	
insert into sci_le_sub_profile
(cms_le_sub_profile_id, lsp_id, lsp_le_id, lsp_short_name, lsp_dmcl_cntry_iso_code,
cms_le_main_profile_id, cms_sub_orig_country, cms_sub_orig_organisation, cms_non_borrower_ind)
select 20081104000020, 1, lmp_le_id, lmp_short_name, 'MY', cms_le_main_profile_id, 'MY', '2', 'N'
from sci_le_main_profile where lmp_le_id = '30264861';

/*************************************
	create customer transaction
**************************************/	
insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select '20081104000000021', 'CUSTOMER', 'ND', -1, current timestamp, current timestamp, 
cms_le_sub_profile_id, 'ACTIVE', cms_le_main_profile_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from sci_le_sub_profile where lsp_le_id = '30264861';

/*********************************************
	Create Pledgor
*********************************************/
INSERT INTO SCI_PLEDGOR_DTL(CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_INC_NUM_TEXT, PLG_INC_CNTRY_ISO_CODE, SOURCE_ID, PLG_REL_TYPE_VALUE)
select 20081104000022, lmp_le_id, LMP_SHORT_NAME, LMP_INC_NUM_TEXT, LMP_INC_CNTRY_ISO_CODE, 'ARBS', 'TD'
from sci_le_main_profile where lmp_le_id = '30264861';	

INSERT INTO STAGE_PLEDGOR_DTL(CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_INC_NUM_TEXT, PLG_INC_CNTRY_ISO_CODE, SOURCE_ID, PLG_REL_TYPE_VALUE)
select 20081104000023, lmp_le_id, LMP_SHORT_NAME, LMP_INC_NUM_TEXT, LMP_INC_CNTRY_ISO_CODE, 'ARBS', 'TD'
from sci_le_main_profile where lmp_le_id = '30264861';	

update SCI_LSP_APPR_LMTS set lmt_bca_ref_num='200000001', lmt_fac_seq=1, 
lmt_fac_code='610'
where cms_lsp_appr_lmts_id = 20070101000001; 

update STAGE_LIMIT set lmt_bca_ref_num='200000001', lmt_fac_seq=1, 
lmt_fac_code='610'
where cms_lsp_appr_lmts_id = 20070101000001; 

insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, 
SCI_REFERENCE_NOTE, SOURCE_SECURITY_SUB_TYPE, COLLATERAL_STATUS, SECURITY_MATURITY_DATE, CMV, CMV_CURRENCY, FSV, FSV_CURRENCY)
select 20081104000001, 'AB109', '200810291090001', 'MY', subtype_name,
security_type_name, 'AB109', 'AB', 'MYR', 'ACTIVE', 'MYR', '12', 'ARBS', 'Y',
'AIRCRAFTT002', 'F74', '1', PARSE_DATE('29102008', 'DDMMyyyy'), 2000, 'MYR', 2000, 'MYR'
from cms_security_sub_type where security_sub_type_id = 'AB109';

insert into cms_asset (cms_collateral_id, REG_NO, PUBLIC_TRANSPORT, GOOD_STATUS, TYPE_OF_ASSET, PURCHASE_PRICE,
MANUFACTURE_YEAR, REG_DATE, RL_SERIAL_NO, ASSET_DESCRIPTION, SCRAP_VALUE, SALES_PROCEED, MODEL_NO, BRAND, REG_FEE)
select cms_collateral_id, '9898989898', 'N', 'N', 'MPA', 438000, 2004, PARSE_DATE('29102007', 'DDMMyyyy'), 'VEH9898989898',
'VEH', 200000, 200000, 'S-TYPE 2.5 LUXURY', 'JAGUAR', 10000 
from cms_security where cms_collateral_id = 20081104000001;	

insert into CMS_ASSET_AIRCRAFT (cms_collateral_id)
select cms_collateral_id
from cms_security where cms_collateral_id = 20081104000001;	

insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select '20081104000000018', 'COL', 'ND', -1, current timestamp, current timestamp, 
cms_collateral_id, 'ACTIVE', cms_collateral_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from cms_security where cms_collateral_id = 20081104000001;

insert into cms_stage_asset (cms_collateral_id, REG_NO, PUBLIC_TRANSPORT, GOOD_STATUS, TYPE_OF_ASSET, PURCHASE_PRICE,
MANUFACTURE_YEAR, REG_DATE, RL_SERIAL_NO, ASSET_DESCRIPTION, SCRAP_VALUE, SALES_PROCEED, MODEL_NO, BRAND, REG_FEE)
select cms_collateral_id, '9898989898', 'N', 'N', 'MPA', 438000, 2004, PARSE_DATE('29102007', 'DDMMyyyy'), 'VEH9898989898',
'VEH', 200000, 200000, '745LI', 'BMW', 10000 
from cms_security where cms_collateral_id = 20081104000001;

insert into CMS_STAGE_ASSET_AIRCRAFT (cms_collateral_id)
select cms_collateral_id
from cms_security where cms_collateral_id = 20081104000001;

insert into cms_stage_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, SCI_REFERENCE_NOTE, SOURCE_SECURITY_SUB_TYPE, 
COLLATERAL_STATUS, SECURITY_MATURITY_DATE, CMV, CMV_CURRENCY, FSV, FSV_CURRENCY)
select cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, 'AIRCRAFTT002', 'F74', '1', PARSE_DATE('29102008', 'DDMMyyyy'), 
2000, 'MYR', 2000, 'MYR'
from cms_security where cms_collateral_id = 20081104000001;

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date)
select 20081104000002, (select cms_collateral_id from cms_security where cms_collateral_id = 20081104000001), '200810291090001',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp 
from sci_lsp_appr_lmts where cms_lsp_appr_lmts_id = 20070101000001;	

insert into cms_stage_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date)
select 20081104000002, (select cms_collateral_id from cms_stage_security where cms_collateral_id = 20081104000001), '200810291090001',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp 
from STAGE_LIMIT where cms_lsp_appr_lmts_id = 20070101000001;	

insert into CMS_SECURITY_SOURCE
(cms_security_source_id, cms_collateral_id, 
source_security_id, source_id, status)
select 20081104000003, cms_collateral_id, 
sci_security_dtl_id, source_id, 'ACTIVE'
from cms_security
where cms_collateral_id in (20081104000001);

INSERT INTO SCI_SEC_PLDGR_MAP(CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID)
select 20081104000004, sci_security_dtl_id, (select CMS_PLEDGOR_DTL_ID from SCI_PLEDGOR_DTL where PLG_LE_ID = '30264861'), cms_collateral_id
from cms_security where cms_collateral_id = 20081104000001;	

INSERT INTO STAGE_SEC_PLDGR_MAP(CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID)
select 20081104000005, sci_security_dtl_id, (select CMS_PLEDGOR_DTL_ID from STAGE_PLEDGOR_DTL where PLG_LE_ID = '30264861'), cms_collateral_id
from cms_stage_security where cms_collateral_id = 20081104000001;	

insert into CMS_VALUATION(VALUATION_ID, VALUATION_CURRENCY, VALUATION_DATE, VALUER, CMV, FSV, CMS_COLLATERAL_ID, RESERVE_PRICE, RESERVE_PRICE_DATE, SOURCE_ID, SOURCE_TYPE)
SELECT 20081104000006, 'MYR', current timestamp, 'V0001', 2000, 2000, CMS_COLLATERAL_ID, 2000, current timestamp, 'ARBS', 'A'
from CMS_SECURITY where cms_collateral_id = 20081104000001;

insert into CMS_STAGE_VALUATION(VALUATION_ID, VALUATION_CURRENCY, VALUATION_DATE, VALUER, CMV, FSV, CMS_COLLATERAL_ID, RESERVE_PRICE, RESERVE_PRICE_DATE, SOURCE_ID, SOURCE_TYPE)
SELECT 20081104000007, 'MYR', current timestamp, 'V0001', 2000, 2000, CMS_COLLATERAL_ID, 2000, current timestamp, 'ARBS', 'A'
from cms_stage_security where cms_collateral_id = 20081104000001;

insert into CMS_INSURANCE_POLICY(INSURANCE_POLICY_ID, POLICY_NO, CURRENCY_CODE, INSURER_NAME, INSURANCE_TYPE, EXPIRY_DATE, INSURABLE_AMT, INSURED_AMT, EFFECTIVE_DATE, CMS_COLLATERAL_ID, 
LMT_PROFILE_ID, SOURCE_SECURITY_ID, SOURCE_ID, STATUS, BANK_CUST_ARRANGE_INS_IND, INSURANCE_COMPANY_NAME, INS_INSSUE_DATE, INSR_ID)
SELECT 20081104000008, 'ABINS004', 'MYR', '101', '8', PARSE_DATE('29102010', 'DDMMyyyy') , 10000, 10000, PARSE_DATE('25102008', 'DDMMyyyy') , CMS_COLLATERAL_ID, 
(select CMS_LIMIT_PROFILE_ID from sci_lsp_appr_lmts where cms_lsp_appr_lmts_id = 20070101000001), sci_security_dtl_id, 'ARBS', 'ACTIVE', 'B', 'UNI.ASIA LIFE ASSURANCE BHD', PARSE_DATE('25102008', 'DDMMyyyy'), '20081104000008'
from cms_security where cms_collateral_id = 20081104000001;

insert into CMS_STAGE_INSURANCE_POLICY(INSURANCE_POLICY_ID, POLICY_NO, CURRENCY_CODE, INSURER_NAME, INSURANCE_TYPE, EXPIRY_DATE, INSURABLE_AMT, INSURED_AMT, EFFECTIVE_DATE, CMS_COLLATERAL_ID, 
LMT_PROFILE_ID, SOURCE_SECURITY_ID, SOURCE_ID, STATUS, BANK_CUST_ARRANGE_INS_IND, INSURANCE_COMPANY_NAME, INS_INSSUE_DATE, INSR_ID)
SELECT 20081104000009, 'ABINS004', 'MYR', '101', '8', PARSE_DATE('29102010', 'DDMMyyyy') , 10000, 10000, PARSE_DATE('25102008', 'DDMMyyyy'), CMS_COLLATERAL_ID, 
(select CMS_LIMIT_PROFILE_ID from stage_limit where cms_lsp_appr_lmts_id = 20070101000001), sci_security_dtl_id, 'ARBS', 'ACTIVE', 'B', 'UNI.ASIA LIFE ASSURANCE BHD', PARSE_DATE('25102008', 'DDMMyyyy'), '20081104000008'
from cms_stage_security where cms_collateral_id = 20081104000001;

INSERT INTO CMS_CHARGE_DETAIL (CHARGE_DETAIL_ID, SECURITY_RANK, CHARGE_AMOUNT, PRESENTATION_NO, PRESENTATION_DATE, 
			LEGAL_CHARGE_DATE, CMS_COLLATERAL_ID, SCI_LAS_SEC_ID, STATUS, CMS_REF_ID)
select 20081104000010, 12, 10000, '9898989898', PARSE_DATE('25102008', 'DDMMyyyy'),
	PARSE_DATE('25102009', 'DDMMyyyy'), cms_collateral_id, sci_security_dtl_id, 'ACTIVE', 20081104000010
from cms_security where cms_collateral_id = 20081104000001;

INSERT INTO CMS_STAGE_CHARGE_DETAIL (CHARGE_DETAIL_ID, SECURITY_RANK, CHARGE_AMOUNT, PRESENTATION_NO, PRESENTATION_DATE, 
			LEGAL_CHARGE_DATE, CMS_COLLATERAL_ID, SCI_LAS_SEC_ID, STATUS, CMS_REF_ID)
select 20081104000011, 12, 10000, '9898989898', PARSE_DATE('25102008', 'DDMMyyyy'),
	PARSE_DATE('25102009', 'DDMMyyyy'), cms_collateral_id, sci_security_dtl_id, 'ACTIVE', 20081104000010
from cms_stage_security where cms_collateral_id = 20081104000001;

INSERT INTO CMS_LIMIT_CHARGE_MAP(LIMIT_CHARGE_MAP_ID, CMS_LSP_APPR_LMTS_ID, CHARGE_ID, CHARGE_DETAIL_ID, CMS_COLLATERAL_ID, STATUS, CUSTOMER_CATEGORY)  
select 20081104000012, cms_lsp_appr_lmts_id, charge_id, (select CHARGE_DETAIL_ID from CMS_CHARGE_DETAIL where CHARGE_DETAIL_ID = 20081104000010),
	CMS_COLLATERAL_ID, 'ACTIVE', 'MB'
from cms_limit_security_map where cms_collateral_id = 20081104000001;

INSERT INTO CMS_STAGE_LIMIT_CHARGE_MAP(LIMIT_CHARGE_MAP_ID, CMS_LSP_APPR_LMTS_ID, CHARGE_ID, CHARGE_DETAIL_ID, CMS_COLLATERAL_ID, STATUS, CUSTOMER_CATEGORY)  
select 20081104000013, cms_lsp_appr_lmts_id, charge_id, (select CHARGE_DETAIL_ID from CMS_STAGE_CHARGE_DETAIL where CHARGE_DETAIL_ID = 20081104000010),
	CMS_COLLATERAL_ID, 'ACTIVE', 'MB'
from cms_stage_limit_security_map where cms_collateral_id = 20081104000001;

INSERT INTO CMS_CHARGE_DETAIL (CHARGE_DETAIL_ID, SECURITY_RANK, CHARGE_AMOUNT, PRESENTATION_NO, PRESENTATION_DATE, 
			LEGAL_CHARGE_DATE, CMS_COLLATERAL_ID, SCI_LAS_SEC_ID, STATUS)
select 20081104000014, 14, 20000, '1212121212', PARSE_DATE('25102008', 'DDMMyyyy'),
	PARSE_DATE('25102009', 'DDMMyyyy'), cms_collateral_id, sci_security_dtl_id, 'ACTIVE'
from cms_security where CMS_COLLATERAL_ID = 20081104000001;

INSERT INTO CMS_STAGE_CHARGE_DETAIL (CHARGE_DETAIL_ID, SECURITY_RANK, CHARGE_AMOUNT, PRESENTATION_NO, PRESENTATION_DATE, 
			LEGAL_CHARGE_DATE, CMS_COLLATERAL_ID, SCI_LAS_SEC_ID, STATUS)
select 20081104000015, 14, 20000, '1212121212', PARSE_DATE('25102008', 'DDMMyyyy'),
	PARSE_DATE('25102009', 'DDMMyyyy'), cms_collateral_id, sci_security_dtl_id, 'ACTIVE'
from cms_stage_security where CMS_COLLATERAL_ID = 20081104000001;

INSERT INTO CMS_LIMIT_CHARGE_MAP(LIMIT_CHARGE_MAP_ID, CMS_LSP_APPR_LMTS_ID, CHARGE_ID, CHARGE_DETAIL_ID, CMS_COLLATERAL_ID, STATUS, CUSTOMER_CATEGORY)  
select 20081104000016, cms_lsp_appr_lmts_id, charge_id, (select CHARGE_DETAIL_ID from CMS_CHARGE_DETAIL where CHARGE_DETAIL_ID = 20081104000014),
	CMS_COLLATERAL_ID, 'ACTIVE', 'MB'
from cms_limit_security_map where CMS_COLLATERAL_ID = 20081104000001;

INSERT INTO CMS_STAGE_LIMIT_CHARGE_MAP(LIMIT_CHARGE_MAP_ID, CMS_LSP_APPR_LMTS_ID, CHARGE_ID, CHARGE_DETAIL_ID, CMS_COLLATERAL_ID, STATUS, CUSTOMER_CATEGORY)  
select 20081104000017, cms_lsp_appr_lmts_id, charge_id, (select CHARGE_DETAIL_ID from CMS_STAGE_CHARGE_DETAIL where CHARGE_DETAIL_ID = 20081104000015),
	CMS_COLLATERAL_ID, 'ACTIVE', 'MB'
from cms_stage_limit_security_map where CMS_COLLATERAL_ID = 20081104000001;

-- update trx for collateral creation
update transaction set status='LOADING', user_id=20081007000000024,from_state='PENDING_CREATE' where transaction_id = '20081104000000018';

-- test initial facility creation
insert into stp_master_trans values (20081104000000001,'20081104000000018', 'LOADING', 'COL', 20081104000001, current timestamp); 