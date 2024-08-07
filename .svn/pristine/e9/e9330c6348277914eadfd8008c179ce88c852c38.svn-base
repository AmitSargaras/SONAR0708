<%
	boolean okayToShow = true;

%>

<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				java.lang.*,
				java.text.*,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


<%
	int i;
	int j;

	//this is to detect if it is triggered by server for synchroning data
	//server to send this value as "broadcastmessageserver" as per in console.properties
	//this is done by create_broadcast.jsp!
	String triggerAction = request.getParameter("trigger");
	if (triggerAction == null || "".equals(triggerAction.trim())) {
		triggerAction = "";
	}
	
	if (!triggerAction.equals("broadcastmessageserver")) {
		//wrong trigger used
		out.println("----------------- Broadcast access denied -----------------");
		return;
	}
	
	String requestAction = request.getParameter("action");
	if (requestAction == null || "".equals(requestAction.trim())) {
		requestAction = "";
	}
	//System.out.println("action: " + requestAction);

	String targetperson = request.getParameter("targetperson");
	if ((targetperson == null) || targetperson.equals(""))
	{
		targetperson = "";
	}
	//System.out.println("targetperson: " + targetperson);

	String messagetype = request.getParameter("messagetype");
	if ((messagetype == null) || messagetype.equals(""))
	{
		messagetype = "";
	}
	//System.out.println("messagetype: " + messagetype);

	String subjectText = request.getParameter("subject");
	if ((subjectText == null) || subjectText.equals(""))
	{
		subjectText = "";
	}
	//System.out.println("subject: " + subjectText);

	String message = request.getParameter("message");
	if ((message == null) || message.equals(""))
	{
		message = "";
	}
	//System.out.println("message: " + message);

	//must use the formattedDate sent over so that all servers are the same
	//otherwise delete will not work
	String formattedDate = request.getParameter("formattedDate");
	if ((formattedDate == null) || formattedDate.equals(""))
	{
		Date todaysDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		formattedDate = formatter.format(todaysDate);
		
	}
	//System.out.println("formattedDate: " + formattedDate);
	
	String delimiter = "|";	
	String broadcastMessage = formattedDate + delimiter + targetperson + delimiter + messagetype + delimiter + subjectText + delimiter + message;
	//System.out.println("storing broadcastMessage: " + broadcastMessage);

	HashMap bc_message = null;
	HashMap bc_message_viewed = null;

	bc_message = (HashMap) application.getAttribute("admin_broadcast");
	if (bc_message == null) {
		bc_message = new HashMap();
	}

	bc_message_viewed = (HashMap) application.getAttribute("admin_broadcast_viewed");
	if (bc_message_viewed == null) {
		bc_message_viewed = new HashMap();
	}

	if ("delete".equalsIgnoreCase(requestAction)) {
		System.out.println("\t[server] ************ delete selected messages ");

		synchronized (bc_message) 
		{
		    for (Enumeration enum1 = request.getParameterNames(); enum1.hasMoreElements();) 
		    {
				String parameterName = (String) enum1.nextElement();
				System.out.println("\t[server] " + parameterName + " -> " + request.getParameter(parameterName));

				String checkbox = request.getParameter(parameterName);
				if ("on".equalsIgnoreCase(checkbox)) {
					System.out.println("\t[server] ****** delete : " + parameterName);

					Object objbc = bc_message.remove(parameterName);
					Object objview = bc_message_viewed.remove(parameterName);
				}
		    }
		}
		out.println("----------------- Broadcast deleted -----------------");
	}
	else if ("purgeall".equalsIgnoreCase(requestAction)) {
		System.out.println("\t[server] ************ purge all messages ");

		synchronized (bc_message) 
		{
			bc_message.clear();
			bc_message_viewed.clear();

			application.setAttribute("admin_broadcast", bc_message);
			application.setAttribute("admin_broadcast_viewed", bc_message_viewed);
		}
		out.println("----------------- Broadcast purged -----------------");
	}
	else if ("create".equalsIgnoreCase(requestAction)) {

		synchronized (bc_message) 
		{
			bc_message.put(formattedDate, broadcastMessage);
			bc_message_viewed.put(formattedDate, new String(""));

			application.setAttribute("admin_broadcast", bc_message);
			application.setAttribute("admin_broadcast_viewed", bc_message_viewed);
		}
		out.println("----------------- Broadcast created -----------------");
	}
	

%>


<%
	if (okayToShow)
	{
%>

<html>

<head>
<title>Broadcast Message (Server Triggered)</title>
<%@ include file="/console/console_include.jsp" %>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Broadcast Messages (Server Triggered)</strong></td>
  </tr>
</table><br>


<center>
	<table class="sortable draggable" id="broadcast" width="50%">
		<thead>
		  <tr>
<%

			StringBuffer headerString = new StringBuffer ();
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Delete" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Key" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "To" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Priority" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Subject" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Message" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Viewed By" + "</th>");
			out.println(headerString);

			out.println("			  </tr>");
			out.println("			</thead>");
			out.println("			<tbody>");

			Collection c = bc_message.values();
			Iterator itr = c.iterator();

			j = 0;
			while (itr.hasNext()) {		
				String broadcast_Message = (String) itr.next();
				List messageList = splitList(broadcast_Message, delimiter);

				Iterator messageListItr = messageList.iterator();

				String allowedViewer = "";
				String messageKey = "";
				String priority = "";
				String subject = "";
				String fullmessage = "";
				int count;

				count = 0;
				while (messageListItr.hasNext()) {
					if (count == 0) messageKey = (String) messageListItr.next();
					if (count == 1) allowedViewer = (String) messageListItr.next();
					if (count == 2) priority = (String) messageListItr.next();
					if (count == 3) subject = (String) messageListItr.next();
					if (count == 4) fullmessage = (String) messageListItr.next();

					count++;
				}

				StringBuffer resultString = new StringBuffer ();
				resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");

				resultString.append("<td>" + "<center><INPUT TYPE=CHECKBOX NAME='" + messageKey + "'></center>");

				resultString.append("<td>" + messageKey + "</td>");
				resultString.append("<td>" + allowedViewer + "</td>");
				if ("critical".equalsIgnoreCase(priority)) {
					resultString.append("<td><font color='red'>" + priority + "</font></td>");
				} else if ("warning".equalsIgnoreCase(priority)) {
					resultString.append("<td><font color='#aa9900'>" + priority + "</font></td>");
				} else {
					resultString.append("<td><font color='#00cc00'>" + priority + "</font></td>");
				}
				resultString.append("<td>" + subject + "</td>");
				resultString.append("<td>" + fullmessage + "</td>");
				resultString.append("<td><center>" + formatText((String)bc_message_viewed.get(messageKey)) + "</center></td>");

				resultString.append("</tr>");
	        	out.println(resultString);
				
				j++;
			}

%>
		</tbody>
	</table>

	<%	if (j > 0) { %>

	<%	} 
		else {
			out.println("<font color='red'><strong>There are no broadcast message(s) found</strong></font>");
		}
	%>
</center>


<%
	}	//okayToShow
%>

