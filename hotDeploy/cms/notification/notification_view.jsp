<%@ page import="com.integrosys.component.notification.bus.INotification,
							 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%
    String startIndex = (String)request.getParameter(ICMSConstant.PARAM_NOTIFICATION_START_INDEX);
	String event = (String)request.getAttribute("event");
	String href = "";
	if (event.equals("view"))
		href = "Notification.do?event=search&"+ICMSConstant.PARAM_NOTIFICATION_START_INDEX+"="+startIndex;
	else if (event.equals("view_deleted"))
		href = "Notification.do?event=search&status=DELETED&"+ICMSConstant.PARAM_NOTIFICATION_START_INDEX+"="+startIndex;
		
	INotification notification = (INotification)request.getAttribute("notification");
	if (notification==null) {
%>
<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
<tr>
<td width="100%" style="padding-left:5"><h3>Notification</h3></td>
</tr>
<tr>
<td align="center"><hr/></td>
</tr>
</thead>
<tbody>
<tr class="even">
<td class="even" style="text-align:center" valign="middle">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo" style="margin-top:0">
<tr class="even">
<td style="border:none;text-align:center"><strong><img src="img/info.gif" /></strong></td>
</tr>
<tr class="odd">
<td style="border:none;text-align:center"><strong><font size="2"><br/>The notification has been deleted!</font></strong></td>
</tr>
<tr class="even">
<td style="border:none;text-align:center"><strong><font size="2"><br/>&nbsp;</font></strong></td>
</tr>
</table> 
</td>
</tr>
</tbody>
</table>
<% 	
	} 
	else {
		    out.println("<br><pre>");
		    try {
				if (notification.getNotificationMessage() != null) {
					out.println(notification.getNotificationMessage());
				}
				if (notification.getMessageObject() != null) {
					out.println(notification.getMessageObject());
				}
		    } catch (Exception e) {
				e.printStackTrace();
		    }
		    out.println("</pre>");
    }
%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td width="100" valign="baseline" align="center">
	<a href="<%=href%>"
    onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
	</a></td>
	</tr>
</table>