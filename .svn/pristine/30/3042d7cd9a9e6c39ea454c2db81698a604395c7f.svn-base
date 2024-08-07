drop procedure mig_validate_security_subtype@
drop procedure mig_validate_phy_insp@
drop procedure mig_validate_sec_env@
drop procedure mig_validate_charge_security@
drop procedure mig_validate_charge_limit@
drop procedure mig_validate_related_charge_rank_linkage@
drop procedure mig_validate_related_charge_linkage@
drop procedure mig_invalid_charge_rank@
drop procedure mig_invalid_charge@
drop procedure mig_invalid_null_pledgor@
drop procedure mig_valid_pledgor_borrower@
drop procedure mig_valid_pledgor_pledgor@
drop procedure mig_validate_duplicate_pledgor@
drop procedure mig_validate_pledgor_cif@
drop procedure mig_validate_pledgor@
drop procedure mig_validate_common_sec_mandatory@
drop procedure mig_invalid_non_borrower_pledgor@
drop procedure mig_validate_charge@

create procedure mig_validate_security_subtype (in v_table varchar(20))
	language sql
begin
	--------------------------------------------------------------
	-- Validate the validity of security subtype given
	---------------------------------------------------------------
	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'UPDATE ' || v_table || 
		' set valid_ind = ''N'' where substr(SECURITY_SUB_TYPE, 1, 5) <> SECURITY_SUB_TYPE_ID and valid_ind = ''Y''';
	set v_insert_ind = 'INSERT INTO mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(SELECT CURRENT_TIMESTAMP, ''MIG-''||SOURCE_ID, '''|| v_table ||
		'-''||REGION, source_security_id, ''QC3h'', '||
		'''Security Subtype Mismatch: Given [''|| SECURITY_SUB_TYPE || ''] Required [''|| '||
		'SECURITY_SUB_TYPE_ID ||'']'' FROM '|| v_table ||' WHERE valid_ind = ''N'' '||
		'and substr(security_sub_type, 1, 5) <> security_sub_type_id)';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@

create procedure mig_validate_phy_insp(in v_table varchar(20))
	language sql
begin
	--------------------------------------------------------------------
	-- validate the validity of the physical inspection date
	-------------------------------------------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	set v_update_ind = 'UPDATE ' || v_table || 
		' set valid_ind = ''N'' '||
		'where PHYSICAL_INSPECTION_IND = ''Y'' and LAST_PHYSICAL_INSPECTION_DATE is null and valid_ind = ''Y''';
		
	set v_insert_ind = 'INSERT INTO mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(SELECT CURRENT_TIMESTAMP, ''MIG-''||SOURCE_ID, '''|| v_table ||
		'-''||REGION, source_security_id, ''QC3d'', '||
		'''Physical Inspection Date is missing '''||
		' FROM '|| v_table ||' WHERE valid_ind = ''N'''||
		' and PHYSICAL_INSPECTION_IND = ''Y'' and LAST_PHYSICAL_INSPECTION_DATE is null)';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;	
end
@

create procedure mig_validate_sec_env(in v_table varchar(20))
	language sql
begin
	--------------------------------------------------------------------
	-- validate the validity of the physical inspection date
	-------------------------------------------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	set v_update_ind = 'UPDATE ' || v_table || 
		' set valid_ind = ''N'' where SEC_ENVIRONMENTAL_RISKY_IND = ''Y'' and DATE_SEC_CONFIRM_ENV_RISKY is null and valid_ind = ''Y''';
	set v_insert_ind = 'INSERT INTO mig_error_log '||
		'(time_stamp, system_id, interface_id, error_code, error_msg) '||
		'(SELECT CURRENT_TIMESTAMP, ''MIG-''||SOURCE_ID, '''|| v_table ||
		'-''||REGION, ''QC3d'', '||
		'''Security Confirmed Env Risky Date Required to security [''|| SOURCE_SECURITY_ID ||''] '''||
		' FROM '|| v_table ||' WHERE valid_ind = ''N'' '||
		' and SEC_ENVIRONMENTAL_RISKY_IND = ''Y'' and DATE_SEC_CONFIRM_ENV_RISKY is null)';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@

create procedure mig_validate_charge_security (in v_table_charge varchar(20), in v_table_sec varchar(20))
	language sql
