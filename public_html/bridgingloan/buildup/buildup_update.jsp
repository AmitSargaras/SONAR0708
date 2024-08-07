<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.bridgingloan.buildup.BuildUpForm,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.ISalesProceeds,
                 com.integrosys.cms.app.bridgingloan.bus.IBuildUp,
                 com.integrosys.cms.app.bridgingloan.bus.OBBridgingLoan,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Completed Units – Create New
* Description: This is a screen to input the details of individual units in the bridging loan.
* It can be reached by clicking on the “CREATE NEW UNITS” tab on the top of the BUILT UP DETAILS summary screen.
*
* @author $Author: KLYong  $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);

        BuildUpForm objBuildUpForm = (BuildUpForm) request.getAttribute("BL_BuildUpForm");
        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");

        int buildUpIndex = 0;
        if (event.equals("maker_prepare_create") || event.equals("create")) {
            if (objBridgingLoan != null)
                buildUpIndex = objBridgingLoan.getBuildUpList().length;
        }
        else if ((String) request.getParameter("buildUpIndex") != null && !String.valueOf(request.getParameter("buildUpIndex")).equals(""))
            buildUpIndex = Integer.parseInt(request.getParameter("buildUpIndex"));

        String countryCode = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.orig_country");
        String buildUpID = objBuildUpForm.getBuildUpID();
        DefaultLogger.debug(this, "countryCode: " + countryCode);
        DefaultLogger.debug(this, "getBuildUpID: " + objBuildUpForm.getBuildUpID());
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
<script src="js/calendar.js"></script>
<script src="js/calDriver.js"></script>
<script>
function JumpOnSelectactive(childPage, selectObj, index, amountToBeReceived) {
    var selectIndex = selectObj.selectedIndex;
	if (selectObj.options[selectIndex].value == "view")
    	goChildPage((childPage + '_view'), index, amountToBeReceived);
    else if (selectObj.options[selectIndex].value == "update")
        goChildPage((childPage + '_update'), index, amountToBeReceived);
    else if (selectObj.options[selectIndex].value == "delete")
        goChildPage((childPage + '_delete'), index, amountToBeReceived);
}

function gotoPage(childPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].buildUpIndex.value = '<%=buildUpIndex%>';
    goChildPage(childPage, '', '');
}

