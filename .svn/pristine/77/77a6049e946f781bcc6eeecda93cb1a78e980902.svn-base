Follow below steps:

  CREATE TABLE TEMP_CHANGES_PARTY_BANK
  (
    LSP_LE_ID                                  VARCHAR2(100),
    LSP_SHORT_NAME                             VARCHAR2(100),
    CMS_LE_SUB_PROFILE_ID                      NUMBER(19),
    CMS_LE_MAIN_PROFILE_ID                     NUMBER(19),
    LSP_SGMNT_CODE_VALUE                       VARCHAR2(100),
    BANKING_METHOD                             VARCHAR2(200),
    MULTBNK_FUNDBSE_HDFCBNK_PER                NUMBER(22,2),
    MULTBNK_NONFUNDBSE_LEADBNK_PER             NUMBER(22,2),
    MULTBNK_NONFUNDBSE_HDFCBNK_PER             NUMBER(22,2),
    MULTBNK_FUNDBSE_LEADBNK_PER NUMBER(22,2),
    CONSBNK_FUNDBSE_LEADBNK_PER                NUMBER(22,2),
    CONSBNK_FUNDBSE_HDFCBNK_PER                NUMBER(22,2),
    CONSBNK_NONFUNDBSE_LEADBNK_PER             NUMBER(22,2),
    CONSBNK_NONFUNDBSE_HDFCBNK_PER             NUMBER(22,2)
  );
  
  SELECT * FROM TEMP_CHANGES_PARTY_BANK;
   
  ALTER TABLE TEMP_CHANGES_PARTY_BANK ADD (UPDATE_STATUS  VARCHAR2(20) DEFAULT 'N');

COMMIT;

2)Import "_______________.XLSX" file Data into TEMP_CHANGES_PARTY_BANK table   .

3)Create and compile Procedure - SP_PARTY_SCREEN_BANK_MIG.txt

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_PARTY_SCREEN_BANK_MIG();
                END;

5)After execution of procedure is complete then validate the data with below query:
SELECT * FROM TEMP_CHANGES_PARTY_BANK WHERE UPDATE_STATUS = 'N';


