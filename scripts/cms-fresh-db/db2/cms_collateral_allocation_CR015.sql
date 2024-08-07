----------- table for debugging ---------
--Drop table TEMP_COL_LMT_ALLOC_CALC@

CREATE TABLE TEMP_COL_LMT_ALLOC_CALC (
	COL_ID	BIGINT,
	LMT_ID	BIGINT,
	COL_VALUE	DECIMAL(24,6),
	APPORTION_EXP	DECIMAL(24,6),
	COL_ALLOC_AMT	DECIMAL(24,6),
	TOTAL_LMT_OUTSTANDING DECIMAL(24,6),
	LMT_OUTSTANDING	DECIMAL(24,6)
) IN CMS_BATCH INDEX IN CMS_BATCH_INDEX
@

-------- end table for debugging -----------


--DROP TABLE TEMP_FAC_SEC_ALLOC@

CREATE TABLE TEMP_FAC_SEC_ALLOC (
--ID 				INT,     -- for debug purpose
CHARGE_ID 		BIGINT, 
LMT_ID 			BIGINT, 
COL_ID 			BIGINT, 
ALLOC_AMT 		DECIMAL(24,6),
OMV_ALLOC_AMT 	DECIMAL(24,6),
FSV_ALLOC_AMT 	DECIMAL(24,6),
FAC_AMT 		DECIMAL(24,6), 
COL_AMT 		DECIMAL(24,6), 
OMV_AMT 		DECIMAL(24,6), 
FSV_AMT 		DECIMAL(24,6) 
--,SURPLUS      	DECIMAL(24,6)
--,LOG     		VARCHAR(2555)   -- for debug purpose
)in CMS_SMALL_DATA INDEX IN CMS_INDEX
@

CREATE INDEX TEMP_FAC_SEC_ALLOC_IDX1 ON TEMP_FAC_SEC_ALLOC
(LMT_ID ASC)@

CREATE INDEX TEMP_FAC_SEC_ALLOC_IDX2 ON TEMP_FAC_SEC_ALLOC
(CHARGE_ID ASC)@

CREATE INDEX TEMP_FAC_SEC_ALLOC_IDX3 ON TEMP_FAC_SEC_ALLOC
(COL_ID ASC)@

--DROP TABLE CMS_LIMIT_SEC_ALLOC
--@

--CREATE TABLE CMS_LIMIT_SEC_ALLOC (
--LMT_ID 			VARCHAR(43)
--)in CMS_SMALL_DATA INDEX IN CMS_INDEX
--@

--CREATE INDEX CMS_LIMIT_SEC_ALLOC_IDX1 ON CMS_LIMIT_SEC_ALLOC
--(LMT_ID ASC)
--@

--DROP TABLE CMS_PROCESS_COL_ALLOC@

CREATE TABLE CMS_PROCESS_COL_ALLOC (
COLL_ID 			BIGINT,
col_remain_omv			decimal(24,6),
col_remain_fsv			decimal(24,6),
ALLOC_TYPE 			VARCHAR(1)
)in CMS_SMALL_DATA INDEX IN CMS_INDEX
@

CREATE INDEX CMS_PROCESS_COL_ALLOC_IDX1 ON CMS_PROCESS_COL_ALLOC
(COLL_ID ASC)
@

--Drop table temp_fac_dtl@

create table temp_fac_dtl (
lmt_id		bigint,
process_outstanding_amt	decimal(24,6),
act_outstanding_amt	decimal(24,6),
allocated_amt decimal(24,6),
LMT_CRRNCY_ISO_CODE char(3)
) in CMS_SMALL_DATA INDEX IN CMS_INDEX
@

create index tmp_fac_dtl_idx1 on temp_fac_dtl (lmt_id )
@

create index temp_fac_dtl_idx2 on temp_fac_dtl (allocated_amt, act_outstanding_amt, lmt_id)
@

-----------------------------------
---Functions needed 
------------------------------------
--DROP FUNCTION calcApportionAmt@

CREATE FUNCTION calcApportionAmt(lmtAmt DECIMAL(24,6), colAmt DECIMAL(24,6), totalLmt DECIMAL(24,6)) RETURNS DECIMAL(24,6) LANGUAGE SQL
BEGIN ATOMIC
 
  DECLARE result DECIMAL(24,6) DEFAULT 0;
  
  IF totalLmt IS NOT NULL AND totalLmt <> 0  THEN
    SET result = (lmtAmt /totalLmt) * dec(colAmt,24,6);
  END IF;
   
  RETURN result;
END@

--DROP FUNCTION getLowestAmt@

CREATE FUNCTION getLowestAmt(amt1 DECIMAL(24,6), amt2 DECIMAL(24,6), amt3 DECIMAL(24,6)) RETURNS DECIMAL(24,6) LANGUAGE SQL
BEGIN ATOMIC
 
  DECLARE lowestAmt DECIMAL(24,6) DEFAULT 0;
  SET lowestAmt = amt1;
  
  IF amt2 IS NOT NULL AND amt2 <> 0 AND amt2 < lowestAmt THEN
    SET lowestAmt = amt2;
  END IF;
  
  IF amt3 IS NOT NULL AND amt3 <> 0 AND amt3 < lowestAmt THEN
    SET lowestAmt = amt3;  
  END IF;
  RETURN lowestAmt;
END@

-----------------------------------
---Sub Procedures needed 
------------------------------------

--DROP PROCEDURE PROC_CLEAR_PREV_ALLOC@

