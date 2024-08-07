-- SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, CMS_LOCAL@

DROP PROCEDURE SI_VALIDATE_TEMP_OTHR_PF004@
DROP PROCEDURE SI_VALIDATE_TEMP_OTHR_PF003@
DROP PROCEDURE SI_VALIDATE_TEMP_INSR_POLICY@


  ----------------------------------------
  -- Validation for Hire & Purchase of Vehicle
  -- PF004
  --
  ----------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_OTHR_PF004
  LANGUAGE SQL
BEGIN 
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_OTHR_PF004', '', 1);
  commit;

  -----------------------------------------
  -- Check for MANDATORY records
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF004
  SET IS_VALID = 'N'
  WHERE length(trim(CAR_MAKE))=0
  OR length(trim(CAR_MODEL))=0
  OR length(CAR_YEAR)=0
  OR length(CAR_FSV)=0;
  commit;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value,  error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF004', REGION , CAR_MAKE, CAR_MODEL, NVL2(char(CAR_YEAR), '', char(CAR_YEAR)), NVL2(char(CAR_FSV), '', char(CAR_FSV)), 'TechErrSI002',
    '[L] Mandatory Field(s): '
    || SI_BVL(CAR_MAKE, ' [CAR_MAKE] ')         || ', '
    || SI_BVL(CAR_MODEL, ' [CAR_MODEL] ')       || ', '
    || NVL2(char(CAR_YEAR), '', ' [CAR_YEAR] ') || ', '
    || NVL2(char(CAR_FSV), '', ' [CAR_FSV] ')   || ', '
    || ' is/are empty.'        
  FROM SI_TEMP_OTHR_PF004
  WHERE IS_VALID = 'N');
  commit;


  -----------------------------------------
  -- Excluede trailer data
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF004 SET IS_VALID = 'N'
  WHERE IS_VALID = 'Y'
  	AND CAR_MAKE like '%Total Number of Records%';
  commit;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value,  error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF004', REGION , CAR_MAKE, CAR_MODEL, NVL2(char(CAR_YEAR), '', char(CAR_YEAR)), NVL2(char(CAR_FSV), '', char(CAR_FSV)), 'TechErrSI002',
    'Trailer data is not required.'   
  FROM SI_TEMP_OTHR_PF004
  WHERE IS_VALID = 'N'
  	AND CAR_MAKE like '%Total Number of Records%');
  commit;
  

  -----------------------------------------
  -- Check for valid value for CAR_FSV
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF004 SET IS_VALID = 'N'
  WHERE IS_VALID = 'Y'
  	AND CAR_FSV = -9999999999.99;
  commit;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value,  error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF004', REGION , CAR_MAKE, CAR_MODEL, NVL2(char(CAR_YEAR), '', char(CAR_YEAR)), NVL2(char(CAR_FSV), '', char(CAR_FSV)), 'TechErrSI002',
    'Invalid / Empty Valuation FSV : '
    || char(CAR_FSV)     
  FROM SI_TEMP_OTHR_PF004
  WHERE IS_VALID = 'N'
  	AND CAR_FSV = -9999999999.99);
  commit;
  

  -----------------------------------------
  -- Check for duplicate records
  --
  --where ( trim(a.REGION)||trim(a.CAR_MAKE)||trim(a.CAR_MODEL)||trim(char(a.CAR_YEAR)) ) 
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF004 a
  set is_valid = 'N'
  where a.COMPOSITE_ID in (select t.COMPOSITE_ID
      from SI_TEMP_OTHR_PF004 t
    	group by t.COMPOSITE_ID
    	having count(*) > 1)
  and a.is_valid = 'Y';
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, '', 'PF004', COMPOSITE_ID, 'BizErr004', 
    '[M] Duplicate vehicle price for composite id [' 
    || COMPOSITE_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_OTHR_PF004
  where is_valid = 'N'
  group by COMPOSITE_ID
  having count(*) > 1);
  commit;
  
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_OTHR_PF004', '', 0);
  commit;

END
@


  ----------------------------------------
  -- Validation for Property Valuation Feed
  -- PF003
  --
  ----------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_OTHR_PF003
  LANGUAGE SQL
