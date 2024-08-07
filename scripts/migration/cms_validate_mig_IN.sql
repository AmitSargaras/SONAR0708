drop procedure MIG_VALIDATE_IN@
drop procedure MIG_VALIDATE_CHARGE_IN@
drop procedure MIG_VALIDATE_PLEDGOR_IN@

create procedure MIG_VALIDATE_IN
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_IN');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_IN');

END
@

create procedure MIG_VALIDATE_CHARGE_IN
	LANGUAGE SQL
BEGIN
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_IN', 'MIG_IN');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_IN');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_IN');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_IN');

END 
@

create procedure MIG_VALIDATE_PLEDGOR_IN
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_IN');
end
@