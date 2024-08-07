package com.integrosys.cms.host.eai.security.bus.asset;

import java.util.Arrays;
import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.support.MessageDate;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateAssetCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Asset.hbm.xml" };
	}

	public void testStoreAssetCollateralOnly() {
		AssetSecurity asset = new AssetSecurity();
		asset.setCMSSecurityId(20080819000000001l);

		Long id = (Long) getHibernateTemplate().save(asset);
		AssetSecurity storedAsset = (AssetSecurity) getHibernateTemplate().get(AssetSecurity.class, id);
		assertEquals(20080819000000001l, storedAsset.getCMSSecurityId());
	}

	public void testStoreAssetVehicleCollateral() {
		AssetSecurity asset = new AssetSecurity();
		asset.setCMSSecurityId(20080819000000001l);
		ChequeDetail chequeDetail = new ChequeDetail();
		chequeDetail.setLOSChequeId("CQ002");
		chequeDetail.setCmsChequeId(1187);
		chequeDetail.setChequeType("A");
		chequeDetail.setChequeAmountCurrency("SGD");
		chequeDetail.setChequeAmount(new Double(144d));
		chequeDetail.setReceivableByBank("Y");
		chequeDetail.setToCredit("INTE");
		StandardCode bankAllocation = new StandardCode();
		bankAllocation.setStandardCodeNumber("40");
		Date issue = MessageDate.getInstance().getDate("01011811");
		chequeDetail.setCollateralId(20080819000000001l);
		chequeDetail.setIssueDate(MessageDate.getInstance().getString(issue));
		VehicleDetail vehicle = new VehicleDetail();
		vehicle.setTransmissionType("A");
		vehicle.setVehicleColour("SILVER");

		asset.setVehicleDetail(vehicle);
		asset.setChequeDetail(Arrays.asList(new ChequeDetail[] { chequeDetail }));

		Long idc = (Long) getHibernateTemplate().save(chequeDetail);
		ChequeDetail cddd = (ChequeDetail) getHibernateTemplate().get(ChequeDetail.class, idc);
		assertNotNull(cddd);
		System.out.println("<<<<< " + cddd.getIssueDate());
		Long id = (Long) getHibernateTemplate().save(asset);
		System.out.println(id);
		assertNotNull(id);

		JdbcTemplate jdbc = new JdbcTemplate(getDataSource());
		int count = jdbc.queryForInt("select count(*) from cms_asset_vehicle where cms_collateral_id = ?",
				new Object[] { new Long(20080819000000001l) });
		assertEquals(1, count);

		AssetSecurity storedAsset = (AssetSecurity) getHibernateTemplate().get(AssetSecurity.class, id);
		assertNotNull(storedAsset);
		assertNotNull(storedAsset.getVehicleDetail());
		assertEquals("A", storedAsset.getVehicleDetail().getTransmissionType());
		assertEquals("SILVER", storedAsset.getVehicleDetail().getVehicleColour());
	}

	public void testStoreAssetGoldCollateral() {
		AssetSecurity asset = new AssetSecurity();
		asset.setCMSSecurityId(20080819000000001l);
		// asset.setJDOPurchaseDate(DateUtils.addMonths(new Date(), -11));

		GoldDetail gold = new GoldDetail();

		StandardCode goldGrade = new StandardCode();
		goldGrade.setStandardCodeNumber("GOLD_GRADE");
		goldGrade.setStandardCodeValue("999A");

		gold.setGoldGrade(goldGrade);
		gold.setGoldUnitPrice(new Double(1000d));

		StandardCode unitPriceUom = new StandardCode();
		unitPriceUom.setStandardCodeNumber("GOLD_UNIT_PRICE_UOM");
		unitPriceUom.setStandardCodeValue("Dollar Per Gram");

		gold.setGoldUnitPriceUOM(unitPriceUom);
		gold.setGoldWeight(new Double(1000d));

		StandardCode weightUom = new StandardCode();
		weightUom.setStandardCodeNumber("GOLD_WEIGHT_UOM");
		weightUom.setStandardCodeValue("Gram");

		gold.setPurchaseReceiptNo("GOLD-BAR-A-00001-999");

		asset.setGoldDetail(gold);

		Long id = (Long) getHibernateTemplate().save(asset);
		assertNotNull(id);
	}

	public void testStoreStageVesselCollateral() {
		StageAssetSecurity asset = new StageAssetSecurity();
		asset.setCMSSecurityId(20080820000000888l);
		// asset.setJDOPurchaseDate(DateUtils.addMonths(new Date(), -11));

		VesselDetail vessel = new VesselDetail();
		vessel.setBuiltYear(new Long(2008));
		vessel.setDeck("CRUISE BOARDING DECK");
		vessel.setDeckThickness("100mm");
		vessel.setDeckWeight("300kg");
		vessel.setBuilder("YTL CORP");
		vessel.setVesselName("BOARDING DECK");
		vessel.setVesselSerialNo("DECK-0123456");
		vessel.setVesselUse("CRUISE");
		vessel.setConstructionCountry("MY");

		asset.setVesselDetail(vessel);

		Long id = (Long) getHibernateTemplate().save(asset);
		assertNotNull(id);

		StageAssetSecurity storedAsset = (StageAssetSecurity) getHibernateTemplate().get(StageAssetSecurity.class, id);
		assertNotNull(storedAsset);

		assertEquals("CRUISE", storedAsset.getVesselDetail().getVesselUse());
	}

	public void testStoreStageAirCraftCollateral() {
		StageAssetSecurity asset = new StageAssetSecurity();
		asset.setCMSSecurityId(20080820000000888l);
		// asset.setJDOPurchaseDate(DateUtils.addMonths(new Date(), -11));

		AirCraftDetail aircraft = new AirCraftDetail();
		aircraft.setAircraftSerialNo("A380-A-SG-000011-98811");
		aircraft.setGuarantors("CITIBANK");
		aircraft.setManufacturerName("AIRBUS");

		asset.setAircraftDetail(aircraft);

		Long id = (Long) getHibernateTemplate().save(asset);
		assertNotNull(id);

		StageAssetSecurity storedAsset = (StageAssetSecurity) getHibernateTemplate().get(StageAssetSecurity.class, id);
		assertNotNull(storedAsset);

		assertEquals("AIRBUS", storedAsset.getAircraftDetail().getManufacturerName());
	}

	public void testStoreVehicleCollateralWithoutVehicleObject() {
		AssetSecurity asset = new AssetSecurity();
		asset.setCMSSecurityId(20080819000111001l);

		getHibernateTemplate().save(asset);
		AssetSecurity storedAsset = (AssetSecurity) getHibernateTemplate().get(AssetSecurity.class,
				new Long(20080819000111001l));
		assertNull(storedAsset.getVehicleDetail());

		storedAsset.setVehicleDetail(new VehicleDetail());
		getHibernateTemplate().saveOrUpdate(storedAsset);
		getHibernateTemplate().flush();

		assertEquals(1, getJdbcTemplate().queryForLong(
				"SELECT count(*) from cms_asset_vehicle WHERE cms_collateral_id = 20080819000111001"));

		storedAsset = (AssetSecurity) getHibernateTemplate().get(AssetSecurity.class, new Long(20080819000111001l));

		SpecificChargeDetail charge = new SpecificChargeDetail();
		charge.setModel(new StandardCode("MODEL", "SHARK"));
		storedAsset.setSpecificChargeDetail(charge);

		getHibernateTemplate().saveOrUpdate(storedAsset);
		getHibernateTemplate().flush();

		assertEquals(1, getJdbcTemplate().queryForLong(
				"SELECT count(*) from cms_asset_vehicle WHERE cms_collateral_id = 20080819000111001"));

		storedAsset = (AssetSecurity) getHibernateTemplate().get(AssetSecurity.class, new Long(20080819000111001l));
		assertEquals(new StandardCode(null, "SHARK"), storedAsset.getSpecificChargeDetail().getModel());
	}
}
