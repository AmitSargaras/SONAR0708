drop procedure mig_setvalue_AB110@
drop procedure mig_setvalue_val_AB110@
drop procedure mig_setvalue_charge_AB110@
drop procedure mig_setvalue_pledgor_AB110@

create procedure mig_setvalue_AB110 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB110');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB110');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB110');

end
@

create procedure mig_setvalue_val_AB110
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB110');
end
@

create procedure mig_setvalue_charge_AB110
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB110', 'NAT_OF_CHARGE_ASSETGENCHARGE', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB110
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB110');
end
@