CREATE PROCEDURE PROC_CLEAR_PREV_ALLOC LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('PROC_CLEAR_PREV_ALLOC', 'ALOC', 1);	

  UPDATE CMS_LIMIT_SECURITY_MAP SET CMS_SEC_ALLOCATED_AMT = NULL WHERE CMS_SEC_ALLOCATED_AMT IS NOT NULL;
  commit;
  
  UPDATE SCI_LSP_APPR_LMTS SET CMS_ACTUAL_SEC_COVERAGE_AMT = NULL, CMS_OMV_SEC_COVERAGE_AMT = NULL, CMS_FSV_SEC_COVERAGE_AMT = NULL
  WHERE 
  CMS_ACTUAL_SEC_COVERAGE_AMT IS NOT NULL OR
  CMS_OMV_SEC_COVERAGE_AMT IS NOT NULL OR
  CMS_FSV_SEC_COVERAGE_AMT IS NOT NULL;
  commit;  
  
  update sci_lsp_sys_xref set cms_sec_coverage_amt = null where cms_sec_coverage_amt is not null; 
  commit;
  
	call util_truncate_table('cms_account_sec_map');
	  
  CALL SI_LOG_PROC_TIME('PROC_CLEAR_PREV_ALLOC', 'ALOC', 2);	
  commit;	
END@

--drop procedure proc_coll_alloc_specific_charge@

create procedure proc_coll_alloc_specific_charge language sql
begin
DECLARE LOWEST_SEC_VAL	DECIMAL(24,6);
	 
DECLARE PREV_CHARGE_AMT			DECIMAL(24,6);
DECLARE REMAIN_OMV			DECIMAL(24,6);
DECLARE REMAIN_FSV			DECIMAL(24,6);
DECLARE TOTAL_LMT_OUTSTANDING DECIMAL(24,6);
DECLARE APPORTIONMENT_EXP	DECIMAL(24,6);
DECLARE COL_AMT_FOR_ALLOC	DECIMAL(24,6);
DECLARE COL_AMT_FOR_ALLOC_OMV	DECIMAL(24,6);
DECLARE COL_AMT_FOR_ALLOC_FSV	DECIMAL(24,6);
DECLARE APPORTION_COL_VALUE	DECIMAL(24,6);
DECLARE APPORTION_COL_VALUE_OMV	DECIMAL(24,6);
DECLARE APPORTION_COL_VALUE_FSV	DECIMAL(24,6);

DECLARE v_no_data SMALLINT DEFAULT 0;
DECLARE is_npl_ind SMALLINT DEFAULT 0;

	CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 1);	
	
	-- loop for collateral and charge detail (higher charge ranking will be allocate first)
	FOR cur0 AS	c1 cursor with hold for
		  
		select s.cms_collateral_id,
			convert_amt(s.cmv, s.cmv_currency, 'MYR') omv, 
			convert_amt(s.FSV, s.FSV_currency, 'MYR') fsv,
			CONVERT_AMT( S.NET_REALIZABLE_VALUE, S.SCI_SECURITY_CURRENCY, 'MYR' ) RV,
			CONVERT_AMT( S.RESERVE_PRICE, S.SCI_SECURITY_CURRENCY, 'MYR' ) RP ,
			charge_detail_id, security_rank, charge_type, prior_charge_type,
				CONVERT_AMT( d.CHARGE_AMOUNT, d.CHARGE_CURRENCY_CODE, 'MYR' ) CHARGE_AMT, 
				CONVERT_AMT( d.prior_charge_amount, d.prior_charge_currency, 'MYR' ) prior_charge_amt 
		from cms_security s, cms_charge_detail d
		where (s.security_sub_type_id like 'PT%' or 
			s.security_sub_type_id in ('AB100', 'AB101', 'AB102', 'AB103', 'AB109', 'AB110' ,'AB111' ))
		and s.status <> 'DELETED'
		and s.cmv > 0
		and security_rank > 0
		and d.cms_collateral_id = s.cms_collateral_id
		and d.status = 'ACTIVE'
		order by security_rank, s.cms_collateral_id, charge_detail_id

	DO 	
		--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 2);				
		
		set v_no_data = (select count(*) from CMS_PROCESS_COL_ALLOC where COLL_ID = cur0.cms_collateral_id);
		
		
		-- get the remaining omv and fsv (due to allocation is not by col, it is by charge ranking)
		if v_no_data = 0 then
			SET REMAIN_OMV = cur0.OMV;
			SET REMAIN_FSV = cur0.FSV;
		else
			select col_remain_omv, col_remain_fsv into remain_omv, remain_fsv
			from CMS_PROCESS_COL_ALLOC
			where COLL_ID = cur0.cms_collateral_id;			
		end if;
		
		--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 3);
		
		-- get the total lmt oustanding based on the limits in the charge of the collateral
		select  dec( sum( inner_l.process_outstanding_amt ), 24, 6) into TOTAL_LMT_OUTSTANDING 
				from temp_fac_dtl inner_l, CMS_LIMIT_SECURITY_MAP inner_M, CMS_LIMIT_CHARGE_MAP inner_cm
				where  
				inner_M.CMS_LSP_APPR_LMTS_ID = inner_L.lmt_id
				AND inner_M.CMS_LSP_APPR_LMTS_ID = inner_CM.CMS_LSP_APPR_LMTS_ID 
				and inner_m.cms_collateral_id = inner_cm.cms_collateral_id
				and inner_cm.CHARGE_DETAIL_ID = cur0.charge_detail_id
				AND inner_M.UPDATE_STATUS_IND <> 'D'
				AND inner_CM.STATUS = 'ACTIVE';
							
		-- if the charge is not 1st charge, and the charge with other rank belongs to other bank (external)		
		if cur0.security_rank > 1 and prior_charge_type = 'E' then
			set remain_omv = remain_omv - prior_charge_amt;
			set remain_fsv = remain_fsv - prior_charge_amt;
		end if;
					
		--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 4);	
		
		IF REMAIN_OMV < 0 THEN
				SET REMAIN_OMV = 0;
		END IF;			
		
		IF REMAIN_FSV < 0 THEN
			SET REMAIN_FSV = 0;
		END IF;			
		
		IF REMAIN_OMV > cur0.CHARGE_AMT THEN
			SET COL_AMT_FOR_ALLOC = getLowestAmt(cur0.CHARGE_AMT, TOTAL_LMT_OUTSTANDING, cast(null as decimal));
		ELSE
			SET COL_AMT_FOR_ALLOC = getLowestAmt(REMAIN_OMV, TOTAL_LMT_OUTSTANDING , cast(null as decimal));
		END IF;
		
