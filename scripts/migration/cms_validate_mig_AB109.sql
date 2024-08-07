drop procedure MIG_VALIDATE_AB109@
drop procedure MIG_VALIDATE_CHARGE_AB109@
drop procedure MIG_VALIDATE_PLEDGOR_AB109@
drop procedure MIG_VALIDATE_AB109_SEC@

create procedure mig_validate_AB109_sec
	language sql
begin
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	--------------------------------------------
	-- validate mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_AB109 '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (YEAR_OF_MANUFACTURE is null ' ||
		'or MODEL_NO is null ' ||
		'or SCRAP_VALUE is null)';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_AB109-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(YEAR_OF_MANUFACTURE, '' [YEAR_OF_MANUFACTURE] '') '||
			'|| SI_BVL(MODEL_NO, '' [MODEL_NO] '') '||
			'|| SI_BVL(SCRAP_VALUE, '' [SCRAP_VALUE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_AB109 ' ||
			' WHERE valid_ind = ''N'' '||
			'and (YEAR_OF_MANUFACTURE is null ' ||
			'or MODEL_NO is null ' ||
			'or SCRAP_VALUE is null))';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
end
@

CREATE PROCEDURE MIG_VALIDATE_AB109
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_AB109');
	
	--------------------------------------------------------------
	-- Validate the validity of security subtype given
	---------------------------------------------------------------
	call "MIG_VALIDATE_SECURITY_SUBTYPE"('MIG_AB109');
	
	-------------------------------------------------------------------
	-- Validate the validity of the physical inspection date
	--------------------------------------------------------------------
	call "MIG_VALIDATE_PHY_INSP"('MIG_AB109');
	
	-------------------------------------------------------------------------------
	-- Validate the validity of the security confirmed env risky date
	-------------------------------------------------------------------------------	
	call "MIG_VALIDATE_SEC_ENV"('MIG_AB109');	
	
	call "MIG_VALIDATE_AB109_SEC";
END
@

create procedure MIG_VALIDATE_CHARGE_AB109
	LANGUAGE SQL
BEGIN

	---------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	----------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_AB109', 'MIG_AB109');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_AB109');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_RANK_LINKAGE"('MIG_CHARGE_AB109');
	
	call "MIG_INVALID_CHARGE_RANK"('MIG_CHARGE_AB109');
	
END 
@

create procedure MIG_VALIDATE_PLEDGOR_AB109
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_AB109');
end
@
