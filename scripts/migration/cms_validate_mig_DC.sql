drop procedure MIG_VALIDATE_DC_SEC@
drop procedure MIG_VALIDATE_DC@
drop procedure MIG_VALIDATE_CHARGE_DC@
drop procedure MIG_VALIDATE_PLEDGOR_DC@

create procedure MIG_VALIDATE_DC_SEC
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
	-- validate rest of the mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_DC '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (TYPE_OF_DEED_ASSIGNMENT is null ' ||
		'or DOCUMENT_DATE is null '||
		'or DOCUMENT_AMT_CCY is null '||
		'or DOCUMENT_AMT is null '||
		'or ISDA_AGREEMENT_DATE is null '||
		'or IFEMA_AGREEMENT_DATE is null '||
		'or ICOM_DOCUMENT_DATE is null ) ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_DC-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(TYPE_OF_DEED_ASSIGNMENT, '''', '' [TYPE_OF_DEED_ASSIGNMENT] '') '||
			'|| NVL2(CHAR(DOCUMENT_DATE), '''', '' [DOCUMENT_DATE] '') '||
			'|| NVL2(DOCUMENT_AMT_CCY, '''', '' [DOCUMENT_AMT_CCY] '') '||
			'|| NVL2(CHAR(DOCUMENT_AMT), '''', '' [DOCUMENT_AMT] '') '||
			'|| NVL2(CHAR(ISDA_AGREEMENT_DATE), '''', '' [ISDA_AGREEMENT_DATE] '') '||
			'|| NVL2(CHAR(IFEMA_AGREEMENT_DATE), '''', '' [IFEMA_AGREEMENT_DATE] '') '||
			'|| NVL2(CHAR(ICOM_DOCUMENT_DATE), '''', '' [ICOM_DOCUMENT_DATE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_DC ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and (TYPE_OF_DEED_ASSIGNMENT is null ' ||
			'or DOCUMENT_DATE is null '||
			'or DOCUMENT_AMT_CCY is null '||
			'or DOCUMENT_AMT is null '||
			'or ISDA_AGREEMENT_DATE is null '||
			'or IFEMA_AGREEMENT_DATE is null '||
			'or ICOM_DOCUMENT_DATE is null )) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	--------------------------------------------
	-- validate MAX_AMT > MIN_AMT
	--------------------------------------------
	set v_update_ind = 'update MIG_DC '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and MAX_AMT < MIN_AMT ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_DC-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''MAX_AMT < MIN_AMT : ''||CIF_NUMBER ' ||
			'FROM MIG_DC ' ||
	  		' WHERE valid_ind = ''N'' '||
	  		'and MAX_AMT < MIN_AMT ) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
			
END
@

create procedure MIG_VALIDATE_DC
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_DC');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_DC');

	call "MIG_VALIDATE_DC_SEC";

END
@

create procedure MIG_VALIDATE_CHARGE_DC
	LANGUAGE SQL
BEGIN

	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_DC', 'MIG_DC');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_DC');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_DC');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_DC');
	
	--------------------------------------------
	-- validate charge mandatory fields
	--------------------------------------------
	call "MIG_VALIDATE_CHARGE"('MIG_CHARGE_DC');

END 
@

create procedure MIG_VALIDATE_PLEDGOR_DC
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_DC');
end
@