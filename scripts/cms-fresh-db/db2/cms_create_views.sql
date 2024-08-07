----------------------------
-- DDL Statements for Views
----------------------------

drop view applicable_law;

CREATE VIEW applicable_law (law_code, law_code_desc)
AS
   SELECT entry_code law_code, entry_name law_code_desc
     FROM common_code_category_entry
    WHERE category_code = 'APP_LAW';
    
drop view BORROWER_LOCATION_VIEW;

CREATE VIEW BORROWER_LOCATION_VIEW
    ( LMTPROFILE, CMS_ORIG_COUNTRY, PROF_ORG, LIMIT_COUNTRY, LIMIT_ORG,
    SECURITY_LOCATION, SECURITY_ORGANISATION, CO_BO_LMT_LOC,
    CO_BO_LMT_ORG )
AS
SELECT DISTINCT PROF.CMS_LSP_LMT_PROFILE_ID                AS LMTPROFILE,
                PROF.CMS_ORIG_COUNTRY,
                PROF.CMS_ORIG_ORGANISATION                 PROF_ORG,
                LIMITS.CMS_BKG_COUNTRY                     LIMIT_COUNTRY,
                LIMITS.CMS_BKG_ORGANISATION                LIMIT_ORG,
                SEC.SECURITY_LOCATION,
                SEC.SECURITY_ORGANISATION,
                SCI_LSP_CO_BORROW_LMT.CMS_BKG_COUNTRY      CO_BO_LMT_LOC,
                SCI_LSP_CO_BORROW_LMT.CMS_BKG_ORGANISATION CO_BO_LMT_ORG
FROM   SCI_LSP_LMT_PROFILE PROF
       LEFT OUTER JOIN SCI_LSP_APPR_LMTS LIMITS
         ON PROF.CMS_LSP_LMT_PROFILE_ID = LIMITS.CMS_LIMIT_PROFILE_ID
       LEFT OUTER JOIN CMS_LIMIT_SECURITY_MAP SEC_MAP
         ON LIMITS.CMS_LSP_APPR_LMTS_ID = SEC_MAP.CMS_LSP_APPR_LMTS_ID
       LEFT OUTER JOIN SCI_LSP_CO_BORROW_LMT
         ON LIMITS.CMS_LSP_APPR_LMTS_ID = SCI_LSP_CO_BORROW_LMT.CMS_LIMIT_ID
       LEFT OUTER JOIN CMS_SECURITY SEC
         ON SEC_MAP.CMS_COLLATERAL_ID = SEC.CMS_COLLATERAL_ID;
	
    
drop view cb_security_location_view;
         											
CREATE VIEW cb_security_location_view (sub_pf_id,
                                                cus_loc,
                                                cus_orga,
                                                lmt_loc,
                                                lmt_org,
                                                sec_loc,
                                                sec_org,
                                                mb_cus_loc,
                                                mb_cus_org
                                               )
AS
   SELECT DISTINCT customer.cms_le_sub_profile_id sub_pf_id,
                   customer.cms_sub_orig_country cus_loc,
                   customer.cms_sub_orig_organisation cus_org,
                   co_lmt.cms_bkg_country lmt_loc,
                   co_lmt.cms_bkg_organisation lmt_org,
                   sec.security_location sec_loc,
                   sec.security_organisation sec_org,
                   mb_customer.cms_sub_orig_country mb_cus_loc,
                   mb_customer.cms_sub_orig_organisation mb_cus_org
              FROM sci_le_sub_profile customer LEFT OUTER JOIN sci_lsp_co_borrow_lmt co_lmt ON customer.cms_le_sub_profile_id =
			  	   co_lmt.cms_customer_id LEFT OUTER JOIN cms_limit_security_map sec_map ON co_lmt.cms_lsp_co_borrow_lmt_id =
				   		sec_map.cms_lsp_co_borrow_lmt_id LEFT OUTER JOIN cms_security sec ON sec_map.cms_collateral_id =
							sec.cms_collateral_id LEFT OUTER JOIN sci_lsp_appr_lmts mb_limits ON co_lmt.cms_limit_id =
								mb_limits.cms_lsp_appr_lmts_id LEFT OUTER JOIN sci_lsp_lmt_profile mb_prof ON mb_limits.cms_limit_profile_id =
									mb_prof.cms_lsp_lmt_profile_id LEFT OUTER JOIN sci_le_sub_profile mb_customer ON mb_prof.cms_customer_id =
										mb_customer.cms_le_sub_profile_id;


-- CREATE VIEW cms_bdw_prop_index (stage_id,
--                                          property_index_id,
--                                          country_iso_code,
--                                          locality,
--                                          index_value,
--                                          updated_date,
--                                          feed_group_id,
--                                          cms_version_time,
--                                          feed_ref,
--                                          TYPE,
--                                          deleted_ind
--                                         )
-- AS
--    SELECT grp.feed_group_id stage_id, prop."PROPERTY_INDEX_ID",
--           prop."COUNTRY_ISO_CODE", prop."LOCALITY", prop."INDEX_VALUE",
--           prop."UPDATED_DATE", prop."FEED_GROUP_ID", prop."CMS_VERSION_TIME",
--           prop."FEED_REF", prop."TYPE", prop."DELETED_IND"
--      FROM cms_stage_property_index prop, cms_stage_feed_group grp
--     WHERE group_type = 'PROPERTY_INDEX'
--       AND grp.feed_group_id = prop.feed_group_id;

-- CREATE VIEW country (country_iso_code,
--                               region_code,
--                               country_name,
--                               data_protect_ind,
--                               currency_iso_code,
--                               area_code,
--                               region_name,
--                               swift_code
--                              )
-- AS
--    SELECT ctr_cntry_iso_code country_iso_code, entry_code region_code,
--           ctr_cntry_name country_name, ctr_data_protect_ind data_protect_ind,
--           ctr_crrncy_iso_code currency_iso_code,
--           ctr_area_code_value area_code, entry_name region_name,
--           '' swift_code
--      FROM sci_country country, common_code_category_entry code_table
--     WHERE category_code = '36'
--       AND ctr_area_code_value = entry_code
--       AND active_status = '1';

drop view country;

CREATE VIEW country (country_iso_code,
                              region_code,
                              country_name,
                              data_protect_ind,
                              currency_iso_code,
                              area_code,
                              region_name,
                              swift_code
                             )
AS
   SELECT ctr_cntry_iso_code country_iso_code, 					
	 			(select entry_code from common_code_category_entry 
					where entry_code = ctr_area_code_value
					and category_code = '36'
					and active_status = '1') region_code,
          ctr_cntry_name country_name, ctr_data_protect_ind data_protect_ind,
          ctr_crrncy_iso_code currency_iso_code,
          ctr_area_code_value area_code, 
					(select entry_name from common_code_category_entry 
					where entry_code = ctr_area_code_value
					and category_code = '36'
					and active_status = '1') as region_name,
          '' swift_code
     FROM sci_country country;
     
drop view country_sort_order;

CREATE VIEW country_sort_order (country, POSITION)
AS
   SELECT country_name, 1 POSITION
     FROM country
    WHERE country_name != 'Global'
   UNION
   SELECT 'Global', 2
     FROM sysibm.sysdummy1;
     
drop view co_borrower_location_view;
     
CREATE VIEW co_borrower_location_view (sub_pf_id,
                                                cus_loc,
                                                cus_orga,
                                                lmt_loc,
                                                lmt_org--,
                                                --sec_loc,
                                                --sec_org
                                               )
AS
   SELECT DISTINCT customer.cms_le_sub_profile_id sub_pf_id,
                   customer.cms_sub_orig_country cus_loc,
                   customer.cms_sub_orig_organisation cus_orga,
                   co_lmt.cms_bkg_country lmt_loc,
                   co_lmt.cms_bkg_organisation lmt_org--,
                   --sec.security_location sec_loc,
                   --sec.security_organisation sec_org
              FROM sci_le_sub_profile customer LEFT OUTER JOIN sci_lsp_co_borrow_lmt co_lmt ON customer.cms_le_sub_profile_id =
                    co_lmt.cms_customer_id ;
                    --LEFT OUTER JOIN cms_limit_security_map sec_map ON co_lmt.cms_lsp_co_borrow_lmt_id =
                        --sec_map.cms_lsp_co_borrow_lmt_id
                        --LEFT OUTER JOIN cms_security sec ON sec_map.cms_collateral_id =sec.cms_collateral_id;

drop view currency;

CREATE VIEW currency (currency_iso_code,
                      currency_desc,
                      currency_country,
                      euro_ind,
                      restrict_currency_ind,
                      units,
                      decimal_place
                     )
AS
   SELECT cur_crrncy_iso_code currency_iso_code,
          cur_crrncy_desc currency_desc, cur_cntry_iso_code currency_country,
          cur_euro_crrncy_ind euro_ind,
          cur_rstrct_crrncy_ind restrict_currency_ind, 0 units,
          cur_decimal_place_num decimal_place
     FROM sci_currency;
     
drop view customer_legal_constitution;

CREATE VIEW customer_legal_constitution (customer_legal_const_code,
                                         customer_legal_const_desc
                                        )
AS
   SELECT entry_code AS customer_legal_const_code,
          entry_name AS customer_legal_const_desc
     FROM common_code_category_entry a
    WHERE category_code = '56' 
    AND active_status = '1'
    AND entry_source = 'ARBS';
    
drop view customer_location_view;

CREATE VIEW customer_location_view (customerid,
                                    lsp_dmcl_cntry_iso_code,
                                    cms_orig_country,
                                    prof_org,
                                    limit_country,
                                    limit_org,
                                    security_location,
                                    security_organisation,
                                    collab_security_location,
                                    collab_cc_country
                                   )