begin
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	set v_update_ind = 'UPDATE '||v_table_charge|| ' c ' ||
		'SET valid_ind = ''N'' where exists '||
			'(select ''1''	from '||v_table_sec|| ' a '||
			'where a.SOURCE_SECURITY_ID = c.SOURCE_SECURITY_ID '||
			'and a.REGION = c.REGION '||
			'and a.valid_ind = ''N'')';
			
	set v_insert_ind = 'INSERT INTO mig_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table_charge||'-''||REGION, source_security_id, ''QC3f'' , '||
			'''Invalid charge due to security [''|| source_security_id || ''] failed from validation'' '||
		'from '||v_table_charge||' where valid_ind = ''N'')';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;		
end
@

create procedure mig_validate_charge_limit(in v_table_charge varchar(20))
	language sql
begin
	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	set v_update_ind = 'update '||v_table_charge|| ' c'||
		' set valid_ind = ''N'' where valid_ind = ''Y'' and not exists '||
			'(select ''1'' from sci_lsp_appr_lmts lmts '||
			'where lmts.lmt_id = c.SOURCE_LIMIT_ID '||
			'and lmts.source_id = c.source_id)';
		
	set v_insert_ind = 'insert into mig_error_log(time_stamp, system_id, interface_id, KEY1_VALUE, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table_charge||'-''||REGION, SOURCE_LIMIT_ID, ''QC3f'', '||
			'''Source Facility ID [''|| source_limit_id || ''] not found'' '||
			'from '||v_table_charge|| ' c where valid_ind = ''N'' and not exists '||
				'(select ''1'' from sci_lsp_appr_lmts lmts '||
				'where lmts.lmt_id = c.source_limit_id '||
				'and lmts.source_id = c.source_id))'; 	
			
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;				
end
@

create procedure mig_validate_related_charge_rank_linkage (in v_table_charge varchar(20))
	language sql
begin
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1000);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	set v_update_ind = 'update '||v_table_charge|| ' c '||
		'set valid_charge_ind = ''N'' where valid_ind = ''Y'' and exists '||
			'(select ''1'' from '||v_table_charge|| ' t	where t.region = c.region '||
			'and t.SOURCE_SECURITY_ID = c.SOURCE_SECURITY_ID '||
			'and t.SECURITY_RANKING = c.security_ranking '||
			'and t.valid_ind = ''N'')';
		
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table_charge||'-''||REGION, '||
			'source_limit_id, source_security_id, ''QC3h'', '||
			'''Charge information for SOURCE FACILITY ID [''||source_limit_id||''], '||
			'SOURCE SECURITY ID [''||source_security_id||''], SECURITY RANKING [''||char(SECURITY_RANKING)||''] '||
			'will not be migrated due to related facility security linkage for same charge failed validation'' '||
		 'from '||v_table_charge||' c where valid_charge_ind = ''N'' and exists '||
			'(select ''1'' from '||v_table_charge||' t '||
			'where t.region = c.region '||
			'and t.SOURCE_SECURITY_ID = c.SOURCE_SECURITY_ID '||
			'and t.SECURITY_RANKING = c.security_ranking '||
			'and t.valid_ind = ''N'')) ';
						
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;							
end
@

create procedure mig_validate_related_charge_linkage (in v_table_charge varchar(20))
	language sql
begin
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	declare v_update_ind varchar(1500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	set v_update_ind = 'update '||v_table_charge|| ' c '||
		'set valid_charge_ind = ''N'' where valid_ind = ''Y'' and exists '||
			'(select ''1'' from '||v_table_charge|| ' t	where t.region = c.region '||
			'and t.SOURCE_SECURITY_ID = c.SOURCE_SECURITY_ID '||
			'and t.valid_ind = ''N'')';
		
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table_charge||'-''||REGION, source_limit_id, source_security_id, '||
			'''QC3h'', ''Charge information for SOURCE FACILITY ID [''||source_limit_id||''], SOURCE SECURITY ID '||
			'[''||source_security_id||''] '||
			'will not be migrated due to related facility security linkage for same charge failed validation'''||
		    ' from '||v_table_charge|| ' c where valid_charge_ind = ''N'' and exists '||
			'(select ''1'' from '||v_table_charge ||' t '||
			'where t.region = c.region '||
			'and t.SOURCE_SECURITY_ID = c.SOURCE_SECURITY_ID '||
			'and t.valid_ind = ''N''))';
			
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;							
end
@

