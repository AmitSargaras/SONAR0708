drop procedure MIG_VALIDATE_AB100@
drop procedure MIG_VALIDATE_CHARGE_AB100@
drop procedure MIG_VALIDATE_PLEDGOR_AB100@

CREATE PROCEDURE MIG_VALIDATE_AB100
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_AB100');
	
	--------------------------------------------------------------
	-- Validate the validity of security subtype given
	---------------------------------------------------------------
	call "MIG_VALIDATE_SECURITY_SUBTYPE"('MIG_AB100');
	
	-------------------------------------------------------------------
	-- Validate the validity of the physical inspection date
	--------------------------------------------------------------------
	call "MIG_VALIDATE_PHY_INSP"('MIG_AB100');	

	-------------------------------------------------------------------------------
	-- Validate the validity of the security confirmed env risky date
	-------------------------------------------------------------------------------	
	call "MIG_VALIDATE_SEC_ENV"('MIG_AB100');
END
@

create procedure MIG_VALIDATE_CHARGE_AB100
	LANGUAGE SQL
BEGIN

	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_AB100', 'MIG_AB100');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_AB100');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_RANK_LINKAGE"('MIG_CHARGE_AB100');
	
	call "MIG_INVALID_CHARGE_RANK"('MIG_CHARGE_AB100');
	
	call "MIG_VALIDATE_CHARGE"('MIG_CHARGE_AB100');
	
END 
@

create procedure MIG_VALIDATE_PLEDGOR_AB100
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_AB100');
end
@