AS
   SELECT DISTINCT cust.cms_le_sub_profile_id AS customerid,
                   cust.lsp_dmcl_cntry_iso_code,
                   COALESCE (prof.cms_orig_country, cust.cms_sub_orig_country),
                   COALESCE (prof.cms_orig_organisation,
                             cust.cms_sub_orig_organisation
                            ) prof_org,
                   limits.cms_bkg_country limit_country,
                   limits.cms_bkg_organisation limit_org,
                   sec.security_location, sec.security_organisation,
                   col_task.security_location, cc.dmcl_cntry_iso_code
              FROM sci_le_sub_profile cust LEFT OUTER JOIN sci_lsp_lmt_profile prof ON cust.cms_le_sub_profile_id =
			  	   prof.cms_customer_id LEFT OUTER JOIN sci_lsp_appr_lmts limits ON prof.cms_lsp_lmt_profile_id =
				   		limits.cms_limit_profile_id LEFT OUTER JOIN cms_cc_task cc ON prof.cms_lsp_lmt_profile_id =
							cc.cms_lsp_lmt_profile_id LEFT OUTER JOIN cms_limit_security_map sec_map ON limits.cms_lsp_appr_lmts_id =
								sec_map.cms_lsp_appr_lmts_id LEFT OUTER JOIN cms_security sec ON sec_map.cms_collateral_id =
									sec.cms_collateral_id LEFT OUTER JOIN cms_collateral_task col_task ON sec_map.cms_collateral_id =
										col_task.cms_collateral_id;
										
drop view customer_segment;

CREATE VIEW customer_segment (customer_type_code, customer_type_desc)
AS
   SELECT entry_code AS customer_type_code, entry_name AS customer_type_desc
     FROM common_code_category_entry a
    WHERE category_code = '5' AND active_status = '1';
    
drop view dap_view;

CREATE VIEW dap_view (customerid,
                      lmtprofile,
                      lsp_dmcl_cntry_iso_code,
                      cms_orig_country,
                      prof_org,
                      limit_country,
                      limit_org,
                      security_location,
                      collab_security_location,
                      collab_cc_country
                     )
AS
   SELECT DISTINCT cust.cms_le_sub_profile_id,
                   prof.cms_lsp_lmt_profile_id AS customerid,
                   cust.lsp_dmcl_cntry_iso_code,
                   COALESCE (prof.cms_orig_country, cust.cms_sub_orig_country),
                   COALESCE (prof.cms_orig_organisation,
                             cust.cms_sub_orig_organisation
                            ) prof_org,
                   limits.cms_bkg_country limit_country,
                   limits.cms_bkg_organisation limit_org,
                   sec.security_location, col_task.security_location,
                   cc.dmcl_cntry_iso_code
              FROM sci_le_sub_profile cust LEFT OUTER JOIN sci_lsp_lmt_profile prof ON cust.cms_le_sub_profile_id =
			  	   prof.cms_customer_id LEFT OUTER JOIN sci_lsp_appr_lmts limits ON prof.cms_lsp_lmt_profile_id =
				   		limits.cms_limit_profile_id LEFT OUTER JOIN cms_cc_task cc ON prof.cms_lsp_lmt_profile_id =
							cc.cms_lsp_lmt_profile_id LEFT OUTER JOIN cms_limit_security_map sec_map ON limits.cms_lsp_appr_lmts_id =
								sec_map.cms_lsp_appr_lmts_id LEFT OUTER JOIN cms_security sec ON sec_map.cms_collateral_id =
									sec.cms_collateral_id LEFT OUTER JOIN cms_collateral_task col_task ON sec_map.cms_collateral_id =
										col_task.cms_collateral_id;


drop view region;

CREATE VIEW region (region_code, region_name, region_description)
AS
   SELECT entry_code region_code, entry_name region_name,
          '' region_description
     FROM common_code_category_entry
    WHERE active_status = '1' AND category_code = '36';

drop view view_collateral_maturity_date;
    
CREATE VIEW view_collateral_maturity_date (sci_security_dtl_id,
                                           cms_collateral_id,
                                           security_sub_type_id,
                                           subtype_name,
                                           security_location,
                                           security_maturity_date,
                                           status,
										   security_currency	
                                          )
AS
   SELECT sec.sci_security_dtl_id, sec.cms_collateral_id,
          sec.security_sub_type_id,
          (SELECT    st.security_type_name
                  || ' - '
                  || st.subtype_name
             FROM cms_security_sub_type st
            WHERE st.security_sub_type_id = sec.security_sub_type_id)
                                                              AS subtype_name,
          sec.security_location, sec.security_maturity_date, sec.status,
		  sec.sci_security_currency
     FROM cms_security sec
    WHERE sec.security_sub_type_id NOT IN ('AB108', 'IN503')
      AND sec.security_sub_type_id NOT LIKE 'MS%'
      AND sec.security_sub_type_id NOT LIKE 'CS%'
   UNION
   SELECT   sec.sci_security_dtl_id, sec.cms_collateral_id,
            sec.security_sub_type_id,
            (SELECT    st.security_type_name
                    || ' - '
                    || st.subtype_name
               FROM cms_security_sub_type st
              WHERE st.security_sub_type_id = sec.security_sub_type_id)
                                                              AS subtype_name,
            sec.security_location,
            (SELECT MIN (pdc.expiry_date)
               FROM cms_asset_pdc pdc
              WHERE pdc.cms_collateral_id =
                              sec.cms_collateral_id
                AND (pdc.status IS NULL OR pdc.status <> 'DELETED'))
                                                    AS security_maturity_date,
            sec.status,
			sec.sci_security_currency
       FROM cms_security sec
      WHERE sec.security_sub_type_id = 'AB108'
   GROUP BY sec.sci_security_dtl_id,
            sec.cms_collateral_id,
            sec.security_sub_type_id,
            sec.security_location,
            sec.status, 
			sec.sci_security_currency
   UNION
   SELECT   sec.sci_security_dtl_id, sec.cms_collateral_id,
            sec.security_sub_type_id,
            (SELECT    st.security_type_name
                    || ' - '
                    || st.subtype_name
               FROM cms_security_sub_type st
              WHERE st.security_sub_type_id = sec.security_sub_type_id)
                                                              AS subtype_name,
            sec.security_location,
            (SELECT MIN (cds.cds_maturity_date)
               FROM cms_insurance_cds cds
              WHERE cds.cms_collateral_id =
                              sec.cms_collateral_id
                AND (cds.status IS NULL OR cds.status <> 'DELETED'))
                                                    AS security_maturity_date,
            sec.status,
			sec.sci_security_currency
       FROM cms_security sec
      WHERE sec.security_sub_type_id = 'IN503'
   GROUP BY sec.sci_security_dtl_id,
            sec.cms_collateral_id,
            sec.security_sub_type_id,
            sec.security_location,
            sec.status, 
			sec.sci_security_currency
   UNION
   SELECT   sec.sci_security_dtl_id, sec.cms_collateral_id,
            sec.security_sub_type_id,
            (SELECT    st.security_type_name
                    || ' - '
                    || st.subtype_name
               FROM cms_security_sub_type st
              WHERE st.security_sub_type_id = sec.security_sub_type_id)
                                                              AS subtype_name,
            sec.security_location,
            (SELECT MIN
                       (portfolio.security_maturity_date
                       )
               FROM cms_portfolio_item portfolio
              WHERE portfolio.cms_collateral_id = sec.cms_collateral_id
                AND (portfolio.status IS NULL OR portfolio.status <> 'DELETED'
                    )) AS security_maturity_date,
            sec.status,
            sec.sci_security_currency
       FROM cms_security sec
      WHERE sec.security_sub_type_id LIKE 'MS%'
   GROUP BY sec.sci_security_dtl_id,
            sec.cms_collateral_id,
            sec.security_sub_type_id,
            sec.security_location,
            sec.status,
			sec.sci_security_currency
   UNION
   SELECT   sec.sci_security_dtl_id, sec.cms_collateral_id,
            sec.security_sub_type_id,
            (SELECT    st.security_type_name
                    || ' - '
                    || st.subtype_name
               FROM cms_security_sub_type st
              WHERE st.security_sub_type_id = sec.security_sub_type_id)
                                                              AS subtype_name,
            sec.security_location,
            (SELECT MIN
                       (deposit.deposit_maturity_date
                       )
               FROM cms_cash_deposit deposit
              WHERE deposit.cms_collateral_id = sec.cms_collateral_id
                AND (deposit.status IS NULL OR deposit.status <> 'DELETED'))
                                                    AS security_maturity_date,
            sec.status, 
			sec.sci_security_currency
       FROM cms_security sec
      WHERE sec.security_sub_type_id LIKE 'CS%'
   GROUP BY sec.sci_security_dtl_id,
            sec.cms_collateral_id,
            sec.security_sub_type_id,
            sec.security_location,
            sec.status,
			sec.sci_security_currency;
            
drop view vw_collateral_valuation;
			
CREATE VIEW vw_collateral_valuation (a_cms_collateral_id,
                                     a_security_location,
                                     a_security_sub_type_id,
                                     a_sci_security_currency,
                                     a_cmv,
                                     a_cmv_currency,
                                     a_fsv,
                                     a_fsv_currency,
                                     a_version_time,
                                     a_margin,
                                     security_type,
                                     s_cms_collateral_id,
                                     s_security_location,
                                     s_security_sub_type_id,
                                     s_sci_security_currency,
                                     s_cmv,
                                     s_cmv_currency,
                                     s_fsv,
                                     s_fsv_currency,
                                     s_version_time,
                                     s_margin,
                                     a_v_valuation_id,
                                     a_v_valuation_currency,
                                     a_v_valuation_date,
                                     a_v_valuer,
                                     a_v_cmv,
                                     a_v_fsv,
                                     a_v_value_before_margin,
                                     a_v_reval_freq,
                                     a_v_reval_freq_unit,
                                     a_v_cms_collateral_id,
                                     a_v_non_reval_freq,
                                     a_v_non_reval_freq_unit,
                                     a_v_comments,
                                     s_v_valuation_id,
                                     s_v_valuation_currency,
                                     s_v_valuation_date,
                                     s_v_valuer,
                                     s_v_cmv,
                                     s_v_fsv,
                                     s_v_value_before_margin,
                                     s_v_reval_freq,
                                     s_v_reval_freq_unit,
                                     s_v_cms_collateral_id,
                                     s_v_non_reval_freq,
                                     s_v_non_reval_freq_unit,
                                     s_v_comments,
                                     transaction_id
                                    )
