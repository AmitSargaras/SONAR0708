package com.integrosys.cms.host.eai.security.bus.others;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateOthersCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Others.hbm.xml" };
	}

	public void testStoreClubMebMembershipCollateral() {
		OthersSecurity membership = new OthersSecurity();
		membership.setCMSSecurityId(20080820000000011l);
		membership.setAssetDescription("Club Meb Membership Last for 2 years");
		
		Long id = (Long) getHibernateTemplate().save(membership);
		assertNotNull(id);
	}

}
