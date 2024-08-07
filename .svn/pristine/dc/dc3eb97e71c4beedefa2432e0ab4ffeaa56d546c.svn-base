package com.integrosys.base.techinfra.test;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import junit.framework.TestCase;

import org.exolab.castor.mapping.Mapping;
import org.exolab.castor.mapping.MappingException;
import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;
import org.exolab.castor.xml.XMLContext;
import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * <p>
 * Base test case for castor's unmarshal and marshal testing.
 * <p>
 * Provide facility to add castor mapping without worry about the exception
 * thrown and also to retrieve the marshaller or unmarshaller instance which is
 * ready to be used for testing.
 * <p>
 * Steps to use this test case
 * <ol>
 * <li>Add the castor mapping file (to be found in classpath), via
 * {@link #addMapping(String)}, or any other <b>addMapping</b> methods.
 * <li>Execute marshal and unmarshal process using
 * {@link #execute(MarshallerAction)} or {@link #execute(UnmarshallerAction)}
 * <li>Validate the object or xml string returned
 * </ol>
 * @author Chong Jun Yong
 * 
 */
public abstract class CustomCastorMarshalUnmarshalTestCase extends TestCase {

	private XMLContext xmlContext;

	public final void setUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		xmlContext = new XMLContext();
		onSetUp();
	}

	/** To be processed after {@link #setUp()} has finished. */
	protected void onSetUp() throws Exception {
	}

	/**
	 * To create a unmarshaller and pass to 'action' supplied for further
	 * processing, the 'action' doesn't need to care about the exception thrown,
	 * this execute command will take care of it.
	 * @param action an action to do the actual process on unmarshaller passed
	 *        in.
	 * @return product of unmarshal (normally the object from xml)
	 */
	protected Object execute(UnmarshallerAction action) {
		Unmarshaller unmarshaller = createUnmarshaller();
		try {
			return action.doInUnmarshaller(unmarshaller);
		}
		catch (MarshalException ex) {
			fail("failed to unmarshall, nested exception " + ex);
		}
		catch (ValidationException ex) {
			fail("failed for xml validation, nested exception " + ex);
		}
		catch (IOException ex) {
			fail("failed for IO resource, nested exception " + ex);
		}
		return null;
	}

	/**
	 * To create a marshaller and pass to 'action' supplied for further
	 * processing, the 'action' doesn't need to care about the exception thrown,
	 * this execute command will take care of it.
	 * @param action an action to do the actual process on marshaller passed in.
	 * @return product from marshal action, normally the xml string.
	 */
	protected Object execute(MarshallerAction action) {
		Marshaller marshaller = createMarshaller();
		try {
			return action.doInMarshaller(marshaller);
		}
		catch (MarshalException ex) {
			fail("failed to marshall, nested exception " + ex);
		}
		catch (ValidationException ex) {
			fail("failed for xml validation, nested exception " + ex);
		}
		catch (IOException ex) {
			fail("failed for IO resource, nested exception " + ex);
		}
		return null;
	}

	/**
	 * Add the castor mapping resource (must be found in classpath) into this
	 * test case.
	 * @param classPathResource castor mapping resource class path
	 */
	protected void addMapping(String classPathResource) {
		try {
			addMapping(new ClassPathResource(classPathResource).getURL());
		}
		catch (IOException ex) {
			fail(classPathResource + " should be inside the classpath, nested exception " + ex);
		}
		catch (MappingException ex) {
			fail(classPathResource + " not a valid castor mapping file, nested exception " + ex);
		}
	}

	/**
	 * Add the castor mapping url object into this test case
	 * @param mapping castor mapping
	 */
	protected void addMapping(URL mappingUrl) throws MappingException {
		Mapping mapping = xmlContext.createMapping();
		try {
			mapping.loadMapping(mappingUrl);
			addMapping(mapping);
		}
		catch (IOException ex) {
			fail(mappingUrl + " is not found or not able to read, nested exception " + ex);
		}
	}

	/**
	 * Add the castor mapping input stream into this test case
	 * @param is input stream of castor mapping
	 */
	protected void addMapping(InputStream is) throws MappingException {
		Mapping mapping = xmlContext.createMapping();
		mapping.loadMapping(new InputSource(is));
		addMapping(mapping);
	}

	/**
	 * Add the castor mapping into this test case
	 * @param mapping castor mapping
	 */
	protected void addMapping(Mapping mapping) throws MappingException {
		xmlContext.addMapping(mapping);
	}

	/**
	 *Create a marshaller to be used to marshal an object
	 */
	protected Marshaller createMarshaller() {
		return xmlContext.createMarshaller();
	}

	/**
	 * Create a unmarshaller to be used to unmarshal xml string
	 */
	protected Unmarshaller createUnmarshaller() {
		return xmlContext.createUnmarshaller();
	}

	protected XMLContext getXmlContext() {
		return this.xmlContext;
	}

	/**
	 * Unmarshaller callback action to encapsulate all the exception to be
	 * thrown when doing unmarshal
	 */
	public interface UnmarshallerAction {
		/**
		 * To unmarshal the XML raw string to an object using the unmarshaller
		 * given, doesn't need to care about the exception thrown.
		 * @param unmarshaller unmarshaller to be used to unmarshal XML raw
		 *        string
		 * @return object unmarshalled from the XML raw String
		 * @throws MarshalException if there is any error when doing unmarshal
		 * @throws ValidationException if the xml got any validation error
		 * @throws IOException if there is any error on the IO stream
		 */
		public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
				IOException;
	}

	/**
	 * Marshaller callback action to encapsulate all the exception to be thrown
	 * when doing marshal
	 */
	public interface MarshallerAction {
		/**
		 * To marshal the java object to a possible XML string using the
		 * marshaller given, doesn't need to care about the exception thrown.
		 * @param marshaller marshaller to be used to marshal Java object
		 * @return XML raw string and stream after object marshalled
		 * @throws MarshalException if there is any error when doing marshal
		 * @throws ValidationException if the xml got any validation error
		 * @throws IOException if there is any error on the IO stream
		 */
		public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException, IOException;
	}
}
