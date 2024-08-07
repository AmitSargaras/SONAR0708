/**************************
	Create Main Profile
***************************/
insert into sci_le_main_profile 
(cms_le_main_profile_id, lmp_le_id, lmp_long_name, lmp_short_name,
lmp_legal_const_num, lmp_legal_const_value, LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT, source_id)
values
(CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_seq), 2)) as BIGINT), 
'CUST-ALLOC-0005', 'Rainbow Bookshop', 'Rainbow Bookshop', 
'56', 'C', 'MY', 'CUST-ALLOC-0005-BUS', 'ARBS');

/**************************
	Create Sub Profile
**************************/	
insert into sci_le_sub_profile
(cms_le_sub_profile_id, lsp_id, lsp_le_id, lsp_short_name, lsp_dmcl_cntry_iso_code,
cms_le_main_profile_id, cms_sub_orig_country, cms_sub_orig_organisation, cms_non_borrower_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS( next value for profile_seq), 2)) as BIGINT), 
1, lmp_le_id, lmp_short_name, 'MY',
cms_le_main_profile_id, 'MY', '2', 'N'
from sci_le_main_profile where lmp_le_id = 'CUST-ALLOC-0005';

/*****************************
	Create Limit Profile
*****************************/
insert into sci_lsp_lmt_profile
(cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num, los_bca_ref_num,
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id,
cms_bca_joint_ind, lmt_profile_type, cms_create_ind, is_migrated_ind, application_type, APPLICATION_LAW_TYPE)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_profile_seq), 2)) as BIGINT), 
lsp_le_id, lsp_id, '80000005', 'ALLOC-AA-0005', cms_le_sub_profile_id, 'ACTIVE', 
'MY', '2', 'ARBS', 'N', 'BANKING', 'Y', 'Y', 'CO', 'CON'
from sci_le_sub_profile where lsp_le_id = 'CUST-ALLOC-0005';


insert into stage_limit_profile
(cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num, 
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id, 
cms_bca_joint_ind, lmt_profile_type,cms_create_ind, llp_segment_code_num, llp_segment_code_value, 
application_type, APPLICATION_LAW_TYPE)
select cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num,
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id, 
cms_bca_joint_ind, lmt_profile_type,cms_create_ind, 
llp_segment_code_num, llp_segment_code_value, application_type, APPLICATION_LAW_TYPE
from sci_lsp_lmt_profile 
where llp_le_id = 'CUST-ALLOC-0005';

/***************************
	Create Pending
	Perfection Credit
	Folder
***************************/

insert into cms_aa_pending_perfection
(cms_lsp_lmt_profile_id, host_bca_ref_num, los_bca_ref_num)
select cms_lsp_lmt_profile_id, llp_bca_ref_num, los_bca_ref_num
from sci_lsp_lmt_profile 
where llp_le_id = 'CUST-ALLOC-0005';

/***************************
	Create Limit
***************************/	
insert into sci_lsp_appr_lmts
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id,
lmt_fac_type_num, lmt_fac_type_value, CMS_OUTSTANDING_AMT, LMT_FAC_CODE, lmt_fac_seq, los_lmt_id,
account_type, lmt_bca_ref_num, los_bca_ref_num)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_seq), 2)) AS bigint), 
cms_lsp_lmt_profile_id, '700000006', '27', 'TC',
'25', 'OUTER', 180000000, 'MYR', llp_le_id, llp_lsp_id,
'ACTIVE', cms_orig_country, cms_orig_organisation, 'ARBS',
'26', '210', 180000000, '210', 1, 'FAC-ALLOC-0006', 
'L', llp_bca_ref_num, los_bca_ref_num
from sci_lsp_lmt_profile where llp_le_id = 'CUST-ALLOC-0005';


insert into stage_limit
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, LMT_FAC_CODE, lmt_fac_seq, los_lmt_id,
account_type, lmt_bca_ref_num, los_bca_ref_num)
select cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, LMT_FAC_CODE, lmt_fac_seq, los_lmt_id,
account_type, lmt_bca_ref_num, los_bca_ref_num
from sci_lsp_appr_lmts
where los_lmt_id in ('FAC-ALLOC-0006') ;

-- insert into facility master table
insert into cms_facility_master(id,  currency_code, cms_lsp_appr_lmts_id, ALT_SCHEDULE, MAIN_FACILITY_IND)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR facility_master_seq), 2)) AS bigint),
lmt_crrncy_iso_code, cms_lsp_appr_lmts_id, 'Y', 'N'
from sci_lsp_appr_lmts 
where los_lmt_id in ('FAC-ALLOC-0006') ;

insert into cms_stg_facility_master
select *
from cms_facility_master
where cms_lsp_appr_lmts_id in 
	(select cms_lsp_appr_lmts_id
	from sci_lsp_appr_lmts
	where los_lmt_id in ('FAC-ALLOC-0006') );
	
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
from sci_le_sub_profile where lsp_le_id = 'CUST-ALLOC-0005';

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
from sci_lsp_lmt_profile where llp_le_id = 'CUST-ALLOC-0005';

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
from sci_lsp_appr_lmts where los_lmt_id = 'FAC-ALLOC-0006';



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
	from sci_lsp_appr_lmts where los_lmt_id in ('FAC-ALLOC-0006'));

