drop procedure mig_setvalue_AB103@
drop procedure mig_setvalue_val_AB103@
drop procedure mig_setvalue_charge_AB103@
drop procedure mig_setvalue_pledgor_AB103@

create procedure mig_setvalue_AB103 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB103');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB103');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB103');

end
@

create procedure mig_setvalue_val_AB103
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB103');
end
@

create procedure mig_setvalue_charge_AB103
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB103', 'NAT_OF_CHARGE_ASSETSPECOTHER', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB103
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB103');
end
@
