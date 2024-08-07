drop procedure dc_validate_ab100
@

create procedure dc_validate_ab100 
	language sql
begin

	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'update dc_ab100'
		' set VALID_IND = ''N'' '||
		'where CURRENT_MARKET_VALUE is null '||
		'or VALUATION_DATE is null ' ||
		'or VALUATION_TYPE is null';
	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''DC-ARBS'', ''DC_AB101-''||REGION, CMS_COLLATERAL_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
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