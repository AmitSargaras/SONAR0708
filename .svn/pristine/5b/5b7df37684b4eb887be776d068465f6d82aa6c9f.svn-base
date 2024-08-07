-------------------------------
-- DDL Statements for Triggers
-------------------------------


----------------------------------------
-- Triggers for Login
----------------------------------------
--/* CREATE TRIGGER CMS_LOGIN_TRG_IN
--   AFTER INSERT
--   ON CMS_AUTHENTICATION
--   REFERENCING NEW AS NEW
--   FOR EACH ROW
--   MODE DB2SQL
--   BEGIN ATOMIC
--      DECLARE LOGIN_ATTEMPTS BIGINT;--
--      SET LOGIN_ATTEMPTS = NEW.LOGIN_ATTEMPTS;--
--
--      IF (LOGIN_ATTEMPTS != 0) THEN
--         INSERT
--           INTO CMS_LOGIN_AUDIT (LOGIN_ID, LOGIN_TIME, LOGOUT_TIME, LOGIN_STATUS, NO_OF_ATTEMPTS)
--           					 VALUES (NEW.LOGIN_ID, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP , 'FAILED', NEW.LOGIN_ATTEMPTS);--
--      END IF;--
--
--   END;

   
--CREATE TRIGGER CMS_LOGIN_TRG_UP
--     AFTER UPDATE ON CMS_AUTHENTICATION
--     REFERENCING NEW AS new OLD AS old
--     FOR EACH ROW
--     MODE DB2SQL
--
--     BEGIN ATOMIC
--
--        if ( new.LAST_LOGIN_TIME != old.LAST_LOGIN_TIME ) then
--           INSERT
--             INTO CMS_LOGIN_AUDIT (LOGIN_ID, LOGIN_TIME, LOGIN_STATUS)
--                   VALUES (NEW.LOGIN_ID, NEW.last_login_time, 'SUCCESS');--
--        END IF;--
--
--         if ( new.LAST_LOGOUT_TIME != old.LAST_LOGOUT_TIME ) then
--           UPDATE CMS_LOGIN_AUDIT
--              SET LOGOUT_TIME = NEW.LAST_LOGOUT_TIME
--            WHERE LOGIN_STATUS = 'SUCCESS'
--              AND LOGIN_ID = NEW.LOGIN_ID
--              AND LOGIN_TIME = (SELECT MAX (LOGIN_TIME)
--                                  FROM CMS_LOGIN_AUDIT
--                                 WHERE LOGIN_STATUS = 'SUCCESS'
--           AND LOGIN_ID = NEW.LOGIN_ID);--
--        END IF;--
--     END; */

CREATE TRIGGER TRG_CMS_STOCK_EX_U
	   AFTER UPDATE
	   ON CMS_STOCK_EXCHANGE
	   REFERENCING OLD AS OLD
	               NEW AS NEW
	   FOR EACH ROW
	 BEGIN ATOMIC
	 				UPDATE CMS_FEED_GROUP 
	 					SET group_subtype = NEW.STOCK_EXCHANGE
	       			WHERE group_type = 'STOCK' AND group_subtype = OLD.STOCK_EXCHANGE;	--
   END;



----------------------------------------
-- Triggers for Nominees -> Earmark
----------------------------------------
   
-- delete old triggers if it still exist 
--DROP TRIGGER CMS_NOMINEES_INS ; 
--DROP TRIGGER CMS_NOMINEES_UPD ; 

-- new trigger
CREATE TRIGGER CMS_NOMINEES_INS
  AFTER INSERT
  ON  CMS_NOMINEES 
  REFERENCING NEW AS NEWROW
  FOR EACH ROW
