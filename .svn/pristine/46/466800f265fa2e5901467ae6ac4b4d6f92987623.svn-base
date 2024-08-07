Follow below steps:

  CREATE TABLE TEMP_CHANGES_PARTY
  (
  LSP_LE_ID  VARCHAR2(100),
  LSP_SHORT_NAME  VARCHAR2(100),
  CMS_LE_SUB_PROFILE_ID   NUMBER(19),
  CMS_LE_MAIN_PROFILE_ID  NUMBER(19),
  LSP_SGMNT_CODE_VALUE  VARCHAR2(100),
  LISTED_COMPANY  VARCHAR2(10),
  YEAR_END_PERIOD  VARCHAR2(6),
  RARAOC_PERIOD  TIMESTAMP(9),
  RAROC  NUMBER(12,2),
  ISIN_NO  VARCHAR2(20),
  CREDIT_MANAGER_EMPLOYEE_ID  VARCHAR2(150),
  PF_LRD_CREDIT_MANAGER_EMPLOYEE_ID  VARCHAR2(150),
  CREDIT_MANAGERS_SEGMENT  VARCHAR2(250)
  ) ;
  
  SELECT * FROM TEMP_CHANGES_PARTY;
   
  ALTER TABLE TEMP_CHANGES_PARTY ADD (UPDATE_STATUS VARCHAR2(20) DEFAULT 'N');
  ALTER TABLE TEMP_CHANGES_PARTY ADD (IS_VALIDATED VARCHAR2(20) DEFAULT 'N');

COMMIT;

2)Import "_______________.XLSX" file Data into TEMP_CHANGES_PARTY table   .

3)Create and compile Procedure - PARTY_1_Validate.txt

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_PARTY_SCREEN_MIG_VALIDATE();
                END;


5)After ValidatingCreate and compile Procedure - SP_PARTY_SCREEN_MIG.txt

6) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_PARTY_SCREEN_MIG();
                END;

5)After execution of procedure is complete then validate the data with below query:
SELECT * FROM TEMP_CHANGES_PARTY WHERE UPDATE_STATUS = 'N';