AS
   SELECT cms_security.cms_collateral_id AS a_cms_collateral_id,
          cms_security.security_location AS a_security_location,
          cms_security.security_sub_type_id AS a_security_sub_type_id,
          cms_security.sci_security_currency AS a_sci_security_currency,
          cms_security.cmv AS a_cmv,
          cms_security.cmv_currency AS a_cmv_currency,
          cms_security.fsv AS a_fsv,
          cms_security.fsv_currency AS a_fsv_currency,
          cms_security.version_time AS a_version_time,
          cms_security.margin AS a_margin,
          cms_security.sci_security_type_value AS security_type,
          cms_stage_security.cms_collateral_id AS s_cms_collateral_id,
          cms_stage_security.security_location AS s_security_location,
          cms_stage_security.security_sub_type_id AS s_security_sub_type_id,
          cms_stage_security.sci_security_currency AS s_sci_security_currency,
          cms_stage_security.cmv AS s_cmv,
          cms_stage_security.cmv_currency AS s_cmv_currency,
          cms_stage_security.fsv AS s_fsv,
          cms_stage_security.fsv_currency AS s_fsv_currency,
          cms_stage_security.version_time AS s_version_time,
          cms_stage_security.margin AS s_margin,
          a_cms_valuation.valuation_id AS a_v_valuation_id,
          a_cms_valuation.valuation_currency AS a_v_valuation_currency,
          a_cms_valuation.valuation_date AS a_v_valuation_date,
          a_cms_valuation.valuer AS a_v_valuer,
          a_cms_valuation.cmv AS a_v_cmv, a_cms_valuation.fsv AS a_v_fsv,
          a_cms_valuation.value_before_margin AS a_v_value_before_margin,
          a_cms_valuation.reval_freq AS a_v_reval_freq,
          a_cms_valuation.reval_freq_unit AS a_v_reval_freq_unit,
          a_cms_valuation.cms_collateral_id AS a_v_cms_collateral_id,
          a_cms_valuation.non_reval_freq AS a_v_non_reval_freq,
          a_cms_valuation.non_reval_freq_unit AS a_v_non_reval_freq_unit,
          a_cms_valuation.comments AS a_v_comments,
          s_cms_valuation.valuation_id AS s_v_valuation_id,
          s_cms_valuation.valuation_currency AS s_v_valuation_currency,
          s_cms_valuation.valuation_date AS s_v_valuation_date,
          s_cms_valuation.valuer AS s_v_valuer,
          s_cms_valuation.cmv AS s_v_cmv, s_cms_valuation.fsv AS s_v_fsv,
          s_cms_valuation.value_before_margin AS s_v_value_before_margin,
          s_cms_valuation.reval_freq AS s_v_reval_freq,
          s_cms_valuation.reval_freq_unit AS s_v_reval_freq_unit,
          s_cms_valuation.cms_collateral_id AS s_v_cms_collateral_id,
          s_cms_valuation.non_reval_freq AS s_v_non_reval_freq,
          s_cms_valuation.non_reval_freq_unit AS s_v_non_reval_freq_unit,
          s_cms_valuation.comments AS s_v_comments, transaction_id
     FROM TRANSACTION,
          cms_stage_security,
          cms_security,
          (SELECT ts_val_2.valuation_id, ts_val_2.valuation_currency,
                  ts_val_2.valuation_date, ts_val_2.valuer, ts_val_2.cmv,
                  ts_val_2.fsv, ts_val_2.value_before_margin,
                  ts_val_2.reval_freq, ts_val_2.reval_freq_unit,
                  ts_val_2.cms_collateral_id, ts_val_2.non_reval_freq,
                  ts_val_2.non_reval_freq_unit, ts_val_2.comments
             FROM cms_stage_valuation ts_val_2,
                  (SELECT   MAX (valuation_id) AS valuation_id
                       FROM cms_stage_valuation
                   GROUP BY cms_collateral_id) ts_val_1
            WHERE ts_val_2.valuation_id = ts_val_1.valuation_id) s_cms_valuation,
          (SELECT ta_val_2.valuation_id, ta_val_2.valuation_currency,
                  ta_val_2.valuation_date, ta_val_2.valuer, ta_val_2.cmv,
                  ta_val_2.fsv, ta_val_2.value_before_margin,
                  ta_val_2.reval_freq, ta_val_2.reval_freq_unit,
                  ta_val_2.cms_collateral_id, ta_val_2.non_reval_freq,
                  ta_val_2.non_reval_freq_unit, ta_val_2.comments
             FROM cms_valuation ta_val_2,
                  (SELECT   MAX (valuation_id) AS valuation_id
                       FROM cms_valuation
                   GROUP BY cms_collateral_id) ta_val_1
            WHERE ta_val_2.valuation_id = ta_val_1.valuation_id) a_cms_valuation
    WHERE reference_id = cms_security.cms_collateral_id
      AND staging_reference_id = cms_stage_security.cms_collateral_id
      AND cms_security.cms_collateral_id = a_cms_valuation.cms_collateral_id
      AND cms_stage_security.cms_collateral_id =
                                             s_cms_valuation.cms_collateral_id
      AND transaction_type = 'COL'
      AND cms_security.security_sub_type_id <> 'NA';

drop view vw_fam;
      
CREATE VIEW vw_fam (fam_name,
                    fam_code,
                    customer_id,
                    bkg_loc_ctry,
                    bkg_loc_org,
                    fam_count
                   )
AS
   SELECT   MIN (lem_emp_name), MIN (lem_emp_code), cms_le_sub_profile_id,
            lem_emp_bkg_loc_ctry, lem_emp_bkg_loc_org, COUNT (*)
       FROM sci_lsp_emp_map
      WHERE lem_emp_type_value = 'FAM'
        AND (update_status_ind != 'D' OR update_status_ind IS NULL)
   GROUP BY cms_le_sub_profile_id, lem_emp_bkg_loc_ctry, lem_emp_bkg_loc_org
     HAVING COUNT (*) = 1
   UNION
   SELECT   MIN (lem_emp_name), MIN (lem_emp_code), cms_le_sub_profile_id,
            lem_emp_bkg_loc_ctry, lem_emp_bkg_loc_org, COUNT (*)
       FROM sci_lsp_emp_map
      WHERE lem_emp_type_value = 'FAM'
        AND lem_principal_fam_ind = 'Y'
        AND (update_status_ind != 'D' OR update_status_ind IS NULL)
   GROUP BY cms_le_sub_profile_id, lem_emp_bkg_loc_ctry, lem_emp_bkg_loc_org;

drop view vw_feed_unit_price;

CREATE VIEW vw_feed_unit_price (ric,
                                unit_price_usd,
                                unit_price_local,
                                outstanding_unit
                               )
AS
   SELECT feed.ric,
          COALESCE
             (convert_currency (feed.currency,
                                         'USD',
                                         COALESCE (feed.unit_price, 0)
                                        ),
              0
             ) unit_price_usd,
          COALESCE (feed.unit_price, 0) unit_price_local,
          COALESCE (feed.total_outstanding_unit, 0)
     FROM cms_price_feed feed;

drop view vw_forex_flux;

CREATE VIEW vw_forex_flux (buy_currency, buy_rate, effective_date)
AS
   SELECT *
     FROM (SELECT   buy_currency, buy_rate, effective_date
               FROM cms_forex_history f1
              WHERE 2 >=
                       (SELECT COUNT (DISTINCT f2.effective_date)
                          FROM cms_forex_history f2
                         WHERE f2.buy_currency = f1.buy_currency
                           AND f2.effective_date >= f1.effective_date)
           ORDER BY buy_currency, effective_date DESC) temp_db2;
           
drop view vw_lmt_reduced_tooneunit;
               
CREATE VIEW vw_lmt_reduced_tooneunit (cms_lsp_lmt_profile_id,
                                      cms_lsp_appr_lmts_id,
                                      lmt_id,
                                      lmtccy,
                                      totalapprlimit,
                                      totalactivatedlimit,
                                      lmt_prd_type_num,
                                      lmt_prd_type_value,
                                      lmt_type_value,
                                      cms_outer_lmt_ref
                                     )
AS
   (SELECT b.cms_lsp_lmt_profile_id profileid, c.cms_lsp_appr_lmts_id,
           c.lmt_id, c.lmt_crrncy_iso_code, c.lmt_amt totalapprlimit,
           c.cms_activated_limit totalactivatedlimit,
           c.lmt_prd_type_num lmt_prd_type_num,
           c.lmt_prd_type_value lmt_prd_type_value, c.lmt_type_value,
           c.cms_outer_lmt_ref
      FROM sci_lsp_lmt_profile b, sci_lsp_appr_lmts c
     WHERE c.cms_activated_limit = 1
       AND b.cms_lsp_lmt_profile_id = c.cms_limit_profile_id);
       
drop view vw_price_flux;

CREATE VIEW vw_price_flux (feed_group_id,
                           NAME,
                           ISIN_CODE,
                           unit_price,
                           last_updated_date
                          )
AS
   SELECT *
     FROM (SELECT   feed_group_id, NAME, ISIN_CODE, unit_price, last_updated_date
               FROM cms_stage_price_feed t1
              WHERE 2 >=
                       (SELECT COUNT (DISTINCT t2.last_updated_date)
                          FROM cms_stage_price_feed t2
                         WHERE t2.ISIN_CODE = t1.ISIN_CODE
                           AND t2.last_updated_date >= t1.last_updated_date)
           ORDER BY feed_group_id, ISIN_CODE, last_updated_date DESC) temp1_db2;

