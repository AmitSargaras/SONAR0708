------------------------------------------------
-- DDL Statements for table "ABCLIMS "."CMS_CREDIT_APPROVAL"
------------------------------------------------
 

CREATE TABLE "ABCLIMS "."CMS_CREDIT_APPROVAL"  (
		  "ID" BIGINT NOT NULL , 
		  "APPROVAL_CODE" VARCHAR(20) NOT NULL , 
		  "APPROVAL_NAME" VARCHAR(50) NOT NULL , 
		  "MAXIMUM_LIMIT" DECIMAL(20,2) NOT NULL , 
		  "MINIMUM_LIMIT" DECIMAL(20,2) NOT NULL , 
		  "SEGMENT" VARCHAR(50) NOT NULL , 
		  "EMAIL" VARCHAR(300) NOT NULL , 
		  "SENIOR" CHAR(1) NOT NULL , 
		  "RISK" CHAR(1) NOT NULL , 
		  "VERSION_TIME" BIGINT NOT NULL , 
		  "CREATE_BY" VARCHAR(20) NOT NULL , 
		  "CREATION_DATE" TIMESTAMP NOT NULL , 
		  "LAST_UPDATE_BY" VARCHAR(20) NOT NULL , 
		  "LAST_UPDATE_DATE" TIMESTAMP NOT NULL , 
		  "DEPRECATED" CHAR(1) NOT NULL , 
		  "STATUS" VARCHAR(60) NOT NULL )   
		 IN "CMS_SMALL_DATA" INDEX IN "CMS_INDEX" ; 


-- DDL Statements for primary key on Table "ABCLIMS "."CMS_CREDIT_APPROVAL"

ALTER TABLE "ABCLIMS "."CMS_CREDIT_APPROVAL" 
	ADD CONSTRAINT "PK_CREDIT_APPROVAL" PRIMARY KEY
		("ID");


------------------------------------------------
-- DDL Statements for table "ABCLIMS "."CMS_STAGE_CREDIT_APPROVAL"
------------------------------------------------
 CREATE TABLE cms_stage_credit_approval (
  id               NUMBER(19,0)  NOT NULL,
  approval_code    VARCHAR2(20)  NOT NULL,
  approval_name    VARCHAR2(50)  NULL,
  maximum_limit    NUMBER(38,2)  NULL,
  minimum_limit    NUMBER(38,2)  NULL,
  "SEGMENT"          VARCHAR2(50)  NULL,
  email            VARCHAR2(300) NULL,
  senior           CHAR(1)       NULL,
  risk             CHAR(1)       NULL,
  deferral_powers  CHAR(1)       NULL,
  waiving_powers   CHAR(1)       NULL,
  region_id        NUMBER(19,0)  NULL,
  version_time     NUMBER(19,0)  NULL,
  create_by        VARCHAR2(20)  NULL,
  creation_date    TIMESTAMP(9)  NULL,
  last_update_by   VARCHAR2(20)  NULL,
  last_update_date TIMESTAMP(9)  NULL,
  deprecated       CHAR(1)       NULL,
  status           VARCHAR2(60)  NULL
)


-- DDL Statements for primary key on Table "ABCLIMS "."CMS_STAGE_CREDIT_APPROVAL"

ALTER TABLE cms_stage_credit_approval
  ADD CONSTRAINT pk_stage_credit_approval PRIMARY KEY (
    id
  )


