<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursementDetail,
                 com.integrosys.cms.ui.bridgingloan.advspayment.DisbursementForm,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursement,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoanSummary,
                 java.util.ArrayList"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Update Disbursement
* Description: This screen allows the adding/update of new Disbursement.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);

        DisbursementForm objDisbursementForm = (DisbursementForm) request.getAttribute("BL_DisbursementForm");
        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        DefaultLogger.debug(this, "objDisbursementForm: " + objDisbursementForm);
        DefaultLogger.debug(this, "objBridgingLoan: " + objBridgingLoan);

        IDisbursement[] objDisbursement = null;
        if (objBridgingLoan != null)
            objDisbursement = (IDisbursement[]) objBridgingLoan.getDisbursementList();

        if (objDisbursementForm == null)
            objDisbursementForm = new DisbursementForm();

        int disbursementIndex = 0;
        if (event.equals("maker_prepare_create") || event.equals("create")) {
            if (objBridgingLoan != null)
                disbursementIndex = objBridgingLoan.getDisbursementList().length;
            else 
                disbursementIndex = -1;
        }
        else if ((String) request.getParameter("disbursementIndex") != null && !String.valueOf(request.getParameter("disbursementIndex")).equals(""))
            disbursementIndex = Integer.parseInt(request.getParameter("disbursementIndex"));

        DefaultLogger.debug(this, "disbursementIndex: " + disbursementIndex);
%>

<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<style type="text/css">
<!--
.style1 {color: #0000FF}
//-->
</style>
<script>
function JumpOnSelectactive(actionPage, selectObj, index) {
    var selectIndex = selectObj.selectedIndex;
	if (selectObj.options[selectIndex].value == "view")
    	document.forms[0].event.value = "view";
    else if (selectObj.options[selectIndex].value == "update")
        document.forms[0].event.value = "maker_prepare_update";
    else if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete";

    document.forms[0].action = actionPage;
    document.forms[0].current_page.value = "update_page";
    document.forms[0].disbursementIndex.value = '<%=disbursementIndex%>';
    document.forms[0].disbursementDetailIndex.value = index;
    document.forms[0].submit();
}

function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}

function gotoPage(actionPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif')">

<html:form action="BL_Disbursement.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="current_page" />
<input type="hidden" name="next_page" />
<input type="hidden" name="disbursementIndex" value="<%=disbursementIndex%>"/>
<input type="hidden" name="disbursementDetailIndex" />
<input type="hidden" name="amountDisbursed"/>
<input type="hidden" name="orig_country" value="<%=request.getParameter("orig_country")%> "/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right"><span class="style1">*</span> <bean:message key="label.common.mandatory"/></td>
    </tr>    
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.dis.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.purp.dis"/><span class="style1">*</span></td>
                <td>
                    <% if (event.equals("maker_prepare_create") || event.equals("create")) { %>
                        <html:select property="purpose" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="purposeValues" labelName="purposeLabels"/>
                        </html:select>
                        <html:errors property="purpose"/>
                    <% } else { %>
                        <integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(objDisbursementForm.getPurpose())%>" />
                        <html:hidden property="purpose" value="<%=objDisbursementForm.getPurpose()%>" />
                    <% } %>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.ttl.amt.dis"/></td>
                <td>
                <%
                    Amount amountDisbursed = null;
                    boolean convertError = false;
                    IDisbursementDetail[] objDisbursementDetail = null;
                    if (objDisbursement != null && objDisbursement[disbursementIndex].getDisbursementDetailList() != null) {
                        objDisbursementDetail = (IDisbursementDetail[]) objDisbursement[disbursementIndex].getDisbursementDetailList();
                        if (objDisbursementDetail != null) {
                            for (int index=0; index<objDisbursementDetail.length; index++) {
                                if (objDisbursementDetail[index].getIsDeletedInd() != true) { //Record not deleted
                                    if (!convertError) {
                                        try {
                                            amountDisbursed = CommonUtil.addAmount(amountDisbursed, objDisbursementDetail[index].getDisburseAmount());
                                        } catch (AmountConversionException e) {
                                            if(e.toString().indexOf("AMT_CONV_EX")>-1){
                                                convertError = true;
                                                amountDisbursed = null;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (!convertError) {
                        %><integro:amount param="all" amount="<%=amountDisbursed%>" /><%
                    }
                    else {
                        %><bean:message key="label.common.error.no.conversion" /><%
                    }
                %>
                </td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td><html:textarea property="disRemarks" rows="3" cols="80"/> <html:errors property="disRemarks" /></td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
      <td >&nbsp;</td>
    </tr>
    <%
    //For maker create and when objBridgingLoan is null
    if ((!event.equals("maker_prepare_create") || !event.equals("create")) && objBridgingLoan == null) { %>
    <tr>
      <td style="text-align:right"><input name="Submit222" type="button" class="btnNormal" value="Add" onclick="gotoPage('BL_Disbursement.do', 'maker_prepare_save_create')" style="width:60px"/>
    </tr>
    <% } else { %>
    <tr>
      <td style="text-align:right"><input name="Submit222" type="button" class="btnNormal" value="Add" onclick="gotoPage('BL_DisbursementDetail.do', 'maker_prepare_create')" style="width:60px"/>
    </tr>
    <% } %>
    <tr>
      <td height="3" ></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr style="text-align:center">
                    <td width="4%" ><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.dis.date"/></td>
                    <td width="20%"><bean:message key="label.bridgingloan.sub.purp.dis"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.amt.dis"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.mode.dis"/><br/></td>
                    <td width="16%"><bean:message key="label.bridgingloan.payee"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.ref.no"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.gl.ref.no"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        if (objDisbursement != null && objDisbursement[disbursementIndex].getDisbursementDetailList() != null) {
                            objDisbursementDetail = (IDisbursementDetail[]) objDisbursement[disbursementIndex].getDisbursementDetailList();
                            if (objDisbursementDetail != null) {
                                for (int index=0; index<objDisbursementDetail.length; index++) {
                                    if (objDisbursementDetail[index].getIsDeletedInd() != true) { //Record not deleted
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index"><%=(index+1)%></td>
                        <td style="text-align:center"><integro:date object="<%=objDisbursementDetail[index].getDisbursementDate()%>" /></td>
                        <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_SUBPURPOSE).getCommonCodeLabel(objDisbursementDetail[index].getSubpurpose())%>"/></td>
                        <td style="text-align:right"><integro:amount amount="<%=objDisbursementDetail[index].getDisburseAmount()%>"/></td>
                        <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_MODE).getCommonCodeLabel(objDisbursementDetail[index].getDisbursementMode())%>"/></td>
                        <td><integro:htmltext value="<%=objDisbursementDetail[index].getPayee()%>"/></td>
                        <td><integro:htmltext value="<%=objDisbursementDetail[index].getReferenceNumber()%>"/></td>
                        <td><integro:htmltext value="<%=objDisbursementDetail[index].getGlReferenceNumber()%>"/></td>
                        <td style="text-align:center">
                            <select name="select3" onChange="JumpOnSelectactive('BL_DisbursementDetail.do', this, '<%=index%>')">
                                <option selected="selected">Please Select</option>
                                <option value="view">View</option>
                                <option value="update">Edit</option>
                                <option value="delete">Delete</option>
                            </select>
                        </td>
                    </tr>
                    <%  } } }
                    }
                    else { %>
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:center" valign="bottom">
            <a href="javascript:gotoPage('BL_AdvsPayment.do', 'list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
        </td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>