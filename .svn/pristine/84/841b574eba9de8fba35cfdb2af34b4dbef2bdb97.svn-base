DROP PROCEDURE MIG_CLEANUP_CU001_CU@
DROP PROCEDURE MIG_CLEANUP_CA001_AA@
DROP PROCEDURE MIG_CLEANUP_CA002_JB@
DROP PROCEDURE MIG_CLEANUP_CA003_1_FAC@
DROP PROCEDURE MIG_CLEANUP_CA003_2_BNM@
DROP PROCEDURE MIG_CLEANUP_CA003_3_OFF@
DROP PROCEDURE MIG_CLEANUP_CA003_4_REL@
DROP PROCEDURE MIG_CLEANUP_CA003_5_INS@
DROP PROCEDURE MIG_CLEANUP_CA003_6_MUL@
DROP PROCEDURE MIG_CLEANUP_CA003_7_ISL@
DROP PROCEDURE MIG_CLEANUP_CA003_8_BBA@
DROP PROCEDURE MIG_CLEANUP_CA004@

/* --------- Start of Collateral ---------- */
DROP PROCEDURE MIG_CLEANUP_CO001_AB@
DROP PROCEDURE MIG_CLEANUP_CO002_AB_GOLD@
DROP PROCEDURE MIG_CLEANUP_CO005_CS@
DROP PROCEDURE MIG_CLEANUP_CO008_MS@
DROP PROCEDURE MIG_CLEANUP_CO009_PT@
DROP PROCEDURE MIG_CLEANUP_CO010_GT@
DROP PROCEDURE MIG_CLEANUP_CO011_OT@
DROP PROCEDURE MIG_CLEANUP_CO012_IN@
DROP PROCEDURE MIG_CLEANUP_CO014_CL@

DROP PROCEDURE MIG_CLEANUP_CO015_VL@
DROP PROCEDURE MIG_CLEANUP_CO016_IN@
DROP PROCEDURE MIG_CLEANUP_CO017_CD@
DROP PROCEDURE MIG_CLEANUP_CO018_PG@
DROP PROCEDURE MIG_CLEANUP_CO019_PL@

CREATE PROCEDURE MIG_CLEANUP_CU001_CU
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CU001_CU', 'SIBS', 1);
    CALL LOG_PROC_TIME('MIG_CLEANUP_CU001_CU', 'SIBS', 0);
    commit;
	  		
END@


CREATE PROCEDURE MIG_CLEANUP_CA001_AA
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA001_AA', 'SIBS', 1);
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, 
	key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, key14_value, key15_value, key16_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, aa.AA_NUMBER, aa.LOS_BCA_REF_NUM, lmt.LIMIT_ID, 
	    lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, aa.AA_CREATE_DATE, aa.AA_APPROVED_DATE, lmt.APPROVED_DATE, 
	    lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, lmt.LMT_STATUS_CODE_VALUE, lmt.FAC_STATUS_CODE_VALUE, 'MAN001',
			'[L] Mandatory Field(s): ' 
			--|| BVL(JOINT_BORROWER_IND, ' [JOINT_BORROWER_IND] ')
			|| NVL2(char(AA_APPROVED_DATE), '', ' [AA_APPROVED_DATE] ')
			|| NVL2(char(AA_CREATE_DATE), '',  ' [AA_CREATE_DATE] ')
			|| ' is/are empty.'
	   FROM MIG_CA001_AA aa, MIG_CA003_1 lmt
       WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
       AND aa.IS_VALID = 'Y'
       AND (
            AA_APPROVED_DATE is null
         OR AA_CREATE_DATE is null
       ));
		
    CALL LOG_PROC_TIME('MIG_CLEANUP_CA001_AA', 'SIBS', 0);
    commit;
    
END@


CREATE PROCEDURE MIG_CLEANUP_CA002_JB
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA002_JB', 'SIBS', 1);	

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, 
	key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, key14_value, key15_value, key16_value, key17_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA002', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, aa.AA_NUMBER, LOS_BCA_REF_NUM, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, JOINT_BORROWER_IND, jb.CIF_ID, aa.AA_CREATE_DATE, 
		lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, lmt.LMT_STATUS_CODE_VALUE, lmt.FAC_STATUS_CODE_VALUE, 'HPWJB',
			'[L] HP cases having joint borrower. ' 
	  FROM MIG_CA002_JB jb, MIG_CA001_AA aa, MIG_CA003_1 lmt
	  WHERE jb.AA_NUMBER = aa.LOS_BCA_REF_NUM
	  AND aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
          AND jb.IS_VALID = 'Y'
      	  AND aa.APPLICATION_TYPE = 'HP');

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA002_JB', 'SIBS', 0);  
	COMMIT;
END
@

