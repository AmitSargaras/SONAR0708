drop procedure setDCRegion@
drop procedure setValuationType@
drop procedure dc_validate_collateral@
drop procedure dc_validate_legal@
drop procedure get_custodian_type_code@
drop procedure dc_setvalue_common_sec@
drop function get_common_code_entry_code@

create procedure setDCRegion(v_table varchar(20), v_region varchar(20))
	language sql
begin
	declare v_sql varchar(200);
	declare v_stmt statement;
	
	set v_sql = 'update '||v_table||' set region = '''||v_region||''''||
		' where region = ''NA''';
		
	prepare v_stmt from v_sql;
	execute v_stmt;
end
@


create procedure setValuationType(v_table varchar(20))
	language sql
begin

	declare v_sql varchar(200);
	declare v_stmt statement;
	--------------------------------------
	-- set value for valuation type
	--------------------------------------
	set v_update_sql = 'update '|| v_table || 
		' set VALUATION_TYPE = substr(VALUATION_TYPE_DESC, 1, 1) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	
	
end
@

create procedure dc_validate_collateral (in v_table varchar(20))
	language sql
begin
	--------------------------------------------------------------
	-- Validate the validity of collateral id given
	---------------------------------------------------------------
	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'UPDATE ' || v_table ||' a '|| 
		' set a.valid_ind = ''N'' '||
		'where not exists (select ''1'' from cms_security b where char(b.cms_collateral_id) = ltrim(rtrim(a.cms_collateral_id)))';
		
	set v_insert_ind = 'INSERT INTO dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(SELECT CURRENT_TIMESTAMP, ''DC-ARBS'', '''|| v_table ||
		'-''||REGION, cms_collateral_id, ''QC3h'', '||
		'''Collateral Mismatch: Given [''|| CMS_COLLATERAL_ID || ''] '||
		' FROM '|| v_table ||' WHERE valid_ind = ''N'' '||
		'and not exists (select ''1'' from cms_security b where char(b.cms_collateral_id) = ltrim(rtrim(a.cms_collateral_id)))';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@

create procedure dc_validate_legal (in v_table varchar(20))
	language sql
begin
	--------------------------------------------------------------
	-- Validate the validity of collateral id given
	---------------------------------------------------------------
	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;	
	-------------------------------------------------------------------------------
	-- validate legal enforceability date is mandatory if legal enforceabiltiy = Y
	--------------------------------------------------------------------------------
	set v_update_ind = 'update '||v_table ||
		' set valid_ind = ''N''	'||
		'where valid_ind = ''Y'' '||
		'and LEGAL_ENFORCEABILITY_IND = ''Y'' '||
		'and LEGAL_ENFORCEABILITY_DATE is null ';
	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''DC-ARBS'', '''||v_table||'-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '''', '' [LEGAL_ENFORCEABILITY_DATE] '') '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' '||
	  		'and LEGAL_ENFORCEABILITY_IND = ''Y'' '||
	  		'and LEGAL_ENFORCEABILITY_DATE is null) ';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;					
	
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

create procedure dc_setvalue_common_sec (in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(300);
	declare v_update_stmt statement;
	
	--------------------------------------
	-- set value for custodian type
	--------------------------------------
	set v_update_sql = 'update '|| v_table || 
		' set CUSTODIAN_TYPE_CODE = get_custodian_type_code(SECURITY_CUSTODIAN_TYPE) '||
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