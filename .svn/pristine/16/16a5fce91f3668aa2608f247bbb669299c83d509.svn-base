drop procedure mig_setvalue_AB101@
drop procedure mig_setvalue_val_AB101@
drop procedure mig_setvalue_charge_AB101@
drop procedure mig_setvalue_pledgor_AB101@

create procedure mig_setvalue_AB101 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB101');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB101');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB101');

end
@

create procedure mig_setvalue_val_AB101
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB101');
end
@

create procedure mig_setvalue_charge_AB101
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB101', 'NAT_OF_CHARGE_ASSETSPECPLANT', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB101
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB101');
end
@
