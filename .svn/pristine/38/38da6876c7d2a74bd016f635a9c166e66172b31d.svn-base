--------------------------------------------------------
--  File created - Thursday-March-24-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger CMS_CF_ADV_TRG_DEL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_CF_ADV_TRG_DEL" 
   AFTER UPDATE
   ON cms_cf_advance
   REFERENCING NEW AS NEW
   FOR EACH ROW
DECLARE
   FAC_TYPE          VARCHAR(5);--
   FAC_MOA           NUMBER(5,2);--
   ADVANCE_CCY       CHAR(3);--
   ADVANCE_AMT       NUMBER(20,2);--
   EXISTING_LMT_CUR  CHAR(3);--
   EXISTING_LMT_AMT  NUMBER(20,2);--
   NEW_LIMIT         NUMBER(20,2);--
   ROW_ID            NUMBER ;--


   BEGIN


      IF (:NEW.IS_DELETED = 'Y') THEN

          FOR RPT_FAC IN( SELECT FACILITY_TYPE, MOA
                         FROM CMS_CF_FACILITY_TYPE
                         WHERE FACILITY_TYPE_ID = :NEW.FACILITY_TYPE_ID)
          LOOP
                FAC_TYPE := RPT_FAC.FACILITY_TYPE; --
                FAC_MOA  := RPT_FAC.MOA;--
          END LOOP;--


          IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN

              ADVANCE_AMT := -:NEW.ACTUAL_ADVANCE_AMOUNT;--
              ADVANCE_CCY := :NEW.ACTUAL_ADVANCE_CURRENCY;--

              --Set default values
              EXISTING_LMT_CUR := 'SGD'; --
              EXISTING_LMT_AMT := 0;--

               FOR RPT_REC IN (SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                            FROM CMS_CF_REPORT_SG
                            WHERE DATE_ = (SELECT MAX(DATE_)
                                          FROM CMS_CF_REPORT_SG
                                          WHERE CONTRACT_ID = :NEW.CONTRACT_ID))

                LOOP
                    EXISTING_LMT_CUR := RPT_REC.EXISTING_LMT_CCY; --
                    EXISTING_LMT_AMT := RPT_REC.NEW_CREDIT_LIMIT;--
                END LOOP;--


              NEW_LIMIT := EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--

              ROW_ID := FORMAT_KEY(CURRENT_TIMESTAMP, CMS_CF_REPORT_SG_SEQ.nextval);--

              IF((FAC_TYPE = 'ODCWC')) THEN
                  INSERT INTO CMS_CF_REPORT_SG
                    (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO,
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT,
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES
                    (ROW_ID, :NEW.CONTRACT_ID, :NEW.DRAWDOWN_DATE, :NEW.REFERENCE_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT,
                     ADVANCE_CCY, ADVANCE_AMT, ADVANCE_AMT, NULL, :NEW.ADVANCE_ID, 'ADV', 'D');--
              ELSE
                  INSERT INTO CMS_CF_REPORT_SG
                    (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO,
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT,
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES
                    (ROW_ID, :NEW.CONTRACT_ID, :NEW.DRAWDOWN_DATE, :NEW.REFERENCE_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT,
                     ADVANCE_CCY, ADVANCE_AMT, NULL, ADVANCE_AMT, :NEW.ADVANCE_ID, 'ADV',  'D');--
              END IF;--
          END IF;--
     END IF;--
END;







/
ALTER TRIGGER "CMS_CF_ADV_TRG_DEL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_CF_ADV_TRG_INS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_CF_ADV_TRG_INS" 
   AFTER INSERT
   ON CMS_CF_ADVANCE
   REFERENCING NEW AS NEW
   FOR EACH ROW
   
   DECLARE 
      FAC_TYPE          VARCHAR(5);--
      FAC_MOA           NUMBER(5,2);--
      ADVANCE_CCY       CHAR(3);--
      ADVANCE_AMT       NUMBER(20,2);--
      EXISTING_LMT_CUR  CHAR(3);--
      EXISTING_LMT_AMT  NUMBER(20,2);--
      NEW_LIMIT         NUMBER(20,2);--
      ROW_ID            NUMBER;--
   
   BEGIN     
            
      FOR RPT_FAC IN(SELECT FACILITY_TYPE, MOA
                     FROM CMS_CF_FACILITY_TYPE
                     WHERE FACILITY_TYPE_ID = :NEW.FACILITY_TYPE_ID)      
      LOOP
            FAC_TYPE := RPT_FAC.FACILITY_TYPE; --	
            FAC_MOA  := RPT_FAC.MOA;--
      END LOOP;--
      
                           
      IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN
          
          ADVANCE_AMT := :NEW.ACTUAL_ADVANCE_AMOUNT;--
          ADVANCE_CCY := :NEW.ACTUAL_ADVANCE_CURRENCY;--

          --Set default values
          EXISTING_LMT_CUR := 'SGD'; --	
          EXISTING_LMT_AMT := 0;--
                                                        
           FOR RPT_REC IN(SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                        FROM CMS_CF_REPORT_SG 
                        WHERE DATE_ = (SELECT MAX(DATE_) 
                                      FROM CMS_CF_REPORT_SG 
                                      WHERE CONTRACT_ID = :NEW.CONTRACT_ID))

            LOOP
                EXISTING_LMT_CUR := RPT_REC.EXISTING_LMT_CCY; --	
                EXISTING_LMT_AMT := RPT_REC.NEW_CREDIT_LIMIT;--
            END LOOP;--
                                                        
                                                        
          NEW_LIMIT := EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
                 
          ROW_ID := FORMAT_KEY(CURRENT_TIMESTAMP, CMS_CF_REPORT_SG_SEQ.NEXTVAL);--
                                      
          IF((FAC_TYPE = 'ODCWC')) THEN
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, :NEW.CONTRACT_ID, :NEW.DRAWDOWN_DATE, :NEW.REFERENCE_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 ADVANCE_CCY, ADVANCE_AMT, ADVANCE_AMT, NULL, :NEW.ADVANCE_ID, 'ADV', 'I');--                 
          ELSE
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, :NEW.CONTRACT_ID, :NEW.DRAWDOWN_DATE, :NEW.REFERENCE_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 ADVANCE_CCY, ADVANCE_AMT, NULL, ADVANCE_AMT, :NEW.ADVANCE_ID, 'ADV', 'I');--                 
          END IF;--              
      END IF;--            		
