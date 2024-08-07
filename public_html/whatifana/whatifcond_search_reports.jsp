<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>


    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="javascript">
    	<!--
        function submitPage () {
        	document.forms[0].submit();
        }
     //-->
    </script>

    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

	<script type="text/javascript" src="js/imageNavigation.js"></script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="/common/mandatory_for_submission_note.jsp" %>
<br>

<html:form action="WhatIfCondReportSearch.do?event=search_reports">

    <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td width="60%" class="fieldname">Date&nbsp;<font color="#0000FF">* </font></td>
                            <td width="40%">
                                    <html:text property="searchDate" style="width:90px" size="15" maxlength="11" readonly="true" />
                                        <img src="img/calendara.gif" name="Image721" border="0" id="Image2" onclick="return showCalendar('searchDate', 'dd/mm/y');"
                                            onmouseover="MM_swapImage('Image721','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                &nbsp; <html:errors property="searchDate"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
               <input onclick="javascript:submitPage()" name="AddNew1" type="button" id="AddNew1" value="Go" class="btnNormal"
                                                   style="margin-right:5px;margin-left:10;width:50px"/>
            </td>
        </tr>
    </table>
</html:form>
</body>
</html>
