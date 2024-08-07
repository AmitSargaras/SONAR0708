package com.integrosys.cms.app.tatdoc.bus;

import java.util.Date;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.cms.app.common.bus.OBBookingLocation;
import com.integrosys.cms.app.limit.bus.ILimitProfile;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;

public class TatDocJdbcImplTest extends AbstractTransactionalDataSourceSpringContextTests {

	protected String getConfigPath() {
		return "/AppContext_TrxDataSource_Test.xml";
	}

	public void testInsertPendingPerfectionRecordsForAAWithoutTat() {
		TatDocJdbcImpl jdbc = new TatDocJdbcImpl();
		jdbc.setJdbcTemplate(jdbcTemplate);

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(11112222);
		limitProfile.setLosLimitProfileReference("11112222");
		limitProfile.setBCAReference("11112222");
		limitProfile.setApplicationType("CC");
		limitProfile.setLEReference("1122");
		limitProfile.setCustomerID(22221111);

		OBBookingLocation ob = new OBBookingLocation();
		ob.setCountryCode("MY");
		ob.setOrganisationCode("511");

		limitProfile.setOriginatingLocation(ob);

		jdbc.insertOrRemovePendingPerfectionCreditFolder(null, limitProfile);
	}

	public void testInsertPendingPerfectionRecordsForAAWithTat() {
		TatDocJdbcImpl jdbc = new TatDocJdbcImpl();
		jdbc.setJdbcTemplate(jdbcTemplate);

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(11112222);
		limitProfile.setLosLimitProfileReference("11112222");
		limitProfile.setBCAReference("11112222");
		limitProfile.setApplicationType("CC");
		limitProfile.setLEReference("1122");
		limitProfile.setCustomerID(22221111);

		OBBookingLocation ob = new OBBookingLocation();
		ob.setCountryCode("MY");
		ob.setOrganisationCode("511");

		limitProfile.setOriginatingLocation(ob);

		OBTatDoc tat = new OBTatDoc();
		tat.setDocCompletionDate(new Date());

		jdbc.insertOrRemovePendingPerfectionCreditFolder(tat, limitProfile);
	}

	public void testInsertPendingPerfectionRecordsForAAWithTatNullCompletionDate() {
		TatDocJdbcImpl jdbc = new TatDocJdbcImpl();
		jdbc.setJdbcTemplate(jdbcTemplate);

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(11112222);
		limitProfile.setLosLimitProfileReference("11112222");
		limitProfile.setBCAReference("11112222");
		limitProfile.setApplicationType("CC");
		limitProfile.setLEReference("1122");
		limitProfile.setCustomerID(22221111);

		OBBookingLocation ob = new OBBookingLocation();
		ob.setCountryCode("MY");
		ob.setOrganisationCode("511");

		limitProfile.setOriginatingLocation(ob);

		OBTatDoc tat = new OBTatDoc();

		jdbc.insertOrRemovePendingPerfectionCreditFolder(tat, limitProfile);
	}
}