-- 		IF REMAIN_OMV > cur0.CHARGE_AMT THEN
-- 			SET COL_AMT_FOR_ALLOC_OMV = getLowestAmt(cur0.CHARGE_AMT, TOTAL_LMT_OUTSTANDING, cast(null as decimal));
-- 		ELSE
-- 			SET COL_AMT_FOR_ALLOC_OMV = getLowestAmt(REMAIN_OMV, TOTAL_LMT_OUTSTANDING , cast(null as decimal));
-- 		END IF;		
		SET COL_AMT_FOR_ALLOC_OMV = getLowestAmt(REMAIN_OMV, TOTAL_LMT_OUTSTANDING , cast(null as decimal));
		
-- 		IF REMAIN_FSV > cur0.CHARGE_AMT THEN
-- 			SET COL_AMT_FOR_ALLOC_FSV = getLowestAmt(cur0.CHARGE_AMT, TOTAL_LMT_OUTSTANDING, cast(null as decimal));
-- 		ELSE
-- 			SET COL_AMT_FOR_ALLOC_FSV = getLowestAmt(REMAIN_FSV, TOTAL_LMT_OUTSTANDING, cast(null as decimal));
-- 		END IF;
		SET COL_AMT_FOR_ALLOC_FSV = getLowestAmt(REMAIN_FSV, TOTAL_LMT_OUTSTANDING, cast(null as decimal));
				  	
		SET LOWEST_SEC_VAL = getLowestAmt( REMAIN_FSV, cur0.RV, cur0.RP  );					
		set Lowest_sec_val = getLowestAmt(lowest_sec_val, total_lmt_outstanding, cur0.CHARGE_AMT);
					
		--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 5);
		
		-- loop for limits belongs to the charge	
		for cur0_inner2 as
		
			select lmts.process_outstanding_amt CMS_OUTSTANDING_AMT, lsm.charge_id, lmts.lmt_id
			from cms_limit_security_map lsm, cms_limit_charge_map lcm, temp_fac_dtl lmts
			where lsm.cms_collateral_id = lcm.cms_collateral_id
			and lsm.cms_lsp_appr_lmts_id = lcm.cms_lsp_appr_lmts_id
			and lcm.charge_detail_id = cur0.charge_detail_id
			and lsm.update_status_ind <> 'D'
			and lcm.status = 'ACTIVE'
			and lcm.cms_lsp_appr_lmts_id = lmts.lmt_id
		do
		
			--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 6);
			
			IF TOTAL_LMT_OUTSTANDING <> 0 THEN
				SET APPORTIONMENT_EXP =  (cur0_inner2.CMS_OUTSTANDING_AMT/ TOTAL_LMT_OUTSTANDING) ;
			ELSE
				SET APPORTIONMENT_EXP = 0;
			END IF;		
			
			if COL_AMT_FOR_ALLOC >= TOTAL_LMT_OUTSTANDING then
				SET APPORTION_COL_VALUE = cur0_inner2.CMS_OUTSTANDING_AMT;
			else
				--SET APPORTION_COL_VALUE = ( cur0_inner2.CMS_OUTSTANDING_AMT * COL_AMT_FOR_ALLOC_OMV) / TOTAL_LMT_OUTSTANDING;
				SET APPORTION_COL_VALUE = APPORTIONMENT_EXP * COL_AMT_FOR_ALLOC;
			end if;														
			
			if COL_AMT_FOR_ALLOC_FSV >= TOTAL_LMT_OUTSTANDING then
				set APPORTION_COL_VALUE_FSV = cur0_inner2.CMS_OUTSTANDING_AMT;
			else
				--set APPORTION_COL_VALUE_FSV = ( cur0_inner2.CMS_OUTSTANDING_AMT * COL_AMT_FOR_ALLOC_FSV ) / TOTAL_LMT_OUTSTANDING;
				set APPORTION_COL_VALUE_FSV = APPORTIONMENT_EXP * COL_AMT_FOR_ALLOC_FSV;
			end if;			
			
			if COL_AMT_FOR_ALLOC_OMV >= TOTAL_LMT_OUTSTANDING then
				SET APPORTION_COL_VALUE_OMV = cur0_inner2.CMS_OUTSTANDING_AMT;
			else
				--SET APPORTION_COL_VALUE = ( cur0_inner2.CMS_OUTSTANDING_AMT * COL_AMT_FOR_ALLOC_OMV) / TOTAL_LMT_OUTSTANDING;
				SET APPORTION_COL_VALUE_OMV = APPORTIONMENT_EXP * COL_AMT_FOR_ALLOC_OMV;
			end if;			
			
			SET is_npl_ind = (SELECT COUNT(1) FROM SESSION.NPL_ACCOUNT WHERE LIMIT_ID = cur0_inner2.LMT_ID); 				
			
			if is_npl_ind is null or is_npl_ind = 0 then
			-- performing loan				
				--set APPORTION_COL_VALUE = APPORTION_COL_VALUE_OMV;					
			else
			-- non performing loan	
				if LOWEST_SEC_VAL >= TOTAL_LMT_OUTSTANDING then
					SET APPORTION_COL_VALUE = cur0_inner2.CMS_OUTSTANDING_AMT;	
				else
					--SET APPORTION_COL_VALUE = ( cur0_inner2.CMS_OUTSTANDING_AMT * LOWEST_SEC_VAL) / TOTAL_LMT_OUTSTANDING;
					set APPORTION_COL_VALUE = APPORTIONMENT_EXP * LOWEST_SEC_VAL;
				end if;				
			end if;

			UPDATE SCI_LSP_APPR_LMTS SET 
					CMS_ACTUAL_SEC_COVERAGE_AMT = COALESCE( CMS_ACTUAL_SEC_COVERAGE_AMT, 0 ) +  APPORTION_COL_VALUE , 
					CMS_OMV_SEC_COVERAGE_AMT = COALESCE( CMS_OMV_SEC_COVERAGE_AMT, 0 ) + APPORTION_COL_VALUE_OMV,
					CMS_FSV_SEC_COVERAGE_AMT = COALESCE( CMS_FSV_SEC_COVERAGE_AMT, 0 ) + APPORTION_COL_VALUE_FSV
				WHERE CMS_LSP_APPR_LMTS_ID = cur0_inner2.lmt_id;
			
			UPDATE CMS_LIMIT_SECURITY_MAP SET CMS_SEC_ALLOCATED_AMT = COALESCE( CMS_SEC_ALLOCATED_AMT, 0 ) + APPORTION_COL_VALUE
				WHERE CHARGE_ID = cur0_inner2.CHARGE_ID;
				
			if APPORTION_COL_VALUE > cur0_inner2.CMS_OUTSTANDING_AMT then
				update temp_fac_dtl 
				set process_outstanding_amt = 0,
				allocated_amt = coalesce(allocated_amt,0) + APPORTION_COL_VALUE
				where lmt_id = cur0_inner2.lmt_id;				
			else
				update temp_fac_dtl 
				set process_outstanding_amt = (process_outstanding_amt - APPORTION_COL_VALUE),
				allocated_amt = coalesce(allocated_amt,0) + APPORTION_COL_VALUE
				where lmt_id = cur0_inner2.lmt_id;
			end if;
						
			-- for debugging	
			insert into TEMP_COL_LMT_ALLOC_CALC 
				(col_id, lmt_id, APPORTION_EXP, COL_VALUE, COL_ALLOC_AMT, TOTAL_LMT_OUTSTANDING, LMT_OUTSTANDING)
			values
				(cur0.cms_collateral_id, cur0_inner2.lmt_id, APPORTIONMENT_EXP, COL_AMT_FOR_ALLOC, APPORTION_COL_VALUE, TOTAL_LMT_OUTSTANDING, cur0_inner2.CMS_OUTSTANDING_AMT);
			
			--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 7);							
		end for;				
		
		set remain_omv = remain_omv - cur0.CHARGE_AMT;
		set remain_fsv = remain_fsv - cur0.CHARGE_AMT;
		
		if v_no_data = 0 then
			INSERT INTO CMS_PROCESS_COL_ALLOC(COLL_ID,ALLOC_TYPE, col_remain_omv, col_remain_fsv) 
				VALUES(cur0.cms_collateral_id,'1', remain_omv, remain_fsv);		
		else
			update CMS_PROCESS_COL_ALLOC
			set (col_remain_omv, col_remain_fsv) = (remain_omv, remain_fsv)
			where coll_id = cur0.cms_collateral_id;
		end if;
					
		--CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 8);		
		commit;															 
		
	END FOR;	
		
	CALL SI_LOG_PROC_TIME('proc_coll_alloc_specific_charge', 'ALOC', 9);
	commit;