create procedure mig_invalid_charge_rank(in v_table_charge varchar(20))
	language sql
begin
	----------------------------------------------------------------------------------------------------
	-- set valid charge ind to N if it is not the 1 charge occurrence for the security of the same rank
	-- this is to indicate ignore this record for migration, so no error report required
	----------------------------------------------------------------------------------------------------
	declare v_update_ind varchar(500);
	
	declare stmt1 statement;
	
	set v_update_ind = 'update '||v_table_charge|| ' c '||
		'set valid_charge_ind = ''N'' '||
		'where valid_charge_ind = ''Y'' and exists '||
		'(select ''1'' from '||
			'(select row_number() over(partition by REGION, SOURCE_SECURITY_ID, SECURITY_RANKING) as rowid, '||
			'REGION, SOURCE_SECURITY_ID, SOURCE_LIMIT_ID, SECURITY_RANKING '||
			'from '||v_table_charge||' t ) a '||
			'where rowid > 1 '||
			'and a.region = c.region '||
			'and a.source_security_id = c.source_security_id '||
			'and a.source_limit_id = c.source_limit_id '||
			'and a.security_ranking = c.security_ranking )';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;		
end
@

create procedure mig_invalid_charge(in v_table_charge varchar(20))
	language sql
begin
	----------------------------------------------------------------------------------------------------
	-- set valid charge ind to N if it is not the 1 charge occurrence for the security of the same rank
	-- this is to indicate ignore this record for migration, so no error report required
	----------------------------------------------------------------------------------------------------
	declare v_update_ind varchar(1000);
	
	declare stmt1 statement;
	
	set v_update_ind = 'update '||v_table_charge|| ' c '||
		'set valid_charge_ind = ''N'' '||
		'where valid_charge_ind = ''Y'' and exists '||
		'(select ''1'' from '||
			'(select row_number() over(partition by REGION, SOURCE_SECURITY_ID) as rowid, '||
			'REGION, SOURCE_SECURITY_ID, SOURCE_LIMIT_ID, SECURITY_RANKING '||
			'from '||v_table_charge||' ) a '||
			'where rowid > 1 '||
			'and a.region = c.region '||
			'and a.source_security_id = c.source_security_id '||
			'and a.source_limit_id = c.source_limit_id ) ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;		
end
@

create procedure mig_invalid_null_pledgor (
	in v_table varchar(20),
	in v_column varchar(20),
	in v_ind_column varchar(20))
	language sql
begin
	---------------------------------------------------------------------------------
	-- set the ind to 'N' if the pledgor cif given is null (not to migrate)
	-- for this case, no error report required (to ease the migration purpose)
	---------------------------------------------------------------------------------
	declare v_update_ind varchar(500);
	
	declare stmt1 statement;

	set v_update_ind = 'update '||v_table||' set '||v_ind_column||' = ''N'' where '||v_column||' is null';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;	
end
@

create procedure mig_valid_pledgor_borrower (
	in v_table varchar(20),
	in v_pledgor_column varchar(20),
	in v_pledgor_ind varchar(20))
	language sql
begin
	declare v_update_ind varchar(1000);
	declare v_insert_ind varchar(1000);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	-- check against borrower CIF
	set v_update_ind = 'update '||v_table||' set '||v_pledgor_ind||' = ''N'' where '||v_pledgor_ind||' = ''Y'' '||
		'and IS_BORROWER_PLEDGOR = ''Y'' '||
		'and CIF_NUMBER = '||v_pledgor_column;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table||'-''||REGION, '||v_pledgor_column||', '||
			'''QC3h'', ''Pledgor for CIF Number [''||'||v_pledgor_column||'||''] is duplicated'' '||
		'from '||v_table|| ' c where '||v_pledgor_ind||' = ''N'' '||
		'and IS_BORROWER_PLEDGOR = ''Y'' '||
		'and CIF_NUMBER = '||v_pledgor_column||')';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;

end
@

create procedure mig_valid_pledgor_pledgor (
	in v_table varchar(20),
	in v_pledgor1_column varchar(20),
	in v_pledgor2_column varchar(20),
	in v_pledgor1_ind varchar(20),
	in v_pledgor2_ind varchar(20))
	language sql
begin
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(500);
	
	declare stmt1 statement;
	declare stmt2 statement;

	-- check whether duplicate pledgors given for the same security
	set v_update_ind = 'update '||v_table||' set '||v_pledgor2_ind||' = ''N'' where '||v_pledgor2_ind||' = ''Y'' '||
		'and '||v_pledgor1_ind||' = ''Y'' '||
		'and '||v_pledgor1_column||' = '||v_pledgor2_column;
		
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table||'-''||REGION, '||v_pledgor2_column||', '||
			'''QC3h'', ''Pledgor for CIF Number [''||'||v_pledgor2_column||'||''] is duplicated'' '||
		'from '||v_table|| ' c where '||v_pledgor2_ind||' = ''N'' '||
		'and '||v_pledgor1_ind||' = ''Y'' '||
		'and '||v_pledgor1_column||' = '||v_pledgor2_column||')';	
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;		
end
@

