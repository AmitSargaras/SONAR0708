drop procedure mig_setvalue_CL@
drop procedure mig_setvalue_charge_CL@

create procedure mig_setvalue_CL
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_CL');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_CL');
end
@

create procedure mig_setvalue_charge_CL
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_CL','NAT_OF_CHARGE_CASH', 'N');
end
@