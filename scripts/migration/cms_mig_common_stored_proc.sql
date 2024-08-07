drop procedure mig_limit_security_map@
drop procedure mig_charge_details_rank@
drop procedure mig_charge_details_wo_rank@
drop procedure mig_limit_charge_map@
drop procedure mig_pledgor_pledgor@
drop procedure mig_pledgor@
drop procedure mig_sec_pledgor_map@
drop procedure mig_common_transaction@
drop procedure mig_common_valuation@
drop procedure mig_valuation_AB101@


create procedure mig_limit_security_map (in v_table varchar(20), in v_sec_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(500);
	declare v_update_stmt statement;
	
	set v_update_sql =	'insert into cms_limit_security_map ( '||
		'charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, sci_las_lmt_id,  '||
		'customer_category, cms_lsp_lmt_profile_id, create_date, update_status_ind )'||
		'(select cms_act_charge_id, cms_act_lmt_id, '||
		'(select cms_collateral_id from '||v_sec_table ||' s '||
		'where s.region = c.region and s.source_security_id = c.SOURCE_SECURITY_ID ), '||
		'source_limit_id, ''MB'', cms_act_lmt_profile_id, current_timestamp, ''I'' '||
		'from '||v_table || ' c '||
		'where c.valid_ind = ''Y'') ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
	
	set v_update_sql =	'insert into cms_stage_limit_security_map ( '||
		'charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, sci_las_lmt_id,  '||
		'customer_category, cms_lsp_lmt_profile_id, create_date, update_status_ind )'||
		'(select cms_act_charge_id, cms_act_lmt_id, '||
		'(select cms_collateral_id from '||v_sec_table ||' s '||
		'where s.region = c.region and s.source_security_id = c.SOURCE_SECURITY_ID ), '||
		'source_limit_id, ''MB'', cms_act_lmt_profile_id, current_timestamp, ''I'' '||
		'from '||v_table || ' c '||
		'where c.valid_ind = ''Y'') ';			
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_charge_details_rank (in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(500);
	declare v_update_stmt statement;
	
	-- todo: might need to change for prior charge type
	set v_update_sql = 'insert into cms_charge_detail ( '||
		'charge_detail_id,	charge_nature, charge_amount, charge_currency_code, legal_charge_date, charge_type'||
		'security_rank, prior_charge_amount, prior_charge_currency, prior_chargee, prior_charge_type, cms_ref_id, status) ' ||
		'(select cms_act_dtl_id, NATURE_OF_CHARGE_CODE, CHARGE_AMT, CHARGE_CURRENCY, DATE_LEGALLY_CHARGE, CHARGE_TYPE_CODE, '||
		'SECURITY_RANKING, PRIOR_CHARGE_AMT, PRIOR_CHARGE_CCY, PRIOR_CHARGEE, '||
		'case prior_charge_type when ''Not applicable'' then ''O'' else prior_charge_type end as prior_charge_type, '||
		'cms_act_dtl_id, ''ACTIVE'' '||
		'from '||v_table ||' where valid_ind = ''Y'' and valid_charge_ind = ''Y'' )';

	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;		
	
	set v_update_sql = 'insert into cms_stage_charge_detail ( '||
		'charge_detail_id,	charge_nature, charge_amount, charge_currency_code, legal_charge_date, charge_type'||
		'security_rank, prior_charge_amount, prior_charge_currency, prior_chargee, prior_charge_type, cms_ref_id, status) ' ||
		'(select cms_stg_dtl_id, NATURE_OF_CHARGE_CODE, CHARGE_AMT, CHARGE_CURRENCY, DATE_LEGALLY_CHARGE, CHARGE_TYPE_CODE, '||
		'SECURITY_RANKING, PRIOR_CHARGE_AMT, PRIOR_CHARGE_CCY, PRIOR_CHARGEE, '||
		'case prior_charge_type when ''Not applicable'' then ''O'' else prior_charge_type end as prior_charge_type, '||
		'cms_act_dtl_id, ''ACTIVE'' '||
		'from '||v_table ||' where valid_ind = ''Y'' and valid_charge_ind = ''Y'' )';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;				
end
@

create procedure mig_charge_details_wo_rank(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(500);
	declare v_update_stmt statement;
	
	set v_update_sql = 'insert into cms_charge_detail ( '||
		'charge_detail_id,	charge_nature, charge_amount, charge_currency_code, legal_charge_date, '||
		'charge_type, cms_ref_id, status) ' ||
		'(select cms_act_dtl_id, NATURE_OF_CHARGE_CODE, CHARGE_AMT, CHARGE_CURRENCY, DATE_LEGALLY_CHARGE, '||
		'CHARGE_TYPE_CODE, cms_act_dtl_id, ''ACTIVE'' '||
		'from '||v_table ||' where valid_ind = ''Y'' and valid_charge_ind = ''Y'' )';

	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;		
	
	set v_update_sql = 'insert into cms_stage_charge_detail ( '||
		'charge_detail_id,	charge_nature, charge_amount, charge_currency_code, legal_charge_date, '||
		'charge_type, cms_ref_id, status) ' ||
		'(select cms_stg_dtl_id, NATURE_OF_CHARGE_CODE, CHARGE_AMT, CHARGE_CURRENCY, DATE_LEGALLY_CHARGE, '||
		'CHARGE_TYPE_CODE, cms_act_dtl_id, ''ACTIVE'' '||
		'from '||v_table ||' where valid_ind = ''Y'' and valid_charge_ind = ''Y'' )';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;				
end
@

create procedure mig_limit_charge_map(in v_table varchar(20), in v_sec_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(1000);
	declare v_update_stmt statement;
	
	set v_update_sql = 'INSERT INTO cms_limit_charge_map ( '||
		'limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, '||
		'status, customer_category, cms_lsp_lmt_profile_id) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR limit_charge_map_seq), 2)) as BIGINT), '||
		'cms_act_lmt_id, cms_act_charge_id, cms_act_dtl_id, '||
		'(select cms_collateral_id from '||v_sec_table ||' s '||
		'where s.region = c.region and s.source_security_id = c.SOURCE_SECURITY_ID ), '||
		'''ACTIVE'', ''MB'', cms_act_lmt_profile_id '||
		'from '||v_table||' c where valid_ind = ''Y'') ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;		
	
	set v_update_sql = 'INSERT INTO cms_stage_limit_charge_map ( '||
		'limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, '||
		'status, customer_category, cms_lsp_lmt_profile_id) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR limit_charge_map_seq), 2)) as BIGINT), '||
		'cms_act_lmt_id, cms_act_charge_id, cms_stg_dtl_id, '||
		'(select cms_collateral_id from '||v_sec_table ||' s '||
		'where s.region = c.region and s.source_security_id = c.SOURCE_SECURITY_ID ), '||
		'''ACTIVE'', ''MB'', cms_act_lmt_profile_id '||
		'from '||v_table||' c where valid_ind = ''Y'') ';			
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_pledgor_pledgor (
	in v_table varchar(20),
	in v_pledgor varchar(20),
	in v_pledgor_ind varchar(20),
	in v_pledgor_id_col varchar(20))
	language sql
begin
	declare v_sql varchar(300);
	declare v_ins_sql varchar(500);
	declare v_insert_pledgor_sql varchar(800);
	declare v_update_mig varchar(800);
	
	declare v_no_data int;
	
	declare v_sec_id varchar(20);
	declare v_cif_number varchar(20);
	declare v_source_id varchar(10);
	declare v_region varchar(20);
	
	declare v_pledgor_id varchar(19);
	
	declare v_stmt statement;
	declare v_insert_plgr_stmt statement;
	declare v_update_mig_stmt statement;
	
	declare cur_pledgor cursor for v_stmt;
	
  	DECLARE CONTINUE HANDLER FOR NOT FOUND
    	SET v_no_data = 1;	
	
	set v_no_data = 0;
	
	set v_ins_sql = 'insert into sci_pledgor_dtl( '||
		'cms_pledgor_dtl_id, plg_le_id, plg_le_id_src_num, plg_le_id_src_value, '||
		'plg_legal_name, source_id ) ';
			
	set v_sql = 'select source_security_id, '||v_pledgor||' as cif_number, source_id, region from '||v_table||
		' where '||v_pledgor_ind||' = ''Y'' and '||v_pledgor_id_col||' is null';
	
	PREPARE v_stmt FROM v_sql;
	open cur_pledgor;
	while (v_no_data = 0) do
		fetch cur_pledgor into v_sec_id, v_cif_number, v_source_id, v_region;
		
		if (v_no_data = 0) then
			set v_pledgor_id = (TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2));
			
			set	v_insert_pledgor_sql = v_ins_sql || 
				' values ( ' ||v_pledgor_id||', '''||v_cif_number||''', ''37'', ''ARBS'', '||
				'(select lsp_short_name from sci_le_sub_profile sp, sci_le_main_profile mp '||
				'where mp.source_id = ''ARBS'' and mp.lmp_le_id = '''||v_cif_number||''' '||
				'and mp.cms_le_main_profile_id = sp.cms_le_main_profile_id), '''||v_source_id ||''') ';
			
			prepare v_insert_plgr_stmt from v_insert_pledgor_sql;
			execute v_insert_plgr_stmt;
			
			set v_update_mig = 'update '||v_table|| ' set '||v_pledgor_id_col||' = '||v_pledgor_id|| 
				' where region = '''||v_region||''' '||
				' and '||v_pledgor||' = '''||v_cif_number||''' '||
				' and source_security_id = '''||v_sec_id||''' '||
				' and '||v_pledgor_id_col||' is null '||
				' and '||v_pledgor_ind||' = ''Y'' ';
				
			prepare v_update_mig_stmt from v_update_mig;
			execute v_update_mig_stmt;
		end if;
		
	end while;
	close cur_pledgor;
end
@


create procedure mig_pledgor(in v_table varchar(20))
	language sql
begin
	declare v_sql varchar(250);
	declare v_ins_sql varchar(400);
	declare v_insert_pledgor_sql varchar(700);
	declare v_update_mig varchar(700);
	
	declare v_no_data int;
		
	declare v_sec_id varchar(20);
	declare v_cif_number varchar(20);
	declare v_source_id varchar(10);
	declare v_region varchar(20);
	
	declare v_pledgor_id varchar(19);	
	
	declare v_stmt statement;
	declare v_insert_plgr_stmt statement;
	declare v_update_mig_stmt statement;
	
	declare cur_pledgor cursor for v_stmt;	
		
  	DECLARE CONTINUE HANDLER FOR NOT FOUND
    	SET v_no_data = 1;
    	
	set v_no_data = 0;	
	
	set v_ins_sql = 'insert into sci_pledgor_dtl( '||
		'cms_pledgor_dtl_id, plg_le_id, plg_le_id_src_num, plg_le_id_src_value, '||
		'plg_legal_name, source_id ) ';
			
	set v_sql = 'select source_security_id, cif_number, source_id, region from '||v_table||
		' where is_borrower_pledgor = ''Y'' and is_brrw_plgr_ind = ''Y'' and cms_pledgor_id is null';
	
	PREPARE v_stmt FROM v_sql;
	open cur_pledgor;
	while (v_no_data = 0) do
		fetch cur_pledgor into v_sec_id, v_cif_number, v_source_id, v_region;
	
		if (v_no_data = 0) then
			set v_pledgor_id = (TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2));
			
			set	v_insert_pledgor_sql = v_ins_sql || ' values ('||v_pledgor_id||', '''||v_cif_number||''', ''37'', ''ARBS'', '||
				'(select lsp_short_name from sci_le_sub_profile sp, sci_le_main_profile mp '||
				'where mp.source_id = ''ARBS'' and mp.lmp_le_id = '''||v_cif_number||''' '||
				'and mp.cms_le_main_profile_id = sp.cms_le_main_profile_id), '''||v_source_id ||''') ';
			
			prepare v_insert_plgr_stmt from v_insert_pledgor_sql;
			execute v_insert_plgr_stmt;
			
			set v_update_mig = 'update '||v_table|| ' set cms_pledgor_id = '||v_pledgor_id|| 
				' where region = '''||v_region||''' '||
				' and cif_number = '''||v_cif_number||''' '||
				' and source_security_id = '''||v_sec_id||''' '||
				' and cms_pledgor_id is null '||
				' and is_borrower_pledgor = ''Y'' '||
				' and is_brrw_plgr_ind = ''Y'' ';
				
			prepare v_update_mig_stmt from v_update_mig;
			execute v_update_mig_stmt;			
			
			--set v_no_data = 0;
		end if;
	end while;
	close cur_pledgor;
	
	call "MIG_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR1', 'CIF_PLEDGOR1_IND', 'CMS_PLEDGOR1_ID');
	
	call "MIG_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR2', 'CIF_PLEDGOR2_IND', 'CMS_PLEDGOR2_ID');
	
	call "MIG_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR3', 'CIF_PLEDGOR3_IND', 'CMS_PLEDGOR3_ID');
	
	call "MIG_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR4', 'CIF_PLEDGOR4_IND', 'CMS_PLEDGOR4_ID');			
end
@

create procedure mig_sec_pledgor_map (in v_table varchar(20), in v_sec_table varchar(20))
	language sql
begin
	declare v_sql varchar(1000);
	declare v_stmt statement;
	
	set v_sql = 'insert into sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id,  cms_collateral_id,'||
		'cms_pledgor_dtl_id, sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT), '||
		'(select SECURITY_SUB_TYPE_ID || ''-'' || SOURCE_SECURITY_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'CMS_PLEDGOR_ID, ''34'', ''1st'', ''I'' '||
		'from '||v_table||' a '||
		'where IS_BORROWER_PLEDGOR = ''Y'' and IS_BRRW_PLGR_IND = ''Y'') ';
		
	prepare v_stmt from v_sql;
	execute v_stmt;		
	
	set v_sql = 'insert into sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id,  cms_collateral_id,'||
		'cms_pledgor_dtl_id, sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT), '||
		'(select SECURITY_SUB_TYPE_ID || ''-'' || SOURCE_SECURITY_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'CMS_PLEDGOR1_ID, ''34'', ''3rd'', ''I'' '||
		'from '||v_table||' a '||
		'where CIF_PLEDGOR1_IND = ''Y'' and CMS_PLEDGOR1_ID is not null)';
		
	prepare v_stmt from v_sql;
	execute v_stmt;		
			
	set v_sql = 'insert into sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id,  cms_collateral_id,'||
		'cms_pledgor_dtl_id, sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT), '||
		'(select SECURITY_SUB_TYPE_ID || ''-'' || SOURCE_SECURITY_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'CMS_PLEDGOR2_ID, ''34'', ''3rd'', ''I'' '||
		'from '||v_table||' a '||
		'where CIF_PLEDGOR2_IND = ''Y'' and CMS_PLEDGOR2_ID is not null)';	
		
	prepare v_stmt from v_sql;
	execute v_stmt;					
	
	set v_sql = 'insert into sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id,  cms_collateral_id,'||
		'cms_pledgor_dtl_id, sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT), '||
		'(select SECURITY_SUB_TYPE_ID || ''-'' || SOURCE_SECURITY_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'CMS_PLEDGOR3_ID, ''34'', ''3rd'', ''I'' '||
		'from '||v_table||' a '||
		'where CIF_PLEDGOR3_IND = ''Y'' and CMS_PLEDGOR3_ID is not null)';	
		
	prepare v_stmt from v_sql;
	execute v_stmt;						
	
	set v_sql = 'insert into sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id,  cms_collateral_id,'||
		'cms_pledgor_dtl_id, sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind) '||
		'(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT), '||
		'(select SECURITY_SUB_TYPE_ID || ''-'' || SOURCE_SECURITY_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'CMS_PLEDGOR4_ID, ''34'', ''3rd'', ''I'' '||
		'from '||v_table||' a '||
		'where CIF_PLEDGOR4_IND = ''Y'' and CMS_PLEDGOR4_ID is not null)';	
		
	prepare v_stmt from v_sql;
	execute v_stmt;						
end
@

create procedure mig_common_transaction (in v_table varchar(20))
	language sql
begin

	declare v_sql varchar(1000);
	declare v_stmt statement;
	-------------------------------------------------
	-- insert into transaction table
	-------------------------------------------------		
	set v_sql = 'insert into TRANSACTION '||
		'(transaction_id, transaction_type, from_state, user_id, creation_date, transaction_date, ' ||
		'reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc, '||
		'trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id, '||
		' to_group_id, to_user_id) '||
		' select (''20070201''||REPEAT(''0'',9-length(RTRIM(CHAR(NEXT VALUE FOR TRX_SEQ))))||RTRIM(CHAR(PREVIOUS VALUE FOR TRX_SEQ+1))), '||
		'''COL'', ''ND'', -1, current timestamp, current timestamp, '||
		'cms_collateral_id, ''ACTIVE'', cms_collateral_stg_id, 0, 1, -999999999, ''SYSTEM_CREATE'', '||
		'''--'', ''--'', ''--'', ''-999999999'', -999999999, -999999999 ' ||
		' from '||v_table||
		' where valid_ind = ''Y''';	

insert into transaction 
(transaction_id, 
transaction_type, from_state, user_id, creation_date, transaction_date,
reference_id, status, staging_reference_id, team_id, version, trx_reference_id, opsdesc,
trx_origin_country, trx_origin_organisation, trx_segment, to_group_type_id,
to_group_id, to_user_id)
select ('20070201'||REPEAT('0',9-length(RTRIM(CHAR(NEXT VALUE FOR TRX_SEQ))))||RTRIM(CHAR(PREVIOUS VALUE FOR TRX_SEQ+1))),
'CUSTOMER', 'ND', -1, current timestamp, current timestamp, 
cms_le_sub_profile_id, 'ACTIVE', cms_le_main_profile_id, 0, 1, -999999999, 'SYSTEM_CREATE',
'--', '--', '--', '-999999999', -999999999, -999999999
from sci_le_sub_profile where lsp_le_id = 'ARBS-00009';

	prepare v_stmt from v_sql;
	execute v_stmt;	
end
@

create procedure mig_common_valuation (in v_table varchar(20), in v_sec_table varchar(20) , in v_val_type varchar(10), in v_source_type varchar(10))
	language sql
begin
	declare v_sql varchar(1000);
	declare v_stmt statement;
	
	set v_sql = 'insert into cms_valuation (valuation_id, valuation_currency, valuation_date, valuer,  '||
		'cmv, fsv, cms_collateral_id, comments, valuation_type, reserve_price, reserve_price_date, ' ||
		'source_type, source_id) ' ||
		'(SELECT VALUATION_ID, VALUATION_CCY, VALUATION_DATE, VALUER_CODE, '||
		'VALUATION_OMV, VALUATION_FSV, ' ||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'COMMENTS, '''||v_val_type||''', RESERVE_PRICE, RESERVE_PRICE_DATE, '||
		''''||v_source_type||''', SOURCE_ID '||
		' from '||v_table||' a '||
		'where a.VALID_IND = ''Y'') '; 
	
	prepare v_stmt from v_sql;
	execute v_stmt;	
	
	set v_sql = 'insert into cms_stage_valuation (valuation_id, valuation_currency, valuation_date, valuer,  '||
		'cmv, fsv, cms_collateral_id, comments, valuation_type, reserve_price, reserve_price_date, ' ||
		'source_type, source_id) ' ||
		'(SELECT VALUATION_STG_ID, VALUATION_CCY, '||
 		' VALUATION_DATE, VALUER_CODE, '||
		'VALUATION_OMV, VALUATION_FSV, ' ||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'COMMENTS, '''||v_val_type||''', RESERVE_PRICE, RESERVE_PRICE_DATE, '||
		''''||v_source_type||''', SOURCE_ID '||
		' from '||v_table||' a '||
		' where a.VALID_IND = ''Y'') '; 	

	prepare v_stmt from v_sql;
	execute v_stmt;	
	
end
@

create procedure mig_valuation_AB101 (in v_table varchar(20), in v_sec_table varchar(20) , in v_val_type varchar(10), in v_source_type varchar(10))
	language sql
begin
	declare v_sql varchar(500);
	declare v_stmt statement;
	
	set v_sql = 'insert into cms_valuation (valuation_id, valuation_currency, valuation_date, valuer,  '||
		'cmv, fsv, cms_collateral_id, comments, valuation_type, reserve_price, reserve_price_date, ' ||
		'source_type, source_id, olv, remaining_useful_life) ' ||
		'(select VALUATION_ID, VALUATION_CCY, VALUATION_DATE, VALUER_CODE, '||
		'VALUATION_OMV, VALUATION_FSV, ' ||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'COMMENTS, '''||v_val_type||''', RESERVE_PRICE, RESERVE_PRICE_DATE, '||
		''''||v_source_type||''', SOURCE_ID, OLV, REMAINING_USEFUL_LIFE '||
		' from '||v_table||' a '||
		'where a.valid_ind = ''Y'') '; 

	prepare v_stmt from v_sql;
	execute v_stmt;	
	
	set v_sql = 'insert into cms_stage_valuation (valuation_id, valuation_currency,  valuation_date, valuer,  '||
		'cmv, fsv, cms_collateral_id, comments, valuation_type, reserve_price, reserve_price_date, ' ||
		'source_type, source_id, olv, remaining_useful_life) ' ||
		'(select VALUATION_STG_ID, VALUATION_CCY, '||
		' VALUATION_DATE, VALUER_CODE, '||
		'VALUATION_OMV, VALUATION_FSV, ' ||
		'(select CMS_COLLATERAL_ID from '||v_sec_table||' s '||
		'where s.source_security_id = a.SOURCE_SECURITY_ID and s.region = a.region), '||
		'COMMENTS, '''||v_val_type||''', RESERVE_PRICE, RESERVE_PRICE_DATE, '||
		''''||v_source_type||''', SOURCE_ID, OLV, REMAINING_USEFUL_LIFE '||
		' from '||v_table||' a '||
		'where a.valid_ind = ''Y'') '; 

	prepare v_stmt from v_sql;
	execute v_stmt;
end
@