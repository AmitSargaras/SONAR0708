package com.integrosys.simulator.host.mq;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;
import com.integrosys.simulator.host.base.castor.CastorMessageIdBaseMessageMarshallerFactory;
import com.integrosys.simulator.host.base.castor.ISTPHeaderConstant;
import com.integrosys.simulator.host.base.castor.STPHeaderHelper;
import com.integrosys.simulator.host.transformer.TCPFixedLengthEncodeTransfomer;
import com.integrosys.simulator.host.transformer.TCPFixedLengthTransfomer;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import java.io.*;
import java.util.*;

/**
 * <p>
 * A object represent an EAI contents published from the source.
 * <p>
 * This message contains the header and the body. Header will be the same format
 * for different type of message, contains basic info such as publish type,
 * date, reference number, message type, id, etc.
 * <p>
 * Different message type will have different message body. Message body might
 * consist of various kind of domain objects or just an inquiry message which
 * required response back to source.
 * @author marvin
 * @author Chong Jun Yong
 * @author KC Chin
 * @since 1.0
 */
public abstract class AbstractMessageHandler implements Serializable, IMessageHandler {

	private static final long serialVersionUID = 4153797472016252171L;

    private static Map<String, String> mqMessageSettingMap = new HashMap<String, String>();

    private CastorMessageIdBaseMessageMarshallerFactory messageMarshallerFactory;

    private boolean dynamicResponse = false;

    private String messageId;
    private String recvObjMapping;
    private String respObjMapping;

    private String parentObjMessage;
    private String parentObjHeader;
    private String parentObjBody;

    private String recvObjMessage;
    private String recvObjHeader;
    private String recvObjBody;

    private String respObjMessage;
    private String respObjHeader;
    private String respObjBody;

    private String fixedResponseXML;

    List replicateList = new ArrayList();
    Map replaceArgMap = new HashMap();

    public static Map<String, String> getMqMessageSettingMap() {
        return mqMessageSettingMap;
    }

    public boolean isDynamicResponse() {
        return dynamicResponse;
    }

    public void setDynamicResponse(boolean dynamicResponse) {
        this.dynamicResponse = dynamicResponse;
    }

