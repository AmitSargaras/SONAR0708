<%@ page import="com.integrosys.cms.app.contractfinancing.bus.IContractFacilityType,
                 com.integrosys.cms.app.contractfinancing.bus.IContractFinancing,
                 com.integrosys.cms.ui.common.ContractFinancingAwarderTypeList,
                 com.integrosys.cms.ui.common.ContractFinancingContractTypeList,
                 com.integrosys.cms.ui.common.ContractFinancingSinkingFundList"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.IFDR" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
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

function submitPage(initEvent,event) {
    document.forms[0].initEvent.value=initEvent;
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
    if(request.getAttribute("event")!=null) {
        event = (String)request.getAttribute("event");
    }

    String initEvent = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.initEvent");

    String trxID = request.getParameter("trxID");

    IContractFinancing contractFinancing = (IContractFinancing)request.getAttribute("contractFinancingObj");

    IFDR[] fdrList = contractFinancing.getFdrList();
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

    String userMembershipID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    boolean isMrMaker = false;

    if (userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH))) {
        isMrMaker = true;
    }
%>

<html:form action="ContractFinancing.do">
<input type="hidden" name="event"/>
<input type="hidden" name="initEvent"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="limitProfileID" value="<%=contractFinancing.getLimitProfileID()%>"/>
<%
    //only need contract ID when this is not to_track event.
    if(initEvent!=null && (initEvent.equals("maker_prepare_create")||initEvent.equals("maker_prepare_update")||initEvent.equals("view"))) {
        %><input type="hidden" name="contractID" value="<%=contractFinancing.getContractID()%>"/><%
    }
