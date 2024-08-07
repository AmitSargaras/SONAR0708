<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.app.bridgingloan.bus.IBuildUp,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Checker Build-up Details
* Description: This is a summary screen reflecting the units being built.
* It can be reached by clicking on the “Build-Up Details” tab on the top of the screen.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>
<%
    try {
        IBridgingLoanTrxValue bridgingLoanTrxValue = (IBridgingLoanTrxValue) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanTrxValue");

        if (bridgingLoanTrxValue != null) {
            IBuildUp[] buildUpActualList = null;
            if (bridgingLoanTrxValue.getBridgingLoan() != null) {  //actual will be null if this is new record
                buildUpActualList = bridgingLoanTrxValue.getBridgingLoan().getBuildUpList();
            }
            IBuildUp[] buildUpStagingList = bridgingLoanTrxValue.getStagingBridgingLoan().getBuildUpList();

            if (buildUpActualList != null || buildUpStagingList != null) {
                List compResult = CompareOBUtil.compOBArray(buildUpStagingList, buildUpActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("buildUpList", list);
            }
        }
%>

<html>
<head>
<title>CMS</title>


<script>
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('img/win/min1.gif','img/win/max1.gif','img/win/close1.gif','img/icon/save_iconb1.gif','img/icon/submit_iconb1.gif','img/icon/print_iconb1.gif','img/icon/printpreview_iconb1.gif','img/icon/reset_iconb1.gif','img/icon/cancel_iconb1.gif','img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_BuildUp.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="amountRedemption"/>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr id="envCanvas">
    <td width="100%" valign="top" id="envCanvasContent">
        <table id="window" border="0" cellpadding="0" cellspacing="0">
		<tr id="winCanvas">
		    <td>
                <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
                <tr>
                    <td colspan="3" valign="top" style="height:100%;width:100%;">
                        <div id="contentCanvas" style="height:100%;width:100%;">
                        <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:0px">
                        <tr>
                            <td width="63%"><h3><bean:message key="label.bridgingloan.build.up.title"/></h3></td>
                            <td width="37%" style="text-align:right" valign="bottom"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                                    <thead>
                                    <tr>
                                        <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                                        <td width="*"><bean:message key="label.bridgingloan.prty.typ"/></td>
                                        <td width="10%"><bean:message key="label.bridgingloan.unt.id.no"/></td>
                                        <td width="10%"><bean:message key="label.bridgingloan.block.no"/></td>
                                        <td width="8%"><bean:message key="label.bridgingloan.unt.no"/></td>
                                        <td width="8%"><bean:message key="label.bridgingloan.unt.dischrg"/></span></td>
                                        <td width="12%"><bean:message key="label.bridgingloan.redempt.amt"/></td>
                                        <td width="12%"><bean:message key="label.bridgingloan.ttl.spr"/></span></td>
                                        <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                                    </tr>
                                    </thead>
                                <tbody>
                                <%
                                    Amount amountRedemption = null;
                                    boolean convertError = false;
                                    int index = 0;
                                %>
                                <logic:present name="buildUpList">
                                    <logic:iterate id="compResult" name="buildUpList" type="com.integrosys.base.techinfra.diff.CompareResult">
                                    <%
                                        IBuildUp stagingParameter = (IBuildUp) compResult.getObj();
                                        index++;

                                        //if one convertion found error, the following no need convert.
                                        if (!convertError) {
                                            try {
                                                amountRedemption = CommonUtil.addAmount(amountRedemption, stagingParameter.getRedemptionAmount());
                                            }
                                            catch (AmountConversionException e) {
                                                if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                                                    convertError = true;
                                                    amountRedemption = null;
                                                }
                                            }
                                        }
                                    %>
                                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                                        <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=index%></td>
                                        <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(stagingParameter.getPropertyType())%>"/>&nbsp;</td>
                                        <td><integro:empty-if-null value="<%=stagingParameter.getUnitID()%>"/>&nbsp;</td>
                                        <td><integro:empty-if-null value="<%=stagingParameter.getBlockNo()%>"/>&nbsp;</td>
                                        <td style="text-align:right"><integro:empty-if-null value="<%=stagingParameter.getUnitNo()%>"/>&nbsp;</td>
                                        <td style="text-align:center"><integro:boolean-display style="yn" value="<%=stagingParameter.getIsUnitDischarged()%>"/>&nbsp;</td>
                                        <td style="text-align:right"><integro:amount amount="<%=stagingParameter.getRedemptionAmount()%>"/>&nbsp;</td>
                                        <td style="text-align:right">
                                        <%
                                            if (!convertError) { //TODO: Incorrect amount.
                                                %><integro:amount param="all" amount="<%=amountRedemption%>" /><%
                                            }
                                            else {
                                                %><bean:message key="label.common.error.no.conversion" /><%
                                            }
                                        %>
                                        </td>
                                        <td style="text-align:center">
                                        <%
                                        if(!convertError){
                                            %><a href="BL_BuildUp.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountRedemption=<integro:amount param="all" amount="<%=amountRedemption%>" />">View</a><%
                                        }
                                        else{
                                            %><a href="BL_BuildUp.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountRedemption=<bean:message key="label.common.error.no.conversion"/>">View</a><%
                                        }
                                        %>
                                    </tr>
                                    </logic:iterate>
                                </logic:present>
                                <logic:notPresent name="buildUpList">
                                    <tr class="odd">
                                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                                    </tr>
                                </logic:notPresent>
                                <% if (index > 0) { %>
                                <tr class="total">
                                    <td class="total">&nbsp;</td>
                                    <td class="total">&nbsp;</td>
                                    <td class="total">&nbsp;</td>
                                    <td class="total">&nbsp;</td>
                                    <td class="total" >&nbsp;</td>
                                    <td class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
                                    <td class="total" style="text-align:right">
                                    <%
                                        if (!convertError) {
                                            %><integro:amount param="all" amount="<%=amountRedemption%>" /><%
                                        }
                                        else {
                                            %><bean:message key="label.common.error.no.conversion"/><%
                                        }
                                    %>
                                    </td>
                                    <td class="total" >&nbsp;</td>
                                    <td class="total" >&nbsp;</td>
                                </tr>
                                <% } %>
                                </tbody>
                                </table>
                            </td>
                        </tr>
                        </table>
                        </div>
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
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>