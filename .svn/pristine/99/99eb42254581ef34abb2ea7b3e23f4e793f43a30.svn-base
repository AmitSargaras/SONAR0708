------------------------------------------------------------------------------------------------------------------
-- Security Coverage Procedures
-- Desc : Security Allocation 
-- Date : 24/04/2007
-- Updated : 27 June 2007
--------------------------------------------
-- 1. seccoverage_main
-- 2. calFacSecCoverage
-- 3. getSecIdForSecCov
-- 4. calAASecCoverage
-- 5. clearPrevRes
-- 6. persistLmtSecCoverage
-- 7. INIT_TEMPLMT_LIST
-- 8. CLOSE_TEMPLMT_LIST
-- 9. INIT_TEMPLMT_SECCOV
-- 10. CLOSE_TEMPLMT_SECCOV
-- 11. INIT_TEMPLMT_AA
-- 12. CLOSE_TEMPLMT_AA

-- Security Coverage Functions:
--------------------------------------------
-- 1. getInitFsvAmount
-- 2. getPriorChargeAmt
-- 3. getDerivedLmtAmt
-- 4. getLoanType
-- 5. getReservePrice
-- 6. convertToBase
------------------------------------------------------------------------------------------------------------------

-- DROP FUNCTION getInitFsvAmount!
-- DROP FUNCTION getPriorChargeAmt!
-- DROP FUNCTION getDerivedLmtAmt!
-- DROP FUNCTION getLoanType!
-- DROP FUNCTION getReservePrice!
-- DROP FUNCTION getAccountType!
-- DROP FUNCTION convertToBase!
-- DROP PROCEDURE INIT_TEMPLMT_LIST!
-- DROP PROCEDURE INIT_TEMPLMT_SECCOV!
-- DROP PROCEDURE INIT_TEMPLMT_AA!
-- DROP PROCEDURE persistLmtSecCoverage!
-- DROP PROCEDURE CALFACSECCOVERAGE!
-- DROP PROCEDURE clearPrevRes!
-- DROP PROCEDURE getSecIdForSecCov!
-- DROP PROCEDURE calAASecCoverage!
-- DROP PROCEDURE CLOSE_TEMPLMT_LIST!
-- DROP PROCEDURE CLOSE_TEMPLMT_SECCOV!
-- DROP PROCEDURE CLOSE_TEMPLMT_AA!
-- DROP PROCEDURE seccoverage_main!

CREATE FUNCTION convertToBase(in_amt DECIMAL(20,2), in_currency_code CHAR(3)) RETURNS DECIMAL(20,2) LANGUAGE SQL
BEGIN ATOMIC
  DECLARE v_base_currency_code CHAR(3);
  DECLARE v_ret_amt DECIMAL(20,2) DEFAULT 0;
  DECLARE v_convert_rate DECIMAL(13, 6);
   
  SET v_base_currency_code = 'MYR';
  SET v_convert_rate = 1;
  SET v_ret_amt = 0;
  IF in_currency_code = v_base_currency_code THEN
    RETURN in_amt;
  END IF;
  IF (in_amt IS NOT NULL AND in_currency_code IS NOT NULL) THEN
    FOR v1 AS SELECT BUY_RATE FROM CMS_FOREX WHERE BUY_CURRENCY = in_currency_code AND SELL_CURRENCY = v_base_currency_code
    DO
      SET v_convert_rate = v1.BUY_RATE;
      SET v_ret_amt = in_amt * v_convert_rate;
    END FOR; 
  END IF;
  RETURN v_ret_amt;
END!


CREATE FUNCTION getInitFsvAmount(p_has_npl SMALLINT, p_sec_id BIGINT, p_sectype VARCHAR(40), p_secSubtype VARCHAR(40), p_cmv DECIMAL(20,2), p_cmv_curr CHAR(3),
                                 p_fsv DECIMAL(20,2),p_fsv_curr CHAR(3), p_reserve_prc DECIMAL(20,2)) RETURNS DECIMAL(30,2) LANGUAGE SQL 
