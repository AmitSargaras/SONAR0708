DROP TABLE TEMP_CMS_SECURITY_VALUATION;

DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_CMS_VALUATION_MVAL (
	CMS_COLLATERAL_ID 		BIGINT,
	CMV 					DECIMAL(20, 2),
	VALUATION_DATE 			TIMESTAMP,
	SOURCE_ID 				VARCHAR(10)
) 
WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;	

DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_CMS_VALUATION_SVAL (
	CMS_COLLATERAL_ID 		BIGINT,
	CMV 					DECIMAL(20, 2),
	VALUATION_DATE 			TIMESTAMP,
	SOURCE_ID 				VARCHAR(10)
) 
WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_CMS_VALUATION_LVAL (
	CMS_COLLATERAL_ID 		BIGINT,
	CMV 					DECIMAL(20, 2),
	VALUATION_DATE 			TIMESTAMP,
	SOURCE_ID 				VARCHAR(10)
) 
WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_CMS_SECURITY_MVAL (
	CMS_COLLATERAL_ID 			BIGINT,
	SCI_SECURITY_DTL_ID			VARCHAR(50),
	SCI_SECURITY_SUBTYPE_VALUE	VARCHAR(10),
	SCI_SECURITY_TYPE_VALUE		VARCHAR(10),
	PROPERTY_COMPLETION_STATUS	VARCHAR(1),
	SALE_PURCHASE_DATE			TIMESTAMP,
	SALE_PURCHASE_VALUE			DECIMAL(20, 2),
	MCMV 						DECIMAL(20, 2),
	MVALUATION_DATE 			TIMESTAMP,
	MSOURCE_ID 					VARCHAR(10),
	STATE						VARCHAR(40),
	POSTCODE 					VARCHAR(15),
	PROPERTY_ADDRESS			VARCHAR(40),
	PROPERTY_ADDRESS_2			VARCHAR(40),
	PROPERTY_ADDRESS_3			VARCHAR(40),
	SIBS_MUKIM_DISTRICT			VARCHAR(40)
) 
WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_CMS_SECURITY_MVAL_SYSVAL (
	CMS_COLLATERAL_ID 			BIGINT,
	SCI_SECURITY_DTL_ID			VARCHAR(50),
	SCI_SECURITY_SUBTYPE_VALUE	VARCHAR(10),
	SCI_SECURITY_TYPE_VALUE		VARCHAR(10),
	PROPERTY_COMPLETION_STATUS	VARCHAR(1),
	SALE_PURCHASE_DATE			TIMESTAMP,
	SALE_PURCHASE_VALUE			DECIMAL(20, 2),	
	MCMV 						DECIMAL(20, 2),
	MVALUATION_DATE 			TIMESTAMP,
	MSOURCE_ID 					VARCHAR(10),
	STATE						VARCHAR(40),
	POSTCODE 					VARCHAR(15),
	PROPERTY_ADDRESS			VARCHAR(40),
	PROPERTY_ADDRESS_2			VARCHAR(40),
	PROPERTY_ADDRESS_3			VARCHAR(40),
	SIBS_MUKIM_DISTRICT			VARCHAR(40),
	SYSCMV 						DECIMAL(20, 2),
	SYSVALUATION_DATE 			TIMESTAMP,
	SYSSOURCE_ID 				VARCHAR(10)
) 
WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_CMS_SECURITY_MVAL_SYSVAL_LVAL (
	CMS_COLLATERAL_ID 			BIGINT,
	SCI_SECURITY_DTL_ID			VARCHAR(50),
	SCI_SECURITY_SUBTYPE_VALUE	VARCHAR(10),
	SCI_SECURITY_TYPE_VALUE		VARCHAR(10),
	PROPERTY_COMPLETION_STATUS	VARCHAR(1),
	SALE_PURCHASE_DATE			TIMESTAMP,
	SALE_PURCHASE_VALUE			DECIMAL(20, 2),	
	MCMV 						DECIMAL(20, 2),
	MVALUATION_DATE 			TIMESTAMP,
	MSOURCE_ID 					VARCHAR(10),
	STATE						VARCHAR(40),
	POSTCODE 					VARCHAR(15),
	PROPERTY_ADDRESS			VARCHAR(40),
	PROPERTY_ADDRESS_2			VARCHAR(40),
	PROPERTY_ADDRESS_3			VARCHAR(40),
	SIBS_MUKIM_DISTRICT			VARCHAR(40),
	SYSCMV 						DECIMAL(20, 2),
	SYSVALUATED_DATE 			TIMESTAMP,
	SYSSOURCE_ID 				VARCHAR(10),
	LCMV 						DECIMAL(20, 2),
	LVALUATION_DATE 			TIMESTAMP,
	LSOURCE_ID 					VARCHAR(10)
) 
WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