drop view vw_prop_by_lot_location;
   
CREATE VIEW vw_prop_by_lot_location (security_location, fsv_usd, lot_location)
AS
   SELECT   cms_security.security_location,
            SUM
               (COALESCE
                      (convert_currency (fsv_currency,
                                                  'USD',
                                                  COALESCE (cms_security.fsv,
                                                            0
                                                           )
                                                 ),
                       0
                      )
               ) fsv_usd,
            cms_property.lot_location
       FROM cms_security cms_security, cms_property cms_property
      WHERE cms_security.cms_collateral_id = cms_property.cms_collateral_id
   GROUP BY cms_property.lot_location, cms_security.security_location;

drop view vw_prop_by_postcode;
   
CREATE VIEW vw_prop_by_postcode (security_location, fsv_usd, postcode)
AS
   SELECT   cms_security.security_location,
            SUM
               (COALESCE
                      (convert_currency (fsv_currency,
                                                  'USD',
                                                  COALESCE (cms_security.fsv,
                                                            0
                                                           )
                                                 ),
                       0
                      )
               ) fsv_usd,
            cms_property.postcode
       FROM cms_security cms_security, cms_property cms_property
      WHERE cms_security.cms_collateral_id = cms_property.cms_collateral_id
   GROUP BY cms_property.postcode, cms_security.security_location;   
               
drop view vw_security_details;    
   
CREATE VIEW vw_security_details (cms_collateral_id,
                                 sci_security_dtl_id,
                                 security_sub_type_id,
                                 origin_security_sub_type_id,
                                 subtype_name,
                                 fsv,
                                 fsv_currency,
                                 rpt_charge_details,
                                 rpt_collateral_particulars,
                                 sci_security_currency,
                                 security_location,
                                 security_maturity_date,
                                 status
                                )
AS
   SELECT sec.cms_collateral_id, sec.sci_security_dtl_id,
          COALESCE
                ((SELECT ccce.entry_name
                    FROM common_code_category_entry ccce
                   WHERE ccce.category_code = 'SEC_SUBTYP'
                     AND ccce.entry_code = sec.security_sub_type_id),
                 sec.security_sub_type_id
                ) security_sub_type_id,
          sec.security_sub_type_id origin_security_sub_type_id,
          stype.subtype_name, sec.fsv, sec.fsv_currency,
          sec.rpt_charge_details, sec.rpt_collateral_particulars,
          sec.sci_security_currency, sec.security_location,
          sec.security_maturity_date, sec.status
     FROM cms_security sec, cms_security_sub_type stype
    WHERE sec.security_sub_type_id = stype.security_sub_type_id;

drop view vw_stock_exchange_meta_info;

CREATE VIEW vw_stock_exchange_meta_info (stock_exchange,
                                         stock_exchange_name,
                                         country_name,
                                         country_iso_code,
                                         currency_iso_code
                                        )
AS
   SELECT stock_exchange, exch.stock_exchange_name, ctry.country_name,
          ctry.country_iso_code, ctry.currency_iso_code
     FROM cms_stock_exchange exch, country ctry
    WHERE exch.country_iso_code = ctry.country_iso_code;    
                                                      
drop view security_by_country;  

CREATE VIEW security_by_country (security_location, fsv)
AS
   SELECT   cms_security.security_location,
            SUM
               (COALESCE (convert_currency (cms_security.fsv_currency,
                                            'USD',
                                            COALESCE (cms_security.fsv, 0)
                                           ),
                          0
                         )
               ) activated_limit
       FROM cms_security
   GROUP BY cms_security.security_location;

drop view view_collateral_by_country;  
   
CREATE VIEW view_collateral_by_country (security_location,
                                        country_name,
                                        fsv_usd,
                                        security_desc
                                       )
AS
   SELECT   cms_security.security_location, country.country_name,
            SUM
               (COALESCE (convert_currency (fsv_currency,
                                            'USD',
                                            COALESCE (cms_security.fsv, 0)
                                           ),
                          0
                         )
               ) fsv_usd,
            security_type.type_description security_desc
       FROM cms_security cms_security,
            country,
            cms_security_sub_type security_sub_type,
            security_type security_type
      WHERE cms_security.security_location = country.country_iso_code
        AND cms_security.security_sub_type_id =
                                        security_sub_type.security_sub_type_id
        AND security_sub_type.security_type_id =
                                                security_type.security_type_id
   GROUP BY cms_security.security_location,
            country.country_name,
            security_type.type_description;
            
drop view vw_activated_limit_by_ctry;

CREATE VIEW vw_activated_limit_by_ctry (country, activated_limit)
AS
   SELECT   cms_bkg_country,
            SUM
               (COALESCE
                       (convert_currency_lmts (lmt_crrncy_iso_code,
                                               'USD',
                                               COALESCE (cms_activated_limit,
                                                         0
                                                        )
                                              ),
                        0
                       )
               ) activated_limit
       FROM sci_lsp_appr_lmts
   GROUP BY cms_bkg_country;

drop view vw_cmv_fsv;
   
CREATE VIEW vw_cmv_fsv (subtype_name,
                                 sum_cmv,
                                 total_cmv,
                                 perct_cmv,
                                 sub_type_id,
                                 sum_fsv,
                                 total_fsv,
                                 perct_fsv
                                )
AS
   SELECT   subtype_name, SUM (cmv) AS sum_cmv, MAX (total_cmv) AS total_cmv,
            (  (SUM (cmv) * 100)
             / (CASE MAX (total_cmv)
                   WHEN 0
                      THEN 1
                   ELSE MAX (total_cmv)
                END
                   --DECODE (MAX (total_cmv), 0, 1, MAX (total_cmv))
               )
            ) AS perct_cmv,
            security_sub_type_id, SUM (fsv) AS sum_fsv,
            MAX (total_fsv) AS total_fsv,
            (  (SUM (fsv) * 100)
             / (CASE MAX (total_fsv)
                   WHEN 0
                      THEN 1
                   ELSE MAX (total_fsv)
                END          --DECODE (MAX (total_fsv), 0, 1, MAX (total_fsv))
                   )
            ) AS perct_fsv
       FROM ((SELECT sec.subtype_name,
                     COALESCE
                           (convert_currency_char (sec.cmv_currency,
                                                   'USD',
                                                   COALESCE (sec.cmv, 0)
                                                  ),
                            0
                           ) AS cmv,
                     (SELECT SUM
                                (COALESCE
                                    (convert_currency_char
                                                  (cms_security.cmv_currency,
                                                   'USD',
                                                   COALESCE (cms_security.cmv,
                                                             0
                                                            )
                                                  ),
                                     0
                                    )
                                )
                        FROM cms_security
                       WHERE cms_security.type_name =
                                'Commodity'
                                           ) AS total_cmv,
                     0 AS perct_cmv,
                     secsubtype.security_sub_type_id AS security_sub_type_id,
                     COALESCE
                           (convert_currency_char (sec.fsv_currency,
                                                   'USD',
                                                   COALESCE (sec.fsv, 0)
                                                  ),
                            0
                           ) AS fsv,
                     (SELECT SUM
                                (COALESCE
                                    (convert_currency_char
                                                  (cms_security.fsv_currency,
                                                   'USD',
                                                   COALESCE (cms_security.fsv,
                                                             0
                                                            )
                                                  ),
                                     0
                                    )
                                )
                        FROM cms_security
                       WHERE cms_security.type_name =
                                'Commodity'
                                           ) AS total_fsv,
                     0 AS perct_fsv
                FROM cms_security sec, cms_security_sub_type secsubtype
               WHERE sec.type_name =
                        'Commodity'
                 AND secsubtype.security_type_id = 'CF'
                 AND secsubtype.security_sub_type_id =
                                                      sec.security_sub_type_id)
             UNION ALL
             (SELECT cms_security_sub_type.subtype_name, 0 AS cmv,
                     0 AS total_cmv, 0 AS perct_cmv,
                     cms_security_sub_type.security_sub_type_id, 0 AS fsv,
                     0 AS total_fsv, 0 AS perct_fsv
                FROM cms_security_sub_type
               WHERE cms_security_sub_type.security_type_id = 'CF')) temp
   GROUP BY subtype_name, security_sub_type_id;

drop view cms_bdw_chk_list; 

CREATE VIEW cms_bdw_chk_list (checklist_id, CATEGORY, sub_category, cms_pledgor_dtl_id, PLG_pledgor_id, cms_lsp_lmt_profile_id, llp_id, cms_lmp_sub_profile_id, lsp_id, lsp_le_id, cms_collateral_id, sci_security_dtl_id ) AS 
SELECT DISTINCT stage.checklist_id, stage.category, stage.sub_category,
                stage.cms_pledgor_dtl_id, pledgor.plg_pledgor_id,
                stage.cms_lsp_lmt_profile_id, prof.llp_id,
                stage.cms_lmp_sub_profile_id, lsp_id, lsp_le_id,
                stage.cms_collateral_id, sec.sci_security_dtl_id
  FROM    cms_security sec
       RIGHT OUTER JOIN
          (SELECT *
             FROM stage_checklist) stage
       ON sec.cms_collateral_id = stage.cms_collateral_id,
          sci_pledgor_dtl pledgor
       RIGHT OUTER JOIN
          (SELECT *
             FROM stage_checklist) stage1
       ON pledgor.cms_pledgor_dtl_id = stage1.cms_pledgor_dtl_id,
          sci_lsp_lmt_profile prof
       RIGHT OUTER JOIN
          (SELECT *
             FROM stage_checklist) stage2
       ON prof.cms_lsp_lmt_profile_id = stage2.cms_lsp_lmt_profile_id,
          sci_le_sub_profile cust
       RIGHT OUTER JOIN
          (SELECT *
             FROM stage_checklist) stage3
       ON cust.cms_le_sub_profile_id = stage3.cms_lmp_sub_profile_id; 
       
