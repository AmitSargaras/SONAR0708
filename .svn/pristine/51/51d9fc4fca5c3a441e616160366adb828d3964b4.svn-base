Create Table Cms_Loa_Master
(Id Number(19,0) Not Null , 
Employee_Grade	VARCHAR2(50 CHAR),  
segment VARCHAR2(50 CHAR),
RANKING_OF_SEQUENCE Number(5),
Limit_Release_Amt Number(24,2),
Total_Sanctioned_Limit Number (32,2),
Property_Valuation_amt  Number (22,2),
Fd_Amount           Number(17,2),
Drawing_Power       Number(17,2),
SBLC_SECURITY_OMV Number(17,2),
facility_cam_covenant char(1) ,
VERSION_TIME     NUMBER(19) NOT NULL ,        
Created_By                Varchar2(50),      
CREATION_DATE    TIMESTAMP(9) NOT NULL ,      
Last_Update_By            Varchar2(50),      
LAST_UPDATE_DATE TIMESTAMP(9) NOT NULL ,      
Deprecated                Varchar2(50),      
Status           Varchar2(20 Char) Not Null 
);

Create Sequence CMS_LOA_MASTER_SEQ Minvalue 1 Maxvalue 999999999 Increment By 1 Start With 1 Nocache  Noorder  Cycle;

Create Table Cms_stage_Loa_Master
(Id Number(19) Not Null , 
Employee_Grade	VARCHAR2(50 CHAR),  
segment VARCHAR2(50 CHAR),
RANKING_OF_SEQUENCE Number(5),
Limit_Release_Amt Number(24,2),
Total_Sanctioned_Limit Number (32,2),
Property_Valuation_amt  Number (22,2),
Fd_Amount           Number(17,2),
Drawing_Power       Number(17,2),
SBLC_SECURITY_OMV Number(17,2),
facility_cam_covenant char(1) ,
VERSION_TIME     NUMBER(19) NOT NULL ,        
Created_By                Varchar2(50),      
CREATION_DATE    TIMESTAMP(9) NOT NULL ,      
Last_Update_By            Varchar2(50),      
LAST_UPDATE_DATE TIMESTAMP(9) NOT NULL ,      
Deprecated                Varchar2(50),      
Status           Varchar2(20 Char) Not Null 
) ;

Create Sequence CMS_STAGE_LOA_MASTER_SEQ Minvalue 1 Maxvalue 999999999 Increment By 1 Start With 1 Nocache  Noorder  Cycle;

 CREATE TABLE CMS_LOA_MASTER_TRX_LOG
   (	ID NUMBER(19) NOT NULL,
  User_Id Varchar2(50),
  Cms_Stage_Loa_Master_Id Number(19),
  Trx_Hist_Id Number(19),
  Exceptional_User Char(1),
  Trx_Limit_Release_Amt Number(24,2),
  Trx_Total_Sanctioned_Limit Number (32,2),
  Trx_Property_Valuation_Amt  Number (22,2),
  Trx_Fd_Amount           Number(17,2),
  Trx_Drawing_Power       Number(17,2),
  Trx_Sblc_Security_Omv Number(17,2),
  TRX_FACILITY_CAM_COVENANT CHAR(1),
	MAKER_ID VARCHAR2(50), 
	CHECKER_ID VARCHAR2(50), 
	MAKER_DATETIME TIMESTAMP (9), 
	CHECKER_DATETIME TIMESTAMP (9)
   );

Create Sequence CMS_LOA_MASTER_TRX_LOG_SEQ Minvalue 1 Maxvalue 999999999 Increment By 1 Start With 1 Nocache  Noorder  Cycle;


Alter Table Cms_User Add (Employee_Grade Varchar2(50));
alter table Cms_User add (OVERRIDE_EXC_LOA char(1) Default 'N');

Alter Table Stage_User Add (Employee_Grade Varchar2(50));
Alter Table Stage_User Add (Override_Exc_Loa Char(1) Default 'N');


Alter Table Cms_Facility_New_Master Add (Line_Exclude_From_Loa Char(1));
Alter Table Cms_Stage_Facility_New_Master Add (Line_Exclude_From_Loa Char(1));

Alter Table Sci_Le_Sub_Profile
ADD SANCTIONED_AMT_UPDATED_FLAG char(1);

Alter Table Stage_Sci_Le_Sub_Profile
ADD SANCTIONED_AMT_UPDATED_FLAG char(1);

Alter Table Trans_History
  Add 
  ( MIN_EMPLOYEE_GRADE VARCHAR2(20));
	  
	  
Alter Table Transaction
  Add 
  ( MIN_EMPLOYEE_GRADE VARCHAR2(20));