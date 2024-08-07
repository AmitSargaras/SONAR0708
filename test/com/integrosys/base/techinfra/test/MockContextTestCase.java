package com.integrosys.base.techinfra.test;

import java.util.Properties;

import javax.ejb.EJBHome;
import javax.ejb.EJBLocalHome;
import javax.ejb.EJBLocalObject;
import javax.ejb.EJBObject;
import javax.ejb.EnterpriseBean;
import javax.ejb.EntityBean;
import javax.ejb.SessionBean;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import junit.framework.TestCase;

import org.apache.commons.lang.Validate;
import org.mockejb.EntityBeanDescriptor;
import org.mockejb.MockContainer;
import org.mockejb.SessionBeanDescriptor;
import org.mockejb.interceptor.Aspect;
import org.mockejb.interceptor.AspectSystem;
import org.mockejb.interceptor.AspectSystemFactory;
import org.mockejb.jndi.MockContextFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.propertyfile.PropertyManager;

/**
 * <p>
 * Base Test Case to use Mock Context, it allows to bind EJB or even any object.
 * Context will be taken care by MockEJB container.
 * 
 * <p>
 * Mock Container shouldn't be created in subclass. Sub classes should use the
 * covenient method to deal with MockContainer, Context, and AspectSystem
 * 
 * <p>
 * Consider to use {@link #deploy(String, Object)} to bind any object into
 * context which the mock container will take care of it. This allow us to bind
 * DataSource object into context for ease of unit testing.
 * 
 * <p>
 * Sequencer to be used in Entity Bean will be taken care by
 * {@link com.integrosys.base.techinfra.dbsupport.MockSequencer}.
 * 
 * @author Chong Jun Yong
 * @since 1.1
 * @see #deploy(EntityBeanDescriptor)
 * @see #deploy(SessionBeanDescriptor)
 * @see #deploy(String, Object)
 * @see #get(String)
 * @see #addAspect(Aspect)
 */
public abstract class MockContextTestCase extends TestCase {

	/** logger available for subclasses */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	private transient MockContainer mockContainer;

	private transient Context context;

	private transient AspectSystem aspectSystem;

	public final void setUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		Properties prop = PropertyManager.getProperty();
		prop.put("DefaultSequencerClass", "com.integrosys.base.techinfra.dbsupport.MockSequencer");

		System.setProperty("mockejb.entity.database", "com.integrosys.base.techinfra.test.EnhancedEntityDatabaseImpl");

		aspectSystem = AspectSystemFactory.getAspectSystem();

		MockContextFactory.setAsInitial();
		context = new InitialContext();

		mockContainer = new MockContainer(context);

