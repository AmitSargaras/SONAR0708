<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails" %>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartySearchForm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterparty" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue" %>
<%@ page import="com.integrosys.cms.app.cci.bus.OBCustomerAddress"%>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<jsp:include page="printTransValue.jsp"/>

<%
    // read for   ICCICounterpartyDetailsTrxValue
    CounterpartySearchForm aForm = (CounterpartySearchForm) request.getAttribute("CounterpartySearchForm");
    String event = (String)  request.getAttribute("event");
    String aGroupCCINo = "-";
    ICCICounterparty[]   obj;

    ICCICounterpartyDetailsTrxValue trxValue = (ICCICounterpartyDetailsTrxValue) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.ICCICounterpartyDetailsTrxValue");
    ICCICounterpartyDetails details = null;
    if (trxValue != null) {
        details = trxValue.getCCICounterpartyDetails();
        if (details != null) {
            aGroupCCINo = details.getGroupCCINo() + "";
            obj = details.getICCICounterparty();
            if (obj != null && obj.length > 0) {
            }
        }

    }

%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript">
        function fnEdit() {
            var frm = document.forms[0];
            frm.event.value = 'edit';
            frm.action = 'CounterpartyCCI.do?event=edit';
            frm.submit();
        }
        function fnCance() {
            var frm = document.forms[0];
            frm.event.value = 'list';
            frm.action = "CounterpartyCCI.do?event=list";
            frm.submit();
        }

</script> 
 
</head>

<body>

<html:form action="CounterpartyCCI.do?event=read">
<input type="hidden" name="event"/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" id="contentWindow">
<tr>
    <td colspan="3" valign="top">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  style="margin-top:20px">
    <thead>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" align="center">
                    <tr><td>
                        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblInput">
                            <thead>
                            </thead>
                            <tbody>
                                <tr class="odd">
                                    <td width="25%" class="fieldname"><bean:message key="label.cci.cciNo"/></td>
                                    <td width="75%">&nbsp;<% out.print(aGroupCCINo); %></td>
                                </tr>
                            </tbody>
                        </table>
                    </td></tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="73%"><h3><bean:message key="title.cci.counterparty.list"/></h3></td>
                        <td width="27%" align="right" valign="bottom">
                            <input type="button" name="Submit" value="Edit" class="btnNormal" onClick="fnEdit()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                    <thead>
                        <tr>
                            <td width="3%"><bean:message key="label.global.sn"/></td>
                            <td width="25%"><bean:message key="label.customer.name"/>/<br><bean:message key="label.agreement.address"/></td>
                            <td width="10%"><bean:message key="label.customer.doincorp"/></td>
                            <td width="10%"><bean:message key="label.customer.id.source"/></td>
                            <td width="10%"><bean:message key="label.customer.id"/></td>
                            <td width="25%"><bean:message key="label.col.owner.id.no"/></td>
                        </tr>
                    </thead>
                    <%

                        int rowIdx = 0;
                        int count = 1;
                        if (details != null) {
                            ICCICounterparty[]  iCCICounterparty = details.getICCICounterparty();
                            if (iCCICounterparty != null && iCCICounterparty.length > 0) {
                                for (int index = 0; index < iCCICounterparty.length; index++) {
                                    ICCICounterparty OB = iCCICounterparty[index];
//                                    String legalName = (CounterpartyUIHelper.isNotEmpty(OB.getLegalName())) ? OB.getLegalName() : "-";
                                    String legalName = (CounterpartyUIHelper.isNotEmpty(OB.getCustomerName())) ? OB.getCustomerName() : "-";
//                                    String dob = CounterpartyUIHelper.isNotEmpty(OB.getDob())  ? OB.getDob() : "-";
                                    String sourceID = (CounterpartyUIHelper.isNotEmpty(OB.getSourceID())) ? OB.getSourceID() : "-";
                                    String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, sourceID);
                                    sourceDesc = (CounterpartyUIHelper.isNotEmpty(sourceDesc)) ? sourceDesc : "-";
                                    String lmpLeID = (CounterpartyUIHelper.isNotEmpty(OB.getLmpLeID())) ? OB.getLmpLeID() : "-";
                                    String idNO = (CounterpartyUIHelper.isNotEmpty(OB.getIdNO())) ? OB.getIdNO() : "-";
                                    String deleteValue = OB.getSubProfileID() + "";
                    %>

                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index"><%=count++%></td>
                        <td><a href="javascript:viewCustomer('<%=OB.getSubProfileID() %>')"><%=legalName%>&nbsp;</a>
                            <br><%=CounterpartyUIHelper.displayAddress(OB.getAddress())%> </td>
                        <%--<td><integro:empty-if-null value="<%=OB.getDob()%>"/></td>--%>
                        <td><% if (OB.getDob() != null){%>
                            <integro:date object="<%=OB.getDob()%>"/>
                          <%}else {%>
                           -
                           <%}%>&nbsp;</td>
                        <td><%=sourceDesc%>&nbsp;</td>
                        <td><%=lmpLeID%>&nbsp; </td>
                        <td><%=idNO%>&nbsp; </td>
                    </tr>
                    <%
                        }
                    } else {%>
                    <td colspan="6" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                    <% }
                    } %>
                </table>
            </td>
        </tr>
        <tr>
            <td height="2">
                <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <%if("maker_edit_cci_reject".equals(event)){ %>
                             <a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0" id="Image43" />
                            </a>
                            <%}else{%>
                            <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0" id="Image42"   onclick="fnCance();"/>
                            </a>
                            <%}%>
                        </td>

                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </td>
</tr>

</table>
</html:form>

<%@ include file="/customer/viewdetails/viewCustomer.jsp"%>
</body>
</html>