BEGIN ATOMIC
  DECLARE v_ret_amt DECIMAL(20,2) DEFAULT 0;
  DECLARE v1 DECIMAL(20,2) DEFAULT 0;
  DECLARE v2 DECIMAL(20,2) DEFAULT 0;
  DECLARE v3 DECIMAL(20,2) DEFAULT 0;
  DECLARE v_count_col INT DEFAULT 0;
  DECLARE v_cmv_sum DECIMAL(20,2) DEFAULT 0;
  DECLARE v_fsv_sum DECIMAL(20,2) DEFAULT 0;
  

  SET v1 = convertToBase(COALESCE(p_cmv, 0), p_cmv_curr);
  SET v2 = convertToBase(COALESCE(p_fsv, 0), p_fsv_curr);
  -- already in base currency
  SET v3 = COALESCE(p_reserve_prc, 0);
 
  IF (p_sectype = 'MS') THEN
    FOR cur1 AS SELECT S2.CMS_COLLATERAL_ID, S2.CMV, S2.CMV_CURRENCY, S2.FSV, S2.FSV_CURRENCY FROM CMS_SECURITY S2 WHERE S2.CMS_COLLATERAL_ID IN (SELECT SS.CMS_COLLATERAL_ID FROM CMS_SECURITY_SOURCE SS WHERE SS.STATUS = 'ACTIVE' AND EXISTS (SELECT SS2.SOURCE_SECURITY_ID FROM CMS_SECURITY_SOURCE SS2 WHERE SS2.CMS_COLLATERAL_ID = p_sec_id AND SS2.SOURCE_ID = SS.SOURCE_ID))
    DO
      SET v_count_col = v_count_col + 1;
      SET v_cmv_sum = v_cmv_sum + convertToBase(cur1.CMV, cur1.CMV_CURRENCY);
      SET v_fsv_sum = v_fsv_sum + convertToBase(cur1.FSV, cur1.FSV_CURRENCY);		 	
    END FOR; 	   	
  END IF;

  -- if the marketable security is shared within a group and the subtype is main index local, we will set cmv and fsv as the sum
  -- if the marketable security is shared within a group and the sebtype is others, we will set cmv and fsv to 0 to avoid dup calculation 
  IF v_count_col > 1 THEN
    IF p_secSubtype = 'MS600' THEN	
      SET v1 = v_cmv_sum;
      SET v2 = v_fsv_sum;
    ELSE
      SET v1 = 0;
      SET v2 = 0;	
    END IF;
  END IF; 	  
		
  IF p_has_npl = 1 THEN
    IF p_reserve_prc IS NOT NULL THEN 
      IF v2 >= v3 AND V3 >= 0 THEN
        SET v_ret_amt = v3;     
      ELSE
        SET v_ret_amt = v2;
      END IF;
    ELSE	
      SET v_ret_amt = v2; 
    END IF; 
  ELSE
    SET v_ret_amt = v1;
  END IF; 
  RETURN v_ret_amt;
END!


CREATE FUNCTION getPriorChargeAmt(p_pr_charge_amt DECIMAL(20,2), p_pr_charge_cc CHAR(3)) RETURNS DECIMAL(20,2) LANGUAGE SQL
BEGIN ATOMIC
  RETURN 0;
END!


-- based on the account type, if it is term loan fully drawdown, return 1, else return 2
CREATE FUNCTION getLoanType(p_acct_type VARCHAR(1), p_lmt_amt DECIMAL(20,2), p_activated_amt DECIMAL(20,2), p_drawing_amt DECIMAL(20,2), p_outstd_amt DECIMAL(20,2)) RETURNS SMALLINT LANGUAGE SQL
BEGIN ATOMIC
  DECLARE v_ret_type SMALLINT DEFAULT 2;
  
  IF (p_acct_type = 'L') THEN
    IF p_lmt_amt = p_drawing_amt THEN
      SET v_ret_type = 1;
    ELSE
      SET v_ret_type = 2; 
    END IF;
  ELSE
    SET v_ret_type = 2;
  END IF;
  RETURN v_ret_type;
END!


CREATE FUNCTION getDerivedLmtAmt(p_acct_type VARCHAR(1), p_lmt_amt DECIMAL(20,2), p_activated_amt DECIMAL(20,2), p_drawing_amt DECIMAL(20,2), p_outstd_amt DECIMAL(20,2), p_lmt_cc CHAR(3)) RETURNS DECIMAL(20,2) LANGUAGE SQL
BEGIN ATOMIC
  DECLARE v_loan_type SMALLINT;
  DECLARE v_ret_amt DECIMAL(20,2);
  SET v_loan_type = getLoanType(p_acct_type, p_lmt_amt, p_activated_amt, p_drawing_amt, p_outstd_amt);
  IF v_loan_type = 1 THEN
    SET v_ret_amt = p_outstd_amt;
  ELSE
    SET v_ret_amt = p_lmt_amt;  
  END IF;
  RETURN convertToBase(COALESCE(v_ret_amt, 0), p_lmt_cc);
END!


CREATE FUNCTION getReservePrice(p_col_id BIGINT) RETURNS DECIMAL(20,2) LANGUAGE SQL
BEGIN ATOMIC
  DECLARE v_ret_price DECIMAL(20,2); 
  FOR cur1 AS SELECT V1.VALUATION_CURRENCY, V1.RESERVE_PRICE FROM CMS_VALUATION V1 WHERE V1.CMS_COLLATERAL_ID = p_col_id AND V1.SOURCE_TYPE = 'M' ORDER BY V1.VALUATION_DATE DESC, V1.VALUATION_ID DESC FETCH FIRST 1 ROWS ONLY
  DO
    IF cur1.RESERVE_PRICE IS NOT NULL THEN	
      SET v_ret_price = convertToBase(cur1.RESERVE_PRICE, cur1.VALUATION_CURRENCY);
    END IF;
  END FOR;
  RETURN v_ret_price; 
END!

