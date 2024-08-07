package com.integrosys.cms.host.eai.security.bus.document;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateDocumentCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Document.hbm.xml" };
	}

	public void testStoreDocumentCollateral() {
		DocumentSecurity document = new DocumentSecurity();
		document.setCMSSecurityId(20080820000000001l);
		document.setDocumentAmount(new Double(2000000d));
		document.setDocumentAmtCcy("SGD");
		document.setDocumentDescription("Agreement on Renting House");
		document.setDocumentReferenceNo("COU-RENT-00001");
		document.setMaximumAmt(new Double(1900000d));
		document.setMaximumAmtCcy("SGD");
		document.setMinimumAmt(new Double(1500000d));
		document.setMinimumAmtCcy("SGD");

		Long id = (Long) getHibernateTemplate().save(document);
		assertEquals(new Long(20080820000000001l), id);
	}

}
