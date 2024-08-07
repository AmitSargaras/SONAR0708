<%@ page import="com.integrosys.component.notification.bus.INotification,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 java.util.ArrayList,
                 com.integrosys.component.notification.bus.OBNotification,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	ArrayList notificationList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.notification.NotificationAction.notificationList");	
	String startIndex = (String)request.getParameter(ICMSConstant.PARAM_NOTIFICATION_START_INDEX);
        long totalCount = request.getAttribute("totalNotificationCount") == null?0:Long.parseLong((String)(request.getAttribute("totalNotificationCount")));
	int startInd = 0;
	if (startIndex!=null)
		startInd = Integer.parseInt(startIndex);
	int length = 10;
	int displayLength = 0;
	if (notificationList!=null) {
		if (startInd+length > notificationList.size()) 
			displayLength = notificationList.size();
		else 
			displayLength = startInd+length;
	}
    //CR-120 Search Item
    String sessSearchLegalName = (String)session.getAttribute("com.integrosys.cms.ui.notification.NotificationAction.session.searchLegalName");
    String sessSearchLeID = (String)session.getAttribute("com.integrosys.cms.ui.notification.NotificationAction.session.searchLeID");
    String sessSearchAANumber = (String)session.getAttribute("com.integrosys.cms.ui.notification.NotificationAction.session.searchAANumber");
    
    int counter = 0;
    
    pageContext.setAttribute("notificationList", notificationList);

%> 


<html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(idx) {
	if (idx == 1) {
		document.forms[0].searchLegalName.value = '';
	} else if (idx == 2) {
		document.forms[0].searchLeID.value = '';
	}
    document.forms[0].startIndex.value=0;
    document.forms[0].submit();
}

function deleteNotification() {
	document.forms[0].event.value="delete";
	document.forms[0].submit();
}

function changeAllCheck() {
    var updateObj = document.forms[0].notificationIDs;
    var checkedValue = document.forms[0].updateChk.checked;

    if (!updateObj.length) {
        updateObj.checked = checkedValue;
    }
    for (i = 0; i < updateObj.length; i++) {
        updateObj[i].checked = checkedValue;
    }
}

function handleEnter (field, event, itemPressed) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == "" || field.value == null) {
			//
		}
		else {
			submitPage(itemPressed);
		}
		return false;
	} 
	else
	return true;
}

function goNextPrev(ind) {
    document.forms[0].userName.value='';
    document.forms[0].startIndex.value=ind;
}

function goPageIndex(ind) {
    document.forms[0].startIndex.value=ind;
    document.forms[0].submit();
}

function goPage(pageNo){
	document.forms[0].startIndex.value = pageNo*10;
}

-->

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="Notification.do">
<input type="hidden" name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0"/>
<input type="hidden" name="event" value="search" />
<input type="hidden" name="status" value="<%=ICMSConstant.STATE_NOTIFICATION_DELETED%>" />
<input type="hidden" name="totalNotificationCount" value="<%= totalCount %>" />

  <tr >

	<td width="100%" height="100%" valign="bottom" >
      <table id="window" height="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td>
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
              <!--CR-120 Search Diary Item-->
              <tr>
                <td colspan="3" valign="top">
                  <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="100%">
                       <TABLE width="70%" class=tblinfo id=custsearch border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                         <THEAD>
                          <TR>
                            <TD colSpan=3 width="100%">Please enter search criteria</TD></TR></THEAD>
                          <TBODY>
				              <tr class=odd>
				                <td class=fieldname><bean:message key="label.customer.id"/> :</TD>
				                <td><html:text property="searchLeID" value="<%=sessSearchLeID%>" maxlength="20" size="30" onkeypress="return handleEnter(this, window.event||event, 1);" /> 
									<html:errors property="leIDError"/> 
								</TD>
				                <td><input class=btnNormal id=Search2 style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(1) type=button value=Go name=Search2>
				                </td></tr>
				              <tr class=even>
				                <td class=fieldname nowrap="nowrap"><bean:message key="label.customer.name" /> :</TD>
				                <TD><html:text property="searchLegalName" value="<%=sessSearchLegalName%>" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 2);" />  
									<html:errors property="legalNameError"/>
								</TD>
				                <TD><INPUT class=btnNormal id=Search3 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(2) type=button value=Go name=Search3>
				                </TD></TR>
				              <tr class=odd>
				                <td class=fieldname><bean:message key="label.global.aa.number" /> :</TD>
				                <TD><html:text property="searchAANumber" value="<%=sessSearchAANumber%>" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 2);" />  
									<html:errors property="aaNumberError"/>
								</TD>
				                <TD><INPUT class=btnNormal id=Search3 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(2) type=button value=Go name=Search3>
				                </TD></TR>
                          </TBODY>
                        </TABLE>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            <tr >
                <td colspan="3" valign="top" style="height:100%;width:100%;">
                    <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px">
                      <thead>
                      <tr>
                        <td width="24%">
                          <h3>Deleted Notification</h3>
                        </td>
                      </tr>
                      <tr>
                        <td> <hr /></td>
                      </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
								<td width="2%">S/N</td>
								<td width="25%">Date / Time</td>
								<td width="73%">Description</td>
                            </tr>
                            </thead>

                        <tbody>
				<%  if (notificationList == null || notificationList.size() < 1) { %>
					<tr class="odd">
						<td colspan="3"><bean:message key="label.global.not.found"/></td>
					</tr>
				<%	} else { %>
                    <logic:iterate id="notification" name="notificationList" type="com.integrosys.component.notification.bus.OBNotification" scope="page" >
					<%
						String rowClass = "";
						counter++;
						if ( counter%2 != 0 ) {
							rowClass = "odd";
						} else {
							rowClass = "even";
						}
					%>
                    <tr class=<%=rowClass%>>
                    	<td><%=counter%></td>
						<td>&nbsp;<integro:date object="<%=notification.getCreationDate()%>" simpleDateFormat="dd/MMM/yyyy hh:mm:ss" />
						<td >&nbsp;<a href="Notification.do?event=view_deleted&notificationID=<%=notification.getNotificationID()%>&<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>=<%=startInd%>&status=<%=ICMSConstant.STATE_NOTIFICATION_DELETED%>" class="note"><%=notification.getNotificationTypeData().getNotificationTitle()%></a></td>
                    </tr>
                    </logic:iterate>
				<%	} %>
                        </tbody>

                          </table>
                        </td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                        <tr><td colspan="2"><strong><a href="Notification.do?event=search">Notification List</a></strong></td></tr>
						<tr><td colspan="2"><br></td></tr>
						<tr><td colspan="2"><br></td></tr>
                </td>
                </tr>
                      </tbody>
                    </table>
				</td>
              </tr>
              <tr>
                <td colspan="3">

                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr>
			<td valign="middle">   <integro:pageindex pageIndex='<%=new PageIndex(startInd,length, (int)(totalCount))%>'
			url='<%="Notification.do"%>' submitFlag='<%=new Boolean(true)%>'/></td>
                      </tr>
                    </table>
                </td>
              </tr>
      </table>
       </td>
  </tr>
</table>
</td>
</tr>
</html:form>
</table>
</body>
</html>

