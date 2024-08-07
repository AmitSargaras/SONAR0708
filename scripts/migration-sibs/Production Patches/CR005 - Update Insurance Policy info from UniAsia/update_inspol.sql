DROP PROCEDURE PATCH_RUN_CO016_IN@

CREATE PROCEDURE PATCH_RUN_CO016_IN
	LANGUAGE SQL
BEGIN
	----------------------------------------
	-- UPDATE for INSURANCE POLICY
	----------------------------------------
	UPDATE PATCH_CO016_IN t SET (t.cms_act_col_id, t.cms_stg_col_id) =
	(SELECT trx.reference_id, trx.staging_reference_id
	   FROM cms_security sec, cms_limit_security_map lsm, transaction trx
	  WHERE sec.cms_collateral_id = trx.reference_id
		AND trx.transaction_type = 'COL'
		AND sec.source_id = 'SIBS'
		AND sec.STATUS = 'ACTIVE'
		AND lsm.SCI_LAS_BCA_REF_NUM = t.AA_NUMBER
		AND lsm.SCI_LAS_BCA_REF_NUM is not null)
	 WHERE t.is_valid = 'Y';
	 
	commit;

	UPDATE PATCH_CO016_IN t SET t.cms_act_insr_id = 
	(SELECT ins.insurance_policy_id 
	   FROM cms_insurance_policy ins
	  WHERE ins.cms_collateral_id = t.cms_act_col_id  
	  and ins.POLICY_SEQ_NO = t.POLICY_SEQ_NO)
	 WHERE t.is_valid = 'Y';
	 
	commit;

	UPDATE PATCH_CO016_IN t SET t.cms_stg_insr_id = 
	(SELECT stg.insurance_policy_id
	   FROM cms_stage_insurance_policy stg
	  WHERE stg.cms_collateral_id = t.cms_stg_col_id 
	  and stg.policy_seq_no = t.policy_seq_no)
	 WHERE t.is_valid = 'Y';

	commit;

	-- Update Actual table  for insurance policy
	update CMS_INSURANCE_POLICY inspol
	set (POLICY_NO, POLICY_SEQ_NO, INSURER_NAME) = 
		(select POLICY_SEQ_NO, POLICY_NUMBER, INSURER_NAME 
			from PATCH_CO016_IN patchins
			where patchins.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');

	update CMS_INSURANCE_POLICY inspol
	set (INSURER_NAME, BANK_CUST_ARRANGE_INS_IND, INSURANCE_TYPE, BUILDING_OCCUPATION) = 
		(select INSURER_NAME_CODE, BANK_CUST_ARRANGE_INS_IND, INSURANCE_TYPE_CODE, BUILDING_OCCUPATION_CODE
			from PATCH_CO016_IN patchins
			where patchins.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');

	update CMS_INSURANCE_POLICY inspol
	set (EFFECTIVE_DATE, EXPIRY_DATE, INSURED_AMT, TYPE_OF_BUILDING) = 
		(select EFFECTIVE_DATE, EXPIRY_DATE, INSURED_AMT, TYPE_OF_BUILDING
			from PATCH_CO016_IN patchins
			where patchins.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');		

	update CMS_INSURANCE_POLICY inspol
	set (WALL, ROOF, TYPE_OF_FLOOR, NUMBER_OF_STOREY) = 
		(select WALL, ROOF, TYPE_OF_FLOOR, NUMBER_OF_STOREY
			from PATCH_CO016_IN patchins
			where patchins.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_act_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');			

	commit;				

	-- Update Staging table for insurance policy	
	update CMS_STAGE_INSURANCE_POLICY inspol
	set (POLICY_NO, POLICY_SEQ_NO, INSURER_NAME) = 
		(select POLICY_SEQ_NO, POLICY_NUMBER, INSURER_NAME 
			from PATCH_CO016_IN patchins
			where patchins.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');

	update CMS_STAGE_INSURANCE_POLICY inspol
	set (INSURER_NAME, BANK_CUST_ARRANGE_INS_IND, INSURANCE_TYPE, BUILDING_OCCUPATION) = 
		(select INSURER_NAME_CODE, BANK_CUST_ARRANGE_INS_IND, INSURANCE_TYPE_CODE, BUILDING_OCCUPATION_CODE
			from PATCH_CO016_IN patchins
			where patchins.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');

	update CMS_STAGE_INSURANCE_POLICY inspol
	set (EFFECTIVE_DATE, EXPIRY_DATE, INSURED_AMT, TYPE_OF_BUILDING) = 
		(select EFFECTIVE_DATE, EXPIRY_DATE, INSURED_AMT, TYPE_OF_BUILDING
			from PATCH_CO016_IN patchins
			where patchins.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');		

	update CMS_STAGE_INSURANCE_POLICY inspol
	set (WALL, ROOF, TYPE_OF_FLOOR, NUMBER_OF_STOREY) = 
		(select WALL, ROOF, TYPE_OF_FLOOR, NUMBER_OF_STOREY
			from PATCH_CO016_IN patchins
			where patchins.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
			and patchins.IS_VALID = 'Y')
	where exists (select 1 from PATCH_CO016_IN patchins1
					where patchins1.cms_stg_insr_id = inspol.INSURANCE_POLICY_ID
					and patchins1.IS_VALID = 'Y');	

	commit;

END@