BEGIN ATOMIC
    IF ( (SELECT COUNT(*) 
          FROM CMS_EARMARK_GROUP 
    WHERE CMS_EARMARK_GROUP.FEED_ID = NEWROW.FEED_ID
          AND CMS_EARMARK_GROUP.SOURCE_SYSTEM_ID = NEWROW.SOURCE_SYSTEM_ID) = 0 ) 
    THEN 
        INSERT INTO CMS_EARMARK_GROUP (EARMARK_GROUP_ID, FEED_ID, SOURCE_SYSTEM_ID, CMS_ACTUAL_HOLDING, LAST_BATCH_UPDATE , STATUS)
        VALUES ( format_key ( current timestamp , NEXT VALUE FOR CMS_EARMARK_GROUP_SEQ ) , NEWROW.FEED_ID, NEWROW.SOURCE_SYSTEM_ID, 0, CURRENT TIMESTAMP, 'ACTIVE');--
    ELSE 
        UPDATE CMS_EARMARK_GROUP 
        SET CMS_ACTUAL_HOLDING = 0, 
        LAST_BATCH_UPDATE = CURRENT TIMESTAMP 
        WHERE CMS_EARMARK_GROUP.FEED_ID = NEWROW.FEED_ID 
        AND CMS_EARMARK_GROUP.SOURCE_SYSTEM_ID = NEWROW.SOURCE_SYSTEM_ID;-- 
    END IF;-- 
END;

----------------------------------------
-- Triggers for CF Report
----------------------------------------
CREATE TRIGGER CMS_CF_ADV_TRG_INS
   AFTER INSERT
   ON CMS_CF_ADVANCE
   REFERENCING NEW AS NEW
   FOR EACH ROW
   MODE DB2SQL
   BEGIN ATOMIC    
      DECLARE FAC_TYPE          VARCHAR(5);--
      DECLARE FAC_MOA           DECIMAL(5,2);--
      DECLARE ADVANCE_CCY       CHAR(3);--
      DECLARE ADVANCE_AMT       DECIMAL(20,2);--
      DECLARE EXISTING_LMT_CUR  CHAR(3);--
      DECLARE EXISTING_LMT_AMT  DECIMAL(20,2);--
      DECLARE NEW_LIMIT         DECIMAL(20,2);--
      DECLARE ROW_ID            BIGINT;--      
            
      FOR RPT_FAC AS SELECT FACILITY_TYPE, MOA
                     FROM CMS_CF_FACILITY_TYPE
                     WHERE FACILITY_TYPE_ID = NEW.FACILITY_TYPE_ID      
      DO 
            SET FAC_TYPE = RPT_FAC.FACILITY_TYPE; --	
            SET FAC_MOA  = RPT_FAC.MOA;--
      END FOR;--
      
                           
      IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN
          
          SET ADVANCE_AMT = NEW.ACTUAL_ADVANCE_AMOUNT;--
          SET ADVANCE_CCY = NEW.ACTUAL_ADVANCE_CURRENCY;--

          --Set default values
          SET EXISTING_LMT_CUR = 'SGD'; --	
          SET EXISTING_LMT_AMT = 0;--
                                                        
           FOR RPT_REC AS SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                        FROM CMS_CF_REPORT_SG 
                        WHERE DATE = (SELECT MAX(DATE) 
                                      FROM CMS_CF_REPORT_SG 
                                      WHERE CONTRACT_ID = NEW.CONTRACT_ID)

            DO 
                SET EXISTING_LMT_CUR = RPT_REC.EXISTING_LMT_CCY; --	
                SET EXISTING_LMT_AMT = RPT_REC.NEW_CREDIT_LIMIT;--
            END FOR;--
                                                        
                                                        
          SET NEW_LIMIT = EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
                 
          SET ROW_ID = CAST(FORMAT_KEY(CURRENT TIMESTAMP, NEXT VALUE FOR CMS_CF_REPORT_SG_SEQ) AS BIGINT);--
                                      
          IF((FAC_TYPE = 'ODCWC')) THEN
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, NEW.CONTRACT_ID, NEW.DRAWDOWN_DATE, NEW.REFERENCE_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 ADVANCE_CCY, ADVANCE_AMT, ADVANCE_AMT, NULL, NEW.ADVANCE_ID, 'ADV', 'I');--                 
          ELSE
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, NEW.CONTRACT_ID, NEW.DRAWDOWN_DATE, NEW.REFERENCE_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 ADVANCE_CCY, ADVANCE_AMT, NULL, ADVANCE_AMT, NEW.ADVANCE_ID, 'ADV', 'I');--                 
          END IF;--              
      END IF;--            		
