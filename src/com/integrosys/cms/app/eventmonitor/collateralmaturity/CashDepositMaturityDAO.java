/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/eventmonitor/collateralmaturity/CashDepositMaturityDAO.java,v 1.15 2006/08/21 02:46:34 hmbao Exp $
 */

package com.integrosys.cms.app.eventmonitor.collateralmaturity;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.integrosys.cms.app.eventmonitor.IMonitorDAOResult;
import com.integrosys.cms.app.eventmonitor.IRuleParam;
import com.integrosys.cms.app.eventmonitor.MonitorDaoResultRetrievalFailureException;
import com.integrosys.cms.app.eventmonitor.common.OBDateRuleParam;

/**
 * Describe this class.
 * 
 * @Purpose:
 * @Description: DAO to get non marketable securities maturity Note that for
 *               checking of due date *BEFORE* maturity date, a -ve
 *               OBDateRuleParam.getNumOfDays() has to be passed in
 * @author BaoHongMan
 * @version R1.5
 * @since 2006-7-20
 * @Tag com.integrosys.cms.app.eventmonitor.collateralmaturity.
 *      CashDepositMaturityDAO.java
 */
public class CashDepositMaturityDAO extends AbstractCollateralMaturityDAO {
	/*
	public IMonitorDAOResult getInitialSet(IRuleParam ruleParam) throws MonitorDaoResultRetrievalFailureException {

		OBDateRuleParam param = (OBDateRuleParam) ruleParam;
		String sql = getSQLStatement(ruleParam.hasCountryCode());

		List argList = new ArrayList();
		argList.add(new Date(param.getSysDate().getTime()));

		if (ruleParam.hasCountryCode()) {
			argList.add(param.getCountryCode());
		}

		argList.add(new Date(param.getSysDate().getTime()));
		argList.add(new Integer(param.getNumOfDays()));
		argList.add(new Date(param.getSysDate().getTime()));

		if (ruleParam.hasCountryCode()) {
			argList.add(param.getCountryCode());
		}

		argList.add(new Date(param.getSysDate().getTime()));
		argList.add(new Integer(param.getNumOfDays()));

		List resultList = (List) getJdbcTemplate().query(sql, argList.toArray(), new ResultSetExtractor() {

			public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
				return processResultSet(rs);
			}
		});

		return new CollateralMaturityDAOResult(resultList);
	}
*/
	protected String getSelectStmt() {
		StringBuffer sqlBuffer = new StringBuffer(getCommonSelectStmt());
		sqlBuffer.append("CMS_CASH_DEPOSIT.DEPOSIT_MATURITY_DATE AS SECURITY_MATURITY_DATE,");
		sqlBuffer
				.append("calendar_days(cast(? as date), cast(CMS_CASH_DEPOSIT.DEPOSIT_MATURITY_DATE as date)) AS daysdue");
		return sqlBuffer.toString();
	}

	protected String getFromStmt(boolean isCoBorrower) {
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" FROM CMS_CASH_DEPOSIT,");
		sqlBuffer.append(getCommonFromStmt(isCoBorrower));
		return sqlBuffer.toString();
	}

	protected String getConditionStmt(boolean isByCountry, boolean isCoBorrower) {
		StringBuffer sqlBuffer = new StringBuffer(getCommonConditionStmt(isByCountry, isCoBorrower));
		sqlBuffer.append(" AND CMS_SECURITY.CMS_COLLATERAL_ID = CMS_CASH_DEPOSIT.CMS_COLLATERAL_ID");
		sqlBuffer.append(" AND CMS_SECURITY.SECURITY_SUB_TYPE_ID LIKE 'CS%' ");
		sqlBuffer.append(" AND calendar_days(cast(? as date), cast(CMS_CASH_DEPOSIT.DEPOSIT_MATURITY_DATE as date) )");
		sqlBuffer.append(getEqualComparator()).append(" ? ");
		return sqlBuffer.toString();
	}
}
