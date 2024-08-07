drop procedure mig_setvalue_MS@
drop procedure mig_setvalue_val_MS@
drop procedure mig_setvalue_charge_MS@
drop procedure mig_setvalue_pledgor_MS@
drop procedure mig_setvalue_portfolio_id@

create procedure mig_setvalue_portfolio_id
	language sql
begin
	-------------------------------------------------------
	-- assign cms_collateral_id for valid security record 
	-------------------------------------------------------
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	set v_update_sql = 'update MIG_MS ' ||
		'set item_id = '||
		'CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR MARKETABLE_EQUITY_SEQ), 2)) as BIGINT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;	

end
@

create procedure mig_setvalue_MS
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_MS');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_MS');
	
	call "MIG_SETVALUE_PORTFOLIO_ID";
end
@

create procedure mig_setvalue_val_MS
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_MS');
end
@

create procedure mig_setvalue_charge_MS
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_MS','NAT_OF_CHARGE_MARKSEC', 'N');
end
@

create procedure mig_setvalue_pledgor_MS
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_MS');
end
@