/*********************************************
	Create Security & Transaction
*********************************************/
-- create for 1st collateral
insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, SCI_REFERENCE_NOTE,security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, 
cmv, cmv_currency, fsv, fsv_currency)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for collateral_seq), 2)) AS bigint), 
'AB102', 'AB102-ALLOC-0004', 'AB102-ALLOC-0004', 'MY', subtype_name, security_type_name, 
'AB102', 'PT', 'MYR', 'ACTIVE', 'MYR', '12', 'ARBS', 'Y',
40000000, 'MYR', 40000000, 'MYR'
from cms_security_sub_type where security_sub_type_id = 'AB102';

insert into cms_asset (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'AB102-ALLOC-0004';	

insert into cms_asset_vehicle (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'AB102-ALLOC-0004';	


insert into cms_stage_asset (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'AB102-ALLOC-0004';

insert into cms_stage_asset_vehicle (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'AB102-ALLOC-0004';


insert into cms_stage_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation,
cmv, cmv_currency, fsv, fsv_currency)
select cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation,
cmv, cmv_currency, fsv, fsv_currency
from cms_security where sci_security_dtl_id = 'AB102-ALLOC-0004';

-- create for 2nd collateral
insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, SCI_REFERENCE_NOTE,security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, 
cmv, cmv_currency, fsv, fsv_currency)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for collateral_seq), 2)) AS bigint), 
'PT701', 'PT701-ALLOC-0002', 'PT701-ALLOC-0002', 'MY', subtype_name, security_type_name, 
'PT701', 'PT', 'MYR', 'ACTIVE', 'MYR', '12', 'ARBS', 'Y',
160000000, 'MYR', 160000000, 'MYR'
from cms_security_sub_type where security_sub_type_id = 'PT701';

insert into cms_property (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT701-ALLOC-0002';	

insert into cms_stage_asset (cms_collateral_id)
select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT701-ALLOC-0002';

insert into cms_stage_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation,
cmv, cmv_currency, fsv, fsv_currency)
select cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation,
cmv, cmv_currency, fsv, fsv_currency
from cms_security where sci_security_dtl_id = 'PT701-ALLOC-0002';


-- insert security transaction
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
from cms_security where sci_security_dtl_id in ('AB102-ALLOC-0004', 'PT701-ALLOC-0002');


-- insert charge detail
insert into cms_charge_detail 
	(charge_detail_id, charge_amount, charge_currency_code, security_rank, charge_type, cms_collateral_id, 
	cms_ref_id, status, prior_charge_type, source_id, is_legal_enforce, caveat_waived_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for CMS_CHARGE_DETAIL_SEQ), 2)) AS bigint), 
	50000000, 'MYR', 1, 'S', s.cms_collateral_id,
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for CMS_CHARGE_DETAIL_SEQ), 2)) AS bigint),
	'ACTIVE', 'O', 'ARBS', 'N', 'Y'
from cms_security s where sci_security_dtl_id = 'AB102-ALLOC-0004';

insert into cms_stage_charge_detail
	(charge_detail_id, charge_amount, charge_currency_code, security_rank, charge_type, cms_collateral_id, 
	cms_ref_id, status, prior_charge_type, source_id, is_legal_enforce, caveat_waived_ind)
select charge_detail_id, charge_amount, charge_currency_code, security_rank, charge_type, d.cms_collateral_id, 
	cms_ref_id, d.status, prior_charge_type, d.source_id, d.is_legal_enforce, caveat_waived_ind
from cms_charge_detail d, cms_security s
where d.cms_collateral_id = s.cms_collateral_id
and s.sci_security_dtl_id in ('AB102-ALLOC-0004');


insert into cms_charge_detail 
	(charge_detail_id, charge_amount, charge_currency_code, security_rank, charge_type, cms_collateral_id, 
	cms_ref_id, status, prior_charge_type, source_id, is_legal_enforce, caveat_waived_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for CMS_CHARGE_DETAIL_SEQ), 2)) AS bigint), 
	150000000, 'MYR', 1, 'S', s.cms_collateral_id,
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for CMS_CHARGE_DETAIL_SEQ), 2)) AS bigint),
	'ACTIVE', 'O', 'ARBS', 'N', 'Y'
from cms_security s where sci_security_dtl_id = 'PT701-ALLOC-0002';

insert into cms_stage_charge_detail
	(charge_detail_id, charge_amount, charge_currency_code, security_rank, charge_type, cms_collateral_id, 
	cms_ref_id, status, prior_charge_type, source_id, is_legal_enforce, caveat_waived_ind)
select charge_detail_id, charge_amount, charge_currency_code, security_rank, charge_type, d.cms_collateral_id, 
	cms_ref_id, d.status, prior_charge_type, d.source_id, d.is_legal_enforce, caveat_waived_ind
from cms_charge_detail d, cms_security s
where d.cms_collateral_id = s.cms_collateral_id
and s.sci_security_dtl_id in ('PT701-ALLOC-0002');

