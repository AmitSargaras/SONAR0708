<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				java.lang.*,
				java.text.*,
				java.net.URLDecoder,
				java.net.URLEncoder,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.util.HttpUrlUtils,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


<%

	boolean syncBCMessageEnabled = PropertyManager.getBoolean("console.broadcastmessage.sync.enabled", false);
	System.out.println("****** Sync broadcast message enabled: " + syncBCMessageEnabled);
	
%>


<html>

<head>
<title>Broadcast Message</title>
<%@ include file="/console/console_include.jsp" %>

<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/AjaxRequest.js"></script>

<script type="text/javascript">

	function getBroadcastMessage(formobj)
	{
		var currVal = "";

		if (document.all||document.getElementById) 
		{
			var isError = 0;
			var msgError = "Required information missing:\n";

			var aTarget = "";
			var targetobj = formobj.elements["targetperson"];
			if (targetobj.value != "" && targetobj.value != null)
				aTarget = "targetperson=" + targetobj.value;
			else
				{ msgError += "\n - To is required"; if(isError == 0) isError = 1; }

			var aMessageType = "";
			var messagetypeobj = formobj.elements["messagetype"];
			if (messagetypeobj.value != "" && messagetypeobj.value != null)
				aMessageType = "&messagetype=" + messagetypeobj.value;
			else
				{ msgError += "\n - Message type is needed"; if(isError == 0) isError = 2; }

			var aSubject = "";
			var subjectobj = formobj.elements["subject"];
			if (subjectobj.value != "" && subjectobj.value != null)
				aSubject = "&subject=" + subjectobj.value;
			else
				{ msgError += "\n - Subject is needed"; if(isError == 0) isError = 3; }

			var aMessage = "";
			var messageobj = formobj.elements["message"];
			if (messageobj.value != "" && messageobj.value != null)
				aMessage = "&message=" + messageobj.value;
			else
				{ msgError += "\n - Message is needed"; if(isError == 0) isError = 4; }

			if (isError >= 1) {
				alert(msgError);

				if (isError == 1) formobj.targetperson.focus();
				else if (isError == 2) formobj.messagetype.focus();
				else if (isError == 3) formobj.subject.focus();
				else if (isError == 4) formobj.message.focus();
				return false;
			}
			else {
				//formobj.elements["subject"].value = encodeURI(formobj.elements["subject"].value);
				//formobj.elements["message"].value = encodeURI(formobj.elements["message"].value);
				formobj.submit();
			}
		}
		return true;
	}

	function applyTemplate()
	{
		critMsg = "We regret to inform that the production servers will be shut down for 30 minutes. This is needed because a critical patch needs to be applied urgently.<br><br>We need to remind you that the schedule downtime is from 20:00 hours to 20:30 hours<br><br>Sorry for any inconvenience caused.";
		document.createform.message.value = critMsg;

		document.createform.subject.value = "Critical Maintenance Needed";
	}	
</script>


