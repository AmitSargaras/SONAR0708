<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.bridgingloan.bus.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Checker for Project Information
* Description: This screen allows the checker approve or reject project details.
* It can be reached by clicking on the “Project Info” tab on the top of the screen.
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
        IBridgingLoan actualParametersArray = bridgingLoanTrxValue.getBridgingLoan();
        IBridgingLoan stagingParametersArray = bridgingLoanTrxValue.getStagingBridgingLoan();

        OBBridgingLoan objBridgingLoan = new OBBridgingLoan();

        if ((actualParametersArray != null && stagingParametersArray != null) || actualParametersArray == null) //For deletion record
            objBridgingLoan = (OBBridgingLoan) stagingParametersArray; //For pending update record
        else
            objBridgingLoan = (OBBridgingLoan) actualParametersArray;

        String productDescription = objBridgingLoan.getProductDescription();
        if (productDescription == null)
            productDescription = "Bridging Loan";
%>

<html>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script>
function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BridgingLoan.do">
<input type="hidden" name="event"/>
<input type="hidden" name="initEvent"/>
<input type="hidden" name="next_page"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" style="text-align:left"><h3><bean:message key="label.bridgingloan.cont.title"/></h3></td>
        <td width="42%" style="text-align:right" valign="bottom">
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.limit.id"/></td>
                <td width="30%"><%=objBridgingLoan.getSourceLimit()%></td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prd.desc"/></td>
                <td width="30%"><integro:empty-if-null value="<%=productDescription%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"projectNumber")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.proj.no"/></td>
                <td><integro:empty-if-null value="<%=objBridgingLoan.getProjectNumber()%>" />&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"contractDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.cont.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getContractDate()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
            <%
                Amount stagingAmt = (stagingParametersArray == null) ? null : stagingParametersArray.getContractAmount();
                Amount actualAmt = (actualParametersArray == null) ? null : actualParametersArray.getContractAmount();
            %>
                <td class="<%=CompareOBUtil.compOB(stagingAmt, actualAmt,"amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.ofc.value"/></td>
                <td><integro:amount amount="<%=objBridgingLoan.getContractAmount()%>"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"financePercent")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.per.finc"/></td>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=objBridgingLoan.getFinancePercent()%>" />&nbsp;%</td>
            </tr>
            <tr class="even">
            <%
                stagingAmt = (stagingParametersArray == null) ? null : stagingParametersArray.getFinancedAmount();
                actualAmt = (actualParametersArray == null) ? null : actualParametersArray.getFinancedAmount();
            %>
                <td class="<%=CompareOBUtil.compOB(stagingAmt, actualAmt,"amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.finc.cont.value"/></td>
                <td><integro:amount amount="<%=objBridgingLoan.getFinancedAmount()%>"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"fullSettlementContractDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.fsc.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getFullSettlementContractDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"collectionAccount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.col.acc.no"/></td>
                <td><%=objBridgingLoan.getCollectionAccount()%>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"hdaAccount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.hda.acc.no"/></td>
                <td><%=objBridgingLoan.getHdaAccount()%>&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"projectAccount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.proj.acc"/></td>
                <td><%=objBridgingLoan.getProjectAccount()%>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"currentAccount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.curr.acc"/></td>
                <td><%=objBridgingLoan.getCurrentAccount()%>&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"noOfTypes")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prop.no.typ"/></td>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=objBridgingLoan.getNoOfTypes()%>" />&nbsp;</td>
                <%-- td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"noOfUnits")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prop.no.unt"/></td --%>
                <td class="fieldname"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                <%
                    int noUnit = 0;
                    if (stagingParametersArray != null) {
                        IPropertyType[] obPropertyType = (IPropertyType[]) stagingParametersArray.getPropertyTypeList();
                        if (obPropertyType != null && obPropertyType.length > 0) {
                            for (int index=0; index<obPropertyType.length; index++) {
                                if (obPropertyType[index].getIsDeletedInd() != true) {
                                    noUnit += obPropertyType[index].getNoOfUnits();
                                }
                            }
                        }
                    }
                    String noOfUnit = "";
                    if (noUnit <= 0)
                        noOfUnit = "-"; //Return "-" when noUnit = 0
                    else
                        noOfUnit = Integer.toString(noUnit);
                %>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=noOfUnit%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"expectedStartDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.exp.st.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getExpectedStartDate()%>" />&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"expectedCompletionDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.exp.complt.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getExpectedCompletionDate()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"actualStartDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.act.st.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getActualStartDate()%>" />&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"actualCompletionDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.act.complt.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getActualCompletionDate()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"availabilityExpiryDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.expry.avail.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getAvailabilityExpiryDate()%>" />&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"fullSettlementDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date.fs"/></td>
                <td><integro:date object="<%=objBridgingLoan.getFullSettlementDate()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray, actualParametersArray,"blRemarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                <td colspan="3"><integro:htmltext value="<%=objBridgingLoan.getBlRemarks()%>" />&nbsp;</td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="text-align:right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td><h3>Property Type </h3> </td>
        <td style="text-align:right"></td>
    </tr>
    <tr>
        <td colspan="2"><hr></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            <tr>
                <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                <td width="*"><bean:message key="label.bridgingloan.prty.typ"/></td>
                <td width="12%"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
            </tr>
            </thead>
            <tbody>
                <%
                    if (bridgingLoanTrxValue != null) {
                        IPropertyType[] propertyTypeActualList = null;
                        if (actualParametersArray != null) //actual will be null if this is new record
                            propertyTypeActualList = actualParametersArray.getPropertyTypeList();
                        IPropertyType[] propertyTypeStagingList = stagingParametersArray.getPropertyTypeList();

                        if (propertyTypeActualList != null || propertyTypeStagingList != null) {
                            List compResult = CompareOBUtil.compOBArray(propertyTypeStagingList, propertyTypeActualList);
                            ArrayList list = new ArrayList(compResult);
                            pageContext.setAttribute("propertyTypeList",list);
                        }
                    }
                    int i=0;
                %>
                <logic:present name="propertyTypeList">
                    <logic:iterate id="compResult" name="propertyTypeList" type="com.integrosys.base.techinfra.diff.CompareResult">
                    <%
                        IPropertyType stagingParameter = (IPropertyType) compResult.getObj();
                        i++;
                    %>
                    <tr class='<%=(i%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=i%></td>
                        <td><integro:empty-if-null value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(stagingParameter.getPropertyType())%>"/>&nbsp;</td>
                        <td style="text-align:right"><integro:number number="<%=stagingParameter.getNoOfUnits()%>"/>&nbsp;</td>
                        <td style="text-align:center"><a href="BL_PropertyType.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>">View</a></td>
                    </tr>
                    </logic:iterate>
                </logic:present>
                <logic:notPresent name="propertyTypeList" >
                    <tr class="even">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                </logic:notPresent>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td><h3> Project Schedule </h3></td>
        <td style="text-align:right" valign="bottom"></td>
    </tr>
    <tr>
        <td colspan="2"><hr /></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.prgs.stg"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.prop.st.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.prop.end.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.act.st.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.act.end.date"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
            </thead>
            <tbody>
                <%
                    if (bridgingLoanTrxValue != null) {
                        IProjectSchedule[] projectScheduleActualList = null;
                        if (actualParametersArray != null) //actual will be null if this is new record
                            projectScheduleActualList = actualParametersArray.getProjectScheduleList();
                        IProjectSchedule[] projectScheduleStagingList = stagingParametersArray.getProjectScheduleList();

                        if (projectScheduleActualList != null || projectScheduleStagingList != null) {
                            List compResult = CompareOBUtil.compOBArray(projectScheduleStagingList, projectScheduleActualList);
                            ArrayList list = new ArrayList(compResult);
                            pageContext.setAttribute("projectScheduleList",list);
                        }
                    }
                    int j=0;
                %>
                <logic:present name="projectScheduleList">
                    <logic:iterate id="compResult" name="projectScheduleList" type="com.integrosys.base.techinfra.diff.CompareResult">
                    <%
                        IProjectSchedule stagingParameter = (IProjectSchedule) compResult.getObj();
                        j++;
                    %>
                    <tr class='<%=(j%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=j%></td>
                        <td><integro:empty-if-null value="<%=stagingParameter.getProgressStage()%>"/>&nbsp;</td>
                        <td style="text-align:center"><integro:date object="<%=stagingParameter.getStartDate()%>" />&nbsp;</td>
                        <td style="text-align:center"><integro:date object="<%=stagingParameter.getEndDate()%>" />&nbsp;</td>
                        <td style="text-align:center"><integro:date object="<%=stagingParameter.getActualStartDate()%>" />&nbsp;</td>
                        <td style="text-align:center"><integro:date object="<%=stagingParameter.getActualEndDate()%>" />&nbsp;</td>
                        <td style="text-align:center"><a href="BL_ProjectSchedule.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>">View</a></td>
                    </tr>
                    </logic:iterate>
                </logic:present>
                <logic:notPresent name="projectScheduleList" >
                    <tr class="even">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                </logic:notPresent>
            </tbody>
            </table>
        </td>
    </tr>
	<tr>
	    <td colspan="2">&nbsp; </td>
	</tr>
</tbody>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <jsp:include page="/bridgingloan/bridgingloan_remarks_section_include.jsp" flush="true">
            <jsp:param name="UID" value='<%=bridgingLoanTrxValue.getUserInfo()%>'/>
            <jsp:param name="remarks" value='<%=bridgingLoanTrxValue.getRemarks()%>'/>
            </jsp:include>
        </td>
    </tr>
</tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <table width="246" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="text-align:center">
                    <td><a href="javascript:submitPage('approve')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
                    <td><a href="javascript:submitPage('reject')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
                    <td><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
                </td>
            </tr>
            </table>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); DefaultLogger.debug(this, e.toString()); } %>