CREATE TABLE TEMP_CMS_SECURITY_VALUATION (
	AA_NUMBER					VARCHAR(35),
--	CMS_COLLATERAL_ID 			BIGINT,
	SIBS_SECURITY_ID			VARCHAR(50),
	SECURITY_SUBTYPE			VARCHAR(10),
	SECURITY_TYPE				VARCHAR(10),
	PROPERTY_COMPLETION_STATUS	VARCHAR(1),
	SALE_PURCHASE_DATE			TIMESTAMP,
	SALE_PURCHASE_VALUE			DECIMAL(20, 2),	
	MANUAL_OMV					DECIMAL(20, 2),
	MANUAL_VAL_DATE 			TIMESTAMP,
	MANUAL_SOURCE_ID			VARCHAR(10),
	SYS_OMV						DECIMAL(20, 2),
	SYS_VAL_DATE	 			TIMESTAMP,
	SYS_SOURCE_ID 				VARCHAR(10),
	LOS_OMV						DECIMAL(20, 2),
	LOS_VAL_DATE	 			TIMESTAMP,
	LOS_SOURCE_ID				VARCHAR(10),
	FACILITY_ID					VARCHAR(43),
	FACILITY_CODE				VARCHAR(3),
	OUTSTANDING_BALANCE			DECIMAL(20, 2),
	ACCOUNT_NUMBER				VARCHAR(50),
	STATE						VARCHAR(40),
	POSTCODE 					VARCHAR(15),
	PROPERTY_ADDRESS			VARCHAR(40),
	PROPERTY_ADDRESS_2			VARCHAR(40),
	PROPERTY_ADDRESS_3			VARCHAR(40),
	SIBS_MUKIM_DISTRICT			VARCHAR(40)
);

create index IDX_PATCH_PT_001 ON PATCH_CO009_PT (SECURITY_ID ASC, SIBS_PROPERTY_ADDRESS ASC) allow reverse scans;

drop index IDX_PATCH_PT_001;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Manual Valuation
insert into SESSION.TEMP_CMS_VALUATION_MVAL (	
	select mval.CMS_COLLATERAL_ID, mval.CMV, mval.VALUATION_DATE, mval.SOURCE_ID from CMS_VALUATION mval
	where mval.SOURCE_TYPE = 'M'
	and mval.VALUATION_ID = (select max(maxmval.VALUATION_ID) from CMS_VALUATION maxmval
							where maxmval.SOURCE_TYPE = 'M'
							and maxmval.CMS_COLLATERAL_ID = mval.CMS_COLLATERAL_ID));

-- System valuation			
insert into SESSION.TEMP_CMS_VALUATION_SVAL (	
	select sval.CMS_COLLATERAL_ID, sval.CMV, sval.VALUATION_DATE, sval.SOURCE_ID from CMS_VALUATION sval
	where sval.SOURCE_TYPE = 'A'
	and sval.VALUATION_ID = (select max(maxsval.VALUATION_ID) from CMS_VALUATION maxsval
							where maxsval.SOURCE_TYPE = 'A'
							and maxsval.CMS_COLLATERAL_ID = sval.CMS_COLLATERAL_ID));							
							
-- Los Valuation							
insert into SESSION.TEMP_CMS_VALUATION_LVAL (	
	select lval.CMS_COLLATERAL_ID, lval.CMV, lval.VALUATION_DATE, lval.SOURCE_ID from CMS_VALUATION lval
	where lval.SOURCE_TYPE = 'S'
	and lval.VALUATION_ID = (select max(maxlval.VALUATION_ID) from CMS_VALUATION maxlval
							where maxlval.SOURCE_TYPE = 'S'
							and maxlval.CMS_COLLATERAL_ID = lval.CMS_COLLATERAL_ID));		
							
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

