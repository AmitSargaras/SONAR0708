package com.integrosys.cms.app.customer.bus;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.easymock.MockControl;

import com.integrosys.base.techinfra.dbsupport.MockDataSourceTestPlugin;
import com.integrosys.base.techinfra.test.MockContextTestCase;

public class CustomerDAOTest extends MockContextTestCase {

	MockDataSourceTestPlugin mockDataSourceTestPlugin;

	public void onSetUp() throws Exception {
		mockDataSourceTestPlugin = new MockDataSourceTestPlugin(getMockContext());
	}

	public void testGetJointBorrowerList() throws Exception {
		MockControl statementControl = mockDataSourceTestPlugin.getStatementControl();

		MockControl resultSetControl = mockDataSourceTestPlugin.getResultSetControl();

		ResultSet mockResultSet = mockDataSourceTestPlugin.getMockResultSet();

		PreparedStatement mockStatement = mockDataSourceTestPlugin.getMockStatement();

		mockResultSet.close();
		resultSetControl.setDefaultVoidCallable();
		mockResultSet.next();
		resultSetControl.setReturnValue(true);
		mockResultSet.next();
		resultSetControl.setReturnValue(false);
		mockResultSet.getLong("CMS_LE_SUB_PROFILE_ID");
		resultSetControl.setReturnValue(12345l);
		mockResultSet.getString("LSP_SHORT_NAME");
		resultSetControl.setReturnValue("INTEGRO", 2);
		mockResultSet.getString("LSP_LE_ID");
		resultSetControl.setReturnValue("INT-12345");
		mockResultSet.getString("LMP_INC_NUM_TEXT");
		resultSetControl.setReturnValue("INT-12345-2002-J");

		mockStatement.setObject(1, "1000");
		statementControl.setDefaultVoidCallable();
		mockStatement.close();
		statementControl.setDefaultVoidCallable();
		mockStatement.executeQuery();
		statementControl.setDefaultReturnValue(mockDataSourceTestPlugin.getMockResultSet());
		mockStatement.getWarnings();
		statementControl.setDefaultReturnValue(null);

		mockDataSourceTestPlugin.getMockConnection().close();
		mockDataSourceTestPlugin.getConnectionControl().setDefaultVoidCallable();

		mockDataSourceTestPlugin.replay();

		CustomerDAO customerDao = new CustomerDAO();

		List jointBorrowerList = customerDao.getJointBorrowerList(1234l);
		assertNotNull(jointBorrowerList);
		OBCMSCustomer customer = (OBCMSCustomer) jointBorrowerList.get(0);
		assertEquals(12345l, customer.getCustomerID(), 0);
		assertEquals("INTEGRO", customer.getCustomerName());

		ICMSLegalEntity entity = customer.getCMSLegalEntity();
		assertEquals("INTEGRO", entity.getLegalName());
		assertEquals("INT-12345", entity.getLEReference());
		assertEquals("INT-12345-2002-J", entity.getLegalRegNumber());

		mockDataSourceTestPlugin.verify();
	}

}