drop procedure mig_setvalue_OT@
drop procedure mig_setvalue_val_OT@
drop procedure mig_setvalue_charge_OT@
drop procedure mig_setvalue_pledgor_OT@

create procedure mig_setvalue_OT
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_OT');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_OT');
end
@

create procedure mig_setvalue_val_OT
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_OT');
end
@

create procedure mig_setvalue_charge_OT
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_OT','NAT_OF_CHARGE_OTH', 'N');
end
@

create procedure mig_setvalue_pledgor_OT
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_OT');
end
@
