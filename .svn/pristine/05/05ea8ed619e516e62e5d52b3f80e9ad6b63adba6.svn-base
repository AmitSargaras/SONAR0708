drop procedure mig_setvalue_AB109@
drop procedure mig_setvalue_val_AB109@
drop procedure mig_setvalue_charge_AB109@
drop procedure mig_setvalue_pledgor_AB109@

create procedure mig_setvalue_AB109 
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_AB109');

	call "MIG_SETVALUE_COMMON_SEC"('MIG_AB109');
	
	call "MIG_SETVALUE_PHY_INSPEC_UOM"('MIG_AB109');

end
@

create procedure mig_setvalue_val_AB109
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_AB109');
end
@

create procedure mig_setvalue_charge_AB109
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_AB109', 'NAT_OF_CHARGE_ASSETAIRCRAFT', 'Y');
end
@

create procedure mig_setvalue_pledgor_AB109
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_AB109');
end
@