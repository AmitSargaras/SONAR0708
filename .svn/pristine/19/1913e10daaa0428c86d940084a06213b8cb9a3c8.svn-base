drop procedure mig_setvalue_IN@
drop procedure mig_setvalue_val_IN@
drop procedure mig_setvalue_charge_IN@
drop procedure mig_setvalue_CDS_id@

create procedure mig_setvalue_CDS_id (in v_table varchar(20))
	language sql
begin
	-------------------------------------------------------
	-- assign cms_cds_id for valid security record 
	-------------------------------------------------------
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	set v_update_sql = 'update '|| v_table ||
		' set cds_id = '||
		'SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR cds_seq), 2)) as BIGINT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_IN
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_IN');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_IN');
	
	call "MIG_SETVALUE_CDS_ID"('MIG_IN');
end
@

create procedure mig_setvalue_val_IN
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_IN');
end
@

create procedure mig_setvalue_charge_IN
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_IN','NAT_OF_CHARGE_INS', 'N');
end
@
