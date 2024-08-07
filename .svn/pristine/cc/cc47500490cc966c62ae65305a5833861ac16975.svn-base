package com.integrosys.cms.app.limit.bus;

import java.util.Date;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

public class FacilityJdbcImplIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {

	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testRetrieveFacilityGeneral() {
		Date todayDate = new Date();

		getJdbcTemplate().update("INSERT INTO cms_facility_master (id) values (?)", new Object[] { new Long(2) });

		getJdbcTemplate()
				.update(
						"INSERT INTO cms_fac_general (cms_fac_master_id, fac_status_code_value, "
								+ "cancel_reject_date, cancel_reject_code_num, cancel_reject_code_value) "
								+ "values (?, ?, ?, ?, ?)",
						new Object[] { new Long(2), "R", todayDate, "CANCEL_REJECT", "NM" });

		FacilityJdbcImpl jdbc = new FacilityJdbcImpl();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		IFacilityGeneral gen = jdbc.retrieveCancelAndRejectFacilityGeneralInfoByCmsFacilityMasterId(2);
		assertNotNull(gen);
		assertEquals(todayDate, gen.getCancelOrRejectDate());
		assertEquals("R", gen.getFacilityStatusEntryCode());
	}
}
