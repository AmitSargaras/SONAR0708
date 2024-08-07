package com.integrosys.cms.host.eai.security.handler.actualtrxhandler;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.base.techinfra.util.AccessorUtil;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.host.eai.Message;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.security.SecurityMessageBody;
import com.integrosys.cms.host.eai.security.bus.ApprovedSecurity;
import com.integrosys.cms.host.eai.security.bus.ISecurityDao;
import com.integrosys.cms.host.eai.security.bus.SecurityDaoImpl;
import com.integrosys.cms.host.eai.security.bus.asset.AssetSecurity;
import com.integrosys.cms.host.eai.security.bus.asset.TradeInInfo;

public class AssetTradeInInformationActualTrxHandlerTest extends CustomHibernateTestCase {

	AssetTradeInInformationActualTrxHandler handler;

	SecurityDaoImpl dao;

	public void setUp() {
		super.setUp();

		dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		handler = new AssetTradeInInformationActualTrxHandler();
		handler.setSecurityDao(dao);
	}

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Asset.hbm.xml" };
	}

	public void testStoreOneNewTradeInInfo() {
		ApprovedSecurity sec = new ApprovedSecurity();
		sec.setCMSSecurityId(12345);
		sec.setCurrency("MYR");
		sec.setUpdateStatusIndicator(ICMSConstant.HOST_STATUS_INSERT);

		StandardCode make = new StandardCode();
		make.setStandardCodeNumber("MAKE");
		make.setStandardCodeValue("HONDA");

		StandardCode model = new StandardCode();
		model.setStandardCodeNumber("MODEL");
		model.setStandardCodeValue("CITI");

		List tradeIns = new ArrayList();

		TradeInInfo tradeIn = new TradeInInfo();
		tradeIn.setMake(make);
		tradeIn.setModel(model);
		tradeIn.setRegistrationNo("REG-56789");
		tradeIn.setTradeInDeposit(new BigDecimal("400"));
		tradeIn.setTradeInValue(new BigDecimal("5000"));
		tradeIn.setYearOfManufacture(Integer.valueOf("1999"));

		tradeIns.add(tradeIn);

		AssetSecurity asset = new AssetSecurity();
		asset.setTradeInInformation(tradeIns);

		SecurityMessageBody secMsgBody = new SecurityMessageBody();
		secMsgBody.setSecurityDetail(sec);
		secMsgBody.setAssetDetail(asset);

		Message msg = new Message();
		msg.setMsgBody(secMsgBody);
		msg = handler.persistActualTrx(msg);

		secMsgBody = (SecurityMessageBody) msg.getMsgBody();
		asset = secMsgBody.getAssetDetail();
		tradeIns = asset.getTradeInInformation();
		tradeIn = (TradeInInfo) tradeIns.get(0);

		assertEquals(new Long(12345), tradeIn.getCmsCollateralId());
		assertEquals("MYR", tradeIn.getCurrencyCode());
		assertNotNull(tradeIn.getRefId());
		assertEquals(tradeIn.getId(), tradeIn.getRefId());
		assertEquals(make, tradeIn.getMake());
		assertEquals(model, tradeIn.getModel());

		TradeInInfo storedTradeIn = (TradeInInfo) dao.retrieve(tradeIn.getId(),
				ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);
		assertEquals(tradeIn, storedTradeIn);

		sec = secMsgBody.getSecurityDetail();
		sec.setCMSSecurityId(223344);

		msg = handler.persistStagingTrx(msg, null);

		secMsgBody = (SecurityMessageBody) msg.getMsgBody();
		asset = secMsgBody.getAssetDetail();
		tradeIns = asset.getTradeInInformation();
		tradeIn = (TradeInInfo) tradeIns.get(0);

		assertEquals(new Long(223344), tradeIn.getCmsCollateralId());
		assertEquals("MYR", tradeIn.getCurrencyCode());
		assertNotNull(tradeIn.getId());
		assertNotNull(tradeIn.getRefId());
		assertEquals(make, tradeIn.getMake());
		assertEquals(model, tradeIn.getModel());

		storedTradeIn = (TradeInInfo) dao.retrieve(tradeIn.getId(), ISecurityDao.ENTITY_NAME_STAGE_TRADE_IN);
		assertEquals(tradeIn, storedTradeIn);
	}

	public void testStoreOneNewAndUpdateOneTradeInInfo() {
		StandardCode make = new StandardCode();
		make.setStandardCodeNumber("MAKE");
		make.setStandardCodeValue("HONDA");

		StandardCode model = new StandardCode();
		model.setStandardCodeNumber("MODEL");
		model.setStandardCodeValue("CITI");

		TradeInInfo tradeIn = new TradeInInfo();
		tradeIn.setMake(make);
		tradeIn.setModel(model);
		tradeIn.setCmsCollateralId(new Long(12345));
		tradeIn.setRegistrationNo("REG-56789");
		tradeIn.setTradeInDeposit(new BigDecimal("400"));
		tradeIn.setTradeInValue(new BigDecimal("5000"));
		tradeIn.setYearOfManufacture(Integer.valueOf("1999"));
		tradeIn.setCurrencyCode("MYR");

		Long key = (Long) dao.store(tradeIn, TradeInInfo.class, ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);
		tradeIn = (TradeInInfo) dao.retrieve(key, ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);
		tradeIn.setRefId(key);
		dao.update(tradeIn, TradeInInfo.class, ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);

		TradeInInfo stage = new TradeInInfo();
		AccessorUtil.copyValue(tradeIn, stage, new String[] { "Id" });
		stage.setCmsCollateralId(new Long(223344));
		dao.store(stage, TradeInInfo.class, ISecurityDao.ENTITY_NAME_STAGE_TRADE_IN);

		ApprovedSecurity sec = new ApprovedSecurity();
		sec.setCMSSecurityId(12345);
		sec.setCurrency("MYR");
		sec.setUpdateStatusIndicator(ICMSConstant.HOST_STATUS_UDPATE);

		List tradeIns = new ArrayList();

		make = new StandardCode();
		make.setStandardCodeNumber("MAKE");
		make.setStandardCodeValue("HONDA");

		model = new StandardCode();
		model.setStandardCodeNumber("MODEL");
		model.setStandardCodeValue("CITI");

		tradeIn = new TradeInInfo();
		tradeIn.setMake(make);
		tradeIn.setModel(model);
		tradeIn.setRegistrationNo("REG-56789");
		tradeIn.setTradeInDeposit(new BigDecimal("400"));
		tradeIn.setTradeInValue(new BigDecimal("5000"));
		tradeIn.setYearOfManufacture(Integer.valueOf("1999"));

		tradeIns.add(tradeIn);

		make = new StandardCode();
		make.setStandardCodeNumber("MAKE");
		make.setStandardCodeValue("HONDA");

		model = new StandardCode();
		model.setStandardCodeNumber("MODEL");
		model.setStandardCodeValue("CITI 1.6E");

		tradeIn = new TradeInInfo();
		tradeIn.setMake(make);
		tradeIn.setModel(model);
		tradeIn.setRegistrationNo("REG-66790");
		tradeIn.setTradeInDeposit(new BigDecimal("300"));
		tradeIn.setTradeInValue(new BigDecimal("4000"));
		tradeIn.setYearOfManufacture(Integer.valueOf("2001"));

		tradeIns.add(tradeIn);

		AssetSecurity asset = new AssetSecurity();
		asset.setTradeInInformation(tradeIns);

		SecurityMessageBody secMsgBody = new SecurityMessageBody();
		secMsgBody.setSecurityDetail(sec);
		secMsgBody.setAssetDetail(asset);

		Message msg = new Message();
		msg.setMsgBody(secMsgBody);
		msg = handler.persistActualTrx(msg);

		secMsgBody = (SecurityMessageBody) msg.getMsgBody();
		asset = secMsgBody.getAssetDetail();
		tradeIns = asset.getTradeInInformation();
		tradeIn = (TradeInInfo) tradeIns.get(0);

		assertEquals(new Long(12345), tradeIn.getCmsCollateralId());
		assertEquals("MYR", tradeIn.getCurrencyCode());
		assertEquals(tradeIn.getId(), tradeIn.getRefId());
		assertEquals("HONDA", tradeIn.getMake().getStandardCodeValue());
		assertEquals("CITI", tradeIn.getModel().getStandardCodeValue());
		assertEquals("REG-56789", tradeIn.getRegistrationNo());
		assertEquals(new BigDecimal("5000"), tradeIn.getTradeInValue());

		TradeInInfo storedTradeIn = (TradeInInfo) dao.retrieve(tradeIn.getId(),
				ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);
		assertEquals(tradeIn, storedTradeIn);

		tradeIn = (TradeInInfo) tradeIns.get(1);

		assertEquals(new Long(12345), tradeIn.getCmsCollateralId());
		assertEquals("MYR", tradeIn.getCurrencyCode());
		assertEquals(tradeIn.getId(), tradeIn.getRefId());
		assertEquals("HONDA", tradeIn.getMake().getStandardCodeValue());
		assertEquals("CITI 1.6E", tradeIn.getModel().getStandardCodeValue());
		assertEquals("REG-66790", tradeIn.getRegistrationNo());
		assertEquals(new BigDecimal("300"), tradeIn.getTradeInDeposit());

		storedTradeIn = (TradeInInfo) dao.retrieve(tradeIn.getId(), ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);
		assertEquals(tradeIn, storedTradeIn);

		sec = secMsgBody.getSecurityDetail();
		sec.setCMSSecurityId(223344);

		msg = handler.persistStagingTrx(msg, null);

		secMsgBody = (SecurityMessageBody) msg.getMsgBody();
		asset = secMsgBody.getAssetDetail();
		tradeIns = asset.getTradeInInformation();
		tradeIn = (TradeInInfo) tradeIns.get(0);

		assertEquals(new Long(223344), tradeIn.getCmsCollateralId());
		assertEquals("MYR", tradeIn.getCurrencyCode());
		assertNotNull(tradeIn.getRefId());
		assertEquals("HONDA", tradeIn.getMake().getStandardCodeValue());
		assertEquals("CITI", tradeIn.getModel().getStandardCodeValue());
		assertEquals("REG-56789", tradeIn.getRegistrationNo());
		assertEquals(new BigDecimal("5000"), tradeIn.getTradeInValue());

		storedTradeIn = (TradeInInfo) dao.retrieve(tradeIn.getId(), ISecurityDao.ENTITY_NAME_STAGE_TRADE_IN);
		assertEquals(tradeIn, storedTradeIn);

		tradeIn = (TradeInInfo) tradeIns.get(1);

		assertEquals(new Long(223344), tradeIn.getCmsCollateralId());
		assertEquals("MYR", tradeIn.getCurrencyCode());
		assertNotNull(tradeIn.getRefId());
		assertEquals("HONDA", tradeIn.getMake().getStandardCodeValue());
		assertEquals("CITI 1.6E", tradeIn.getModel().getStandardCodeValue());
		assertEquals("REG-66790", tradeIn.getRegistrationNo());
		assertEquals(new BigDecimal("300"), tradeIn.getTradeInDeposit());

		storedTradeIn = (TradeInInfo) dao.retrieve(tradeIn.getId(), ISecurityDao.ENTITY_NAME_ACTUAL_TRADE_IN);
		assertEquals(tradeIn, storedTradeIn);
	}
}