end
@


--drop procedure proc_account_alloc@

create procedure proc_account_alloc language sql
begin
Declare fac_outstanding_amt decimal(24,6) default 0;
Declare prev_lmt_id	bigint default 0;
Declare alloc_acct_sec_amt decimal(24,6);

	CALL SI_LOG_PROC_TIME('proc_account_alloc', 'ALOC', 1);		
	commit;
	
	-- get active limit security map to derive account security linkages
	for cur as c1 cursor with hold for
		select lsm.cms_lsp_appr_lmts_id, lsm.CMS_SEC_ALLOCATED_AMT, s.cms_collateral_id cms_collateral_id, s.security_sub_type_id
		from cms_limit_security_map lsm, cms_security s
		where lsm.cms_collateral_id = s.cms_collateral_id
		and lsm.update_status_ind <> 'D'
		and s.status <> 'DELETED'
		and lsm.CMS_SEC_ALLOCATED_AMT is not null
		order by lsm.cms_lsp_appr_lmts_id
	do
	
		if prev_lmt_id <> cur.cms_lsp_appr_lmts_id then
			set fac_outstanding_amt = 
				(select case when lmts.ACCOUNT_TYPE in ('O', 'D', 'T', 'F') then convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') * -1
							else convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') end
				from sci_lsp_appr_lmts lmts
				where lmts.cms_lsp_appr_lmts_id = cur.cms_lsp_appr_lmts_id);
		end if;
				
		-- retrieve account info based on the limit
		for cur_inner as 

			select 
				case when lsx.LSX_EXT_SYS_ACCT_TYPE in ('D') then convert_amt(lsx.cms_outstanding_amt, lsx.OUTSTANDING_AMT_CCY, 'MYR') * -1
					else convert_amt(lsx.cms_outstanding_amt, lsx.OUTSTANDING_AMT_CCY, 'MYR') end as cms_outstanding_amt,
				lsx.CMS_LSP_SYS_XREF_ID, lsx.LSX_EXT_SYS_ACCT_NUM, 
				lsx.LSX_EXT_SYS_ACCT_SEQ, lsx.LSX_EXT_SYS_ACCT_TYPE
			from sci_lsp_sys_xref lsx, sci_lsp_lmts_xref_map lxm
			where lxm.cms_lsp_appr_lmts_id = cur.cms_lsp_appr_lmts_id
			and lsx.cms_lsp_sys_xref_id = lxm.cms_lsp_sys_xref_id
			and lxm.update_status_ind <> 'D'
			and lsx.update_status_ind <> 'D'
			and (case when lsx.LSX_EXT_SYS_ACCT_TYPE = 'L' then lsx.cms_outstanding_amt 
					else lsx.cms_outstanding_amt * -1 end) > 0
		
		do
			-- for debugging purpose
