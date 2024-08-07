<%@ page import="com.integrosys.cms.ui.custgrpi.groupsublimit.GroupSubLimitForm" %>


<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    String indexID = (String) request.getParameter("indexID");
    String from_event = request.getParameter("from_event");
    GroupSubLimitForm aForm = (GroupSubLimitForm) request.getAttribute("GroupSubLimitForm");

    int index = 2;
    if ("prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))) {
        index = 1;
    }
%>


<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="CssStyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script type="text/javascript" src="js/emulation.js"></script>
    <script type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
    <script type="text/javascript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        function submitPage(num) {
            if (num == 1) {
                document.forms[0].event.value = "create";
            }
            if (num == 2) {
                document.forms[0].event.value = "update";
            }
            if (num == 3) {
                document.forms[0].event.value = "cancel";
            }
            document.forms[0].submit();
        }

        function fnRefresh() {
            document.forms[0].action = "GroupSubLimit.do?event=prepare_update_sub";
            document.forms[0].submit();
        }
    </script>
</head>

<body>
<html:form action="GroupSubLimit.do">
<html:hidden property="event"/>
<html:hidden property="groupSubLimitID"/>
<html:hidden property="groupSubLimitIDRef"/>
<html:hidden property="indexID" value="<%=indexID%>"/>
<html:hidden property="nextPage"/>
<html:hidden property="itemType"/>

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.sub.limit"/> - Update </h3></td>
            <td width="24%" align="right" valign="baseline">
                <table width="130" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="100">&nbsp;</td>
                        <td width="50">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr/>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr class="even">
                            <td width="38%" class="fieldname"><bean:message key="label.group.sub.limit.type"/> <span
                                    class="mandatory"> * </span></td>
                            <td width="62%">
                                <html:select property="subLimitTypeCD" onchange="fnRefresh()">
                                    <option value=""><bean:message key="label.please.select"/></option>
                                    <html:options name="subLimitTypeCodes" labelName="subLimitTypeLabels"/>
                                </html:select>
                                <html:errors property="subLimitTypeCD"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.group.description"/><span class="mandatory"> * </span></td>
                            <td><html:select property="desc">
                                <option value=""><bean:message key="label.please.select"/></option>
                                <html:options name="subLimitDescCodes" labelName="subLimitDescLabels"/>
                            </html:select>
                                <html:errors property="desc"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.group.sub.limit.currency"/><span class="mandatory"> * </span></td>
                            <td><html:select property="currencyCD">
                                <option value=""><bean:message key="label.please.select"/></option>
                                <html:options name="currencyCodes" labelName="currencyLabels"/>
                            </html:select>
                                <html:errors property="currencyCD"/>
                            </td>
                        </tr>

                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.group.limit.last.reviewed.date"/><span class="mandatory"> * </span></td>
                            <td><html:text property="lastReviewedDt" readonly="true" size="15" maxlength="11"/>
                                <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
                                     onclick="showCalendar('lastReviewedDt', 'dd/mm/y')"
                                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                                     onmouseout="MM_swapImgRestore()"/>
                                <html:errors property="lastReviewedDt"/>
                            </td>
                        </tr>

                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.group.limit.amount"/><span class="mandatory"> * </span></td>
                            <td>
                                <html:text property="limitAmt" maxlength="100" size="20"/>
                                <html:errors property="limitAmt"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.security.remarks"/></td>
                            <td><html:textarea property="remarks" rows="3" cols="92"/>
                            <html:errors property="remarks"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">&nbsp;<html:errors property="atleastOne"/>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(<%=index%>)" onMouseOut="MM_swapImgRestore()"
               onMouseOver="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" height="22" border="0" id="Image142"/></a></td>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()"
               onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
</body>
</html>

