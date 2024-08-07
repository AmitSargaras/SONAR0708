drop procedure mig_setvalue_cash_dep_id@
drop procedure mig_setvalue_CS@
drop procedure mig_setvalue_val_CS@
drop procedure mig_setvalue_charge_CS@
drop procedure mig_setvalue_pledgor_CS@

create procedure mig_setvalue_cash_dep_id(in v_table varchar(20))
	language sql
begin
	-------------------------------------------------------
	-- assign cms_collateral_id for valid security record 
	-------------------------------------------------------
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	set v_update_sql = 'update '||v_table ||
		' set cash_deposit_id = '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;			
end
@

create procedure mig_setvalue_CS 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_CS');
	
	call "MIG_SETVALUE_CASH_DEP_ID"('MIG_CS');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_CS');
end
@

create procedure mig_setvalue_val_CS
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_CS');
end
@

create procedure mig_setvalue_charge_CS
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_CS','NAT_OF_CHARGE_CASH', 'N');
end
@

create procedure mig_setvalue_pledgor_CS
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_CS');
end
@
