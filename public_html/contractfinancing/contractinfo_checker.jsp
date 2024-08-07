<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.contractfinancing.bus.IContractFacilityType,
                 com.integrosys.cms.app.contractfinancing.bus.IContractFinancing,
                 com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue,
                 com.integrosys.cms.ui.common.ContractFinancingAwarderTypeList,
                 com.integrosys.cms.ui.common.ContractFinancingContractTypeList,
                 com.integrosys.cms.ui.common.ContractFinancingSinkingFundList,
                 java.util.ArrayList,
                 java.util.List"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.IFDR" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

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

function submitPage(event) {
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
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
    String event = request.getParameter("event");

    IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue) session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");

    IContractFinancing parametersArray = null;
    IContractFinancing stagingParametersArray = null;

    parametersArray = contractFinancingTrxValue.getContractFinancing();
    stagingParametersArray = contractFinancingTrxValue.getStagingContractFinancing();

    IFDR[] fdrList = stagingParametersArray.getFdrList();
    Amount amountAccumulated = null;
    boolean convertError = false;
    if (fdrList != null) {
        for (int i = 0; i < fdrList.length; i++) {
            if (!fdrList[i].getIsDeleted()) {
                try {
                    amountAccumulated = CommonUtil.addAmount(amountAccumulated, fdrList[i].getFdrAmount());
                } catch (AmountConversionException e) {
                    if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                        convertError = true;
                        amountAccumulated = null;
                        break; //if one convertion found error, the following no need convert.
                    }
                }
            }
        }
    }
%>

<html:form action="ContractFinancing.do">
<input type="hidden" name="event"/>
<input type="hidden" name="initEvent"/>
<input type="hidden" name="next_page"/>
<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td width="58%"><h3><bean:message key="label.contractfinancing.title"/></h3></td>
        <td width="42%" align="right" valign="bottom">
        <%
        if(event.equals("view")) {
            %><input name="Submit" type="button" class="btnNormal" value="Edit" onClick="submitPage('maker_prepare_update')" style="width:60px" /><%
        }
        %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
        <hr/>
        </td>
    </tr>