CREATE FUNCTION getAccountType(p_lmt_id BIGINT) RETURNS VARCHAR(1) LANGUAGE SQL
BEGIN ATOMIC
  DECLARE v_acct_type VARCHAR(1) DEFAULT '';   
	
  --1 limit can have multiple account, account type will be the same             
  FOR cur1 AS SELECT ACCT.LSX_EXT_SYS_ACCT_TYPE FROM SCI_LSP_SYS_XREF ACCT, SCI_LSP_LMTS_XREF_MAP ACCTMAP
				WHERE 
				ACCT.CMS_LSP_SYS_XREF_ID = ACCTMAP.CMS_LSP_SYS_XREF_ID AND
				ACCTMAP.CMS_STATUS = 'ACTIVE' AND
				ACCT.ACCT_STATUS = 'A' AND
				ACCTMAP.CMS_LSP_APPR_LMTS_ID = p_lmt_id
				FETCH FIRST 1 ROWS ONLY
  DO
    IF cur1.LSX_EXT_SYS_ACCT_TYPE IS NOT NULL THEN	
      SET v_acct_type = cur1.LSX_EXT_SYS_ACCT_TYPE;
    END IF;
  END FOR;
  RETURN v_acct_type; 
END!

-- clear the previous calculation results
CREATE PROCEDURE clearPrevRes LANGUAGE SQL
BEGIN
  UPDATE CMS_SECURITY SET FSV_BALANCE = NULL , FSV_BALANCE_CCY = NULL, GEN_CHARGE_SURPLUS = 0;
  commit;
  
  UPDATE CMS_STAGE_SECURITY SET FSV_BALANCE = NULL , FSV_BALANCE_CCY = NULL, GEN_CHARGE_SURPLUS = 0;
  commit;
  
  UPDATE SCI_LSP_APPR_LMTS SET CMS_ACT_SEC_COVERAGE = NULL, CMS_CR125_DERIVE_ACTVD_LMT_AMT = 0;
  commit;
  
  UPDATE SCI_LSP_CO_BORROW_LMT SET CMS_ACT_SEC_COVERAGE = NULL, CMS_CR125_DERIVE_ACTVD_LMT_AMT = 0;
  commit;
  
  UPDATE STAGE_LIMIT SET CMS_ACT_SEC_COVERAGE = NULL, CMS_CR125_DERIVE_ACTVD_LMT_AMT = 0;
  commit;
  
  UPDATE SCI_LSP_LMT_PROFILE SET CMS_ACT_SEC_COVERAGE = NULL, CMS_CB_ACT_SEC_COVERAGE = NULL;
  commit;
  
  UPDATE STAGE_LIMIT_PROFILE SET CMS_ACT_SEC_COVERAGE = NULL, CMS_CB_ACT_SEC_COVERAGE = NULL;
  COMMIT;
END!


