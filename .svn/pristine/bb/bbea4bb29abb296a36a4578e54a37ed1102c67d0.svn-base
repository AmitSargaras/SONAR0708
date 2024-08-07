DROP PROCEDURE PATCH_VALIDATE_CO016_IN@

CREATE PROCEDURE PATCH_VALIDATE_CO016_IN
	LANGUAGE SQL
BEGIN
	----------------------------------------
	-- VALIDATON for INSURANCE POLICY
	----------------------------------------
	-- Mandatory field checking
	UPDATE PATCH_CO016_IN
	SET IS_VALID = 'N'
	WHERE length(AA_NUMBER) = 0
		OR length(INSURED_AMT) = 0
		OR EXPIRY_DATE is null
		OR length(POLICY_SEQ_NO) = 0;

	INSERT INTO PATCH_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO016', SECURITY_REF_NOTE, POLICY_SEQ_NO, POLICY_NUMBER, INSURER_NAME, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(AA_NUMBER, ' [AA_NUMBER] ')
		|| NVL2(char(INSURED_AMT), '', ' [INSURED_AMT] ')
		|| NVL2(char(EXPIRY_DATE), '', ' [EXPIRY_DATE] ')
		|| BVL(POLICY_SEQ_NO, ' [POLICY_SEQ_NO] ')	
		|| ' is/are empty.'						
	FROM PATCH_CO016_IN
	WHERE IS_VALID = 'N'
	AND (length(AA_NUMBER) = 0)
		OR length(INSURED_AMT) = 0
		OR EXPIRY_DATE is null
		OR length(POLICY_SEQ_NO) = 0;

	commit;		


	-- Duplication record checking
	UPDATE PATCH_CO016_IN a SET IS_VALID = 'N'
	WHERE (a.SECURITY_REF_NOTE, a.POLICY_SEQ_NO) in (
		select t.security_ref_note, t.policy_seq_no
		from patch_co016_in t
		group by t.security_ref_note, t.policy_seq_no
		having count(*) > 1)
	AND a.IS_VALID = 'Y'
	AND length(a.SECURITY_REF_NOTE) > 0
	AND length(a.POLICY_SEQ_NO) > 0;

	INSERT INTO PATCH_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, KEY2_VALUE, KEY3_VALUE, KEY4_VALUE, KEY5_VALUE, ERROR_CODE, ERROR_MSG)
		(select current_timestamp, 'SIBS', 'CO016', AA_NUMBER, SECURITY_REF_NOTE, POLICY_SEQ_NO, POLICY_NUMBER, INSURER_NAME, 'DUP001', 
		'[M] Duplicate insurance policy info for Collateral Name [' || SECURITY_REF_NOTE || '] Policy Sequence Number [' || POLICY_SEQ_NO
		|| '] - ' || trim(char(count(*))) || ' records found]' 
	FROM PATCH_CO016_IN a
	WHERE (a.SECURITY_REF_NOTE, a.POLICY_SEQ_NO) in 
		(select t.security_ref_note, t.policy_seq_no
		from PATCH_CO016_IN t
		group by t.security_ref_note, t.policy_seq_no
		having count(*) > 1)
	AND a.IS_VALID = 'N'
	AND length(a.SECURITY_REF_NOTE) > 0
	AND length(a.POLICY_SEQ_NO) > 0
	GROUP BY a.SECURITY_REF_NOTE, a.POLICY_SEQ_NO);

	commit;		


	-- Common Code Checking
	UPDATE PATCH_CO016_IN a SET IS_VALID = 'N'
	WHERE ( 
		(length(INSURER_NAME_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
														where category_code = INSURER_NAME_CAT and entry_code = INSURER_NAME_CODE fetch first row only))  	
		(length(INSURER_NAME) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
													where category_code = INSURER_NAME_CAT and entry_name = INSURER_NAME fetch first row only))  														
		OR (length(INSURANCE_TYPE_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
															where category_code = INSURANCE_TYPE_CAT and entry_code = INSURANCE_TYPE_CODE fetch first row only)) 
		OR (length(BANK_CUST_ARRANGE_INS_IND) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
																	where category_code = BANK_CUST_ARRANGE_INS_CAT and entry_code = BANK_CUST_ARRANGE_INS_IND fetch first row only)) 
		OR (length(BUILDING_OCCUPATION_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
																	where category_code = BUILDING_OCCUPATION_CAT and entry_code = BUILDING_OCCUPATION_CODE fetch first row only)) 
	) 
	AND a.IS_VALID = 'Y';	
		
	INSERT INTO PATCH_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, KEY2_VALUE, KEY3_VALUE, KEY4_VALUE, KEY5_VALUE, ERROR_CODE, ERROR_MSG)
	(select current_timestamp, 'SIBS', 'CO016',  AA_NUMBER, SECURITY_REF_NOTE, POLICY_SEQ_NO, POLICY_NUMBER, INSURER_NAME, 'COM001', 
		'[M] Non Existence Common Code: ' 
		|| (CASE WHEN length(INSURER_NAME_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('INSURER_NAME_CODE', INSURER_NAME_CODE, INSURER_NAME_CAT) ELSE '' END) 	
		|| (CASE WHEN length(INSURANCE_TYPE_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('INSURANCE_TYPE_CODE', INSURANCE_TYPE_CODE, INSURANCE_TYPE_CAT) ELSE '' END) 
		|| (CASE WHEN length(BANK_CUST_ARRANGE_INS_IND) > 0 THEN GET_INVALID_COMMON_CODE_MSG('BANK_CUST_ARRANGE_INS_IND', BANK_CUST_ARRANGE_INS_IND, BANK_CUST_ARRANGE_INS_CAT) ELSE '' END)
		|| (CASE WHEN length(BUILDING_OCCUPATION_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('BUILDING_OCCUPATION_CODE', BUILDING_OCCUPATION_CODE, BUILDING_OCCUPATION_CAT) ELSE '' END)
	FROM PATCH_CO016_IN
	WHERE ( 
		(length(INSURER_NAME_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
														where CATEGORY_CODE = INSURER_NAME_CAT and ENTRY_CODE = INSURER_NAME_CODE fetch first row only))  	
		OR (length(INSURANCE_TYPE_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
															where category_code = INSURANCE_TYPE_CAT and entry_code = INSURANCE_TYPE_CODE fetch first row only)) 
		OR (length(BANK_CUST_ARRANGE_INS_IND) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
																	where category_code = BANK_CUST_ARRANGE_INS_CAT and entry_code = BANK_CUST_ARRANGE_INS_IND fetch first row only)) 
		OR (length(BUILDING_OCCUPATION_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY 
																	where category_code = BUILDING_OCCUPATION_CAT and entry_code = BUILDING_OCCUPATION_CODE fetch first row only)) 
	));	

	commit;

	-- Check for invalid values
	UPDATE PATCH_CO016_IN a SET a.IS_VALID = 'N'
	WHERE EXISTS (select 1 from COMMON_CODE_CATEGORY_ENTRY comm
					where comm.CATEGORY_CODE = a.INSURER_NAME_CAT
					and comm.ENTRY_CODE = a.INSURER_NAME_CODE 
					and comm.ENTRY_NAME <> a.INSURER_NAME fetch first row only)
	AND a.IS_VALID = 'Y'
	and length(a.INSURER_NAME) > 0;

	INSERT INTO PATCH_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, KEY2_VALUE, KEY3_VALUE, KEY4_VALUE, KEY5_VALUE, ERROR_CODE, ERROR_MSG)
		(select current_timestamp, 'SIBS', 'CO016', AA_NUMBER, SECURITY_REF_NOTE, POLICY_SEQ_NO, POLICY_NUMBER, INSURER_NAME, 'INV001', 
		'[M] Mismatched Insurer Name [' || INSURER_NAME || '], and Insurer Code [' || INSURER_NAME_CODE || '] against common code. '
	FROM PATCH_CO016_IN a
	WHERE EXISTS (select 1 from COMMON_CODE_CATEGORY_ENTRY comm
					where comm.CATEGORY_CODE = a.INSURER_NAME_CAT
					and comm.ENTRY_CODE = a.INSURER_NAME_CODE 
					and comm.ENTRY_NAME <> a.INSURER_NAME fetch first row only)
	AND a.IS_VALID = 'N'
	and length(a.INSURER_NAME) > 0);

	commit;		

END@	