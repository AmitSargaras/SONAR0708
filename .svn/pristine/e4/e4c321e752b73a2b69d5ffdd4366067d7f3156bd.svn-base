set serveroutput on
set timing on

spool refresh_lmt_profile_biz_days.log

CREATE BITMAP INDEX TEMP_IDX_1 ON SCI_LSP_LMT_PROFILE
(CMS_TAT_CREATE_DATE, CMS_BFL_REQUIRED_IND)
TABLESPACE CMS_INDEX
COMPUTE STATISTICS;

CREATE INDEX TEMP_IDX_2 ON SCI_LSP_LMT_PROFILE
(LLP_BCA_REF_APPR_DATE, CMS_ORIG_COUNTRY)
TABLESPACE CMS_INDEX
COMPUTE STATISTICS;

DECLARE

   l_sql1 varchar2(255) := 'TRUNCATE TABLE LMT_PROFILE_BIZ_DAYS REUSE STORAGE';

   CURSOR c1
   IS
      SELECT   llp_bca_ref_appr_date, cms_orig_country
          FROM sci_lsp_lmt_profile llp
         WHERE llp.cms_tat_create_date IS NOT NULL
      GROUP BY llp_bca_ref_appr_date, cms_orig_country;
      
   num_biz_days   NUMBER (6) := 0;
   
BEGIN

   dbms_output.put_line('***** truncating table lmt_profile_biz_days *****');
   execute immediate l_sql1;

   dbms_output.put_line('***** refreshing table lmt_profile_biz_days *****');    
   FOR i IN c1
   LOOP
      num_biz_days := business_days (to_date(SYSDATE), to_date(i.llp_bca_ref_appr_date), i.cms_orig_country);

      INSERT INTO lmt_profile_biz_days
         SELECT cms_lsp_lmt_profile_id, num_biz_days
           FROM sci_lsp_lmt_profile
          WHERE llp_bca_ref_appr_date = i.llp_bca_ref_appr_date
            AND cms_orig_country = i.cms_orig_country
            AND cms_tat_create_date IS NOT NULL;
   END LOOP;
   
   COMMIT;
   
END;
/

DROP INDEX TEMP_IDX_1;

DROP INDEX TEMP_IDX_2;


spool off

