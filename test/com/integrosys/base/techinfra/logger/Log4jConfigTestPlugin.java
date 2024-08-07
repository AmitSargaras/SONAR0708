package com.integrosys.base.techinfra.logger;

import java.net.URL;

import org.apache.log4j.xml.DOMConfigurator;

/**
 * <p>
 * Test Plugin to be used to setup log4j configuration. Basically calling
 * {@link org.apache.log4j.xml.DOMConfigurator#configure(java.net.URL)} to
 * configure the supplied log4j XML URL.
 * 
 * <p>
 * Method provided is in static, so just need to call directly.
 * 
 * <p>
 * Default log4j XML file name is <b><code>logging.xml</code></b> which must be
 * in the classpath. Or else can use {@link #configure(String)} to supply
 * different log4j XML.
 * 
 * @author Chong Jun Yong
 * @since 28.08.2008
 * 
 */
public class Log4jConfigTestPlugin {
	private final static String DEFAULT_LOG4J_XML_FILE_NAME = "logging.xml";

	/**
	 * to configure log4j using default <code>logging.xml</code>, this file must
	 * be located in classpath.
	 */
	public static void configure() {
		configure(DEFAULT_LOG4J_XML_FILE_NAME);
	}

	/**
	 * configure log4j using supplied file name, the file must be found in the
	 * classpath.
	 * 
	 * @param log4jXmlFileName the short file name of log4j xml
	 * @throws IllegalStateException if the file cannot be found.
	 */
	public static void configure(String log4jXmlFileName) {
		URL loggingXmlUrl = Thread.currentThread().getContextClassLoader().getResource(log4jXmlFileName);
		if (loggingXmlUrl == null) {
			throw new IllegalStateException("cannot find the file [" + log4jXmlFileName + "] in your classpath.");
		}

		DOMConfigurator.configure(loggingXmlUrl);
	}
}
