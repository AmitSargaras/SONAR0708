package com.integrosys.cms.host.eai.security.bus;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.cms.host.eai.security.bus.asset.AssetSecurity;

public class SecurityJdbcImplIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {
	public String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testRetrieveVehicleWithPbrPbtIndAndGoodStatus() {
		getJdbcTemplate().update("INSERT INTO cms_security (cms_collateral_id, security_sub_type_id) values (?, ?)",
				new Object[] { new Long(12345l), "AB102" });

		getJdbcTemplate().update("INSERT INTO cms_asset (cms_collateral_id, good_status) values (?, ?)",
				new Object[] { new Long(12345l), "N" });

		getJdbcTemplate().update("INSERT INTO cms_asset_vehicle (cms_collateral_id, pbt_pbr_indicator) values (?, ?)",
				new Object[] { new Long(12345l), "PBR" });

		SecurityJdbcImpl jdbc = new SecurityJdbcImpl();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		AssetSecurity asset = jdbc.retrieveAssetVehiclePbrPbtGoodsStatusDetail(12345l);
		assertNotNull(asset);
		assertNotNull(asset.getSpecificChargeDetail());
		assertNotNull(asset.getVehicleDetail());
		assertNull(asset.getCommonChargeDetail());
		assertEquals("N", asset.getSpecificChargeDetail().getGoodStatus().getStandardCodeValue());
		assertEquals("PBR", asset.getVehicleDetail().getPBTPBRInd());
	}

	public void testRetrieveNonVehicle() {
		getJdbcTemplate().update("INSERT INTO cms_security (cms_collateral_id, security_sub_type_id) values (?, ?)",
				new Object[] { new Long(12345l), "AB103" });

		SecurityJdbcImpl jdbc = new SecurityJdbcImpl();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		AssetSecurity asset = jdbc.retrieveAssetVehiclePbrPbtGoodsStatusDetail(12345l);
		assertNull(asset);
	}
}
