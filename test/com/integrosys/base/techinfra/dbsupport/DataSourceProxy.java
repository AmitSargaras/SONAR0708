package com.integrosys.base.techinfra.dbsupport;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;

import javax.sql.DataSource;

/**
 * <p>
 * DataSource proxy, which {@link DataSource#getConnection()} in turn is also
 * giving a Connection Proxy. The Connection Proxy {@link Connection#close()} is
 * suppressed in the case that if connection is undergoing a transaction.
 * 
 * <p>
 * Can be used to do integration test the Jdbc Dao, which using {@link DBUtil}.
 * 
 * <p>
 * The integration test case, consider to extends
 * {@link org.springframework.test.AbstractTransactionalSpringContextTests}, and
 * give the context file having data source constructed.
 * 
 * @author Chong Jun Yong
 * @see #getProxy()
 */
public class DataSourceProxy {
	private transient DataSource targetDataSource;

	/**
	 * The only constructor to supplied target data source that will be proxied
	 * 
	 * @param dataSource the data source that will be proxied
	 */
	public DataSourceProxy(DataSource dataSource) {
		if (dataSource == null) {
			throw new IllegalArgumentException("datasource object supplied must not be null");
		}

		this.targetDataSource = dataSource;
	}

	/**
	 * @return the data source proxy which connection returned also a connection
	 *         proxy, target data source will be data source supplied via the
	 *         constructor
	 */
	public DataSource getProxy() {
		DataSource dataSourceProxy = (DataSource) Proxy.newProxyInstance(DataSource.class.getClassLoader(),
				new Class[] { DataSource.class }, new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("getConnection")) {
							Connection con = targetDataSource.getConnection();
                            con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
                            return (Connection) Proxy.newProxyInstance(Connection.class.getClassLoader(),
									new Class[] { Connection.class }, new CloseSuppressingInvocationHandler(con));
						}

						try {
							Object retVal = method.invoke(targetDataSource, args);

							return retVal;
						}
						catch (InvocationTargetException ex) {
							throw ex.getTargetException();
						}
					}
				});

		return dataSourceProxy;
	}

	/**
	 * Invocation handler that suppresses close calls on JDBC Connections.
	 * @see java.sql.Connection#close()
	 */
	private class CloseSuppressingInvocationHandler implements InvocationHandler {

		private final Connection target;

		public CloseSuppressingInvocationHandler(Connection target) {
			this.target = target;
		}

		public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

			if (method.getName().equals("equals")) {
				// Only consider equal when proxies are identical.
				return (proxy == args[0] ? Boolean.TRUE : Boolean.FALSE);
			}
			else if (method.getName().equals("hashCode")) {
				// Use hashCode of PersistenceManager proxy.
				return new Integer(System.identityHashCode(proxy));
			}
			else if (method.getName().equals("close")) {
				// Handle close method: suppress, not valid.
				return null;
			}

			// Invoke method on target Connection.
			try {
				Object retVal = method.invoke(this.target, args);

				return retVal;
			}
			catch (InvocationTargetException ex) {
				throw ex.getTargetException();
			}
		}
	}
}