CREATE PROCEDURE MIG_CLEANUP_CA003_1_FAC
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 1);
	commit;

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CA003_1'', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, ''MAN001'',
			''[L] Mandatory Field(s): '' 
			-- || BVL(ACF_NO, '' [ACF_NO] '')
			|| BVL(LOAN_PURPOSE_CODE_VALUE, '' [LOAN_PURPOSE_CODE_VALUE] '')
			|| NVL2(char(OFFER_DATE), '''', '' [OFFER_DATE] '')
			|| NVL2(char(OFFER_ACCEPTED_DATE), '''', '' [OFFER_ACCEPTED_DATE] '')
			|| NVL2(char(APPROVED_DATE), '''', '' [APPROVED_DATE] '')
			-- || BVL(PERSON_APPROVED_CODE_VALUE, '' [PERSON_APPROVED_CODE_VALUE] '')
			|| BVL(CAR_CODE_FLAG, '' [CAR_CODE_FLAG] '')
			|| BVL(OFFICER_CODE_VALUE, '' [OFFICER_CODE_VALUE] '')
			|| BVL(LMT_STATUS_CODE_VALUE, '' [LMT_STATUS_CODE_VALUE] '')
			||(CASE WHEN COMMISSION_RATE>0 THEN BVL(COMMISSION_BASIS_CODE_VALUE, '' [COMMISSION_BASIS_CODE_VALUE] '') ELSE '''' END)
			|| BVL(APPL_SRC_CODE_VALUE, '' [APPL_SRC_CODE_VALUE] '')
			||(CASE WHEN EFFECTIVE_COSE_OF_FUND=''Y'' THEN NVL2(char(ECOF_VARIANCE), '''', '' [ECOF_VARIANCE] '') ELSE '''' END)
			||(CASE WHEN EFFECTIVE_COSE_OF_FUND=''Y'' THEN BVL(ECOF_VARIANCE_CODE, '' [ECOF_VARIANCE_CODE] '') ELSE '''' END)
			|| BVL(DEPARTMENT_CODE_VALUE, '' [DEPARTMENT_CODE_VALUE] '')
			|| NVL2(char(INSTALLMENT_AMOUNT), '', '' [INSTALLMENT_AMOUNT] '')
			|| '' is/are empty.''
	 FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
       AND lmt.IS_VALID = ''Y''
     	AND (
            -- length(ACF_NO)=0
         -- OR 
            length(LOAN_PURPOSE_CODE_VALUE) = 0
         OR length(OFFER_DATE) = 0
         OR length(OFFER_ACCEPTED_DATE) = 0
         OR length(APPROVED_DATE) = 0
         -- OR length(PERSON_APPROVED_CODE_VALUE) = 0
         OR length(CAR_CODE_FLAG) = 0
         OR length(OFFICER_CODE_VALUE) = 0
         OR length(LMT_STATUS_CODE_VALUE) = 0
		 OR (COMMISSION_RATE>0 and length(COMMISSION_BASIS_CODE_VALUE)=0)
         OR length(STANDBY_LINE) = 0
         OR length(APPL_SRC_CODE_VALUE) = 0
         OR (EFFECTIVE_COSE_OF_FUND=''Y'' and length(ECOF_VARIANCE)=0)
         OR (EFFECTIVE_COSE_OF_FUND=''Y'' and length(ECOF_VARIANCE_CODE)=0)
         OR length(DEPARTMENT_CODE_VALUE) = 0        
		 OR INSTALLMENT_AMOUNT = 0		 
     )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');		 
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 2);
	commit;

	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------     
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CA003_1'', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, ''COM001'',
		''[M] Non Existence Common Code: '' 
		|| GET_INVALID_COMMON_CODE_MSG(''PRODUCT_TYPE_CODE'', PRODUCT_TYPE_CODE, PRODUCT_TYPE_CAT) 	
		|| GET_INVALID_COMMON_CODE_MSG(''LOAN_PURPOSE_CODE_VALUE'', LOAN_PURPOSE_CODE_VALUE, LOAN_PURPOSE_CODE_NUM)
		|| GET_INVALID_COMMON_CODE_MSG(''PERSON_APPROVED_CODE_VALUE'', PERSON_APPROVED_CODE_VALUE, PERSON_APPROVED_CODE_NUM)
		|| GET_INVALID_COMMON_CODE_MSG(''CAR_CODE_VALUE'', CAR_CODE_VALUE, CAR_CODE_NUM)
		|| GET_INVALID_COMMON_CODE_MSG(''LMT_STATUS_CODE_VALUE'', LMT_STATUS_CODE_VALUE, LMT_STATUS_CODE_NUM)
		|| GET_INVALID_COMMON_CODE_MSG(''DEPARTMENT_CODE_VALUE'', DEPARTMENT_CODE_VALUE, DEPARTMENT_CODE_NUM)
		-- || (CASE WHEN length(OFFICER_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG(''OFFICER_CODE_VALUE'', OFFICER_CODE_VALUE, OFFICER_CODE_NUM) ELSE '''' END)
		|| (CASE WHEN length(APPL_SRC_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG(''APPL_SRC_CODE_VALUE'', APPL_SRC_CODE_VALUE, APPL_SRC_CODE_NUM) ELSE '''' END)
		|| (CASE WHEN length(DEALER_NUM_LPP_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG(''DEALER_NUM_LPP_CODE_VALUE'', DEALER_NUM_LPP_CODE_VALUE, DEALER_NUM_LPP_CODE_NUM) ELSE '''' END)
		|| (CASE WHEN length(LAWYER_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG(''LAWYER_CODE_VALUE'', LAWYER_CODE_VALUE, LAWYER_CODE_NUM) ELSE '''' END)
		|| (CASE WHEN length(PROD_PACKAGE_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG(''PROD_PACKAGE_CODE_VALUE'', PROD_PACKAGE_CODE_VALUE, PROD_PACKAGE_CODE_NUM) ELSE '''' END)
		|| (CASE WHEN length(REFINANCE_FROM_BANK_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG(''REFINANCE_FROM_BANK_CODE_VALUE'', REFINANCE_FROM_BANK_CODE_VALUE, REFINANCE_FROM_BANK_CODE_NUM) ELSE '''' END)
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
       AND lmt.IS_VALID = ''Y''
     	AND (
             (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRODUCT_TYPE_CAT and entry_code = PRODUCT_TYPE_CODE fetch first row only))  	
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOAN_PURPOSE_CODE_NUM and entry_code = LOAN_PURPOSE_CODE_VALUE fetch first row only)) 
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PERSON_APPROVED_CODE_NUM and entry_code = PERSON_APPROVED_CODE_VALUE fetch first row only)) 
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CAR_CODE_NUM and entry_code = CAR_CODE_VALUE fetch first row only)) 
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LMT_STATUS_CODE_NUM and entry_code = LMT_STATUS_CODE_VALUE fetch first row only)) 
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = DEPARTMENT_CODE_NUM and entry_code = DEPARTMENT_CODE_VALUE fetch first row only)) 
	      -- OR (length(OFFICER_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_CODE_NUM and entry_code = OFFICER_CODE_VALUE fetch first row only))) 
	      OR (length(APPL_SRC_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = APPL_SRC_CODE_NUM and entry_code = APPL_SRC_CODE_VALUE fetch first row only))) 
	      OR (length(DEALER_NUM_LPP_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = DEALER_NUM_LPP_CODE_NUM and entry_code = DEALER_NUM_LPP_CODE_VALUE fetch first row only))) 
	      OR (length(LAWYER_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LAWYER_CODE_NUM and entry_code = LAWYER_CODE_VALUE fetch first row only))) 
		  OR (length(PROD_PACKAGE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROD_PACKAGE_CODE_NUM and entry_code = PROD_PACKAGE_CODE_VALUE fetch first row only))) 
	      OR (length(REFINANCE_FROM_BANK_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFINANCE_FROM_BANK_CODE_NUM and entry_code = REFINANCE_FROM_BANK_CODE_VALUE fetch first row only))) 
	      )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');		  
		    
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 3);
	commit;

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			'OFFGACC',
		'[L] Date of Offer > Date Offered Accepted.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
     	AND OFFER_DATE > OFFER_ACCEPTED_DATE);

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 4);
	commit;
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			'APPGAPP',
		'[L] Approved Date < Application Date.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
     	AND APPROVED_DATE < APPLICATION_DATE);	
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 5);
	commit;		
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.LMT_STATUS_CODE_VALUE, lmt.FAC_STATUS_CODE_VALUE, 'OFFACCDATE001',
		'[L] Offer accepted date is empty when facility status = A (Approve) and documentation status is either DC or PA (Documentation Completed, Pending Acceptance).' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
		AND lmt.LMT_STATUS_CODE_VALUE in ('DC', 'PA')
		AND lmt.FAC_STATUS_CODE_VALUE = 'A'
     	AND OFFER_ACCEPTED_DATE is null);

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 6);
	commit;
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.FAC_STATUS_CODE_VALUE, 'OFFACCDATE002',
		'[L] Offer accepted date is available when facility status = P (Pending Approval).' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
		AND lmt.FAC_STATUS_CODE_VALUE = 'P'
     	AND OFFER_ACCEPTED_DATE is not null);

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 7);
	commit;	
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.LMT_STATUS_CODE_VALUE, 'OFFACCDATE003',
		'[L] Offer accepted date is available when facility code either 110 or 752 and documentation status is PA (Pendind Acceptance).' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
		AND lmt.FACILITY_CODE in ('110', '752')  
		AND lmt.LMT_STATUS_CODE_VALUE = 'PA'  
		AND lmt.OFFER_ACCEPTED_DATE is not null);

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 8);
	commit;		

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			'OFFDATE001',
		'[L] Date of Offer < Approved Date.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
     	AND OFFER_DATE < APPROVED_DATE);
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 9);		
	commit;		
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			LMT_STATUS_CODE_VALUE, 'OFFDATE002',
		'[L] Date of Offer is empty when documentation status is either DC or PA (Documentation Completed, Pending Acceptance).' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
     	AND lmt.LMT_STATUS_CODE_VALUE in ('DC','PA')  
		AND lmt.OFFER_DATE is null);		
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 10);		
	commit;	
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.SPREAD, lmt.SPREAD_SIGN, 'VARSIGN',
		'[L] Spread and spread sign either both must be empty or both must have values.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
		AND ((lmt.SPREAD = 0 or lmt.SPREAD is null) AND length(lmt.SPREAD_SIGN) > 0)
        OR (lmt.SPREAD > 0 and length(lmt.SPREAD_SIGN) = 0));	

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 10);		
	commit;
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			'FACBNM',
		'[L] Facility master must have facility BNM.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND lmt.IS_VALID = 'Y'
        AND not exists (select 1 from MIG_CA003_2_BNM bnm
                        where bnm.LMT_ID = lmt.LIMIT_ID
                        and bnm.LLP_BCA_REF_NUM = lmt.AA_NUMBER fetch first row only));		

	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 11);		
	commit;						

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.FINAL_PAYMENT, 'FACFNLAMT',
		'[L] Final payment amount must be 0 for facility is OD (110).' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
		WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
		AND lmt.IS_VALID = 'Y'
		AND lmt.FINAL_PAYMENT > 0 
		AND lmt.FACILITY_CODE = '110');
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 12);		
	commit;					
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.LIMIT_AMT, lmt.FINANCED_AMOUNT, 'FACLMT',
		'[L] Approved limit greater than applied amount.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
		WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
		AND lmt.IS_VALID = 'Y'
		AND lmt.LIMIT_AMT > lmt.FINANCED_AMOUNT);	
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 13);		
	commit;					
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.LIMIT_AMT, 'FACLMT',
		'[L] Approved limit given was 0.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
		WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
		AND lmt.IS_VALID = 'Y'
		AND lmt.LIMIT_AMT = 0);			
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 14);		
	commit;	

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.FINANCED_AMOUNT, 'ODFNLAMT',
		'[L] Applied amount given was 0.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
		WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
		AND lmt.IS_VALID = 'Y'
		AND lmt.FINANCED_AMOUNT = 0);
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 15);		
	commit;	

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.PERSON_APPROVED_CODE_VALUE, lmt.FAC_STATUS_CODE_VALUE, 'FACAPP001',
		'[L] Person approved by is empty when facility status was Approved.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
		WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
		AND lmt.IS_VALID = 'Y'
		AND length(lmt.PERSON_APPROVED_CODE_VALUE) = 0  
		AND lmt.FAC_STATUS_CODE_VALUE = 'A');		
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 16);		
	commit;	

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, lmt.OFFER_ACCEPTED_DATE, 
			lmt.PERSON_APPROVED_CODE_VALUE, lmt.FAC_STATUS_CODE_VALUE, 'FACAPP002',
		'[L] Person approved by is available when facility status was Pending Approval.' 
	FROM MIG_CA003_1 lmt, MIG_CA001_AA aa
		WHERE aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
		AND lmt.IS_VALID = 'Y'
		AND length(lmt.PERSON_APPROVED_CODE_VALUE) > 0  
		AND lmt.FAC_STATUS_CODE_VALUE = 'P');			
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_1_FAC', 'SIBS', 0);
	commit;	
	
END@


CREATE PROCEDURE MIG_CLEANUP_CA003_2_BNM
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_2', 'SIBS', 1);
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_2', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(PURPOSE_CODE_VALUE, ' [PURPOSE_CODE_VALUE] ')
			|| ' is/are empty.'
	FROM MIG_CA003_2_BNM bnm, MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE bnm.LMT_ID = lmt.LIMIT_ID
     	AND aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND bnm.IS_VALID = 'Y'
     	AND (
        length(PURPOSE_CODE_VALUE)=0
    ));
	  
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_2', 'SIBS', 2);
	commit;
	
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_2',  aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('PURPOSE_CODE_VALUE', PURPOSE_CODE_VALUE, PURPOSE_CODE_NUM)
			|| (CASE WHEN length(EXEMPTED_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('EXEMPTED_CODE_VALUE', EXEMPTED_CODE_VALUE, EXEMPTED_CODE_NUM) ELSE '' END)
	   FROM MIG_CA003_2_BNM bnm, MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE bnm.LMT_ID = lmt.LIMIT_ID
     	AND aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND bnm.IS_VALID = 'Y'
     	AND ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PURPOSE_CODE_NUM and entry_code = PURPOSE_CODE_VALUE )) 
	     OR (length(EXEMPTED_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = EXEMPTED_CODE_NUM and entry_code = EXEMPTED_CODE_VALUE ))) 
      ));

	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_2', 'SIBS', 0);
	commit;
    
END
@

CREATE PROCEDURE MIG_CLEANUP_CA003_3_OFF
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_3', 'SIBS', 1);
	
    INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_3', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RELATIONSHIP_CODE_VALUE, ' [RELATIONSHIP_CODE_VALUE] ')
			|| BVL(OFFICER_TYPE_CODE_VALUE, ' [OFFICER_TYPE_CODE_VALUE] ')
			|| ' is/are empty.'
	FROM MIG_CA003_3_OFF
    WHERE (
	        length(RELATIONSHIP_CODE_VALUE)=0
	     OR length(OFFICER_TYPE_CODE_VALUE)=0   
    ));
	  
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_3', 'SIBS', 2);
	commit;
	
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------      
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_3', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('OFFICER_CODE_VALUE', OFFICER_CODE_VALUE, OFFICER_CODE_NUM)
			|| GET_INVALID_COMMON_CODE_MSG('OFFICER_TYPE_CODE_VALUE', OFFICER_TYPE_CODE_VALUE, OFFICER_TYPE_CODE_NUM)
	FROM MIG_CA003_3_OFF ofc, MIG_CA003_1 lmt, MIG_CA001_AA aa
       	WHERE ofc.LMT_ID = lmt.LIMIT_ID
     	AND aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND ofc.IS_VALID = 'Y'
     	AND ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_CODE_NUM and entry_code = OFFICER_CODE_VALUE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_TYPE_CODE_NUM and entry_code = OFFICER_TYPE_CODE_VALUE ))  	
      	));
     
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_3', 'SIBS', 0);
	commit;
	
END
@


CREATE PROCEDURE MIG_CLEANUP_CA003_4_REL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_4_REL', 'SIBS', 1);
	
	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_4', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, rel.CIF_NUMBER, 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('ACCT_RELATIONSHIP_CODE_VALUE', ACCT_RELATIONSHIP_CODE_VALUE, ACCT_RELATIONSHIP_CODE_NUM)
			-- || (CASE WHEN length(HOLD_MAIN_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('HOLD_MAIN_CODE_VALUE', HOLD_MAIN_CODE_VALUE, HOLD_MAIN_CODE_NUM) ELSE '' END)
			-- || (CASE WHEN length(NAME_CONJUNCTION_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('NAME_CONJUNCTION_CODE', NAME_CONJUNCTION_CODE, NAME_CONJUNCTION_CAT) ELSE '' END)
	FROM MIG_CA003_4_REL rel, MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE rel.LMT_ID = lmt.LIMIT_ID
     	AND aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND rel.IS_VALID = 'Y'
     	AND ( 
    	   (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ACCT_RELATIONSHIP_CODE_NUM and entry_code = ACCT_RELATIONSHIP_CODE_VALUE fetch first row only)) 
		-- OR (length(HOLD_MAIN_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = HOLD_MAIN_CODE_NUM and entry_code = HOLD_MAIN_CODE_VALUE fetch first row only))) 
		-- OR (length(NAME_CONJUNCTION_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = NAME_CONJUNCTION_CAT and entry_code = NAME_CONJUNCTION_CODE fetch first row only))) 
      	));
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_4_REL', 'SIBS', 2);
	commit;
    
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------      
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_4', aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE, aa.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), lmt.ORG_LOC_ORG_CODE, lmt.APPLICATION_DATE, lmt.APPROVED_DATE, lmt.OFFER_DATE, 
			lmt.OFFER_ACCEPTED_DATE, rel.CIF_NUMBER, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (GUARANTEE_PERCENTAGE < 0 or GUARANTEE_PERCENTAGE > 100) THEN GET_INVALID_VALUE_MSG('GUARANTEE_PERCENTAGE', CHAR(GUARANTEE_PERCENTAGE), '0-100') ELSE '' END)
			|| (CASE WHEN (length(trim(NAME_CONJUNCTION_POSITION)) > 0 and (trim(NAME_CONJUNCTION_POSITION) NOT IN ('B', 'E'))) THEN GET_INVALID_VALUE_MSG('NAME_CONJUNCTION_POSITION', trim(NAME_CONJUNCTION_POSITION), 'B/E') ELSE '' END)
	FROM MIG_CA003_4_REL rel, MIG_CA003_1 lmt, MIG_CA001_AA aa
     	WHERE rel.LMT_ID = lmt.LIMIT_ID
     	AND aa.LOS_BCA_REF_NUM = lmt.LOS_AA_NUMBER
        AND rel.IS_VALID = 'Y'
     	AND ( (GUARANTEE_PERCENTAGE < 0 or GUARANTEE_PERCENTAGE > 100)
		OR (length(trim(NAME_CONJUNCTION_POSITION)) > 0 and (trim(NAME_CONJUNCTION_POSITION) NOT IN ('B', 'E')))
      	));		
     
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_4_REL', 'SIBS', 0);
	commit;
	
END@


CREATE PROCEDURE MIG_CLEANUP_CA003_5_INS
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_5_INS', 'SIBS', 1);	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_5_INS', 'SIBS', 0);
END
@

CREATE PROCEDURE MIG_CLEANUP_CA003_6_MUL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_6', 'SIBS', 1);
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_6', 'SIBS', 0);
END
@

CREATE PROCEDURE MIG_CLEANUP_CA003_7_ISL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_7', 'SIBS', 1);
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_7', 'SIBS', 0);
END
@


CREATE PROCEDURE MIG_CLEANUP_CA003_8_BBA
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_8', 'SIBS', 1);
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA003_8', 'SIBS', 0);
END
@


CREATE PROCEDURE MIG_CLEANUP_CA004
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA004', 'SIBS', 1);	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CA004', 'SIBS', 0);  
END
@

/* ----------------------------------------------- Start of Collateral ---------------------------------------- */


CREATE PROCEDURE MIG_CLEANUP_CO001_AB
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 1);
		
	-- INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'MAN001',
		-- '[L] Mandatory Field(s): '
		-- || BVL(SECURITY_REF_NOTE, '[SECURITY_REF_NOTE] ')
		-- || BVL(ASSET_TYPE_CODE, ' [ASSET_TYPE_CODE] ')
		-- || BVL(MODEL_NO, ' [MODEL_NO] ')
		-- || BVL(BRAND, ' [BRAND] ')
		-- || BVL(SCRAP_VALUE, '' [SCRAP_VALUE] '')
		-- || ' is/are empty.'
	-- FROM MIG_CO001_AB
    -- WHERE (
		-- length(SECURITY_REF_NOTE)=0
     -- OR length(ASSET_TYPE_CODE)=0
     -- OR length(MODEL_NO)=0
     -- OR length(BRAND)=0     
     -- OR length(SCRAP_VALUE) = 0
    -- ));
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO001'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, ''MAN001'',
		''[L] Mandatory Field(s): ''
		|| BVL(SECURITY_REF_NOTE, ''[SECURITY_REF_NOTE] '')
		|| BVL(ASSET_TYPE_CODE, '' [ASSET_TYPE_CODE] '')
		|| BVL(MODEL_NO, '' [MODEL_NO] '')
		|| BVL(BRAND, '' [BRAND] '')
		|| BVL(CHAR(SCRAP_VALUE), '' [SCRAP_VALUE] '')
		|| BVL(REG_NO, '' [REG_NO] '')
		|| '' is/are empty.''
	FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = ''Y''
	AND (
		length(ASSET_TYPE_CODE)=0
     OR length(MODEL_NO)=0
     OR length(BRAND)=0
	 OR (SCRAP_VALUE <= 0 and pl.APPLICATION_TYPE <> ''HP'')
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');		
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 2);
	commit;
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO001'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, ''MAN002'',
		''[L] Mandatory Field(s): ''
		|| BVL(SECURITY_REF_NOTE, ''[SECURITY_REF_NOTE] '')
		|| BVL(REG_NO, '' [REG_NO] '')
		|| '' is/are empty.''
	FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = ''Y''
	AND (
		length(SECURITY_REF_NOTE)=0
     OR length(REG_NO) = 0
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');		
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 3);
	commit;

    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    -- only required if checking for Asset type code -- already done in validation
    -- UPDATE MIG_CO001_AB a 
    -- SET asset_type_cat =
	-- (SELECT CASE REF_ENTRY_CODE
		-- WHEN 'AB101' THEN 'PLANT_EQUIP'
		-- WHEN 'AB102' THEN 'VEHICLE_TYPE'
		-- WHEN 'AB103' THEN 'AB_OTHERS_TYPE'
		-- END
	-- FROM COMMON_CODE_CATEGORY_ENTRY 
	-- WHERE CATEGORY_CODE = a.SOURCE_SEC_CAT
	-- AND ENTRY_CODE = a.source_security_sub_type);
    
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 4);
	commit;

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('MODEL_NO', MODEL_NO, MODEL_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('BRAND', BRAND, BRAND_CAT)
            --|| (CASE WHEN length(YARD)>0 THEN GET_INVALID_COMMON_CODE_MSG('YARD', YARD, YARD_CAT) ELSE '' END)
            --|| (CASE WHEN length(PBT_PBR_INDICATOR)>0 THEN GET_INVALID_COMMON_CODE_MSG('PBT_PBR_INDICATOR', PBT_PBR_INDICATOR, PBT_PBR_CAT) ELSE '' END)
            --|| (CASE WHEN length(TRANSMISSION_TYPE)>0 THEN GET_INVALID_COMMON_CODE_MSG('TRANSMISSION_TYPE', TRANSMISSION_TYPE, TRANSMISSION_CAT) ELSE '' END)
            --|| (CASE WHEN length(ENERGY_SOURCE)>0 THEN GET_INVALID_COMMON_CODE_MSG('ENERGY_SOURCE', ENERGY_SOURCE, ENERGY_CAT) ELSE '' END)
			--|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
	AND ( 
            (length(MODEL_NO)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = MODEL_CAT and entry_code = MODEL_NO )) 
    	 OR (length(BRAND)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BRAND_CAT and entry_code = BRAND )) 
         --OR (length(YARD)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = YARD_CAT and entry_code = YARD )) 
         --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PBT_PBR_CAT and entry_code = PBT_PBR_INDICATOR )) 
         --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TRANSMISSION_CAT and entry_code = TRANSMISSION_TYPE )) 
         --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ENERGY_CAT and entry_code = ENERGY_SOURCE )) 
         --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
      ));
      	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 5);
	commit;

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 'COM002',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('GOODS_STATUS', GOOD_STAT, GOODS_STATUS_CAT)
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
	AND ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_STATUS_CAT and entry_code = GOOD_STAT )) 
      ));
      	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 6);
	commit;

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 'MANYEAR',
			'[L] Invalid Year of Manufacture : ' 
			 || BVL(CHAR(MANUFACTURE_YEAR), ' [MANUFACTURE_YEAR] ')
			 || '. Year of Manufacture should be later than 1987.'
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
	AND ( 
             MANUFACTURE_YEAR < 1988
      ));

	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 7);
	commit;

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 'NONOMV',
			'[L] No initial omv (valuation records) when good status = NEW.'
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
	AND ( 
		 GOOD_STAT <> 'N'
		 and (NOT EXISTS (SELECT 1 FROM MIG_CO015_VL val where ab.SECURITY_ID = val.SECURITY_ID)) 
      ));

	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 8);
	commit;

	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 'ABPMO',
			'[L] Collateral Asset Based - Vehicle, Plant & Equipment being pledged under MO Loans for Security ID.'
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
        AND pl.APPLICATION_TYPE = 'MO'
	);
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 9);
	commit;	
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 'VEHCHG',
			'[L] Collateral Asset Based - Vehicle, Plant & Equipment without charge.'
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
        AND ab.SOURCE_SECURITY_TYPE = 'VEH'
		AND NOT EXISTS (select 1 from MIG_CO017_CD cd     
						where cd.SECURITY_ID = ab.SECURITY_ID fetch first row only) 
	);
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 10);
	commit;	
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ab.SECURITY_ID, ab.LOC_ORG_CODE, ab.SOURCE_SECURITY_SUB_TYPE, ab.CMS_SECURITY_SUBTYPE_ID, 
			SECURITY_MATURITY_DATE, 'SECMAT001',
			'[L] AB Security maturity date was empty.'
	   FROM MIG_CO001_AB ab, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ab.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ab.IS_VALID = 'Y'
		AND ab.SECURITY_MATURITY_DATE is null);		

	CALL LOG_PROC_TIME('MIG_CLEANUP_CO001_AB', 'SIBS', 0);
	commit;
	
END
@

CREATE PROCEDURE MIG_CLEANUP_CO002_AB_GOLD
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO002_AB_GOLD', 'SIBS', 1);	

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), abg.SECURITY_ID, abg.LOC_ORG_CODE, abg.SOURCE_SECURITY_SUB_TYPE, abg.CMS_SECURITY_SUBTYPE_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_REF_NOTE, '[SECURITY_REF_NOTE] ')
		|| ' is/are empty.'
	FROM MIG_CO002_AB_GOLD abg, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE abg.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND abg.IS_VALID = 'Y'
	AND (
		length(SECURITY_REF_NOTE)=0
    ));	
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO002_AB_GOLD', 'SIBS', 0);
	commit;
	
END
@

CREATE PROCEDURE MIG_CLEANUP_CO005_CS
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 1);
		
	-- INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', SECURITY_ID, 'MAN001',
		-- '[L] Mandatory Field(s): '
		-- || BVL(SECURITY_REF_NOTE, '[SECURITY_REF_NOTE] ')
		-- || NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		-- || BVL(REF_NO, ' [REF_NO] ')
		-- || BVL(GROUP_ACCOUNT_NO, ' [GROUP_ACCOUNT_NO] ')
		-- || BVL(IS_OWN_BANK, ' [IS_OWN_BANK] ')
		-- || (CASE WHEN IS_OWN_BANK='Y' THEN BVL(char(TENURE), ' [TENURE] ') ELSE '' END)
		-- || (CASE WHEN IS_OWN_BANK='Y' THEN BVL(TENURE_UNIT, ' [TENURE_UNIT] ') ELSE '' END)
		-- || BVL(ISSUER, ' [ISSUER] ')
		-- || BVL(HOLD_STATUS, ' [HOLD_STATUS] ')
		-- || ' is/are empty.'		
	-- FROM MIG_CO005_CS
	-- WHERE ( 
		-- length(SECURITY_REF_NOTE)=0
	-- OR SECURITY_PERFECTION_DATE is null
    -- OR length(REF_NO)=0
    -- OR length(GROUP_ACCOUNT_NO)=0
	-- OR length(IS_OWN_BANK)=0
    -- OR (IS_OWN_BANK = 'Y' AND length(TENURE) = 0)             
    -- OR (IS_OWN_BANK = 'Y' AND length(TENURE_UNIT) = 0)        
    -- OR length(ISSUER)=0
    -- OR length(HOLD_STATUS)=0
    -- ));

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO005'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cs.SECURITY_ID, cs.LOC_ORG_CODE, cs.SOURCE_SECURITY_SUB_TYPE, cs.CMS_SECURITY_SUBTYPE_ID, ''MAN001'',
		''[L] Mandatory Field(s): ''
		|| BVL(SECURITY_REF_NOTE, ''[SECURITY_REF_NOTE] '')
		|| (CASE WHEN IS_OWN_BANK=''Y'' THEN BVL(GROUP_ACCOUNT_NO, '' [GROUP_ACCOUNT_NO] '') ELSE '''' END)
		|| BVL(IS_OWN_BANK, '' [IS_OWN_BANK] '')
		-- || (CASE WHEN IS_OWN_BANK=''Y'' THEN BVL(char(TENURE), '' [TENURE] '') ELSE '''' END)
		-- || (CASE WHEN IS_OWN_BANK=''Y'' THEN BVL(TENURE_UNIT, '' [TENURE_UNIT] '') ELSE '''' END)
		|| BVL(ISSUER, '' [ISSUER] '')
		|| '' is/are empty.''		
	FROM MIG_CO005_CS cs, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cs.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cs.IS_VALID = ''Y''
	AND ( 
		length(SECURITY_REF_NOTE)=0
    OR (IS_OWN_BANK = ''Y'' AND length(GROUP_ACCOUNT_NO)=0)
	OR length(IS_OWN_BANK)=0
    -- OR (IS_OWN_BANK = ''Y'' AND length(TENURE) = 0)             
    -- OR (IS_OWN_BANK = ''Y'' AND length(TENURE_UNIT) = 0)        
    OR length(ISSUER)=0
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');		

	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 2);
	commit;	
	
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
            ||(CASE WHEN length(IS_OWN_BANK)>0 and IS_OWN_BANK='Y' THEN GET_INVALID_COMMON_CODE_MSG('TENURE_UNIT', TENURE_UNIT, TENURE_CAT) ELSE '' END)            
	   FROM MIG_CO005_CS
       WHERE ( 
            (length(IS_OWN_BANK)>0 and IS_OWN_BANK='Y' and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TENURE_CAT and entry_code = TENURE_UNIT ))
      ));
	  
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 3);
	commit;		  
        
    -----------------------------------------------------
    -- Check for invalid values
    -----------------------------------------------------
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			 || GET_INVALID_VALUE_MSG('HOLD_CODE', HOLD_STATUS, 'L/C')          
	   FROM MIG_CO005_CS
       WHERE ( 
             HOLD_STATUS not in ('L', 'C')             
      ));
	  
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 4);
	commit;	
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cs.SECURITY_ID, cs.LOC_ORG_CODE, cs.SOURCE_SECURITY_SUB_TYPE, cs.CMS_SECURITY_SUBTYPE_ID, 
			GROUP_ACCOUNT_NO, 'REFNO001',
			'[L] FD Group account number was empty.'
	   FROM MIG_CO005_CS cs, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cs.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cs.IS_VALID = 'Y'
        AND length(cs.GROUP_ACCOUNT_NO) = 0);	  		
        
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 5);
	commit;	
	
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cs.SECURITY_ID, cs.LOC_ORG_CODE, cs.SOURCE_SECURITY_SUB_TYPE, cs.CMS_SECURITY_SUBTYPE_ID, 
			REF_NO, 'REFNO002',
			'[L] FD Deposit/Source reference number was empty.'
	   FROM MIG_CO005_CS cs, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cs.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cs.IS_VALID = 'Y'
        AND length(cs.REF_NO) = 0
		AND cs.CMS_SECURITY_SUBTYPE_ID = 'CS202');	
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 6);
	commit;		
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cs.SECURITY_ID, cs.LOC_ORG_CODE, cs.SOURCE_SECURITY_SUB_TYPE, cs.CMS_SECURITY_SUBTYPE_ID, 
			GROUP_ACCOUNT_NO, REF_NO, DEPOSIT_MATURITY_DATE, 'SECMAT001',
			'[L] FD Security maturity date was empty.'
	   FROM MIG_CO005_CS cs, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cs.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cs.IS_VALID = 'Y'
		AND cs.DEPOSIT_MATURITY_DATE is null);	  
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 7);
	commit;		
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cs.SECURITY_ID, cs.LOC_ORG_CODE, cs.SOURCE_SECURITY_SUB_TYPE, cs.CMS_SECURITY_SUBTYPE_ID, 
			IS_OWN_BANK, TENURE, TENURE_UNIT, 'TEN001',
			'[L] FD Tenure with tenure unit was empty.'
	   FROM MIG_CO005_CS cs, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cs.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cs.IS_VALID = 'Y'
		AND cs.TENURE > 0 
		AND length(cs.TENURE_UNIT) = 0);	 

	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 8);
	commit;		
		
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cs.SECURITY_ID, cs.LOC_ORG_CODE, cs.SOURCE_SECURITY_SUB_TYPE, cs.CMS_SECURITY_SUBTYPE_ID, 
			IS_OWN_BANK, TENURE, TENURE_UNIT, 'TEN002',
			'[L] FD Tenure with tenure unit was empty.'
	   FROM MIG_CO005_CS cs, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cs.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cs.IS_VALID = 'Y'
		AND cs.IS_OWN_BANK = 'N'
		AND (cs.TENURE = 0 
			or length(cs.TENURE_UNIT) = 0));			
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO005_CS', 'SIBS', 0);
	commit;
	
