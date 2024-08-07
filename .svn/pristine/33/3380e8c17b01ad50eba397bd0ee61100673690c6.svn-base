drop procedure mig_setvalue_fee_details_id@
drop procedure mig_setvalue_GT@
drop procedure mig_setvalue_val_GT@
drop procedure mig_setvalue_pledgor_GT@

create procedure mig_setvalue_fee_details_id(in v_table varchar(20))
	language sql
begin
	-------------------------------------------------------
	-- assign cms_collateral_id for valid security record 
	-------------------------------------------------------
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	set v_update_sql = 'update '||v_table ||
		' set FEE_DETAILS_ID = '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR FEE_DETAILS_SEQ), 2)) as BIGINT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_GT
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_GT');
	
	call "MIG_SETVALUE_FEE_DETAILS_ID"('MIG_GT');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_GT');
end
@

create procedure mig_setvalue_val_GT
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_GT');
end
@

create procedure mig_setvalue_pledgor_GT
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_GT');
end
@