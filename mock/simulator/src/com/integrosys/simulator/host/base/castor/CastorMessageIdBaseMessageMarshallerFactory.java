package com.integrosys.simulator.host.base.castor;


import com.integrosys.base.techinfra.logger.DefaultLogger;
import org.exolab.castor.mapping.Mapping;
import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Implementation of using castor routine, the
 * XML mapping resource to process unmarshalling/marshalling is based on the
 * <b>message id</b> of the message, either in raw xml form or Object objet
 * form.
 *
 * @author Chong Jun Yong
 * @author KC Chin
 *
 */
public class CastorMessageIdBaseMessageMarshallerFactory implements com.integrosys.simulator.host.stp.core.MessageMarshallerFactory {

    public CastorMessageIdBaseMessageMarshallerFactory(){
        messageIdMarshallerMap = new HashMap();
        messageIdUnmarshallerMap = new HashMap();
    }

	private Map messageIdMarshallerMap;

	private Map messageIdUnmarshallerMap;

    public void generateMarshall(String messageId, String mappingPath)throws Exception{
        Marshaller marshall = new Marshaller();
        Mapping mapping = new Mapping();
        URL fileNameUrl = CastorMessageIdBaseMessageMarshallerFactory.class.getResource(mappingPath);
        mapping.loadMapping(fileNameUrl);
        marshall.setMapping(mapping);

         getMessageIdMarshallerMap().put(messageId, marshall);
    }
    public void generateUnmarshall(String messageId, String mappingPath)throws Exception{
        Unmarshaller unmarshall = new Unmarshaller();
        Mapping mapping = new Mapping();
        URL fileNameUrl = CastorMessageIdBaseMessageMarshallerFactory.class.getResource(mappingPath);
        mapping.loadMapping(fileNameUrl);
        unmarshall.setMapping(mapping);

         getMessageIdUnmarshallerMap().put(messageId, unmarshall);
    }

   	/**
	 * <p>
	 * The preconfigured marshaller to be used to marshall the Object to XML
	 * String.
	 * <p>
	 * Key is the message id of the Message object, value is the marshaller
	 * instance.
	 *
	 * @param messageIdMarshallerMap message id - marshaller map
	 */
	public void setMessageIdMarshallerMap(Map messageIdMarshallerMap) {
		this.messageIdMarshallerMap = messageIdMarshallerMap;
	}

	/**
	 * <p>
	 * The preconfigured unmarshaller to be used to unmarshall the XML string to
	 * Message Object that going to be processed.s
	 * <p>
	 * Key is the message id of the Message object, value is the unmarshaller
	 * instance.
	 *
	 * @param //messageIdMarshallerMap message id - unmarshaller map
	 */
	public void setMessageIdUnmarshallerMap(Map messageIdUnmarshallerMap) {
		this.messageIdUnmarshallerMap = messageIdUnmarshallerMap;
	}

    public Map getMessageIdMarshallerMap() {
        return messageIdMarshallerMap;
    }

    public Map getMessageIdUnmarshallerMap() {
        return messageIdUnmarshallerMap;
    }

    public String marshall(String messageId, Object obj) throws XmlMappingException, FileSystemAccessException {
        
		synchronized (this.messageIdMarshallerMap) {
			Marshaller marshaller = (Marshaller) this.messageIdMarshallerMap.get(messageId);

			if (marshaller == null) {
                DefaultLogger.error(this, "failed to find marshaller for message id [" + messageId + "]");
				throw new FileSystemAccessException("failed to find marshaller for message id [" + messageId + "]");
			}

			try {
				StringWriter sw = new StringWriter();
				marshaller.setWriter(sw);
                marshaller.marshal(obj);
                
				return sw.toString();
			}
			catch (IOException ex) {
                DefaultLogger.error(this, "failed to set XML serializer as document handler", ex);
				throw new FileSystemAccessException("failed to set XML serializer as document handler", ex);
			}
			catch (MarshalException ex) {
                DefaultLogger.error(this, "failed to marshall message object [\" + obj + \"] to XML", ex);
				throw new MarshallingFailureException("failed to marshall message object [" + obj + "] to XML",
						ex);
			}
			catch (ValidationException ex) {
                DefaultLogger.error(this, "the message object supplied [" + obj + "] doesn't tally with the one in marshaller [" + marshaller + "]", ex);
				throw new MarshallingFailureException("the message object supplied [" + obj
						+ "] doesn't tally with the one in marshaller [" + marshaller + "]", ex);
			}
		}
	}

	public Object unmarshall(String rawMessage) throws XmlMappingException, FileSystemAccessException {
		String messageId = STPHeaderHelper.getHeaderValue(rawMessage, ISTPHeaderConstant.MESSAGE_ID);

		synchronized (this.messageIdUnmarshallerMap) {
			Unmarshaller unmarshaller = (Unmarshaller) this.messageIdUnmarshallerMap.get(messageId);

			if (unmarshaller == null) {
                DefaultLogger.error(this, "failed to find marshaller for message id [" + messageId + "]");
				throw new FileSystemAccessException("failed to find unmarshaller for message id [" + messageId + "]");
			}

			try {
				return unmarshaller.unmarshal(new StringReader(rawMessage));
			}
			catch (MarshalException ex) {
                DefaultLogger.error(this, "failed to unmarshall message stream to message object", ex);
				throw new UnmarshallingFailureException("failed to unmarshall message stream to message object", ex);
			}
			catch (ValidationException ex) {
                DefaultLogger.error(this, "the message stream supplied [" + rawMessage + "] doesn't tally with the one in unmarshaller [" + unmarshaller + "]", ex);
				throw new UnmarshallingFailureException("the message stream supplied [" + rawMessage
						+ "] doesn't tally with the one in unmarshaller [" + unmarshaller + "]", ex);
			}
		}
	}
}