drop view VW_ACCOUNTMAPSECURITY; 

-- Create VIEW --
create view VW_ACCOUNTMAPSECURITY (COLLATERALID, AANO, ACCOUTNO, SUBTYPENAME, STGCOLLATERALID, SOURCEID, GCIFNO)
as
select distinct (sec.CMS_COLLATERAL_ID), pro.CMS_LSP_LMT_PROFILE_ID, acc.LSX_EXT_SYS_ACCT_NUM, 
sec.SUBTYPE_NAME, trx.STAGING_REFERENCE_ID, sec.SOURCE_ID, mainprofile.LMP_LE_ID
FROM SCI_LSP_LMT_PROFILE pro, SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP map, 
CMS_SECURITY sec, SCI_LSP_SYS_XREF acc, SCI_LSP_LMTS_XREF_MAP accmap, TRANSACTION trx,
SCI_LE_MAIN_PROFILE mainprofile, SCI_LE_SUB_PROFILE subprofile
where pro.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
and lmt.CMS_LSP_APPR_LMTS_ID = map.CMS_LSP_APPR_LMTS_ID
and map.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
and lmt.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
and accmap.CMS_LSP_SYS_XREF_ID = acc.CMS_LSP_SYS_XREF_ID
and mainprofile.LMP_LE_ID = subprofile.LSP_LE_ID
and subprofile.LSP_LE_ID = pro.LLP_LE_ID
and sec.security_sub_type_id like 'MS%'
and trx.reference_id = sec.cms_collateral_id
and trx.transaction_type='COL';

drop view VW_CF_BL_IND; 	

--Create a view to contain the contract finance and bridging loan flag for the limit profile 
CREATE VIEW VW_CF_BL_IND 
(CMS_LSP_LMT_PROFILE_ID, HAS_CONTRACT_FINANCE, HAS_BRIDGING_LOAN)
AS
    SELECT CMS_LSP_LMT_PROFILE_ID,
     (SELECT 'Y'
      FROM SCI_LSP_APPR_LMTS APPR
      WHERE APPR.CMS_LIMIT_PROFILE_ID = SCI_LSP_LMT_PROFILE.CMS_LSP_LMT_PROFILE_ID
      AND APPR.LOAN_TYPE = 'CF'
      AND CMS_LIMIT_STATUS = 'ACTIVE'
      GROUP BY CMS_LIMIT_PROFILE_ID) HASCONTRACT,
    (SELECT 'Y'
      FROM SCI_LSP_APPR_LMTS APPR
      WHERE APPR.CMS_LIMIT_PROFILE_ID = SCI_LSP_LMT_PROFILE.CMS_LSP_LMT_PROFILE_ID
      AND APPR.LOAN_TYPE = 'BL'
      AND CMS_LIMIT_STATUS = 'ACTIVE'
      GROUP BY CMS_LIMIT_PROFILE_ID) HASBRIDGING
    FROM SCI_LSP_LMT_PROFILE
    WHERE SCI_LSP_LMT_PROFILE.CMS_BCA_STATUS = 'ACTIVE';
      
		          



/**************************************************************************
 Requestor : Cynthia Zhou
 Desc : Schema patches required for concentration report
 Task : Concentration Reports Module
 Date : 19/04/2007
*************************************************************************/
	
	
/*******************************************
Create Views for Concentration Report
*********************************************/
	 	

/**************************************************************************
Requestor : Allen
Desc : To provide feed ID for portfolio item based on RIC/ISIN/STOCK CODE
Date : 18 May 2007
*************************************************************************/

drop view VW_PORTFOLIO_ITEM_FEED_ID; 	

CREATE VIEW VW_PORTFOLIO_ITEM_FEED_ID as 
select pi.*, pf.FEED_ID  from CMS_PORTFOLIO_ITEM pi 
,cms_price_feed pf where 
(pi.STOCK_CODE=pf.TICKER and pi.STOCK_CODE<>'') or 
(pi.ISIN_CODE=pf.ISIN_CODE and pi.ISIN_CODE<>'') or 
(pi.RIC=pf.RIC and pi.RIC<>'');



/**************************************************************************
Requestor : Allen
Desc : To provide feed ID for portfolio item based on RIC/ISIN/STOCK CODE
Date : 18 May 2007
*************************************************************************/

drop view VW_MBS_FOREIGNER; 

create view VW_MBS_FOREIGNER as
select * from SCI_LE_MAIN_PROFILE where LMP_TYPE_VALUE in  ('MN','MO','MZ'
,'PP', 'ZN','ZX','ZZ', 'ZO') and SOURCE_ID='700';    

drop view PREDEAL_DATA_VW; 

CREATE VIEW PREDEAL_DATA_VW ( 
FEED_ID ,
IS_INT_SUSPEND , 
IS_SUSPENDED , 
SHARE_STATUS ,
TICKER ,
EXPIRY_DATE ,
GROUP_STOCK_TYPE ,
NAME ,
RIC ,
STOCK_EXCHANGE_NAME , 
GROUP_SUBTYPE , 
COUNTRY_ISO_CODE ,
CURRENCY ,
UNIT_PRICE ,
LAST_BATCH_UPDATE ,
CMS_ACTUAL_HOLDING ,
TOTAL_NO_OF_UNITS ,
EARMARK_HOLDING,
EARMARK_CURRENT ,
ISIN_CODE ,
LISTEDSHARE_QUANTITY ,
GROUP_TYPE ,
IS_FI,
BOARD_TYPE,
PAR_VALUE
)
AS
SELECT
TABLE1.FEED_ID AS FEED_ID ,
IS_INT_SUSPEND ,
IS_SUSPENDED ,
SHARE_STATUS ,
TICKER ,
EXPIRY_DATE ,
GROUP_STOCK_TYPE ,
NAME ,
RIC ,
STOCK_EXCHANGE_NAME , 
GROUP_SUBTYPE , 
COUNTRY_ISO_CODE ,
CURRENCY ,
MAX ( UNIT_PRICE ) AS UNIT_PRICE ,
MAX ( LAST_BATCH_UPDATE ) AS LAST_BATCH_UPDATE ,
SUM ( CMS_ACTUAL_HOLDING ) AS CMS_ACTUAL_HOLDING ,
SUM ( TOTAL_NO_OF_UNITS ) AS TOTAL_NO_OF_UNITS ,
MAX ( EARMARK_HOLDING ) AS EARMARK_HOLDING,
MAX ( EARMARK_CURRENT ) AS EARMARK_CURRENT ,
ISIN_CODE ,
MAX ( LISTEDSHARE_QUANTITY ) AS LISTEDSHARE_QUANTITY ,
GROUP_TYPE ,
IS_FI,
BOARD_TYPE,
PAR_VALUE
FROM
(
        SELECT
                TEMP_TABLE.FEED_ID ,
                TEMP_TABLE.IS_SUSPENDED ,
                TEMP_TABLE.TICKER ,
                TEMP_TABLE.NAME ,
                TEMP_TABLE.RIC ,
                TEMP_TABLE.ISIN_CODE ,
                TEMP_TABLE.CURRENCY ,
                TEMP_TABLE.UNIT_PRICE ,
                TEMP_TABLE.GROUP_TYPE ,
                TEMP_TABLE.EXPIRY_DATE ,
                TEMP_TABLE.GROUP_STOCK_TYPE ,
                TEMP_TABLE.STOCK_EXCHANGE_NAME , 
                TEMP_TABLE.GROUP_SUBTYPE , 
                TEMP_TABLE.COUNTRY_ISO_CODE ,
				TEMP_TABLE.LISTEDSHARE_QUANTITY ,
				TEMP_TABLE.PAR_VALUE,
                CMS_CREDIT_RISK_PARAM.IS_INT_SUSPEND ,
                CMS_CREDIT_RISK_PARAM.SHARE_STATUS ,
                CMS_CREDIT_RISK_PARAM.IS_FI,
                CMS_CREDIT_RISK_PARAM.BOARD_TYPE
        FROM
        (
            SELECT
                CMS_PRICE_FEED.FEED_ID AS FEED_ID ,
                CMS_PRICE_FEED.IS_SUSPENDED ,
                CMS_PRICE_FEED.TICKER ,
                CMS_PRICE_FEED.NAME ,
                CMS_PRICE_FEED.RIC ,
                CMS_PRICE_FEED.ISIN_CODE ,
                CMS_PRICE_FEED.CURRENCY ,
                CMS_PRICE_FEED.UNIT_PRICE ,
                CMS_PRICE_FEED.EXPIRY_DATE ,
                CMS_FEED_GROUP.GROUP_TYPE ,
                CMS_FEED_GROUP.GROUP_STOCK_TYPE ,
                CMS_STOCK_EXCHANGE.STOCK_EXCHANGE_NAME , 
                CMS_FEED_GROUP.GROUP_SUBTYPE , 
                CMS_STOCK_EXCHANGE.COUNTRY_ISO_CODE ,
				CMS_PRICE_FEED.LISTEDSHARE_QUANTITY ,
				CMS_PRICE_FEED.PAR_VALUE
            FROM 
                CMS_FEED_GROUP , CMS_PRICE_FEED, CMS_STOCK_EXCHANGE 
            WHERE 
                CMS_FEED_GROUP.FEED_GROUP_ID = CMS_PRICE_FEED.FEED_GROUP_ID 
            AND 
                CMS_FEED_GROUP.GROUP_SUBTYPE = CMS_STOCK_EXCHANGE.STOCK_EXCHANGE

        )
        AS TEMP_TABLE
        LEFT OUTER JOIN
        CMS_CREDIT_RISK_PARAM
        ON
        TEMP_TABLE.FEED_ID = CMS_CREDIT_RISK_PARAM.FEED_ID
) AS TABLE1
LEFT OUTER JOIN
(
    SELECT
        CMS_EARMARK_GROUP.FEED_ID ,
        MAX ( CMS_EARMARK_GROUP.LAST_BATCH_UPDATE ) AS LAST_BATCH_UPDATE ,
        SUM ( CMS_EARMARK_GROUP.CMS_ACTUAL_HOLDING ) AS CMS_ACTUAL_HOLDING ,
        SUM ( CMS_EARMARK_GROUP.TOTAL_NO_OF_UNITS ) AS TOTAL_NO_OF_UNITS ,
        SUM ( EARMARK_HOLDING ) AS EARMARK_HOLDING ,
        SUM ( EARMARK_CURRENT ) AS EARMARK_CURRENT
    FROM
        CMS_EARMARK_GROUP
    GROUP BY
        CMS_EARMARK_GROUP.FEED_ID
) AS TABLE2
ON
        TABLE1.FEED_ID = TABLE2.FEED_ID
