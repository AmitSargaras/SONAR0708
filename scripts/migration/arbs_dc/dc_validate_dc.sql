drop procedure dc_validate_doc
@
drop procedure dc_setvalue_DEED_Code
@

create procedure dc_validate_doc 
	language sql
begin

	DECLARE v_update_ind varchar(500);
	DECLARE v_insert_ind varchar(500);
	
	DECLARE stmt1 statement;
	DECLARE stmt2 statement;
	
	set v_update_ind = 'update dc_doc'
		' set VALID_IND = ''N'' '||
		'where SECURITY_CUSTODIAN_TYPE is null '||
		'or SECURITY_CUSTODIAN_VALUE is null ' ||
		'or SECURITY_MATURITY_DATE is null ' ||
		'or TYPE_OF_DEED_ASSIGNMENT is null '||
		'or DOCUMENT_DATE is null ' ||
		'or DOCUMENT_AMT_CCY is null ' ||
		'or DOCUMENT_AMT is null '||
		'or ISDA_AGREEMENT_DATE is null ' ||
		'or IFEMA_AGREEMENT_DATE is null ' ||
		'or ICOM_DOCUMENT_DATE is null ';

	
	set v_insert_ind = 'insert into dc_error_log '||
		'(time_stamp, system_id, interface_id, key1_value, error_code, error_msg) '||
		'select current_timestamp, ''DC-ARBS'', ''DC_AB101-''||REGION, CMS_COLLATERAL_ID, '||
			'''QC3d'', ''Mandatory Field(s): '''||
			'|| NVL2(SECURITY_CUSTODIAN_TYPE, '''', '' [SECURITY_CUSTODIAN_TYPE] '') '||
			'|| NVL2(SECURITY_CUSTODIAN_VALUE, '''','' [SECURITY_CUSTODIAN_VALUE] '') '||
			'|| NVL2(SECURITY_MATURITY_DATE, '''', '' [SECURITY_MATURITY_DATE] '') '||
			'|| NVL2(TYPE_OF_DEED_ASSIGNMENT, '''', '' [TYPE_OF_DEED_ASSIGNMENT] '') '||
			'|| NVL2(DOCUMENT_DATE, '''','' [DOCUMENT_DATE] '') '||
			'|| NVL2(DOCUMENT_AMT_CCY, '''', '' [DOCUMENT_AMT_CCY] '') '||
			'|| NVL2(DOCUMENT_AMT, '''', '' [DOCUMENT_AMT] '') '||
			'|| NVL2(ISDA_AGREEMENT_DATE, '''','' [ISDA_AGREEMENT_DATE] '') '||
			'|| NVL2(IFEMA_AGREEMENT_DATE, '''', '' [IFEMA_AGREEMENT_DATE] '') '||
			'|| NVL2(ICOM_DOCUMENT_DATE, '''', '' [ICOM_DOCUMENT_DATE] '') '||			
			'|| '' is/are empty.'' '||
			'FROM '||v_table||
	  		' WHERE valid_ind = ''N'' ';
	
	prepare stmt1 from v_update_ind;
	execute stmt1;
	
	prepare stmt2 from v_insert_ind;
	execute stmt2;
end
@

create procedure dc_setvalue_DEED_Code (in v_table varchar(20))
	language sql
begin
	declare v_update_sql varchar(250);
	declare v_update_stmt statement;
	
	-------------------------------------------
	-- set value for deed code
	-------------------------------------------
	set v_update_sql = 'update '|| v_table||
		' set TYPE_DEED_ASSN_CODE = get_common_code_entry_code(''DEED_ASSIGNMT_TYPE'', TYPE_OF_DEED_ASSIGNMENT) '||
		'where valid_ind = ''Y''';
		
	prepare v_update_stmt from v_update_sql;
	execute v_update_stmt;
end
@