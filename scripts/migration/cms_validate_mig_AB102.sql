drop procedure MIG_VALIDATE_AB102@
drop procedure MIG_VALIDATE_CHARGE_AB102@
drop procedure MIG_VALIDATE_PLEDGOR_AB102@
drop procedure MIG_VALIDATE_AB102_SEC@

create procedure mig_validate_AB102_sec
	language sql
begin
	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	--------------------------------------------
	-- validate mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_AB102 '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (VEHICLE_TYPE is null '||
		'or GOODS_STATUS is null '||
		'or MODEL_NO is null ' ||
	    'or CHASSIS_NUMBER is null '||
		'or SCRAP_VALUE is null '||
		'or YEAR_OF_MANUFACTURE is null '||
		'or REGISTRATION_CARD_NO is null ' ||
		'or BRAND is null) ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_AB102-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(VEHICLE_TYPE, '' [VEHICLE_TYPE] '') '||
			'|| SI_BVL(GOODS_STATUS, '' [GOODS_STATUS] '') '||
			'|| SI_BVL(MODEL_NO, '' [MODEL_NO] '') '||
			'|| SI_BVL(CHASSIS_NUMBER, '' [CHASSIS_NUMBER] '') '||
			'|| SI_BVL(SCRAP_VALUE, '' [SCRAP_VALUE] '') '||
			'|| SI_BVL(YEAR_OF_MANUFACTURE, '' [YEAR_OF_MANUFACTURE] '') '||
			'|| SI_BVL(REGISTRATION_CARD_NO, '' [REGISTRATION_CARD_NO] '') '||
			'|| SI_BVL(BRAND, '' [BRAND] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_AB102 ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and (VEHICLE_TYPE is null '||
			'or GOODS_STATUS is null '||
			'or MODEL_NO is null ' ||
			'or CHASSIS_NUMBER is null '||
			'or SCRAP_VALUE is null '||
			'or YEAR_OF_MANUFACTURE is null '||
			'or REGISTRATION_CARD_NO is null ' ||
			'or BRAND is null)) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;

	----------------------------------------------------------------
	-- validate purchase price and purchase date fields
	----------------------------------------------------------------
	set v_update_ind = 'update MIG_AB102 '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and GOODS_STATUS = ''New'' '||
		'and (PURCHASE_PRICE is null '||
		'or PURCHASE_DATE is null) ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_AB102-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| SI_BVL(PURCHASE_PRICE, '' [PURCHASE_PRICE] '') '||
			'|| SI_BVL(PURCHASE_DATE, '' [PURCHASE_DATE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_AB102 ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and GOODS_STATUS = ''New'' '||
			'and (PURCHASE_PRICE is null '||
			'or PURCHASE_DATE is null)) ';

	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
end
@

CREATE PROCEDURE MIG_VALIDATE_AB102
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_AB102');
	
	--------------------------------------------------------------
	-- Validate the validity of security subtype given
	---------------------------------------------------------------
	call "MIG_VALIDATE_SECURITY_SUBTYPE"('MIG_AB102');
	
	-------------------------------------------------------------------
	-- Validate the validity of the physical inspection date
	--------------------------------------------------------------------
	call "MIG_VALIDATE_PHY_INSP"('MIG_AB102');
	
	-------------------------------------------------------------------------------
	-- Validate the validity of the security confirmed env risky date
	-------------------------------------------------------------------------------	
	call "MIG_VALIDATE_SEC_ENV"('MIG_AB102');	
	
	call "MIG_VALIDATE_AB102_SEC";
END
@

create procedure MIG_VALIDATE_CHARGE_AB102
	LANGUAGE SQL
BEGIN

	---------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	----------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_AB102', 'MIG_AB102');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_AB102');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_RANK_LINKAGE"('MIG_CHARGE_AB102');
	
	call "MIG_INVALID_CHARGE_RANK"('MIG_CHARGE_AB102');
	
END 
@

create procedure MIG_VALIDATE_PLEDGOR_AB102
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_AB102');
end
@