GROUP BY
  TABLE1.FEED_ID ,
  IS_INT_SUSPEND ,
  IS_SUSPENDED ,
  SHARE_STATUS ,
  TICKER ,
  NAME ,
  EXPIRY_DATE ,
  GROUP_STOCK_TYPE ,
  RIC ,
  STOCK_EXCHANGE_NAME , 
  GROUP_SUBTYPE , 
  COUNTRY_ISO_CODE ,
  CURRENCY ,
  ISIN_CODE ,
  GROUP_TYPE ,
  IS_FI,BOARD_TYPE,PAR_VALUE ;  
  
drop view VW_BCA_DETAILS; 
  
CREATE VIEW VW_BCA_DETAILS (
	CMS_LSP_LMT_PROFILE_ID, LLP_LE_ID, LLP_ID, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, CMS_TAT_CREATE_DATE,
	CMS_BCA_STATUS, LLP_EXTD_NEXT_RVW_DATE, LLP_NEXT_ANNL_RVW_DATE, CMS_BCA_CREATE_DATE,
    LLP_BCA_REF_NUM, LOS_BCA_REF_NUM, LLP_BCA_REF_APPR_DATE, CMS_BCA_LOCAL_IND, CMS_BCA_RENEWAL_IND,
	CMS_BFL_REQUIRED_IND,   CMS_FULL_DOC_REVIEW_IND, LSP_SHORT_NAME,
	LSP_LE_ID, LSP_ID,   CMS_LE_SUB_PROFILE_ID, CMS_LE_MAIN_PROFILE_ID, CMS_NON_BORROWER_IND) 
AS  
SELECT pf.cms_lsp_lmt_profile_id, pf.llp_le_id, pf.llp_id, pf.cms_orig_country, pf.cms_orig_organisation, 
	pf.cms_tat_create_date,
	pf.cms_bca_status, pf.llp_extd_next_rvw_date, pf.llp_next_annl_rvw_date, pf.cms_bca_create_date,
	pf.llp_bca_ref_num, pf.los_bca_ref_num, pf.llp_bca_ref_appr_date, pf.cms_bca_local_ind, pf.cms_bca_renewal_ind,
	pf.cms_bfl_required_ind, pf.cms_full_doc_review_ind,
	sp.lsp_short_name, sp.lsp_le_id, sp.lsp_id, sp.cms_le_sub_profile_id, sp.cms_le_main_profile_id,
    sp.cms_non_borrower_ind
FROM sci_le_sub_profile sp, sci_lsp_lmt_profile pf   
where pf.cms_customer_id = sp.cms_le_sub_profile_id; 

drop view VW_LATEST_VALUATION; 

create view VW_LATEST_VALUATION as 
select VALUATION_ID,VALUATION_DATE,VALUER,SOURCE_ID,SOURCE_TYPE,CMS_COLLATERAL_ID,VALUATION_CURRENCY,OLV from CMS_VALUATION where VALUATION_ID in (select max(VALUATION_ID) from CMS_VALUATION group by CMS_COLLATERAL_ID);


----------------------------------------------------------------------
-- View Helpers
----------------------------------------------------------------------

drop view VW_SECURITY_BY_ALL_BUE; 

CREATE VIEW VW_SECURITY_BY_ALL_BUE
(CMS_COLLATERAL_ID, SECURITY_TYPE, FSV_BALANCE, FSV_BALANCE_CCY, COUNTRY, 
CMS_LSP_APPR_LMTS_ID, CMS_LSP_LMT_PROFILE_ID, LLP_SEGMENT_CODE_VALUE, 
LSM_CREATE_DATE, LSM_ID)
AS
	select sec.cms_collateral_id, substr(sec.SECURITY_SUB_TYPE_ID, 1, 2), sec.FSV_BALANCE, sec.FSV_BALANCE_CCY, sec.SECURITY_LOCATION,
		   appr.CMS_LSP_APPR_LMTS_ID, lmt.CMS_LSP_LMT_PROFILE_ID, lmt.LLP_SEGMENT_CODE_VALUE, 
           lsm.CREATE_DATE, lsm.CHARGE_ID
	from cms_security sec, CMS_LIMIT_SECURITY_MAP lsm, sci_lsp_appr_lmts appr, sci_lsp_lmt_profile lmt
	where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = appr.CMS_LSP_APPR_LMTS_ID
	and appr.CMS_LIMIT_PROFILE_ID = lmt.CMS_LSP_LMT_PROFILE_ID
	and sec.IS_LEGAL_ENFORCE = 'Y'
	and (sec.STATUS is null or sec.STATUS = 'ACTIVE')
	and (lsm.UPDATE_STATUS_IND is null or lsm.UPDATE_STATUS_IND <> 'D')
	and (appr.UPDATE_STATUS_IND is null or appr.UPDATE_STATUS_IND <> 'D');

drop view VW_SECURITY_KEY_BY_FIRST_BUE; 

CREATE VIEW VW_SECURITY_KEY_BY_FIRST_BUE 
(CMS_COLLATERAL_ID, FIRST_LSM_CREATE_DATE)
AS 
	select CMS_COLLATERAL_ID, min(LSM_CREATE_DATE)
	from VW_SECURITY_BY_ALL_BUE
	group by CMS_COLLATERAL_ID;

drop view VW_SECURITY_BY_FIRST_BUE; 
	
CREATE VIEW VW_SECURITY_BY_FIRST_BUE
(CMS_COLLATERAL_ID, SECURITY_TYPE, FSV_BALANCE, FSV_BALANCE_CCY, COUNTRY, 
CMS_LSP_APPR_LMTS_ID, CMS_LSP_LMT_PROFILE_ID, LLP_SEGMENT_CODE_VALUE, 
LSM_CREATE_DATE, LSM_ID)
AS
	SELECT all.CMS_COLLATERAL_ID, all.SECURITY_TYPE, all.FSV_BALANCE, all.FSV_BALANCE_CCY, all.COUNTRY, 
		   all.CMS_LSP_APPR_LMTS_ID, all.CMS_LSP_LMT_PROFILE_ID, all.LLP_SEGMENT_CODE_VALUE, 
		   all.LSM_CREATE_DATE, all.LSM_ID
	from VW_SECURITY_BY_ALL_BUE all, VW_SECURITY_KEY_BY_FIRST_BUE fst
	where all.cms_collateral_id = fst.cms_collateral_id
	and all.LSM_CREATE_DATE = fst.FIRST_LSM_CREATE_DATE;
	

----------------------------------------------------------------------
-- View Helpers
----------------------------------------------------------------------

drop view VW_PROPERTY_BY_ALL_BU; 

CREATE VIEW VW_PROPERTY_BY_ALL_BU
(CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID, FSV_BALANCE, FSV_BALANCE_CCY, COUNTRY, 
CMS_LSP_APPR_LMTS_ID, CMS_LSP_LMT_PROFILE_ID, LLP_SEGMENT_CODE_VALUE, 
LSM_CREATE_DATE, LSM_ID)
AS
	select sec.cms_collateral_id, sec.SECURITY_SUB_TYPE_ID, sec.FSV_BALANCE, sec.FSV_BALANCE_CCY, sec.SECURITY_LOCATION,
		   appr.CMS_LSP_APPR_LMTS_ID, lmt.CMS_LSP_LMT_PROFILE_ID, lmt.LLP_SEGMENT_CODE_VALUE, 
           lsm.CREATE_DATE, lsm.CHARGE_ID
	from cms_security sec, CMS_LIMIT_SECURITY_MAP lsm, sci_lsp_appr_lmts appr, sci_lsp_lmt_profile lmt
	where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = appr.CMS_LSP_APPR_LMTS_ID
	and appr.CMS_LIMIT_PROFILE_ID = lmt.CMS_LSP_LMT_PROFILE_ID
	and substr(security_sub_type_id, 1, 2) = 'PT'
	and sec.IS_LEGAL_ENFORCE = 'Y'
	and (sec.STATUS is null or sec.STATUS = 'ACTIVE')
	and (lsm.UPDATE_STATUS_IND is null or lsm.UPDATE_STATUS_IND <> 'D')
	and (appr.UPDATE_STATUS_IND is null or appr.UPDATE_STATUS_IND <> 'D');

drop view VW_PROPERTY_KEY_BY_FIRST_BU; 
	
CREATE VIEW VW_PROPERTY_KEY_BY_FIRST_BU 
(CMS_COLLATERAL_ID, FIRST_LSM_CREATE_DATE)
AS 
	select CMS_COLLATERAL_ID, min(LSM_CREATE_DATE)
	from VW_PROPERTY_BY_ALL_BU
	group by CMS_COLLATERAL_ID;
	
drop view VW_PROPERTY_BY_FIRST_BU; 
		