create procedure mig_validate_duplicate_pledgor (in v_table varchar(20))
	language sql
begin
	-----------------------------------------------------------------
	-- validate for duplicate pledgor info given for same security
	-----------------------------------------------------------------
	-----------------------------
	-- checking for pledgor 1
	-----------------------------
	-- check against borrower CIF
	call "MIG_VALID_PLEDGOR_BORROWER"(v_table, 'CIF_PLEDGOR1', 'CIF_PLEDGOR1_IND');
	
	-----------------------------
	-- checking for pledgor 2
	-----------------------------
	-- checking against borrower CIF
	call "MIG_VALID_PLEDGOR_BORROWER"(v_table, 'CIF_PLEDGOR2', 'CIF_PLEDGOR2_IND');
	
	-- checking against pledgor CIF 1
	call "MIG_VALID_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR1', 'CIF_PLEDGOR2', 'CIF_PLEDGOR1_IND', 'CIF_PLEDGOR2_IND');
		
	---------------------------
	-- checking for pledgor 3
	---------------------------
	-- checking against borrower CIF
	call "MIG_VALID_PLEDGOR_BORROWER"(v_table, 'CIF_PLEDGOR3', 'CIF_PLEDGOR3_IND');
	
	-- checking against pledgor CIF 1
	call "MIG_VALID_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR1', 'CIF_PLEDGOR3', 'CIF_PLEDGOR1_IND', 'CIF_PLEDGOR3_IND');
	
	-- checking against pledgor CIF 2
	call "MIG_VALID_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR2', 'CIF_PLEDGOR3', 'CIF_PLEDGOR2_IND', 'CIF_PLEDGOR3_IND');
	
	---------------------------
	-- checking for pledgor 4
	---------------------------
	-- checking against borrower CIF
	call "MIG_VALID_PLEDGOR_BORROWER"(v_table, 'CIF_PLEDGOR4', 'CIF_PLEDGOR4_IND');
	
	-- checking against pledgor CIF 1
	call "MIG_VALID_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR1', 'CIF_PLEDGOR4', 'CIF_PLEDGOR1_IND', 'CIF_PLEDGOR4_IND');
	
	-- checking against pledgor CIF 2
	call "MIG_VALID_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR2', 'CIF_PLEDGOR4', 'CIF_PLEDGOR2_IND', 'CIF_PLEDGOR4_IND');
	
	-- checking against pledgor CIF 2
	call "MIG_VALID_PLEDGOR_PLEDGOR"(v_table, 'CIF_PLEDGOR3', 'CIF_PLEDGOR4', 'CIF_PLEDGOR3_IND', 'CIF_PLEDGOR4_IND');		
end
@

create procedure mig_validate_pledgor_cif (
	in v_table varchar(20), 
	in v_column varchar(20), 
	in check_borrower char(1),
	in v_ind_column varchar(20))
	language sql
