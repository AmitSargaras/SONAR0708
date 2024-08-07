/**************************
	Create Main Profile
***************************/
insert into sci_le_main_profile 
(cms_le_main_profile_id, lmp_le_id, lmp_long_name, lmp_short_name,
lmp_legal_const_num, lmp_legal_const_value, LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT, source_id)
values
(CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_seq), 2)) as BIGINT), 
'CUST-ALLOC-0008', 'Sims Restaurant Co.', 'Sims Restaurant Co.', 
'56', 'C', 'MY', 'CUST-ALLOC-0008-BUS', 'ARBS');

/**************************
	Create Sub Profile
**************************/	
insert into sci_le_sub_profile
(cms_le_sub_profile_id, lsp_id, lsp_le_id, lsp_short_name, lsp_dmcl_cntry_iso_code,
cms_le_main_profile_id, cms_sub_orig_country, cms_sub_orig_organisation, cms_non_borrower_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS( next value for profile_seq), 2)) as BIGINT), 
1, lmp_le_id, lmp_short_name, 'MY',
cms_le_main_profile_id, 'MY', '2', 'N'
from sci_le_main_profile where lmp_le_id = 'CUST-ALLOC-0008';

/*****************************
	Create Limit Profile
*****************************/
insert into sci_lsp_lmt_profile
(cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num, los_bca_ref_num,
cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id,
cms_bca_joint_ind, lmt_profile_type, cms_create_ind, is_migrated_ind, application_type, APPLICATION_LAW_TYPE)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_profile_seq), 2)) as BIGINT), 
lsp_le_id, lsp_id, '80000006', 'ALLOC-AA-0006', cms_le_sub_profile_id, 'ACTIVE', 
'MY', '2', 'ARBS', 'N', 'BANKING', 'Y', 'Y', 'CO', 'CON'
from sci_le_sub_profile where lsp_le_id = 'CUST-ALLOC-0008';


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
where llp_le_id = 'CUST-ALLOC-0008';

/***************************
	Create Pending
	Perfection Credit
	Folder
***************************/

insert into cms_aa_pending_perfection
(cms_lsp_lmt_profile_id, host_bca_ref_num, los_bca_ref_num)
select cms_lsp_lmt_profile_id, llp_bca_ref_num, los_bca_ref_num
from sci_lsp_lmt_profile 
where llp_le_id = 'CUST-ALLOC-0008';

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
cms_lsp_lmt_profile_id, '700000013', '27', 'HP',
'25', 'OUTER', 60000000, 'MYR', llp_le_id, llp_lsp_id,
'ACTIVE', cms_orig_country, cms_orig_organisation, 'ARBS',
'26', '210', 60000000, '210', 1, 'FAC-ALLOC-0013', 
'L', llp_bca_ref_num, los_bca_ref_num
from sci_lsp_lmt_profile where llp_le_id = 'CUST-ALLOC-0008';

insert into sci_lsp_appr_lmts
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id,
lmt_fac_type_num, lmt_fac_type_value, CMS_OUTSTANDING_AMT, LMT_FAC_CODE, lmt_fac_seq, los_lmt_id,
account_type, lmt_bca_ref_num, los_bca_ref_num)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_seq), 2)) AS bigint), 
cms_lsp_lmt_profile_id, '700000014', '27', 'HP',
'25', 'OUTER', 90000000, 'MYR', llp_le_id, llp_lsp_id,
'ACTIVE', cms_orig_country, cms_orig_organisation, 'ARBS',
'26', '210', 90000000, '210', 1, 'FAC-ALLOC-0014', 
'L', llp_bca_ref_num, los_bca_ref_num
from sci_lsp_lmt_profile where llp_le_id = 'CUST-ALLOC-0008';

insert into sci_lsp_appr_lmts
(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value,
lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, 
cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id,
lmt_fac_type_num, lmt_fac_type_value, CMS_OUTSTANDING_AMT, LMT_FAC_CODE, lmt_fac_seq, los_lmt_id,
account_type, lmt_bca_ref_num, los_bca_ref_num)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_seq), 2)) AS bigint), 
cms_lsp_lmt_profile_id, '700000015', '27', 'HP',
'25', 'OUTER', 100000000, 'MYR', llp_le_id, llp_lsp_id,
'ACTIVE', cms_orig_country, cms_orig_organisation, 'ARBS',
'26', '210', 100000000, '210', 1, 'FAC-ALLOC-0015', 
'L', llp_bca_ref_num, los_bca_ref_num
from sci_lsp_lmt_profile where llp_le_id = 'CUST-ALLOC-0008';


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
where los_lmt_id in ('FAC-ALLOC-0013','FAC-ALLOC-0014', 'FAC-ALLOC-0015') ;

