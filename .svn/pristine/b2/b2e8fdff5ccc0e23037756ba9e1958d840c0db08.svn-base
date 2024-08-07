drop procedure dc_validate_in
@

create procedure dc_validate_in 
	language sql
begin

	DECLARE v_update_ind varchar(1000);
	DECLARE v_insert_ind varchar(1000);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'update dc_in'
		' set VALID_IND = ''N'' '||
		'where SECURITY_MATURITY_DATE is null '||
		'or SECURITY_PERFECTION_DATE is null ' ||
		'or LEGAL_ENFORCEABILITY_IND is null ' ||
		'or INSURER_NAME is null ' ||
		'or INSURANCE_TYPE is null ' ||
		'or INSURED_CURRENCY is null ' ||
		'or INSURED_AMT is null ' ||
		'or INSURANCE_EFFECTIVE_DATE is null ' ||
		'or POLICY_NUMBER is null';
	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''DC-ARBS'', ''DC_IN-''||REGION, CMS_COLLATERAL_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
			'|| NVL2(SECURITY_MATURITY_DATE, '''', '' [SECURITY_MATURITY_DATE] '') '||
			'|| NVL2(SECURITY_PERFECTION_DATE, '''','' [SECURITY_PERFECTION_DATE] '') '||
			'|| NVL2(LEGAL_ENFORCEABILITY_IND, '''', '' [LEGAL_ENFORCEABILITY_IND] '') '||
			'|| NVL2(INSURER_NAME, '''', '' [INSURER_NAME] '') '||
			'|| NVL2(INSURANCE_TYPE, '''', '' [INSURANCE_TYPE] '') '||
			'|| NVL2(INSURED_CURRENCY, '''', '' [INSURED_CURRENCY] '') '||
			'|| NVL2(INSURED_AMT, '''', '' [INSURED_AMT] '') '||
			'|| NVL2(INSURANCE_EFFECTIVE_DATE, '''', '' [INSURANCE_EFFECTIVE_DATE] '') '||
			'|| NVL2(POLICY_NUMBER, '''', '' [POLICY_NUMBER] '') '||
			'|| '' is/are empty.'' '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' ';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@