-- 			insert into temp_col_lmt_alloc_calc
-- 			(col_id, lmt_id, col_value, total_lmt_outstanding, lmt_outstanding)
-- 			values
-- 			(cur_inner.cms_lsp_sys_xref_id, cur.cms_lsp_appr_lmts_id, cur.CMS_SEC_ALLOCATED_AMT, fac_outstanding_amt, cur_inner.cms_outstanding_amt);
			
			set alloc_acct_sec_amt = calcApportionAmt(cur_inner.cms_outstanding_amt, cur.CMS_SEC_ALLOCATED_AMT, fac_outstanding_amt);
			
			insert into cms_account_sec_map 
				(CMS_ACCOUNT_SEC_MAP_ID, ASM_EXT_SYS_ACCOUNT_NUM, ASM_EXT_SYS_ACCOUNT_TYPE, ASM_EXT_SYS_ACCOUNT_SEQ,
				CMS_LSP_SYS_XREF_ID, CMS_COLLATERAL_ID, CMS_LSP_APPR_LMTS_ID, last_allocation_date, allocated_amt,
				security_sub_type_id)
			values 
				(CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_ACCOUNT_SEC_MAP_SEQ), 2)) as BIGINT),
				cur_inner.LSX_EXT_SYS_ACCT_NUM, cur_inner.LSX_EXT_SYS_ACCT_TYPE, cur_inner.LSX_EXT_SYS_ACCT_SEQ,
				cur_inner.cms_lsp_sys_xref_id, cur.cms_collateral_id, cur.cms_lsp_appr_lmts_id, current timestamp,
				alloc_acct_sec_amt, cur.security_sub_type_id);
				
			-- set allocated col amt for the account
			update sci_lsp_sys_xref lsx
			set (cms_sec_coverage_amt, sec_coverage_amt_ccy, last_allocation_date) = 
			 	((COALESCE(cms_sec_coverage_amt,0) + alloc_acct_sec_amt) , 'MYR', current timestamp)
			where lsx.cms_lsp_sys_xref_id = cur_inner.cms_lsp_sys_xref_id;
							
 		end for;		
		
		set prev_lmt_id = cur.cms_lsp_appr_lmts_id;
		
		commit;
	end for;	
	CALL SI_LOG_PROC_TIME('proc_account_alloc', 'ALOC', 2);
	commit;
	
	-- set the total allocated collateral amt for the account
-- 	update sci_lsp_sys_xref lsx
-- 	set (cms_sec_coverage_amt, sec_coverage_amt_ccy, last_allocation_date) =
-- 		((select sum(allocated_amt) from cms_account_sec_map asm
-- 		where asm.cms_lsp_sys_xref_id = lsx.cms_lsp_sys_xref_id), 'MYR', current timestamp)
-- 	where exists (select 1 from cms_account_sec_map asm1
-- 		where asm1.cms_lsp_sys_xref_id = lsx.cms_lsp_sys_xref_id);
-- 		
-- 	CALL SI_LOG_PROC_TIME('proc_account_alloc', 'ALOC', 3);		
	commit;
end
@


--drop procedure proc_calc_inner_lmt_alloc@

