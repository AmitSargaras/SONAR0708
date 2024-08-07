<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IBuildUp,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.bridgingloan.bus.ISalesProceeds"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Build-up Details
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
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);

        IBuildUp[] buildUpSummary = (IBuildUp[]) request.getAttribute("buildUpSummary");
        DefaultLogger.debug(this, "buildUpSummary: " + buildUpSummary);
        if (buildUpSummary == null) {
            IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");

            if (objBridgingLoan != null)
                buildUpSummary = (IBuildUp[]) objBridgingLoan.getBuildUpList();
        }
%>

<html>
<head>
<title>CMS</title>


<script>
function JumpOnSelectactive(selectObj, index) {
    var selectIndex = selectObj.selectedIndex;
	if (selectObj.options[selectIndex].value == "view")
    	document.forms[0].event.value = "view";
    else if (selectObj.options[selectIndex].value == "update")
        document.forms[0].event.value = "maker_prepare_update";
    else if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete";

    document.forms[0].buildUpIndex.value = index;
    document.forms[0].submit();
}

function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}

function generateCopy() {
    var index = document.forms[0].copyFromIndex.value;
    if (index == null || index == '' || index == 'undefined')
        alert('Please select which record to copy from!');
    else
        window.open('BL_BuildUp.do?event=prepare_add_copy&copyFromIndex='+index, 'buildup_copy', 'toolbar=no, height=250, width=550, location=no, directories=no, statusbar=yes, menubar=no, scrollbars=yes, resizable=yes');
}

function setIndex(indexObj) {
    document.forms[0].copyFromIndex.value = indexObj.value;
}

