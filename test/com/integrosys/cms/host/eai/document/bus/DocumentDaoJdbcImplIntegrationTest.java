package com.integrosys.cms.host.eai.document.bus;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.cms.host.eai.limit.bus.LimitProfile;

/**
 * @author Chong Jun Yong
 * 
 */
public class DocumentDaoJdbcImplIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {

	protected String[] getConfigLocations() {
		return new String[] { "AppContext_TrxDataSource_Test.xml" };
	}

	public void testRetrieveAaCountryCode() {
		getJdbcTemplate().update(
				"insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_orig_country, los_bca_ref_num) "
						+ " values (?, ?, ?)", new Object[] { new Long(20090116000111222l), "MY", "12345" });

		DocumentDaoJdbcImpl docJdbc = new DocumentDaoJdbcImpl();
		docJdbc.setJdbcTemplate(getJdbcTemplate());

		String country = docJdbc.getOrigCountryByAANumber("12345", "CC");
		assertEquals("MY", country);
	}

	public void testRetrieveAaOrgCode() {
		getJdbcTemplate().update(
				"insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_orig_organisation, los_bca_ref_num) "
						+ " values (?, ?, ?)", new Object[] { new Long(20090116000111222l), "123", "12345" });

		DocumentDaoJdbcImpl docJdbc = new DocumentDaoJdbcImpl();
		docJdbc.setJdbcTemplate(getJdbcTemplate());

		String orgCode = docJdbc.getOrigOrganisationByAANumber("12345", "CC");
		assertEquals("123", orgCode);
	}

	public void testRetrieveLimitByAANumber() {
		getJdbcTemplate().update(
				"insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_orig_organisation, los_bca_ref_num, application_type) "
						+ " values (?, ?, ?, ?)", new Object[] { new Long(20090116000111222l), "123", "12345", "HP" });

		DocumentDaoJdbcImpl docJdbc = new DocumentDaoJdbcImpl();
		docJdbc.setJdbcTemplate(getJdbcTemplate());

		LimitProfile limitProfile = docJdbc.retrieveLimitByAANumber("12345");
		assertEquals(new Long(20090116000111222l), new Long(limitProfile.getLimitProfileId()));
		assertEquals("HP", limitProfile.getAAType());
	}
}
