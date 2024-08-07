drop procedure mig_setvalue_AB100@
drop procedure mig_setvalue_val_AB100@
drop procedure mig_setvalue_charge_AB100@
drop procedure mig_setvalue_pledgor_AB100@

create procedure mig_setvalue_AB100 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB100');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB100');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB100');

end
@

create procedure mig_setvalue_val_AB100
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB100');
end
@

create procedure mig_setvalue_charge_AB100
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB100', 'NAT_OF_CHARGE_ASSETGENCHARGE', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB100
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB100');
end
@