		onSetUp();
	}

	/**
	 * To be initialized after {@link #setUp()} called. If super class has been
	 * overrides this method, please call super class {@link #onSetUp()} in the
	 * overriden method of this.
	 * 
	 * @throws Exception if there is any error happen internally
	 */
	protected void onSetUp() throws Exception {
	}

	/**
	 * Look up object deployed into MockContainer, normally lookup Home object
	 * 
	 * @param jndiName the jndi name of EJB
	 * @return the EJB Object
	 */
	public Object get(String jndiName) {
		try {
			return context.lookup(jndiName);
		}
		catch (Throwable t) {
			fail("fail to look up object with jndi name: [" + jndiName + "]");
		}

		return null;
	}

	/**
	 * Deploy entity bean into MockContainer
	 * 
	 * @param entityBeanDescriptor bean descriptor for entity bean
	 * @throws Exception normally is NamingException, shouldn't be the case
	 * @see org.mockejb.EntityBeanDescriptor
	 */
	public void deploy(EntityBeanDescriptor entityBeanDescriptor) throws Exception {
		assertTrue("'mockContainer' must not be null, has the #setUp been called ?", mockContainer != null);

		Class beanClass = entityBeanDescriptor.getBeanClass();
		Validate.isTrue((EntityBean.class.isAssignableFrom(beanClass)), "bean class [" + beanClass
				+ "] is not an instance of Entity Bean.");

		mockContainer.deploy(entityBeanDescriptor);
	}

	/**
	 * Deploy session bean into MockContainer
	 * 
	 * @param sessionBeanDescriptor bean descriptor for session bean
	 * @throws Exception normally is NamingException, shouldn't be the case
	 * @see org.mockejb.SessionBeanDescriptor
	 */
	public void deploy(SessionBeanDescriptor sessionBeanDescriptor) throws Exception {
		assertTrue("'mockContainer' must not be null, has the #setUp been called ?", mockContainer != null);

		Class beanClass = sessionBeanDescriptor.getBeanClass();
		Validate.isTrue((SessionBean.class.isAssignableFrom(beanClass)), "bean class [" + beanClass
				+ "] is not an instance of Session Bean.");

		mockContainer.deploy(sessionBeanDescriptor);
	}

	/**
	 * Deploy enterprise bean into mock container
	 * 
	 * @param jndiName jndi name of the enterprise bean, normally is home's name
	 * @param ejbHomeClass ejb home class, either remote or local
	 * @param ejbInterfaceClass ejb interface class, either remote or local
	 * @param ejbBeanClass entity bean or session bean class
	 */
	public void deploy(String jndiName, Class ejbHomeClass, Class ejbInterfaceClass, Class ejbBeanClass)
			throws Exception {
		if (!EnterpriseBean.class.isAssignableFrom(ejbBeanClass)) {
			fail("'ejbBeanClass' [" + ejbBeanClass + "] it's not an ejb enterprise bean.");
		}

		if (!EJBHome.class.isAssignableFrom(ejbHomeClass) && !EJBLocalHome.class.isAssignableFrom(ejbHomeClass)) {
			fail("'ejbHomeClass' [" + ejbHomeClass + "] it's not an ejb home object.");
		}

		if (!EJBObject.class.isAssignableFrom(ejbInterfaceClass)
				&& !EJBLocalObject.class.isAssignableFrom(ejbInterfaceClass)) {
			fail("'ejbInterfaceClass' [" + ejbInterfaceClass + "] it's not an ejb object interface object");
		}

		if (SessionBean.class.isAssignableFrom(ejbBeanClass)) {
			SessionBeanDescriptor sessionBeanDescriptor = new SessionBeanDescriptor(jndiName, ejbHomeClass,
					ejbInterfaceClass, ejbBeanClass);
			deploy(sessionBeanDescriptor);
		}
		else if (EntityBean.class.isAssignableFrom(ejbBeanClass)) {
			EntityBeanDescriptor entityBeanDescriptor = new EntityBeanDescriptor(jndiName, ejbHomeClass,
					ejbInterfaceClass, ejbBeanClass);
			deploy(entityBeanDescriptor);
		}
		else {
			fail("unknown ejb bean class : [" + ejbBeanClass + "]");
		}
	}

	/**
	 * Bind any object into context, such as DataSource. ease for unit testing.
	 * 
	 * @param jndiName jndi name of the object
	 * @param obj object that required binded into the context
	 */
	public void bind(String jndiName, Object obj) {
		try {
			this.context.rebind(jndiName, obj);
		}
		catch (NamingException e) {
			fail("failed to bind jndiName [" + jndiName + "], object [" + obj
					+ "] into mock container backed context. Details [" + e.getMessage() + "]");
		}
	}

	/**
	 * to add AOP's aspect into Aspect System, aspect normally intercept methods
	 * in EJB
	 * 
	 * @param aspect aspect to be added into aspect system
	 */
	public void addAspect(Aspect aspect) {
		assertTrue("'aspectSystem' must not be null, has the #setUp been called ?", aspectSystem != null);
		Validate.notNull(aspect, "'aspect' to be added into Aspect System must not be null.");

		aspectSystem.add(aspect);
	}

	/**
	 * @return mock context used in this test case
	 */
	public Context getMockContext() {
		assertTrue("'context' must not be null, has the #setUp been called ?", context != null);
		return context;
	}

	public MockContainer getMockContainer() {
		assertTrue("'mockContainer' must not be null, has the #setUp been called ?", mockContainer != null);
		return mockContainer;
	}
}