%>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td width="58%"><h3><bean:message key="label.contractfinancing.title"/></h3></td>
        <td width="42%" align="right" valign="bottom">
        <%
        if (initEvent!=null && initEvent.equals("view") && isMrMaker) {
            %><input name="Submit" type="button" class="btnNormal" value="Edit" onClick="submitPage('maker_prepare_update','maker_prepare_update')" style="width:60px" /><%
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
        <td width="30%"><%=contractFinancing.getSourceLimit()%></td>
        <td width="20%" class="fieldname"><bean:message key="label.contractdetails.product.description"/></td>
        <td width="30%">
            <integro:empty-if-null value="<%=contractFinancing.getProductDescription()%>" />
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.contractdetails.contract.no"/></td>
        <td><%=contractFinancing.getContractNumber()%>&nbsp;</td>
        <td  class="fieldname"><bean:message key="label.contractdetails.contract.date"/></td>
        <td><integro:date object="<%=contractFinancing.getContractDate()%>" /></td>
    </tr>
    <tr class="even">
        <td  class="fieldname"><bean:message key="label.contractdetails.type.of.awarder"/></td>
        <td>
            <integro:empty-if-null value="<%=ContractFinancingAwarderTypeList.getInstance().getContractFinancingAwarderTypeValue(contractFinancing.getAwarderType())%>" />
            <%
            if(contractFinancing.getAwarderTypeOthers()!=null){
            	%><%=contractFinancing.getAwarderTypeOthers()%><%
            }
            %>&nbsp;
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.name.of.awarder"/></td>
        <td class="even"><integro:empty-if-null value="<%=contractFinancing.getAwarderName()%>" />&nbsp;</td>
    </tr>
    <tr class="odd">
        <td  class="fieldname"><bean:message key="label.contractdetails.type.of.contract"/></td>
        <td>
            <integro:empty-if-null value="<%=ContractFinancingContractTypeList.getInstance().getContractFinancingContractTypeValue(contractFinancing.getContractType())%>" />
	        <%
            if(contractFinancing.getContractTypeOthers()!=null){
            	%><%=contractFinancing.getContractTypeOthers()%><%
            }
            %>&nbsp;            
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.commencement.date.of.contract"/></td>
        <td class="odd"><integro:date object="<%=contractFinancing.getStartDate()%>" /></td>
    </tr>
    <tr class="even">
        <td  class="fieldname"><bean:message key="label.contractdetails.expiry.date.of.contract"/></td>
        <td><span class="odd"><integro:date object="<%=contractFinancing.getExpiryDate()%>" /></span></td>
        <td class="fieldname"><bean:message key="label.contractdetails.extended.date.of.contract"/></td>
        <td class="even"><integro:date object="<%=contractFinancing.getExtendedDate()%>" /></td>
    </tr>
    <tr class="odd">
        <td  class="fieldname"><bean:message key="label.contractdetails.contract.amount"/></td>
        <td><integro:amount param="all" amount="<%=contractFinancing.getContractAmount()%>" /></td>
        <td class="fieldname"><bean:message key="label.contractdetails.percentage.of.financing"/></td>
        <td class="odd"><%=contractFinancing.getFinancePercent()%> %</td>
    </tr>
    <tr class="even">
        <td  class="fieldname"><bean:message key="label.contractdetails.financed.contract.value"/></td>
        <td><integro:amount param="all" amount="<%=contractFinancing.getFinancedAmount()%>" /></td>
        <td class="fieldname"><bean:message key="label.contractdetails.actual.finance.contract"/></td>
        <td class="even"><integro:amount param="all" amount="<%=contractFinancing.getActualFinanceAmount()%>" /></td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.contractdetails.projected.profit"/></td>
        <td><integro:amount param="all" amount="<%=contractFinancing.getProjectedProfit()%>" /></td>
        <td class="fieldname">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.contractdetails.collection.account.no"/></td>
        <td><integro:empty-if-null value="<%=contractFinancing.getCollectionAccount()%>" /></td>
        <td class="fieldname"><bean:message key="label.contractdetails.expiry.of.facilities"/></td>
        <td><integro:date object="<%=contractFinancing.getFacilityExpiryDate()%>" /></td>
    </tr>
    <tr class="odd">
        <td  class="fieldname"><bean:message key="label.contractdetails.project.account.no"/></td>
        <td ><integro:empty-if-null value="<%=contractFinancing.getProjectAccount()%>" />&nbsp;</td>
        <td  class="fieldname"><bean:message key="label.contractdetails.sinking.fund"/></td>
        <td >
            <%
            if(contractFinancing.getSinkingFundInd()!=null &&
               contractFinancing.getSinkingFundInd().equals("Y")){
                %>Yes<%
            }
            else if(contractFinancing.getSinkingFundInd()!=null &&
                    contractFinancing.getSinkingFundInd().equals("N")){
                %>No<%
            }
            %>
            <integro:empty-if-null value="<%=ContractFinancingSinkingFundList.getInstance().getContractFinancingSinkingFundValue(contractFinancing.getSinkingFundParty())%>" />&nbsp;
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.contractdetails.buildup.fd"/></td>
        <td ><integro:empty-if-invalid displayForInvalid="-" value="<%=contractFinancing.getBuildUpFDR()%>" /> %</td>
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
        <td class="fieldname"><bean:message key="label.contractdetails.contract.description"/></td>
        <td colspan="3">
            <integro:htmltext value="<%=contractFinancing.getContractDescription()%>" lineLength="100" />&nbsp;            
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.contractdetails.remarks"/></td>
        <td colspan="3">
            <integro:htmltext value="<%=contractFinancing.getRemark()%>" lineLength="100" />&nbsp;
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
    <tr class="even">
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
    IContractFacilityType[] facilityTypeList = null;
    if(request.getAttribute("facilityTypeList")!=null) {
        facilityTypeList = (IContractFacilityType[])request.getAttribute("facilityTypeList");
    }
    else {
        facilityTypeList = contractFinancing.getFacilityTypeList();
    }

    int facilityTypeSummaryLength = 0;
    if (facilityTypeList!=null) {
        facilityTypeSummaryLength = facilityTypeList.length;
    }

    for(int i=0;i<facilityTypeSummaryLength;i++){
        if (!facilityTypeList[i].getIsDeleted()) {
        %>
        <tr class='<%=(i%2==0?"even":"odd")%>'>
            <td class="index"><%=i+1%></td>
            <td>
                <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(facilityTypeList[i].getFacilityType())%>
                <%=facilityTypeList[i].getFacilityTypeOthers()%>
            </td>
            <td><integro:date object="<%=facilityTypeList[i].getFacilityDate()%>" /></td>
            <td><%=facilityTypeList[i].getMoa()%>&nbsp;</td>
            <td><integro:amount param="all" amount="<%=facilityTypeList[i].getMaxCap()%>" />&nbsp;</td>
            <td><integro:empty-if-null value="<%=facilityTypeList[i].getRemarks()%>" />&nbsp;</td>
            <td><center><a href="CF_FacilityType.do?event=view&facilityTypeIndex=<%=i%>">View</a></center></td>
        </tr>
        <%
        }
    }

    if(facilityTypeSummaryLength==0){
        %>
        <tr class="odd">
            <td colspan="10"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%
    }
    %>
</tbody>
</table>

<%
IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue) session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");    
if (initEvent!=null && initEvent.equals("maker_prepare_close")) {
    %>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="contractfinancing_remarks_section_include.jsp" flush="true">
                        <jsp:param name="UID" value='<%=contractFinancingTrxValue.getUserInfo()%>'/>
                        <jsp:param name="remarks" value='<%=contractFinancingTrxValue.getRemarks()%>'/>
                    </jsp:include>
                </td>
            </tr>
        </tbody>
    </table>
    <%
}
%>
<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td>&nbsp;</td>
</tr>
<tr>
    <td align="center">
    <%
    if (initEvent!=null && (initEvent.equals("maker_prepare_delete")||initEvent.equals("maker_process"))) {
        %><a href="javascript:gotoPage('ContractFinancing.do','delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a><%
    }
    else if (initEvent!=null && initEvent.equals("maker_prepare_close")) {
        %><a href="javascript:gotoPage('ContractFinancing.do','maker_close');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a><%
    }

    if (initEvent!=null && initEvent.equals("to_track")){
        %><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a><%
    }
    else {
        if (initEvent!=null && initEvent.equals("maker_prepare_close")) {
            %><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a><%
        }
        else {
            %><a href="javascript:gotoPage('ContractFinancing.do','list_summary')"><img src="img/return1.gif" width="70" height="20" border="0"></a><%
        }
    }
    %>
    </td>
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