END;

----------------------------------------
-- Triggers for CF Report
-- UPDATE = Updating is_deleted flag
----------------------------------------
CREATE TRIGGER CMS_CF_ADV_TRG_DEL
   AFTER UPDATE
   ON CMS_CF_ADVANCE
   REFERENCING NEW AS NEW
   FOR EACH ROW
   MODE DB2SQL
   BEGIN ATOMIC
      DECLARE FAC_TYPE          VARCHAR(5);--
      DECLARE FAC_MOA           DECIMAL(5,2);--
      DECLARE ADVANCE_CCY       CHAR(3);--
      DECLARE ADVANCE_AMT       DECIMAL(20,2);--
      DECLARE EXISTING_LMT_CUR  CHAR(3);--
      DECLARE EXISTING_LMT_AMT  DECIMAL(20,2);--
      DECLARE NEW_LIMIT         DECIMAL(20,2);--
      DECLARE ROW_ID            BIGINT;--      
            
      IF (NEW.IS_DELETED = 'Y') THEN
      
          FOR RPT_FAC AS SELECT FACILITY_TYPE, MOA
                         FROM CMS_CF_FACILITY_TYPE
                         WHERE FACILITY_TYPE_ID = NEW.FACILITY_TYPE_ID      
          DO 
                SET FAC_TYPE = RPT_FAC.FACILITY_TYPE; --	
                SET FAC_MOA  = RPT_FAC.MOA;--
          END FOR;--
          
                               
          IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN
              
              SET ADVANCE_AMT = -NEW.ACTUAL_ADVANCE_AMOUNT;--
              SET ADVANCE_CCY = NEW.ACTUAL_ADVANCE_CURRENCY;--
                                   
              --Set default values
              SET EXISTING_LMT_CUR = 'SGD'; --	
              SET EXISTING_LMT_AMT = 0;--
                                                            
               FOR RPT_REC AS SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                            FROM CMS_CF_REPORT_SG 
                            WHERE DATE = (SELECT MAX(DATE) 
                                          FROM CMS_CF_REPORT_SG 
                                          WHERE CONTRACT_ID = NEW.CONTRACT_ID)
    
                DO 
                    SET EXISTING_LMT_CUR = RPT_REC.EXISTING_LMT_CCY; --	
                    SET EXISTING_LMT_AMT = RPT_REC.NEW_CREDIT_LIMIT;--
                END FOR;--
                                                            
                                                            
              SET NEW_LIMIT = EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
                     
              SET ROW_ID = CAST(FORMAT_KEY(CURRENT TIMESTAMP, NEXT VALUE FOR CMS_CF_REPORT_SG_SEQ) AS BIGINT);--
                                          
              IF((FAC_TYPE = 'ODCWC')) THEN
                  INSERT INTO CMS_CF_REPORT_SG 
                    (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES 
                    (ROW_ID, NEW.CONTRACT_ID, NEW.DRAWDOWN_DATE, NEW.REFERENCE_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                     ADVANCE_CCY, ADVANCE_AMT, ADVANCE_AMT, NULL, NEW.ADVANCE_ID, 'ADV', 'D');--                 
              ELSE
                  INSERT INTO CMS_CF_REPORT_SG 
                    (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES 
                    (ROW_ID, NEW.CONTRACT_ID, NEW.DRAWDOWN_DATE, NEW.REFERENCE_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                     ADVANCE_CCY, ADVANCE_AMT, NULL, ADVANCE_AMT, NEW.ADVANCE_ID, 'ADV',  'D');--                 
              END IF;--              
          END IF;--            		
     END IF;--   		
END;


-------------------------------------------------
-- Triggers for CF Report -> on CMS_CF_PAYMENT
-------------------------------------------------

CREATE TRIGGER CMS_CF_PAY_TRG_INS
   AFTER INSERT
   ON CMS_CF_PAYMENT
   REFERENCING NEW AS NEW
   FOR EACH ROW
   MODE DB2SQL
   BEGIN ATOMIC    
      DECLARE CONTRACT_PK       BIGINT;--
      DECLARE REF_NO            VARCHAR(30);--
      DECLARE FAC_TYPE          VARCHAR(5);--
      DECLARE FAC_MOA           DECIMAL(5,2);--
      DECLARE PAYMENT_COUNT     DECIMAL(10,0);--
      DECLARE ADVANCE_CCY       CHAR(3);--
      DECLARE ADVANCE_AMT       DECIMAL(20,2);--
      DECLARE EXISTING_LMT_CUR  CHAR(3);--
      DECLARE EXISTING_LMT_AMT  DECIMAL(20,2);--
      DECLARE NEW_LIMIT         DECIMAL(20,2);--
      DECLARE ROW_ID            BIGINT;--      

                  
      FOR REC AS SELECT ADV.CONTRACT_ID, ADV.REFERENCE_NO, FAC.FACILITY_TYPE, 
                 -ADV.ACTUAL_ADVANCE_AMOUNT ADV_AMT, ADV.ACTUAL_ADVANCE_CURRENCY ADV_CCY
                 FROM CMS_CF_ADVANCE ADV, CMS_CF_FACILITY_TYPE FAC
                 WHERE FAC.FACILITY_TYPE_ID = ADV.FACILITY_TYPE_ID
                 AND ADV.ADVANCE_ID = NEW.ADVANCE_ID       
      DO 
            SET CONTRACT_PK = REC.CONTRACT_ID;--
            SET REF_NO  = REC.REFERENCE_NO;--
            SET FAC_TYPE = REC.FACILITY_TYPE;--	
            SET ADVANCE_AMT = REC.ADV_AMT;--
            SET ADVANCE_CCY = REC.ADV_CCY;--
      END FOR;--
      
                           
      IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN      
          
          --Set default values
          SET EXISTING_LMT_CUR = 'SGD';--	
          SET EXISTING_LMT_AMT = 0;--
                                                        
          FOR RPT_REC AS SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                         FROM CMS_CF_REPORT_SG 
                         WHERE DATE = (SELECT MAX(DATE) 
                                      FROM CMS_CF_REPORT_SG 
                                      WHERE CONTRACT_ID = CONTRACT_PK)

          DO 
                SET EXISTING_LMT_CUR = RPT_REC.EXISTING_LMT_CCY; --	
                SET EXISTING_LMT_AMT = RPT_REC.NEW_CREDIT_LIMIT;--
                SET NEW_LIMIT = RPT_REC.NEW_CREDIT_LIMIT;--
          END FOR;--                                                                        
               
          
          SET PAYMENT_COUNT = (SELECT COUNT(*) 
                               FROM CMS_CF_PAYMENT PAY
                               WHERE PAY.ADVANCE_ID = NEW.ADVANCE_ID
                               AND PAY.IS_DELETED = 'N');--
    
                                
          IF (PAYMENT_COUNT = 1) THEN 
            IF (NEW.RECEIVE_AMOUNT > 0) THEN                                     
                SET NEW_LIMIT = EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
            END IF;--      
          END IF;--
          
          SET ROW_ID = CAST(FORMAT_KEY(CURRENT TIMESTAMP, NEXT VALUE FOR CMS_CF_REPORT_SG_SEQ) AS BIGINT);--
                                      
          IF((FAC_TYPE = 'ODCWC')) THEN
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, CONTRACT_PK, NEW.RECEIVE_DATE, REF_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 NEW.RECEIVE_CURRENCY, -NEW.RECEIVE_AMOUNT, 0, NULL, NEW.PAYMENT_ID, 'PAY', 'I');--                 
          ELSE 
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, CONTRACT_PK, NEW.RECEIVE_DATE, REF_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 NEW.RECEIVE_CURRENCY, -NEW.RECEIVE_AMOUNT, NULL, 0, NEW.PAYMENT_ID, 'PAY', 'I');--                 
          END IF;--              
      END IF;--            		
