/**************************
	Create Main Profile
***************************/
insert into sci_le_main_profile 
(cms_le_main_profile_id, lmp_le_id, lmp_long_name, lmp_short_name,
lmp_legal_const_num, lmp_legal_const_value, LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT, lmp_sgmnt_code_num, lmp_sgmnt_code_value, source_id, lmp_type_value)
values
(20070101000000 + next value for customer_seq, 'CUST-0001', 'AAA Supermarket', 'AAA Supermarket', 
'56', 'C', 'MY', 'CUST-0001-BUS', '5', '100', 'ARBS', 'C');

/**************************
	Create Sub Profile
**************************/	
insert into sci_le_sub_profile
(cms_le_sub_profile_id, lsp_id, lsp_le_id, lsp_short_name, lsp_dmcl_cntry_iso_code,
cms_le_main_profile_id, cms_sub_orig_country, cms_sub_orig_organisation, cms_non_borrower_ind)
select 20070101000000 + next value for profile_seq, 1, lmp_le_id, lmp_short_name, 'MY',
cms_le_main_profile_id, 'MY', '000', 'N'
from sci_le_main_profile where lmp_le_id = 'CUST-0001';

/*****************************
	Create Limit Profile
*****************************/
insert into sci_lsp_lmt_profile
(cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num, los_bca_ref_num, 
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id,
cms_bca_joint_ind, lmt_profile_type, cms_create_ind, is_migrated_ind,
llp_segment_code_num, llp_segment_code_value, application_type, APPLICATION_LAW_TYPE)
select 20070101000000 + next value for limit_profile_seq, lsp_le_id, lsp_id, 'AA-0001', 'COM-90344-87112',
cms_le_sub_profile_id, 'ACTIVE', 'MY', '000', 'ARBS', 'N', 'BANKING', 'Y', 'Y',
'5', '100', 'COM', 'CON'
from sci_le_sub_profile where lsp_le_id = 'CUST-0001';


insert into stage_limit_profile
(cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num, los_bca_ref_num, 
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id, 
cms_bca_joint_ind, lmt_profile_type,cms_create_ind, llp_segment_code_num, llp_segment_code_value, 
application_type, APPLICATION_LAW_TYPE)
select cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num, los_bca_ref_num,
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id, 
cms_bca_joint_ind, lmt_profile_type,cms_create_ind, 
llp_segment_code_num, llp_segment_code_value, application_type, APPLICATION_LAW_TYPE
from sci_lsp_lmt_profile 
where llp_le_id = 'CUST-0001';

/***************************
	Create Pending
	Perfection Credit
	Folder
***************************/

insert into cms_aa_pending_perfection
(cms_lsp_lmt_profile_id, host_bca_ref_num, los_bca_ref_num,
CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, APPLICATION_TYPE, LLP_LE_ID)
select cms_lsp_lmt_profile_id, llp_bca_ref_num, los_bca_ref_num, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, APPLICATION_TYPE, LLP_LE_ID
from sci_lsp_lmt_profile 
where llp_le_id = 'CUST-0001';

/***************************
	Create Limit
***************************/	
insert into sci_lsp_appr_lmts
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id,
lmt_fac_type_num, lmt_fac_type_value)
select 20070101000000 + next value for limit_seq, cms_lsp_lmt_profile_id, 'FAC-0001', '27', 'HP',
'25', 'OUTER', 150000000, 'MYR', llp_le_id, llp_lsp_id,
'ACTIVE', cms_orig_country, cms_orig_organisation, 'ARBS',
'26', '110'
from sci_lsp_lmt_profile where llp_le_id = 'CUST-0001';

insert into sci_lsp_appr_lmts
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id,
lmt_fac_type_num, lmt_fac_type_value)
select 20070101000000 + next value for limit_seq, cms_lsp_lmt_profile_id, 'FAC-0002', '27', 'FK',
'25', 'OUTER', 50000000, 'MYR', llp_le_id, llp_lsp_id,
'ACTIVE', cms_orig_country, cms_orig_organisation, 'ARBS',
'26', '111'
from sci_lsp_lmt_profile where llp_le_id = 'CUST-0001';

insert into stage_limit
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation)
select cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation
from sci_lsp_appr_lmts
where lmt_id in ('FAC-0001', 'FAC-0002') ;

-- insert into facility master table
insert into cms_facility_master(id,  currency_code, cms_lsp_appr_lmts_id, ALT_SCHEDULE, MAIN_FACILITY_IND)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR facility_master_seq), 2)) AS bigint),
lmt_crrncy_iso_code, cms_lsp_appr_lmts_id, 'Y', 'N'
from sci_lsp_appr_lmts 
where lmt_id in ('FAC-0001', 'FAC-0002') ;

