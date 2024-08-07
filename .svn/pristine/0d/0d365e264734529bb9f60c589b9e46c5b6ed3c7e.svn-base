<%@ include file="/template/charset_template.jsp" %>

<%@ page import = "com.integrosys.base.techinfra.propertyfile.PropertyManager,
                   com.integrosys.base.techinfra.logger.DefaultLogger,
                   com.integrosys.base.uiinfra.common.Constants,
                   com.integrosys.base.uiinfra.exception.AccessDeniedException,
				   java.util.*,
				   java.text.*,
				   java.lang.*,
                   com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<html>
<head>

<%@ include file="/template/stylesheet_template.jsp" %>

<STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 15px; PADDING-TOP: 0px; moz-user-select: none
}

BODY {
	FONT: 11px Verdana, Arial, Helvetica, sans-serif;overflow: auto;
}
</STYLE>


<script language="JavaScript" type="text/javascript">
<!--
window.onload = function() {

var divTag = 'DIV';

	if (document.all) {
		divElement = document.all.tags(divTag);
	} else if (document.getElementsByTagName) {
		divElement = document.getElementsByTagName(divTag);
	}

	//alert(divElement.length);
	if (divElement.length < 1) {
		if (parent.win_broadcast) {
			parent.win_broadcast.close();
		}
	}
}
//-->
</script>

</head>

<BODY bgcolor="#ffffff">

<%!
	public List splitList(String listStr, String separator) {
		List menu = new ArrayList();
		if (listStr != null)
		{
			StringTokenizer st = new StringTokenizer(listStr, separator);
			while (st.hasMoreTokens()) {
				menu.add(st.nextToken());
			}
		}
		return menu;
	}
%>


<%

	String onlineUserid = (String) session.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID);
	//System.out.println("**** userid: " + onlineUserid);

	HashMap bc_message = (HashMap) application.getAttribute("admin_broadcast");
	//System.out.println("**** bc_message: " + bc_message);

	HashMap bc_message_viewed = (HashMap) application.getAttribute("admin_broadcast_viewed");	
	//System.out.println("**** bc_message_viewed: " + bc_message_viewed);
	
	String delimiter = "|";
	String notViewList = "";

	if (bc_message != null) {
		Collection c = bc_message.values();
		Collection c_viewed = bc_message_viewed.values();
		Iterator itr = c.iterator();
		Iterator itr_viewed = c_viewed.iterator();
		int messageIndex;

		messageIndex = 0;

		while (itr_viewed.hasNext()) {
			String broadcast_Message_viewed = (String) itr_viewed.next();
			//System.out.println("**** broadcast_Message_viewed: " + broadcast_Message_viewed);
			
			List viewedList = splitList(broadcast_Message_viewed, delimiter);

			String broadcast_Message = (String) itr.next();
			//System.out.println("**** broadcast_Message: " + broadcast_Message);

			List messageList = splitList(broadcast_Message, delimiter);
			Iterator messageListItr = messageList.iterator();

			String allowedViewer = "";
			String messageKey = "";
			String priority = "";
			String subject = "";
			String fullmessage = "";
			int count;

			//20090409015925|*|critical|Broadcast Message|Put in the broadcast message here

			count = 0;
			while (messageListItr.hasNext()) {
				if (count == 0) messageKey = (String) messageListItr.next();
				if (count == 1) allowedViewer = (String) messageListItr.next();
				if (count == 2) priority = (String) messageListItr.next();
				if (count == 3) subject = (String) messageListItr.next();
				if (count == 4) fullmessage = (String) messageListItr.next();

				count++;
			}

			//System.out.println("allowedViewer: " + allowedViewer);

			if ("*".equals(allowedViewer) || (allowedViewer.equalsIgnoreCase(onlineUserid))) {
				//not viewed before
				if (!viewedList.contains(onlineUserid)) {

					//display broadcast message
					if (messageIndex != 0)
						out.println("<br>");

%>

<div id="broadcast_messages_<%= messageKey %>">

<table width="450" height="280" align="center" border="0" cellpadding="10" cellspacing="0" class="tblInfo" style="margin:6px">
	<thead>
	</thead>
	<tbody>
		<tr> 
		  <td class="even" style="text-align:center" valign="middle"> 
			<table width="400" border="0" cellspacing="0" cellpadding="0" class="tblInfo" style="margin:10px">
			  <tr class="even"> 
					<td style="border:none;text-align:center;padding-right:5px" width="60">
					<%
						if ("critical".equalsIgnoreCase(priority)) {
							out.println("<img src='img/stop.gif' />");
						}
						else if ("warning".equalsIgnoreCase(priority)) {
							out.println("<img src='img/warning3.gif' />");
						}
						else if ("notification".equalsIgnoreCase(priority)) {
							out.println("<img src='img/info.gif' />");
						}
						else {
							out.println("<img src='img/qmark1.gif' />");
						}
					%>
					</td>
					<td style="border:none" width="360" height="100%">
						<p><strong><font size="2">From: </font></strong>Administrator</p>
						<p><strong><font size="2">Sent On: </font></strong><%= messageKey.substring(0,4) %>/<%= messageKey.substring(4,6) %>/<%= messageKey.substring(6,8) %>&nbsp;<%= messageKey.substring(8,10) %>:<%= messageKey.substring(10,12) %>:<%= messageKey.substring(12,14) %></p>
						<p><strong><font size="2">Subject: </font></strong><%= subject %></p>
						<p><strong><font size="2">Message: </font></strong><br><%= fullmessage %></p>
					</td>
			   </tr>
			</table>
		  </td>
		</tr>
	</tbody>
</table>

</div>

<%
					notViewList = notViewList + messageKey + delimiter;
					//System.out.println("not viewed: " + messageKey);
				}
			}

			messageIndex++;

		}

		if (!"".equals(notViewList) && onlineUserid != null) {
			synchronized (bc_message_viewed) 
			{
				List justViewedList = splitList(notViewList, delimiter);
				
				Iterator viewedItr = justViewedList.iterator();
				while (viewedItr.hasNext())
				{
					String messageKey = (String) viewedItr.next();
					//System.out.println("updating: " + messageKey);
					
					String oldList = (String) bc_message_viewed.get(messageKey);
					oldList = oldList + onlineUserid + delimiter;
					bc_message_viewed.put(messageKey, oldList);
				}
				
				application.setAttribute("admin_broadcast_viewed", bc_message_viewed);
			}
		}
	}

%>

</BODY>

</html>
