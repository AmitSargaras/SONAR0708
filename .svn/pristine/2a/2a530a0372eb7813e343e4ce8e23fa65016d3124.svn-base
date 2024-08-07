package com.integrosys.cms.host.eai.limit.actualtrxhandler;

import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.base.techinfra.util.ReplicateUtils;
import com.integrosys.cms.host.eai.Message;
import com.integrosys.cms.host.eai.core.IEaiConstant;
import com.integrosys.cms.host.eai.limit.AAMessageBody;
import com.integrosys.cms.host.eai.limit.actualtrxhandler.LimitNonVariedInfoPopulatorHandler;
import com.integrosys.cms.host.eai.limit.bus.CMSTransaction;
import com.integrosys.cms.host.eai.limit.bus.LimitDaoImpl;
import com.integrosys.cms.host.eai.limit.bus.LimitGeneral;
import com.integrosys.cms.host.eai.limit.bus.LimitProfile;
import com.integrosys.cms.host.eai.limit.bus.Limits;

public class LimitNonVariedInfoPopulatorHandlerTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Limit.hbm.xml" };
	}

	public void testUpdateOneNonVariedLimitAndNoLimitInAAMessage() {
		// prepare test data
		LimitGeneral gen = new LimitGeneral();
		gen.setLOSAANumber("pre-12345");
		gen.setCmsLimitProfileId(9898798);
		gen.setStatus("ACTIVE");

		Long actualPk = (Long) getHibernateTemplate().save(IEaiConstant.ACTUAL_LIMIT_GENERAL, gen);

		LimitGeneral stage = (LimitGeneral) ReplicateUtils.replicateObject(gen, new String[] { "cmsLimitProfileId" });
		stage.setCmsLimitProfileId(9898799);
		Long stagePk = (Long) getHibernateTemplate().save(IEaiConstant.STAGE_LIMIT_GENERAL, stage);

		CMSTransaction trx = new CMSTransaction();
		trx.setReferenceID(actualPk.longValue());
		trx.setStageReferenceID(stagePk.longValue());
		trx.setTransactionType("LIMIT");

		getHibernateTemplate().save(trx);

		// prepare handler to be tested
		LimitDaoImpl dao = new LimitDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		LimitNonVariedInfoPopulatorHandler handler = new LimitNonVariedInfoPopulatorHandler();
		handler.setLimitDao(dao);

		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setCMSLimitProfileId(new Long(9898798));
		limitProfile.setLOSAANumber("post-12345");

		AAMessageBody msgBody = new AAMessageBody();
		msgBody.setLimitProfile(limitProfile);

		Message msg = new Message();
		msg.setMsgBody(msgBody);

		msg = handler.persistActualTrx(msg);

		// checking result
		List limits = dao.retrieveLimitsOnlyByCmsLimitProfileId(limitProfile.getCMSLimitProfileId());
		assertEquals(1, limits.size());

		LimitGeneral limitGeneral = (LimitGeneral) limits.get(0);
		assertEquals(actualPk, new Long(limitGeneral.getCmsId()));
		assertEquals("post-12345", limitGeneral.getLOSAANumber());

		LimitGeneral storedStage = (LimitGeneral) getHibernateTemplate().get(IEaiConstant.STAGE_LIMIT_GENERAL, stagePk);
		assertEquals("post-12345", storedStage.getLOSAANumber());
	}

	public void testUpdateOneVariedLimitAndSameLimitInAAMessage() {
		// prepare test data
		LimitGeneral gen = new LimitGeneral();
		gen.setLOSAANumber("pre-12345");
		gen.setCmsLimitProfileId(9898798);
		gen.setLOSLimitId("77888");
		gen.setStatus("ACTIVE");

		Long actualPk = (Long) getHibernateTemplate().save(IEaiConstant.ACTUAL_LIMIT_GENERAL, gen);

		LimitGeneral stage = (LimitGeneral) ReplicateUtils.replicateObject(gen, new String[] { "cmsLimitProfileId" });
		stage.setCmsLimitProfileId(9898799);
		Long stagePk = (Long) getHibernateTemplate().save(IEaiConstant.STAGE_LIMIT_GENERAL, stage);

		CMSTransaction trx = new CMSTransaction();
		trx.setReferenceID(actualPk.longValue());
		trx.setStageReferenceID(stagePk.longValue());
		trx.setTransactionType("LIMIT");

		getHibernateTemplate().save(trx);

		// prepare handler to be tested
		LimitDaoImpl dao = new LimitDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		LimitNonVariedInfoPopulatorHandler handler = new LimitNonVariedInfoPopulatorHandler();
		handler.setLimitDao(dao);

		LimitGeneral limitGeneral = new LimitGeneral();
		limitGeneral.setCMSLimitId(actualPk.longValue());
		limitGeneral.setLOSLimitId("77888");
		limitGeneral.setLOSAANumber("pre-12345");

		Limits limit = new Limits();
		limit.setLimitGeneral(limitGeneral);

		Vector msgLimits = new Vector(Arrays.asList(new Limits[] { limit }));

		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setCMSLimitProfileId(new Long(9898798));
		limitProfile.setLOSAANumber("post-12345");

		AAMessageBody msgBody = new AAMessageBody();
		msgBody.setLimitProfile(limitProfile);
		msgBody.setLimits(msgLimits);

		Message msg = new Message();
		msg.setMsgBody(msgBody);

		msg = handler.persistActualTrx(msg);

		// checking result
		List limits = dao.retrieveLimitsOnlyByCmsLimitProfileId(limitProfile.getCMSLimitProfileId());
		assertEquals(1, limits.size());

		LimitGeneral storedLimitGeneral = (LimitGeneral) limits.get(0);
		assertEquals(actualPk, new Long(storedLimitGeneral.getCmsId()));
		assertEquals("pre-12345", storedLimitGeneral.getLOSAANumber());

		LimitGeneral storedStage = (LimitGeneral) getHibernateTemplate().get(IEaiConstant.STAGE_LIMIT_GENERAL, stagePk);
		assertEquals("pre-12345", storedStage.getLOSAANumber());
	}
}