END
@


CREATE PROCEDURE MIG_CLEANUP_CO008_MS
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO008_MS', 'SIBS', 1);

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO008', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ms.SECURITY_ID, ms.LOC_ORG_CODE, ms.SOURCE_SECURITY_SUB_TYPE, ms.CMS_SECURITY_SUBTYPE_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(CHAR(NUMBER_OF_UNITS), ' [NUMBER_OF_UNITS] ')
		|| BVL(STOCK_CODE_BOND_CODE, ' [STOCK_CODE_BOND_CODE] ')
		|| ' is/are empty.'						
	FROM MIG_CO008_MS ms, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ms.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ms.IS_VALID = 'Y'
	AND (
		NUMBER_OF_UNITS = 0
		OR length(STOCK_CODE_BOND_CODE) = 0
	));	
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO008_MS', 'SIBS', 2);
	commit;

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO008', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ms.SECURITY_ID, ms.LOC_ORG_CODE, ms.SOURCE_SECURITY_SUB_TYPE, ms.CMS_SECURITY_SUBTYPE_ID, 'MAN002',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(ISSUER_NAME, ' [ISSUER_NAME] ')			
		|| ' is/are empty.'						
	FROM MIG_CO008_MS ms, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ms.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ms.IS_VALID = 'Y'
	AND (
		length(SECURITY_REF_NOTE)=0
		OR length(ISSUER_NAME)=0
	));	
	
    	CALL LOG_PROC_TIME('MIG_CLEANUP_CO008_MS', 'SIBS', 3);
	commit;

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO008', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ms.SECURITY_ID, ms.LOC_ORG_CODE, ms.SOURCE_SECURITY_SUB_TYPE, ms.CMS_SECURITY_SUBTYPE_ID, 'STKCODE',
		'[L] Invalid Stock Code: '
		|| BVL(STOCK_CODE_BOND_CODE, ' [STOCK_CODE_BOND_CODE] ')
		|| BVL(STOCK_EXCHANGE_BOND_MARKET, ' [STOCK_EXCHANGE_BOND_MARKET] ')
		|| ' is/are not found from feed.'						
	FROM MIG_CO008_MS ms, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ms.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ms.IS_VALID = 'Y'
	AND NOT EXISTS( 
        SELECT 1 FROM cms_price_feed fd
    		WHERE fd.stock_code = ms.STOCK_CODE_BOND_CODE
    		AND fd.exchange = ms.STOCK_EXCHANGE_BOND_MARKET
    ));
    
    CALL LOG_PROC_TIME('MIG_CLEANUP_CO008_MS', 'SIBS', 0);
	commit;
	
