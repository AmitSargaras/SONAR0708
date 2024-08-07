drop procedure mig_setvalue_AB102@
drop procedure mig_setvalue_val_AB102@
drop procedure mig_setvalue_charge_AB102@
drop procedure mig_setvalue_pledgor_AB102@

create procedure mig_setvalue_AB102 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB102');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB102');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB102');

end
@

create procedure mig_setvalue_val_AB102
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB102');
end
@

create procedure mig_setvalue_charge_AB102
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB102', 'NAT_OF_CHARGE_ASSETSPECVEHICLES', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB102
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB102');
end
@