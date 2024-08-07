package com.integrosys.cms.host.eai.security.bus.marketable;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateMarketableCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-MarketableSec.hbm.xml" };
	}

	public void testStorePortfolio() {
		MarketableSecurity marketable = new MarketableSecurity();
		marketable.setCMSSecurityId(20080820000000002l);

		Long id = (Long) getHibernateTemplate().save(marketable);
		assertEquals(new Long(20080820000000002l), id);

		PortfolioItem portfolio = new PortfolioItem();
		portfolio.setCollateralId(id.longValue());

		StandardCode type = new StandardCode();
		type.setStandardCodeValue("STOCK");

		portfolio.setType(type);
		portfolio.setISINCode("INT-0000-0001");
		portfolio.setRIC("INT.SG.0001");
		portfolio.setUnits(new Long(1000000l));
		portfolio.setUnitPrice(new Double(0.23));
		portfolio.setStockCode("INTG");
		portfolio.setStockExchange("SGX");
		portfolio.setStockExchangeCountry("SG");

		Long portfolioId = (Long) getHibernateTemplate().save(portfolio);
		assertNotNull(portfolioId);

		PortfolioItem storedPortfolio = (PortfolioItem) getHibernateTemplate().get(PortfolioItem.class, portfolioId);
		assertNotNull(storedPortfolio);
		assertEquals("INTG", storedPortfolio.getStockCode());
		assertEquals("STOCK", storedPortfolio.getType().getStandardCodeValue());
	}

}
