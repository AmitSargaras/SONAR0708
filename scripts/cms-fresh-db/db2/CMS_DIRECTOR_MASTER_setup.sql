-----------------------------------------------
-- DDL Statements for table "ABCLIMS "."CMS_DIRECTOR_MASTER"
------------------------------------------------
 

CREATE TABLE "ABCLIMS "."CMS_DIRECTOR_MASTER"  (
		  "ID" BIGINT NOT NULL , 
		  "VERSION_TIME" BIGINT , 
		  "CREATE_BY" VARCHAR(50) , 
		  "CREATION_DATE" TIMESTAMP , 
		  "LAST_UPDATE_BY" VARCHAR(50) , 
		  "LAST_UPDATE_DATE" TIMESTAMP , 
		  "DEPRECATED" CHAR(1) , 
		  "STATUS" VARCHAR(20) , 
		  "DIN_NO" VARCHAR(100) , 
		  "NAME" VARCHAR(300) , 
		  "RELATIONSHIP" VARCHAR(100) , 
		  "ACTION" VARCHAR(1024) )   
		 IN "USERSPACE1" ; 


-- DDL Statements for primary key on Table "ABCLIMS "."CMS_DIRECTOR_MASTER"

ALTER TABLE "ABCLIMS "."CMS_DIRECTOR_MASTER" 
	ADD CONSTRAINT "PK_DIRECTOR_MASTER" PRIMARY KEY
		("ID");
		

------------------------------------------------
-- DDL Statements for table "ABCLIMS "."CMS_STAGE_DIRECTOR_MASTER"
------------------------------------------------
 

CREATE TABLE "ABCLIMS "."CMS_STAGE_DIRECTOR_MASTER"  (
		  "ID" BIGINT NOT NULL , 
		  "VERSION_TIME" BIGINT , 
		  "CREATE_BY" VARCHAR(50) , 
		  "CREATION_DATE" TIMESTAMP , 
		  "LAST_UPDATE_BY" VARCHAR(50) , 
		  "LAST_UPDATE_DATE" TIMESTAMP , 
		  "DEPRECATED" CHAR(1) , 
		  "STATUS" VARCHAR(20) , 
		  "DIN_NO" VARCHAR(100) , 
		  "NAME" VARCHAR(300) , 
		  "RELATIONSHIP" VARCHAR(100) , 
		  "ACTION" VARCHAR(1024) )   
		 IN "USERSPACE1" ; 








