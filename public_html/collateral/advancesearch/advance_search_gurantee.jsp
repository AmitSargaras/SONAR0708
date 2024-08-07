<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralSearchForm" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


<% CollateralSearchForm advanceSearchForm = (CollateralSearchForm) request.getAttribute("CollateralSearchForm"); %>

<table class="tblInput" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
        <% if (ICMSConstant.COLTYPE_GUARANTEE_SBLC_DIFFCCY.equals(advanceSearchForm.getSecuritySubType())
                || ICMSConstant.COLTYPE_GUARANTEE_SBLC_SAMECCY.equals(advanceSearchForm.getSecuritySubType())) { %>
       <tr class="odd">
            <td width="40%" class="fieldname"><bean:message key="label.col.standby.lcno" /></td>
            <td width="60%"><html:text property="standbyLCNo" maxlength="10"/></td>
        </tr>
        <% } %>

       <tr class="even">
            <td width="40%" class="fieldname"><bean:message key="label.limit.expiry.date"/> </td>
            <td width="60%">
                From <html:text property="fromExpDate" readonly="true" size="15" maxlength="11"/>
                    <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('fromExpDate', 'dd/mm/y')"
                         onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                    &nbsp;<html:errors property="fromExpDate"/>
                To <html:text property="toExpDate" readonly="true" size="15" maxlength="11"/>
                     <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('toExpDate', 'dd/mm/y')"
                          onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                     &nbsp;<html:errors property="toExpDate"/>
             </td>
        </tr>
    </tbody>
</table>

