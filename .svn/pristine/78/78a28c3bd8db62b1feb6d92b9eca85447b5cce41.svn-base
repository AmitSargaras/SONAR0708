drop procedure dc_validate_pt
@

create procedure dc_validate_pt 
	language sql
begin

	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'update dc_pt'
		' set VALID_IND = ''N'' '||
		'where TITLE_TYPE is null ' ||
		'or LAND_AREA is null '||
		'or LAND_AREA_UOM is null ' ||
		'or BUILT_UP_AREA is null ' ||	
		'or BUILT_UP_AREA_UOM is null '||
		'or STATE is null '||
		'or DISTRICT is null ' ||
		'or MUKIM is null' ||
		'or PROPERTY_COMPLETION_STATUS is null '||
		'or DEVELOPER_NAME is null ' ||
		'or CURRENT_MARKET_VALUE is null '||
		'or VALUATION_DATE is null ' ||
		'or VALUATION_TYPE is null';
	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''DC-ARBS'', ''DC_PT-''||REGION, CMS_COLLATERAL_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
			'|| NVL2(TITLE_TYPE, '''', '' [TITLE_TYPE] '') '||
			'|| NVL2(LAND_AREA, '''','' [LAND_AREA] '') '||
			'|| NVL2(LAND_AREA_UOM, '''', '' [LAND_AREA_UOM] '') '||
			'|| NVL2(BUILT_UP_AREA, '''', '' [BUILT_UP_AREA] '') '||
			'|| NVL2(BUILT_UP_AREA_UOM, '''','' [BUILT_UP_AREA_UOM] '') '||
			'|| NVL2(STATE, '''', '' [STATE] '') '||
			'|| NVL2(DISTRICT, '''', '' [DISTRICT] '') '||
			'|| NVL2(MUKIM, '''','' [MUKIM] '') '||
			'|| NVL2(PROPERTY_COMPLETION_STATUS, '''', '' [PROPERTY_COMPLETION_STATUS] '') '||
			'|| NVL2(DEVELOPER_NAME, '''', '' [DEVELOPER_NAME] '') '||		
			'|| NVL2(CURRENT_MARKET_VALUE, '''', '' [CURRENT_MARKET_VALUE] '') '||
			'|| NVL2(VALUATION_DATE, '''','' [VALUATION_DATE] '') '||
			'|| NVL2(VALUATION_TYPE, '''', '' [VALUATION_TYPE] '') '||
			'|| '' is/are empty.'' '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' ';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@