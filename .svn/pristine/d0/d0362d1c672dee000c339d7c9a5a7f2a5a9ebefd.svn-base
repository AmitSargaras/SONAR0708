<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.bridgingloan.bus.IFDR,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
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
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        IFDR[] fdrSummary = (IFDR[]) request.getAttribute("fdrSummary");
        if (fdrSummary == null) {
            IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");

            if (objBridgingLoan != null)
                fdrSummary = (IFDR[]) objBridgingLoan.getFdrList();
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
//-->
</style>
<script src="js/imageNavigation.js"></script>
<script>
function JumpOnSelectactive(selectObj, index, amountAccumulated) {
    var selectIndex = selectObj.selectedIndex;
	if (selectObj.options[selectIndex].value == "view")
    	document.forms[0].event.value = "view";
    else if (selectObj.options[selectIndex].value == "update")
        document.forms[0].event.value = "maker_prepare_update";
    else if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete";

    document.forms[0].amountAccumulated.value = amountAccumulated;
    document.forms[0].fdrIndex.value = index;
    document.forms[0].submit();
}

function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/cancel2.gif')">
<html:form action="BL_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="fdrIndex"/>
<input type="hidden" name="amountAccumulated"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" ><h3><bean:message key="label.bridgingloan.fdr.reg.title"/> </h3></td>
        <% if (isEdit != null && isEdit.equals("true")) { %>
            <td width="42%" style="text-align:right" valign="bottom" ><input name="Submit222" type="button" class="btnNormal" value="Add New " onclick="submitPage('maker_prepare_create')" style="width:110px"/> </td>
        <% } %>
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
                        if (fdrSummary != null) {
                            for (int index=0; index<fdrSummary.length; index++) {
                                if (fdrSummary[index].getIsDeletedInd() != true) { //Record not deleted

                                    if(!convertError){
                                        try {
                                            amountAccumulated = CommonUtil.addAmount(amountAccumulated, fdrSummary[index].getFdrAmount());
                                        } catch (AmountConversionException e) {
                                            if(e.toString().indexOf("AMT_CONV_EX")>-1){
                                                convertError = true;
                                                amountAccumulated = null;
                                            }
                                        }
                                    }
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index"><%=(index+1)%></td>
                        <td style="text-align:center"><integro:date object="<%=fdrSummary[index].getFdrDate()%>" />&nbsp;</td>
                        <td style="text-align:right"><integro:empty-if-null value="<%=fdrSummary[index].getAccountNo()%>"/>&nbsp;</td>
                        <td style="text-align:right"><integro:amount amount="<%=fdrSummary[index].getFdrAmount()%>"/>&nbsp;</td>
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
                        <td style="text-align:right"><integro:empty-if-null value="<%=fdrSummary[index].getReferenceNo()%>"/>&nbsp;</td>
                        <td style="text-align:center">   
                            <%
                            if (isEdit != null && isEdit.equals("true")) {
                                if(!convertError){
                                    %><select onChange="JumpOnSelectactive(this,'<%=index%>','<integro:amount param="all" amount="<%=amountAccumulated%>" />')"><%
                                }
                                else{
                                    %><select onChange="JumpOnSelectactive(this,'<%=index%>','<bean:message key="label.common.error.no.conversion"/>')"><%
                                }
                            %>
                                <option selected="selected">Please Select</option>
                                <option value="view">View</option>
                                <option value="update">Edit</option>
                                <option value="delete">Delete</option>
                            </select>
                            <% }
                            else {
                                if(!convertError){
                                    %><a href="BL_FDR.do?event=view&fdrIndex=<%=index%>&amountAccumulated=<integro:amount param="all" amount="<%=amountAccumulated%>" />">View</a><%
                                }
                                else{
                                    %><a href="BL_FDR.do?event=view&fdrIndex=<%=index%>&amountAccumulated=<bean:message key="label.common.error.no.conversion"/>">View</a><%
                                }
                            }
                            %>
                        </td>
                    </tr>
                    <%  } }  %>
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
                    <% }
                    else { %>
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
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