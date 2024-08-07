drop procedure MIG_VALIDATE_CS_SEC@
drop procedure MIG_VALIDATE_CS@
drop procedure MIG_VALIDATE_CHARGE_CS@
drop procedure MIG_VALIDATE_PLEDGOR_CS@

create procedure MIG_VALIDATE_CS_SEC
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
	-- validate source limit id
	--------------------------------------------
	set v_update_ind = 'update MIG_CS '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and SOURCE_LIMIT_ID is null ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_CS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(SOURCE_LIMIT_ID, '''', '' [SOURCE_LIMIT_ID] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_CS ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and SOURCE_LIMIT_ID is null ) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	--------------------------------------------
	-- validate common deposit mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_CS '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (INTEREST_CAPITALISATION is null '||
		'or FD_ACCT_NUMBER is null )';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_CS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(INTEREST_CAPITALISATION, '''', '' [INTEREST_CAPITALISATION] '') '||
			'|| NVL2(FD_ACCT_NUMBER, '''', '' [FD_ACCT_NUMBER] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_CS ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and (INTEREST_CAPITALISATION is null '||
	  		'or FD_ACCT_NUMBER is null )) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;

	---------------------------------------------------
	-- validate for third party bank - Cash and FD only
	---------------------------------------------------
	set	v_update_ind = 'update MIG_CS ' ||
		'set valid_ind = ''N'' '||
		'where valid_ind = ''Y'' '||
		'and security_sub_type_id in (''CS200'', ''CS202'') '||
		'and THIRD_PARTY_BANK is null ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_CS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(THIRD_PARTY_BANK, '' [THIRD_PARTY_BANK] '') '||		
			'|| ''is/are empty. '' '||
			'FROM MIG_CS '||
	  		' WHERE valid_ind = ''N'' '||
			'and security_sub_type_id in (''CS200'', ''CS202'') '||
			'and THIRD_PARTY_BANK is null )';
			
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	----------------------------
	-- validate for FD mandatory
	----------------------------
	set v_update_ind = 'update MIG_CS '||
		'set valid_ind = ''N'' '||
		'where valid_ind = ''Y'' '||
		'and security_sub_type_id = ''CS202'' '||
		'and (DEPOSIT_REF_NO is null '||
		'or SECURITY_DEPOSIT is null) ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_CS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): '' ' ||
			'|| SI_BVL(DEPOSIT_REF_NO, '' [DEPOSIT_REF_NO] '') '||
			'|| SI_BVL(SECURITY_DEPOSIT, '' [SECURITY_DEPOSIT] '') '||					
			'|| ''is/are empty. '' '||
			'FROM MIG_CS '||
	  		' WHERE valid_ind = ''N'' '||
			'and security_sub_type_id = ''CS202'' '||
			'and (DEPOSIT_REF_NO is null or SECURITY_DEPOSIT is null))';
			
	prepare stmt2 from v_insert_ind;
	execute stmt2;		
	
	--------------------------------------------------
	-- Validate for FD and third party bank mandatory
	--------------------------------------------------
	set v_update_ind = 'update MIG_CS '||
		'set valid_ind = ''N'' '||
		'where valid_ind = ''Y'' '||
		'and security_sub_type_id = ''CS202'' '||
		'and THIRD_PARTY_BANK = ''Y'' '||
		'and (DEPOSIT_AMT_CCY is null '||
		'or DEPOSIT_AMT is null '||
		'or DEPOSIT_MATURITY_DATE is null )';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_CS-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(DEPOSIT_AMT_CCY, '' [DEPOSIT_AMT_CCY] '') '||
			'|| SI_BVL(char(DEPOSIT_AMT), '' [DEPOSIT_AMT] '') '||			
			'|| SI_BVL(char(DEPOSIT_MATURITY_DATE), '' [DEPOSIT_MATURITY_DATE] '') '||										
			'|| ''is/are empty.'' '||
			'FROM MIG_CS ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and security_sub_type_id = ''CS202'' '||
			'and THIRD_PARTY_BANK = ''Y'' '||
			'and (DEPOSIT_AMT_CCY is null '||
			'or DEPOSIT_AMT is null '||
			'or DEPOSIT_MATURITY_DATE is null ))';
			
	prepare stmt2 from v_insert_ind;
	execute stmt2;				
END
@

create procedure MIG_VALIDATE_CS
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_CS');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_CS');

	call "MIG_VALIDATE_CS_SEC";

END
@

create procedure MIG_VALIDATE_CHARGE_CS
	LANGUAGE SQL
BEGIN

	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_CS', 'MIG_CS');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_CS');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_CS');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_CS');
	
	--------------------------------------------
	-- validate charge mandatory fields
	--------------------------------------------
	call "MIG_VALIDATE_CHARGE"('MIG_CHARGE_CS');
	
END 
@

create procedure MIG_VALIDATE_PLEDGOR_CS
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_CS');
end
@