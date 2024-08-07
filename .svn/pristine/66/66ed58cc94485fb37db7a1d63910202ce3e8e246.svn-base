package com.integrosys.base.businfra.authentication;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;

import junit.framework.TestCase;

import org.apache.commons.lang.time.DateUtils;
import org.easymock.MockControl;
import org.easymock.classextension.MockClassControl;

import com.ibm.as400.access.AS400;
import com.integrosys.base.businfra.login.AuthenticationException;
import com.integrosys.base.businfra.login.IPersistentBroker;
import com.integrosys.base.businfra.login.OBCredentials;
import com.integrosys.base.businfra.login.OBLoginInfo;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.component.login.app.OBLOSCustomer;
import com.integrosys.component.login.app.PersistentEntityType;

/**
 * Test case for the as400 authentication manager, AS400 system is proxied by
 * the cglib to achieve the testing.
 * 
 * @author Chong Jun Yong
 * 
 */
public class AS400AuthenticationManagerTest extends TestCase {

	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	public void testAuthenticationAndLoginAndUpdateLastLoginInfo() {
		Date todayDate = new Date();

		OBCredentials credential = new OBCredentials("CMS", "PASSWORD1", "CORP");
		credential.setRole("Admin");
		credential.setLastLoginIp("192.168.1.1");

		OBLOSCustomer loginCust = new OBLOSCustomer();
		loginCust.setLoginId(credential.getLoginId());
		loginCust.setRole(credential.getRole());

		OBLOSCustomer cust = new OBLOSCustomer();
		cust.setLoginId("CMS");
		cust.setStatus("ACTIVE");
		cust.setSessionExpiry("0");
		cust.setForcePasswordChange("false");
		cust.setLastLoginTime(DateUtils.addHours(todayDate, -10));
		cust.setLastLogoutTime(DateUtils.addHours(todayDate, -8));
		cust.setLoginAttempts("2");

		MockControl brokerControl = MockControl.createControl(IPersistentBroker.class);
		IPersistentBroker mockBroker = (IPersistentBroker) brokerControl.getMock();
		mockBroker.retrieve(loginCust, PersistentEntityType.LOS_USER);
		brokerControl.setDefaultReturnValue(cust);
		mockBroker.update(cust, PersistentEntityType.LOS_USER);
		brokerControl.setVoidCallable();
		brokerControl.replay();

		MockControl as400Control = MockClassControl.createControl(AS400.class);
		AS400 as400System = (AS400) as400Control.getMock();
		try {
			as400System.authenticate(credential.getLoginId(), credential.getClearTextPassword());
		}
		catch (Throwable t) {
			StringWriter sw = new StringWriter();
			t.printStackTrace(new PrintWriter(sw));
			fail("failed to authenticate, due to " + t);
		}
		as400Control.setReturnValue(true);
		as400Control.replay();

		AS400AuthenticationManager as400AuthManager = new AS400AuthenticationManager();
		as400AuthManager.setAs400system(as400System);
		as400AuthManager.setPersistentBroker(mockBroker);

		try {
			OBLoginInfo loginInfo = (OBLoginInfo) as400AuthManager.authenticateAndLogin(credential);
			assertEquals("CMS", loginInfo.getLoginId());
			assertFalse(loginInfo.getForcePasswordChange());
			assertEquals(DateUtils.addHours(todayDate, -10), loginInfo.getLastLoginTime());
		}
		catch (AuthenticationException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			fail("failed to authenticate credential, due to [" + sw.toString() + "]");
		}

		// the most interested part, to check whether cust retrieve from broker
		// is get updated
		assertTrue(DateUtils.isSameDay(cust.getLastLoginTime(), todayDate));
		assertEquals("0", cust.getLoginAttempts());
		assertEquals("192.168.1.1", cust.getLastLoginIp());

		brokerControl.verify();
		as400Control.verify();
	}
}