</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('img/win/min1.gif','img/win/max1.gif','img/win/close1.gif','img/icon/save_iconb1.gif','img/icon/submit_iconb1.gif','img/icon/print_iconb1.gif','img/icon/printpreview_iconb1.gif','img/icon/reset_iconb1.gif','img/icon/cancel_iconb1.gif','img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_BuildUp.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="buildUpIndex" value="<%=request.getParameter("buildUpIndex")%>"/>
<input type="hidden" name="amountRedemption"/>
<input type="hidden" name="current_page" value="<%=event%>"/>
<input type="hidden" name="copyFromIndex" />

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
                        <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0px">
                        <tr>
                            <td width="63%"><h3><bean:message key="label.bridgingloan.build.up.title"/></h3></td>
                            <td style="text-align:right">
                            <%  if (isEdit != null && isEdit.equals("true")) {
                                    if (buildUpSummary != null && buildUpSummary.length > 0) { %>
                                        <input type="button" name="button22" value="Add From Copy" class="btnNormal" onclick="javascript:generateCopy();" style="width:110px" />
                                    <% } %>
                                    <input type="button" name="button23" value="Create New Unit" class="btnNormal" onclick="javascript:submitPage('maker_prepare_create');" style="width:110px"/>
                            <% } %>
                            </td>
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
                                        <%
                                        if (isEdit != null && isEdit.equals("true")) { %>
                                            <td width="10%"><bean:message key="label.bridgingloan.copy.frm"/></td>
                                        <% } %>
                                        <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                                    </tr>
                                    </thead>
                                <tbody>
                                <%
                                    Amount amountRedemption = null;
                                    Amount amountReceived = null;
                                    boolean buConvertError = false;
                                    boolean spConvertError = false;
                                    ISalesProceeds[] objSalesProceeds = null;
                                    if (buildUpSummary != null) {
                                        for (int index=0; index<buildUpSummary.length; index++) {
                                            amountReceived = null;
                                            if (buildUpSummary[index].getIsDeletedInd() != true) { //Record not deleted
                                                if (!buConvertError) {
                                                    try {
                                                        amountRedemption = CommonUtil.addAmount(amountRedemption, buildUpSummary[index].getRedemptionAmount());
                                                    } catch (AmountConversionException e) {
                                                        if (e.toString().indexOf("AMT_CONV_EX")>-1){
                                                            buConvertError = true;
                                                            amountRedemption = null;
                                                        }
                                                    }
                                                }

                                                objSalesProceeds = (ISalesProceeds[]) buildUpSummary[index].getSalesProceedsList();

                                                if (objSalesProceeds != null) {
                                                    for (int i=0; i<objSalesProceeds.length; i++) {
                                                        if (!spConvertError) {
                                                            try {
                                                                amountReceived = CommonUtil.addAmount(amountReceived, objSalesProceeds[i].getReceiveAmount());
                                                            } catch (AmountConversionException e) {
                                                                if (e.toString().indexOf("AMT_CONV_EX")>-1){
                                                                    spConvertError = true;
                                                                    amountReceived = null;
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                %>
                                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                                        <td style="text-align:center" class="index"><%=(index+1)%></td>
                                        <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(buildUpSummary[index].getPropertyType())%>"/>&nbsp;</td>
                                        <td><integro:empty-if-null value="<%=buildUpSummary[index].getUnitID()%>"/>&nbsp;</td>
                                        <td><integro:empty-if-null value="<%=buildUpSummary[index].getBlockNo()%>"/>&nbsp;</td>
                                        <td><integro:empty-if-null value="<%=buildUpSummary[index].getUnitNo()%>"/>&nbsp;</td>
                                        <td style="text-align:center"><integro:boolean-display style="yn" value="<%=buildUpSummary[index].getIsUnitDischarged()%>"/>&nbsp;</td>
                                        <td style="text-align:right"><integro:amount amount="<%=buildUpSummary[index].getRedemptionAmount()%>" />&nbsp;</td>
                                        <td style="text-align:right">&nbsp;
                                        <%
                                            if (!buConvertError) {
                                                %><integro:amount param="all" amount="<%=amountReceived%>" /><%
                                            }
                                            else {
                                                %><bean:message key="label.common.error.no.conversion" /><%
                                            }
                                        %>
                                        </td>
                                        <%
                                        if (isEdit != null && isEdit.equals("true")) { %>
                                            <td style="text-align:center"><input type="radio" id="isCopyFrom" name="isCopyFrom" value="<%=index%>" onclick="javascript:setIndex(this);" /></td>
                                        <% } %>
                                        <td style="text-align:center">
                                        <% if (isEdit != null && isEdit.equals("true")) { %>
                                            <select name="select3" onChange="JumpOnSelectactive(this, '<%=index%>')">
                                                <option selected="selected">Please Select</option>
                                                <option value="view">View</option>
                                                <option value="update">Edit</option>
                                                <option value="delete">Delete</option>
                                            </select>
                                        <% } else { %>
                                            <a href="BL_BuildUp.do?event=view&buildUpIndex=<%=index%>">View</a>
                                        <% } %>
                                        </td>
                                    </tr>
                                    <% } } %>
                                    <tr class="total">
                                        <td class="total">&nbsp;</td>
                                        <td class="total">&nbsp;</td>
                                        <td class="total">&nbsp;</td>
                                        <td class="total">&nbsp;</td>
                                        <td class="total">&nbsp;</td>
                                        <td class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
                                        <td class="total" style="text-align:right" >
                                        <%
                                            if (!buConvertError) {
                                                %><integro:amount param="all" amount="<%=amountRedemption%>" /><%
                                            }
                                            else {
                                                %><bean:message key="label.common.error.no.conversion"/> <%
                                            }
                                        %>
                                        </td>
                                        <td class="total" style="text-align:center" >&nbsp;</td>
                                        <% if (isEdit != null && isEdit.equals("true")) { %>
                                            <td class="total" style="text-align:center" >&nbsp;</td>
                                        <% } %>
                                        <td class="total">&nbsp;</td>
                                    </tr>
                                    <% } else { %>
                                    <tr class="odd">
                                        <td colspan="10"><bean:message key="label.common.empty"/></td>
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