begin
	----------------------------------------------------------------------
	-- Validate the valid cif number if the borrower is the pledgor
	---------------------------------------------------------------------
	declare v_update_ind varchar(1000);
	declare v_insert_ind varchar(1000);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	if (check_borrower = 'Y') then
		set v_update_ind = 'update '|| v_table ||
			' set '||v_ind_column||' = ''N'' where '||v_ind_column||' = ''Y'' and '||v_column||' is not null '||
			' and IS_BORROWER_PLEDGOR = ''Y'' and not exists '||
			' (select ''1'' from sci_le_main_profile mp where mp.source_id = ''ARBS'' '||
			' and mp.lmp_le_id = '||v_column||')';
	else
		set v_update_ind = 'update '|| v_table ||
			' set '||v_ind_column||' = ''N'' where '||v_ind_column||' = ''Y'' and '||v_column||' is not null and not exists '||
			' (select ''1'' from sci_le_main_profile mp where mp.source_id = ''ARBS'' '||
			' and mp.lmp_le_id = '||v_column||')';
	end if;
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table||'-''||REGION, '||v_column||', '||
			'''QC3f'', ''Pledgor for CIF Number [''||'||v_column||'||''] not found'' '||
		'from '||v_table|| ' c where '||v_ind_column||' = ''N'' and '||v_column||' is not null and not exists '||
		'(select ''1'' from sci_le_main_profile mp where mp.source_id = ''ARBS'' '||
		' and mp.lmp_le_id = '||v_column||'))';

	prepare stmt2 from v_insert_ind;
	execute stmt2;		
end
@

create procedure mig_invalid_non_borrower_pledgor (in v_table varchar(20))
	language sql
begin
	---------------------------------------------------------------------------------
	-- set the ind to 'N' if the pledgor cif given is null (not to migrate)
	-- for this case, no error report required (to ease the migration purpose)
	---------------------------------------------------------------------------------
	declare v_update_ind varchar(500);
	
	declare stmt1 statement;

	set v_update_ind = 'update '||v_table||' set IS_BRRW_PLGR_IND = ''N'' '||
		'where is_borrower_pledgor is null or is_borrower_pledgor = ''N''';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;	
end
@

create procedure mig_validate_pledgor (in v_table varchar(20))
	language sql
begin

	call "MIG_INVALID_NON_BORROWER_PLEDGOR"(v_table);
	
	call "MIG_INVALID_NULL_PLEDGOR"(v_table, 'CIF_NUMBER', 'IS_BRRW_PLGR_IND');
	
	call "MIG_INVALID_NULL_PLEDGOR"(v_table, 'CIF_PLEDGOR1', 'CIF_PLEDGOR1_IND');
	
	call "MIG_INVALID_NULL_PLEDGOR"(v_table, 'CIF_PLEDGOR2', 'CIF_PLEDGOR2_IND');
	
	call "MIG_INVALID_NULL_PLEDGOR"(v_table, 'CIF_PLEDGOR3', 'CIF_PLEDGOR3_IND');
	
	call "MIG_INVALID_NULL_PLEDGOR"(v_table, 'CIF_PLEDGOR4', 'CIF_PLEDGOR4_IND');
	
	call "MIG_VALIDATE_DUPLICATE_PLEDGOR"(v_table);
	
	call "MIG_VALIDATE_PLEDGOR_CIF"(v_table, 'CIF_NUMBER', 'Y', 'IS_BRRW_PLGR_IND');
	
	call "MIG_VALIDATE_PLEDGOR_CIF"(v_table, 'CIF_PLEDGOR1', 'N', 'CIF_PLEDGOR1_IND');
	
	call "MIG_VALIDATE_PLEDGOR_CIF"(v_table, 'CIF_PLEDGOR2', 'N', 'CIF_PLEDGOR2_IND');
	
	call "MIG_VALIDATE_PLEDGOR_CIF"(v_table, 'CIF_PLEDGOR3', 'N', 'CIF_PLEDGOR3_IND');
	
	call "MIG_VALIDATE_PLEDGOR_CIF"(v_table, 'CIF_PLEDGOR4', 'N', 'CIF_PLEDGOR4_IND');
end
@

create procedure mig_validate_common_sec_mandatory(in v_table varchar(20))
	language sql
