package com.integrosys.cms.app.customer.bus;

import java.util.Collection;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * @author Chong Jun Yong
 * 
 */
public class CustomerDAOIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testRetrieveCustomerWithOneIdNumberAndType() {
		CustomerDAO customerDao = new CustomerDAO();
		customerDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into sci_le_main_profile (cms_le_main_profile_id, lmp_short_name, lmp_top_1000_bank_ind, "
						+ " lmp_id_number, lmp_id_type_value, lmp_id_country_issued) values (?, ?, ?, ?, ?, ?)",
				new Object[] { new Long(20081106000222444l), "LEHMAN BROTHERS", "N", "BR-1234-5678", "BR", "US" });

		getJdbcTemplate().update(
				"insert into sci_le_sub_profile (cms_le_sub_profile_id, cms_le_main_profile_id, lsp_short_name) "
						+ " values (?, ?, ?)",
				new Object[] { new Long(20081106000111222l), new Long(20081106000222444l), "LEHMAN BROTHERS" });

		CustomerSearchCriteria criteria = new CustomerSearchCriteria();
		criteria.setNItems(1);
		criteria.setIdNO("BR-1234-5678");
		criteria.setIDType("BR");
		criteria.setIssuedCountry("US");

		SearchResult searchResult = customerDao.searchCustomer(criteria);
		Collection resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		OBCustomerSearchResult result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("LEHMAN BROTHERS", result.getCustomerName());
	}

	public void testRetrieveCustomerWithTwoIdNumberAndTypeWithCountryIssued() {
		CustomerDAO customerDao = new CustomerDAO();
		customerDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into sci_le_main_profile (cms_le_main_profile_id, lmp_short_name, lmp_top_1000_bank_ind, "
						+ " lmp_id_number, lmp_id_type_value, lmp_id_country_issued, lmp_second_id_number, "
						+ " lmp_second_id_type_value) values (?, ?, ?, ?, ?, ?, ?, ?)",
				new Object[] { new Long(20081106000222445l), "TAN AH KAO", "N", "770707013737", "IC", "MY",
						"S77113344K", "PP" });

		getJdbcTemplate().update(
				"insert into sci_le_sub_profile (cms_le_sub_profile_id, cms_le_main_profile_id, lsp_short_name) "
						+ " values (?, ?, ?)",
				new Object[] { new Long(20081106000111223l), new Long(20081106000222445l), "TAN AH KAO" });

		CustomerSearchCriteria criteria = new CustomerSearchCriteria();
		criteria.setNItems(1);
		criteria.setIdNO("S77113344K");
		criteria.setIDType("PP");

		SearchResult searchResult = customerDao.searchCustomer(criteria);
		Collection resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		OBCustomerSearchResult result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("TAN AH KAO", result.getCustomerName());

		criteria.setIdNO("770707013737");
		criteria.setIDType("IC");
		criteria.setIssuedCountry("MY");

		searchResult = customerDao.searchCustomer(criteria);
		resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("TAN AH KAO", result.getCustomerName());
	}

	public void testRetrieveCustomerWithThreeIdNumberAndTypeWithCountryIssued() {
		CustomerDAO customerDao = new CustomerDAO();
		customerDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into sci_le_main_profile (cms_le_main_profile_id, lmp_short_name, lmp_top_1000_bank_ind, "
						+ " lmp_id_number, lmp_id_type_value, lmp_id_country_issued, lmp_second_id_number, "
						+ " lmp_second_id_type_value, lmp_third_id_number, lmp_third_id_type_value, "
						+ " lmp_third_id_country_issued) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				new Object[] { new Long(20081106000222446l), "TAN AH KAO", "N", "770707013737", "IC", "MY",
						"G77113344K", "PP", "S7712345679", "SPR", "SG" });

		getJdbcTemplate().update(
				"insert into sci_le_sub_profile (cms_le_sub_profile_id, cms_le_main_profile_id, lsp_short_name) "
						+ " values (?, ?, ?)",
				new Object[] { new Long(20081106000111224l), new Long(20081106000222446l), "TAN AH KAO" });

		CustomerSearchCriteria criteria = new CustomerSearchCriteria();
		criteria.setNItems(1);
		criteria.setIdNO("G77113344K");
		criteria.setIDType("PP");

		SearchResult searchResult = customerDao.searchCustomer(criteria);
		Collection resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		OBCustomerSearchResult result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("TAN AH KAO", result.getCustomerName());

		criteria.setIdNO("770707013737");
		criteria.setIDType("IC");
		criteria.setIssuedCountry("MY");

		searchResult = customerDao.searchCustomer(criteria);
		resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("TAN AH KAO", result.getCustomerName());

		criteria.setIdNO("S7712345679");
		criteria.setIDType("SPR");
		criteria.setIssuedCountry("SG");

		searchResult = customerDao.searchCustomer(criteria);
		resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("TAN AH KAO", result.getCustomerName());
		assertEquals("770707013737", result.getIdNo());
		assertEquals("IC", result.getIdType());
	}

	public void testRetrieveCustomerWithThirdIdNumberAndTypeOnly() {
		CustomerDAO customerDao = new CustomerDAO();
		customerDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into sci_le_main_profile (cms_le_main_profile_id, lmp_short_name, lmp_top_1000_bank_ind, "
						+ " lmp_third_id_number, lmp_third_id_type_value, lmp_third_id_country_issued) "
						+ " values (?, ?, ?, ?, ?, ?)",
				new Object[] { new Long(20081106000222447l), "TAN AH KAO", "N", "S7712345679", "SPR", "SG" });

		getJdbcTemplate().update(
				"insert into sci_le_sub_profile (cms_le_sub_profile_id, cms_le_main_profile_id, lsp_short_name) "
						+ " values (?, ?, ?)",
				new Object[] { new Long(20081106000111225l), new Long(20081106000222447l), "TAN AH KAO" });

		CustomerSearchCriteria criteria = new CustomerSearchCriteria();
		criteria.setNItems(1);
		criteria.setIdNO("G77113344K");
		criteria.setIDType("PP");

		SearchResult searchResult = customerDao.searchCustomer(criteria);
		assertNull(searchResult);

		criteria.setIdNO("770707013737");
		criteria.setIDType("IC");
		criteria.setIssuedCountry("MY");

		searchResult = customerDao.searchCustomer(criteria);
		assertNull(searchResult);

		criteria.setIdNO("S7712345679");
		criteria.setIDType("SPR");
		criteria.setIssuedCountry("SG");

		searchResult = customerDao.searchCustomer(criteria);
		Collection resultList = searchResult.getResultList();
		assertEquals(1, resultList.size());

		OBCustomerSearchResult result = (OBCustomerSearchResult) resultList.toArray()[0];
		assertEquals("TAN AH KAO", result.getCustomerName());
		assertEquals("S7712345679", result.getIdNo());
		assertEquals("SPR", result.getIdType());
	}
}
