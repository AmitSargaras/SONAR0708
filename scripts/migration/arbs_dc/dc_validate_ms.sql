drop procedure dc_validate_ms
@

create procedure dc_validate_ms 
	language sql
begin

	DECLARE v_update_ind varchar(1000);
	DECLARE v_insert_ind varchar(1000);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'update dc_ms'
		' set VALID_IND = ''N'' '||
		'where MATURITY_DATE is null '||
		'or ISSUER_NAME is null ' ||
		'or BOND_ISSUE_DATE is null ' ||
		'or STOCK_CODE is null ' ||
		'or STOCK_NAME is null ' ||
		'or ISIN_CODE is null ' ||
		'or INSURED_AMT is null ' ||
		'or INSURANCE_EFFECTIVE_DATE is null ' ||
		'or POLICY_NUMBER is null';
	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''DC-ARBS'', ''DC_MS-''||REGION, CMS_COLLATERAL_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
			'|| NVL2(MATURITY_DATE, '''', '' [MATURITY_DATE] '') '||
			'|| NVL2(ISSUER_NAME, '''','' [ISSUER_NAME] '') '||
			'|| NVL2(BOND_ISSUE_DATE, '''', '' [BOND_ISSUE_DATE] '') '||
			'|| NVL2(STOCK_CODE, '''', '' [STOCK_CODE] '') '||
			'|| NVL2(STOCK_NAME, '''', '' [STOCK_NAME] '') '||
			'|| NVL2(ISIN_CODE, '''', '' [ISIN_CODE] '') '||
			'|| '' is/are empty.'' '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' ';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@