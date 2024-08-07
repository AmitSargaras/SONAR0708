<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.contractfinancing.bus.IAdvance,
                 com.integrosys.cms.app.contractfinancing.bus.IContractFacilityType,
                 com.integrosys.cms.app.contractfinancing.bus.IContractFinancing,
                 com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue,
                 java.util.ArrayList,
                 java.util.List"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBAdvance" %>
<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage(event,facilityType) {
    document.forms[0].event.value=event;
    document.forms[0].facilityType.value=facilityType;
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: contract financing - maker update page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.2 $
* @since $Date: 2007/May/07 $
* Tag: $Name:  $
*/
%>

<%
    IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");

    IContractFinancing stagingParametersArray = contractFinancingTrxValue.getStagingContractFinancing();
    IContractFinancing ParametersArray = contractFinancingTrxValue.getContractFinancing();

    if(contractFinancingTrxValue != null) {

        try {
            IContractFacilityType[] facilityTypeActualList = null;
            if (ParametersArray!=null) {  //actual will be null if this is new record
                facilityTypeActualList = ParametersArray.getFacilityTypeList();
            }
            IContractFacilityType[] facilityTypeStagingList = stagingParametersArray.getFacilityTypeList();
            if(facilityTypeActualList!=null || facilityTypeStagingList!=null){
                List compResult = CompareOBUtil.compOBArray(facilityTypeStagingList,facilityTypeActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("facilityTypeList",list);
            }

            IAdvance[] advanceActualList = null;
            if (ParametersArray!=null) {  //actual will be null if this is new record
                advanceActualList = ParametersArray.getAdvanceList();
            }
            IAdvance[] advanceStagingList = stagingParametersArray.getAdvanceList();

            if (advanceActualList != null || advanceStagingList != null) {
                List compResult = CompareOBUtil.compOBArray(advanceStagingList,advanceActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("advanceList",list);
            }

        } catch(Exception e) {
            DefaultLogger.debug(this, "<<<<<<>>>>>>>>> Error");
            e.printStackTrace();
        }
    }
%>

<html:form action="CF_SG_AdvsPayment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="facilityType"/>
<input type="hidden" name="next_page"/>

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->

<logic:present name="facilityTypeList">
    <logic:iterate id="compResult" name="facilityTypeList" type="com.integrosys.base.techinfra.diff.CompareResult">
    <%
        IContractFacilityType facilityTypeStagingParameter = (IContractFacilityType) compResult.getObj();
    %>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <tr>
          <td width="58%" ><h3><bean:message key="label.advancepayment.title"/> -
                <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(facilityTypeStagingParameter.getFacilityType())%>
                <%=facilityTypeStagingParameter.getFacilityTypeOthers()%></h3></td>
          <td width="42%" align="right" valign="bottom" ></td>
        </tr>
        <tr>
        <td><hr></td>
        <td width="20%"><hr></td>
        </tr>
    </table>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
    <thead>
        <tr class="even" align="center">
            <td width="4%" rowspan="2" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
            <td colspan="6" class="fieldname"><bean:message key="label.advancepayment.advance.section"/></td>
            <td class="fieldname"><bean:message key="label.advancepayment.payment.section"/></td>
            <td class="fieldname"><bean:message key="label.advancepayment.retention.section"/></td>
            <td width="7%" rowspan="2" class="fieldname"><bean:message key="label.advancepayment.od"/></td>
            <td width="12%" rowspan="2" class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
        </tr>
        <tr class="even" align="center">
            <td class="fieldname" width="4%"><bean:message key="label.contractfinancing.no"/></td>
            <td class="fieldname" width="7%"><bean:message key="label.advancepayment.date"/></td>
            <td class="fieldname" width="6%"><bean:message key="label.advancepayment.tenor"/></td>
            <td class="fieldname" width="9%"><bean:message key="label.advancepayment.claim.amount"/></td>
            <td class="fieldname" width="9%"><bean:message key="label.advancepayment.actual.advanced.amount"/></td>
            <td class="fieldname" width="9%"><bean:message key="label.advancepayment.expiry.date"/></td>
            <td class="fieldname"><bean:message key="label.advancepayment.total.amount.received"/></td>
            <td width="13%" class="fieldname"><bean:message key="label.advancepayment.total.retention.amount"/></td>
        </tr>
    </thead>
    <tbody>
        <%
        int j=0;
        Amount grandAmount = null;
        Amount grandTotalPaymentReceived = null;
        Amount grandTotalPaymentDistributed = null;

        boolean grandAmountError = false;
        boolean grandTotalPaymentReceivedError = false;
        boolean grandTotalPaymentDistributedError = false;
        %>
        <logic:present name="advanceList">
           <logic:iterate id="compResult" name="advanceList"  type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
            IAdvance stagingParameter = (IAdvance)compResult.getObj();

            if (stagingParameter.getFacilityTypeID()==facilityTypeStagingParameter.getFacilityTypeID()){
                OBAdvance obAdvance = (OBAdvance)stagingParameter;
                //if one convertion found error, the following no need convert.
                if(!grandAmountError){
                    try {
                        grandAmount = CommonUtil.addAmount(grandAmount, stagingParameter.getAmount());
                    } catch (AmountConversionException e) {
                        if(e.toString().indexOf("AMT_CONV_EX")>-1){
                            grandAmountError = true;
                            grandAmount = null;
                        }
                    }
                }
                if(!grandTotalPaymentReceivedError){
                    try {
                        grandTotalPaymentReceived = CommonUtil.addAmount(grandTotalPaymentReceived, obAdvance.getTotalPaymentReceived());
                    } catch (AmountConversionException e) {
                        if(e.toString().indexOf("AMT_CONV_EX")>-1){
                            grandTotalPaymentReceivedError = true;
                            grandTotalPaymentReceived = null;
                        }
                    }
                }
                if(!grandTotalPaymentDistributedError){
                    try {
                        grandTotalPaymentDistributed = CommonUtil.addAmount(grandTotalPaymentDistributed, obAdvance.getTotalPaymentDistributed());
                    } catch (AmountConversionException e) {
                        if(e.toString().indexOf("AMT_CONV_EX")>-1){
                            grandTotalPaymentDistributedError = true;
                            grandTotalPaymentDistributed = null;
                        }
                    }
                }
                j++;
                %>
                <tr class='<%=(j%2==0?"even":"odd")%>'>
                    <td class='<bean:write name="compResult" property="key" />'><%=j%></td>
                    <td width="4%" style="text-align:center"><%=stagingParameter.getReferenceNo()%></td>
                    <td width="7%" style="text-align:center"><integro:date object="<%=stagingParameter.getDrawdownDate()%>" /></td>
                    <td width="6%" style="text-align:center"><%=stagingParameter.getTenor()%> <%=stagingParameter.getTenorUOM()%></td>
                    <td width="9%" style="text-align:left"><integro:amount param="all" amount="<%=stagingParameter.getAmount()%>" /></td>
                    <td width="9%" style="text-align:left"><integro:amount param="all" amount="<%=stagingParameter.getActualAdvanceAmount()%>" /></td>
                    <td width="9%" style="text-align:center"><integro:date object="<%=stagingParameter.getExpiryDate()%>" /></td>
                    <td style="text-align:left">
                        <%
                        try {
                            %><integro:amount param="all" amount="<%=obAdvance.getTotalPaymentReceived()%>" /><%
                        }
                        catch (AmountConversionException e) {
                            if(e.toString().indexOf("AMT_CONV_EX")>-1){
                                %><bean:message key="error.contractfinancing.no.conversion"/><%
                            }
                        }
                        %>&nbsp;
                    </td>
                    <td width="13%" style="text-align:left">
                        <%
                        try {
                            %><integro:amount param="all" amount="<%=obAdvance.getTotalPaymentDistributed()%>" /><%
                        }
                        catch (AmountConversionException e) {
                            if(e.toString().indexOf("AMT_CONV_EX")>-1){
                                %><bean:message key="error.contractfinancing.no.conversion"/><%
                            }
                        }
                        %>&nbsp;
                    </td>
                    <td width="7%" style="text-align:center">
                        <%
                        try {
                            %><integro:amount param="all" amount="<%=obAdvance.getOperativeLimitZeroWhenPartialPayment()%>" /><%
                        }
                        catch (AmountConversionException e) {
                            if(e.toString().indexOf("AMT_CONV_EX")>-1){
                                %><bean:message key="error.contractfinancing.no.conversion"/><%
                            }
                        }
                        %>&nbsp;
                    </td>
                    <td><center><a href="CF_SG_AdvsPayment.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&facilityType=<%=facilityTypeStagingParameter.getFacilityType()%>">View</a></center></td>
                </tr>
               <%
           }
           %>
           </logic:iterate>
        </logic:present>
        <%
        if(j==0){
            %>
            <tr class="odd">
                <td colspan="11"><bean:message key="label.global.not.found"/></td>
            </tr>
            <%
        }
        %>
        <tr class="even">
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total" style="text-align:right"><bean:message key="label.contractfinancing.total"/></td>
            <td class="total"style="text-align:left">
            <%
            if(!grandAmountError){
                %><integro:amount param="all" amount="<%=grandAmount%>" /><%
            }
            else{
                %><bean:message key="error.contractfinancing.no.conversion"/><%
            }
            %>
            </td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total" style="text-align:left">
            <%
            if(!grandTotalPaymentReceivedError){
                %><integro:amount param="all" amount="<%=grandTotalPaymentReceived%>" /><%
            }
            else{
                %><bean:message key="error.contractfinancing.no.conversion"/><%
            }
            %>
            </td>
            <td class="total" style="text-align:left">
            <%
            if(!grandTotalPaymentDistributedError){
                %><integro:amount param="all" amount="<%=grandTotalPaymentDistributed%>" /><%
            }
            else{
                %><bean:message key="error.contractfinancing.no.conversion"/><%
            }
            %>
            </td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
        </tr>
    </tbody>
    </table>
    </logic:iterate>
</logic:present>

<logic:notPresent name="facilityTypeList">
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <tr>
            <td width="58%" ><h3><bean:message key="label.advancepayment.title"/></h3></td>
        </tr>
        <tr>
        <td><hr></td>
        <td width="20%"><hr></td>
        </tr>
    </table>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
    <thead>
        <tr class="even" align="center">
            <td width="4%" rowspan="2" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
            <td colspan="6" class="fieldname"><bean:message key="label.advancepayment.advance.section"/></td>
            <td class="fieldname"><bean:message key="label.advancepayment.payment.section"/></td>
            <td class="fieldname"><bean:message key="label.advancepayment.retention.section"/></td>
            <td width="7%" rowspan="2" class="fieldname"><bean:message key="label.advancepayment.od"/></td>
            <td width="12%" rowspan="2" class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
        </tr>
        <tr class="even" align="center">
            <td class="fieldname" width="4%"><bean:message key="label.contractfinancing.no"/></td>
            <td class="fieldname" width="7%"><bean:message key="label.advancepayment.date"/></td>
            <td class="fieldname" width="6%"><bean:message key="label.advancepayment.tenor"/></td>
            <td class="fieldname" width="9%"><bean:message key="label.advancepayment.claim.amount"/></td>
            <td class="fieldname" width="9%"><bean:message key="label.advancepayment.actual.advanced.amount"/></td>
            <td class="fieldname" width="9%"><bean:message key="label.advancepayment.expiry.date"/></td>
            <td class="fieldname"><bean:message key="label.advancepayment.total.amount.received"/></td>
            <td width="13%" class="fieldname"><bean:message key="label.advancepayment.total.retention.amount"/></td>
        </tr>
    </thead>
        <tr class="odd">
            <td colspan="11"><bean:message key="label.global.not.found"/></td>
        </tr>
    </table>
</logic:notPresent>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>