create procedure proc_calc_inner_lmt_alloc language sql
begin
Declare prev_outer_lmt_id bigint default 0;
Declare total_inner_lmt_amt decimal(24,6);
Declare outer_lmt_alloc_amt decimal(24,6);
Declare outer_lmt_alloc_amt_omv decimal(24,6);
Declare outer_lmt_alloc_amt_fsv decimal(24,6);

	for cur as c1 cursor with hold for
		select lmts.cms_lsp_appr_lmts_id, 			
			(case when lmts.ACCOUNT_TYPE in ('O', 'D', 'T', 'F') then convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') * -1
				else convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') end) as cms_outstanding_amt, 
			LMT_OUTER_LMT_ID
		from sci_lsp_appr_lmts lmts
		where lmts.cms_limit_status <> 'DELETED'
		and LMT_OUTER_LMT_ID > 0
		and (case when lmts.account_type = 'L' then lmts.cms_outstanding_amt  
					else lmts.CMS_OUTSTANDING_AMT * -1 end) > 0
		order by LMT_OUTER_LMT_ID		
	do
		if prev_outer_lmt_id <> cur.LMT_OUTER_LMT_ID then
			set total_inner_lmt_amt = 
				(select sum(cms_outstanding_amt)
				from sci_lsp_appr_lmts lmts
				where lmts.lmt_outer_lmt_id = cur.LMT_OUTER_LMT_ID
				and lmts.cms_limit_status <> 'DELETED');
				
			select CMS_ACTUAL_SEC_COVERAGE_AMT, CMS_OMV_SEC_COVERAGE_AMT, CMS_FSV_SEC_COVERAGE_AMT
			into outer_lmt_alloc_amt, outer_lmt_alloc_amt_omv, outer_lmt_alloc_amt_fsv
			from sci_lsp_appr_lmts lmts
			where lmts.cms_lsp_appr_lmts_id = cur.lmt_outer_lmt_id;									
			
			if outer_lmt_alloc_amt is null 
			then 
				set outer_lmt_alloc_amt = 0 ;
			end if;				
		end if;
		
		update sci_lsp_appr_lmts lmts
		set CMS_ACTUAL_SEC_COVERAGE_AMT = calcApportionAmt(cur.cms_outstanding_amt, outer_lmt_alloc_amt, total_inner_lmt_amt),
			CMS_OMV_SEC_COVERAGE_AMT = calcApportionAmt(cur.cms_outstanding_amt, outer_lmt_alloc_amt_omv, total_inner_lmt_amt),
			CMS_FSV_SEC_COVERAGE_AMT = calcApportionAmt(cur.cms_outstanding_amt, outer_lmt_alloc_amt_fsv, total_inner_lmt_amt)
		where lmts.cms_lsp_appr_lmts_id = cur.cms_lsp_appr_lmts_id;
		
		set prev_outer_lmt_id = cur.LMT_OUTER_LMT_ID;
		
		commit;
		
	end for;
	commit;	
end
@

-----------------------------------
---Main Procedure
------------------------------------

--DROP PROCEDURE PROC_COLL_ALLOC_MAIN@

CREATE PROCEDURE PROC_COLL_ALLOC_MAIN LANGUAGE SQL
BEGIN
	 
DECLARE LOWEST_SEC_VAL	DECIMAL(24,6);

DECLARE TOTAL_LMT_OUTSTANDING DECIMAL(24,6);
DECLARE APPORTIONMENT_EXP	DECIMAL(24,6);
DECLARE COL_AMT_FOR_ALLOC	DECIMAL(24,6);
DECLARE COL_AMT_FOR_ALLOC_OMV	DECIMAL(24,6);
DECLARE COL_AMT_FOR_ALLOC_FSV	DECIMAL(24,6);
DECLARE APPORTION_COL_VALUE	DECIMAL(24,6);
DECLARE TOTAL_COL_VALUE	DECIMAL(24,6);
DECLARE COL_AMT_VALUE DECIMAL(24,6);

DECLARE v_no_data SMALLINT DEFAULT 0;
DECLARE is_npl_ind SMALLINT DEFAULT 0;

DECLARE NPL_LIMIT_ID		BIGINT;

DECLARE npl_cur CURSOR WITH HOLD FOR 
  		SELECT XM.CMS_LSP_APPR_LMTS_ID FROM SCI_LSP_LMTS_XREF_MAP XM, SCI_LSP_SYS_XREF X 
		WHERE 
		X.CMS_LSP_SYS_XREF_ID = XM.CMS_LSP_SYS_XREF_ID 
			--	AND XM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID 
			AND XM.CMS_STATUS = 'ACTIVE' 
			AND X.ACCT_DELQ_IND = 'Y';
			
DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET v_no_data = 1;
		
DECLARE GLOBAL TEMPORARY TABLE SESSION.NPL_ACCOUNT(LIMIT_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		 
	 	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 1);	
	
	-- set Facility NPL record into session table
	OPEN npl_cur;
  
	FETCH npl_cur INTO NPL_LIMIT_ID;
	WHILE (v_no_data = 0) DO
		INSERT INTO SESSION.NPL_ACCOUNT( LIMIT_ID ) VALUES( NPL_LIMIT_ID );	

	FETCH npl_cur INTO NPL_LIMIT_ID;
	END WHILE;
	CLOSE npl_cur;
	
	create index session.npl_idx1 on session.npl_account ( limit_id) allow reverse scans;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 2);	

	-- truncate table temp_fac_dtl
	call util_truncate_table('temp_fac_dtl');
	
	-- insert active facility records into temp_fac_dtl table (i.e. facility not rejected / cancelled)
	insert into temp_fac_dtl (lmt_id, process_outstanding_amt, act_outstanding_amt, lmt_crrncy_iso_code)
	select LMTS.cms_lsp_appr_lmts_id, 
		case when lmts.ACCOUNT_TYPE in ('O', 'D', 'T', 'F') then convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') * -1
			else convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') end, 
		case when lmts.ACCOUNT_TYPE in ('O', 'D', 'T', 'F') then convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') * -1
			else convert_amt(cms_outstanding_amt,lmt_crrncy_iso_code, 'MYR') end, 
		lmt_crrncy_iso_code
	from sci_lsp_appr_lmts lmts left outer join cms_facility_master fm
		on lmts.cms_lsp_appr_lmts_id = fm.cms_lsp_appr_lmts_id 
		left outer join cms_fac_general gen on fm.ID = gen.CMS_FAC_MASTER_ID and gen.FAC_STATUS_CODE_VALUE not in ('C', 'R')
	where (LMT_OUTER_LMT_ID = 0 or LMT_OUTER_LMT_ID is null)
	and cms_limit_status <> 'DELETED'
	and (case when lmts.account_type = 'L' then lmts.cms_outstanding_amt  
					else lmts.CMS_OUTSTANDING_AMT * -1 end) > 0;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 3);	
	
	commit;
		
	call si_runstats('temp_fac_dtl');
	
	call util_truncate_table('CMS_PROCESS_COL_ALLOC');
	
	commit;

	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 4);	
	-- Priority 1:  Property / Asset Based with multiple Charges or specific charge
	call proc_coll_alloc_specific_charge();

	call util_truncate_table('TEMP_FAC_SEC_ALLOC');
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 5);	
	
	-- Priority 2:  Pro-rata option for remaining of the collaterals			
	FOR cur2 AS	 c2 cursor with hold for	
		  
		  -- Collateral that is not belongs to priority 1 set (general charge or not AB and PT)
		select s.cms_collateral_id,
					convert_amt(s.cmv, s.cmv_currency, 'MYR') omv, 
					convert_amt(s.FSV, s.FSV_currency, 'MYR') fsv,
					CONVERT_AMT( S.NET_REALIZABLE_VALUE, S.SCI_SECURITY_CURRENCY, 'MYR' ) RV,
					CONVERT_AMT( S.RESERVE_PRICE, S.SCI_SECURITY_CURRENCY, 'MYR' ) RP 
		from cms_security s
		where security_sub_type_id not in ('AB100', 'AB101', 'AB102', 'AB103', 'AB109', 'AB110' ,'AB111', 'GT408')
		and security_sub_type_id not like 'PT%'
		and s.STATUS <> 'DELETED'
		and s.cmv > 0
		
	DO 	
		--CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 51);	
		-- get the sum fac o/s of the collateral		
		set TOTAL_LMT_OUTSTANDING = (select sum(act_outstanding_amt)
									from cms_limit_security_map lsm, temp_fac_dtl fac
									where lsm.cms_collateral_id = cur2.cms_collateral_id
									and lsm.update_status_ind <> 'D'
									and lsm.cms_lsp_appr_lmts_id = fac.lmt_id);
									
		for cur2_inner0 as 
			select fac.act_outstanding_amt CMS_OUTSTANDING_AMT, lsm.charge_id, fac.lmt_id
			from cms_limit_security_map lsm, temp_fac_dtl fac
			where lsm.cms_collateral_id = cur2.cms_collateral_id
			and lsm.update_status_ind <> 'D'
			and lsm.cms_lsp_appr_lmts_id = fac.lmt_id
			 
		do
			--CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 52);	
			SET is_npl_ind = (SELECT COUNT(1) FROM SESSION.NPL_ACCOUNT WHERE LIMIT_ID = cur2_inner0.LMT_ID); 
			