-- insert limit security map
insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, 
customer_category,create_date, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for col_limit_map_seq), 2)) AS bigint), 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'AB102-ALLOC-0004'), 'AB102-ALLOC-0004',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp , 'I'
from sci_lsp_appr_lmts where los_lmt_id = 'FAC-ALLOC-0006';	

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, 
customer_category,create_date, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for col_limit_map_seq), 2)) AS bigint), 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT701-ALLOC-0002'), 'PT701-ALLOC-0002',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp , 'I'
from sci_lsp_appr_lmts where los_lmt_id = 'FAC-ALLOC-0006';	

insert into cms_stage_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date, update_status_ind)
select charge_id, lsm.cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
lsm.create_date, update_status_ind
from cms_limit_security_map lsm, cms_security s
where lsm.cms_collateral_id = s.cms_collateral_id
and s.sci_security_dtl_id in ('AB102-ALLOC-0004', 'PT701-ALLOC-0002');

-- insert limit charge map
insert into cms_limit_charge_map
(limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id,status, 
	customer_category, cms_lsp_lmt_profile_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for COL_LIMIT_CHARGE_SEQ), 2)) AS bigint), 
lsm.cms_lsp_appr_lmts_id, lsm.charge_id, dtl.charge_detail_id, s.cms_collateral_id, 'ACTIVE',
	'MB', lsm.cms_lsp_lmt_profile_id
from cms_limit_security_map lsm, cms_security s, cms_charge_detail dtl
where lsm.cms_collateral_id = s.cms_collateral_id
and s.cms_collateral_id = dtl.cms_collateral_id
and s.sci_security_dtl_id in ('AB102-ALLOC-0004', 'PT701-ALLOC-0002');

insert into cms_stage_limit_charge_map
(limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id,status, 
	customer_category, cms_lsp_lmt_profile_id)
select limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, lcm.cms_collateral_id, lcm.status, 
	customer_category, cms_lsp_lmt_profile_id
from cms_limit_charge_map lcm, cms_security s
where s.cms_collateral_id = lcm.cms_collateral_id
and s.sci_security_dtl_id in ('AB102-ALLOC-0004', 'PT701-ALLOC-0002');
	
-- insert valuation detail
insert into cms_valuation
(valuation_id, valuation_currency, valuation_date, valuer, cmv, fsv, cms_collateral_id, source_type, source_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for VALUATION_SEQ), 2)) AS bigint), 
'MYR', (current timestamp - 5 days), 'V9999', 40000000, 40000000, s.cms_collateral_id, 'S', 'ARBS'
from cms_security s
where s.sci_security_dtl_id in ('AB102-ALLOC-0004');

insert into cms_valuation
(valuation_id, valuation_currency, valuation_date, valuer, cmv, fsv, cms_collateral_id, source_type, source_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for VALUATION_SEQ), 2)) AS bigint), 
'MYR', (current timestamp - 5 days), 'V9999', 160000000, 160000000, s.cms_collateral_id, 'S', 'ARBS'
from cms_security s
where s.sci_security_dtl_id in ('PT701-ALLOC-0002');


insert into CMS_SECURITY_SOURCE
(cms_security_source_id, cms_collateral_id, 
source_security_id, source_id, status)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for share_security_seq), 2)) AS bigint), 
cms_collateral_id, sci_security_dtl_id, source_id, 'ACTIVE'
from cms_security
where sci_security_dtl_id in ('AB102-ALLOC-0004', 'PT701-ALLOC-0002');


/**********************************
	Create Customer Account
**********************************/
insert into sci_lsp_sys_xref
(cms_lsp_sys_xref_id,  LSX_EXT_SYS_CODE_NUM, LSX_EXT_SYS_CODE_VALUE,
LSX_EXT_SYS_ACCT_NUM, LSX_EXT_CTY_CODE_VALUE, acct_delq_ind, acct_status,
LSX_EXT_SYS_ACCT_TYPE, LSX_EXT_SYS_ACCT_SEQ, CMS_OUTSTANDING_AMT, update_status_ind)
values
( CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_x_ref_seq), 2)) AS bigint), 
'37', 'ARBS', 'SIBS-ACT-0010', 'MY', 'N', 'A', 'L', 1, 180000000, 'I');

/*********************************
	Create Account Limit Linkage
**********************************/
insert into sci_lsp_lmts_xref_map
(cms_lsp_lmts_xref_map_id, lxm_le_id, lxm_lmt_id, lxm_lsp_id, 
cms_lsp_appr_lmts_id, cms_status, cms_lsp_sys_xref_id, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_x_ref_seq), 2)) AS bigint), 
lmt.lmt_le_id, lmt.lmt_id, lmt.lmt_lsp_id, lmt.cms_lsp_appr_lmts_id, 'ACTIVE', 
	(select xref.cms_lsp_sys_xref_id
	from sci_lsp_sys_xref xref
	where xref.lsx_ext_sys_acct_num = 'SIBS-ACT-0010'), 'I'
from sci_lsp_appr_lmts lmt
where los_lmt_id = 'FAC-ALLOC-0006';


commit work;