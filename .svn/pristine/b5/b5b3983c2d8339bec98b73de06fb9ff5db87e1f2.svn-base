Follow below steps:

CREATE TABLE DAY_ZERO_MIG_CAM_UI_FACILITY(
TENOR NUMBER(10), 
TENOR_UNIT VARCHAR2(20 CHAR) ,
MARGIN NUMBER(10),
Customer_Cif Varchar2(100), 
Facility_Id number(19), 
FACILITY_NAME varchar2(100),
CMS_LSP_APPR_LMTS_ID Number(19), 
Staging_Lmt_Id Number(19)
);
  
  SELECT * FROM DAY_ZERO_MIG_CAM_UI_FACILITY;
   
  ALTER TABLE DAY_ZERO_MIG_CAM_UI_FACILITY ADD (UPDATE_STATUS  VARCHAR2(20) DEFAULT 'N');
  ALTER TABLE DAY_ZERO_MIG_CAM_UI_FACILITY ADD (IS_VALIDATED  VARCHAR2(20) DEFAULT 'N');

COMMIT;

2)Import "____________________.XLSX" file Data into DAY_ZERO_MIG_CAM_UI_FACILITY table .

3)Validate the data by creating and compiling 'SP_Facilty_Screen_Mig_First_validate.txt' 

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    sp_mig_cam_ui_facility_tenor_VALIDATE();
                END;

5)After successfully validating create and compile Procedure - SP_Facilty_Screen_Mig.txt

6) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    sp_mig_cam_ui_facility();
                END;

5)After execution of procedure is complete then validate the data with below query:
SELECT * FROM DAY_ZERO_MIG_CAM_UI_FACILITY WHERE UPDATE_STATUS = 'N';


