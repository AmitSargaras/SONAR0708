drop procedure mig_setvalue_AB111@
drop procedure mig_setvalue_val_AB111@
drop procedure mig_setvalue_pledgor_AB111@
drop procedure mig_setvalue_charge_AB111@

create procedure mig_setvalue_AB111 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB111');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB111');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB111');

end
@

create procedure mig_setvalue_val_AB111
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB111');
end
@

create procedure mig_setvalue_charge_AB111
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB111', 'NAT_OF_CHARGE_ASSETAIRCRAFT', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB111
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB111');
end
@
