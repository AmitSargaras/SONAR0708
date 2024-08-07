drop procedure MIG_VALIDATE_CL@
drop procedure MIG_VALIDATE_CHARGE_CL@

create procedure MIG_VALIDATE_CL
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_CL');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_CL');

END
@

create procedure MIG_VALIDATE_CHARGE_CL
	LANGUAGE SQL
BEGIN
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_CL', 'MIG_CL');
	
END 
@