<%

	
	int i;
	int j;

	String requestAction = request.getParameter("action");
	if (requestAction == null || "".equals(requestAction.trim())) {
		requestAction = "";
	}

	String targetperson = request.getParameter("targetperson");
	if ((targetperson == null) || targetperson.equals(""))
	{
		targetperson = "SA_MAKER";
	}
	//System.out.println("targetperson: " + targetperson);

	String messagetype = request.getParameter("messagetype");
	if ((messagetype == null) || messagetype.equals(""))
	{
		messagetype = "notification";
	}
	//System.out.println("messagetype: " + messagetype);

	String subjectText = request.getParameter("subject");
	if ((subjectText == null) || subjectText.equals(""))
	{
		subjectText = "Broadcast Message";
	}
	//System.out.println("subject: " + subjectText);

	String message = request.getParameter("message");
	if ((message == null) || message.equals(""))
	{
		message = "Put in the broadcast message here.";
	}
	//System.out.println("message: " + message);

	Date todaysDate = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	String formattedDate = formatter.format(todaysDate);
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

	String deleteListString = "";
	if ("delete".equalsIgnoreCase(requestAction)) {
		System.out.println("************ delete selected messages ");

		synchronized (bc_message) 
		{
		    for (Enumeration enum1 = request.getParameterNames(); enum1.hasMoreElements();) 
		    {
				String parameterName = (String) enum1.nextElement();
				System.out.println(parameterName + " -> " + request.getParameter(parameterName));

				String checkbox = request.getParameter(parameterName);
				if ("on".equalsIgnoreCase(checkbox)) {

					if (syncBCMessageEnabled == false) {
						System.out.println("****** local delete : " + parameterName);

						Object objbc = bc_message.remove(parameterName);
						Object objview = bc_message_viewed.remove(parameterName);

					} else {

						deleteListString += "&" + parameterName + "=on";
					}
				}
		    }
		}
	}
	else if ("purgeall".equalsIgnoreCase(requestAction) && !syncBCMessageEnabled) {
		System.out.println("************ purge all messages ");

		synchronized (bc_message) 
		{
			bc_message.clear();
			bc_message_viewed.clear();

			application.setAttribute("admin_broadcast", bc_message);
			application.setAttribute("admin_broadcast_viewed", bc_message_viewed);
		}
	}
	else if ("create".equalsIgnoreCase(requestAction) && !syncBCMessageEnabled) {
		System.out.println("************ create message ");

		synchronized (bc_message) 
		{
			bc_message.put(formattedDate, broadcastMessage);
			bc_message_viewed.put(formattedDate, new String(""));

			application.setAttribute("admin_broadcast", bc_message);
			application.setAttribute("admin_broadcast_viewed", bc_message_viewed);
		}
	}

	String triggerStatusFormString;
	String triggerAjaxString;
	
	triggerStatusFormString = "";
	triggerAjaxString = "";

	if (syncBCMessageEnabled)
	{
		if (!"".equalsIgnoreCase(requestAction))
		{
			String applicationList = PropertyManager.getValue("console.broadcastmessage.applicationlist", "").trim();
			if ("".equals(applicationList))
				System.out.println("   ***** No Application List provided, using default");
			else
				System.out.println("   ***** Application List: " + applicationList);

			String[] applist;
			List tempAppList = splitList(applicationList, delimiter);
			Iterator applistItr = tempAppList.iterator();

			if (tempAppList.size() == 0) {
				//no app is set up, so need to use the default : for backward compatible to CommonCodeEntryUtil.java
				applist = new String [1];
				applist[0] = "";		
			}
			else {
				int appcount;
				
				appcount = 0;
				applist = new String [tempAppList.size()];
				while (applistItr.hasNext())
				{
					String tempApp = (String) applistItr.next();
					applist[appcount++] = tempApp;
				}
			}

			//triggerStatusFormString = "<p style='font-family:verdana;font-size:9px;'>" + "<form action='/' name='ajaxform' method='post'>";
			out.println("<script>");

			String serverResponseFront = "----------------- Broadcast ";
			String serverResponseEnd = " -----------------";

			HttpUrlUtils serverFiring;
			serverFiring = new HttpUrlUtils();
			
			String serverFiringResult;
			int svrcount;

			for (int app = 0; app < applist.length; app++)
			{
				System.out.println("      ##### appid: " + (app+1) + "/" + applist.length + "  name: [" + applist[app] + "]");
				String currentApp = ("".equals(applist[app])) ? "" : ("." + applist[app]);
				String urlContext = PropertyManager.getValue("console.broadcastmessage.urlcontextpath" + currentApp, "/cms/console/monitor/create_broadcast.jsp").trim();
				System.out.println("      ##### " + "console.broadcastmessage.urlcontextpath" + currentApp + ": " + urlContext);
				String serverList = PropertyManager.getValue("console.broadcastmessage.serverlist" + currentApp, "localhost:7001").trim();
				System.out.println("      ##### " + "console.broadcastmessage.serverlist" + currentApp + ": " + serverList);
				boolean useHttps = PropertyManager.getBoolean("console.broadcastmessage.useHttps" + currentApp, false);
				System.out.println("      ##### " + "console.broadcastmessage.useHttps" + currentApp + ": " + useHttps);
				String protocal = useHttps ? "https://" : "http://";

				triggerStatusFormString += "<strong>Application: </strong><font color='blue'>" + (("".equals(currentApp)) ? "Default" : currentApp) + "</font><br>";
				triggerStatusFormString += "<table>";

				List svrlist = splitList(serverList, delimiter);
				Iterator svrlistItr = svrlist.iterator();

				svrcount = 0;
				while (svrlistItr.hasNext()) {
					String tempSvr = (String) svrlistItr.next();

					if (tempSvr != null) {
						String firstParameter = (urlContext.indexOf("?") != -1) ? "&" : "?";

						String URL = protocal + tempSvr.trim() + urlContext;
						//System.out.println("$$$$$$$$$ " + URL);

					/*
						out.println("function getQueuedResponse" + svrcount + "(target) {");
						out.println("	AjaxRequest.get(");
						out.println("		{");
						out.println("		  'url': '" + URL + "'");
						out.println("		  ,'parameters': { 'trigger':'broadcastmessageserver', 'action':'" + requestAction + "', 'targetperson':'" + targetperson + "', 'messagetype':'" + messagetype + "', 'subject':'" + subjectText + "', 'message':'" + message + "' }");
						out.println("		  ,'onLoading': function(req){ target.value += ' ' + req.xmlHttpRequest.readyState; }");
						out.println("		  ,'onLoaded': function(req){ target.value += ' ' + req.xmlHttpRequest.readyState; }");
						out.println("		  ,'onInteractive': function(req){ target.value += ' ' + req.xmlHttpRequest.readyState; }");
						out.println("		  ,'onSuccess': function(req){ target.value += ' ' + req.xmlHttpRequest.readyState; }");
						out.println("		}");
						out.println("	);");
						out.println("}");
						out.println("");
					*/

						//server firing
						serverFiringResult = "";

						try {
							String serverURL;

							if ("create".equalsIgnoreCase(requestAction)) {
								serverURL = protocal + tempSvr.trim() + urlContext + firstParameter 
											+ "trigger=broadcastmessageserver" + "&action=" + requestAction
											+ "&formattedDate=" + formattedDate 
											+ "&targetperson=" + targetperson + "&messagetype=" + messagetype
											+ "&subject=" + URLEncoder.encode(subjectText) + "&message=" + URLEncoder.encode(message);
							} else {
								serverURL = protocal + tempSvr.trim() + urlContext + firstParameter 
											+ "trigger=broadcastmessageserver" + "&action=" + requestAction
											+ "&formattedDate=" + formattedDate 
											+ deleteListString;
							}
							System.out.println("\t >>>>" + serverURL);

							serverFiringResult = serverFiring.processURL(serverURL);
						}
						catch (Exception e) {
							serverFiringResult = "#### Error occurred: "  + e.getMessage();
							System.out.println("\t\t " + serverFiringResult);
						}

						triggerAjaxString += "getQueuedResponse" + svrcount + "(formObj.elements[" + svrcount + "]);";

						//triggerStatusFormString += "&nbsp;&nbsp;&nbsp;&nbsp;Server " + (svrcount+1) + ": " + tempSvr + " <INPUT READONLY TYPE='text' NAME='input" + svrcount + "' VALUE='' size='50'><br>";

						//System.out.println(serverFiringResult.substring(serverFiringResult.indexOf(serverResponseFront), serverFiringResult.lastIndexOf(serverResponseEnd)+serverResponseEnd.length()));
						//System.out.println(serverFiringResult.indexOf(serverResponseFront));
						//System.out.println(serverFiringResult.lastIndexOf(serverResponseEnd)+ " len: " + serverResponseEnd.length());
						
						String serverFiringResultActual;
						if (serverFiringResult.indexOf(serverResponseFront) < 0) {
							//if response cannot find pattern, just use it
							if (serverFiringResult.indexOf("#### Error occurred: ") >= 0) {
								serverFiringResultActual = "<font color='red'>";
								serverFiringResultActual += serverFiringResult;
								serverFiringResultActual += "</font>";
							}
							else {
								serverFiringResultActual = "<font color='red'>";
								serverFiringResultActual += "Unknown response";
								serverFiringResultActual += "</font>";
							}
						} else {
							if (serverFiringResult.lastIndexOf(serverResponseEnd)+serverResponseEnd.length() > serverFiringResult.length()) {
								//if patterns found and within size of response, get a substring
								serverFiringResultActual = "<font color='green'>";
								serverFiringResultActual += serverFiringResult.substring(serverFiringResult.indexOf(serverResponseFront), serverFiringResult.length());
								serverFiringResultActual += "</font>";
							} else {
								//take only the patterns needed
								serverFiringResultActual = "<font color='green'>";
								serverFiringResultActual = serverFiringResult.substring(serverFiringResult.indexOf(serverResponseFront), serverFiringResult.lastIndexOf(serverResponseEnd)+serverResponseEnd.length());
								serverFiringResultActual += "</font>";
							}
						}

						triggerStatusFormString += "<tr style='font-family:verdana;font-size:9px;'>";
						triggerStatusFormString += "<td>&nbsp;&nbsp;&nbsp;&nbsp;Server " + (svrcount+1) + ": " + tempSvr + "</td>";
						triggerStatusFormString += "<td>" + serverFiringResultActual + "</td></tr>";
						triggerStatusFormString += "</tr>";

					}

					svrcount++;
				}

			}

			out.println("</script>");

			triggerStatusFormString += "</table>";
			//triggerStatusFormString += "</form></p>";

		}
	}
	
