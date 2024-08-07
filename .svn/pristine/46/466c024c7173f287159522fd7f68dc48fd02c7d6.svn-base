drop procedure MIG_VALIDATE_MS_SEC@
drop procedure MIG_VALIDATE_MS@
drop procedure MIG_VALIDATE_CHARGE_MS@
drop procedure MIG_VALIDATE_PLEDGOR_MS@

create procedure MIG_VALIDATE_MS_SEC
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate Deposit related fields
	----------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	--------------------------------------------
	-- validate equity type mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_MS '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and EQUITY_TYPE is null';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_MS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(EQUITY_TYPE, '' [EQUITY_TYPE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_MS ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and (EQUITY_TYPE is null)) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
		--------------------------------------------
	-- validate equity type mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_MS '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and UNITS is null';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_MS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(UNITS, '' [UNITS] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_MS ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and (UNITS is null)) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
END
@

create procedure MIG_VALIDATE_MS
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_MS');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_MS');
	
	call "MIG_VALIDATE_MS_SEC";

END
@

create procedure MIG_VALIDATE_CHARGE_MS
	LANGUAGE SQL
BEGIN
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_MS', 'MIG_MS');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_MS');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_MS');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_MS');

END 
@

create procedure MIG_VALIDATE_PLEDGOR_MS
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_MS');
end
@