package com.integrosys.base.techinfra.test;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

/**
 * File loader to load .properties file. Provided mechanism to load from
 * classpath, or based spring resource naming convention, to get the property
 * file resource and load.
 * 
 * @author Chong Jun Yong
 * @see DefaultResourceLoader#getResource(String)
 */
public abstract class PropertyFlatFileLoader {
	/**
	 * Load .properties file from classpath.
	 * 
	 * @param filename the .properties file name, must be found in classpath
	 * @return properties instance which loaded all the properties in the file
	 *         supplied
	 * @throws IllegalStateException if there is any io exception raised during
	 *         loading
	 */
	public static Properties loadFromClassPath(String filename) throws IllegalStateException {
		Resource propertyFileResource = new ClassPathResource(filename);
		Properties properties = new Properties();
		try {
			properties.load(propertyFileResource.getInputStream());
		}
		catch (IOException e) {
			throw new IllegalStateException("failed to load properties file [" + filename
					+ "] from classpath, due to [" + e + "]");
		}

		return (Properties) properties.clone();
	}

	/**
	 * Load .properties file from spring resource naming covention. The path
	 * will be resolved by {@link DefaultResourceLoader#getResource(String)}.
	 * 
	 * @param filename the .properties file name, must be able to be resolved by
	 *        spring resource loader
	 * @return properties instance which loaded all the properties in the file
	 *         supplied
	 * @throws IllegalStateException if there is any io exception raised during
	 *         loading
	 */
	public static Properties loadFromPath(String location) throws IllegalStateException {
		ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

		Resource propertyFileResource = resourceLoader.getResource(location);
		Properties properties = new Properties();
		try {
			properties.load(propertyFileResource.getInputStream());
		}
		catch (IOException e) {
			throw new IllegalStateException("failed to load properties file [" + location + "] due to [" + e + "]");
		}

		return (Properties) properties.clone();
	}
}