insert into cms_stg_facility_master
select *
from cms_facility_master
where cms_lsp_appr_lmts_id in 
	(select cms_lsp_appr_lmts_id
	from sci_lsp_appr_lmts
	where lmt_id in ('FAC-0001', 'FAC-0002') );
	
/*************************************
	create customer transaction
**************************************/	
insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'CUSTOMER', 'ND', -1, current timestamp, current timestamp, 
cms_le_sub_profile_id, 'ACTIVE', cms_le_main_profile_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from sci_le_sub_profile where lsp_le_id = 'CUST-0001';

/****************************************
	create limit profile transaction
****************************************/	
insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'LIMITPROFILE', 'ND', -1, current timestamp, current timestamp, 
cms_lsp_lmt_profile_id, 'ACTIVE', cms_lsp_lmt_profile_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from sci_lsp_lmt_profile where llp_le_id = 'CUST-0001';

/********************************
	Create limit transaction
********************************/	
insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'LIMIT', 'ND', -1, current timestamp, current timestamp, 
cms_lsp_appr_lmts_id, 'ACTIVE', cms_lsp_appr_lmts_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from sci_lsp_appr_lmts where lmt_id = 'FAC-0001';


insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'LIMIT', 'ND', -1, current timestamp, current timestamp, 
cms_lsp_appr_lmts_id, 'ACTIVE', cms_lsp_appr_lmts_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from sci_lsp_appr_lmts where lmt_id = 'FAC-0002';

/********************************
	Create facility transaction
********************************/	
insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'FACILITY', 'ND', -1, current timestamp, current timestamp, 
id, 'ACTIVE', id, 0, 1, cms_lsp_appr_lmts_id, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from cms_facility_master
where cms_lsp_appr_lmts_id in (select cms_lsp_appr_lmts_id
	from sci_lsp_appr_lmts where lmt_id in ('FAC-0001', 'FAC-0002'));

/*********************************************
	Create Security & Transaction
*********************************************/
insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind)
select 20070101000000 + next value for collateral_seq, 'PT700', 'PT700-0001', 'MY', subtype_name,
security_type_name, 'PT700', 'PT', 'MYR', 'ACTIVE', 'MYR', '000', 'ARBS', 'Y'
from cms_security_sub_type where security_sub_type_id = 'PT700';

insert into cms_property (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT700-0001';	

insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'COL', 'ND', -1, current timestamp, current timestamp, 
cms_collateral_id, 'ACTIVE', cms_collateral_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from cms_security where sci_security_dtl_id = 'PT700-0001';

insert into cms_stage_property (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT700-0001';

insert into cms_stage_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation)
select cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation
from cms_security where sci_security_dtl_id = 'PT700-0001';

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date)
select 20070101000000 + next value for col_limit_map_seq, 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT700-0001'), 'PT700-0001',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp 
from sci_lsp_appr_lmts where lmt_id = 'FAC-0001';	

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date)
select 20070101000000 + next value for col_limit_map_seq, 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT700-0001'), 'PT700-0001',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp 
from sci_lsp_appr_lmts where lmt_id = 'FAC-0002';	


insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind)
select 20070101000000 + next value for collateral_seq, 'CS200', 'CS200-0001', 'MY', subtype_name,
security_type_name, 'CS200', 'CS', 'MYR', 'ACTIVE', 'MYR', '000', 'ARBS', 'Y'
from cms_security_sub_type where security_sub_type_id = 'CS200';

insert into cms_cash (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'CS200-0001';	

insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),
'COL', 'ND', -1, current timestamp, current timestamp, 
cms_collateral_id, 'ACTIVE', cms_collateral_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from cms_security where sci_security_dtl_id = 'CS200-0001';

insert into cms_stage_cash (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'CS200-0001';

insert into cms_stage_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation)
select cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation
from cms_security where sci_security_dtl_id = 'CS200-0001';

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date)
select 20070101000000 + next value for col_limit_map_seq, 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'CS200-0001'), 'CS200-0001',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp 
from sci_lsp_appr_lmts where lmt_id = 'FAC-0001';	


insert into CMS_SECURITY_SOURCE
(cms_security_source_id, cms_collateral_id, 
source_security_id, source_id, status)
select 20070101000000 + next value for share_security_seq, cms_collateral_id, 
sci_security_dtl_id, source_id, 'ACTIVE'
from cms_security
where sci_security_dtl_id in ('PT700-0001', 'CS200-0001');

commit work;