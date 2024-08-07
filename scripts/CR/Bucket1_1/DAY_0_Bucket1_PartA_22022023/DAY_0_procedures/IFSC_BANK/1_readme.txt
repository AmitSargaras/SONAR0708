Follow below steps:

  CREATE TABLE TEMP_CHANGES_IFSC
  (
  LSP_LE_ID  VARCHAR2(100),
  LSP_SHORT_NAME  VARCHAR2(200),
  IFSC_CODE   VARCHAR2(50),
  ID  NUMBER(38),
  CMS_LE_MAIN_PROFILE_ID  NUMBER(38),
  REVISED_EMAIL_ID  VARCHAR2(200)
  );
  
  ALTER TABLE TEMP_CHANGES_IFSC ADD (UPDATE_STATUS  VARCHAR2(20) DEFAULT 'N');

COMMIT;

2)Import "_________________.XLSX" file Data into TEMP_CHANGES_IFSC table   .

3)Create and compile Procedure - SP_Update_IFSC.txt

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_Update_IFSC();
                END;

5)After execution of procedure is complete then validate the data with below query:
SELECT * FROM TEMP_CHANGES_IFSC WHERE UPDATE_STATUS = 'N';


