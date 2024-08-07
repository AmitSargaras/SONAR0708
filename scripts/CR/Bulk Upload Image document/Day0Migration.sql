select fac.lmt_id facility_id, fac.facility_cat facility_category
, fac.facility_type , fac.facility_name, fac.facility_system,
party.lsp_le_id party_id, PARTY.LSP_SHORT_NAME party_name, FAC.LINE_NO, FAC.BANKING_ARRANGEMENT, FAC.CLAUSE_AS_PER_POLICY
from SCI_LSP_APPR_LMTS fac 
inner join SCI_LSP_LMT_PROFILE cam on CAM.CMS_LSP_LMT_PROFILE_ID = FAC.CMS_LIMIT_PROFILE_ID
inner join SCI_LE_SUB_PROFILE party  on PARTY.LSP_LE_ID = cam.llp_le_id
where FAC.CMS_LIMIT_STATUS = 'ACTIVE' ;


create table MIG_BANKING_ARR_AT_FAC(
facility_id VARCHAR2(43 CHAR),
facility_category VARCHAR2(100),
facility_type VARCHAR2(100),
facility_name VARCHAR2(100),      
system VARCHAR2(100),
party_id  VARCHAR2(20),
party_name VARCHAR2(100),
line_no VARCHAR2(50),
banking_arrangement  VARCHAR2(750 CHAR),  
clause_as_per_policy VARCHAR2(750 CHAR),
status CHAR(1 CHAR) default 'P');