-- insert into facility master table
insert into cms_facility_master(id,  currency_code, cms_lsp_appr_lmts_id, ALT_SCHEDULE, MAIN_FACILITY_IND)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR facility_master_seq), 2)) AS bigint),
lmt_crrncy_iso_code, cms_lsp_appr_lmts_id, 'Y', 'N'
from sci_lsp_appr_lmts 
where los_lmt_id in ('FAC-ALLOC-0013','FAC-ALLOC-0014', 'FAC-ALLOC-0015') ;

insert into cms_stg_facility_master
select *
from cms_facility_master
where cms_lsp_appr_lmts_id in 
	(select cms_lsp_appr_lmts_id
	from sci_lsp_appr_lmts
	where los_lmt_id in ('FAC-ALLOC-0013','FAC-ALLOC-0014', 'FAC-ALLOC-0015') );
	
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
from sci_le_sub_profile where lsp_le_id = 'CUST-ALLOC-0008';

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
from sci_lsp_lmt_profile where llp_le_id = 'CUST-ALLOC-0008';

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
from sci_lsp_appr_lmts where los_lmt_id in ('FAC-ALLOC-0013','FAC-ALLOC-0014', 'FAC-ALLOC-0015');



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
	from sci_lsp_appr_lmts where los_lmt_id in ('FAC-ALLOC-0013','FAC-ALLOC-0014', 'FAC-ALLOC-0015'));

/*********************************************
	Create Security & Transaction
*********************************************/
insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, SCI_REFERENCE_NOTE,security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, 
cmv, cmv_currency, fsv, fsv_currency)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for collateral_seq), 2)) AS bigint), 
'CS200', 'CS200-ALLOC-0002', 'CS200-ALLOC-0002', 'MY', subtype_name, security_type_name, 
'CS200', 'CS', 'MYR', 'ACTIVE', 'MYR', '12', 'ARBS', 'Y',
100000000, 'MYR', 90000000, 'MYR'
from cms_security_sub_type where security_sub_type_id = 'CS200';

insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, SCI_REFERENCE_NOTE,security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, 
cmv, cmv_currency, fsv, fsv_currency)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for collateral_seq), 2)) AS bigint), 
'CS200', 'CS200-ALLOC-0003', 'CS200-ALLOC-0003', 'MY', subtype_name, security_type_name, 
'CS200', 'CS', 'MYR', 'ACTIVE', 'MYR', '12', 'ARBS', 'Y',
120000000, 'MYR', 100000000, 'MYR'
from cms_security_sub_type where security_sub_type_id = 'CS200';

insert into cms_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, SCI_REFERENCE_NOTE,security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, 
cmv, cmv_currency, fsv, fsv_currency)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for collateral_seq), 2)) AS bigint), 
'CS200', 'CS200-ALLOC-0004', 'CS200-ALLOC-0004', 'MY', subtype_name, security_type_name, 
'CS200', 'CS', 'MYR', 'ACTIVE', 'MYR', '12', 'ARBS', 'Y',
80000000, 'MYR', 68000000, 'MYR'
from cms_security_sub_type where security_sub_type_id = 'CS200';

insert into cms_cash (cms_collateral_id)
select cms_collateral_id from cms_security 
where sci_security_dtl_id in ('CS200-ALLOC-0002', 'CS200-ALLOC-0003', 'CS200-ALLOC-0004');	


insert into cms_stage_cash (cms_collateral_id)
select cms_collateral_id from cms_security 
where sci_security_dtl_id in ('CS200-ALLOC-0002', 'CS200-ALLOC-0003', 'CS200-ALLOC-0004');	

insert into cms_stage_security
(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation,
cmv, cmv_currency, fsv, fsv_currency)
select cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name,
type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status,
sci_orig_security_currency, security_organisation,
cmv, cmv_currency, fsv, fsv_currency
from cms_security 
where sci_security_dtl_id in ('CS200-ALLOC-0002', 'CS200-ALLOC-0003', 'CS200-ALLOC-0004');	

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
from cms_security 
where sci_security_dtl_id in ('CS200-ALLOC-0002', 'CS200-ALLOC-0003', 'CS200-ALLOC-0004');	

