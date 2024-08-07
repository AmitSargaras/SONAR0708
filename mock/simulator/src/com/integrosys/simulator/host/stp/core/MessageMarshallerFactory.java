package com.integrosys.simulator.host.stp.core;

import com.integrosys.simulator.host.base.castor.FileSystemAccessException;
import com.integrosys.simulator.host.base.castor.XmlMappingException;

/**
 * Message marshaller factory to unmarshal (XML to Object) and marshal (Object
 * to XML)
 *
 * @author Chong Jun Yong
 * @author KC Chin
 *
 */
public interface MessageMarshallerFactory {

	public Object unmarshall(String rawMessage) throws XmlMappingException, FileSystemAccessException;

	public String marshall(String messageId, Object object) throws XmlMappingException, FileSystemAccessException;
}