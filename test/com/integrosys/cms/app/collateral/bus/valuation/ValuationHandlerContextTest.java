package com.integrosys.cms.app.collateral.bus.valuation;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.test.AbstractSingleSpringContextTests;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * To test the valuation app context.
 * 
 * @author Chong Jun Yong
 * 
 */
public class ValuationHandlerContextTest extends AbstractSingleSpringContextTests {

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	protected String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml",
				"classpath:collateral/valuation/AppContext_DaoJdbc.xml",
				"classpath:collateral/valuation/AppContext_Logic.xml" };
	}

	public void testGetValuationHandlerFromContext() {
		ValuationHandler valuationHandler = (ValuationHandler) getApplicationContext().getBean("valuationHandler");
		assertNotNull(valuationHandler);
		assertNotNull(valuationHandler.getGenericValuationDao());
		assertFalse(valuationHandler.getValuationDaoMap().isEmpty());
		assertFalse(valuationHandler.getValuatorMap().isEmpty());

		logger.debug("output info about valuationHandler.getValuationDaoMap() <key, value>");
		Set entriesSet = valuationHandler.getValuationDaoMap().entrySet();
		for (Iterator entriesItr = entriesSet.iterator(); entriesItr.hasNext();) {
			Map.Entry entry = (Map.Entry) entriesItr.next();
			assertTrue(entry.getKey() instanceof String);
			assertTrue(entry.getValue() instanceof IValuationDAO);
			logger.debug("key [" + entry.getKey() + "], value class [" + entry.getValue().getClass() + "]");
		}

		logger.debug("output info about valuationHandler.getValuatorMap() <key, value>");
		Set valuatorEntriesSet = valuationHandler.getValuatorMap().entrySet();
		for (Iterator entriesItr = valuatorEntriesSet.iterator(); entriesItr.hasNext();) {
			Map.Entry entry = (Map.Entry) entriesItr.next();
			assertTrue(entry.getKey() instanceof String);
			assertTrue(entry.getValue() instanceof IValuator);
			logger.debug("key [" + entry.getKey() + "], value class [" + entry.getValue().getClass() + "]");
		}

	}
}
