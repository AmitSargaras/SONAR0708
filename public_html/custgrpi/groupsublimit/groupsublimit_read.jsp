<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupSubLimit" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    String indexID   = (String) request.getAttribute ("indexID");
    String event     = (String) request.getAttribute("event");
    String from_even = (String) request.getAttribute("from_even");
    String itemType  = (String) request.getAttribute("itemType");

    //System.out.println("indexID = " + indexID);
   // System.out.println("event = " + event);
   // System.out.println("from_event = " + from_even);
    //System.out.println("itemType = " + itemType);

    int index = 2;
    if ("prepare".equals(event) || "create".equals(event)) {
        index = 1;
    }

   ICustGrpIdentifierTrxValue trxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction."+ CustGroupUIHelper.service_groupTrxValue);
   CustGroupUIHelper.printChildMembersAct(trxValue);
   IGroupSubLimit   obj = (IGroupSubLimit)request.getAttribute(CustGroupUIHelper.stg_groupSubLimitObj);

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
        <!--
        function submitPage(num) {
            if (num == 1) {
                document.forms[0].event.value="create";
            }else if (num == 2) {
                document.forms[0].event.value="update";
            }else {
                document.forms[0].event.value="cancel";
            }
            document.forms[0].submit();
        }
        -->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body >
<html:form action="GroupSubLimit.do">
    <html:hidden property="event"/>
    <%--<html:hidden property="groupSubLimitID"/>--%>
    <html:hidden property="groupSubLimitIDRef"/>
    <html:hidden property="indexID" value="<%=indexID%>"/>
    <html:hidden property="nextPage" />
    <html:hidden property="itemType" />

    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3><bean:message key="label.group.sub.limit" />- View </h3></td>
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
                <td colspan="2"><hr/></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                            <tr class="even">
                                <td width="38%" class="fieldname"><bean:message key="label.group.sub.limit.type" /> <span class="mandatory"> * </span></td>
                                <td width="62%"><bean:write name="GroupSubLimitForm" property="subLimitTypeCD" /></td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.group.description" /></td>
                                <td width="62%"><bean:write name="GroupSubLimitForm" property="desc" /></td>
                            </tr>
                             <tr class="odd">
                                <td class="fieldname"><bean:message key="label.group.sub.limit.currency" /></td>
                                <td width="62%"><bean:write name="GroupSubLimitForm" property="currencyCD" /></td>
                            </tr>

                            <tr class="even">
                                <td class="fieldname"><bean:message key="label.group.limit.last.reviewed.date" /></td>
                                <td width="62%"><bean:write name="GroupSubLimitForm" property="lastReviewedDt" /></td>
                            </tr>

                            <tr class="even">
                                <td class="fieldname"><bean:message key="label.group.limit.amount" /></td>
                                <td><bean:write name="GroupSubLimitForm" property="limitAmt" /></td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.security.remarks" /></td>
                                <td><bean:write name="GroupSubLimitForm" property="remarks" /></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>

    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td width="100" valign="baseline" align="center">
                <a href="CustGrpIdentifier.do?event=<%=event%>&from_event=process&itemType=<%=itemType%>" target="_parent" onMouseOut="MM_swapImgRestore()"
                <%--<a href="CustGrpIdentifier.do?event=maker_close_cgid_return&from_event=process&itemType=<%=itemType%>" target="_parent" onMouseOut="MM_swapImgRestore()"--%>
                   onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>

            </td>
        </tr>
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
    </table>

</html:form>
</body>
</html>