-- 			IF TOTAL_LMT_OUTSTANDING <> 0 THEN
-- 				SET APPORTIONMENT_EXP = ( dec(cur2_inner0.CMS_OUTSTANDING_AMT,20,2)/ dec(TOTAL_LMT_OUTSTANDING,20,2)  );
-- 			ELSE
-- 				SET APPORTIONMENT_EXP = 0;
-- 			END IF;				
					
			if TOTAL_LMT_OUTSTANDING = 0 then
				set COL_AMT_FOR_ALLOC_OMV = 0;
				set COL_AMT_FOR_ALLOC_FSV = 0;
			else
				set COL_AMT_FOR_ALLOC_OMV = (cur2_inner0.CMS_OUTSTANDING_AMT * cur2.omv ) / TOTAL_LMT_OUTSTANDING;
				set COL_AMT_FOR_ALLOC_FSV = ( cur2_inner0.CMS_OUTSTANDING_AMT * cur2.fsv ) / TOTAL_LMT_OUTSTANDING;
			end if;
			
			-- performing loan
			IF is_npl_ind is NULL OR is_npl_ind = 0 THEN	 
				set COL_AMT_FOR_ALLOC = COL_AMT_FOR_ALLOC_OMV;	
				SET COL_AMT_VALUE = cur2.omv;
			else
			-- non performing loan
				SET LOWEST_SEC_VAL = getLowestAmt( cur2.FSV, cur2.RV, cur2.RP );   	   
				SET COL_AMT_VALUE = LOWEST_SEC_VAL;
				
				if TOTAL_LMT_OUTSTANDING = 0 then
					set COL_AMT_FOR_ALLOC = 0;
				else
					set COL_AMT_FOR_ALLOC = (cur2_inner0.CMS_OUTSTANDING_AMT * LOWEST_SEC_VAL ) / TOTAL_LMT_OUTSTANDING;
				end if;								
				
			end if;
			
			INSERT INTO TEMP_FAC_SEC_ALLOC( CHARGE_ID, LMT_ID, COL_ID, FAC_AMT, COL_AMT, OMV_AMT, FSV_AMT,
				ALLOC_AMT, OMV_ALLOC_AMT, FSV_ALLOC_AMT )
					VALUES
					( cur2_inner0.CHARGE_ID, cur2_inner0.LMT_ID, cur2.cms_collateral_id, 
					cur2_inner0.CMS_OUTSTANDING_AMT, COL_AMT_VALUE, cur2.omv, cur2.fsv, 
					COL_AMT_FOR_ALLOC,  
					COL_AMT_FOR_ALLOC_OMV,
					COL_AMT_FOR_ALLOC_FSV);
																	
			update temp_fac_dtl
			set allocated_amt = coalesce(allocated_amt,0) + COL_AMT_FOR_ALLOC
			where lmt_id = cur2_inner0.LMT_ID;			
			