CREATE PROCEDURE INIT_TEMPLMT_LIST()
SPECIFIC INIT_TEMPLMT_LIST
BEGIN
    DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_list(CMS_LSP_APPR_LMTS_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
END!

CREATE PROCEDURE CLOSE_TEMPLMT_LIST()
SPECIFIC CLOSE_TEMPLMT_LIST
BEGIN
    DROP TABLE SESSION.lmt_list;
END!

CREATE PROCEDURE INIT_TEMPLMT_SECCOV()
SPECIFIC INIT_TEMPLMT_SECCOV
BEGIN
    DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_seccov(CMS_LSP_APPR_LMTS_ID BIGINT, DERIVE_LMT_AMT DECIMAL(20,2), LMT_COV DOUBLE) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
END!

CREATE PROCEDURE CLOSE_TEMPLMT_SECCOV()
SPECIFIC CLOSE_TEMPLMT_SECCOV
BEGIN
    DROP TABLE SESSION.lmt_seccov;
END!

CREATE PROCEDURE INIT_TEMPLMT_AA()
SPECIFIC INIT_TEMPLMT_AA
BEGIN
  DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_aa(CMS_LSP_APPR_LMTS_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
END!

CREATE PROCEDURE CLOSE_TEMPLMT_AA()
SPECIFIC CLOSE_TEMPLMT_AA
BEGIN
    DROP TABLE SESSION.lmt_aa;
END!

CALL INIT_TEMPLMT_LIST!
CALL INIT_TEMPLMT_SECCOV!
CALL INIT_TEMPLMT_AA!


CREATE PROCEDURE persistLmtSecCoverage LANGUAGE SQL
BEGIN
  DECLARE v_lmt_id BIGINT;
  DECLARE v_derive_lmt_amt DECIMAL(20,2);
  DECLARE v_lmt_cov DOUBLE;
  DECLARE v_no_data SMALLINT DEFAULT 0;
  DECLARE cur CURSOR FOR SELECT CMS_LSP_APPR_LMTS_ID, DERIVE_LMT_AMT, LMT_COV FROM SESSION.lmt_seccov;
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_no_data = 1;
  OPEN cur;
  FETCH cur INTO v_lmt_id, v_derive_lmt_amt, v_lmt_cov; 
  WHILE (v_no_data = 0) DO
    UPDATE SCI_LSP_APPR_LMTS SET CMS_ACT_SEC_COVERAGE = COALESCE(CMS_ACT_SEC_COVERAGE, 0) + v_lmt_cov, CMS_CR125_DERIVE_ACTVD_LMT_AMT = v_derive_lmt_amt WHERE CMS_LSP_APPR_LMTS_ID = v_lmt_id;
    SET v_no_data = 0;
    FETCH cur INTO v_lmt_id, v_derive_lmt_amt, v_lmt_cov; 
  END WHILE;
  CLOSE cur;
END!


CREATE PROCEDURE calFacSecCoverage(IN p_cur_sec_id BIGINT) LANGUAGE SQL
BEGIN
  DECLARE v_sql_coverage VARCHAR(2500);
  DECLARE v_sql_checknpl VARCHAR(2000);
  DECLARE v_sql_coverage_select VARCHAR(2000);
  DECLARE v_sql_coverage_cond VARCHAR(2000);
  DECLARE v_sql_coverage_acct_exists VARCHAR(2000);
  DECLARE v_sql_coverage_orderby VARCHAR(2000);
  
  DECLARE v_sec_id  BIGINT;
  DECLARE v_sectype VARCHAR(40);
  DECLARE v_secSubtype VARCHAR(40);
  DECLARE v_cmv DECIMAL(20,2);
  DECLARE v_cmv_curr CHAR(3);
  DECLARE v_fsv DECIMAL(20,2);
  DECLARE v_fsv_curr CHAR(3);
  DECLARE v_reserve_prc DECIMAL(20,2);
  DECLARE v_prev_charge_id  BIGINT;
  DECLARE v_cur_charge_id  BIGINT;
  DECLARE v_charge_type CHAR(1);
  DECLARE v_sec_rank  SMALLINT;
  DECLARE v_pr_charge_amt  DECIMAL(20,2);
  DECLARE v_pr_charge_cc CHAR(3);
  DECLARE v_charge_amt DECIMAL(20,2);
  DECLARE v_charge_cc CHAR(3);
  DECLARE v_lmt_prod_tp VARCHAR(40);
  DECLARE v_lmt_id  VARCHAR(20);
  DECLARE v_lmt_amt  DECIMAL(20,2); 
  DECLARE v_activated_amt DECIMAL(20,2);
  DECLARE v_drawing_amt DECIMAL(20,2);
  DECLARE v_outstd_amt DECIMAL(20,2);
  DECLARE v_act_sec_cov DOUBLE;
  DECLARE v_lmt_cc  CHAR(3);
  DECLARE v_prev_apprlmt_id BIGINT;
  DECLARE v_cur_apprlmt_id BIGINT;
  DECLARE v_acct_status VARCHAR(10);
  DECLARE v_acct_type VARCHAR(1);
  
  DECLARE v_has_gencharge SMALLINT DEFAULT 0;
  DECLARE v_has_npl SMALLINT DEFAULT 0;
  DECLARE v_fsv_bal DECIMAL(20,2) DEFAULT 0;
  DECLARE v_tmp_cnt INT;
  DECLARE v_derive_lmt_amt DECIMAL(20,2);  
  DECLARE v_prev_lmt_cov DOUBLE;
  DECLARE v_charge_std DECIMAL(20,2);
  DECLARE v_more_to_cover DECIMAL(20,2);
  DECLARE v_no_data SMALLINT DEFAULT 0;
  DECLARE v_stmt_coverage STATEMENT;
  DECLARE v_stmt_checknpl STATEMENT;
  
  DECLARE npl_cur CURSOR WITH HOLD FOR 
  		SELECT ACCT.ACCT_DELQ_IND 
        FROM SCI_LSP_SYS_XREF ACCT, SCI_LSP_LMTS_XREF_MAP ACCTMAP   
        WHERE ACCT.CMS_LSP_SYS_XREF_ID = ACCTMAP.CMS_LSP_SYS_XREF_ID 
        AND ACCTMAP.CMS_STATUS = 'ACTIVE' 
        AND ACCTMAP.CMS_LSP_APPR_LMTS_ID 
        	IN (SELECT CMS_LSP_APPR_LMTS_ID FROM SESSION.lmt_list);
                             
  DECLARE cov_cur CURSOR WITH HOLD FOR v_stmt_coverage;
  

  
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_no_data = 1;

  -- DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_seccov(CMS_LSP_APPR_LMTS_ID BIGINT, DERIVE_LMT_AMT DECIMAL(20,2), LMT_COV DOUBLE) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

  SET v_sql_coverage_select = 
					    'SELECT SEC.CMS_COLLATERAL_ID, ' ||
						'SEC.SECURITY_SUB_TYPE_ID, ' || 
						'SEC.SCI_SECURITY_TYPE_VALUE, ' ||
                        'SEC.CMV, ' ||
                        'SEC.CMV_CURRENCY, ' ||
                        'SEC.FSV, ' ||
                        'SEC.FSV_CURRENCY, ' ||
                        'getReservePrice(SEC.CMS_COLLATERAL_ID), ' ||   
                        'CHARGE.CHARGE_DETAIL_ID, ' ||
                        'CHARGE.CHARGE_TYPE, ' ||
                        'CHARGE.SECURITY_RANK, ' ||
                        'CHARGE.PRIOR_CHARGE_AMOUNT, ' ||
                        'CHARGE.PRIOR_CHARGE_CURRENCY, ' ||
                        'convertToBase(CHARGE.CHARGE_AMOUNT, CHARGE.CHARGE_CURRENCY_CODE), '||
                        'LMT.CMS_LSP_APPR_LMTS_ID, ' ||
                        'LMT.LMT_FAC_TYPE_VALUE, ' ||
                        'LMT.LMT_ID, ' ||
                        'LMT.LMT_AMT, ' ||
                        'LMT.CMS_ACTIVATED_LIMIT, ' ||
                        'LMT.CMS_DRAWING_LIMIT, ' ||
                        'LMT.CMS_OUTSTANDING_AMT, ' ||
                        'LMT.CMS_ACT_SEC_COVERAGE, ' ||
                        'LMT.LMT_CRRNCY_ISO_CODE, ' ||
                        '(case lmt.source_id '||
							'when ''ARBS'' then getAccountType(LMT.CMS_LSP_APPR_LMTS_ID) '||
							'else '''' '||
							'end) ';
                         
	SET v_sql_coverage_cond =   
                   'FROM CMS_SECURITY SEC, ' ||
                        'CMS_CHARGE_DETAIL CHARGE, ' ||
                        'CMS_LIMIT_CHARGE_MAP CHARGEMAP, ' ||
                        'SCI_LSP_APPR_LMTS LMT ' ||
                  'WHERE SEC.CMS_COLLATERAL_ID = ? AND ' ||
                        'SEC.CMS_COLLATERAL_ID = CHARGE.CMS_COLLATERAL_ID AND ' ||
		        'CHARGE.CHARGE_DETAIL_ID = CHARGEMAP.CHARGE_DETAIL_ID AND ' ||
                        'CHARGE.STATUS = ''ACTIVE'' AND ' ||
		        'CHARGEMAP.STATUS = ''ACTIVE'' AND ' ||
                        'CHARGEMAP.CMS_LSP_APPR_LMTS_ID = LMT.CMS_LSP_APPR_LMTS_ID AND ' ||
                        'LMT.CMS_LSP_APPR_LMTS_ID IN ' || 
			'(SELECT CMS_LSP_APPR_LMTS_ID FROM SESSION.lmt_list) ';
			
  SET v_sql_coverage_acct_exists = ' AND ' ||
                        'EXISTS (SELECT COUNT(1) FROM SCI_LSP_LMTS_XREF_MAP ACCTMAP WHERE ' ||
                                'ACCTMAP.CMS_LSP_APPR_LMTS_ID = LMT.CMS_LSP_APPR_LMTS_ID AND ' || 
                                'ACCTMAP.CMS_STATUS = ''ACTIVE'') ';
  
  SET v_sql_coverage_orderby = 'ORDER BY CMS_COLLATERAL_ID, SECURITY_RANK, CHARGE_DETAIL_ID, LMT_ID';
  
  SET v_sql_coverage =  v_sql_coverage_select ||
						v_sql_coverage_cond ||
						' AND (LMT.SOURCE_ID <> ''ARBS'' ' ||		
						' OR (LMT.SOURCE_ID = ''ARBS'' ' ||
						v_sql_coverage_acct_exists ||
						' ) )' ||
                        v_sql_coverage_orderby;
  
      
  SET v_sql_checknpl = 'SELECT ACCT.ACCT_DELQ_IND ' ||
                       'FROM SCI_LSP_SYS_XREF ACCT, SCI_LSP_LMTS_XREF_MAP ACCTMAP ' ||  
                       'WHERE ACCT.CMS_LSP_SYS_XREF_ID = ACCTMAP.CMS_LSP_SYS_XREF_ID AND ' ||
                             'ACCTMAP.CMS_STATUS = ''ACTIVE'' AND ' ||
                             'ACCTMAP.CMS_LSP_APPR_LMTS_ID IN (SELECT CMS_LSP_APPR_LMTS_ID FROM SESSION.lmt_list) ';
   
  OPEN npl_cur;
  
  FETCH npl_cur INTO v_acct_status;
  WHILE (v_no_data = 0) DO
    IF v_acct_status = 'Y' THEN
      SET v_has_npl = 1; 
      SET v_no_data = 1; 
    END IF;
    FETCH npl_cur INTO v_acct_status;
  END WHILE;
  CLOSE npl_cur;

  SET v_no_data = 0;
  SET v_prev_charge_id = 0;

  -- get initial fsv based on whether there is a NPL account, if so initial fsv will be set 
  -- to min of fsv and reserve price, otherwise it will be set to cmv
  PREPARE v_stmt_coverage FROM v_sql_coverage;
  
  OPEN cov_cur using p_cur_sec_id;
  
  FETCH cov_cur INTO v_sec_id, v_sectype, v_secSubtype, v_cmv, v_cmv_curr, v_fsv, v_fsv_curr, 
  v_reserve_prc, v_cur_charge_id, v_charge_type, v_sec_rank, v_pr_charge_amt, v_pr_charge_cc, 
  v_charge_std, --v_charge_amt, v_charge_cc, 
  v_cur_apprlmt_id, v_lmt_prod_tp, v_lmt_id, v_lmt_amt, v_activated_amt, 
  v_drawing_amt, v_outstd_amt, v_act_sec_cov, v_lmt_cc, v_acct_type;
  IF (v_no_data = 0) THEN		  	
    SET v_fsv_bal = getInitFsvAmount(v_has_npl, v_sec_id, v_sectype, v_secSubtype, v_cmv, v_cmv_curr, v_fsv, v_fsv_curr, v_reserve_prc);	
  END IF;
  
  WHILE (v_no_data = 0) DO	
    IF v_charge_type = 'G' THEN
      SET v_has_gencharge = 1;  
    END IF;
    -- comment off because getpriorChargeAmt is always return 0
    --SET v_fsv_bal = v_fsv_bal - getPriorChargeAmt(v_pr_charge_amt, v_pr_charge_cc);
    
    -- calculate the limit level security coverage as min(fsv_bal, charge_amount) / limit amount. The limit amount is calculated
    -- based on the product type, it might be possible to have different charges covering same limit, we use a temp table to 
    -- remember the previous coverage and value will be accumulated
    
    -- comment off due to added into the sql
    --SET v_charge_std = convertToBase(v_charge_amt, v_charge_cc);
    
    -- in case multiple limits belongs to one charge, we assume the first limit will get all charge amount
    -- and the rest will get 0	
    IF v_prev_charge_id = v_cur_charge_id THEN
      SET v_charge_std = 0;	
    END IF;	
    IF v_fsv_bal >= v_charge_std THEN
      SET v_more_to_cover = v_charge_std;   
    ELSE
      SET v_more_to_cover = v_fsv_bal;
    END IF;
    SET v_derive_lmt_amt = getDerivedLmtAmt(v_acct_type, v_lmt_amt, v_activated_amt, v_drawing_amt, v_outstd_amt, v_lmt_cc);
    SELECT COUNT(1) INTO v_tmp_cnt FROM SESSION.lmt_seccov WHERE CMS_LSP_APPR_LMTS_ID = v_cur_apprlmt_id; 
    IF v_tmp_cnt > 0 THEN
      -- there is previous charge covering the limit	
      SELECT DERIVE_LMT_AMT, LMT_COV INTO v_derive_lmt_amt,  v_prev_lmt_cov FROM SESSION.lmt_seccov WHERE CMS_LSP_APPR_LMTS_ID = v_cur_apprlmt_id;
      IF v_derive_lmt_amt > 0 THEN
        UPDATE SESSION.lmt_seccov SET LMT_COV = v_prev_lmt_cov + v_more_to_cover * 100.0 / v_derive_lmt_amt WHERE CMS_LSP_APPR_LMTS_ID = v_cur_apprlmt_id;
      END IF;     
    ELSE
      -- there is no previous charge covering the limit		
      IF v_derive_lmt_amt > 0 THEN
        INSERT INTO SESSION.lmt_seccov(CMS_LSP_APPR_LMTS_ID, DERIVE_LMT_AMT, LMT_COV) VALUES(v_cur_apprlmt_id, v_derive_lmt_amt, v_more_to_cover * 100.0 / v_derive_lmt_amt);
      ELSE
        INSERt INTO SESSION.lmt_seccov(CMS_LSP_APPR_LMTS_ID, DERIVE_LMT_AMT, LMT_COV) VALUES(v_cur_apprlmt_id, v_derive_lmt_amt, 0);
      END IF; 
    END IF;	
    -- deduct the charge amount from the fsv_balance when coming to a new charge
    IF v_prev_charge_id <> v_cur_charge_id THEN
      SET v_fsv_bal = v_fsv_bal - v_charge_std;
      IF v_fsv_bal < 0 THEN
        SET v_fsv_bal = 0;
      END IF;
      SET v_prev_charge_id = v_cur_charge_id;
    END IF;
    SET v_no_data = 0;  
    FETCH cov_cur INTO v_sec_id, v_sectype, v_secSubtype, v_cmv, v_cmv_curr, v_fsv, v_fsv_curr, 
	v_reserve_prc, v_cur_charge_id, v_charge_type, v_sec_rank, v_pr_charge_amt, v_pr_charge_cc, 
	v_charge_std, --v_charge_amt, v_charge_cc, 
	v_cur_apprlmt_id, v_lmt_prod_tp, v_lmt_id, v_lmt_amt, v_activated_amt, 
	v_drawing_amt, v_outstd_amt, v_act_sec_cov, v_lmt_cc, v_acct_type;
  END WHILE;
  CLOSE cov_cur;
  CALL persistLmtSecCoverage;
  DELETE FROM SESSION.lmt_seccov;
  
  -- if all charges belongs to the security are specific charge, we will consider gencharge surplus as 0 which will not be added to AA level coverage 
  -- finally persist the fsv balance 
  IF v_has_gencharge = 0 THEN
    UPDATE CMS_SECURITY SET FSV_BALANCE = v_fsv_bal, FSV_BALANCE_CCY = 'MYR', GEN_CHARGE_SURPLUS = 0 WHERE CMS_COLLATERAL_ID = p_cur_sec_id; 
  ELSE 
    UPDATE CMS_SECURITY SET FSV_BALANCE = v_fsv_bal, FSV_BALANCE_CCY = 'MYR', GEN_CHARGE_SURPLUS = v_fsv_bal WHERE CMS_COLLATERAL_ID = p_cur_sec_id; 
  END IF; 
  -- DROP TABLE SESSION.lmt_seccov;
  COMMIT;
END!


-- get the security ids and associated facilities for which security allocation should 
-- be done by checking the AA document status = compiled, then find the list of
-- facilities belong to the AA and linked securities that are elligible for allocation
-- then for each security id and facilities   
CREATE PROCEDURE getSecIdForSecCov LANGUAGE SQL
BEGIN
  DECLARE v_prev_sec_id BIGINT;  
  DECLARE v_cur_sec_id  BIGINT;
  DECLARE v_cur_appr_lmt_id  BIGINT;
  DECLARE v_cur_lmt_prof_id  BIGINT;
  DECLARE v_sql VARCHAR(2000);
  DECLARE v_no_data SMALLINT DEFAULT 0;		
  DECLARE v_stmt STATEMENT;
  DECLARE secid_cur CURSOR WITH HOLD FOR v_stmt;   
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_no_data = 1;
  --DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_list(CMS_LSP_APPR_LMTS_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

  SET v_sql = 
		'SELECT sec.cms_collateral_id, lmt.cms_lsp_appr_lmts_id, lmt.cms_limit_profile_id ' ||
		'  FROM cms_security sec, ' ||
		'       cms_limit_charge_map chrg_map, ' ||
		'       sci_lsp_appr_lmts lmt, ' ||
		'       cms_limit_security_map sec_map ' ||
		' WHERE lmt.cms_limit_status = ''ACTIVE'' ' ||
		'   AND lmt.lmt_type_value = ''OUTER''  ' ||
		'   AND chrg_map.status = ''ACTIVE'' ' ||
		'   AND chrg_map.cms_collateral_id = sec.cms_collateral_id ' ||
		'   AND sec.is_legal_enforce =''Y'' ' ||
		'   AND sec.status = ''ACTIVE'' ' ||
		'   AND sec_map.charge_id = chrg_map.charge_id ' ||
		'   AND sec_map.cms_lsp_appr_lmts_id = lmt.cms_lsp_appr_lmts_id ' ||
		'   AND sec_map.cms_collateral_id = sec.cms_collateral_id ' ||
		'   AND sec_map.update_status_ind <> ''D'' ' ||
		' ORDER BY sec.sci_security_dtl_id ' ;

  SET v_prev_sec_id = 0;
  PREPARE v_stmt FROM v_sql;
  OPEN secid_cur;
  FETCH secid_cur INTO v_cur_sec_id, v_cur_appr_lmt_id, v_cur_lmt_prof_id;
  WHILE (v_no_data = 0) DO
    IF v_prev_sec_id <> v_cur_sec_id THEN
      IF v_prev_sec_id <> 0 THEN
        -- current is a new security, calculate security coverage for the previous security and
        -- clear the limit list after calculation
        CALL calFacSecCoverage(v_prev_sec_id);  
      END IF;
      DELETE FROM SESSION.lmt_list;
      SET v_prev_sec_id = v_cur_sec_id;     
    END IF;	
    INSERT INTO SESSION.lmt_list(CMS_LSP_APPR_LMTS_ID) VALUES(v_cur_appr_lmt_id);
    SET v_no_data = 0;         
    FETCH secid_cur INTO v_cur_sec_id, v_cur_appr_lmt_id, v_cur_lmt_prof_id; 
  END WHILE;

  -- process the last security
  IF v_prev_sec_id <> 0 THEN		 	
     CALL calFacSecCoverage(v_prev_sec_id);
  END IF;	
  DELETE FROM SESSION.lmt_list;
  CLOSE secid_cur;
  --DROP TABLE SESSION.lmt_list; 
END!


CREATE PROCEDURE calAASecCoverage LANGUAGE SQL
BEGIN
  DECLARE v_sql VARCHAR(2000);
  DECLARE v_prevaa_id BIGINT;
  DECLARE v_curaa_id  BIGINT;
  DECLARE v_prevsec_id BIGINT;
  DECLARE v_cursec_id BIGINT;
  DECLARE v_chg_surplus DECIMAL(20,2); 
  DECLARE v_charge_id BIGINT;
  DECLARE v_lmt_id BIGINT;
  DECLARE v_act_cov DOUBLE;
  DECLARE v_aa_coverage DOUBLE;
  DECLARE v_lmt_amt DECIMAL(20,2);

  DECLARE v_tmp_cnt INT;
  DECLARE v_totl_lmt_amt DECIMAL(20,2) DEFAULT 0;
  DECLARE v_totl_charge DECIMAL(20,2) DEFAULT 0;
  DECLARE v_totl_surplus DECIMAL(20,2) DEFAULT 0;
  DECLARE v_no_data SMALLINT DEFAULT 0;
  DECLARE v_stmt STATEMENT; 
  DECLARE lmtprof_cur CURSOR WITH HOLD FOR v_stmt; 
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_no_data = 1;

  --DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_aa(CMS_LSP_APPR_LMTS_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

  SET v_prevaa_id = 0;
  SET v_prevsec_id = 0;
  SET v_sql = 
		' SELECT lmt.cms_limit_profile_id, sec.cms_collateral_id, sec.gen_charge_surplus, ' ||
		'	   charge_map.charge_detail_id, lmt.cms_lsp_appr_lmts_id, ' ||
		'	   lmt.cms_act_sec_coverage, lmt.cms_cr125_derive_actvd_lmt_amt ' ||
		'  FROM sci_lsp_appr_lmts lmt, ' ||
		'  	   cms_limit_charge_map charge_map, ' ||
		'	   cms_limit_security_map sec_map, ' ||
		'  	   cms_security sec  ' ||
		' WHERE lmt.cms_limit_status = ''ACTIVE'' ' ||
		'   AND lmt.lmt_type_value = ''OUTER'' ' ||
		'   AND charge_map.status = ''ACTIVE'' ' ||
		'   AND charge_map.cms_collateral_id = sec.cms_collateral_id ' ||
		'   AND sec.is_legal_enforce = ''Y'' ' ||
		'   AND sec.status = ''ACTIVE'' ' ||
		'   AND sec_map.charge_id = charge_map.charge_id ' ||
		'   AND sec_map.cms_collateral_id = sec.cms_collateral_id ' ||
		'   AND sec_map.cms_lsp_appr_lmts_id = lmt.cms_lsp_appr_lmts_id ' ||
		'   AND sec_map.update_status_ind <> ''D'' ' ||
		' ORDER BY lmt.cms_limit_profile_id, sec.cms_collateral_id ';

  PREPARE v_stmt FROM v_sql;
  OPEN lmtprof_cur;
  FETCH lmtprof_cur INTO v_curaa_id, v_cursec_id, v_chg_surplus, v_charge_id, v_lmt_id, v_act_cov, v_lmt_amt;
  WHILE (v_no_data = 0) DO
    IF v_prevaa_id <> v_curaa_id THEN
      IF v_prevaa_id <> 0 THEN
        IF v_totl_lmt_amt = 0 THEN
          SET v_aa_coverage = 0;
        ELSE
          SET v_aa_coverage = (v_totl_charge + v_totl_surplus) * 100.0 / v_totl_lmt_amt;  
        END IF;         
        UPDATE SCI_LSP_LMT_PROFILE SET CMS_ACT_SEC_COVERAGE = v_aa_coverage WHERE CMS_LSP_LMT_PROFILE_ID = v_prevaa_id;
	COMMIT;
        -- clear up
        SET v_totl_lmt_amt = 0;
        SET v_totl_charge = 0;
        SET v_totl_surplus = 0;
        SET v_prevsec_id = 0;
        DELETE FROM SESSION.lmt_aa;  
      END IF;
      SET v_prevaa_id = v_curaa_id; 
    END IF;
    -- check whether this is a different security, if so, sum up the gencharge surplus
    IF v_prevsec_id <> v_cursec_id THEN
      SET v_totl_surplus = v_totl_surplus + v_chg_surplus;	         
    END IF;
    -- check whether the limit has been added before, if not the allocated charge will be added
    -- also the limit amount will be added
    SELECT COUNT(1) INTO v_tmp_cnt FROM SESSION.lmt_aa WHERE CMS_LSP_APPR_LMTS_ID = v_lmt_id; 
    IF v_tmp_cnt = 0 THEN
      SET v_totl_lmt_amt = v_totl_lmt_amt + v_lmt_amt;
      SET v_totl_charge = v_totl_charge + v_lmt_amt * v_act_cov / 100.0;
      INSERT INTO SESSION.lmt_aa(CMS_LSP_APPR_LMTS_ID) VALUES(v_lmt_id);	
    END IF;
    SET v_no_data = 0;
    FETCH lmtprof_cur INTO v_curaa_id, v_cursec_id, v_chg_surplus, v_charge_id, v_lmt_id, v_act_cov, v_lmt_amt;
  END WHILE;
   
  -- process the last aa
  IF v_prevaa_id <> 0 THEN	
    IF v_totl_lmt_amt = 0 THEN
      SET v_aa_coverage = 0;
    ELSE
      SET v_aa_coverage = (v_totl_charge + v_totl_surplus) * 100.0 / v_totl_lmt_amt;  
    END IF;         
    UPDATE SCI_LSP_LMT_PROFILE SET CMS_ACT_SEC_COVERAGE = v_aa_coverage WHERE CMS_LSP_LMT_PROFILE_ID = v_prevaa_id;
  END IF;
  CLOSE lmtprof_cur;
  DELETE FROM SESSION.lmt_aa;
  COMMIT;	 
  --DROP TABLE SESSION.lmt_aa;
END!

CREATE PROCEDURE seccoverage_main LANGUAGE SQL
BEGIN
  CALL INIT_TEMPLMT_LIST;
  CALL INIT_TEMPLMT_SECCOV;
  CALL INIT_TEMPLMT_AA;
  CALL clearPrevRes();
  CALL getSecIdForSecCov();
  CALL calAASecCoverage();
  CALL CLOSE_TEMPLMT_LIST;
  CALL CLOSE_TEMPLMT_SECCOV;
  CALL CLOSE_TEMPLMT_AA;
END!