BEGIN 
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_OTHR_PF003', '', 1);
  commit;

  -----------------------------------------
  -- Check for MANDATORY records
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF003
  SET IS_VALID = 'N'
  WHERE 
  -- length(trim(CIF_ID))=0
  -- OR length(trim(SOURCE_SECURITY_ID))=0
  -- OR length(trim(VALUER_NAME))=0
  -- OR 
  length(trim(VALUER_CODE))=0
  OR length(OMV)=0
  OR length(FSV)=0
  OR length(RESERVED_PRICE)=0
  OR length(CMS_COLLATERAL_ID)=0;
  commit;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI002',
    '[L] Mandatory Field(s): '
    -- || SI_BVL(CIF_ID, ' [CIF_ID] ')         				|| ', '
    -- || SI_BVL(SOURCE_SECURITY_ID, ' [SOURCE_SECURITY_ID] ')     	|| ', '
    -- || SI_BVL(VALUER_NAME, ' [VALUER_NAME] ')         			|| ', '	   
    || SI_BVL(VALUER_CODE, ' [VALUER_CODE] ')         			|| ', '
    || NVL2(char(OMV), '', ' [OMV] ') 					|| ', '
    || NVL2(char(FSV), '', ' [FSV] ')   				|| ', '
    || NVL2(char(RESERVED_PRICE), '', ' [RESERVED_PRICE] ')   		|| ', '
    || NVL2(char(CMS_COLLATERAL_ID), '', ' [CMS_COLLATERAL_ID] ')   	|| ', '
    || ' is/are empty.'        
  FROM SI_TEMP_OTHR_PF003
  WHERE IS_VALID = 'N');
  commit;
  
  
  -----------------------------------------
  -- Check for MANDATORY records (at least OMV / FSV /RESERVED_PRICE must have valid value)
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF003 SET IS_VALID = 'N'
  WHERE IS_VALID = 'Y'
  	AND OMV = -9999999999.99
  	AND FSV = -9999999999.99
  	AND RESERVED_PRICE = -9999999999.99;
  commit;
  
  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI002',
    'Either OMV, FSV or RESERVED_PRICE need to be provided. '      
  FROM SI_TEMP_OTHR_PF003
  WHERE IS_VALID = 'N'
  	AND OMV = -9999999999.99
  	AND FSV = -9999999999.99
  	AND RESERVED_PRICE = -9999999999.99);  
  commit;  
  
  
  -----------------------------------------
  -- Check for MANDATORY records (CMS_COLLATERAL_ID must have valid value)
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF003 SET IS_VALID = 'N'
  WHERE IS_VALID = 'Y'
  	AND CMS_COLLATERAL_ID = -9999999999.99;
  commit;
  
  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI002',
    'Invalid CMS Collateral ID. '      
  FROM SI_TEMP_OTHR_PF003
  WHERE IS_VALID = 'N'
  	AND CMS_COLLATERAL_ID = -9999999999.99);  
  commit;   
  
  
  -----------------------------------------
  -- Check for CMS_COLLATERAL_ID + SOURCE_SECURITY_ID is valid
  --
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF003 t SET t.IS_VALID = 'N'
  WHERE t.IS_VALID = 'Y'
  	AND NOT EXISTS (SELECT 1 FROM CMS_SECURITY sec
  			WHERE t.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
  			--AND t.SOURCE_SECURITY_ID = sec.SCI_SECURITY_DTL_ID
  			);
  commit;
  
  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI003',
    'CMS Collateral ID or Source Security ID not exists in the database. '      
  FROM SI_TEMP_OTHR_PF003 t
  WHERE IS_VALID = 'N'
  	AND NOT EXISTS (SELECT 1 FROM CMS_SECURITY sec
  			WHERE t.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
  			--AND t.SOURCE_SECURITY_ID = sec.SCI_SECURITY_DTL_ID
  			));  
  commit;    

  
  -----------------------------------------
  -- Check for common code [VALUER]
  --
  -----------------------------------------  
  UPDATE SI_TEMP_OTHR_PF003 a SET IS_VALID = 'N'
  WHERE IS_VALID = 'Y'
  AND NOT EXISTS (SELECT 1
  			FROM COMMON_CODE_CATEGORY_ENTRY
			WHERE CATEGORY_CODE = 'VALUER'
			AND ENTRY_CODE = VALUER_CODE
			AND ACTIVE_STATUS = '1');

  COMMIT;  
  
  
  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI002',
    'Invalid [Valuer Code] : '
    || SI_BVL(VALUER_CODE, ' [VALUER_CODE] ')       
  FROM SI_TEMP_OTHR_PF003
  WHERE IS_VALID = 'N'
  	AND NOT EXISTS (SELECT 1
			FROM COMMON_CODE_CATEGORY_ENTRY
			WHERE CATEGORY_CODE = 'VALUER'
			AND ENTRY_CODE = VALUER_CODE
			AND ACTIVE_STATUS = '1'));
  commit;  
  
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_OTHR_PF003', '', 2);
  commit;  
  

  -----------------------------------------
  -- Check for duplicate  records
  --
  --where ( trim(a.CIF_ID)||trim(a.CMS_COLLATERAL_ID) ) 
  -----------------------------------------
  UPDATE SI_TEMP_OTHR_PF003 a
  set is_valid = 'N'
  where a.COMPOSITE_ID in (select t.COMPOSITE_ID
      from SI_TEMP_OTHR_PF003 t
    	group by t.COMPOSITE_ID
    	having count(*) > 1)
  and a.is_valid = 'Y';
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, '', 'PF003', COMPOSITE_ID, 'BizErr004', 
    '[M] Duplicate property valuation feed for composite id [' 
    || COMPOSITE_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_OTHR_PF003
  where is_valid = 'N'
  group by COMPOSITE_ID
  having count(*) > 1);
  commit;
  
  
  -----------------------------------------
  -- Check valid value for HAIRCUT
  --
  -----------------------------------------  

  UPDATE SI_TEMP_OTHR_PF003 a
  set (HAIRCUT, VALUATION_FREQ, VALUATION_FREQ_UNIT) = 
  (select param.THRESHOLD_PERCENT, param.VALUATION_FREQUENCY, param.VALUATION_FREQUENCY_UNIT
	from CMS_SECURITY sec, CMS_SECURITY_PARAMETER param
	WHERE sec.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
	AND sec.SECURITY_SUB_TYPE_ID = param.SECURITY_SUB_TYPE_ID
	AND param.COUNTRY_ISO_CODE = 'MY'
	AND param.STATUS = 'ACTIVE'
	fetch first 1 row only)
  WHERE a.is_valid = 'Y';
  commit;
    
  UPDATE SI_TEMP_OTHR_PF003 a
  set is_valid = 'N'
  where a.HAIRCUT is null
  and (OMV = -9999999999.99
  	OR FSV = -9999999999.99)
  and a.is_valid = 'Y';
  commit;  
  
  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI003',
    'HAIRCUT value that required for OMV or FSV derivation is not found. '    
  FROM SI_TEMP_OTHR_PF003 a
  WHERE IS_VALID = 'N'
  	AND a.HAIRCUT is null
  	and (OMV = -9999999999.99
  		OR FSV = -9999999999.99));
  commit;
  
  
  -----------------------------------------
  -- Check valid value for VALUATION_FREQ & VALUATION_FREQ_UNIT
  --
  -----------------------------------------  
  UPDATE SI_TEMP_OTHR_PF003 a
  set is_valid = 'N'
  where (VALUATION_FREQ is null OR VALUATION_FREQ <= 0 
  		OR VALUATION_FREQ_UNIT is null OR TRIM(VALUATION_FREQ_UNIT) = '')
  	and a.is_valid = 'Y';
  commit; 
  
 INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, '', 'PF003', CIF_ID , SOURCE_SECURITY_ID, 
    COALESCE(char(CMS_COLLATERAL_ID), ''), 'TechErrSI003',
    'Valuation Frequency / Valuation Frequency Unit not found from Parameter setup '     
  FROM SI_TEMP_OTHR_PF003 a
  WHERE IS_VALID = 'N'
  	AND (VALUATION_FREQ is null OR VALUATION_FREQ <= 0 
  		OR VALUATION_FREQ_UNIT is null OR TRIM(VALUATION_FREQ_UNIT) = ''));
  commit;  
  
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_OTHR_PF003', '', 0);
  commit;