-- insert limit security map
insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, 
customer_category,create_date, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for col_limit_map_seq), 2)) AS bigint), 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'CS200-ALLOC-0002'), 'CS200-ALLOC-0002',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp , 'I'
from sci_lsp_appr_lmts where los_lmt_id in ('FAC-ALLOC-0013', 'FAC-ALLOC-0014');	

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, 
customer_category,create_date, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for col_limit_map_seq), 2)) AS bigint), 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'CS200-ALLOC-0003'), 'CS200-ALLOC-0003',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp , 'I'
from sci_lsp_appr_lmts where los_lmt_id in ('FAC-ALLOC-0015');	

insert into cms_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, 
customer_category,create_date, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for col_limit_map_seq), 2)) AS bigint), 
	(select cms_collateral_id from cms_security where sci_security_dtl_id = 'CS200-ALLOC-0004'), 'CS200-ALLOC-0004',
	cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp , 'I'
from sci_lsp_appr_lmts where los_lmt_id in ('FAC-ALLOC-0013');	


insert into cms_stage_limit_security_map
(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
create_date, update_status_ind)
select charge_id, lsm.cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, cms_lsp_lmt_profile_id, customer_category,
lsm.create_date, update_status_ind
from cms_limit_security_map lsm, cms_security s
where lsm.cms_collateral_id = s.cms_collateral_id
and s.sci_security_dtl_id in ('CS200-ALLOC-0002', 'CS200-ALLOC-0003', 'CS200-ALLOC-0004');

	
-- insert valuation detail
insert into cms_valuation
(valuation_id, valuation_currency, valuation_date, valuer, cmv, fsv, cms_collateral_id, source_type, source_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for VALUATION_SEQ), 2)) AS bigint), 
'MYR', (current timestamp - 5 days), 'V9999', 100000000, 90000000, s.cms_collateral_id, 'S', 'ARBS'
from cms_security s
where s.sci_security_dtl_id in ('CS200-ALLOC-0002');

insert into cms_valuation
(valuation_id, valuation_currency, valuation_date, valuer, cmv, fsv, cms_collateral_id, source_type, source_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for VALUATION_SEQ), 2)) AS bigint), 
'MYR', (current timestamp - 5 days), 'V9999', 120000000, 100000000, s.cms_collateral_id, 'S', 'ARBS'
from cms_security s
where s.sci_security_dtl_id in ('CS200-ALLOC-0003');

insert into cms_valuation
(valuation_id, valuation_currency, valuation_date, valuer, cmv, fsv, cms_collateral_id, source_type, source_id)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for VALUATION_SEQ), 2)) AS bigint), 
'MYR', (current timestamp - 5 days), 'V9999', 80000000, 68000000, s.cms_collateral_id, 'S', 'ARBS'
from cms_security s
where s.sci_security_dtl_id in ('CS200-ALLOC-0004');


insert into CMS_SECURITY_SOURCE
(cms_security_source_id, cms_collateral_id, 
source_security_id, source_id, status)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for share_security_seq), 2)) AS bigint), 
cms_collateral_id, sci_security_dtl_id, source_id, 'ACTIVE'
from cms_security
where sci_security_dtl_id in ('CS200-ALLOC-0002', 'CS200-ALLOC-0003', 'CS200-ALLOC-0004');


/**********************************
	Create Customer Account
**********************************/
insert into sci_lsp_sys_xref
(cms_lsp_sys_xref_id,  LSX_EXT_SYS_CODE_NUM, LSX_EXT_SYS_CODE_VALUE,
LSX_EXT_SYS_ACCT_NUM, LSX_EXT_CTY_CODE_VALUE, acct_delq_ind, acct_status,
LSX_EXT_SYS_ACCT_TYPE, LSX_EXT_SYS_ACCT_SEQ, CMS_OUTSTANDING_AMT, update_status_ind)
values
( CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_x_ref_seq), 2)) AS bigint), 
'37', 'ARBS', 'SIBS-ACT-0018', 'MY', 'N', 'A', 'L', 1, 60000000, 'I');

