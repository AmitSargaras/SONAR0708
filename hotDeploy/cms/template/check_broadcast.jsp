<%@ include file="/template/charset_template.jsp" %>

<%@ page import = "com.integrosys.base.techinfra.propertyfile.PropertyManager,
                   com.integrosys.base.techinfra.logger.DefaultLogger,
                   com.integrosys.base.uiinfra.common.Constants,
                   com.integrosys.base.uiinfra.exception.AccessDeniedException,
				   java.util.*,
				   java.text.*,
                   com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<head>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
</head>

<script language="JavaScript" type="text/JavaScript">
<!--
	function showBroadcastMessage() {

		//alert(parent.win_broadcast == null);
		if (parent.show_broadcastmessage) {
			parent.show_broadcastmessage();
		}
	}
//-->
</script>

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

	if (!PropertyManager.getBoolean("integrosys.login.top.most.layer", true)) {

		String delimiter = "|";

		String onlineUserid = (String) session.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID);
		//System.out.println("**** userid: " + onlineUserid);
		if ((onlineUserid == null) || ("".equals(onlineUserid))) {
			onlineUserid = "anonymous";
		}

		HashMap bc_message = (HashMap) application.getAttribute("admin_broadcast");
		HashMap bc_message_viewed = (HashMap) application.getAttribute("admin_broadcast_viewed");
		boolean somethingToView = false;
		
		if (bc_message_viewed != null) {			
			Collection c = bc_message.values();
			Collection c_viewed = bc_message_viewed.values();
			Iterator itr = c.iterator();
			Iterator itr_viewed = c_viewed.iterator();

			while (itr_viewed.hasNext()) {		
				String broadcast_Message_viewed = (String) itr_viewed.next();	
				List viewedList = splitList(broadcast_Message_viewed, delimiter);

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

				//System.out.println("allowedViewer: " + allowedViewer);

				if ("*".equals(allowedViewer) || (onlineUserid.equalsIgnoreCase(allowedViewer))) {
					//not viewed before
					if (!viewedList.contains(onlineUserid)) {
						somethingToView = true;
						break;
					}
				}
			}

			if (somethingToView == true) {
				String displayOnResponse = (String) request.getParameter("showBroadcastStatus");
				//
				//showBroadcastStatus is defined 2 places
				// a) topbanner.jsp in template folder
				//		- set to false
				// b) reload.jsp in root folder
				//		- set to true
				//
				if ("false".equalsIgnoreCase(displayOnResponse)) {
%>
					<script language="JavaScript" type="text/JavaScript">
					<!--
						if (showBroadcastMessage) {
							bcTime = setTimeout('showBroadcastMessage()', 1000);
						}
					//-->
					</script>
<%
				}
				else if ("true".equalsIgnoreCase(displayOnResponse)) {
					out.println("broadcast item found");
					//this response string is used by Ajax as a indication to draw broadcast message
					//can be found in itgUtilities.js - countDownSession()
					//need to sync up changes if needed
				}
			}
		}
	}

%>