begin
	--------------------------------------------
	-- Validate common security mandatory fields
	--------------------------------------------
	declare v_update_ind varchar(1500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;	
	
	set v_update_ind = 'update '||v_table|| 
		' set VALID_IND = ''N'' '||
		'where CIF_NUMBER is null '||
		'or SOURCE_SECURITY_ID is null '||
		'or SECURITY_TYPE is null '||
		'or SECURITY_SUB_TYPE is null '||
		'or SECURITY_CURRENCY is null '||
		'or SECURITY_LOCATION is null '||
		'or SECURITY_ORGANISATION is null '||
		'or SECURITY_CUSTODIAN_TYPE is null '||
		'or SECURITY_CUSTODIAN_VALUE is null '||
		'or SECURITY_PERFECTION_DATE is null '||
		'or LEGAL_ENFORCEABILITY_IND is null ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table||'-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
			'|| NVL2(CIF_NUMBER, '''', '' [CIF_NUMBER] '') '||
			'|| NVL2(SOURCE_SECURITY_ID, '''', '' [SOURCE_SECURITY_ID] '') '||
			'|| NVL2(SECURITY_TYPE, '''','' [SECURITY_TYPE] '') '||
			'|| NVL2(SECURITY_SUB_TYPE, '''', '' [SECURITY_SUB_TYPE] '') '||
			'|| NVL2(SECURITY_CURRENCY, '''', '' [SECURITY_CURRENCY] '') '||
			'|| NVL2(SECURITY_LOCATION, '''', '' [SECURITY_LOCATION] '') '||
			'|| NVL2(SECURITY_ORGANISATION, '''', '' [SECURITY_ORGANISATION] '') '||
			'|| NVL2(SECURITY_CUSTODIAN_TYPE, '''', '' [SECURITY_CUSTODIAN_TYPE] '') '||
			'|| NVL2(SECURITY_CUSTODIAN_VALUE, '''', '' [SECURITY_CUSTODIAN_VALUE] '') '||
			'|| NVL2(CHAR(SECURITY_PERFECTION_DATE), '''', '' [SECURITY_PERFECTION_DATE] '') '||
			'|| NVL2(LEGAL_ENFORCEABILITY_IND, '''', '' [LEGAL_ENFORCEABILITY_IND] '') '||
			'|| '' is/are empty.'' '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' ';
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;	
	
	
	-------------------------------------------------------------------------------
	-- validate legal enforceability date is mandatory if legal enforceabiltiy = Y
	--------------------------------------------------------------------------------
	set v_update_ind = 'update '||v_table ||
		' set valid_ind = ''N''	'||
		'where valid_ind = ''Y'' '||
		'and LEGAL_ENFORCEABILITY_IND = ''Y'' '||
		'and LEGAL_ENFORCEABILITY_DATE is null ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table||'-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '''', '' [LEGAL_ENFORCEABILITY_DATE] '') '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' '||
	  		'and LEGAL_ENFORCEABILITY_IND = ''Y'' '||
	  		'and LEGAL_ENFORCEABILITY_DATE is null) ';
			
	prepare stmt2 from v_insert_ind;
	execute stmt2;				
end
@


create procedure mig_validate_charge(in v_table varchar(20))
	language sql
begin
	--------------------------------------------
	-- Validate common charge mandatory fields
	--------------------------------------------
	declare v_update_ind varchar(1500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;	
	
	set v_update_ind = 'update '||v_table|| 
		' set valid_ind = ''N'' '||
		'where valid_ind = ''Y'' '||
		'and (CHARGE_TYPE is null '||
		'or CHARGE_CURRENCY is null '||
		'or CHARGE_AMT is null '||
		'or DATE_LEGALLY_CHARGE is null) ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''MIG-''||SOURCE_ID, '''||v_table||'-''||REGION, SOURCE_SECURITY_ID, '||
		'''QC3d'', ''Mandatory Field(s): '''||
		'|| NVL2(CHARGE_TYPE, '''', '' [CHARGE_TYPE] '') '||
		'|| NVL2(CHARGE_CURRENCY, '''', '' [CHARGE_CURRENCY] '') '||
		'|| NVL2(CHAR(CHARGE_AMT), '''', '' [CHARGE_AMT] '') '||
		'|| NVL2(CHAR(DATE_LEGALLY_CHARGE), '''', '' [DATE_LEGALLY_CHARGE] '') '||
		'|| ''is/are empty.'' '||
		'FROM '||v_table||
		' WHERE valid_ind = ''N'' '||
		'and (CHARGE_TYPE is null '||
		'or CHARGE_CURRENCY is null '||
		'or CHARGE_AMT is null '||
		'or DATE_LEGALLY_CHARGE is null) ';
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;	
	
			
end
@