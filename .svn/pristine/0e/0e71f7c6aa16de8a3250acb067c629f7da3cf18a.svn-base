package com.integrosys.simulator.host.mq;

import com.integrosys.simulator.host.stp.STPBody;
import com.integrosys.simulator.host.stp.STPHeader;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * @author KC Chin
 *
 */

public interface IMessageHandler {

	public static final String properties_file = "build.properties";

	public static final String project_root = "project.root";

	public static final String host_service_file = File.separator + "config" + File.separator + "MQServices.xml";

	public static final String xml_rt_start = "start";

	public static final String xml_rt_type = "type";

	public static final String xml_rt_transactions = "transactions";

	public static final String xml_rt_args = "args";

    public static final String xml_rt_replaceArgs = "replaceArgs";

    public static final String xml_rt_replicateArgs = "replicateArgs";

	public static final String xml_rt_messageId = "messageId";

	public static final String xml_rt_output_dir = "output_dir";

	public static final String xml_rt_parentObjMessage = "parentObjMessage";

    public static final String xml_rt_parentObjHeader = "parentObjHeader";

    public static final String xml_rt_parentObjBody = "parentObjBody";

    public static final String xml_rt_recvObjMessage = "recvObjMessage";

    public static final String xml_rt_recvObjHeader = "recvObjHeader";

    public static final String xml_rt_recvObjBody = "recvObjBody";

    public static final String xml_rt_respObjMessage = "respObjMessage";

    public static final String xml_rt_respObjHeader = "respObjHeader";

    public static final String xml_rt_respObjBody = "respObjBody";

    public static final String xml_rt_recvObjMapping = "recvObjMapping";

    public static final String xml_rt_respObjMapping = "respObjMapping";

	public static final String xml_rt_dest = "dest";

	public static final String xml_rt_badDest = "badDest";

	public static final String xml_rt_tag = "tag";

	public static final String xml_rt_endTag = "endTag";

	public static final String xml_rt_dynamicResponse = "dynamicResponse";

    public Object process(Object obj)throws Exception;

    public void loadMessageSetting(String receivedString) throws Exception;

    public boolean isDynamicResponse();

    public String getMessageId();

    public String getRecvObjMapping();

    public String getRespObjMapping();

    public String getParentObjMessage();

    public String getParentObjHeader();

    public String getParentObjBody();

    public String getRecvObjMessage();

    public String getRecvObjHeader();

    public String getRecvObjBody();

    public String getRespObjMessage();

    public String getRespObjHeader();

    public String getRespObjBody();

    public String getFixedResponseXML();

    public Map getReplaceArgMap();

    public List getReplicateList();

}