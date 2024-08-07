drop procedure DC_RUN_DOC
@

CREATE PROCEDURE DC_RUN_DOC
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_DOC', 'DC', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	update cms_security a set 
	(a.security_maturity_date, a.custodian_type, a.security_custodian, exchange_control_obtained) =
	(select b.SECURITY_MATURITY_DATE, b.custodian_type_code, b.SECURITY_CUSTODIAN_VALUE, b.EXCHANGE_CONTROL_OBTAINED
	from dc_DOC b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_DOC where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');

	update cms_stage_security a set 
	(a.security_maturity_date, a.custodian_type, a.security_custodian, exchange_control_obtained) =
	(select b.SECURITY_MATURITY_DATE, b.custodian_type_code, b.SECURITY_CUSTODIAN_VALUE, b.EXCHANGE_CONTROL_OBTAINED
	from dc_DOC b, cms_stage_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_DOC where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');
	
	---------------------------------------------------------
	-- updating corresponding value in asset table
	----------------------------------------------------------
	update cms_document a set
	(a.isda_date, a.isda_prod_desc, a.ifema_date, a.ifema_prod_desc, a.icom_date, a.icom_prod_desc, 
	 a.document_date, a.min_amt, a.min_amt_ccy, a.max_amt, a.max_amt_ccy, a.doc_amt, a.doc_amt_ccy,
	 deed_assignmt_type, doc_desc, doc_ref_no) =
	(Select b.ISDA_AGREEMENT_DATE, b.ISDA_DESC, b.IFEMA_AGREEMENT_DATE, b.IFEMA_DESC, b.ICOM_DOCUMENT_DATE, b.ICOM_DESC,
	 b.DOCUMENT_DATE, b.MIN_AMT, b.MIN_AMT_CCY, b.MAX_AMT, b.MAX_AMT_CCY, b.DOCUMENT_AMT, b.DOCUMENT_AMT_CCY,
	 b.TYPE_DEED_ASSN_CODE, b.SPECIFIC_UNDERTAKING_REMARKS, b.REF_NUMBER
	from dc_doc b, cms_document c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab102 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');	
	
	update cms_stage_document a set
	(a.isda_date, a.isda_prod_desc, a.ifema_date, a.ifema_prod_desc, a.icom_date, a.icom_prod_desc, 
	 a.document_date, a.min_amt, a.min_amt_ccy, a.max_amt, a.max_amt_ccy, a.doc_amt, a.doc_amt_ccy,
	 deed_assignmt_type, doc_desc, doc_ref_no) =
	(Select b.ISDA_AGREEMENT_DATE, b.ISDA_DESC, b.IFEMA_AGREEMENT_DATE, b.IFEMA_DESC, b.ICOM_DOCUMENT_DATE, b.ICOM_DESC,
	 b.DOCUMENT_DATE, b.MIN_AMT, b.MIN_AMT_CCY, b.MAX_AMT, b.MAX_AMT_CCY, b.DOCUMENT_AMT, b.DOCUMENT_AMT_CCY,
	 b.TYPE_DEED_ASSN_CODE, b.SPECIFIC_UNDERTAKING_REMARKS, b.REF_NUMBER
	from dc_doc b, cms_stage_document c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab102 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');	
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_DOC', 'DC', 0);	
END
@
