drop procedure mig_setvalue_PT@
drop procedure mig_setvalue_val_PT@
drop procedure mig_setvalue_charge_PT@
drop procedure mig_setvalue_pledgor_PT@

create procedure mig_setvalue_PT
	language SQL
begin
	call "MIG_SETVALUE_COL_ID"('MIG_PT');
		
	call "MIG_SETVALUE_COMMON_SEC"('MIG_PT');
end
@

create procedure mig_setvalue_val_PT
	language SQL
begin
	call "MIG_SETVALUE_COMMON_VAL"('MIG_VAL_PT');
end
@

create procedure mig_setvalue_charge_PT
	language SQL
begin
	call "MIG_SETVALUE_CHARGE"('MIG_CHARGE_PT','NAT_OF_CHARGE_PROP', 'N');
end
@

create procedure mig_setvalue_pledgor_PT
	language SQL
begin
	call "MIG_SETVALUE_PLEDGOR"('MIG_PLEDGOR_PT');
end
@