</thead>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
    <tr class="even">
        <td width="20%" class="fieldname"><bean:message key="label.contractdetails.limit.id"/></td>
        <td width="30%"><%=stagingParametersArray.getSourceLimit()%></td>
        <td width="20%" class="fieldname"><bean:message key="label.contractdetails.product.description"/></td>
        <td width="30%">
            <integro:empty-if-null value="<%=stagingParametersArray.getProductDescription()%>" />
        </td>
    </tr>
    <tr class="odd">
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"contractNumber")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.contract.no"/></td>
        <td><%=stagingParametersArray.getContractNumber()%></td>
        <td  class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"contractDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.contract.date"/></td>
        <td><integro:date object="<%=stagingParametersArray.getContractDate()%>" /></td>
    </tr>
    <tr class="even">
        <%
        if(CompareOBUtil.compOB(stagingParametersArray,parametersArray,"awarderType") &&
           CompareOBUtil.compOB(stagingParametersArray,parametersArray,"awarderTypeOthers")) {
            %><td  class="fieldname"><bean:message key="label.contractdetails.type.of.awarder"/></td><%
        }
        else {
            %><td  class="fieldnamediff"><bean:message key="label.contractdetails.type.of.awarder"/></td><%
        }
        %>
        <td>
            <integro:empty-if-null value="<%=ContractFinancingAwarderTypeList.getInstance().getContractFinancingAwarderTypeValue(stagingParametersArray.getAwarderType())%>" />
            <%
            if(stagingParametersArray.getAwarderTypeOthers()!=null){
            	%><%=stagingParametersArray.getAwarderTypeOthers()%><%
            }
            %>&nbsp;
        </td>
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"awarderName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.name.of.awarder"/></td>
        <td class="even"><integro:empty-if-null value="<%=stagingParametersArray.getAwarderName()%>" />&nbsp;</td>
    </tr>
    <tr class="odd">
        <%
        if(CompareOBUtil.compOB(stagingParametersArray,parametersArray,"contractType") &&
           CompareOBUtil.compOB(stagingParametersArray,parametersArray,"contractTypeOthers")) {
            %><td  class="fieldname"><bean:message key="label.contractdetails.type.of.contract"/></td><%
        }
        else {
            %><td  class="fieldnamediff"><bean:message key="label.contractdetails.type.of.contract"/></td><%
        }
        %>
        <td>
            <integro:empty-if-null value="<%=ContractFinancingContractTypeList.getInstance().getContractFinancingContractTypeValue(stagingParametersArray.getContractType())%>" />
            <%
            if(stagingParametersArray.getContractTypeOthers()!=null){
            	%><%=stagingParametersArray.getContractTypeOthers()%><%
            }
            %>&nbsp;
        </td>
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"startDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.commencement.date.of.contract"/></td>
        <td class="odd"><integro:date object="<%=stagingParametersArray.getStartDate()%>" /></td>
    </tr>
    <tr class="even">
        <td  class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"expiryDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.expiry.date.of.contract"/></td>
        <td><span class="odd"><integro:date object="<%=stagingParametersArray.getExpiryDate()%>" /></span></td>
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"extendedDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.extended.date.of.contract"/></td>
        <td class="even"><integro:date object="<%=stagingParametersArray.getExtendedDate()%>" /></td>
    </tr>
    <tr class="odd">
        <%
            Amount stagingAmt = (stagingParametersArray == null) ? null : stagingParametersArray.getContractAmount();
            Amount actualAmt = (parametersArray == null) ? null : parametersArray.getContractAmount();
        %>
        <td  class="<%=CompareOBUtil.compOB(stagingAmt,actualAmt,"amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.contract.amount"/></td>
        <td><integro:amount param="all" amount="<%=stagingParametersArray.getContractAmount()%>" /></td>
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"financePercent")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.percentage.of.financing"/></td>
        <td class="odd"><%=stagingParametersArray.getFinancePercent()%> %</td>
    </tr>
    <tr class="even">
        <%
            stagingAmt = (stagingParametersArray == null) ? null : stagingParametersArray.getFinancedAmount();
            actualAmt = (parametersArray == null) ? null : parametersArray.getFinancedAmount();
        %>
        <td  class="<%=CompareOBUtil.compOB(stagingAmt,actualAmt,"amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.financed.contract.value"/></td>
        <td><integro:amount param="all" amount="<%=stagingParametersArray.getFinancedAmount()%>" /></td>
        <%
            stagingAmt = (stagingParametersArray == null) ? null : stagingParametersArray.getActualFinanceAmount();
            actualAmt = (parametersArray == null) ? null : parametersArray.getActualFinanceAmount();
        %>
        <td class="<%=CompareOBUtil.compOB(stagingAmt,actualAmt,"amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.actual.finance.contract"/></td>
        <td class="even"><integro:amount param="all" amount="<%=stagingParametersArray.getActualFinanceAmount()%>" /></td>
    </tr>
    <tr class="odd">
        <%
            stagingAmt = (stagingParametersArray == null) ? null : stagingParametersArray.getProjectedProfit();
            actualAmt = (parametersArray == null) ? null : parametersArray.getProjectedProfit();
        %>
        <td class="<%=CompareOBUtil.compOB(stagingAmt,actualAmt,"amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.projected.profit"/></td>
        <td><integro:amount param="all" amount="<%=stagingParametersArray.getProjectedProfit()%>" /></td>
        <td class="fieldname">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"collectionAccount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.collection.account.no"/></td>
        <td><integro:empty-if-null value="<%=stagingParametersArray.getCollectionAccount()%>" />&nbsp;</td>
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"facilityExpiryDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.expiry.of.facilities"/></td>
        <td><integro:date object="<%=stagingParametersArray.getFacilityExpiryDate()%>" /></td>
    </tr>
    <tr class="odd">
        <td  class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"projectAccount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.project.account.no"/></td>
        <td ><integro:empty-if-null value="<%=stagingParametersArray.getProjectAccount()%>" />&nbsp;</td>
        <%
        if(CompareOBUtil.compOB(stagingParametersArray,parametersArray,"sinkingFundInd") &&
           CompareOBUtil.compOB(stagingParametersArray,parametersArray,"sinkingFundParty")) {
            %><td  class="fieldname"><bean:message key="label.contractdetails.sinking.fund"/></td><%
        }
        else {
            %><td  class="fieldnamediff"><bean:message key="label.contractdetails.sinking.fund"/></td><%
        }
        %>
        <td >
            <%
            if(stagingParametersArray.getSinkingFundInd()!=null &&
               stagingParametersArray.getSinkingFundInd().equals("Y")){
                %>Yes<%
            }
            else if(stagingParametersArray.getSinkingFundInd()!=null &&
                    stagingParametersArray.getSinkingFundInd().equals("N")){
                %>No<%
            }
            %>
            <integro:empty-if-null value="<%=ContractFinancingSinkingFundList.getInstance().getContractFinancingSinkingFundValue(stagingParametersArray.getSinkingFundParty())%>" />&nbsp;
        </td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"buildUpFDR")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.buildup.fd"/></td>
        <td ><integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParametersArray.getBuildUpFDR()%>" /> %</td>
        <td class="fieldname"><bean:message key="label.contractdetails.accumulated.fdr"/></td>
        <td>
        <%
        if(!convertError){
            %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
        }
        else {
            %><bean:message key="error.contractfinancing.no.conversion"/><%
        }
        %>
        </td>
    </tr>
    <tr class="odd">
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"contractDescription")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.contract.description"/></td>
        <td colspan="3">
            <integro:htmltext value="<%=stagingParametersArray.getContractDescription()%>" lineLength="100" />&nbsp;
        </td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"remark")?"fieldname":"fieldnamediff"%>"><bean:message key="label.contractdetails.remarks"/></td>
        <td colspan="3">
            <integro:htmltext value="<%=stagingParametersArray.getRemark()%>" lineLength="100" />&nbsp;
        </td>
    </tr>