CREATE VIEW VW_PROPERTY_BY_FIRST_BU 
(CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID, FSV_BALANCE, FSV_BALANCE_CCY, COUNTRY, 
CMS_LSP_APPR_LMTS_ID, CMS_LSP_LMT_PROFILE_ID, LLP_SEGMENT_CODE_VALUE, 
LSM_CREATE_DATE, LSM_ID)
AS
	SELECT abu.CMS_COLLATERAL_ID, abu.SECURITY_SUB_TYPE_ID, abu.FSV_BALANCE, abu.FSV_BALANCE_CCY, abu.COUNTRY, 
		   abu.CMS_LSP_APPR_LMTS_ID, abu.CMS_LSP_LMT_PROFILE_ID, abu.LLP_SEGMENT_CODE_VALUE, 
		   abu.LSM_CREATE_DATE, abu.LSM_ID
	from VW_PROPERTY_BY_ALL_BU abu, VW_PROPERTY_KEY_BY_FIRST_BU fbu
	where abu.cms_collateral_id = fbu.cms_collateral_id
	and abu.LSM_CREATE_DATE = fbu.FIRST_LSM_CREATE_DATE;


----------------------------------------------------------------------
-- CON028: Concentration Report of Top 50 Borrowers 
----------------------------------------------------------------------

drop view VW_BORROWER_TOTAL_LMT_AMT; 

CREATE VIEW VW_BORROWER_TOTAL_LMT_AMT
(LE_ID, CIF_SOURCE_ID, COUNTRY, TOTAL_LMT_AMT)
AS
	select aa.llp_le_id, aa.cif_source_id, aa.CMS_ORIG_COUNTRY, sum(CONVERT_AMT(lmts.LMT_AMT, LMT_CRRNCY_ISO_CODE, 'MYR')) 
	from sci_lsp_appr_lmts lmts, sci_lsp_lmt_profile aa
	where lmts.CMS_LIMIT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    and lmts.CMS_LIMIT_STATUS = 'ACTIVE'
    and aa.CMS_BCA_STATUS <> 'DELETED'
    group by llp_le_id, cif_source_id, aa.CMS_ORIG_COUNTRY;
    
------------------------------
-- to do pending cases view
------------------------------


drop view security_pending_cases_view; 

create view security_pending_cases_view (cms_lsp_lmt_profile_id, sec_count, sec_migrated_count, sec_perfected_count)
as
select cms_lsp_lmt_profile_id, sec_count,
	(select count (distinct sec2.cms_collateral_id)
	from cms_limit_security_map lsm2, cms_security sec2
	where lsm2.CMS_COLLATERAL_ID = sec2.cms_collateral_id
	and lsm2.cms_lsp_lmt_profile_id = t1.cms_lsp_lmt_profile_id
	and (lsm2.UPDATE_STATUS_IND <> 'D' or lsm2.update_status_ind is null)
	and is_migrated_ind = 'Y') as sec_migrated_count,
	(select count (distinct sec3.cms_collateral_id)
	from cms_limit_security_map lsm3, cms_security sec3
	where lsm3.CMS_COLLATERAL_ID = sec3.cms_collateral_id
	and lsm3.CMS_LSP_LMT_PROFILE_ID = t1.cms_lsp_lmt_profile_id
	and (lsm3.UPDATE_STATUS_IND <> 'D' or lsm3.update_status_ind is null)
	and IS_SECURITY_PERFECTED = 'Y') as sec_perfected_count
from 
		(select cms_lsp_lmt_profile_id, count(distinct cms_collateral_id) as sec_count
		from cms_limit_security_map lsm
		where lsm.update_status_ind <> 'D' 
		or lsm.update_status_ind is null
		group by cms_lsp_lmt_profile_id) t1 
where t1.sec_count > 0; 


/*******************************
Password Policy Audit Trail

********************************/

drop view vw_password_policy_hist; 

CREATE VIEW vw_password_policy_hist 
	(time_stamp, update_by, number_warn_days_changes, pwd_max_age_changes, max_repeated_chars_changes,
	 pwd_min_age_changes, min_alpha_chars_changes, pwd_min_length_changes, pwd_max_length_changes,
	 pwd_history_changes)