create or replace procedure sp_sync_banking_arr_at_fac  as
v_ref_id number(19);
v_stage_id number(19);
v_banking_arr VARCHAR2(60 CHAR);
v_clause_as_per_policy VARCHAR2(60 CHAR);
v_status varchar(3);
CURSOR CR_DATA IS select * from MIG_BANKING_ARR_AT_FAC where status = 'P' for update of status;
RC_DATA CR_DATA%ROWTYPE;
begin 
open cr_data;
  loop
   FETCH CR_DATA INTO RC_DATA;
      EXIT WHEN CR_DATA%NOTFOUND;
      v_ref_id := null;
      v_status := 'F';
      begin
        select CMS_LSP_APPR_LMTS_ID into v_ref_id from SCI_LSP_APPR_LMTS where lmt_id = RC_DATA.facility_id and CMS_LIMIT_STATUS = 'ACTIVE';
        select STAGING_REFERENCE_ID into v_stage_id from transaction where REFERENCE_ID = v_ref_id and status ='ACTIVE' and TRANSACTION_TYPE = 'LIMIT';
        select entry_code into v_banking_arr from COMMON_CODE_CATEGORY_ENTRY where category_code = 'BANKING_ARRANGEMENT' and active_status = '1' and 
        (entry_code= RC_DATA.banking_arrangement or entry_name = RC_DATA.banking_arrangement);
      exception when NO_DATA_FOUND then v_ref_id := null;
      end;
      if v_ref_id is not null then
        begin
         select entry_code into v_clause_as_per_policy from COMMON_CODE_CATEGORY_ENTRY where category_code = 'CLAUSE_AS_PER_POLICY' and active_status = '1' and (entry_code= RC_DATA.clause_as_per_policy or entry_name = RC_DATA.clause_as_per_policy);
         exception when NO_DATA_FOUND then v_clause_as_per_policy := null;
        end;
        if v_clause_as_per_policy is null and RC_DATA.clause_as_per_policy is not null then
          select upper(replace(trim(RC_DATA.clause_as_per_policy), ' ','_')) into v_clause_as_per_policy from dual;
			
          insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
          values
          ((select max(entry_id) + 1 from common_code_category_entry),v_clause_as_per_policy,RC_DATA.clause_as_per_policy, '1', 'CLAUSE_AS_PER_POLICY',
          (SELECT CATEGORY_ID FROM common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' and active_status = 'A'), 0, sysdate, sysdate);
    
          insert into STAGE_COMMON_CODE_ENTRY 
          (stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
          values
          ((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
          (select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'CLAUSE_AS_PER_POLICY' and entry_code= v_clause_as_per_policy and ACTIVE_STATUS = '1')
          ,v_clause_as_per_policy,RC_DATA.clause_as_per_policy, '1', 'CLAUSE_AS_PER_POLICY',
          (SELECT CATEGORY_ID FROM common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' and active_status = 'A'), 0,
          (SELECT category_id FROM stage_common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' AND active_status='A')
          , sysdate, sysdate);
        end if;
  
      update SCI_LSP_APPR_LMTS set BANKING_ARRANGEMENT = v_banking_arr
        , CLAUSE_AS_PER_POLICY = v_clause_as_per_policy where CMS_LSP_APPR_LMTS_ID = v_ref_id;
      update STAGE_LIMIT set BANKING_ARRANGEMENT = v_banking_arr
        , CLAUSE_AS_PER_POLICY = v_clause_as_per_policy where CMS_LSP_APPR_LMTS_ID = v_stage_id;
      
      update sci_lsp_sys_xref line set line.BANKING_ARRANGEMENT =  v_banking_arr 
        where line.status in ('SUCCESS') and line.CMS_LSP_SYS_XREF_ID 
        in (select CMS_LSP_SYS_XREF_ID from sci_lsp_lmts_xref_map where cms_lsp_appr_lmts_id = v_ref_id);
        
      update CMS_STAGE_LSP_SYS_XREF line set line.BANKING_ARRANGEMENT =  v_banking_arr 
        where line.status in ('SUCCESS') and line.CMS_LSP_SYS_XREF_ID 
        in (select CMS_LSP_SYS_XREF_ID from STAGE_LIMIT_XREF where cms_lsp_appr_lmts_id = v_stage_id);  
        
       v_status := 'S';  
      end if;
      update MIG_BANKING_ARR_AT_FAC set status = v_status where current of CR_DATA;
    END LOOP;
    close CR_DATA;
    COMMIT;
end sp_sync_banking_arr_at_fac;
/

create table MIG_BANKING_ARR_FAC_EXC(
system VARCHAR2(750 CHAR),
facility_category VARCHAR2(750 CHAR),
facility_name VARCHAR2(300 CHAR),
status CHAR(1 CHAR) default 'P');

create or replace procedure sp_sync_banking_arr_fac_exc  as
v_system VARCHAR2(60 CHAR);
v_fac_cat VARCHAR2(60 CHAR);
v_fac_name VARCHAR2(300 CHAR);
v_trx_id number;
v_trx_hist_id number;
v_mst_id number;
v_stg_id number;
v_status varchar(3);
CURSOR CR_DATA IS select * from MIG_BANKING_ARR_FAC_EXC where status = 'P' for update of status;
RC_DATA CR_DATA%ROWTYPE;
begin 
open cr_data;
  loop
   FETCH CR_DATA INTO RC_DATA;
      EXIT WHEN CR_DATA%NOTFOUND;
        v_status := 'F';
		begin
			select entry_code into v_system from COMMON_CODE_CATEGORY_ENTRY where category_code = 'SYSTEM' and active_status = '1' and 
			  (entry_code= RC_DATA.system or entry_name = RC_DATA.system);
			if RC_DATA.facility_category is not null then
				select entry_code into v_fac_cat from COMMON_CODE_CATEGORY_ENTRY where category_code = 'FACILITY_CATEGORY' and active_status = '1' and 
				(entry_code= RC_DATA.facility_category or entry_name = RC_DATA.facility_category);
			end if;
			if RC_DATA.facility_category is not null then			
				select new_facility_name into v_fac_name FROM CMS_FACILITY_NEW_MASTER WHERE status='ACTIVE' and 
				(UPPER(new_facility_category)= UPPER(RC_DATA.facility_name) or new_facility_name = RC_DATA.facility_name);
			end if;	
		 exception when NO_DATA_FOUND then v_system := null;
		end;
        if v_system is not null then
          v_trx_id := to_char(sysdate,'YYYYMMDD') || lpad(TRX_SEQ.nextval,9,0);
          v_mst_id := to_char(sysdate,'YYYYMMDD') || lpad(CMS_BANKING_ARR_FAC_EXC_SEQ.nextval,9,0);
          v_stg_id := to_char(sysdate,'YYYYMMDD') || lpad(STAGE_BANKING_ARR_FAC_EXC_SEQ.nextval,9,0);
          
          v_trx_hist_id := to_char(sysdate,'YYYYMMDD') || lpad(TRX_HISTORY_SEQ.nextval,9,0);
          
          insert into trans_history (tr_history_id, transaction_id, from_state, to_state,
          user_id, login_id, transaction_type, creation_date, transaction_date,reference_id,status,
          staging_reference_id, team_id, opsdesc, to_user_id, to_group_id, customer_id, limit_profile_id,
          team_type_id, team_membership_id)
          values (
          v_trx_hist_id, v_trx_id, 'ND', 'PENDING_CREATE',
          -1, 'System', 'BANKING_ARR_FAC_EXC', sysdate, sysdate, null, 'PENDING_CREATE',
          v_stg_id, -999999999, 'CREATE', -999999999, -999999999, -999999999, -999999999,
          -999999999, -999999999);

          v_trx_hist_id := to_char(sysdate,'YYYYMMDD') || lpad(TRX_HISTORY_SEQ.nextval,9,0);

          insert into trans_history (tr_history_id, transaction_id, from_state, to_state,
          user_id, login_id, transaction_type, creation_date, transaction_date,reference_id,status,
          staging_reference_id, team_id, opsdesc, to_user_id, to_group_id, customer_id, limit_profile_id,
          team_type_id, team_membership_id)
          values (
          v_trx_hist_id, v_trx_id, 'PENDING_CREATE', 'ACTIVE',
          -1, 'System', 'BANKING_ARR_FAC_EXC', sysdate, sysdate, v_mst_id, 'ACTIVE',
          v_stg_id, -999999999, 'APPROVE_CREATE', -999999999, -999999999, -999999999, -999999999,
          -999999999, -999999999);
          
          insert into transaction (transaction_id, from_state, user_id, login_id, transaction_type,
          creation_date, transaction_date, reference_id, status, staging_reference_id, team_id, version,
          trx_reference_id, opsdesc, customer_id, limit_profile_id, cur_trx_history_id, team_type_id,
          to_group_type_id, to_group_id, to_user_id, team_membership_id, system_date)
          values (
          v_trx_id, 'PENDING_CREATE', -1, 'System', 'BANKING_ARR_FAC_EXC',
          sysdate, sysdate, v_mst_id, 'ACTIVE', v_stg_id, -999999999, 0,
          -999999999, 'APPROVE_CREATE', -999999999, -999999999, v_trx_hist_id, -999999999,
          -999999999, -999999999, -999999999, -999999999, sysdate);
          
          insert into CMS_BANKING_ARR_FAC_EXC ( id, system, fac_category,fac_name, excluded, status, version_time,
          created_by, creation_date, last_update_by, last_update_date, deprecated)
          values ( v_mst_id,  v_system, v_fac_cat, v_fac_name, 'Yes', 'ACTIVE', 0, 'System', sysdate, 'System', sysdate,
          'N');

          insert into stage_banking_arr_fac_exc ( id, system, fac_category,fac_name, excluded, status, version_time,
          created_by, creation_date, last_update_by, last_update_date, deprecated)
          values ( v_stg_id,  v_system, v_fac_cat, v_fac_name, 'Yes', 'ACTIVE', 0, 'System', sysdate, 'System', sysdate,
          'N');          
          
          v_status := 'S';
        end if;
        update MIG_BANKING_ARR_FAC_EXC set status = v_status where current of CR_DATA;       
  END LOOP;
close CR_DATA;
COMMIT;
end sp_sync_banking_arr_fac_exc;
/