drop procedure mig_setvalue_DC@
drop procedure mig_setvalue_val_DC@
drop procedure mig_setvalue_charge_DC@
drop procedure mig_setvalue_pledgor_DC@
drop procedure mig_setvalue_DEED_Code@

create procedure mig_setvalue_DEED_Code (in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	-------------------------------------------
	-- set value for deed code
	-------------------------------------------
	set v_update_sql = 'update '|| v_table||
		' set TYPE_DEED_ASSN_CODE = get_common_code_entry_code(''DEED_ASSIGNMT_TYPE'', TYPE_OF_DEED_ASSIGNMENT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;
end
@

create procedure mig_setvalue_DC
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_DC');
	
	call "MIG_SETVALUE_COMMON_SEC"('MIG_DC');
	
	call "MIG_SETVALUE_DEED_CODE"('MIG_DC');
end
@

create procedure mig_setvalue_val_DC
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_DC');
end
@

--create procedure mig_setvalue_charge_DC
--	language SQL
--begin
--	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_DC','NAT_OF_CHARGE_CASH', 'N');
--end
--@

create procedure mig_setvalue_pledgor_DC
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_DC');
end
@
