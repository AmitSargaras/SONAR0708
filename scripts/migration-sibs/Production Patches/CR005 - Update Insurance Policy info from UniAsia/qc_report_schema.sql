DROP TABLE PATCH_QC_REPORT;	
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCHEMA for QC REPORT
--------------------------------------	
CREATE TABLE PATCH_QC_REPORT(
    PATCH_ID	BIGINT	NOT NULL	GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE, NO MINVALUE, NO MAXVALUE, NO CYCLE, NO ORDER),
    RECORD_TYPE     VARCHAR(30),
    TEXT            VARCHAR(4000),
    SYSTEM_ID       VARCHAR(4),
    INTERFACE_ID	VARCHAR(7),
	KEY_VALUE1		VARCHAR(35), 	-- AA_NUMBER
	KEY_VALUE2		VARCHAR(40), 	-- SECURITY_REF_NOTE
	KEY_VALUE3		VARCHAR(3), 	-- POLICY_SEQ_NO
	KEY_VALUE4 		VARCHAR(100), 	-- POLICY_NUMBER
	KEY_VALUE5		VARCHAR(100), 	-- INSURER_NAME
	FLAG			VARCHAR(1)
)  IN CMS_MIG;