</tbody>
</table>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td width="84%">
            <h3><bean:message key="label.facilitytype.title"/></h3>
        </td>
    </tr>
	<tr>
	<td><hr></td>
	<td width="20%"><hr></td>
	</tr>
</table>
<table width="90%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
<thead>
    <tr>
        <td width="27" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td width="138" class="fieldname"><bean:message key="label.facilitytype.title"/></td>
        <td width="92" class="fieldname"><bean:message key="label.facilitytype.date"/></td>
        <td width="139" class="fieldname"><bean:message key="label.facilitytype.moa"/></td>
        <td width="139" class="fieldname"><bean:message key="label.facilitytype.maximum.cap"/></td>
        <td width="184" class="fieldname"><bean:message key="label.facilitytype.remarks"/></td>
        <td width="114" class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
    </tr>
</thead>
<tbody>
    <%
    if(contractFinancingTrxValue != null) {
        try {
            IContractFacilityType[] facilityTypeActualList = null;
            if (parametersArray!=null) {  //actual will be null if this is new record
                facilityTypeActualList = parametersArray.getFacilityTypeList();
            }
            IContractFacilityType[] facilityTypeStagingList = stagingParametersArray.getFacilityTypeList();
            if(facilityTypeActualList!=null || facilityTypeStagingList!=null){
                List compResult = CompareOBUtil.compOBArray(facilityTypeStagingList,facilityTypeActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("facilityTypeList",list);
            }
        } catch(Exception e) {
            DefaultLogger.debug(this, "<<<<<<>>>>>>>>> Error");
            e.printStackTrace();
        }
    }
    int i=0;
    %>
    <logic:present name="facilityTypeList">
    <logic:iterate id="compResult" name="facilityTypeList"  type="com.integrosys.base.techinfra.diff.CompareResult">
    <%
    IContractFacilityType stagingParameter = (IContractFacilityType)compResult.getObj();
    i++;
    %>
    <tr class='<%=(i%2==0?"even":"odd")%>'>
        <td class='<bean:write name="compResult" property="key" />'  ><%=i%></td>
        <td>
            <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(stagingParameter.getFacilityType())%>
            <%=stagingParameter.getFacilityTypeOthers()%>
        </td>
        <td><integro:date object="<%=stagingParameter.getFacilityDate()%>" /></td>
        <td><%=stagingParameter.getMoa()%>&nbsp;</td>
        <td><integro:amount param="all" amount="<%=stagingParameter.getMaxCap()%>" />&nbsp;</td>
        <td><integro:empty-if-null value="<%=stagingParameter.getRemarks()%>" />&nbsp;</td>
        <td><center><a href="CF_FacilityType.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>">View</a></center></td>
    </tr>
    </logic:iterate>
    </logic:present>
    <logic:notPresent name="facilityTypeList" >
    <tr class="odd">
        <td colspan="10"><bean:message key="label.global.not.found"/></td>
    </tr>
    </logic:notPresent>
</tbody>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <jsp:include page="contractfinancing_remarks_section_include.jsp" flush="true" >
            <jsp:param name="UID" value='<%=contractFinancingTrxValue.getUserInfo()%>' />
            <jsp:param name="remarks" value='<%=contractFinancingTrxValue.getRemarks()%>' />
            </jsp:include>
        </td>
    </tr>
</tbody>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td>&nbsp;</td>
</tr>
<tr>
    <td><a href="javascript:submitPage('approve')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:submitPage('reject')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
</tr>
<tr>
    <td>&nbsp;</td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>