%>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Broadcast Messages To Users Currently Online</strong></td>
  </tr>
</table><br>

<center>

<form method="post">
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
				resultString.append("<td>" + URLDecoder.decode(subject) + "</td>");
				resultString.append("<td>" + URLDecoder.decode(fullmessage) + "</td>");
				resultString.append("<td><center>" + formatText((String)bc_message_viewed.get(messageKey)) + "</center></td>");

				resultString.append("</tr>");
	        	out.println(resultString);
				
				j++;
			}

%>
		</tbody>
	</table>
	<input type="hidden" name="action" value="delete" />

	<%	if (j > 0) { %>
		<input type="submit" value=" Delete "/>
	<%	} 
		else {
			out.println("<font color='red'><strong>There are no broadcast message(s) found</strong></font>");
		}
	%>

</form>

<form name="createform" onSubmit="getBroadcastMessage(this); return false;" method="post" class="niceform">
<table>
	<tr class="odd">
		<td class="fieldname" width="120">
			<b><strong>To</strong></b>
		</td>
		<td align="left">
			<select name="targetperson" size="1">
				<option value='' >Please Select</option>
				<option value='*'>Everyone Online</option>

<% 

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

    try {

		String queryStr = "select s.login_id, s.user_id, user_name, employee_id, position, department, organisation, country from cms_user_session usr, cms_user s, cms_authentication ca where (usr.user_id = s.user_id) and (s.login_id = ca.login_id)";
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

		while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			StringBuffer resultString = new StringBuffer ();
			//for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			//{
				resultString.append("<option value='" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(1)) + "'" + ">" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(3)) + " - " + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(4)) + "</option>");
			//}
			out.println(resultString);
		}
