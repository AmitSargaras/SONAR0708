drop procedure dc_validate_gt
@

create procedure dc_validate_gt 
	language sql
begin

	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'update dc_gt'
		' set VALID_IND = ''N'' '||
		'where SECURITY_CURRENCY is null '||
		'or SECURITY_MATURITY_DATE is null ' ||
		'or GUARANTEE_DATE is null ' ||
		'or SCHEME is null ' ||
		'or GUARANTEE_FEE_AMT is null ' ||
		'or EXPIRATION_DATE is null ';
	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''DC-ARBS'', ''DC_AB101-''||REGION, CMS_COLLATERAL_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
			'|| NVL2(SECURITY_CURRENCY, '''', '' [SECURITY_CURRENCY] '') '||
			'|| NVL2(SECURITY_MATURITY_DATE, '''','' [SECURITY_MATURITY_DATE] '') '||
			'|| NVL2(GUARANTEE_DATE, '''', '' [GUARANTEE_DATE] '') '||
			'|| NVL2(SCHEME, '''', '' [SCHEME] '') '||
			'|| NVL2(GUARANTEE_FEE_AMT, '''', '' [GUARANTEE_FEE_AMT] '') '||
			'|| NVL2(EXPIRATION_DATE, '''', '' [EXPIRATION_DATE] '') '||
			'|| '' is/are empty.'' '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' ';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@