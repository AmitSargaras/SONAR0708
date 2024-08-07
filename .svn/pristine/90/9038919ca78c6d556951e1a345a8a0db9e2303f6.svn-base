package com.integrosys.cms.app.limit.bus;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.cms.host.eai.limit.bus.LimitJdbcImpl;

public class LimitJdbcTest extends AbstractTransactionalDataSourceSpringContextTests {

	protected String[] getConfigLocations() {
		return new String[] { "AppContext_TrxDataSource_Test.xml" };
	}

	public void testGetLimitProfileIdByOldAANo() {
		getJdbcTemplate().update(
				"insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_orig_country, los_bca_ref_num) "
						+ " values (?, ?, ?)", new Object[] { new Long(20090116000111222l), "MY", "MO-009" });

		LimitJdbcImpl docJdbc = new LimitJdbcImpl();
		docJdbc.setJdbcTemplate(getJdbcTemplate());

		Long cmsid = docJdbc.getLimitProfileIdByCMSLimitProfileID(20090116000111222l);
		assertNotNull(cmsid);
	}

	public void testGetLmtIdByLmtProfileIdAndOldLmtId() {
		getJdbcTemplate().update(
				"insert into SCI_LSP_APPR_LMTS (CMS_LSP_APPR_LMTS_ID, CMS_LIMIT_PROFILE_ID, los_bca_ref_num) "
						+ " values (?, ?, ?)",
				new Object[] { new Long(20090116000111224l), new Long(20090116000111222l), "MO-009" });

		LimitJdbcImpl docJdbc = new LimitJdbcImpl();
		docJdbc.setJdbcTemplate(getJdbcTemplate());

		Long cmsid = docJdbc.getLmtIdByLmtProfileIdAndOldLmtId(20090116000111222l, 20090116000111224l);
		assertNotNull(cmsid);
		System.out.println("---------" + cmsid);
	}

	public void testupdate() {

		getJdbcTemplate().update(
				"insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_orig_country, los_bca_ref_num) "
						+ " values (?, ?, ?)", new Object[] { new Long(20090116000111222l), "MY", "MO-009" });

		getJdbcTemplate().update(
				"UPDATE SCI_LSP_LMT_PROFILE SET CMS_BCA_RENEWAL_IND = ? WHERE CMS_LSP_LMT_PROFILE_ID = ?",
				new Object[] { "Y", new Long(20090116000111222l) });

		LimitJdbcImpl docJdbc = new LimitJdbcImpl();
		docJdbc.setJdbcTemplate(getJdbcTemplate());

		Long cmsid = docJdbc.getLimitProfileIdByCMSLimitProfileID(20090116000111222l);
		assertNotNull(cmsid);
	}
}
