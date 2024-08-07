drop procedure MIG_VALIDATE_OT_SEC@
drop procedure MIG_VALIDATE_OT@
drop procedure MIG_VALIDATE_CHARGE_OT@
drop procedure MIG_VALIDATE_PLEDGOR_OT@

create procedure MIG_VALIDATE_OT_SEC
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate legal enforceability fields
	----------------------------------
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	--------------------------------------------
	-- validate last physical inspection date fields
	--------------------------------------------
	set v_update_ind = 'update MIG_OT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and PHYSICAL_INSPECTION_IND = ''Y'' '||
		'and LAST_PHYSICAL_INSPECTION_DATE is null';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_OT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(char(LAST_PHYSICAL_INSPECTION_DATE), '''', '' [LAST_PHYSICAL_INSPECTION_DATE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_OT ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and PHYSICAL_INSPECTION_IND = ''Y'' '||
			'and LAST_PHYSICAL_INSPECTION_DATE is null)';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	--------------------------------------------
	-- validate last physical inspection date fields
	--------------------------------------------
	set v_update_ind = 'update MIG_OT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and SEC_ENVIRONMENTAL_RISKY_IND = ''Y'' '||
		'and DATE_SEC_CONFIRM_ENV_RISKY is null';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_OT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(char(DATE_SEC_CONFIRM_ENV_RISKY), '''', '' [DATE_SEC_CONFIRM_ENV_RISKY] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_OT ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and SEC_ENVIRONMENTAL_RISKY_IND = ''Y'' '||
			'and DATE_SEC_CONFIRM_ENV_RISKY is null)';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
END
@

create procedure MIG_VALIDATE_OT
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_OT');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_OT');
	
	call "MIG_VALIDATE_OT_SEC";

END
@

create procedure MIG_VALIDATE_CHARGE_OT
	LANGUAGE SQL
BEGIN

	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_OT', 'MIG_OT');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_OT');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_OT');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_OT');
	
	--------------------------------------------
	-- validate charge mandatory fields
	--------------------------------------------
	call "MIG_VALIDATE_CHARGE"('MIG_CHARGE_OT');

END 
@

create procedure MIG_VALIDATE_PLEDGOR_OT
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_OT');
end
@