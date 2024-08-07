
1. Create a table using below query

CREATE TABLE PARTY_BANKING_METHOD_MIGRATION_STATUS
  (
    LSP_LE_ID VARCHAR2(300),
    IS_UPDATED VARCHAR2(2000)
  ) ;
  

2)Create and compile Procedure -'SP_PARTY_BANK_METHOD_MIG.txt'

3) Execute procedure to update actual and stagging table with below query.

             BEGIN
                    SP_PARTY_BANK_METHOD_MIG();
END;


4)After execution of procedure is complete then validate the data with below query:
SELECT * FROM PARTY_BANKING_METHOD_MIGRATION_STATUS;



select * from PARTY_BANKING_METHOD_MIGRATION_STATUS;