-- 				insert into TEMP_COL_LMT_ALLOC_CALC 
-- 				values
-- 					(cur2.cms_collateral_id, cur2_inner0.LMT_ID, APPORTIONMENT_EXP, APPORTIONMENT_EXP * dec(cur2.omv, 24, 6), TOTAL_LMT_OUTSTANDING, cur2_inner0.CMS_OUTSTANDING_AMT);
			
		
			--CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 53);	

			INSERT INTO CMS_PROCESS_COL_ALLOC(COLL_ID,ALLOC_TYPE) VALUES(cur2.cms_collateral_id,'2');	
		end for;		
		
		commit;
	END FOR;		
		
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 6);	
	commit;
	
	-- retrieve records from temp_fac_dtl table which allocated_amt > actual_outstanding_amt		
	for cur3 as c3 cursor with hold for	
		select lmt_id, process_outstanding_amt
		from temp_fac_dtl 
		where allocated_amt > ACT_OUTSTANDING_AMT
		
	do
		SET TOTAL_COL_VALUE = 
			(select sum(ALLOC_AMT) 
			from TEMP_FAC_SEC_ALLOC f  
			where f.LMT_ID = cur3.lmt_id);
		
		-- retrieve lmt sec linkage dtl for 2nd round of allocation, based on fac o/s
		for cur3_inner as
			select charge_id, col_id, col_amt, alloc_amt
			from TEMP_FAC_SEC_ALLOC
			where lmt_id = cur3.lmt_id
			
		do													
			-- recalculate the allocated col value for the facility based on col propotionate cap at fac o/s
			set APPORTION_COL_VALUE = getLowestAmt(col_amt, (alloc_amt *  process_outstanding_amt)/ TOTAL_COL_VALUE, cast(null as decimal));
			
			update temp_fac_sec_alloc
			set alloc_amt = APPORTION_COL_VALUE
			where charge_id = cur3_inner.charge_id;
					
			
		end for;
		commit;
		
	end for;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 7);	
	commit;
		
	-- update allocated col value into cms_limit_security_map
	update cms_limit_security_map lsm
	set CMS_SEC_ALLOCATED_AMT = (select alloc_amt from temp_fac_sec_alloc f 
					where f.charge_id = lsm.charge_id)
	where exists (select 1 from temp_fac_sec_alloc f1 where f1.charge_id = lsm.charge_id);

	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 8);												 
	commit;	
		
	-- update allocated col value into sci_lsp_appr_lmts
	update sci_lsp_appr_lmts
	set CMS_ACTUAL_SEC_COVERAGE_AMT = COALESCE( CMS_ACTUAL_SEC_COVERAGE_AMT, 0 ) + 
			(select sum(alloc_amt) from temp_fac_sec_alloc where lmt_id = cms_lsp_appr_lmts_id),
		CMS_OMV_SEC_COVERAGE_AMT = COALESCE( CMS_OMV_SEC_COVERAGE_AMT, 0 ) + 
			(select sum(OMV_ALLOC_AMT) from temp_fac_sec_alloc where lmt_id = cms_lsp_appr_lmts_id),
		CMS_FSV_SEC_COVERAGE_AMT = COALESCE( CMS_FSV_SEC_COVERAGE_AMT, 0 ) +
			(select sum(FSV_ALLOC_AMT) from temp_fac_sec_alloc where lmt_id = cms_lsp_appr_lmts_id)		
	where exists (select 1
		from temp_fac_sec_alloc 
		where lmt_id = cms_lsp_appr_lmts_id);	
				
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 9);		
	commit;
	
	-- inner facility allocation
	call proc_calc_inner_lmt_alloc;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 10);			
	
	-- account security allocation
	call proc_account_alloc;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_MAIN', 'ALOC', 11);		
	COMMIT;
	
END@
			

--DROP PROCEDURE PROC_COLL_ALLOC_ALL@

CREATE PROCEDURE PROC_COLL_ALLOC_ALL
	LANGUAGE SQL
BEGIN 

 	-- for debugging
 	call util_truncate_table('TEMP_COL_LMT_ALLOC_CALC');
 	-- end debugging
 	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_ALL', 'ALOC', 1);
	CALL PROC_CLEAR_PREV_ALLOC;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_ALL', 'ALOC', 2);
	CALL PROC_COLL_ALLOC_MAIN;
	
	CALL SI_LOG_PROC_TIME('PROC_COLL_ALLOC_ALL', 'ALOC', 3);
	
END@

