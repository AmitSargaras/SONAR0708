Follow below steps:

  CREATE TABLE TEMP_CHANGES_SYSTEM_BANK
  (
  ID  VARCHAR2(50),
  CMS_LE_MAIN_PROFILE_ID VARCHAR2(50),
  PARTY_ID VARCHAR2(50),
  BANK_ID  VARCHAR2(50),
  SYSTEM_BANK_NAME   VARCHAR2(60),
  SYSTEM_BANK_CODE  VARCHAR2(50),
  REVISED_EMAIL_ID  VARCHAR2(200)
  );
  
  ALTER TABLE TEMP_CHANGES_SYSTEM_BANK ADD (UPDATE_STATUS  VARCHAR2(20) DEFAULT 'N');

COMMIT;

2)Import "_________________.XLSX" file Data into TEMP_CHANGES_SYSTEM_BANK table   .

3)Create and compile Procedure - SP_Update_SYSTEM_BANK.txt

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_Update_SYSTEM_BANK();
                END;

5)After execution of procedure is complete then validate the data with below query:
SELECT * FROM TEMP_CHANGES_SYSTEM_BANK WHERE UPDATE_STATUS = 'N';


