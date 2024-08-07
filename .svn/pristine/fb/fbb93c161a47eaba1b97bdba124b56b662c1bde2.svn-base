package com.integrosys.cms.host.eai.security.bus.guarantee;

import org.springframework.beans.BeanUtils;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateGuaranteeCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Guarantee.hbm.xml" };
	}

	public void testStorePersonalGuarantee() {
		GuaranteeSecurity guarantee = new GuaranteeSecurity();
		guarantee.setCMSSecurityId(2008082000000055l);
		guarantee.setBeneficiaryName("David Finn");
		guarantee.setGuaranteeAmt(new Double(2000000d));
		guarantee.setCurrency("SGD");
		guarantee.setRefNo("PG-DAV-000001");
		guarantee.setSecuredAmount(new Double(22.33));
		guarantee.setUnsecuredAmount(new Double(55.22));
		guarantee.setSecuredPercentage(new Integer(11));
		guarantee.setUnsecuredPercentage(new Integer(55));

		Long id = (Long) getHibernateTemplate().save(guarantee);
		assertNotNull(id);
		GuaranteeSecurity storedGuarantee = (GuaranteeSecurity) getHibernateTemplate().get(GuaranteeSecurity.class, id);
		assertEquals(new Integer(11), storedGuarantee.getSecuredPercentage());
		assertEquals(new Integer(55), storedGuarantee.getUnsecuredPercentage());

		StageGuaranteeSecurity stageGuarantee = new StageGuaranteeSecurity();
		BeanUtils.copyProperties(guarantee, stageGuarantee);
		Long stageId = (Long) getHibernateTemplate().save(stageGuarantee);
		StageGuaranteeSecurity storedStageGuarantee = (StageGuaranteeSecurity) getHibernateTemplate().get(
				StageGuaranteeSecurity.class, stageId);
		assertEquals(new Integer(11), storedStageGuarantee.getSecuredPercentage());
		assertEquals(new Integer(55), storedStageGuarantee.getUnsecuredPercentage());
	}

}