END
@			

CREATE PROCEDURE MIG_CLEANUP_CO009_PT
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 1);
    
	CREATE INDEX IDX_CLUP1 ON MIG_CO009_PT
	("IS_VALID" ASC, "CMS_SECURITY_SUBTYPE_ID" ASC, "SOURCE_SECURITY_SUB_TYPE" ASC, "LOC_ORG_CODE" ASC, "SALE_PURCHASE_AGREEMENT_VALUE" ASC, "SECURITY_ID" ASC) 
	ALLOW REVERSE SCANS ; 

	CREATE INDEX IDX_CLUP2 ON MIG_CO015_VL
	("SECURITY_ID" ASC, "CMV" DESC) 
	ALLOW REVERSE SCANS ; 

	CREATE INDEX IDX_CLUP3 ON MIG_CO015_VL 
	("SECURITY_ID" ASC) 
	ALLOW REVERSE SCANS ; 

	CREATE INDEX IDX_CLUP4 ON MIG_CA003_1
	("FACILITY_SEQ" ASC, "FACILITY_CODE" ASC, "LOS_AA_NUMBER" ASC, "AA_NUMBER" ASC, "CIF_ID" ASC, "LIMIT_ID" ASC) 
	ALLOW REVERSE SCANS ; 

	CREATE INDEX IDX_CLUP5 ON MIG_CO019_PL
	("APPLICATION_LAW_TYPE" ASC, "APPLICATION_TYPE" ASC, "LIMIT_ID" ASC, "SECURITY_ID" ASC) 
	ALLOW REVERSE SCANS ; 

	CALL RUNSTATS_HELPER ('MIG_CO009_PT');

	CALL RUNSTATS_HELPER ('MIG_CO015_VL');

	CALL RUNSTATS_HELPER ('MIG_CA003_1');

	CALL RUNSTATS_HELPER ('MIG_CO019_PL');

	-- INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO009', SECURITY_ID, 'MAN001',
		-- '[L] Mandatory Field(s): '
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		-- || BVL(CUSTODIAN, ' [CUSTODIAN] ')
		-- || NVL2(char(SALE_PURCHASE_DATE), '', ' [SALE_PURCHASE_DATE] ')		
		-- || BVL(MASTER_TITLE, ' [MASTER_TITLE] ')
		-- || BVL(TITLE_NUMBER_PREFIX, ' [TITLE_NUMBER_PREFIX] ')
		-- || BVL(TITLE_NUMBER, ' [TITLE_NUMBER] ')
		-- || BVL(LOT_NO, ' [LOT_NO] ')
		-- ||(CASE WHEN length(POST_CODE)>0 THEN BVL(STATE_CODE, ' [STATE_CODE] ') ELSE '' END)
		-- || NVL2(char(LAND_AREA), '', ' [LAND_AREA] ')
		-- || BVL(PROPERTY_COMPLETION_STATUS, ' [PROPERTY_COMPLETION_STATUS] ')
		-- || BVL(PROPERTY_TYPE_CODE, ' [PROPERTY_TYPE_CODE] ')
		-- || ' is/are empty.'						
	-- FROM MIG_CO009_PT
	-- WHERE (
		-- length(SECURITY_REF_NOTE)=0
     -- OR length(CUSTODIAN)=0
     -- OR SALE_PURCHASE_DATE is null
     -- OR length(MASTER_TITLE)=0
     -- OR length(TITLE_NUMBER_PREFIX)=0
     -- OR length(TITLE_NUMBER)=0
     -- OR length(LOT_NO)=0
     -- OR (length(POST_CODE)>0 and length(STATE_CODE)=0)
     -- OR length(LAND_AREA)=0
     -- OR length(PROPERTY_COMPLETION_STATUS)=0
     -- OR length(PROPERTY_TYPE_CODE)=0
    -- ));
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, ''MAN001'',
		''[L] Mandatory Field(s): ''
		||(CASE WHEN length(POST_CODE)>0 THEN BVL(STATE_CODE, '' [STATE_CODE] '') ELSE '''' END)
		|| BVL(PROPERTY_COMPLETION_STATUS, '' [PROPERTY_COMPLETION_STATUS] '')
		|| '' is/are empty.''						
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pt.IS_VALID = ''Y''
	AND (
		(length(POST_CODE)>0 and length(STATE_CODE)=0)
     		OR length(PROPERTY_COMPLETION_STATUS)=0
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');			
	
    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 2);
	commit;
    
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, ''MAN002'',
		''[L] Mandatory Field(s): ''
		|| BVL(SECURITY_REF_NOTE, '' [SECURITY_REF_NOTE] '')
		|| BVL(CUSTODIAN, '' [CUSTODIAN] '')
		|| NVL2(char(SALE_PURCHASE_DATE), '''', '' [SALE_PURCHASE_DATE] '')		
		|| BVL(MASTER_TITLE, '' [MASTER_TITLE] '')
		|| BVL(TITLE_NUMBER_PREFIX, '' [TITLE_NUMBER_PREFIX] '')
		|| BVL(TITLE_NUMBER, '' [TITLE_NUMBER] '')
		|| BVL(PROPERTY_TYPE_CODE, '' [PROPERTY_TYPE_CODE] '')
		|| BVL(TENURE_UNIT, '' [TENURE_UNIT] '')
		|| '' is/are empty.''						
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pt.IS_VALID = ''Y''
	AND (
		length(SECURITY_REF_NOTE)=0
     OR length(CUSTODIAN)=0
     OR SALE_PURCHASE_DATE is null
     OR length(MASTER_TITLE)=0
     OR length(TITLE_NUMBER_PREFIX)=0
     OR length(TITLE_NUMBER)=0
     OR length(PROPERTY_TYPE_CODE)=0
     OR length(TENURE_UNIT) = 0
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');			
	
    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 3);
	commit;
    
	
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
	-- INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO009', SECURITY_ID, 'COM001',
			-- '[M] Non Existence Common Code: ' 
			-- || (CASE WHEN length(LOT_NO)>0 THEN GET_INVALID_COMMON_CODE_MSG('LOT_NO', LOT_NO, LOT_NO_CAT) ELSE '' END)
			-- || GET_INVALID_COMMON_CODE_MSG('PROPERTY_TYPE_CODE', PROPERTY_TYPE_CODE, PROPERTY_TYPE_CAT)
			-- || GET_INVALID_COMMON_CODE_MSG(''COLLATERAL_STATUS'', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	-- FROM MIG_CO009_PT
       	-- WHERE ( 
            -- (length(LOT_NO)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOT_NO_CAT and entry_code = LOT_NO fetch first row only)) 
         -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_TYPE_CAT and entry_code = PROPERTY_TYPE_CODE fetch first row only)) 
		 -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS fetch first row only)) 
      	-- ));
    
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, ''COM001'',
			''[M] Non Existence Common Code: '' 
			|| (CASE WHEN length(LOT_NO)>0 THEN GET_INVALID_COMMON_CODE_MSG(''LOT_NO'', LOT_NO, LOT_NO_CAT) ELSE '''' END)
			|| GET_INVALID_COMMON_CODE_MSG(''PROPERTY_TYPE_CODE'', PROPERTY_TYPE_CODE, PROPERTY_TYPE_CAT)
			|| GET_INVALID_COMMON_CODE_MSG(''COLLATERAL_STATUS'', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pt.IS_VALID = ''Y''
	AND ( 
            (length(LOT_NO)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOT_NO_CAT and entry_code = LOT_NO fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_TYPE_CAT and entry_code = PROPERTY_TYPE_CODE fetch first row only)) 
		 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS fetch first row only)) 
      	)) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');			

    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 4);
	commit;

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, ''TENERR'',
			''[L] Tenure is 0 when Tenure Unit is leasehold for Security ID ['' || pt.SECURITY_ID || '']''
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pt.IS_VALID = ''Y''
	AND ( 
            TENURE = 0 and TENURE_UNIT = ''L''
      	)) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');			

    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 5);
	commit;
    
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, ''SNPCMV'',
			''[L] No Sales and Purchase Price or CMV for Security ID.''
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
	AND pt.IS_VALID = ''Y''
	AND pt.SALE_PURCHASE_AGREEMENT_VALUE = 0 		 
	AND EXISTS (SELECT 1 FROM MIG_CO015_VL val 
                where pt.SECURITY_ID = val.SECURITY_ID 
                and val.CMV = 0)) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');	

    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 6);
	commit;

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID,
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, 
		pt.PROPERTY_ADDRESS, pt.PROPERTY_ADDRESS_2, pt.PROPERTY_ADDRESS_3, ''MUDIS'', ''[L] Mukim and District is empty.''
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt      
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
		AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pt.IS_VALID = ''Y''
	) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, key14_value, key15_value, error_code, error_msg)');			

    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 7);
	commit;
    
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pt.SECURITY_ID, pt.LOC_ORG_CODE, pt.SOURCE_SECURITY_SUB_TYPE, pt.CMS_SECURITY_SUBTYPE_ID, ''PTPHP'',
			''[L] Property being pledged under HP Loans for Security ID ['' || pt.SECURITY_ID || '']''
	FROM MIG_CO009_PT pt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pt.IS_VALID = ''Y''
        AND pl.APPLICATION_TYPE = ''HP''
      	) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)');			

	DROP INDEX IDX_CLUP1;
	DROP INDEX IDX_CLUP2;
	DROP INDEX IDX_CLUP3;
	DROP INDEX IDX_CLUP4;
	DROP INDEX IDX_CLUP5;

    	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 0);
	commit;
    
END
@

CREATE PROCEDURE MIG_CLEANUP_CO010_GT
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO010', 'SIBS', 1);
    
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO010', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), gt.SECURITY_ID, gt.LOC_ORG_CODE, gt.SOURCE_SECURITY_SUB_TYPE, gt.CMS_SECURITY_SUBTYPE_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		-- || NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| ' is/are empty.'						
	FROM MIG_CO010_GT gt, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE gt.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND gt.IS_VALID = 'Y'
	AND (
		length(SECURITY_REF_NOTE)=0
        -- OR SECURITY_PERFECTION_DATE is null
    ));

    CALL LOG_PROC_TIME('MIG_CLEANUP_CO010', 'SIBS', 0);
	commit;
    
END
@	

CREATE PROCEDURE MIG_CLEANUP_CO011_OT
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO011_OT', 'SIBS', 1);
	
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO011', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ot.SECURITY_ID, ot.LOC_ORG_CODE, ot.SOURCE_SECURITY_SUB_TYPE, ot.CMS_SECURITY_SUBTYPE_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| ' is/are empty.'						
	FROM MIG_CO011_OT ot, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ot.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ot.IS_VALID = 'Y'
	AND (
		length(SECURITY_REF_NOTE)=0
    ));
	
    CALL LOG_PROC_TIME('MIG_CLEANUP_CO011_OT', 'SIBS', 0);
	commit;
    
END
@	

CREATE PROCEDURE MIG_CLEANUP_CO012_IN
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO012_IN', 'SIBS', 1);	

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO012', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), ins.SECURITY_ID, ins.LOC_ORG_CODE, ins.SOURCE_SECURITY_SUB_TYPE, ins.CMS_SECURITY_SUBTYPE_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| ' is/are empty.'						
	FROM MIG_CO012_IN ins, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE ins.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND ins.IS_VALID = 'Y'
	AND (
		length(SECURITY_REF_NOTE)=0
    ));	
	
    CALL LOG_PROC_TIME('MIG_CLEANUP_CO012_IN', 'SIBS', 0);
	commit;
	
END
@	


CREATE PROCEDURE MIG_CLEANUP_CO014_CL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO014_CL', 'SIBS', 1);	
	
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO014', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cl.SECURITY_ID, cl.LOC_ORG_CODE, cl.SOURCE_SECURITY_SUB_TYPE, cl.CMS_SECURITY_SUBTYPE_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| ' is/are empty.'						
	FROM MIG_CO014_CL cl, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cl.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cl.IS_VALID = 'Y'
	AND (
		length(SECURITY_REF_NOTE) = 0
    ));	
	
    CALL LOG_PROC_TIME('MIG_CLEANUP_CO014_CL', 'SIBS', 0);	
	commit;
	
END@	

/* ----------------------------------------------- Start of Collateral Related Information ---------------------------------------- */

-- Added by KLYong
CREATE PROCEDURE MIG_CLEANUP_CO015_VL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO015_VL', 'SIBS', 1);
	
	-- INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO015', SECURITY_ID, 'MAN001',
		-- '[L] Mandatory Field(s): '
		-- || NVL2(char(VALUATION_DATE), '', ' [VALUATION_DATE] ')
		-- || (CASE WHEN length(APPRAISAL_VALUE)>0 THEN NVL2(char(APPRAISAL_VALUE_DATE), '', ' [APPRAISAL_VALUE_DATE] ') ELSE '' END)		-- Conditional mandatory
		-- || ' is/are empty.'						
	-- FROM MIG_CO015_VL
	-- WHERE (
        -- VALUATION_DATE is null
    -- OR (length(APPRAISAL_VALUE)>0 and APPRAISAL_VALUE_DATE is null)
    -- ));
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO015_VL', 'SIBS', 0);
	
END@		


CREATE PROCEDURE MIG_CLEANUP_CO016_IN
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO016_IN', 'SIBS', 1);
		
	-- INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO016', SECURITY_ID, POLICY_NUMBER, 'MAN001',
		-- '[L] Mandatory Field(s): '
		-- || BVL(INSURER_NAME_CODE, ' [INSURER_NAME_CODE] ')
		-- || BVL(INSURANCE_TYPE_CODE, ' [INSURANCE_TYPE_CODE] ')
		-- || NVL2(char(EFFECTIVE_DATE), '', ' [EFFECTIVE_DATE] ')
		-- || BVL(BANK_CUST_ARRANGE_INS_IND, ' [BANK_CUST_ARRANGE_INS_IND] ')
		-- || NVL2(char(INS_ISSUE_DATE), '', ' [INS_ISSUE_DATE] ')
		-- || (CASE WHEN AUTO_DEBIT='Y' THEN NVL2(char(DEBITING_ACC_NO), '', ' [DEBITING_ACC_NO] ') ELSE '' END)	
		-- || (CASE WHEN AUTO_DEBIT='Y' THEN BVL(ACC_TYPE_CODE, ' [ACC_TYPE_CODE] ') ELSE '' END)				
		-- || ' is/are empty.'						
	-- FROM MIG_CO016_IN
	-- WHERE (
        -- length(INSURER_NAME_CODE)=0
     -- OR length(INSURANCE_TYPE_CODE)=0
     -- OR EFFECTIVE_DATE is null
     -- OR length(BANK_CUST_ARRANGE_INS_IND)=0
     -- OR INS_ISSUE_DATE is null
     -- OR (AUTO_DEBIT='Y' and length(DEBITING_ACC_NO)=0)		
     -- OR (AUTO_DEBIT='Y' and length(ACC_TYPE_CODE)=0)			
    -- ));
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO016'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
		lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), inp.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
		POLICY_NUMBER, ''MAN001'',
		''[L] Mandatory Field(s): ''
		|| BVL(INSURER_NAME_CODE, '' [INSURER_NAME_CODE] '')
		|| BVL(INSURANCE_TYPE_CODE, '' [INSURANCE_TYPE_CODE] '')
		|| NVL2(char(EFFECTIVE_DATE), '''', '' [EFFECTIVE_DATE] '')
		|| BVL(BANK_CUST_ARRANGE_INS_IND, '' [BANK_CUST_ARRANGE_INS_IND] '')
		|| NVL2(char(INS_ISSUE_DATE), '''', '' [INS_ISSUE_DATE] '')
		|| NVL2(char(INSURED_AMT), '', '' [INSURED_AMT] '')
		-- || (CASE WHEN AUTO_DEBIT=''Y'' THEN NVL2(char(DEBITING_ACC_NO), '''', '' [DEBITING_ACC_NO] '') ELSE '''' END)	
		-- || (CASE WHEN AUTO_DEBIT=''Y'' THEN BVL(ACC_TYPE_CODE, '' [ACC_TYPE_CODE] '') ELSE '''' END)				
		|| '' is/are empty.''						
	FROM MIG_CO016_IN inp, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE inp.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND inp.IS_VALID = ''Y''
	AND (
        length(INSURER_NAME_CODE)=0
     OR length(INSURANCE_TYPE_CODE)=0
     OR EFFECTIVE_DATE is null
     OR length(BANK_CUST_ARRANGE_INS_IND)=0
     OR INS_ISSUE_DATE is null
	 OR INSURED_AMT <= 0
     -- OR (AUTO_DEBIT=''Y'' and length(DEBITING_ACC_NO)=0)		
     -- OR (AUTO_DEBIT=''Y'' and length(ACC_TYPE_CODE)=0)			
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');		
	commit;
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO016_IN', 'SIBS', 2);
	commit;
	
	-----------------------------------------
	-- Check against common code
	-- COMMON_CODE_CATEGORY_ENTRY
	-----------------------------------------			
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO016', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), inp.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			POLICY_NUMBER, 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| (CASE WHEN length(INSURER_NAME_CODE)>0 THEN GET_INVALID_COMMON_CODE_MSG('INSURER_NAME_CODE', INSURER_NAME_CODE, INSURER_NAME_CAT) ELSE '' END) 	--Remarked to skip checking
			|| GET_INVALID_COMMON_CODE_MSG('INSURANCE_TYPE_CODE', INSURANCE_TYPE_CODE, INSURANCE_TYPE_CAT)
			-- || (CASE WHEN length(POLICY_CUSTODIAN_CODE)>0 THEN GET_INVALID_COMMON_CODE_MSG('POLICY_CUSTODIAN_CODE', POLICY_CUSTODIAN_CODE, POLICY_CUSTODIAN_CAT) ELSE '' END)
			|| (CASE WHEN AUTO_DEBIT = 'Y' THEN GET_INVALID_COMMON_CODE_MSG('ACC_TYPE_CODE', ACC_TYPE_CODE, ACC_TYPE_CAT) ELSE '' END)
	FROM MIG_CO016_IN inp, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE inp.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND inp.IS_VALID = 'Y'
	AND ( 
			(length(INSURER_NAME_CODE) >0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSURER_NAME_CAT and entry_code = INSURER_NAME_CODE fetch first row only))  	--Remarked to skip checking
		 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSURANCE_TYPE_CAT and entry_code = INSURANCE_TYPE_CODE fetch first row only)) 
    	 -- OR (length(POLICY_CUSTODIAN_CODE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = POLICY_CUSTODIAN_CAT and entry_code = POLICY_CUSTODIAN_CODE fetch first row only)) 
    	 OR (AUTO_DEBIT='Y' and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ACC_TYPE_CAT and entry_code = ACC_TYPE_CODE fetch first row only)) 
      	));	

	CALL LOG_PROC_TIME('MIG_CLEANUP_CO016_IN', 'SIBS', 0);
	commit;
	