END;


CREATE TRIGGER CMS_CF_PAY_TRG_UPD
   AFTER UPDATE
   ON CMS_CF_PAYMENT
   REFERENCING NEW AS NEW 
               OLD AS OLD
   FOR EACH ROW
   MODE DB2SQL
   BEGIN ATOMIC    
      DECLARE CONTRACT_PK       BIGINT;--
      DECLARE REF_NO            VARCHAR(30);--
      DECLARE FAC_TYPE          VARCHAR(5);--
      DECLARE FAC_MOA           DECIMAL(5,2);--
      DECLARE PAYMENT_COUNT     DECIMAL(10,0);--
      DECLARE ADVANCE_CCY       CHAR(3);--
      DECLARE ADVANCE_AMT       DECIMAL(20,2);--
      DECLARE EXISTING_LMT_CUR  CHAR(3);--
      DECLARE EXISTING_LMT_AMT  DECIMAL(20,2);--
      DECLARE NEW_LIMIT         DECIMAL(20,2);--
      DECLARE ROW_ID            BIGINT;--      

      
      FOR REC AS SELECT ADV.CONTRACT_ID, ADV.REFERENCE_NO, FAC.FACILITY_TYPE, 
                 -ADV.ACTUAL_ADVANCE_AMOUNT ADV_AMT, ADV.ACTUAL_ADVANCE_CURRENCY ADV_CCY
                 FROM CMS_CF_ADVANCE ADV, CMS_CF_FACILITY_TYPE FAC
                 WHERE FAC.FACILITY_TYPE_ID = ADV.FACILITY_TYPE_ID
                 AND ADV.ADVANCE_ID = NEW.ADVANCE_ID       
      DO 
            SET CONTRACT_PK = REC.CONTRACT_ID;--
            SET REF_NO  = REC.REFERENCE_NO;--
            SET FAC_TYPE = REC.FACILITY_TYPE;--	
            SET ADVANCE_AMT = REC.ADV_AMT;--
            SET ADVANCE_CCY = REC.ADV_CCY;--
      END FOR;--
      
      
      --Deleting the Payment
      IF (NEW.IS_DELETED = 'Y') THEN                      
                               
          IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN      
              
              --Set default values
              SET EXISTING_LMT_CUR = 'SGD';--	
              SET EXISTING_LMT_AMT = 0;--
                                                            
              FOR RPT_REC AS SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                             FROM CMS_CF_REPORT_SG 
                             WHERE DATE = (SELECT MAX(DATE) 
                                          FROM CMS_CF_REPORT_SG 
                                          WHERE CONTRACT_ID = CONTRACT_PK)
    
              DO 
                    SET EXISTING_LMT_CUR = RPT_REC.EXISTING_LMT_CCY; --	
                    SET EXISTING_LMT_AMT = RPT_REC.NEW_CREDIT_LIMIT;--
                    SET NEW_LIMIT = RPT_REC.NEW_CREDIT_LIMIT;--
              END FOR;--                                                                        
                   
              
              SET PAYMENT_COUNT = (SELECT COUNT(*) 
                                   FROM CMS_CF_PAYMENT PAY
                                   WHERE PAY.ADVANCE_ID = NEW.ADVANCE_ID
                                   AND PAY.IS_DELETED = 'N');--
        
                                    
              IF (PAYMENT_COUNT = 1) THEN 
                IF (NEW.RECEIVE_AMOUNT > 0) THEN                                     
                    SET NEW_LIMIT = EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
                END IF;--      
              END IF;--
              
              SET ROW_ID = CAST(FORMAT_KEY(CURRENT TIMESTAMP, NEXT VALUE FOR CMS_CF_REPORT_SG_SEQ) AS BIGINT);--
                                          
              IF((FAC_TYPE = 'ODCWC')) THEN
                  INSERT INTO CMS_CF_REPORT_SG 
                    (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES 
                    (ROW_ID, CONTRACT_PK, NEW.RECEIVE_DATE, REF_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                     NEW.RECEIVE_CURRENCY, NEW.RECEIVE_AMOUNT, 0, NULL, NEW.PAYMENT_ID, 'PAY', 'D');--                 
              ELSE 
                  INSERT INTO CMS_CF_REPORT_SG 
                    (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES 
                    (ROW_ID, CONTRACT_PK, NEW.RECEIVE_DATE, REF_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                     NEW.RECEIVE_CURRENCY, NEW.RECEIVE_AMOUNT, NULL, 0, NEW.PAYMENT_ID, 'PAY', 'D');--                 
              END IF;--              
          END IF;-- 
      
      -- True update
      ELSE 
            IF ((NEW.RECEIVE_AMOUNT <> OLD.RECEIVE_AMOUNT) OR 
                (NEW.RECEIVE_CURRENCY <> OLD.RECEIVE_CURRENCY)) THEN
                
                  SET ROW_ID = CAST(FORMAT_KEY(CURRENT TIMESTAMP, NEXT VALUE FOR CMS_CF_REPORT_SG_SEQ) AS BIGINT);--
                
                  FOR RPT_REC AS SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                                 FROM CMS_CF_REPORT_SG 
                                 WHERE DATE = (SELECT MAX(DATE) 
                                              FROM CMS_CF_REPORT_SG 
                                              WHERE CONTRACT_ID = CONTRACT_PK)
        
                  DO 
                        SET EXISTING_LMT_CUR = RPT_REC.EXISTING_LMT_CCY; --	
                        SET EXISTING_LMT_AMT = RPT_REC.NEW_CREDIT_LIMIT;--
                        SET NEW_LIMIT = RPT_REC.NEW_CREDIT_LIMIT;--
                  END FOR;--                                                                        

                  
                  IF((FAC_TYPE = 'ODCWC')) THEN
                      INSERT INTO CMS_CF_REPORT_SG 
                        (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                         EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                         CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                      VALUES 
                        (ROW_ID, CONTRACT_PK, NEW.RECEIVE_DATE, REF_NO,
                         EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                         NEW.RECEIVE_CURRENCY, -NEW.RECEIVE_AMOUNT, 0, NULL, NEW.PAYMENT_ID, 'PAY', 'U');--                 
                  ELSE 
                      INSERT INTO CMS_CF_REPORT_SG 
                        (REPORT_ROW_ID, CONTRACT_ID, DATE, REFERENCE_NO, 
                         EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                         CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                      VALUES 
                        (ROW_ID, CONTRACT_PK, NEW.RECEIVE_DATE, REF_NO,
                         EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                         NEW.RECEIVE_CURRENCY, -NEW.RECEIVE_AMOUNT, NULL, 0, NEW.PAYMENT_ID, 'PAY', 'U');--                 
                  END IF;--                                               
            END IF;--
                       		
      END IF;--
END;   


/**************************************************************************
 Requestor : HongMan 
 Desc : Create price feed trigger
 Task : Price feed trigger
 Date : 25 July 2007
*************************************************************************/	
CREATE TRIGGER TRG_CMS_PRICE_FEED
	NO CASCADE BEFORE UPDATE
	ON CMS_PRICE_FEED
	REFERENCING 
	NEW AS NEW
	FOR EACH ROW 
	SET STOCK_CODE = TICKER;
	
/**********************************
Password Policy Audit Trail Trigger

**********************************/
CREATE TRIGGER trig_policy_hist
 	AFTER UPDATE ON cms_password_policy
	REFERENCING NEW AS N OLD AS O
	FOR EACH ROW
BEGIN ATOMIC
	IF (O.number_warn_days <> N.number_warn_days
		OR O.pwd_max_age <> N.pwd_max_age
		OR O.max_repeated_chars <> N.max_repeated_chars
		OR O.pwd_min_age <> N.pwd_min_age
		OR O.min_alpha_chars <> N.min_alpha_chars
		OR O.pwd_min_length <> N.pwd_min_length
		OR O.pwd_max_length <> N.pwd_max_length
		OR O.pwd_history <> N.pwd_history) 
	THEN
		INSERT INTO cms_password_policy_history 
		VALUES (O.number_warn_days, O.pwd_max_age, O.max_repeated_chars, O.pwd_min_age,
			 	O.min_alpha_chars, O.pwd_min_length, O.pwd_max_length, O.pwd_history,
			 	N.number_warn_days, N.pwd_max_age, N.max_repeated_chars, N.pwd_min_age,
			 	N.min_alpha_chars, N.pwd_min_length, N.pwd_max_length, N.pwd_history,  
				CURRENT_TIMESTAMP, (VALUES CURRENT USER));--
	END IF;--
END;


CREATE TRIGGER INS_HOST_PROD_TYPE
  AFTER INSERT
  ON HOST_PRODUCT_TYPE
  REFERENCING NEW AS N
  FOR EACH ROW mode db2sql
BEGIN ATOMIC
	declare t_entry_code varchar(60);--
	
	for fac_rec as 
			select distinct fac.ACCOUNT_TYPE 
			from host_facility_type fac, common_code_category_entry ccce
			where ccce.CATEGORY_CODE = 'FAC_PRODUCT_MAP'
			and ccce.ACTIVE_STATUS = '1'
			and n.source = (case fac.account_type 
												when 'L' then 'LNPAR2'
												when 'D' then 'DDPAR2'
												when 'O' then 'DDPAR2'
												when 'F' then 'TFPAR2'
												else n.source
												end)
			and fac.FACILITY_CODE = ccce.REF_ENTRY_CODE
			and n.loan_type = ccce.ENTRY_CODE
			and n.currency = ccce.entry_name
	do
		set t_entry_code = n.loan_type || '|' || n.currency||'|' || fac_rec.account_type;--
		if not exists 
			(select 1 from common_code_category_entry 
			where category_code = 'PRODUCT_TYPE' 
			and entry_code = (n.loan_type || '|' || n.currency||'|' || fac_rec.account_type)
			and entry_source = 'ARBS') then
				insert into common_code_category_entry 
					(entry_id, entry_code, entry_name, category_code, category_code_id, entry_source, ref_entry_code, country, active_status)
			select next value for common_code_category_entry_seq, n.loan_type || '|' || n.currency||'|' || fac_rec.account_type, 
				n.desc, category_code, category_id, 'ARBS', n.source, 'MY', '1'
			from common_code_category where category_code = 'PRODUCT_TYPE';--
		else
			update common_code_category_entry
			set entry_name = n.desc, ref_entry_code = n.source
			where category_code = 'PRODUCT_TYPE'
			and entry_code = (n.loan_type || '|' || n.currency||'|' || fac_rec.account_type)
			and entry_source = 'ARBS';--
		end if;--
	end for;--
end;

CREATE TRIGGER UPD_HOST_PROD_TYPE
  AFTER UPDATE
  ON HOST_PRODUCT_TYPE
  REFERENCING NEW AS N OLD AS O
  FOR EACH ROW mode db2sql
BEGIN ATOMIC
	declare t_entry_code varchar(60);--
	
	for fac_rec as 
			select distinct fac.ACCOUNT_TYPE 
			from host_facility_type fac, common_code_category_entry ccce
			where ccce.CATEGORY_CODE = 'FAC_PRODUCT_MAP'
			and ccce.ACTIVE_STATUS = '1'
			and n.source = (case fac.account_type 
												when 'L' then 'LNPAR2'
												when 'D' then 'DDPAR2'
												when 'O' then 'DDPAR2'
												when 'F' then 'TFPAR2'
												else n.source
												end)
			and fac.FACILITY_CODE = ccce.REF_ENTRY_CODE
			and n.loan_type = ccce.ENTRY_CODE
			and n.currency = ccce.entry_name
	do
		set t_entry_code = n.loan_type || '|' || n.currency||'|' || fac_rec.account_type;--
		
		if not exists 
			(select 1 from common_code_category_entry 
			where category_code = 'PRODUCT_TYPE' 
			and entry_code = t_entry_code
			and entry_source = 'ARBS') then
				insert into common_code_category_entry 
					(entry_id, entry_code, entry_name, category_code, category_code_id, entry_source, ref_entry_code, country, active_status)
			select next value for common_code_category_entry_seq, t_entry_code, 
				n.desc, category_code, category_id, 'ARBS', n.source, 'MY', '1'
			from common_code_category where category_code = 'PRODUCT_TYPE';--
		else
			update common_code_category_entry
			set entry_name = n.desc, ref_entry_code = n.source
			where category_code = 'PRODUCT_TYPE'
			and entry_code = t_entry_code
			and entry_source = 'ARBS';--
		end if;--
	end for;--
end;


COMMIT WORK;