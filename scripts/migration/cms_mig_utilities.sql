drop function get_custodian_type_code@
drop function get_common_code_entry_code@
drop procedure mig_setvalue_common_sec@
drop procedure mig_setvalue_phy_inspec_uom@
drop procedure mig_setvalue_common_val@
drop procedure mig_setvalue_sec_subtype@
drop procedure setSourceAndRegion@
drop procedure mig_setvalue_charge_type@
drop procedure mig_setvalue_nature_charge@
drop procedure mig_setvalue_charge_id@
drop procedure mig_setvalue_charge_dtl_id@
drop procedure mig_setvalue_charge_lmt_id@
drop procedure mig_setvalue_charge@
drop procedure mig_setvalue_col_id@
drop procedure mig_setvalue_pledgor_pledgor@
drop procedure mig_setvalue_pledgor_borrower@
drop procedure mig_setvalue_pledgor@
drop procedure mig_setvalue_valuation@

create procedure setSourceAndRegion(v_table varchar(20), v_source varchar(10), v_region varchar(20))
	language sql
begin
	declare v_sql varchar(200);
	declare v_stmt statement;
	
	set v_sql = 'update '||v_table||' set source_id = '''||v_source||''', region = '''||v_region||''''||
		' where source_id is null and region = ''NA''';
		
	prepare v_stmt from v_sql;
	execute v_stmt;		
end
@

CREATE FUNCTION get_custodian_type_code(v_desc varchar(10))
    RETURNS char
BEGIN ATOMIC

	if (v_desc = 'Internal')
		then return 'I';
	else
		return 'E';
	end if;
END
@

CREATE FUNCTION get_common_code_entry_code
	(v_category_code varchar(40), v_entry_name varchar(40))
    RETURNS varchar(40)
BEGIN ATOMIC

	declare v_entry_code varchar(40);
	
	set v_entry_code = 
		(select entry_code
		from common_code_category_entry
		where category_code = v_category_code
		and entry_name = v_entry_name);
		
	return v_entry_code;
end
@