insert into SESSION.TEMP_CMS_SECURITY_MVAL (						
	select sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID, sec.SCI_SECURITY_SUBTYPE_VALUE, sec.SCI_SECURITY_TYPE_VALUE, pty.PROPERTY_COMPLETION_STATUS,
	    pty.SALE_PURCHASE_DATE, pty.SALE_PURCHASE_VALUE, mval.CMV, mval.VALUATION_DATE, mval.SOURCE_ID, 
		pty.STATE, pty.POSTCODE, pty.PROPERTY_ADDRESS, pty.PROPERTY_ADDRESS_2, pty.PROPERTY_ADDRESS_3, ''
	from CMS_PROPERTY pty, CMS_SECURITY sec left outer join
	    (select mval.CMS_COLLATERAL_ID, mval.CMV, mval.VALUATION_DATE, mval.SOURCE_ID from SESSION.TEMP_CMS_VALUATION_MVAL mval) mval
	    ON sec.CMS_COLLATERAL_ID = mval.CMS_COLLATERAL_ID
	where sec.CMS_COLLATERAL_ID = pty.CMS_COLLATERAL_ID
	and sec.SECURITY_SUB_TYPE_ID = 'PT704'
	and sec.STATUS = 'ACTIVE'
);

UPDATE SESSION.TEMP_CMS_SECURITY_MVAL tmp
SET tmp.SIBS_MUKIM_DISTRICT = (select pt.SIBS_PROPERTY_ADDRESS from PATCH_CO009_PT pt
								where pt.SECURITY_ID = tmp.SCI_SECURITY_DTL_ID)
WHERE EXISTS (select 1 from PATCH_CO009_PT pt1
				where pt1.SECURITY_ID = tmp.SCI_SECURITY_DTL_ID);

insert into SESSION.TEMP_CMS_SECURITY_MVAL_SYSVAL (						
	SELECT secval.*, sval.CMV, sval.VALUATION_DATE, sval.SOURCE_ID FROM SESSION.TEMP_CMS_SECURITY_MVAL secval
	left outer join SESSION.TEMP_CMS_VALUATION_SVAL sval
	on secval.CMS_COLLATERAL_ID = sval.CMS_COLLATERAL_ID	
);

insert into SESSION.TEMP_CMS_SECURITY_MVAL_SYSVAL_LVAL (
	SELECT secval.*, lval.CMV, lval.VALUATION_DATE, lval.SOURCE_ID FROM SESSION.TEMP_CMS_SECURITY_MVAL_SYSVAL secval
	left outer join SESSION.TEMP_CMS_VALUATION_LVAL lval
	on secval.CMS_COLLATERAL_ID = lval.CMS_COLLATERAL_ID
);

INSERT INTO TEMP_CMS_SECURITY_VALUATION (
	select lmt.LMT_BCA_REF_NUM as AA_NUMBER, secval.SCI_SECURITY_DTL_ID as SIBS_SECURITY_ID, 
	    secval.SCI_SECURITY_SUBTYPE_VALUE as SECURITY_SUBTYPE, secval.SCI_SECURITY_TYPE_VALUE as SECURITY_TYPE, 
	    secval.PROPERTY_COMPLETION_STATUS, secval.SALE_PURCHASE_DATE, secval.SALE_PURCHASE_VALUE,
		secval.MCMV as MANUAL_OMV, secval.MVALUATION_DATE as MANUAL_VAL_DATE, secval.MSOURCE_ID as MANUAL_SOURCE_ID,
	    secval.SYSCMV as SYS_OMV, secval.SYSVALUATED_DATE as SYS_VAL_DATE, secval.SYSSOURCE_ID as SYS_SOURCE_ID,
	    secval.LCMV as LOS_OMV, secval.LVALUATION_DATE as LOS_VAL_DATE, secval.LSOURCE_ID as LOS_SOURCE_ID,
	    lmt.LMT_ID as FACILITY_ID, lmt.LMT_FAC_CODE as FACILITY_CODE, lmt.CMS_OUTSTANDING_AMT as OUTSTANDING_BALANCE, 
	    acc.LSX_EXT_SYS_ACCT_NUM as LOAN_ACCOUNT_NUMBER,
        (select comm.entry_name as STATE from common_code_category_entry comm
            where comm.CATEGORY_CODE = 'STATE'
            and comm.ENTRY_CODE = secval.STATE),
        secval.POSTCODE, secval.PROPERTY_ADDRESS, secval.PROPERTY_ADDRESS_2, secval.PROPERTY_ADDRESS_3, secval.SIBS_MUKIM_DISTRICT
	from SESSION.TEMP_CMS_SECURITY_MVAL_SYSVAL_LVAL secval, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt, 
	    SCI_LSP_LMTS_XREF_MAP accmap, SCI_LSP_SYS_XREF acc
	where secval.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
	and lmt.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
	and accmap.CMS_LSP_SYS_XREF_ID = acc.CMS_LSP_SYS_XREF_ID
);
