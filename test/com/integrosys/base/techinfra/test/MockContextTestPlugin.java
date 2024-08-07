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

import org.apache.commons.lang.Validate;
import org.mockejb.EntityBeanDescriptor;
import org.mockejb.MockContainer;
import org.mockejb.SessionBeanDescriptor;
import org.mockejb.interceptor.Aspect;
import org.mockejb.interceptor.AspectSystem;
import org.mockejb.interceptor.AspectSystemFactory;
import org.mockejb.jndi.MockContextFactory;

import com.integrosys.base.techinfra.propertyfile.PropertyManager;

/**
 * <p>
 * Base Test Case Plugin to use Mock Context, it allows to bind EJB or even any
 * object. Context will be taken care by MockEJB container.
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
public abstract class MockContextTestPlugin {

	private transient static MockContainer mockContainer;

	private transient static Context context;

	private transient static AspectSystem aspectSystem;

	private transient static boolean isInitialized;

	public static void init() {
		if (!isInitialized) {
			Properties prop = PropertyManager.getProperty();
			prop.put("DefaultSequencerClass", "com.integrosys.base.techinfra.dbsupport.MockSequencer");

			System.setProperty("mockejb.entity.database",
					"com.integrosys.base.techinfra.test.EnhancedEntityDatabaseImpl");

			aspectSystem = AspectSystemFactory.getAspectSystem();

			try {
				MockContextFactory.setAsInitial();
				context = new InitialContext();
			}
			catch (Throwable t) {
				IllegalStateException ise = new IllegalStateException(
						"encounter error when setting up initial context.");
				ise.initCause(t);
				throw ise;
			}

			mockContainer = new MockContainer(context);
			isInitialized = true;
		}
	}

	/**
	 * Look up object deployed into MockContainer, normally lookup Home object
	 * 
	 * @param jndiName the jndi name of EJB
	 * @return the EJB Object
	 */
	public static Object get(String jndiName) {
		init();
		try {
			return context.lookup(jndiName);
		}
		catch (Throwable t) {
			IllegalStateException ise = new IllegalStateException("fail to look up object with jndi name: [" + jndiName
					+ "]");
			ise.initCause(t);
			throw ise;
		}
	}

	/**
	 * Deploy entity bean into MockContainer
	 * 
	 * @param entityBeanDescriptor bean descriptor for entity bean
	 * @throws Exception normally is NamingException, shouldn't be the case
	 * @see org.mockejb.EntityBeanDescriptor
	 */
	public static void deploy(EntityBeanDescriptor entityBeanDescriptor) {
		init();

		Class beanClass = entityBeanDescriptor.getBeanClass();
		Validate.isTrue((EntityBean.class.isAssignableFrom(beanClass)), "bean class [" + beanClass
				+ "] is not an instance of Entity Bean.");

		try {
			mockContainer.deploy(entityBeanDescriptor);
		}
		catch (NamingException e) {
			IllegalStateException ise = new IllegalStateException("fail to bind object with jndi name: ["
					+ entityBeanDescriptor.getJndiName() + "]");
			ise.initCause(e);
			throw ise;
		}
	}

	/**
	 * Deploy session bean into MockContainer
	 * 
	 * @param sessionBeanDescriptor bean descriptor for session bean
	 * @throws Exception normally is NamingException, shouldn't be the case
	 * @see org.mockejb.SessionBeanDescriptor
	 */
	public static void deploy(SessionBeanDescriptor sessionBeanDescriptor) {
		init();

		Class beanClass = sessionBeanDescriptor.getBeanClass();
		Validate.isTrue((SessionBean.class.isAssignableFrom(beanClass)), "bean class [" + beanClass
				+ "] is not an instance of Session Bean.");

		try {
			mockContainer.deploy(sessionBeanDescriptor);
		}
		catch (NamingException e) {
			IllegalStateException ise = new IllegalStateException("fail to bind object with jndi name: ["
					+ sessionBeanDescriptor.getJndiName() + "]");
			ise.initCause(e);
			throw ise;
		}
	}

	/**
	 * Deploy enterprise bean into mock container
	 * 
	 * @param jndiName jndi name of the enterprise bean, normally is home's name
	 * @param ejbHomeClass ejb home class, either remote or local
	 * @param ejbInterfaceClass ejb interface class, either remote or local
	 * @param ejbBeanClass entity bean or session bean class
	 */
	public static void deploy(String jndiName, Class ejbHomeClass, Class ejbInterfaceClass, Class ejbBeanClass) {
		if (!EnterpriseBean.class.isAssignableFrom(ejbBeanClass)) {
			throw new IllegalStateException("'ejbBeanClass' [" + ejbBeanClass + "] it's not an ejb enterprise bean.");
		}

		if (!EJBHome.class.isAssignableFrom(ejbHomeClass) && !EJBLocalHome.class.isAssignableFrom(ejbHomeClass)) {
			throw new IllegalStateException("'ejbHomeClass' [" + ejbHomeClass + "] it's not an ejb home object.");
		}

		if (!EJBObject.class.isAssignableFrom(ejbInterfaceClass)
				&& !EJBLocalObject.class.isAssignableFrom(ejbInterfaceClass)) {
			throw new IllegalStateException("'ejbInterfaceClass' [" + ejbInterfaceClass
					+ "] it's not an ejb object interface object");
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
			throw new IllegalStateException("unknown ejb bean class : [" + ejbBeanClass + "]");
		}
	}

	/**
	 * Bind any object into context, such as DataSource. ease for unit testing.
	 * 
	 * @param jndiName jndi name of the object
	 * @param obj object that required binded into the context
	 */
	public static void bind(String jndiName, Object obj) {
		init();
		try {
			context.rebind(jndiName, obj);
		}
		catch (NamingException e) {
			IllegalStateException ise = new IllegalStateException("fail to bind object with jndi name: [" + jndiName
					+ "]");
			ise.initCause(e);
			throw ise;
		}
	}

	/**
	 * to add AOP's aspect into Aspect System, aspect normally intercept methods
	 * in EJB
	 * 
	 * @param aspect aspect to be added into aspect system
	 */
	public static void addAspect(Aspect aspect) {
		init();
		Validate.notNull(aspect, "'aspect' to be added into Aspect System must not be null.");

		aspectSystem.add(aspect);
	}

	/**
	 * @return mock context used in this test case
	 */
	public static Context getMockContext() {
		init();

		return context;
	}

	public static MockContainer getMockContainer() {
		init();

		return mockContainer;
	}

}
