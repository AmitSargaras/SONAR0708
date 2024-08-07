<%@ page import="com.integrosys.cms.ui.limitbooking.LimitBookingAction"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* @author priya
*
*/
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
    var submitSearchLimitBooking = function submitPage(params) {
        var gobutton = params[0];

        var frm = document.forms[0];
        frm.gobuttonBooking.value = gobutton;
        if (gobutton == 1) {
            frm.gobuttonBooking.value = 1;
            frm.searchBookingType.value = '<%=LimitBookingAction.SEARCH_TYPE_DATE%>';
        } else if (gobutton == 2) {
            frm.gobuttonBooking.value = 2;
            frm.searchBookingType.value = '<%=LimitBookingAction.SEARCH_TYPE_TICKET_NO%>';
        } else if (gobutton == 3) {
            frm.gobuttonBooking.value = 3;
            frm.searchBookingType.value = '<%=LimitBookingAction.SEARCH_TYPE_GROUP_NAME%>';
        } else if (gobutton == 4) {
            frm.gobuttonBooking.value = 4;
            frm.searchBookingType.value = '<%=LimitBookingAction.SEARCH_TYPE_CUSTOMER_NAME%>';
        } else if (gobutton == 5) {
            frm.gobuttonBooking.value = 5;
            frm.searchBookingType.value = '<%=LimitBookingAction.SEARCH_TYPE_ID_NO%>';
        }
        frm.event.value = '<%=LimitBookingAction.EVENT_SEARCH_BOOKING%>';
        frm.submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params[0] = gobutton;

        submitEnter(event, submitSearchLimitBooking, params);
    }
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>
    <html:hidden property="searchBookingType"/>
    <html:hidden property="event"/>
    <input type=hidden name="gobuttonBooking"/>
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
                      <thead>
					  <tr>
                        <td width="75%">&nbsp;</td>
</tr>
<tr>
<td>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
	  <thead>
        <tr>
          <td  colspan="3">Please enter either one of the following information</td>
        </tr>
        </thead>
        <tbody>
          <tr class="odd">
            <td width="60%" class="fieldname"><bean:message key="label.date.limit.booked"/></td>
            <td width="35%" class="odd">
             From&nbsp;<html:text property="searchFromDate" readonly="true" maxlength="15" size="17" />
                    <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
                         onclick="showCalendar('searchFromDate', 'dd/M/y')"
                         onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                         onmouseout="MM_swapImgRestore()"/> 
                         <html:errors property="searchFromDateError" />
                         -
             To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:text  property="searchToDate" readonly="true" maxlength="15" size="17" />
                    <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
                         onclick="showCalendar('searchToDate', 'dd/M/y')"
                         onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                         onmouseout="MM_swapImgRestore()"/>
                 <html:errors property="searchToDateError" /></td>
            <td><input onclick="submitPage(1)" name="Go1" type="button" id="Go1" value="Go"
                class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/></td>
          </tr>
          <tr class="even">
            <td class="fieldname"><bean:message key="label.ticket.number"/></td>
            <td class="even"><html:text property="searchTicketNo"  maxlength="15" size="30" onkeypress="submitEnterWrapper(event, 2);"/>
                                        <html:errors property="searchTicketNoError" /></td>
            <td width="3%"><input onclick="submitPage(2)" name="Go2" type="button" id="Go2" value="Go"
                class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/></td>
          </tr>
          <tr class="odd">
            <td width="60%" class="fieldname"><bean:message key="label.group.name"/></td>
            <td width="30%" class="odd">
            <html:text  property="searchBookingGroupName"  maxlength="150" size="30" onkeypress="submitEnterWrapper(event, 3);"/>
                             <html:errors property="searchBookingGroupNameError" /></td>
            <td><input onclick="submitPage(3)" name="Go3" type="button" id="Go3" value="Go"
                class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/></td>
          </tr>
          <tr class="even">
            <td class="fieldname"><bean:message key="label.security.updateaptmnt.cust.name"/></td>
            <td class="even"><html:text  property="searchCustomerName"  maxlength="150" size="30" onkeypress="submitEnterWrapper(event, 4);"/>
                                        <html:errors property="searchCustomerNameError" /></td>
            <td width="3%"><input onclick="submitPage(4)" name="Go4" type="button" id="Go4" value="Go"
                class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/></td>
          </tr>
          <tr class="odd">
            <td width="60%" class="fieldname"><bean:message key="label.manualinput.customer.id.no"/></td>
            <td width="30%" class="odd">
            <html:text  property="searchIDNo"  maxlength="20" size="30" onkeypress="submitEnterWrapper(event, 5);"/>
                             <html:errors property="searchIDNoError" /></td>
            <td><input onclick="submitPage(5)" name="Go5" type="button" id="Go5" value="Go"
                class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/></td>
          </tr>
        </tbody>
      </table>
</td>
</tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
