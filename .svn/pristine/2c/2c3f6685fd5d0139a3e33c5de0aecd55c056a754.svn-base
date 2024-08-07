<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.ui.limitbooking.LimitBookingForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 java.util.*,
                 com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
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
<%

    String fromEvent = request.getParameter(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT);
    
%>
<script language="JavaScript" type="text/JavaScript">
<!--
        function submitPage(gobutton) {
            var frm = document.forms[0];
            document.forms[0].gobutton.value = gobutton;
            if (gobutton == 1) {                            //  for searchGroupID
                frm.searchGroupName.value = "";
            } else if (gobutton == 2) {                     //  for searchGroupName
                frm.searchGroupNo.value = "";
            }
            frm.searchType.value = '<%=CustGroupUIHelper.search_ByGroup%>';
            frm.event.value ='<%=LimitBookingAction.EVENT_SEARCH_GROUP%>';
            frm.submit();
        }
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>
    <html:hidden property="searchType" value="ByGroup"/>
    <html:hidden property="event"/>
    <input type="hidden" name="fromEvent" value="<%=fromEvent%>"/>
    <input type=hidden name="gobutton"/>
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
                      <thead>
					  <tr>
                        <td width="75%"><h3>By Group</h3>
                          <hr></td>
</tr>
<tr>
<td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
	  <thead>
        <tr>
          <td  colspan="3">Please enter either one of the following information</td>
        </tr>
        </thead>
        <tbody>
          <tr class="odd">
            <td width="60%" class="fieldname">Group ID</td>
            <td width="30%" class="odd">
            <html:text property="searchGroupNo"  maxlength="17" size="20" />
                             <html:errors property="searchGroupNo" /></td>
            <td><input onclick="submitPage(1)" name="Go1" type="button" id="Go1" value="Go"
                class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/></td>
          </tr>
          <tr class="even">
            <td class="fieldname">Group Name</td>
            <td class="even"><html:text property="searchGroupName"  maxlength="150" size="40" />
                                        <html:errors property="searchGroupName" /></td>
            <td width="3%"><input onclick="submitPage(2)" name="Go2" type="button" id="Go2" value="Go"
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