create procedure mig_setvalue_common_sec (in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(250);
	
	declare v_update_stmt statement;
	
	--------------------------------------
	-- set value for custodian type
	--------------------------------------
	set v_update_sql = 'update '|| v_table || 
		' set CUSTODIAN_TYPE_CODE = get_custodian_type_code(SECURITY_CUSTODIAN_TYPE) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;
	
	-------------------------------
	-- set value for organisation
	-------------------------------
	set v_update_sql = 'update '|| v_table ||
		' set SECURITY_ORGANISATION_CODE = substr(SECURITY_ORGANISATION, 1, 3) '||
		'where valid_ind = ''Y''';
	
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;
	
	---------------------------------------------------------------------
	-- set value for custodian value if it is type = Internal
	
	----------------------------------------------------------------------
	set v_update_sql = 'update '|| v_table ||
		' set CUSTODIAN_VALUE_CODE = substr(SECURITY_CUSTODIAN_VALUE, 1, 3) '||
		'where valid_ind = ''Y'' and CUSTODIAN_TYPE_CODE = ''I''';
	
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
end
@

create procedure mig_setvalue_phy_inspec_uom (in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	-------------------------------------------
	-- set value for phy inspection UOM
	-------------------------------------------
	set v_update_sql = 'update '|| v_table||
		' set PHY_INSPECTION_FREQ_UOM_CODE = get_common_code_entry_code(''FREQ_TYPE'', PHYSICAL_INSPECTION_FREQ_UOM) '||
		'where valid_ind = ''Y''';

	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
end
@

create procedure mig_setvalue_common_val(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(500);
	
	declare v_update_stmt statement;

	-----------------------------------
	-- set value for valuation_id
	-----------------------	------------
	set	v_update_sql = 'update '||v_table ||
		' set valuation_id = '||
		' CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR VALUATION_SEQ), 2)) as BIGINT) '||
		' where valid_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	

	-----------------------------------
	-- set value for valuation_stg_id
	-----------------------	------------
	set	v_update_sql = 'update '||v_table ||
		' set valuation_stg_id = '||
		' CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR VALUATION_SEQ), 2)) as BIGINT) '||
		' where valid_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
	
	------------------------
	-- set value for valuer
	-----------------------
	set v_update_sql = 'update '|| v_table ||
		' set valuer_code = get_common_code_entry_code(''VALUER'', VALUER) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;		
end
@

create procedure mig_setvalue_sec_subtype(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	--------------------------------------
	-- set value for security subtype id
	--------------------------------------
	set v_update_sql = 'update '|| v_table ||
		' set SECURITY_SUB_TYPE_ID = substr(SECURITY_SUB_TYPE, 1, 5) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;		
end
@

create procedure mig_setvalue_charge_type(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	-------------------------------------
	-- set value for charge type
	-------------------------------------
	set v_update_sql = 'update '|| v_table ||
		' set charge_type_code = get_common_code_entry_code(''CHARGE_TYPE'', CHARGE_TYPE) '||
		'where valid_ind = ''Y'' and valid_charge_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_nature_charge(in v_table varchar(20), in v_nature_charge_type varchar(30))
	language sql
begin
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	-------------------------------------
	-- set value for charge type
	-------------------------------------
	set v_update_sql = 'update '|| v_table ||
		' set nature_of_charge_code = get_common_code_entry_code('''||v_nature_charge_type||''', NATURE_OF_CHARGE) '||
		'where valid_ind = ''Y'' and valid_charge_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_charge_id(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(500);
	declare v_update_stmt statement;
	
	set	v_update_sql = 'update '||v_table ||
		' set (cms_act_charge_id, cms_stg_charge_id) = '||
		'(CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_LIMIT_SECURITY_MAP_SEQ), 2)) as BIGINT), '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_LIMIT_SECURITY_MAP_SEQ), 2)) as BIGINT)) '||
		'where valid_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
			
end
@

create procedure mig_setvalue_charge_dtl_id(in v_table varchar(20), in has_security_rank char(1))
	language sql
begin
	--------------------------
	-- set charge detail id
	--------------------------
	declare v_update_sql varchar(500);
	declare v_sub_sql varchar(250);
	
	declare v_update_stmt statement;
	
	set v_update_sql = 'update '||v_table||
		' set (cms_act_dtl_id, cms_stg_dtl_id) = '||
		'(CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT), '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT)) '||
		'where valid_ind = ''Y'' and valid_charge_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
	
	-------------------------------------------------
	-- set charge id for valid_charge_ind = N
	-- this is used when insert limit charge map
	-------------------------------------------------
	if (has_security_rank = 'Y') then
		set v_sub_sql = 'select b.cms_act_dtl_id, b.cms_stg_dtl_id '||
		'from '||v_table|| ' b '||
		'where a.region = b.region '||
		'and a.source_security_id = b.source_security_id '||
		'and a.SECURITY_RANKING = b.SECURITY_RANKING '||
		'and b.valid_ind = ''Y'' '||
		'and b.valid_charge_ind = ''Y''';
	else
		set v_sub_sql = 'select b.cms_act_charge_id, cms_stg_charge_id '||
		'from '||v_table|| ' b '||
		'where a.region = b.region '||
		'and a.source_security_id = b.source_security_id '||
		'and b.valid_ind = ''Y'' '||
		'and b.valid_charge_ind = ''Y''';	
	end if;
	
	set v_update_sql = 'update '||v_table || ' a '||
		'set (cms_act_charge_id, cms_stg_charge_id) = ('||v_sub_sql||') '||
		'where valid_ind = ''Y'' '||
		'and valid_charge_ind = ''N'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
end
@

create procedure mig_setvalue_charge_lmt_id(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(1000);
	declare v_update_stmt statement;
	
	set v_update_sql = 'update '||v_table || ' a '||
		'set (cms_act_lmt_id, cms_act_lmt_profile_id) = '||
		'(select cms_lsp_appr_lmts_id, cms_limit_profile_id from sci_lsp_appr_lmts lmt'||
		' where lmt_id = SOURCE_LIMIT_ID '||
		' and lmt.source_id = a.source_id) '||
		'where valid_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_charge(in v_table varchar(20), in v_nature_charge_type varchar(30), in has_security_rank char(1))
	language sql
begin
	-------------------------------
	-- set value for charge
	-------------------------------
	call "MIG_SETVALUE_CHARGE_TYPE"(v_table);
	
	call "MIG_SETVALUE_NATURE_CHARGE"(v_table, v_nature_charge_type);	
	
	call "MIG_SETVALUE_CHARGE_ID"(v_table);
	
	call "MIG_SETVALUE_CHARGE_DTL_ID"(v_table, has_security_rank);
	
	call "MIG_SETVALUE_CHARGE_LMT_ID"(v_table);
end
@

create procedure mig_setvalue_col_id(in v_table varchar(20))
	language sql
begin
	-------------------------------------------------------
	-- assign cms_collateral_id for valid security record 
	-------------------------------------------------------
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	set v_update_sql = 'update '||v_table ||
		' set cms_collateral_id = '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	

	-------------------------------------------------------
	-- assign cms_collateral_stg_id for valid security record 
	-------------------------------------------------------
	set v_update_sql = 'update '||v_table ||
		' set cms_collateral_stg_id = '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
end
@

create procedure mig_setvalue_pledgor_pledgor(
	in v_table varchar(20), 
	in v_pledgor_id_col varchar(20),
	in v_pledgor varchar(20), 
	in v_pledgor_ind varchar(20))
	language sql
begin
	declare v_update_sql varchar(1000);
	declare v_update_stmt statement; 
	
	set v_update_sql = 'update '|| v_table ||
		' set '||v_pledgor_id_col||' = (select cms_pledgor_dtl_id from sci_pledgor_dtl '||
		' where plg_le_id_src_value = ''ARBS'' '||
		' and plg_le_id = '||v_pledgor||' )' ||
		'where '||v_pledgor_ind||' = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_pledgor_borrower(in v_table varchar(20))
	language sql
begin
	-------------------------------------------
	-- set pledgor id for valid pledgor records
	-------------------------------------------
	declare v_update_sql varchar(1000);
	declare v_update_stmt statement;
	
	----------------------------------------------------------
	-- set the pledgor id that already exists in pledgor table
	----------------------------------------------------------
	set v_update_sql = 'update '||v_table ||
		' set cms_pledgor_id = (select cms_pledgor_dtl_id from sci_pledgor_dtl '||
		' where plg_le_id_src_value = ''ARBS'' '||
		' and plg_le_id = CIF_NUMBER )' ||
		' where IS_BORROWER_PLEDGOR = ''Y'' and IS_BRRW_PLGR_IND = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
				
end
@

create procedure mig_setvalue_pledgor(in v_table varchar(20))
	language sql
begin
	call "MIG_SETVALUE_PLEDGOR_BORROWER"(v_table);
	
	call "MIG_SETVALUE_PLEDGOR_PLEDGOR"(v_table, 'CMS_PLEDGOR1_ID', 'CIF_PLEDGOR1', 'CIF_PLEDGOR1_IND');

	call "MIG_SETVALUE_PLEDGOR_PLEDGOR"(v_table, 'CMS_PLEDGOR2_ID', 'CIF_PLEDGOR2', 'CIF_PLEDGOR2_IND');

	call "MIG_SETVALUE_PLEDGOR_PLEDGOR"(v_table, 'CMS_PLEDGOR3_ID', 'CIF_PLEDGOR3', 'CIF_PLEDGOR3_IND');
	
	call "MIG_SETVALUE_PLEDGOR_PLEDGOR"(v_table, 'CMS_PLEDGOR4_ID', 'CIF_PLEDGOR4', 'CIF_PLEDGOR4_IND');
end
@

create procedure mig_setvalue_valuation(in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(500);
	declare v_update_stmt statement;

	---------------------------------
	-- set value for valuer code
	----------------------------------	
	set	v_update_sql = 'update '||v_table ||
		' set valuation_id = '||
		' CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR VALUATION_SEQ), 2)) as BIGINT) '||
		' where valid_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	

	set	v_update_sql = 'update '||v_table ||
		' set valuation_stg_id = '||
		' CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR VALUATION_SEQ), 2)) as BIGINT) '||
		' where valid_ind = ''Y'' ';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
	
	---------------------------------
	-- set value for valuer code
	----------------------------------
	set v_update_sql = 'update '|| v_table ||
		' set VALUER_CODE = get_common_code_entry_code(''VALUER'', VALUER) '||
		'where valid_ind = ''Y''';
	
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
end
@