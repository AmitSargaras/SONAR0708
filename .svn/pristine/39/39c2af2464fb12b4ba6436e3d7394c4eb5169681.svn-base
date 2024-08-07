Follow below steps:

  CREATE TABLE FACILTY_MASTER_MIG_TEMP
  (
  FACILTY_MASTER_ID  VARCHAR2(300),
  NEW_FACILITY_NAME  VARCHAR2(300),
  NEW_FACILITY_CODE   VARCHAR2(300),
  NEW_FACILITY_TYPE  VARCHAR2(300),
  NEW_FACILITY_CATEGORY  VARCHAR2(300),
  LINE_NUMBER  VARCHAR2(300),
  AVAIL_AND_OPTION_APPLICABLE  VARCHAR2(300),
  Selected_RISK_TYPE_CODE  VARCHAR2(2000)
  ) ;
  
  SELECT * FROM FACILTY_MASTER_MIG_TEMP;
   
  ALTER TABLE FACILTY_MASTER_MIG_TEMP ADD (UPDATE_STATUS  VARCHAR2(20) DEFAULT 'N');
  ALTER TABLE FACILTY_MASTER_MIG_TEMP ADD (IS_VALIDATED  VARCHAR2(20) DEFAULT 'N');
  


COMMIT;

2)Import "____________________.XLSX" file Data into FACILTY_MASTER_MIG_TEMP table   .

2.1)Update FACILTY_MASTER_MIG_TEMP SET AVAIL_AND_OPTION_APPLICABLE = 'off';



3)Create and compile Procedure - FACILITY_MASTER_VALIDATE.txt

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_FACILTY_MASTER_MIG_VALIDATE();
                END;
				
5)Create and compile Procedure - SP_Facilty_Master_Mig.txt

6) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    SP_FACILTY_MASTER_MIG();
                END;



7)After execution of procedure is complete then validate the data with below query-

8)Update CMS_FACILITY_NEW_MASTER SET AVAIL_AND_OPTION_APPLICABLE = 'off';

SELECT * FROM FACILTY_MASTER_MIG_TEMP WHERE UPDATE_STATUS = 'N';

