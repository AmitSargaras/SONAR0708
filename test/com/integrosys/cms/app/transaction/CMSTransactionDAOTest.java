package com.integrosys.cms.app.transaction;

import junit.framework.TestCase;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.cms.app.common.constant.ICMSConstant;

public class CMSTransactionDAOTest extends TestCase {

	public void testSearchPendingCases() throws Exception {
		CMSTransactionDAO dao = new CMSTransactionDAO();
		CMSTrxSearchCriteria criteria = new CMSTrxSearchCriteria();
		criteria.setPendingTask(ICMSConstant.CREDIT_FOLDER);

		SearchResult sr = dao.searchPendingCases(criteria);
		assertTrue(sr.getResultList().isEmpty());

	}

}
