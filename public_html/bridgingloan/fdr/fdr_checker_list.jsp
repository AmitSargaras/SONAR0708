<%@ page import="com.integrosys.cms.app.bridgingloan.bus.IFDR,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: List FDR Register
* Description:
*
* @author $Author: KLYong  $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        IBridgingLoanTrxValue bridgingLoanTrxValue = (IBridgingLoanTrxValue) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanTrxValue");

        if (bridgingLoanTrxValue != null) {
            IFDR[] fdrActualList = null;
            if (bridgingLoanTrxValue.getBridgingLoan() != null)  //actual will be null if this is new record
                fdrActualList = bridgingLoanTrxValue.getBridgingLoan().getFdrList();
            IFDR[] fdrStagingList = bridgingLoanTrxValue.getStagingBridgingLoan().getFdrList();

            if (fdrActualList != null || fdrStagingList != null) {
                List compResult = CompareOBUtil.compOBArray(fdrStagingList, fdrActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("fdrList", list);
            }
        }
%>
<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<style>
<!--
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
-->
</style>
<script src="js/imageNavigation.js"></script>
<script>
</script>
</head>

<body onLoad="MM_preloadImages('img/cancel2.gif')">
<html:form action="BL_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="amountAccumulated"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" ><h3><bean:message key="label.bridgingloan.fdr.reg.title"/> </h3></td>
        <td width="42%" style="text-align:right" valign="bottom" > </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.date"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.fdr.acc.no"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.fdf.amt"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.ttl.fdf.accum.date"/><br/></td>
                    <td width="*"><bean:message key="label.bridgingloan.fdf.ref.no"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        Amount amountAccumulated = null;
                        boolean convertError = false;
                        int index = 0;
                    %>
                    <logic:present name="fdrList">
                        <logic:iterate id="compResult" name="fdrList" type="com.integrosys.base.techinfra.diff.CompareResult">
                        <%
                            IFDR stagingParameter = (IFDR) compResult.getObj();
                            index++;

                            //if one convertion found error, the following no need convert.
                            if (!convertError) {
                                try {
                                    amountAccumulated = CommonUtil.addAmount(amountAccumulated, stagingParameter.getFdrAmount());
                                }
                                catch (AmountConversionException e) {
                                    if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                                        convertError = true;
                                        amountAccumulated = null;
                                    }
                                }
                            }
                        %>
                        <tr class='<%=(index%2==0?"even":"odd")%>'>
                            <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=index%></td>
                            <td style="text-align:center"><integro:date object="<%=stagingParameter.getFdrDate()%>" />&nbsp;</td>
                            <td><integro:empty-if-null value="<%=stagingParameter.getAccountNo()%>"/>&nbsp;</td>
                            <td style="text-align:right"><integro:amount amount="<%=stagingParameter.getFdrAmount()%>"/>&nbsp;</td>
                            <td style="text-align:right">
                            <%
                                if (!convertError) {
                                    %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
                                }
                                else {
                                    %><bean:message key="label.common.error.no.conversion" /><%
                                }
                            %>&nbsp;
                            </td>
                            <td style="text-align:right"><integro:empty-if-null value="<%=stagingParameter.getReferenceNo()%>"/>&nbsp;</td>
                            <td style="text-align:center">
                            <%
                            if(!convertError){
                                %><a href="BL_FDR.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountAccumulated=<integro:amount param="all" amount="<%=amountAccumulated%>" />">View</a><%
                            }
                            else{
                                %><a href="BL_FDR.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountAccumulated=<bean:message key="label.common.error.no.conversion"/>">View</a><%
                            }
                            %>
                            </td>
                        </tr>
                    </tr>
                </logic:iterate>
            </logic:present>
            <logic:notPresent name="fdrList">
                <tr class="odd">
                    <td colspan="10"><bean:message key="label.common.empty"/></td>
                </tr>
            </logic:notPresent>
            <% if (index > 0) { %>
            <tr>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
                <td class="total" style="text-align:right">
                <%
                    if (!convertError) {
                        %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
                    }
                    else {
                        %><bean:message key="label.common.error.no.conversion"/> <%
                    }
                %>
                </td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
            </tr>
            <% } %>
            </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>