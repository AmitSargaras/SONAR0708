package com.integrosys.base.techinfra.test;

import java.util.Properties;

import javax.sql.DataSource;

import junit.framework.TestCase;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hsqldb.jdbcDriver;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.LocalSessionFactoryBean;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * <p>
 * Customizable Hibernate Test Case to be used by JUnit Test Case.
 * 
 * <p>
 * Hibernate will use HSQLDB as DB. Subclass only need to implement
 * {@link #getMappingResources()} to return the Hibernate Mapping file to be
 * loaded into DB, it will help to create schema at the same time.
 * 
 * <p>
 * Sub class who using DAO which extends HibernateDaoSupport need to
 * setSessionFactory using SessionFactory return by {@link #getSessionFactory()}
 * 
 * <p>
 * Sub class can also consider to use HibernateTemplate instance by
 * {@link #getHibernateTemplate()}, as well as JdbcTemplate by
 * {@link #getJdbcTemplate()}
 * 
 * @author Chong Jun Yong
 * @since 1.1
 */
public abstract class CustomHibernateTestCase extends TestCase {

	private LocalSessionFactoryBean sessionFactoryBean;

	private HibernateTemplate hibernateTemplate;

	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		Log4jConfigTestPlugin.configure();

		sessionFactoryBean = new LocalSessionFactoryBean() {
			protected void postProcessConfiguration(Configuration config) throws HibernateException {
				doPostProcessConfiguration(config);
			}

			protected void postProcessMappings(Configuration config) throws HibernateException {
				doPostProcessMappings(config);
			}
		};

		sessionFactoryBean.setDataSource(createDataSource());

		Properties prop = new Properties();
		prop.put("hibernate.query.factory_class", "org.hibernate.hql.classic.ClassicQueryTranslatorFactory");
		prop.put("hibernate.hbm2ddl.auto", "create-drop");

		doPreSetHibernateProperties(prop);

		sessionFactoryBean.setHibernateProperties(prop);
		sessionFactoryBean.setMappingResources(getMappingResources());

		try {
			sessionFactoryBean.afterPropertiesSet();
		}
		catch (Throwable t) {
			fail("encounter exception [" + t.getClass().getName() + "] details [" + t.getMessage() + "]");
		}

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(createDataSource());

		doSetUp();
	}

	public final HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public final JdbcTemplate getJdbcTemplate() {
		return this.jdbcTemplate;
	}

	public final void tearDown() {
		// close session factory when test case is finished, useful when
		// different test case using the same table created with previous test
		// case
		getSessionFactory().close();
		doTearDown();
	}

	/**
	 * Sub class to override for the tear down of the test case
	 */
	protected void doTearDown() {
	}

	/**
	 * Sub class to override for the setup of the test case
	 */
	protected void doSetUp() {
	}

	/**
	 * Subclasses to override this method to achieve only certain hibernate
	 * mapping files are loaded
	 */
	protected abstract String[] getMappingResources();

	/**
	 * to be used by the subclasses, especially for class using or extend
	 * HibernateDaoSupport. Sub classes will eventually gain the ability to do
	 * CRUD on the HSQLDB
	 * 
	 * @return SessionFactory to be used by HibernateTemplate in
	 *         HibernateDaoSupport
	 */
	public final SessionFactory getSessionFactory() {
		return (SessionFactory) sessionFactoryBean.getObject();
	}

	/**
	 * Get the data source that being used by the session factory. Useful when
	 * pass it for Jdbc call. At most, can query the table created from
	 * {@link #getMappingResources()}.
	 * 
	 * @return data source used by session factory.
	 */
	public final DataSource getDataSource() {
		return sessionFactoryBean.getDataSource();
	}

	/**
	 * <p>
	 * To create a DataSource to be used by the session factory of this test
	 * case. Subclass to override it if required different datasource rather
	 * than default datasource which is connecting to in-memory HSQL.
	 * <p>
	 * Also, subclass <b>must</b> override
	 * {@link #doPreSetHibernateProperties(Properties)} for the dialect
	 * properties if this <tt>createDataSource</tt> is overriden.
	 * @return data source instance to be used by the session factory.
	 */
	protected DataSource createDataSource() {
		SimpleDriverDataSource ds = new SimpleDriverDataSource();
		ds.setDriverClass(jdbcDriver.class);
		ds.setUrl("jdbc:hsqldb:mem:los");
		ds.setUsername("sa");
		ds.setPassword("");

		return ds;
	}

	/**
	 * To set the properties to be used by the hibernate configuration, default
	 * is to set the <b>hibernate.dialect</b> properties, pointing to
	 * <b>org.hibernate.dialect.HSQLDialect</b>, conjunction with
	 * {@link #createDataSource()}.
	 * @param prop hibernate properties
	 */
	protected void doPreSetHibernateProperties(Properties prop) {
		prop.put("hibernate.dialect", "org.hibernate.dialect.HSQLDialect");
	}

	/**
	 * Sub class to do anything on the hibernate configuration, such as getting
	 * the <tt>org.hibernate.dialect.Dialect</tt>
	 */
	protected void doPostProcessConfiguration(Configuration cfg) {
	}

	protected void doPostProcessMappings(Configuration config) {
	}

}