    public static void setMqMessageSettingMap(Map<String, String> mqMessageSettingMap) {
        AbstractMessageHandler.mqMessageSettingMap = mqMessageSettingMap;
    }

    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }

    public String getRecvObjMapping() {
        return recvObjMapping;
    }

    public void setRecvObjMapping(String recvObjMapping) {
        this.recvObjMapping = recvObjMapping;
    }

    public String getRespObjMapping() {
        return respObjMapping;
    }

    public void setRespObjMapping(String respObjMapping) {
        this.respObjMapping = respObjMapping;
    }

    public String getParentObjMessage() {
        return parentObjMessage;
    }

    public void setParentObjMessage(String parentObjMessage) {
        this.parentObjMessage = parentObjMessage;
    }

    public String getParentObjHeader() {
        return parentObjHeader;
    }

    public void setParentObjHeader(String parentObjHeader) {
        this.parentObjHeader = parentObjHeader;
    }

    public String getParentObjBody() {
        return parentObjBody;
    }

    public void setParentObjBody(String parentObjBody) {
        this.parentObjBody = parentObjBody;
    }

    public String getRecvObjMessage() {
        return recvObjMessage;
    }

    public void setRecvObjMessage(String recvObjMessage) {
        this.recvObjMessage = recvObjMessage;
    }

    public String getRecvObjHeader() {
        return recvObjHeader;
    }

    public void setRecvObjHeader(String recvObjHeader) {
        this.recvObjHeader = recvObjHeader;
    }

    public String getRecvObjBody() {
        return recvObjBody;
    }

    public void setRecvObjBody(String recvObjBody) {
        this.recvObjBody = recvObjBody;
    }

    public String getRespObjMessage() {
        return respObjMessage;
    }

    public void setRespObjMessage(String respObjMessage) {
        this.respObjMessage = respObjMessage;
    }

    public String getRespObjHeader() {
        return respObjHeader;
    }

    public void setRespObjHeader(String respObjHeader) {
        this.respObjHeader = respObjHeader;
    }

    public String getRespObjBody() {
        return respObjBody;
    }

    public void setRespObjBody(String respObjBody) {
        this.respObjBody = respObjBody;
    }

    public CastorMessageIdBaseMessageMarshallerFactory getMessageMarshallerFactory() {
        return messageMarshallerFactory;
    }

    public void setMessageMarshallerFactory(CastorMessageIdBaseMessageMarshallerFactory messageMarshallerFactory) {
        this.messageMarshallerFactory = messageMarshallerFactory;
    }

    public String getFixedResponseXML() {
        return fixedResponseXML;
    }

    public void setFixedResponseXML(String fixedResponseXML) {
        this.fixedResponseXML = fixedResponseXML;
    }

    public List getReplicateList() {
        return replicateList;
    }

    public void setReplicateList(List replicateList) {
        this.replicateList = replicateList;
    }

    public Map getReplaceArgMap() {
        return replaceArgMap;
    }

    public void setReplaceArgMap(Map replaceArgMap) {
        this.replaceArgMap = replaceArgMap;
    }

    /*
     * read the config/MQServices.xml, then load the correct setting base on messageId
     * then base on the argn to decide return good response xml or bad response xml
     */
    public void loadMessageSetting(String receivedString) throws IOException, JDOMException {

		String destinationPath = "";
		try {
			Properties properties = new Properties();
			properties.load(new FileInputStream(properties_file));
			String projectRoot = properties.getProperty(project_root);

			SAXBuilder saxBuilder = new SAXBuilder(false);

			Document configDocument = saxBuilder.build(projectRoot + host_service_file);

			Element rootElement = configDocument.getRootElement();
			Element rootTransactions = rootElement.getChild(xml_rt_transactions);

			// determine Is ASCII
			if ((rootTransactions.getChildren() != null) && (rootTransactions.getChildren().size() > 0)) {
				List<Element> elementServiceList = rootTransactions.getChildren();
				for (int i = 0; i < elementServiceList.size(); i++) {
					Element elementService = (Element) elementServiceList.get(i);
					System.out.println("[args] = " + elementService.getChildTextTrim(xml_rt_args));

                    messageId = STPHeaderHelper.getHeaderValue(receivedString, ISTPHeaderConstant.MESSAGE_ID);
                        // check matching on XML
                        if (messageId.equals(elementService.getChildTextTrim(xml_rt_messageId).trim())) {

                            parentObjMessage = elementService.getChildTextTrim(xml_rt_parentObjMessage);
                            parentObjHeader = elementService.getChildTextTrim(xml_rt_parentObjHeader);
                            parentObjBody = elementService.getChildTextTrim(xml_rt_parentObjBody);

                            respObjMapping = elementService.getChildTextTrim(xml_rt_respObjMapping);
                            respObjMessage = elementService.getChildTextTrim(xml_rt_respObjMessage);
                            respObjHeader = elementService.getChildTextTrim(xml_rt_respObjHeader);
                            respObjBody = elementService.getChildTextTrim(xml_rt_respObjBody);

                            recvObjMapping = elementService.getChildTextTrim(xml_rt_recvObjMapping);
                            recvObjMessage = elementService.getChildTextTrim(xml_rt_recvObjMessage);
                            recvObjHeader = elementService.getChildTextTrim(xml_rt_recvObjHeader);
                            recvObjBody = elementService.getChildTextTrim(xml_rt_recvObjBody);

                            String dynamicResponseString = elementService.getChildTextTrim(xml_rt_dynamicResponse);
                            if (dynamicResponseString == null || dynamicResponseString.trim().length() ==0
                                || dynamicResponseString.trim().toUpperCase().equals("N")) {
                                DefaultLogger.debug(this, "dynamicResponse is false");
                                dynamicResponse = false;
                            }else{
                                DefaultLogger.debug(this, "dynamicResponse is true");
                                dynamicResponse = true;
                            }

                            List replaceArgList = elementService.getChild(xml_rt_replaceArgs).getChildren();
                            if(replaceArgList == null || replaceArgList.size() == 0){
                                DefaultLogger.debug(this, "replaceArgList is null, no replace will be done");
                            }else{
                                for(Iterator a = replaceArgList.iterator(); a.hasNext();){
                                    Element arg = (Element) a.next();
                                    replaceArgMap.put(arg.getName(), arg.getValue());
                                }
                            }

                            List replicateArgList = elementService.getChild(xml_rt_replicateArgs).getChildren();
                            if(replicateArgList == null || replicateArgList.size() == 0){
                                 DefaultLogger.debug(this, "replicateArgList is null, no replicate will be done");
                            }else{
                                for(Iterator a = replicateArgList.iterator(); a.hasNext();){
                                    Element arg = (Element) a.next();
                                    replicateList.add(arg.getName());
                                }
                            }

                            // check argument match
                            List argList = elementService.getChild(xml_rt_args).getChildren();
                            boolean validateArg = true;
                            if(argList == null || argList.size() == 0){
                                DefaultLogger.debug(this, "argList is null, no matching will be done");
                            }else{
                                for(Iterator a = argList.iterator(); a.hasNext();){
                                    org.jdom.Element arg = (org.jdom.Element) a.next();
                                    String value = STPHeaderHelper.getHeaderValue(receivedString, arg.getName());
                                    if(value == null || value.trim().length()==0 || (!(value.equals(arg.getValue())))){
                                        validateArg = false;
                                        DefaultLogger.debug(this, "[Unmatch Argument Name] : "  + arg.getName() + ", [Expected value] : " +  arg.getValue() + ", [Actual value] : " + value);
                                        break;
                                    }
                                }
                            }

                            if (validateArg) {
                                destinationPath = projectRoot + elementService.getChildTextTrim(xml_rt_output_dir)
                                        + "/" + elementService.getChildTextTrim(xml_rt_dest);
                                DefaultLogger.debug(this, "Response file read from : " + destinationPath);
                                fixedResponseXML = readfile(destinationPath);
                            }
                            else {
                                destinationPath = projectRoot + elementService.getChildTextTrim(xml_rt_output_dir)
                                        + "/" + elementService.getChildTextTrim(xml_rt_badDest);
                                DefaultLogger.debug(this, "Response file read from : " + destinationPath);
                                fixedResponseXML = readfile(destinationPath);
                            }
                        break;
					}
				}
			}
			else {
                DefaultLogger.debug(this, "Cant read XML ! Configure the node!!!!");
				throw new IllegalArgumentException("Cant read XML ! Configure the node!!!!");
			}

		}catch (IOException e) {
            DefaultLogger.debug(this, "Fail to read file", e);
			e.printStackTrace();
			throw e;
		}catch(JDOMException e){
            DefaultLogger.debug(this, "Fail to read xnl format", e);
           	e.printStackTrace();
			throw e;
        }
	}

    public String readfile(String inputDir) throws IOException {
		File f = new File(inputDir);
		InputStream is = null;

		StringBuffer buffer = new StringBuffer();
		String line = null;

		try {
			is = new FileInputStream(f);
			BufferedReader in = new BufferedReader(new InputStreamReader(is));
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}
		}catch (IOException e) {
			throw new IOException("Cannot read the file !!!!! Please put the rigth file into right directory");
		}finally {
			try {
				if (is != null) {
					is.close();
					is = null;
				}
			}catch (IOException e) {
				throw new IOException("Cannot read the file !!!!! Please put the rigth file into right directory");
			}
		}
		return buffer.toString();
	}

    protected String marshall(String messageId, Object obj)throws Exception{
        DefaultLogger.debug(this, "marshall : " + messageId);
        if(getMessageMarshallerFactory().getMessageIdMarshallerMap().get(getMessageId())==null){
            getMessageMarshallerFactory().generateMarshall(getMessageId(), getRecvObjMapping());
        }
        return getMessageMarshallerFactory().marshall(messageId, obj);
    }

    protected Object unmarshall(String xml)throws Exception{
        DefaultLogger.debug(this, "unmarshall : " + xml);
        if(getMessageMarshallerFactory().getMessageIdUnmarshallerMap().get(getMessageId())==null){
            getMessageMarshallerFactory().generateUnmarshall(getMessageId(), getRecvObjMapping());
        }
        return getMessageMarshallerFactory().unmarshall(xml);
    }
}