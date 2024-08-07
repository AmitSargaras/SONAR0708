SET serveroutput ON
SET timing ON

spool refresh_fam_view.LOG

DECLARE

    l_sql1 VARCHAR2(255) := 'TRUNCATE TABLE CUST_LOC_FAM REUSE STORAGE';

    l_sql2 VARCHAR2(255) := 'INSERT /*+ append */ INTO CUST_LOC_FAM SELECT * FROM VW_FAM NOLOGGING';

    l_sql3 VARCHAR2(255) := 'ALTER INDEX IDX_FAM_01 REBUILD TABLESPACE CMS_INDEX NOLOGGING';

    l_sql4 VARCHAR2(255) := 'TRUNCATE TABLE CMS_BCA_SEC_MAP REUSE STORAGE';

	l_sql5 VARCHAR2(2000) := 'INSERT /*+ append */ INTO CMS_BCA_SEC_MAP ' ||
		'select cms_lsp_lmt_profile_id, cms_customer_id, cms_collateral_id, ' ||
		'sci_security_dtl_id, llp_le_id, cms_orig_country, cms_orig_organisation, ' ||
		'security_location, cms_bca_status, status, security_organisation, cb_customer_id, ' ||
		'cb_orig_country, cb_orig_organisation, customer_category, lsp_short_name, ' ||
		'lsp_le_id, cb_legal_name, cb_le_id, fam_code, fam_name, customer_segment, ' ||
		'llp_id, lsp_id, cb_lsp_id from vw_bca_sec_map';

    l_sql6 VARCHAR2(255) := 'TRUNCATE TABLE CMS_BATCH_DDN_DOC REUSE STORAGE';

    l_sql7 VARCHAR2(255) := 'INSERT /*+ append */ INTO CMS_BATCH_DDN_DOC SELECT * FROM VW_BATCH_DDN_DOC ';

    l_sql8 VARCHAR2(255) := 'TRUNCATE TABLE CMS_BCA_COBORROWER_MAP REUSE STORAGE';    
    
    l_sql8a VARCHAR2(255) := 'INSERT INTO CMS_BCA_COBORROWER_MAP SELECT * FROM VW_BCA_COBORROWER_MAP';
    
    l_sql9 VARCHAR2(255) := 'TRUNCATE TABLE CMS_BCA_PLEDGOR_MAP REUSE STORAGE';    
    
    l_sql9a VARCHAR2(255) := 'INSERT INTO CMS_BCA_PLEDGOR_MAP SELECT * FROM VW_BCA_PLEDGOR_MAP';
    
    l_sql10 VARCHAR2(255) := 'TRUNCATE TABLE SECURITY_SUBTYPE_MAPPING REUSE STORAGE';
    
    l_sql10a VARCHAR2(255) := 'INSERT INTO SECURITY_SUBTYPE_MAPPING SELECT * FROM VW_SECURITY_DETAILS';

BEGIN

    dbms_output.put_line('***** truncating table cust_loc_fam *****');

    EXECUTE IMMEDIATE l_sql1;

    dbms_output.put_line('***** refreshing table cust_loc_fam *****');

    EXECUTE IMMEDIATE l_sql2;

    dbms_output.put_line('***** rebuilding fam index *****');

    EXECUTE IMMEDIATE l_sql3;

    dbms_output.put_line('***** truncating table cms_bca_sec_map *****');

    EXECUTE IMMEDIATE l_sql4;

    dbms_output.put_line('***** refreshing table cms_bca_sec_map *****');

 	EXECUTE IMMEDIATE l_sql5;

    dbms_output.put_line('***** truncating table cms_batch_ddn_doc *****');

    EXECUTE IMMEDIATE l_sql6;

    dbms_output.put_line('***** refreshing table cms_batch_ddn_doc *****');

 	EXECUTE IMMEDIATE l_sql7;

 	dbms_output.put_line('***** truncating table cms_bca_coborrower_map *****');
 	
 	EXECUTE IMMEDIATE l_sql8;
 	
 	dbms_output.put_line('***** refreshing table cms_bca_coborrower_map *****');
 	
 	EXECUTE IMMEDIATE l_sql8a;

	dbms_output.put_line('***** truncating table cms_bca_pledgor_map *****');	 	
	
	EXECUTE IMMEDIATE l_sql9;
	
	dbms_output.put_line('***** refreshing table cms_bca_pledgor_map *****');	
	
	EXECUTE IMMEDIATE l_sql9a;					

	dbms_output.put_line('***** truncating table security_subtype_mapping *****');	 	
	
	EXECUTE IMMEDIATE l_sql10;
	
	dbms_output.put_line('***** refreshing table security_subtype_mapping *****');	
	
	EXECUTE IMMEDIATE l_sql10a;	

	COMMIT;

 	dbms_stats.gather_table_stats( USER , 'CUST_LOC_FAM', method_opt => 'for all indexed columns', CASCADE => TRUE );
 	dbms_stats.gather_table_stats( USER , 'CMS_BCA_SEC_MAP', method_opt => 'for all indexed columns', CASCADE => TRUE );
	dbms_stats.gather_table_stats( USER , 'CMS_BATCH_DDN_DOC', method_opt => 'for all indexed columns', CASCADE => TRUE );
	dbms_stats.gather_table_stats( USER , 'CMS_BCA_COBORROWER_MAP', method_opt => 'for all indexed columns', CASCADE => TRUE );
	dbms_stats.gather_table_stats( USER , 'CMS_BCA_PLEDGOR_MAP', method_opt => 'for all indexed columns', CASCADE => TRUE );
	dbms_stats.gather_table_stats( USER , 'SECURITY_SUBTYPE_MAPPING', method_opt => 'for all indexed columns', CASCADE => TRUE );	
	
END;

/


spool OFF