function submitPage(event) {
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function goChildPage(childPage, index, amountToBeReceived) {
    document.forms[0].current_page.value = "update_page";
    document.forms[0].salesProceedsIndex.value = index;
<%--    document.forms[0].amountToBeReceived.value = amountToBeReceived;--%>
    document.forms[0].next_page.value = childPage;
    document.forms[0].event.value = "maker_navigate_tab";
    document.forms[0].submit();
}

function showTextBox(selectObj) {
    var buildUpID = '<%=buildUpID%>';
    if (buildUpID != '') {
        if (selectObj.value == "Yes" || selectObj.value == "Y")
            document.forms[0].printDisclaimer.style.display = "";
        else
            document.forms[0].printDisclaimer.style.display = "none";
    }
    else
        return;
}

function printDislaimer(buildUpID, countryCode) {
    window.open('BL_BuildUp.do?event=generateBLDisclaimerLetter&buildupID='+buildUpID+'&orig_country='+countryCode, 'Disclaimer_Report', 'toolbar=no, location=no, directories=no, statusbar=yes, menubar=no, scrollbars=yes, resizable=yes');
}

function filterNegative(numValue) {
    numValue = numValue.replace("<font color='#FF0000'>", "");
    numValue = numValue.replace("</font>", "");
    return numValue;
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_BuildUp.do">
<input type="hidden" name="event" />
<input type="hidden" name="current_page" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="buildUpIndex" value="<%=buildUpIndex%>" />
<input type="hidden" name="salesProceedsIndex" />
<input type="hidden" name="amountReceived"/>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right"><span class="style1">*</span> <bean:message key="label.common.mandatory"/></td>
    </tr>
    <tr>
        <td><h3><bean:message key="label.bridgingloan.cmplt.unt.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prty.typ"/> <span class="style1">*</span></td>
                <td width="30%">
                    <html:select property="propertyType" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="propertyTypeValues" labelName="propertyTypeLabels"/>
                    </html:select>
                    <html:errors property="propertyType"/></td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.unt.id.no"/> <span class="style1">*</span></td>
                <td width="30%"><html:text property="unitID" /><html:errors property="unitID"/></td>
            </tr>
            <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.block.no"/> <span class="style1">*</span></td>
                <td width="30%"><html:text property="blockNo" /><html:errors property="blockNo"/></td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.title.no"/> </td>
                <td width="30%"><html:text property="titleNo" /><html:errors property="titleNo"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.unt.no"/> <span class="style1">*</span></td>
                <td><html:text property="unitNo" /><html:errors property="unitNo"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.unt.dischrg"/> <span class="style1">*</span></td>
                <td><html:radio property="isUnitDischarged" value="Y" onclick="javascript:showTextBox(this)" /><bean:message key="label.common.yes"/> &nbsp;&nbsp;
                    <html:radio property="isUnitDischarged" value="N" onclick="javascript:showTextBox(this)" /><bean:message key="label.common.no"/><html:errors property="isUnitDischarged"/>
                    <%
                    if (buildUpID != null && !buildUpID.equals("")) {
                        if (objBuildUpForm.getIsUnitDischarged().equals("Y")) { %>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="printDisclaimer" type="button" class="btnNormal" value="Print Disclaimer Report" onclick="javascript:printDislaimer('<%=buildUpID%>', '<%=countryCode%>');" style="width:145px; display:" />
                        <% } else { %>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="printDisclaimer" type="button" class="btnNormal" value="Print Disclaimer Report" onclick="javascript:printDislaimer('<%=buildUpID%>', '<%=countryCode%>');" style="width:145px; display:none" />
                    <% } } %>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.aprx.area"/> <span class="style1">*</span> </td>
                <td><html:text property="approxArea" /><html:errors property="approxArea" />
                    <html:select property="approxAreaUOM" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="areaValues" labelName="areaLabels"/>
                    </html:select>
                    <html:errors property="approxAreaUOM"/>
                </td>
                <td class="fieldname"><bean:message key="label.bridgingloan.aprx.area"/></td>
                <td><html:text property="approxAreaSecondary" /><html:errors property="approxAreaSecondary" />
                    <html:select property="approxAreaUOMSecondary" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="areaValues" labelName="areaLabels"/>
                    </html:select>
                    <html:errors property="approxAreaUOMSecondary"/>
                </td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.redempt.amt"/> <span class="style1">*</span></td>
                <td>
                    <html:select property="redemptionCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="redemptionCurrency"/>
                    <html:text property="redemptionAmount" />
                    <html:errors property="redemptionAmount"/>
                </td>
                <td class="fieldname"><bean:message key="label.bridgingloan.snp.price"/> </td>
                <td>
                    <html:select property="salesCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="salesCurrency"/>

                    <html:text property="salesAmount" />
                    <html:errors property="salesAmount"/>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.date.snp"/> </td>
                <td><html:text property="salesDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image51" border="0" id="Image51" onclick="return showCalendar('salesDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image51','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="salesDate"/>
                </td>
                <td class="fieldname"><bean:message key="label.bridgingloan.name.prch"/> </td>
                <td><html:text property="purchaserName" /><html:errors property="purchaserName"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.end.financ"/> </td>
                <td><html:text property="endFinancier" /><html:errors property="endFinancier"/></td>
                <td class="fieldname">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td colspan="3">
                    <html:textarea property="buRemarks" rows="3" cols="80"/>&nbsp;
                    <html:errors property="buRemarks"/></td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    </thead>
</tbody>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%"><h3><bean:message key="label.bridgingloan.rent.prcd.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td >
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.tent.agrmt.date"/> </td>
                <td width="30%">
                    <html:text property="tenancyDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image5" border="0" id="Image5" onclick="return showCalendar('tenancyDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="tenancyDate"/>
                </td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.tent.name"/> </td>
                <td width="30%"><html:text property="tenantName" /></td>
            </tr>
            <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prd.tent"/> </td>
                <td width="30%">
                    <html:text property="tenancyPeriod" />
                    <html:select property="tenancyPeriodUnit" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="tenancyPeriodValues" labelName="tenancyPeriodLabels"/>
                    </html:select>
                    <html:errors property="tenancyPeriodUnit"/>
                </td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.expry.date"/> </td>
                <td width="30%" class="even">&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.rent.amt"/> </td>
                <td>
                    <html:select property="rentalCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="rentalCurrency"/>
                    <html:text property="rentalAmount" />
                </td>
                <td class="fieldname"><bean:message key="label.bridgingloan.pymt.freq"/> </td>
                <td>
                    <html:select property="paymentFrequency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="frequencyValues" labelName="frequencyLabels"/>
                    </html:select>
                    <html:errors property="paymentFrequency"/>
                </td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    </thead>
    </tbody>
</table>
<br>
<table class="tblFormSection" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px" dwcopytype="CopyTableRow">
    <thead>
    <tr>
        <td width="84%"><h3><bean:message key="label.bridgingloan.ttl.sprpp.title"/> </h3></td>
        <td style="text-align:right" width="16%" valign="bottom">
        <input name="button1" type="button" class="btnNormal" value="Add New" onclick="javascript:gotoPage('salesproceeds_add', 'maker_navigate_tab')" style="width:80px"/>
        </td>
    </tr>
    </thead>
</table>
<table class="tblInfo" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td width="4%"><bean:message key="label.bridgingloan.sn"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.date"/> </td>
        <td width="*"><bean:message key="label.bridgingloan.purp.prcd"/> </td>
        <td width="*"><bean:message key="label.bridgingloan.bnk.name"/> </td>
        <td width="10%"><bean:message key="label.bridgingloan.chq.no"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.amt.rcv"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.amt.to.be.rcv"/> </td>
        <td width="8%"><bean:message key="label.bridgingloan.status"/> </td>
        <td width="10%"><bean:message key="label.bridgingloan.action"/> </td>
    </tr>
    </thead>
    <tbody>
        <%
            Amount redemptionAmount = null;
            Amount amountReceived = null;
            Amount amountToBeReceived = null;
            boolean convertError = false;
            boolean balConvertError = false;
                IBuildUp[] objBuildUp = null;
                    if (objBridgingLoan != null)
                        objBuildUp = (IBuildUp[]) objBridgingLoan.getBuildUpList();

            if (objBuildUp != null && objBuildUp[buildUpIndex].getSalesProceedsList() != null) {
                ISalesProceeds[] objSalesProceeds = (ISalesProceeds[]) objBuildUp[buildUpIndex].getSalesProceedsList();

                redemptionAmount = objBuildUp[buildUpIndex].getRedemptionAmount(); //Total amount for redemption amount
                if (objSalesProceeds != null) {
                    for (int index=0; index<objSalesProceeds.length; index++) {
                        if (objSalesProceeds[index].getIsDeletedInd() != true) {
                            if (!convertError) {
                                try {
                                    amountReceived = CommonUtil.addAmount(amountReceived, objSalesProceeds[index].getReceiveAmount());
                                } catch (AmountConversionException e) {
                                    if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                                        convertError = true;
                                        amountReceived = null;
                                        amountToBeReceived = null;
                                    }
                                }
                            }
                            if (!balConvertError) {
                                try {
                                    amountToBeReceived = CommonUtil.subtractAmount(redemptionAmount, amountReceived);  //Redemption amount - Amount received
                                } catch (AmountConversionException e) {
                                    if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                                        balConvertError = true;
                                        amountToBeReceived = null;
                                    }
                                }
                            }
        %>
        <tr class='<%=(index%2==0?"even":"odd")%>'>
            <td style="text-align:center" class="index"><%=(index+1)%></td>
            <td style="text-align:center"><integro:date object="<%=objSalesProceeds[index].getProceedsDate()%>" /></td>
            <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_PUR).getCommonCodeLabel(objSalesProceeds[index].getPurpose())%>"/></td>
            <td><integro:htmltext value="<%=objSalesProceeds[index].getBankName()%>"/></td>
            <td><integro:htmltext value="<%=objSalesProceeds[index].getChequeNo()%>"/></td>
            <td style="text-align:right">
            <%
                if (!convertError) {
                    %><integro:amount param="all" amount="<%=objSalesProceeds[index].getReceiveAmount()%>" /><%
                }
                else {
                    %><bean:message key="label.common.error.no.conversion" /><%
                }
            %>
            </td>
            <td style="text-align:right">
            <%
                if (!balConvertError) {
                    %><integro:amount param="all" amount="<%=amountToBeReceived%>" /><%
                }
                else {
                    %><bean:message key="label.common.error.no.conversion" /><%
                }
            %>
            </td>
            <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_STAT).getCommonCodeLabel(objSalesProceeds[index].getStatus())%>"/></td>
            <td style="text-align:center">
                <select name="select3" onChange="JumpOnSelectactive('salesproceeds', this, '<%=index%>', '')">
                    <option selected="selected">Please Select</option>
                    <option value="view">View</option>
                    <option value="update">Edit</option>
                    <option value="delete">Delete</option>
                </select>
                <input type="hidden" name="amountToBeReceived" value="<integro:amount param="all" amount="<%=amountToBeReceived%>"/>" />
            </td>
        </tr>
        <% } } } %>
        <tr>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
            <td class="total" style="text-align:right">
            <%
                if (!convertError) {
                    %><integro:amount param="all" amount="<%=amountReceived%>" /><%
                }
                else {
                    %><bean:message key="label.common.error.no.conversion" /><%
                }
            %>
            </td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
        </tr>
        <% } else { %>
        <tr class="odd">
            <td colspan="10"><bean:message key="label.common.empty"/></td>
        </tr>
        <% } %>
    </tbody>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
</tr>
<tr>
    <td>
    <%
    if(event.equals("maker_prepare_create") || event.equals("create")){
        %><a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:submitPage('list_summary')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    else{
        %><a href="javascript:submitPage('update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:submitPage('list_summary')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    %>
    </td>
</tr>
<tr>
    <td'>&nbsp;</td>
</tr>
</table>
</html:form>
</body>
</html>
<%  } catch (Exception e) { e.printStackTrace(); } %>