%>


<%
    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'><b>Exception OCCURRED: </b></font><br>" + e.getMessage());

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    
%>

			</select>
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			<strong>Message Type</strong>
		</td>
		<td align="left">
			<select name="messagetype" size="1">
				<option value="" >Please Select</option>
				<option value="critical" <%= messagetype.equals("critical") ? "selected": "" %> >Critical</option>
				<option value="warning" <%= messagetype.equals("warning") ? "selected": "" %> >Warning</option>
				<option value="notification" <%= messagetype.equals("notification") ? "selected": "" %> >Notification</option>
			</select>
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname" width="120">
			<strong>Subject</strong>
		</td>
		<td align="left">
			<input type="text" name="subject" size="70" maxlength="255" value="<%= subjectText %>" />
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname" width="120">
			<strong>Message</strong>
		</td>
		<td align="left">
			<textarea name="message" id="message" rows="6" cols="65" ><%= message %></textarea>
		</td>
	</tr>
	<tr class="odd">
		<td class="fieldname">
			&nbsp;
		</td>
		<td>
			<input type="hidden" name="action" value="create" />
			<input type="submit" value=" Broadcast "/>
			
			<a href="javascript:applyTemplate()">Template</a>
		</td>
	</tr>
</table>
</form>	

			<form method="post">
			<a href="create_broadcast.jsp"><img src="<%=request.getContextPath()%>/img/refresh1.gif" border="0"></a>
			<input type="hidden" name="action" value="purgeall" />
			<input type="submit" value=" Purge All Messages "/>
			</form>

</center>

<br>

<%
	if (!"".equalsIgnoreCase(requestAction)) {
		out.println(triggerStatusFormString);
	}

%>


<script>
if (document.getElementById("createform")) 
{
	formObj = document.getElementById("createform");
	formObj.elements["subject"].value = decodeURI(formObj.elements["subject"].value);
	formObj.elements["message"].value = decodeURI(formObj.elements["message"].value);
}

if (document.getElementById("ajaxform")) 
{
	formObj = document.getElementById("ajaxform");
<%
	//out.println(triggerAjaxString);
%>

}
</script>