END@					


CREATE PROCEDURE MIG_CLEANUP_CO017_CD
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 1);	

	-- INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'MAN001', 
		-- '[L] Mandatory Field(s): '
		-- || NVL2(char(DATE_LEGALLY_CHARGE), '', ' [DATE_LEGALLY_CHARGE] ')
		-- || ' is/are empty.'						
	-- FROM MIG_CO017_CD
	-- WHERE (
        -- DATE_LEGALLY_CHARGE is null
    -- ));		

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO017'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			TRIM(CHAR(RANKING_OF_SECURITY)), ''MAN001'', 
		''[L] Mandatory Field(s): ''
		|| NVL2(char(DATE_LEGALLY_CHARGE), '''', '' [DATE_LEGALLY_CHARGE] '')
		|| '' is/are empty.''						
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = ''Y''
	AND (
        cd.DATE_LEGALLY_CHARGE is null
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');			
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 2);
	commit;

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO017'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			TRIM(CHAR(RANKING_OF_SECURITY)), ''RANK001'', 
		''[L] Security Rank = 0.''
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = ''Y''
	AND (cd.RANKING_OF_SECURITY = 0
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');			
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 3);
	commit;

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO017'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			TRIM(CHAR(RANKING_OF_SECURITY)), ''RANK002'', 
		''[L] Security Rank > 10 and ranking does not start with either 1 or 3.''
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = ''Y''
	AND (cd.RANKING_OF_SECURITY > 10 and (SUBSTR(char(cd.RANKING_OF_SECURITY), 1, 2) not like ''1%'' and SUBSTR(char(cd.RANKING_OF_SECURITY), 1, 2) not like ''3%'')
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');			
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 4);
	commit;
	
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			cd.RANKING_OF_SECURITY, 'RANK003', 
		'[L] Security Rank >= 10 and ranking must start with either 1 or 3.'
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = 'Y'
		and cd.RANKING_OF_SECURITY > 0 
		and cd.RANKING_OF_SECURITY between (10) and (30));	
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 5);
	commit;		
	
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			cd.RANKING_OF_SECURITY, 'RANK004', 
		'[L] Security Rank is either 10 or 30.'
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = 'Y'
		AND (cd.RANKING_OF_SECURITY = 10 
			or cd.RANKING_OF_SECURITY = 30));	
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 6);
	commit;	

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			cd.RANKING_OF_SECURITY, 'RANKPTY', 
		'[L] First and third party charge was neither 1 or 3.'
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = 'Y'
		AND cd.FIRST_THIRD_PARTY_CHARGE not in ('1', '3'));	
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 7);
	commit;		
	
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 'FACCDSEQ', 
		'[L] Facility code or facility sequence is empty.'
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = 'Y'
		and (cd.FACILITY_CODE = '' or length(cd.FACILITY_SEQ) = 0));
		
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 8);
	commit;	

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), cd.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			cd.CHARGE_AMT, lmt.LIMIT_AMT, 'CHGLMT', 
		'[L] Charge amount is greater than facility amount/approved limit.'
	FROM MIG_CO017_CD cd, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE cd.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND cd.IS_VALID = 'Y'
		AND cd.CHARGE_AMT > lmt.LIMIT_AMT);			
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO017_CD', 'SIBS', 0);
	commit;
	
END@	


CREATE PROCEDURE MIG_CLEANUP_CO018_PG
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO018_PG', 'SIBS', 1);
	commit;
	
	-- INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO018', SECURITY_ID, PLEDGOR_CIF_ID, 'MAN001',
		-- '[L] Mandatory Field(s): '
		-- || BVL(REL_WITH_BORROWER_CODE, ' [REL_WITH_BORROWER_CODE] ')
		-- || BVL(REL_WITH_BORROWER_DESC, ' [REL_WITH_BORROWER_DESC] ')
		-- || ' is/are empty.'						
	-- FROM MIG_CO018_PG
	-- WHERE (
        -- length(REL_WITH_BORROWER_CODE)=0
     -- OR length(REL_WITH_BORROWER_DESC)=0    
    -- ));	

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CURRENT_TIMESTAMP, ''SIBS'', ''CO018'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pg.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			PLEDGOR_CIF_ID, ''MAN001'',
		''[L] Mandatory Field(s): ''
		|| BVL(REL_WITH_BORROWER_CODE, '' [REL_WITH_BORROWER_CODE] '')
		|| BVL(REL_WITH_BORROWER_DESC, '' [REL_WITH_BORROWER_DESC] '')
		|| '' is/are empty.''						
	FROM MIG_CO018_PG pg, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pg.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND (pg.IS_VALID = ''Y'' OR pg.IS_VALID_2 = ''Y'')
	AND (
        length(REL_WITH_BORROWER_CODE)=0
     OR length(REL_WITH_BORROWER_DESC)=0    
    )) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');			
	
	commit;
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO018_PG', 'SIBS', 2);
	commit;
	
	-----------------------------------------
	-- Relationship with Borrower Code 
	-- COMMON_CODE_CATEGORY_ENTRY
	-----------------------------------------
	-- INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	-- (select current_timestamp, 'SIBS', 'CO018',  SECURITY_ID, PLEDGOR_CIF_ID, 'COM001', 
			-- '[M] Non Existence Common Code: ' 
			-- || GET_INVALID_COMMON_CODE_MSG('REL_WITH_BORROWER_CODE', REL_WITH_BORROWER_CODE, REL_WITH_BORROWER_CAT)
	-- FROM MIG_CO018_PG
       	-- WHERE ( 
    	    -- (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REL_WITH_BORROWER_CAT and entry_code = REL_WITH_BORROWER_CODE fetch first row only)) 
      	-- ));	
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(select current_timestamp, ''SIBS'', ''CO018'',  pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pg.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			PLEDGOR_CIF_ID, ''COM001'', 
			''[M] Non Existence Common Code: ''
			|| GET_INVALID_COMMON_CODE_MSG(''REL_WITH_BORROWER_CODE'', REL_WITH_BORROWER_CODE, REL_WITH_BORROWER_CAT)
	FROM MIG_CO018_PG pg, MIG_CO019_PL pl, MIG_CA003_1 lmt     
	WHERE pg.SECURITY_ID = pl.SECURITY_ID 
	AND pl.LIMIT_ID = lmt.LIMIT_ID 
        AND (pg.IS_VALID = ''Y'' OR pg.IS_VALID_2 = ''Y'')
	AND ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REL_WITH_BORROWER_CAT and entry_code = REL_WITH_BORROWER_CODE fetch first row only)) 
      	)) OF CURSOR 
	INSERT INTO MIG_DATA_CLEANUP (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, key11_value, key12_value, key13_value, error_code, error_msg)');			
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO018_PG', 'SIBS', 0);
	commit;
	
END
@	

CREATE PROCEDURE MIG_CLEANUP_CO019_PL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO019_PL', 'SIBS', 1);

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
		key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pl.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			pl.AMOUNT_DRAW, pl.PERCENT_DRAW, 'DRAWAMT',
		'[L] Draw : Both Amount and percentage have value. '
	FROM MIG_CO019_PL pl, MIG_CA003_1 lmt
	WHERE pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pl.IS_VALID = 'Y'
	AND AMOUNT_DRAW > 0  and PERCENT_DRAW > 0);
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO019_PL', 'SIBS', 2);
	COMMIT;

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pl.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			pl.AMOUNT_DRAW, pl.PERCENT_DRAW, 'PLEDAMT',
		'[L] Pledge : Both Amount and percentage have value. '
	FROM MIG_CO019_PL pl, MIG_CA003_1 lmt
	WHERE pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pl.IS_VALID = 'Y'
	AND AMOUNT_PLEDGED > 0  and PERCENT_PLEDGED > 0);
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO019_PL', 'SIBS', 3);
	COMMIT;

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pl.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			pl.AMOUNT_PLEDGED, pl.PERCENT_PLEDGED, 'PLEDAMT',
		'[L] Same collateral using different field for pledge amount under different pledge. '
	FROM MIG_CO019_PL pl, MIG_CA003_1 lmt
	WHERE pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pl.IS_VALID = 'Y'
	AND SECURITY_ID in ( select SECURITY_ID from MIG_CO019_PL 
						group by SECURITY_ID having max(AMOUNT_PLEDGED) > 0 and max(PERCENT_PLEDGED) > 0 and count(SECURITY_ID) > 1));
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO019_PL', 'SIBS', 4);
	COMMIT;

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, key13_value, key14_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pl.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 
			pl.AMOUNT_PLEDGED, pl.PERCENT_PLEDGED, 'PLEDAMT',
		'[L] Same collateral using different field for draw amount under different pledge. '
	FROM MIG_CO019_PL pl, MIG_CA003_1 lmt
	WHERE pl.LIMIT_ID = lmt.LIMIT_ID 
        AND pl.IS_VALID = 'Y'
	AND SECURITY_ID in ( select SECURITY_ID from MIG_CO019_PL 
						group by SECURITY_ID having max(AMOUNT_DRAW) > 0 and max(PERCENT_DRAW) > 0 and count(SECURITY_ID) > 1));
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO019_PL', 'SIBS', 5);
	COMMIT;

	INSERT INTO MIG_DATA_CLEANUP(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, key6_value, key7_value, key8_value, key9_value, key10_value, 
			key11_value, key12_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, 
			lmt.FACILITY_CODE, trim(char(lmt.FACILITY_SEQ)), pl.SECURITY_ID, pl.LOC_ORG_CODE, pl.SOURCE_SECURITY_SUB_TYPE, pl.CMS_SECURITY_SUBTYPE_ID, 'PLEDMULCL',
		'[L] Customer pledged to multiple clean collateral. '
	FROM MIG_CO019_PL pl, MIG_CA003_1 lmt, MIG_CO014_CL cl
	WHERE pl.LIMIT_ID = lmt.LIMIT_ID 
		AND pl.SECURITY_ID = cl.SECURITY_ID 
        AND pl.IS_VALID = 'Y'
		AND pl.CIF_ID in ( select pl1.CIF_ID from MIG_CO019_PL pl1, MIG_CO014_CL cl1     
		                    where pl1.SECURITY_ID = cl1.SECURITY_ID     
		                    group by pl1.CIF_ID     
		                    having count(pl1.CIF_ID) > 1));	
	
	CALL LOG_PROC_TIME('MIG_CLEANUP_CO019_PL', 'SIBS', 0);
	COMMIT;
	
END@
