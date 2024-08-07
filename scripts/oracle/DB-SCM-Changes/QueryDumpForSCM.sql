---To send party details
SELECT   
sp.status,  
sp.LSP_LE_ID  , 
sp.LSP_SHORT_NAME,   
cri.msme_classification,    
sp.entity,
sp.PAN,    
sp.ind_nm,
sp.cin_llpin,
to_char(sp.lsp_incorp_date,'DD-MON-YYYY') lsp_incorp_date,
sp.lsp_sgmnt_code_value,
rm.rm_mgr_code , 
sp.TOTAL_SANCTIONED_LIMIT, 
lp.CMS_APPR_OFFICER_GRADE, 
mp.WILLFUL_DEFAULT_STATUS, 
mp.class_activity_1,
 to_char(mp.DATE_WILLFUL_DEFAULT,'DD-MON-YYYY') DATE_WILLFUL_DEFAULT, 
 mp.SUIT_FILLED_STATUS, 
mp.SUIT_AMOUNT, 
to_char(mp.DATE_OF_SUIT,'DD-MON-YYYY') DATE_OF_SUIT, 
ra.LRA_TYPE_VALUE, 
	ra.LRA_ADDR_LINE_1,  
	ra.LRA_ADDR_LINE_2,   
 ra.LRA_ADDR_LINE_3,  
 ra.LRA_STD_CODE_TEL,  
	ra.LRA_TELEPHONE_TEXT,   
	cc.CITY_NAME,   
 reg.region_name,  
 (select distinct STATE_CODE from CMS_STATE where id = ra.LRA_STATE and STATUS='ACTIVE') as LRA_STATE,   
	(select distinct cntry.COUNTRY_NAME from CMS_COUNTRY cntry,CMS_STATE state where reg.id = state.region_id and reg.COUNTRY_ID=cntry.id) as country_name,  
 ra.LRA_FAX_NUM_TEXT,  
	ra.LRA_POST_CODE,  
ra.LRA_EMAIL_TEXT 
	FROM   
SCI_LE_REG_ADDR ra, sci_le_cri cri,SCI_LSP_LMT_PROFILE lp,SCI_LE_SUB_PROFILE sp,SCI_LE_main_PROFILE mp,  
CMS_RELATIONSHIP_MGR rm, CMS_CITY cc,CMS_REGION reg   
	WHERE   
	sp.CMS_LE_MAIN_PROFILE_ID = ra.CMS_LE_MAIN_PROFILE_ID 
	AND cri.CMS_LE_MAIN_PROFILE_ID = sp.CMS_LE_MAIN_PROFILE_ID
 AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id 
	AND sp.LSP_LE_ID = mp.lmp_le_id  
 AND rm.ID(+) = sp.RELATION_MGR   
AND sp.LSP_LE_ID = lp.LLP_LE_ID(+) 
AND ra.lra_region = reg.id(+) AND cc.id(+) = ra.lra_city_text AND sp.status != 'INACTIVE'  
AND ra.LRA_TYPE_VALUE in ('CORPORATE') ;


-- code for segment,rbi,default status etc from master table
select * from COMMON_CODE_CATEGORY_ENTRY where Category_code 
IN ('HDFC_SEGMENT','MSME_CLASSIC','HDFC_INDUSTRY','HDFC_RBI_CODE','WILLFUL_DEFAULT_STATUS','RISK_GRADE','SEGMENT_1','PRIORITY_SECTOR_Y','PRIORITY_SECTOR') 
and ACTIVE_STATUS = '1';

--STATE MASTER
select * from CMS_STATE;

--relationship mgr master
select * from CMS_RELATIONSHIP_MGR;