END;







/
ALTER TRIGGER "CMS_CF_ADV_TRG_INS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_CF_PAY_TRG_INS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_CF_PAY_TRG_INS" 
   AFTER INSERT
   ON CMS_CF_PAYMENT
   REFERENCING NEW AS NEW
   FOR EACH ROW
   DECLARE 
        CONTRACT_PK       NUMBER;--
	      REF_NO            VARCHAR(30);--
	      FAC_TYPE          VARCHAR(5);--
	      FAC_MOA           NUMBER(5,2);--
	      PAYMENT_COUNT     NUMBER(10,0);--
	      ADVANCE_CCY       CHAR(3);--
	      ADVANCE_AMT       NUMBER(20,2);--
	      EXISTING_LMT_CUR  CHAR(3);--
	      EXISTING_LMT_AMT  NUMBER(20,2);--
	      NEW_LIMIT         NUMBER(20,2);--
	      ROW_ID            NUMBER;--
   BEGIN     
                  
      FOR REC IN(SELECT ADV.CONTRACT_ID, ADV.REFERENCE_NO, FAC.FACILITY_TYPE, 
                 -ADV.ACTUAL_ADVANCE_AMOUNT ADV_AMT, ADV.ACTUAL_ADVANCE_CURRENCY ADV_CCY
                 FROM CMS_CF_ADVANCE ADV, CMS_CF_FACILITY_TYPE FAC
                 WHERE FAC.FACILITY_TYPE_ID = ADV.FACILITY_TYPE_ID
                 AND ADV.ADVANCE_ID = :NEW.ADVANCE_ID)       
      LOOP
            CONTRACT_PK := REC.CONTRACT_ID;--
            REF_NO  := REC.REFERENCE_NO;--
            FAC_TYPE := REC.FACILITY_TYPE;--	
            ADVANCE_AMT := REC.ADV_AMT;--
            ADVANCE_CCY := REC.ADV_CCY;--
      END LOOP;--
      
                           
      IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN      
          
          --Set default values
          EXISTING_LMT_CUR := 'SGD';--	
          EXISTING_LMT_AMT := 0;--
                                                        
          FOR RPT_REC IN (SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                         FROM CMS_CF_REPORT_SG 
                         WHERE DATE_ = (SELECT MAX(DATE_) 
                                      FROM CMS_CF_REPORT_SG 
                                      WHERE CONTRACT_ID = CONTRACT_PK))
          LOOP 
                EXISTING_LMT_CUR := RPT_REC.EXISTING_LMT_CCY; --	
                EXISTING_LMT_AMT := RPT_REC.NEW_CREDIT_LIMIT;--
                NEW_LIMIT := RPT_REC.NEW_CREDIT_LIMIT;--
          END LOOP;--                                                                        
               
          
           SELECT COUNT(*) INTO PAYMENT_COUNT  
                               FROM CMS_CF_PAYMENT PAY
                               WHERE PAY.ADVANCE_ID = :NEW.ADVANCE_ID
                               AND PAY.IS_DELETED = 'N';--
    
                                
          IF (PAYMENT_COUNT = 1) THEN 
            IF (:NEW.RECEIVE_AMOUNT > 0) THEN                                     
                NEW_LIMIT := EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
            END IF;--      
          END IF;--
          
          ROW_ID := FORMAT_KEY(CURRENT_TIMESTAMP, CMS_CF_REPORT_SG_SEQ.NEXTVAL);--
                                      
          IF((FAC_TYPE = 'ODCWC')) THEN
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, CONTRACT_PK, :NEW.RECEIVE_DATE, REF_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 :NEW.RECEIVE_CURRENCY, -:NEW.RECEIVE_AMOUNT, 0, NULL, :NEW.PAYMENT_ID, 'PAY', 'I');--                 
          ELSE 
              INSERT INTO CMS_CF_REPORT_SG 
                (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                 EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                 CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
              VALUES 
                (ROW_ID, CONTRACT_PK, :NEW.RECEIVE_DATE, REF_NO,
                 EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                 :NEW.RECEIVE_CURRENCY, -:NEW.RECEIVE_AMOUNT, NULL, 0, :NEW.PAYMENT_ID, 'PAY', 'I');--                 
          END IF;--              
      END IF;--            		
END;







/
ALTER TRIGGER "CMS_CF_PAY_TRG_INS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_CF_PAY_TRG_UPD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_CF_PAY_TRG_UPD" 
   AFTER UPDATE
   ON CMS_CF_PAYMENT
   REFERENCING NEW AS NEW 
               OLD AS OLD
   FOR EACH ROW
      DECLARE 
	CONTRACT_PK       NUMBER;--
        REF_NO            VARCHAR(30);--
        FAC_TYPE          VARCHAR(5);--
        FAC_MOA           NUMBER(5,2);--
        PAYMENT_COUNT     NUMBER(10,0);--
        ADVANCE_CCY       CHAR(3);--
        ADVANCE_AMT       NUMBER(20,2);--
        EXISTING_LMT_CUR  CHAR(3);--
        EXISTING_LMT_AMT  NUMBER(20,2);--
        NEW_LIMIT         NUMBER(20,2);--
        ROW_ID            NUMBER;--      
   BEGIN 
      FOR REC IN(SELECT ADV.CONTRACT_ID, ADV.REFERENCE_NO, FAC.FACILITY_TYPE, 
                 -ADV.ACTUAL_ADVANCE_AMOUNT ADV_AMT, ADV.ACTUAL_ADVANCE_CURRENCY ADV_CCY
                 FROM CMS_CF_ADVANCE ADV, CMS_CF_FACILITY_TYPE FAC
                 WHERE FAC.FACILITY_TYPE_ID = ADV.FACILITY_TYPE_ID
                 AND ADV.ADVANCE_ID = :NEW.ADVANCE_ID)       
      LOOP
            CONTRACT_PK := REC.CONTRACT_ID;--
            REF_NO  := REC.REFERENCE_NO;--
            FAC_TYPE := REC.FACILITY_TYPE;--	
            ADVANCE_AMT := REC.ADV_AMT;--
            ADVANCE_CCY := REC.ADV_CCY;--
      END LOOP;--
      
      
      --Deleting the Payment
      IF (:NEW.IS_DELETED = 'Y') THEN                      
                               
          IF((FAC_TYPE = 'ODCWC') OR (FAC_TYPE = 'ODPAQ')) THEN      
              
              --Set default values
              EXISTING_LMT_CUR := 'SGD';--	
              EXISTING_LMT_AMT := 0;--
                                                            
              FOR RPT_REC IN (SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                             FROM CMS_CF_REPORT_SG 
                             WHERE DATE_ = (SELECT MAX(DATE_) 
                                          FROM CMS_CF_REPORT_SG 
                                          WHERE CONTRACT_ID = CONTRACT_PK))
    
              LOOP
                    EXISTING_LMT_CUR := RPT_REC.EXISTING_LMT_CCY; --	
                    EXISTING_LMT_AMT := RPT_REC.NEW_CREDIT_LIMIT;--
                    NEW_LIMIT := RPT_REC.NEW_CREDIT_LIMIT;--
              END LOOP;--                                                                        
        
	      SELECT COUNT(*) into PAYMENT_COUNT
                                   FROM CMS_CF_PAYMENT PAY
                                   WHERE PAY.ADVANCE_ID = :NEW.ADVANCE_ID
                                   AND PAY.IS_DELETED = 'N';--
        
              IF (PAYMENT_COUNT = 1) THEN 
                IF (:NEW.RECEIVE_AMOUNT > 0) THEN                                     
                    NEW_LIMIT := EXISTING_LMT_AMT + CONVERT_AMT(ADVANCE_AMT, ADVANCE_CCY, EXISTING_LMT_CUR);--
                END IF;--      
              END IF;--
              
              ROW_ID := FORMAT_KEY(CURRENT_TIMESTAMP, CMS_CF_REPORT_SG_SEQ.NEXTVAL);--
                                          
              IF((FAC_TYPE = 'ODCWC')) THEN
                  INSERT INTO CMS_CF_REPORT_SG 
                    (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES 
                    (ROW_ID, CONTRACT_PK, :NEW.RECEIVE_DATE, REF_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                     :NEW.RECEIVE_CURRENCY, :NEW.RECEIVE_AMOUNT, 0, NULL, :NEW.PAYMENT_ID, 'PAY', 'D');--                 
              ELSE 
                  INSERT INTO CMS_CF_REPORT_SG 
                    (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                     EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                     CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                  VALUES 
                    (ROW_ID, CONTRACT_PK, :NEW.RECEIVE_DATE, REF_NO,
                     EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                     :NEW.RECEIVE_CURRENCY, :NEW.RECEIVE_AMOUNT, NULL, 0, :NEW.PAYMENT_ID, 'PAY', 'D');--                 
              END IF;--              
          END IF;-- 
      
      -- True update
      ELSE 
            IF ((:NEW.RECEIVE_AMOUNT <> :OLD.RECEIVE_AMOUNT) OR 
                (:NEW.RECEIVE_CURRENCY <> :OLD.RECEIVE_CURRENCY)) THEN
                
                  ROW_ID := FORMAT_KEY(CURRENT_TIMESTAMP, CMS_CF_REPORT_SG_SEQ.NEXTVAL);--
                
                  FOR RPT_REC IN (SELECT EXISTING_LMT_CCY, NEW_CREDIT_LIMIT
                                 FROM CMS_CF_REPORT_SG 
                                 WHERE DATE_ = (SELECT MAX(DATE_) 
                                              FROM CMS_CF_REPORT_SG 
                                              WHERE CONTRACT_ID = CONTRACT_PK))
        
                  LOOP
                        EXISTING_LMT_CUR := RPT_REC.EXISTING_LMT_CCY; --	
                        EXISTING_LMT_AMT := RPT_REC.NEW_CREDIT_LIMIT;--
                        NEW_LIMIT := RPT_REC.NEW_CREDIT_LIMIT;--
                  END LOOP;--                                                                        

                  
                  IF((FAC_TYPE = 'ODCWC')) THEN
                      INSERT INTO CMS_CF_REPORT_SG 
                        (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                         EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                         CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                      VALUES 
                        (ROW_ID, CONTRACT_PK, :NEW.RECEIVE_DATE, REF_NO,
                         EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                         :NEW.RECEIVE_CURRENCY, -:NEW.RECEIVE_AMOUNT, 0, NULL, :NEW.PAYMENT_ID, 'PAY', 'U');--                 
                  ELSE 
                      INSERT INTO CMS_CF_REPORT_SG 
                        (REPORT_ROW_ID, CONTRACT_ID, DATE_, REFERENCE_NO, 
                         EXISTING_LMT_CCY, EXISTING_LMT_AMT, NEW_CREDIT_LIMIT, 
                         CURRENCY, AMOUNT, OD1_LIMIT, OD2_LIMIT, REF_ID, TRANS_TYPE, STATUS)
                      VALUES 
                        (ROW_ID, CONTRACT_PK, :NEW.RECEIVE_DATE, REF_NO,
                         EXISTING_LMT_CUR, EXISTING_LMT_AMT, NEW_LIMIT, 
                         :NEW.RECEIVE_CURRENCY, -:NEW.RECEIVE_AMOUNT, NULL, 0, :NEW.PAYMENT_ID, 'PAY', 'U');--                 
                  END IF;--                                               
            END IF;--
                       		
      END IF;--
END;







/
ALTER TRIGGER "CMS_CF_PAY_TRG_UPD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_DOCUMENT_ITEM_B4_DELETE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_DOCUMENT_ITEM_B4_DELETE" BEFORE
  DELETE ON cms_document_item FOR EACH ROW DECLARE BEGIN
  -- Insert record into archive table
  INSERT
  INTO Cms_Document_Item_Archive
    (
      DOC_ITEM_ID,
      MASTERLIST_ID,
      DOCUMENT_ID,
      DOCUMENT_CODE,
      ACTION,
      CREATION_DATE,
      TRANSACTION_DATE
    )
    VALUES
    (
      :old.DOC_ITEM_ID,
      :old.MASTERLIST_ID,
      :old.DOCUMENT_ID,
      :old.Document_Code,
      'D',
      :old.Creation_Date,
      (SELECT To_Date(Param_Value,'DD-Mon-YYYY')
      FROM Cms_General_Param
      WHERE param_code = 'APPLICATION_DATE'
      )
    );
END;





/
ALTER TRIGGER "CMS_DOCUMENT_ITEM_B4_DELETE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_LOGIN_TRG_UP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_LOGIN_TRG_UP" 
     AFTER insert or UPDATE ON CMS_AUTHENTICATION
     REFERENCING NEW AS new OLD AS old
     FOR EACH ROW
     DECLARE  v_login_attempts number :=0;
       v_count number(19);
     BEGIN 
     
      SELECT count(1) into v_count
          FROM CMS_LOGIN_AUDIT 
          WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID
          AND LOGIN_TIME=(SELECT MAX (LOGIN_TIME)
                                  FROM CMS_LOGIN_AUDIT
                                 WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID);
                                 
      
        IF v_count < 1   THEN 
           v_login_attempts:=0;
        ELSE 
          SELECT MAX(no_of_attempts) into v_login_attempts
              FROM CMS_LOGIN_AUDIT 
              WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID
              and LOGIN_TIME=(SELECT MAX (LOGIN_TIME)
                                  FROM CMS_LOGIN_AUDIT
                                 WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID);
                                 
              IF  v_login_attempts is null or TRIM (v_login_attempts) = '' THEN
                        v_login_attempts:=0;
              END IF;
        END IF;
        
      
      IF INSERTING THEN
      
      INSERT
             INTO CMS_LOGIN_AUDIT (LOGIN_ID, LOGIN_TIME, LOGIN_STATUS,no_of_attempts,ROW_SEQ,IP_ADDRESS)
                   VALUES (:NEW.LOGIN_ID, :NEW.last_login_time, 'SUCCESS',v_login_attempts+:OLD.LOGIN_ATTEMPTS,LOGIN_AUDIT_SEQ.nextVal,:NEW.LAST_LOGIN_IP);
                   
      ELSE
      IF ( (:old.LAST_LOGIN_TIME  IS NOT NULL) AND (:new.LAST_LOGIN_TIME IS NOT NULL) AND
      (to_number(to_number(to_char(:new.LAST_LOGIN_TIME,'YYmmddhh24MI'))||
          round(to_number(to_char(:new.LAST_LOGIN_TIME,'SS.FF'))))
          != to_number(to_number(to_char(:old.LAST_LOGIN_TIME,'YYmmddhh24MI'))||
          round(to_number(to_char(:old.LAST_LOGIN_TIME,'SS.FF')))))
          AND
          ((to_number(to_number(to_char(:new.LAST_LOGIN_TIME,'YYmmddhh24MI'))||
          round(to_number(to_char(:new.LAST_LOGIN_TIME,'SS.FF'))))- 
          to_number(to_number(to_char(:old.LAST_LOGIN_TIME,'YYmmddhh24MI'))||
          round(to_number(to_char(:old.LAST_LOGIN_TIME,'SS.FF'))))) >2)
          
          ) THEN 
          
--        if ( :new.LAST_LOGIN_TIME != :old.LAST_LOGIN_TIME ) then
           INSERT
             INTO CMS_LOGIN_AUDIT (LOGIN_ID, LOGIN_TIME, LOGIN_STATUS,no_of_attempts,ROW_SEQ,IP_ADDRESS)
                   VALUES (:NEW.LOGIN_ID, :NEW.last_login_time, 'SUCCESS',v_login_attempts+:OLD.LOGIN_ATTEMPTS,LOGIN_AUDIT_SEQ.nextVal,:NEW.LAST_LOGIN_IP);
                             
        END IF;
      END IF;
               
       --if (:new.LAST_LOGOUT_TIME != :old.LAST_LOGOUT_TIME ) then
       
       IF UPDATING THEN
        UPDATE CMS_LOGIN_AUDIT
             SET LOGOUT_TIME = :new.LAST_LOGOUT_TIME
            WHERE LOGIN_STATUS = 'SUCCESS'
          AND LOGIN_ID = :NEW.LOGIN_ID
             AND ROW_SEQ = (SELECT MAX (ROW_SEQ)
                                  FROM CMS_LOGIN_AUDIT
                                 WHERE LOGIN_STATUS = 'SUCCESS'
           AND LOGIN_ID = :NEW.LOGIN_ID);
        END IF;
     END;


/
ALTER TRIGGER "CMS_LOGIN_TRG_UP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_LOGIN_TRG_UP_BK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_LOGIN_TRG_UP_BK" 
     AFTER insert or UPDATE ON CMS_AUTHENTICATION
     REFERENCING NEW AS new OLD AS old
     FOR EACH ROW
     DECLARE  v_login_attempts number :=0;
       v_count number(19);
     BEGIN 
     
      SELECT count(1) into v_count
          FROM CMS_LOGIN_AUDIT 
          WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID
          AND LOGIN_TIME=(SELECT MAX (LOGIN_TIME)
                                  FROM CMS_LOGIN_AUDIT
                                 WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID);
                                 
      
        IF v_count < 1   THEN 
           v_login_attempts:=0;
        ELSE 
          SELECT MAX(no_of_attempts) into v_login_attempts
              FROM CMS_LOGIN_AUDIT 
              WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID
              and LOGIN_TIME=(SELECT MAX (LOGIN_TIME)
                                  FROM CMS_LOGIN_AUDIT
                                 WHERE LOGIN_STATUS = 'SUCCESS' and LOGIN_ID= :NEW.LOGIN_ID);
                                 
              IF  v_login_attempts is null or TRIM (v_login_attempts) = '' THEN
                        v_login_attempts:=0;
              END IF;
        END IF;
      
        if inserting then-- ( :new.LAST_LOGIN_TIME != :old.LAST_LOGIN_TIME ) then
           INSERT
             INTO CMS_LOGIN_AUDIT (LOGIN_ID, LOGIN_TIME, LOGIN_STATUS,no_of_attempts,ROW_SEQ)
                   VALUES (:NEW.LOGIN_ID, :NEW.last_login_time, 'SUCCESS',v_login_attempts+:OLD.LOGIN_ATTEMPTS,LOGIN_AUDIT_SEQ.nextVal);
        elsif updating and      ( :new.LAST_LOGIN_TIME != :old.LAST_LOGIN_TIME ) then
          INSERT
             INTO CMS_LOGIN_AUDIT (LOGIN_ID, LOGIN_TIME, LOGIN_STATUS,no_of_attempts,ROW_SEQ)
                   VALUES (:NEW.LOGIN_ID, :NEW.last_login_time, 'SUCCESS',v_login_attempts+:OLD.LOGIN_ATTEMPTS,LOGIN_AUDIT_SEQ.nextVal);
        END IF;
               
       --if (:new.LAST_LOGOUT_TIME != :old.LAST_LOGOUT_TIME ) then
        if updating and :new.LAST_LOGOUT_TIME is not null   then
        UPDATE CMS_LOGIN_AUDIT
             SET LOGOUT_TIME = :new.LAST_LOGOUT_TIME
            WHERE LOGIN_STATUS = 'SUCCESS'
          AND LOGIN_ID = :NEW.LOGIN_ID
             AND ROW_SEQ = (SELECT MAX (ROW_SEQ)
                                  FROM CMS_LOGIN_AUDIT
                                 WHERE LOGIN_STATUS = 'SUCCESS'
           AND LOGIN_ID = :NEW.LOGIN_ID);
        END IF;
     END;


/
ALTER TRIGGER "CMS_LOGIN_TRG_UP_BK" DISABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_NOMINEES_INS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_NOMINEES_INS" 
  AFTER INSERT
  ON  CMS_NOMINEES 
  REFERENCING NEW AS NEWROW
  FOR EACH ROW
  DECLARE 
    cnt NUMBER;
BEGIN 
    SELECT COUNT(*) INTO cnt 
          FROM CMS_EARMARK_GROUP 
    WHERE CMS_EARMARK_GROUP.FEED_ID = :NEWROW.FEED_ID
          AND CMS_EARMARK_GROUP.SOURCE_SYSTEM_ID = :NEWROW.SOURCE_SYSTEM_ID;

    IF ( cnt = 0 ) 
 
    THEN 
        INSERT INTO CMS_EARMARK_GROUP (EARMARK_GROUP_ID, FEED_ID, SOURCE_SYSTEM_ID, CMS_ACTUAL_HOLDING, LAST_BATCH_UPDATE , STATUS)
        VALUES ( FORMAT_KEY ( CURRENT_TIMESTAMP , CMS_EARMARK_GROUP_SEQ.NEXTVAL) , :NEWROW.FEED_ID, :NEWROW.SOURCE_SYSTEM_ID, 0, CURRENT_TIMESTAMP, 'ACTIVE');--
    ELSE 
        UPDATE CMS_EARMARK_GROUP 
        SET CMS_ACTUAL_HOLDING = 0, 
        LAST_BATCH_UPDATE = CURRENT_TIMESTAMP 
        WHERE CMS_EARMARK_GROUP.FEED_ID = :NEWROW.FEED_ID 
        AND CMS_EARMARK_GROUP.SOURCE_SYSTEM_ID = :NEWROW.SOURCE_SYSTEM_ID;-- 
    END IF;-- 
END;







/
ALTER TRIGGER "CMS_NOMINEES_INS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_TRANS_HISTORY_IP_IN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_TRANS_HISTORY_IP_IN" AFTER
  INSERT OR
  UPDATE ON TRANS_HISTORY REFERENCING NEW AS NEW FOR EACH ROW 
  DECLARE V_IP_ADDRESS VARCHAR2(20);
  V_count number(19);
  BEGIN
  
  SELECT count(1)
    INTO V_count
    FROM CMS_AUTHENTICATION
    WHERE LOGIN_ID = :NEW.LOGIN_ID;
    
    if V_count = 1 then
        SELECT LAST_LOGIN_IP
        INTO V_IP_ADDRESS
        FROM CMS_AUTHENTICATION
        WHERE LOGIN_ID = :NEW.LOGIN_ID;
    end if;
   
    UPDATE TRANS_HISTORY
    SET IP_ADDRESS = V_IP_ADDRESS
    WHERE TR_HISTORY_ID = :NEW.TR_HISTORY_ID;
END;







/
ALTER TRIGGER "CMS_TRANS_HISTORY_IP_IN" DISABLE;
--------------------------------------------------------
--  DDL for Trigger CMS_TRANS_IP_IN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CMS_TRANS_IP_IN" 
after insert or update ON   TRANS_HISTORY
FOR EACH ROW
declare
pragma autonomous_transaction;
V_COUNT NUMBER(19):= 0;
V_IP varchar2(15):= null;
V_HOST_NAME  varchar2(250):= null;
BEGIN

select COUNT(1)
into V_COUNT
from CMS_AUTHENTICATION
where  LOGIN_ID = :NEW.LOGIN_ID;

IF V_COUNT = 1 THEN

select LAST_LOGIN_IP,HOST_NAME
into V_IP,V_HOST_NAME
from CMS_AUTHENTICATION
where  LOGIN_ID = :NEW.LOGIN_ID;

ELSE

V_IP:=NULL;
V_HOST_NAME:=NULL;

END IF;



INSERT INTO TRANS_HISTORY_IPADDRESS (TR_HISTORY_ID,IP_ADDRESS,HOST_NAME)
VALUES(:NEW.TR_HISTORY_ID,V_IP,V_HOST_NAME);

 COMMIT;
    
END CMS_TRANS_IP_IN;







/
ALTER TRIGGER "CMS_TRANS_IP_IN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INS_HOST_PROD_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "INS_HOST_PROD_TYPE" 
  AFTER INSERT
  ON HOST_PRODUCT_TYPE
  REFERENCING NEW AS N
  FOR EACH ROW
  DECLARE 
  t_entry_code varchar(60);--
  cnt NUMBER;
BEGIN 
	
	
	for fac_rec IN (select 
			distinct fac.ACCOUNT_TYPE 
			from host_facility_type fac, common_code_category_entry ccce
			where ccce.CATEGORY_CODE = 'FAC_PRODUCT_MAP'
			and ccce.ACTIVE_STATUS = '1'
			and :N.source = (case fac.account_type 
					  when 'L' then 'LNPAR2'
					  when 'D' then 'DDPAR2'
					  when 'O' then 'DDPAR2'
					  when 'F' then 'TFPAR2'
					  else :N.source
					  end)
			and fac.FACILITY_CODE = ccce.REF_ENTRY_CODE
			and :N.loan_type = ccce.ENTRY_CODE
			and :N.currency = ccce.entry_name)
	LOOP
		t_entry_code := :N.loan_type || '|' || :N.currency||'|' || fac_rec.account_type;--
		
    select Count(*) INTO cnt from common_code_category_entry 
			where category_code = 'PRODUCT_TYPE' 
			and entry_code = (:N.loan_type || '|' || :N.currency||'|' || fac_rec.account_type)
			and entry_source = 'ARBS';
    
    if (cnt=0) 
			 
      then
				insert into common_code_category_entry 
					(entry_id, entry_code, entry_name, category_code, category_code_id, entry_source, ref_entry_code, country, active_status)
			select common_code_category_entry_seq.nextval, :N.loan_type || '|' || :N.currency||'|' || fac_rec.account_type, 
				:N.desc_, category_code, category_id, 'ARBS', :N.source, 'MY', '1'
			from common_code_category where category_code = 'PRODUCT_TYPE';--
		else
			update common_code_category_entry
			set entry_name = :N.desc_, ref_entry_code = :N.source
			where category_code = 'PRODUCT_TYPE'
			and entry_code = (:N.loan_type || '|' || :N.currency||'|' || fac_rec.account_type)
			and entry_source = 'ARBS';--
		end if;--
	end LOOP;--
end;







/
ALTER TRIGGER "INS_HOST_PROD_TYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TG_CMS_ASSET_GC_DET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TG_CMS_ASSET_GC_DET" 
   AFTER INSERT OR 
   UPDATE OF status
   ON cms_asset_gc_det
   FOR EACH ROW
DECLARE
   v_cms_le_sub_profile_id   NUMBER (19)  :=0;
   v_cms_lsp_lmt_profile_id    NUMBER (19):=0;
BEGIN
IF :NEW.cms_collateral_id IS NOT NULL OR :NEW.cms_collateral_id > 0 THEN
   IF :NEW.status = 'APPROVED'
   THEN
   
      SELECT sp.cms_le_sub_profile_id, pf.cms_lsp_lmt_profile_id
        INTO v_cms_le_sub_profile_id, v_cms_lsp_lmt_profile_id
        FROM cms_limit_security_map lsm,
             sci_lsp_appr_lmts lmts,
             sci_lsp_lmt_profile pf,
             sci_le_sub_profile sp
       WHERE sp.cms_le_sub_profile_id = pf.cms_customer_id
         AND pf.cms_lsp_lmt_profile_id = lmts.cms_limit_profile_id
         AND lmts.cms_lsp_appr_lmts_id = lsm.cms_lsp_appr_lmts_id
         AND (lsm.update_status_ind <> 'D' OR lsm.update_status_ind IS NULL)
         AND lsm.cms_collateral_id = :NEW.cms_collateral_id
         AND rownum=1;
 
      UPDATE CMS_CHECKLIST_ITEM
         SET status = 'RECEIVED',
            received_date= SYSDATE
        WHERE checklist_id IN
                  (SELECT chk.checklist_id
                    FROM CMS_CHECKLIST chk
                    WHERE chk.cms_lsp_lmt_profile_id =v_cms_lsp_lmt_profile_id
                     AND chk.category='REC'
                  )
        AND document_code   = :NEW.DOC_CODE;
 
      
   END IF;
END IF;
   ---COMMIT;
END;







/
ALTER TRIGGER "TG_CMS_ASSET_GC_DET" DISABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CMS_PRICE_FEED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_CMS_PRICE_FEED" 
	BEFORE UPDATE
	ON CMS_PRICE_FEED
	REFERENCING 
	NEW AS NEW
	FOR EACH ROW 
  BEGIN 
	:NEW.STOCK_CODE := :NEW.TICKER;
  END;







/
ALTER TRIGGER "TRG_CMS_PRICE_FEED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CMS_STOCK_EX_U
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_CMS_STOCK_EX_U" 
	   AFTER UPDATE
	   ON CMS_STOCK_EXCHANGE
	   REFERENCING OLD AS OLD
	               NEW AS NEW
	   FOR EACH ROW
	 BEGIN 
	UPDATE	CMS_FEED_GROUP 
		SET group_subtype = :NEW.STOCK_EXCHANGE
	WHERE group_type = 'STOCK' AND group_subtype = :OLD.STOCK_EXCHANGE;	--
   END;







/
ALTER TRIGGER "TRG_CMS_STOCK_EX_U" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_POLICY_HIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRIG_POLICY_HIST" 
 	AFTER UPDATE ON cms_password_policy
	REFERENCING NEW AS N OLD AS O
	FOR EACH ROW
BEGIN
	IF (:O.number_warn_days <> :N.number_warn_days
		OR :O.pwd_max_age <> :N.pwd_max_age
		OR :O.max_repeated_chars <> :N.max_repeated_chars
		OR :O.pwd_min_age <> :N.pwd_min_age
		OR :O.min_alpha_chars <> :N.min_alpha_chars
		OR :O.pwd_min_length <> :N.pwd_min_length
		OR :O.pwd_max_length <> :N.pwd_max_length
		OR :O.pwd_history <> :N.pwd_history)
	THEN
		INSERT INTO cms_password_policy_history
		VALUES (:O.number_warn_days, :O.pwd_max_age, :O.max_repeated_chars, :O.pwd_min_age,
			 	:O.min_alpha_chars, :O.pwd_min_length, :O.pwd_max_length, :O.pwd_history,
			 	:N.number_warn_days, :N.pwd_max_age, :N.max_repeated_chars, :N.pwd_min_age,
			 	:N.min_alpha_chars, :N.pwd_min_length, :N.pwd_max_length, :N.pwd_history,
				CURRENT_TIMESTAMP, Sys_Context('USERENV', 'CURRENT_USER'));--
	END IF;--
END;







/
ALTER TRIGGER "TRIG_POLICY_HIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_HOST_PROD_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "UPD_HOST_PROD_TYPE" 
  AFTER UPDATE
  ON HOST_PRODUCT_TYPE
  REFERENCING NEW AS N OLD AS O
  FOR EACH ROW 
  DECLARE 
	t_entry_code varchar(60);
	cnt NUMBER;
BEGIN 
	for fac_rec IN ( 
			select distinct fac.ACCOUNT_TYPE 
			from host_facility_type fac, common_code_category_entry ccce
			where ccce.CATEGORY_CODE = 'FAC_PRODUCT_MAP'
			and ccce.ACTIVE_STATUS = '1'
			and :N.source = (case fac.account_type 
												when 'L' then 'LNPAR2'
												when 'D' then 'DDPAR2'
												when 'O' then 'DDPAR2'
												when 'F' then 'TFPAR2'
												else :N.source
												end)
			and fac.FACILITY_CODE = ccce.REF_ENTRY_CODE
			and :N.loan_type = ccce.ENTRY_CODE
			and :N.currency = ccce.entry_name)
	LOOP
		t_entry_code := :N.loan_type || '|' || :N.currency||'|' || fac_rec.account_type;--
		select count(*) into cnt from common_code_category_entry 
			where category_code = 'PRODUCT_TYPE' 
			and entry_code = t_entry_code
			and entry_source = 'ARBS';

		if (cnt = 0) 
			 then
				insert into common_code_category_entry 
					(entry_id, entry_code, entry_name, category_code, category_code_id, entry_source, ref_entry_code, country, active_status)
			select common_code_category_entry_seq.NEXTVAL, t_entry_code, 
				:N.desc_, category_code, category_id, 'ARBS', :N.source, 'MY', '1'
			from common_code_category where category_code = 'PRODUCT_TYPE';--
		else
			update common_code_category_entry
			set entry_name = :N.desc_, ref_entry_code = :N.source
			where category_code = 'PRODUCT_TYPE'
			and entry_code = t_entry_code
			and entry_source = 'ARBS';--
		end if;--
	end LOOP;--
end;







/
ALTER TRIGGER "UPD_HOST_PROD_TYPE" ENABLE;
