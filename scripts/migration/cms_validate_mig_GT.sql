drop procedure MIG_VALIDATE_GT@
drop procedure MIG_VALIDATE_CHARGE_GT@
drop procedure MIG_VALIDATE_PLEDGOR_GT@
drop procedure MIG_VALIDATE_GT_SEC@


create procedure MIG_VALIDATE_GT_SEC
	LANGUAGE SQL
BEGIN
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	--------------------------------------------
	-- validate rest of the mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_GT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (GUARANTEE_AMT is null ' ||
		'or GUARANTEE_DATE is null '||
		'or SCHEME is null '||
		'or GUARANTEE_FEE_AMT is null '||
		'or EXPIRATION_DATE is null) ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_GT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(CHAR(GUARANTEE_AMT), '''', '' [GUARANTEE_AMT] '') '||
			'|| NVL2(CHAR(GUARANTEE_DATE), '''', '' [GUARANTEE_DATE] '') '||
			'|| NVL2(SCHEME, '''', '' [SCHEME] '') '||
			'|| NVL2(CHAR(GUARANTEE_FEE_AMT), '''', '' [GUARANTEE_FEE_AMT] '') '||
			'|| NVL2(CHAR(EXPIRATION_DATE), '''', '' [EXPIRATION_DATE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_GT ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and (GUARANTEE_AMT is null ' ||
			'or GUARANTEE_DATE is null '||
			'or SCHEME is null '||
			'or GUARANTEE_FEE_AMT is null '||
			'or EXPIRATION_DATE is null)) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;

				
END
@


create procedure MIG_VALIDATE_GT
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_GT');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_GT');

	--For CGC Only
	--call "MIG_VALIDATE_GT_SEC";

END
@

create procedure MIG_VALIDATE_CHARGE_GT
	LANGUAGE SQL
BEGIN

	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_GT', 'MIG_GT');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_GT');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_GT');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_GT');
	
	--------------------------------------------
	-- validate charge mandatory fields
	--------------------------------------------
	call "MIG_VALIDATE_CHARGE"('MIG_CHARGE_GT');
END 
@

create procedure MIG_VALIDATE_PLEDGOR_GT
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_GT');
end
@