AS
SELECT time_stamp, update_by,
	   CASE WHEN old_number_warn_days <> new_number_warn_days THEN
	   	'FROM [' || RTRIM(CHAR(old_number_warn_days)) || 
	   	'] TO [' || RTRIM(CHAR(new_number_warn_days)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_pwd_max_age <> new_pwd_max_age THEN
	   	'FROM [' || RTRIM(CHAR(old_pwd_max_age)) || 
	   	'] TO [' || RTRIM(CHAR(new_pwd_max_age)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_max_repeated_chars <> new_max_repeated_chars THEN
	   	'FROM [' || RTRIM(CHAR(old_max_repeated_chars)) || 
	   	'] TO [' || RTRIM(CHAR(new_max_repeated_chars)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_pwd_min_age <> new_pwd_min_age THEN
	   	'FROM [' || RTRIM(CHAR(old_pwd_min_age)) || 
	   	'] TO [' || RTRIM(CHAR(new_pwd_min_age)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_min_alpha_chars <> new_min_alpha_chars THEN
	   	'FROM [' || RTRIM(CHAR(old_min_alpha_chars)) || 
	   	'] TO [' || RTRIM(CHAR(new_min_alpha_chars)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_pwd_min_length <> new_pwd_min_length THEN
	   	'FROM [' || RTRIM(CHAR(old_pwd_min_length)) || 
	   	'] TO [' || RTRIM(CHAR(new_pwd_min_length)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_pwd_max_length <> new_pwd_max_length THEN
	   	'FROM [' || RTRIM(CHAR(old_pwd_max_length)) || 
	   	'] TO [' || RTRIM(CHAR(new_pwd_max_length)) || ']'
	   ELSE 'N' END,
	   CASE WHEN old_pwd_history <> new_pwd_history THEN
	   	'FROM [' || RTRIM(CHAR(old_pwd_history)) || 
	   	'] TO [' || RTRIM(CHAR(new_pwd_history)) || ']'
	   ELSE 'N' END
  FROM cms_password_policy_history;
  
  
----------------------------------------------------------------------
-- Checklist Module (View All)
----------------------------------------------------------------------  

drop view vw_bca_sec_map; 

CREATE VIEW vw_bca_sec_map (cms_lsp_lmt_profile_id,
                                     cms_customer_id,
                                     cms_collateral_id,
                                     sci_security_dtl_id,
                                     llp_le_id,
                                     cms_orig_country,
                                     cms_orig_organisation,
                                     security_location,
                                     cms_bca_status,
                                     status,
                                     security_organisation,
                                     cb_customer_id,
                                     cb_orig_country,
                                     cb_orig_organisation,
                                     customer_category,
                                     lsp_short_name,
                                     lsp_le_id,
                                     cb_legal_name,
                                     cb_le_id,
                                     fam_code,
                                     fam_name,
                                     customer_segment_code,
                                     customer_segment,
                                     llp_id,
                                     lsp_id,
                                     cb_lsp_id
                                    )
AS
   SELECT p.cms_lsp_lmt_profile_id, p.cms_customer_id, sec.cms_collateral_id,
          sec.sci_security_dtl_id, p.llp_le_id, p.cms_orig_country,
          p.cms_orig_organisation, sec.security_location, p.cms_bca_status,
          sec.status, sec.security_organisation, 0 cb_customer_id,
          CAST (NULL AS CHAR (2)) AS cb_orig_country,
          CAST (NULL AS VARCHAR (20)) AS cb_orig_organisation,
          'MB' customer_category, sp.lsp_short_name, sp.lsp_le_id,
          '-' cb_legal_name, CAST (NULL AS VARCHAR (20)) cb_le_id,
          fam.fam_code, fam.fam_name,
          (SELECT entry_code
             FROM common_code_category_entry ccce,
                  sci_le_main_profile mp
            WHERE ccce.category_code = CHAR (mp.lmp_sgmnt_code_num)
              AND ccce.entry_code = mp.lmp_sgmnt_code_value
              AND mp.cms_le_main_profile_id = sp.cms_le_main_profile_id)
                                                        customer_segment_code,
          (SELECT entry_name
             FROM common_code_category_entry ccce,
                  sci_le_main_profile mp
            WHERE ccce.category_code = CHAR (mp.lmp_sgmnt_code_num)
              AND ccce.entry_code = mp.lmp_sgmnt_code_value
              AND mp.cms_le_main_profile_id = sp.cms_le_main_profile_id)
                                                             customer_segment,
          p.llp_id, sp.lsp_id, 0 cb_lsp_id
     FROM (SELECT DISTINCT sci_las_llp_id, cms_collateral_id
                      FROM cms_limit_security_map MAP
                     WHERE MAP.update_status_ind <> 'D'
                       AND MAP.customer_category = 'MB'
           UNION
           (SELECT DISTINCT sci_las_llp_id, MAP.cms_collateral_id
                       FROM sci_lsp_lmt_profile pf,
                            cms_limit_security_map MAP,
                            cms_checklist chklist,
                            TRANSACTION
                      WHERE MAP.cms_collateral_id = chklist.cms_collateral_id
                        AND TRANSACTION.reference_id = chklist.checklist_id
                        AND MAP.sci_las_llp_id = pf.llp_id
                        AND pf.cms_lsp_lmt_profile_id =
                                                chklist.cms_lsp_lmt_profile_id
                        AND TRANSACTION.status <> 'OBSOLETE'
                        AND TRANSACTION.transaction_type = 'CHECKLIST'
                        AND MAP.update_status_ind = 'D'
                        AND MAP.customer_category = 'MB'
                        AND chklist.sub_category = 'MAIN_BORROWER'
                        AND chklist.CATEGORY = 'S')) MAP,
          cms_security sec,
          sci_le_sub_profile sp,
          sci_lsp_lmt_profile p LEFT OUTER JOIN cust_loc_fam fam ON (    p.cms_customer_id =
                                                                            fam.customer_id
                                                                     AND p.cms_orig_country =
                                                                            fam.bkg_loc_ctry
                                                                     AND p.cms_orig_organisation =
                                                                            fam.bkg_loc_org
                                                                    )
    WHERE p.llp_id = MAP.sci_las_llp_id
      AND MAP.cms_collateral_id = sec.cms_collateral_id
      AND p.cms_customer_id = sp.cms_le_sub_profile_id
   UNION
   SELECT p.cms_lsp_lmt_profile_id, p.cms_customer_id, sec.cms_collateral_id,
          sec.sci_security_dtl_id, p.llp_le_id, p.cms_orig_country,
          p.cms_orig_organisation, sec.security_location, p.cms_bca_status,
          sec.status, sec.security_organisation,
          cosp.cms_le_sub_profile_id cb_customer_id,
          cosp.cms_sub_orig_country cb_orig_country,
          cosp.cms_sub_orig_organisation cb_orig_organisation,
          'CB' customer_category, sp.lsp_short_name, sp.lsp_le_id,
          cosp.lsp_short_name cb_legal_name, cosp.lsp_le_id cb_le_id,
          fam.fam_code, fam.fam_name,
          (SELECT entry_code
             FROM common_code_category_entry ccce,
                  sci_le_main_profile mp
            WHERE ccce.category_code = CHAR (mp.lmp_sgmnt_code_num)
              AND ccce.entry_code = mp.lmp_sgmnt_code_value
              AND mp.cms_le_main_profile_id = sp.cms_le_main_profile_id)
                                                        customer_segment_code,
          (SELECT entry_name
             FROM common_code_category_entry ccce,
                  sci_le_main_profile mp
            WHERE ccce.category_code = CHAR (mp.lmp_sgmnt_code_num)
              AND ccce.entry_code = mp.lmp_sgmnt_code_value
              AND mp.cms_le_main_profile_id = sp.cms_le_main_profile_id)
                                                             customer_segment,
          p.llp_id, sp.lsp_id, cosp.lsp_id
     FROM (SELECT DISTINCT sci_las_llp_id, cms_collateral_id,
                           co.cms_customer_id
                      FROM cms_limit_security_map MAP,
                           sci_lsp_co_borrow_lmt co
                     WHERE MAP.update_status_ind <> 'D'
                       AND MAP.customer_category = 'CB'
                       AND co.cms_lsp_co_borrow_lmt_id =
                                                  MAP.cms_lsp_co_borrow_lmt_id
           UNION
           (SELECT DISTINCT sci_las_llp_id, MAP.cms_collateral_id,
                            co.cms_customer_id
                       FROM sci_lsp_lmt_profile pf,
                            cms_limit_security_map MAP,
                            cms_checklist chklist,
                            TRANSACTION trx,
                            sci_lsp_co_borrow_lmt co
                      WHERE co.cms_lsp_co_borrow_lmt_id =
                                                  MAP.cms_lsp_co_borrow_lmt_id
                        AND MAP.cms_collateral_id = chklist.cms_collateral_id
                        AND MAP.sci_las_llp_id = pf.llp_id
                        AND MAP.customer_category = 'CB'
                        AND MAP.update_status_ind = 'D'
                        AND pf.cms_lsp_lmt_profile_id =
                                                chklist.cms_lsp_lmt_profile_id
                        AND trx.reference_id = chklist.checklist_id
                        AND trx.status <> 'OBSOLETE'
                        AND trx.transaction_type = 'CHECKLIST'
                        AND chklist.CATEGORY = 'CO_BORROWER'
                        AND chklist.CATEGORY = 'S')) MAP,
          cms_security sec,
          sci_le_sub_profile sp,
          sci_le_sub_profile cosp,
          sci_lsp_lmt_profile p LEFT OUTER JOIN cust_loc_fam fam ON (    p.cms_customer_id =
                                                                            fam.customer_id
                                                                     AND p.cms_orig_country =
                                                                            fam.bkg_loc_ctry
                                                                     AND p.cms_orig_organisation =
                                                                            fam.bkg_loc_org
                                                                    )
    WHERE p.llp_id = MAP.sci_las_llp_id
      AND MAP.cms_collateral_id = sec.cms_collateral_id
      AND cosp.cms_le_sub_profile_id = MAP.cms_customer_id
      AND p.cms_customer_id = sp.cms_le_sub_profile_id;

drop view VW_FACILITY_CHARGE_MAP; 
      
CREATE VIEW VW_FACILITY_CHARGE_MAP
    ( FACILITYTYPE, TYPEID, CHARGEAMT )
AS
select get_product_type(ACCOUNT_TYPE, LMT_PRD_TYPE_VALUE, LMT_CRRNCY_ISO_CODE) facilityType,
	SCI_SECURITY_TYPE_VALUE typeId, sum(cmv) cmv
from (select lmts.LMT_PRD_TYPE_VALUE, lmts.LMT_CRRNCY_ISO_CODE, lmts.ACCOUNT_TYPE, SCI_SECURITY_TYPE_VALUE,
			convert_amt(coalesce(sec.CMV, 0), coalesce(sec.CMV_CURRENCY, 'MYR'), 'MYR') cmv
			from cms_security sec, sci_lsp_appr_lmts lmts, cms_limit_security_map lsm
		where lmts.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
		and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
		and (lsm.UPDATE_STATUS_IND <> 'D' or lsm.UPDATE_STATUS_IND is null)
		and (sec.SECURITY_SUB_TYPE_ID <> 'CL001' or sec.SECURITY_SUB_TYPE_ID not like 'DC%')) t
group by LMT_PRD_TYPE_VALUE, LMT_CRRNCY_ISO_CODE, ACCOUNT_TYPE, SCI_SECURITY_TYPE_VALUE;

CREATE VIEW VW_TOTAL_COLLATERAL_CHARGE(ABTOTAL, CSTOTAL, GTTOTAL, INTOTAL, MSTOTAL, PTTOTAL, OTTOTAL) as
select sum(abResult) abTotal, sum(csResult) csTotal, sum(gtResult) gtTotal,sum(inResult) inTotal, 
	sum(msResult) msTotal, sum(ptResult) ptTotal, sum(otResult) otTotal
from
(select distinct fcm.facilityType, 
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='AB' and facilityType=fcm.facilityType),0) abResult,
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='CS' and facilityType=fcm.facilityType),0) csResult,
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='GT' and facilityType=fcm.facilityType),0) gtResult,
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='IN' and facilityType=fcm.facilityType),0) inResult,
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='MS' and facilityType=fcm.facilityType),0) msResult,
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='PT' and facilityType=fcm.facilityType),0) ptResult,
	coalesce((select chargeAmt from VW_FACILITY_CHARGE_MAP where typeID='OT' and facilityType=fcm.facilityType),0) otResult
from VW_FACILITY_CHARGE_MAP fcm) totalCollateral;


----------------------------------------------------------------------
-- ANA001: Analysis report: Property by state 
----------------------------------------------------------------------

DROP VIEW VW_PROPERTY_BY_STATE;	
CREATE VIEW VW_PROPERTY_BY_STATE (
	ORDER_SEQ, COL_ID, SECURITY_SUB_TYPE_ID,
	STATE, MUKIM, DISTRICT, TAMAN, CMV, FSV, 
	OUTSTANDING_AMT, CMS_LIMIT_PROFILE_ID)
AS
	SELECT 
		CASE SEC.SECURITY_SUB_TYPE_ID
			WHEN 'PT704' THEN 1
			WHEN 'PT701' THEN 2
			WHEN 'PT702' THEN 2
			WHEN 'PT710' THEN 2
			WHEN 'PT703' THEN 3
			WHEN 'PT707' THEN 4
			WHEN 'PT700' THEN 5
			WHEN 'PT706' THEN 6
			WHEN 'PT709' THEN 6
			ELSE 7
		END ORDER_SEQ, PROP.CMS_COLLATERAL_ID, 
		SEC.SECURITY_SUB_TYPE_ID,		
		PROP.STATE,
		PROP.MUKIM,
		PROP.DISTRICT,
		PROP.TAMAN,
		CONVERT_AMT(SEC.CMV, SEC.CMV_CURRENCY, 
				(SELECT CUR_CRRNCY_ISO_CODE 
				FROM SCI_CURRENCY 
				WHERE CUR_CNTRY_ISO_CODE = 'MY')) CMV,
		CONVERT_AMT(SEC.FSV, SEC.FSV_CURRENCY, 
				(SELECT CUR_CRRNCY_ISO_CODE 
				FROM SCI_CURRENCY 
				WHERE CUR_CNTRY_ISO_CODE = 'MY')) FSV,
		CONVERT_AMT(CMS_OUTSTANDING_AMT, L.LMT_CRRNCY_ISO_CODE, 
				(SELECT CUR_CRRNCY_ISO_CODE 
				FROM SCI_CURRENCY 
				WHERE CUR_CNTRY_ISO_CODE = 'MY')) OUTSTANDING_AMT,
		L.CMS_LIMIT_PROFILE_ID
	FROM CMS_PROPERTY PROP, CMS_SECURITY SEC, SCI_LSP_APPR_LMTS L, CMS_LIMIT_SECURITY_MAP M
	WHERE PROP.CMS_COLLATERAL_ID = SEC.CMS_COLLATERAL_ID
        AND SEC.STATUS <> 'DELETED'
        AND PROP.STATE IS NOT NULL AND LENGTH( PROP.STATE ) <> 0
		AND PROP.DISTRICT IS NOT NULL AND LENGTH( PROP.DISTRICT ) <> 0
		AND PROP.MUKIM IS NOT NULL AND LENGTH( PROP.MUKIM ) <> 0
        AND SEC.SECURITY_LOCATION = 'MY' 
		AND L.CMS_LSP_APPR_LMTS_ID = M.CMS_LSP_APPR_LMTS_ID
		AND M.CMS_COLLATERAL_ID = SEC.CMS_COLLATERAL_ID
		AND L.CMS_LIMIT_STATUS <> 'DELETED'
		AND (M.UPDATE_STATUS_IND IS NULL OR M.UPDATE_STATUS_IND <> 'D');
	
	
	
COMMIT WORK;