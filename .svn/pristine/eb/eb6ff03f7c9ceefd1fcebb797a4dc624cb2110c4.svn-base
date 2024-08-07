Follow below steps:

CREATE TABLE MIG_CAM_UI_FACILITY_SCREEN(
Llp_Le_Id VARCHAR2(50) ,
Lmt_Id VARCHAR2(50),
NEW_FACILITY_CODE VARCHAR2(50),
Facility_Name varchar2(100),
CMS_LSP_APPR_LMTS_ID Number(19), 
Staging_Lmt_Id Number(19),
PUT_CALL_OPTION varchar2(50),
OPTION_DATE TIMESTAMP(9),
Availability_Date TIMESTAMP(9)
);
  
  SELECT * FROM MIG_CAM_UI_FACILITY_SCREEN;
   
  ALTER TABLE MIG_CAM_UI_FACILITY_SCREEN ADD (UPDATE_STATUS  VARCHAR2(20) DEFAULT 'N');
  ALTER TABLE MIG_CAM_UI_FACILITY_SCREEN ADD (IS_VALIDATED  VARCHAR2(20) DEFAULT 'N');

COMMIT;

2)Import "____________________.XLSX" file Data into MIG_CAM_UI_FACILITY_SCREEN table   .

3)Create and compile Procedure - SP_Facilty_Screen_Mig_Second_validate.txt

4) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    sp_mig_cam_ui_facility_REM_VALIDATE();
                END;

5)Create and compile Procedure - SP_Facilty_Screen_Mig_Second.txt
6) Execute procedure to update actual and stagging table with below query.

                BEGIN
                    sp_mig_cam_ui_facility_REM();
                END;

5)After execution of procedure is complete then validate the data with below query:
SELECT * FROM MIG_CAM_UI_FACILITY_SCREEN WHERE UPDATE_STATUS = 'N';