END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_INSR_POLICY
  LANGUAGE SQL
BEGIN 
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_INSR_POLICY', '', 1);
  commit;
  
  UPDATE si_temp_insr_policy a
  set is_valid = 'N'
  where (a.collateral_name, a.collateral_seq) in 
  	(select t.collateral_name, t.collateral_seq
       from si_temp_insr_policy t
      group by t.collateral_name, t.collateral_seq
   	 having count(*) > 1);
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (select current_timestamp, 'UNIASIA', 'INSRPOL', collateral_name, collateral_seq, 'BizErr004', 
    '[M] Duplicate insurance policy feed for collateral name [' || collateral_name || '] Seq [' || collateral_seq  || '] - ' 
    || trim(char(count(*))) || ' records found.'
  from si_temp_insr_policy
  where is_valid = 'N'
  group by collateral_name, collateral_seq
  having count(*) > 1);
  commit;
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_INSR_POLICY', '', 2);
  commit;

  UPDATE si_temp_insr_policy tmp SET IS_VALID = 'N'
   WHERE NOT EXISTS (SELECT 1 FROM cms_security sec, cms_insurance_policy insr
   					  WHERE sec.cms_collateral_id = insr.cms_collateral_id
   					    AND sec.sci_reference_note = tmp.collateral_name
   					    AND insr.policy_seq_no = tmp.collateral_seq)
    AND is_valid = 'Y';
  commit;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, 
  							key4_value, key5_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'UNIASIA', 'INSRPOL', collateral_name, collateral_seq, 
  		  application_num, facility_code, CHAR(facility_seq), 'BizErr003',
  		  '[H] Missing Insurance Policy [' || insr_policy_no || '] in the system for collateral name ['
  		  || collateral_name || '] Seq [' || collateral_seq  || ']'
     FROM si_temp_insr_policy tmp
    WHERE is_valid = 'N'
      AND NOT EXISTS (SELECT 1 FROM cms_security sec, cms_insurance_policy insr
   					  WHERE sec.cms_collateral_id = insr.cms_collateral_id
   					    AND sec.sci_reference_note = tmp.collateral_name
   					    AND insr.policy_seq_no = tmp.collateral_seq));
   					  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_INSR_POLICY', '', 0);

END
@

commit work@