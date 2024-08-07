drop procedure MIG_VALIDATE_PT_SEC@
drop procedure MIG_VALIDATE_PT@
drop procedure MIG_VALIDATE_CHARGE_PT@
drop procedure MIG_VALIDATE_PLEDGOR_PT@
drop procedure MIG_VALIDATE_PT_SEC_2@

create procedure MIG_VALIDATE_PT_SEC
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
	set v_update_ind = 'update MIG_PT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and PHYSICAL_INSPECTION_IND = ''Y'' '||
		'and LAST_PHYSICAL_INSPECTION_DATE is null';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_PT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(char(LAST_PHYSICAL_INSPECTION_DATE), '''', '' [LAST_PHYSICAL_INSPECTION_DATE] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_PT ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and PHYSICAL_INSPECTION_IND = ''Y'' '||
			'and LAST_PHYSICAL_INSPECTION_DATE is null)';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	--------------------------------------------
	-- validate last physical inspection date fields
	--------------------------------------------
	set v_update_ind = 'update MIG_PT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and SEC_ENVIRONMENTAL_RISKY_IND = ''Y'' '||
		'and DATE_SEC_CONFIRM_ENV_RISKY is null';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'(select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_PT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(char(DATE_SEC_CONFIRM_ENV_RISKY), '''', '' [DATE_SEC_CONFIRM_ENV_RISKY] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_PT ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and SEC_ENVIRONMENTAL_RISKY_IND = ''Y'' '||
			'and DATE_SEC_CONFIRM_ENV_RISKY is null)';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;

END
@



create procedure MIG_VALIDATE_PT_SEC_2
	LANGUAGE SQL
BEGIN
	

	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	
	--------------------------------------------
	-- validate the rest of the mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_PT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (SALES_PURCHASE_AGREEMENT_VALUE is null '||
		'or TITLE_TYPE is null '||
		'or TITLE_NUMBER is null '||
		'or POSCODE is null '||
		'or LAND_AREA is null '||
		'or LAND_AREA_UOM is null '||
		'or BUILT_UP_AREA is null '||
		'or BUILT_UP_AREA_UOM is null '||
		'or TENURE_VALUE is null '||
		'or TENURE is null '||	
		'or PROPERTY_ADDRESS is null) ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_PT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(CHAR(SALES_PURCHASE_AGREEMENT_VALUE), '''', '' [SALES_PURCHASE_AGREEMENT_VALUE] '') '||
			'|| NVL2(TITLE_TYPE, '''', '' [TITLE_TYPE] '') '||
			'|| NVL2(TITLE_NUMBER, '''', '' [TITLE_NUMBER] '') '||
			'|| NVL2(POSCODE, '''', '' [POSCODE] '') '||
			'|| NVL2(CHAR(LAND_AREA), '''', '' [LAND_AREA] '') '||
			'|| NVL2(LAND_AREA_UOM, '''', '' [LAND_AREA_UOM] '') '||
			'|| NVL2(CHAR(BUILT_UP_AREA), '''', '' [BUILT_UP_AREA] '') '||
			'|| NVL2(BUILT_UP_AREA_UOM, '''', '' [BUILT_UP_AREA_UOM] '') '||
			'|| NVL2(CHAR(TENURE_VALUE), '''', '' [TENURE_VALUE] '') '||
			'|| NVL2(TENURE, '''', '' [TENURE] '') '||
			'|| NVL2(PROPERTY_ADDRESS, '''', '' [PROPERTY_ADDRESS] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_PT ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and (SALES_PURCHASE_AGREEMENT_VALUE is null '||
			'or TITLE_TYPE is null '||
			'or TITLE_NUMBER is null '||
			'or POSCODE is null '||
			'or LAND_AREA is null '||
			'or LAND_AREA_UOM is null '||
			'or BUILT_UP_AREA is null '||
			'or BUILT_UP_AREA_UOM is null '||
			'or TENURE_VALUE is null '||
			'or TENURE is null ' ||
			'or PROPERTY_ADDRESS is null)';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	

	set v_update_ind = 'update MIG_PT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (STATE is null '||
		'or DISTRICT is null '||
		'or MUKIM is null '||
		'or PROPERTY_USAGE_TYPE is null '||
		'or DEVELOPER_NAME is null '||
		'or ABANDONED_PROJECT_IND is null '||
		'or PROPERTY_COMPLETION_STATUS is null '||
		'or CATEGOTY_OF_LAND_USE is null '||
		'or PROPERTY_TYPE is null '||
		'or INDEPENDENT_VALUER_IND is null '||	
		'or QUIT_RENT_IND is null) ';
		
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''MIG-''||SOURCE_ID, ''MIG_PT-''||REGION, SOURCE_SECURITY_ID, '||
			'''QC3d'', ''Mandatory Field(s): ''' ||
			'|| NVL2(STATE, '''', '' [STATE] '') '||
			'|| NVL2(DISTRICT, '''', '' [DISTRICT] '') '||
			'|| NVL2(MUKIM, '''', '' [MUKIM] '') '||
			'|| NVL2(PROPERTY_USAGE_TYPE, '''', '' [PROPERTY_USAGE_TYPE] '') '||
			'|| NVL2(DEVELOPER_NAME, '''', '' [DEVELOPER_NAME] '') '||
			'|| NVL2(ABANDONED_PROJECT_IND, '''', '' [ABANDONED_PROJECT_IND] '') '||
			'|| NVL2(PROPERTY_COMPLETION_STATUS, '''', '' [PROPERTY_COMPLETION_STATUS] '') '||
			'|| NVL2(CATEGOTY_OF_LAND_USE, '''', '' [CATEGOTY_OF_LAND_USE] '') '||
			'|| NVL2(PROPERTY_TYPE, '''', '' [PROPERTY_TYPE] '') '||
			'|| NVL2(INDEPENDENT_VALUER_IND, '''', '' [INDEPENDENT_VALUER_IND] '') '||
			'|| NVL2(QUIT_RENT_IND, '''', '' [QUIT_RENT_IND] '') '||
			'|| ''is/are empty.'' '||
			'FROM MIG_PT ' ||
	  		' WHERE valid_ind = ''N'' '||
			'and (STATE is null '||
			'or DISTRICT is null '||
		    'or MUKIM is null '||
		    'or PROPERTY_USAGE_TYPE is null '||
		    'or DEVELOPER_NAME is null '||
		    'or ABANDONED_PROJECT_IND is null '||
		    'or PROPERTY_COMPLETION_STATUS is null '||
		    'or CATEGOTY_OF_LAND_USE is null '||
		    'or PROPERTY_TYPE is null '||
		    'or INDEPENDENT_VALUER_IND is null '||
			'or QUIT_RENT_IND is null)';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;
	
	

END
@

create procedure MIG_VALIDATE_PT
	LANGUAGE SQL
BEGIN
	----------------------------------
	-- Validate common security fields
	----------------------------------
	call "MIG_VALIDATE_COMMON_SEC_MANDATORY"('MIG_PT');
	
	--------------------------------
	-- Set security subtype code
	--------------------------------
	call "MIG_SETVALUE_SEC_SUBTYPE"('MIG_PT');
	
	call "MIG_VALIDATE_PT_SEC";
	
	call "MIG_VALIDATE_PT_SEC_2";

END
@

create procedure MIG_VALIDATE_CHARGE_PT
	LANGUAGE SQL
BEGIN

	declare v_update_ind varchar(500);
	declare v_insert_ind varchar(1500);
	
	declare stmt1 statement;
	declare stmt2 statement;
	-------------------------------------------------------------------------------------
	-- Invalidate the charge detail due to security validation failure
	-------------------------------------------------------------------------------------
	call "MIG_VALIDATE_CHARGE_SECURITY"('MIG_CHARGE_PT', 'MIG_PT');

	--------------------------------------
	-- Validate for valid limit id
	--------------------------------------
	call "MIG_VALIDATE_CHARGE_LIMIT"('MIG_CHARGE_PT');
	
	------------------------------------------------------------------------------------------------------------
	-- validate for valid charge 
	-- invalid the records for same charge if one of the record is failed from validation
	------------------------------------------------------------------------------------------------------------
	call "MIG_VALIDATE_RELATED_CHARGE_LINKAGE"('MIG_CHARGE_PT');
	
	--call "MIG_INVALID_CHARGE"('MIG_CHARGE_PT');
		
	--------------------------------------------
	-- validate charge mandatory fields
	--------------------------------------------
	set v_update_ind = 'update MIG_CHARGE_PT '|| 
		'set VALID_IND = ''N'' '||
		'where VALID_IND = ''Y'' '||
		'and (CAVEAT_WAIVED_IND is null '||
		'or CAVEAT_REF_NUMBER is null '||
		'or PRESENTATION_NUMBER is null '||
		'or PRESENTATION_DATE is null '||
		'or DATE_LODGED is null '||
		'or SOLICITOR_NAME is null) ';

	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	set v_insert_ind = 'insert into mig_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''MIG_-''||SOURCE_ID, ''MIG_CHARGE_PT-''||REGION, SOURCE_SECURITY_ID, '||
		'''QC3d'', ''Mandatory Field(s): ''' ||
		'|| NVL2(CAVEAT_WAIVED_IND, '''', '' [CAVEAT_WAIVED_IND] '') '||
		'|| NVL2(CHARGE_TYPE, '''', '' [CHARGE_TYPE] '') '||
		'|| NVL2(CAVEAT_REF_NUMBER, '''', '' [CAVEAT_REF_NUMBER] '') '||
		'|| NVL2(CHAR(PRESENTATION_DATE), '''', '' [PRESENTATION_DATE] '') '||
		'|| NVL2(CHAR(DATE_LODGED), '''', '' [DATE_LODGED] '') '||
		'|| NVL2(SOLICITOR_NAME, '''', '' [SOLICITOR_NAME] '') '||
		'|| ''is/are empty.'' '||
		'FROM MIG_CHARGE_PT ' ||
		' WHERE valid_ind = ''N'' '||
		'and (CAVEAT_WAIVED_IND is null '||
		'or CAVEAT_REF_NUMBER is null '||
		'or PRESENTATION_NUMBER is null '||
		'or PRESENTATION_DATE is null '||
		'or DATE_LODGED is null '||
		'or SOLICITOR_NAME is null) ';
						
	prepare stmt2 from v_insert_ind;
	execute stmt2;

	call "MIG_VALIDATE_CHARGE"('MIG_CHARGE_PT');
	
END 
@

create procedure MIG_VALIDATE_PLEDGOR_PT
	language sql
begin
	call "MIG_VALIDATE_PLEDGOR"('MIG_PLEDGOR_PT');
end
@