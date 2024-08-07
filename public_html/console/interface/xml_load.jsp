<%@ page import="com.integrosys.cms.host.mq.EAITester"%>
<%
    String file = request.getParameter("file");
    String loadType = request.getParameter("loadType");
    String xml = request.getParameter("xml");
    if (file != null && !"".equals(file)){
        System.out.println("Processing local server xml file : " + file);
        EAITester.processFile(file);
    }
    else 
    {
        System.out.println("Process direct xml file");
//        if (loadType.equals("receive"))
//        {
            EAITester.processXmlMsg(xml);
//        }
//        else if (loadType.equals("send"))
//        {
//            EAITester.testReceivedMessage(xml);
//        }
    }
        
%>
Done