insert into sci_lsp_sys_xref
(cms_lsp_sys_xref_id,  LSX_EXT_SYS_CODE_NUM, LSX_EXT_SYS_CODE_VALUE,
LSX_EXT_SYS_ACCT_NUM, LSX_EXT_CTY_CODE_VALUE, acct_delq_ind, acct_status,
LSX_EXT_SYS_ACCT_TYPE, LSX_EXT_SYS_ACCT_SEQ, CMS_OUTSTANDING_AMT, update_status_ind)
values
( CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_x_ref_seq), 2)) AS bigint), 
'37', 'ARBS', 'SIBS-ACT-0019', 'MY', 'N', 'A', 'L', 1, 90000000, 'I');

insert into sci_lsp_sys_xref
(cms_lsp_sys_xref_id,  LSX_EXT_SYS_CODE_NUM, LSX_EXT_SYS_CODE_VALUE,
LSX_EXT_SYS_ACCT_NUM, LSX_EXT_CTY_CODE_VALUE, acct_delq_ind, acct_status,
LSX_EXT_SYS_ACCT_TYPE, LSX_EXT_SYS_ACCT_SEQ, CMS_OUTSTANDING_AMT, update_status_ind)
values
( CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_x_ref_seq), 2)) AS bigint), 
'37', 'ARBS', 'SIBS-ACT-0020', 'MY', 'N', 'A', 'L', 1, 70000000, 'I');

insert into sci_lsp_sys_xref
(cms_lsp_sys_xref_id,  LSX_EXT_SYS_CODE_NUM, LSX_EXT_SYS_CODE_VALUE,
LSX_EXT_SYS_ACCT_NUM, LSX_EXT_CTY_CODE_VALUE, acct_delq_ind, acct_status,
LSX_EXT_SYS_ACCT_TYPE, LSX_EXT_SYS_ACCT_SEQ, CMS_OUTSTANDING_AMT, update_status_ind)
values
( CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for customer_x_ref_seq), 2)) AS bigint), 
'37', 'ARBS', 'SIBS-ACT-0021', 'MY', 'N', 'A', 'L', 1, 30000000, 'I');

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
	where xref.lsx_ext_sys_acct_num = 'SIBS-ACT-0018'), 'I'
from sci_lsp_appr_lmts lmt
where los_lmt_id = 'FAC-ALLOC-0013';

insert into sci_lsp_lmts_xref_map
(cms_lsp_lmts_xref_map_id, lxm_le_id, lxm_lmt_id, lxm_lsp_id, 
cms_lsp_appr_lmts_id, cms_status, cms_lsp_sys_xref_id, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_x_ref_seq), 2)) AS bigint), 
lmt.lmt_le_id, lmt.lmt_id, lmt.lmt_lsp_id, lmt.cms_lsp_appr_lmts_id, 'ACTIVE', 
	(select xref.cms_lsp_sys_xref_id
	from sci_lsp_sys_xref xref
	where xref.lsx_ext_sys_acct_num = 'SIBS-ACT-0019'), 'I'
from sci_lsp_appr_lmts lmt
where los_lmt_id = 'FAC-ALLOC-0014';

insert into sci_lsp_lmts_xref_map
(cms_lsp_lmts_xref_map_id, lxm_le_id, lxm_lmt_id, lxm_lsp_id, 
cms_lsp_appr_lmts_id, cms_status, cms_lsp_sys_xref_id, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_x_ref_seq), 2)) AS bigint), 
lmt.lmt_le_id, lmt.lmt_id, lmt.lmt_lsp_id, lmt.cms_lsp_appr_lmts_id, 'ACTIVE', 
	(select xref.cms_lsp_sys_xref_id
	from sci_lsp_sys_xref xref
	where xref.lsx_ext_sys_acct_num = 'SIBS-ACT-0020'), 'I'
from sci_lsp_appr_lmts lmt
where los_lmt_id = 'FAC-ALLOC-0015';

insert into sci_lsp_lmts_xref_map
(cms_lsp_lmts_xref_map_id, lxm_le_id, lxm_lmt_id, lxm_lsp_id, 
cms_lsp_appr_lmts_id, cms_status, cms_lsp_sys_xref_id, update_status_ind)
select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(next value for limit_x_ref_seq), 2)) AS bigint), 
lmt.lmt_le_id, lmt.lmt_id, lmt.lmt_lsp_id, lmt.cms_lsp_appr_lmts_id, 'ACTIVE', 
	(select xref.cms_lsp_sys_xref_id
	from sci_lsp_sys_xref xref
	where xref.lsx_ext_sys_acct_num = 'SIBS-ACT-0021'), 'I'
from sci_lsp_appr_lmts lmt
where los_lmt_id = 'FAC-ALLOC-0015';

commit work;