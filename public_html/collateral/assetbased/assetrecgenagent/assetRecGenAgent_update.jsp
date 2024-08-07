<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recgenagent.IReceivableGeneralAgent,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Iterator,
                 java.util.HashMap,
                 java.util.Collection,
                 java.util.Date,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetrecgenagent.AssetRecGenAgentForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetrecgenagent/assetRecGenAgent_update.jsp
     * Purpose: Read Collateral
     * Description: Type - AssetBased, Subtype - Assetrecgenagent
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.59 $
     * Date: $Date: 2006/11/23 02:42:18 $
     * Tag: $Name: DEV_20061123_B286V1 $
     */
%>

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    String natureOfAssignment = null;
    String amt = null;
    String dtlegallyassigned = null;
    String evalDateFSV = null;
    IReceivableGeneralAgent iCol = (IReceivableGeneralAgent) itrxValue.getStagingCollateral();
    //pageContext.setAttribute("obj", iCol);
    ILimitCharge ilimitcharge[] = iCol.getLimitCharges();

    if (ilimitcharge.length > 0) {
        natureOfAssignment = ilimitcharge[0].getNatureOfCharge();
        Amount amountOfAssignment = ilimitcharge[0].getChargeAmount();
        if (amountOfAssignment != null && amountOfAssignment.getCurrencyCode() != null) {
            amt = CurrencyManager.convertToString(request.getLocale(), amountOfAssignment);
        }
        Date dateLegallyAssigned = ilimitcharge[0].getLegalChargeDate();
        dtlegallyassigned = DateUtil.convertToDisplayDate(dateLegallyAssigned);
    } else {
        natureOfAssignment = "-";
        amt = "-";
        dtlegallyassigned = "-";
    }

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String subtype = "AssetRecGenAgent";
    String prefix = "Asset";
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
    AssetRecGenAgentForm colForm = (AssetRecGenAgentForm) request.getAttribute(formName);

	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function manda11(obj) {
            if (obj == "Y") {
				if (document.getElementById('span11') != null)
					document.getElementById('span11').innerText = "* ";
            }
            else {
				if (document.getElementById('span11') != null)
					document.getElementById('span11').innerText = " ";
            }
        }


	/*function selectLists(){
	    List = document.forms[0].secInstrument;
	    for (i=0;i<List.length;i++){
		List.options[i].selected = true;
	    }
	}*/

	function submitPage(num, index) {
	    enableAllFormElements();
	   // selectLists();

            if (num == 1) {
                document.forms[0].event.value = "submit";
            }
            if (num == 2) {
                document.forms[0].event.value = "update";
            }
            if (num == 3) {
                document.forms[0].event.value = "prepare_form";
            }
            if (num == 6) {
                document.forms[0].event.value = "prepare";
                document.forms[0].indexID.value = "-1";
                document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
            }
            if (num == 7) {
                document.forms[0].event.value = "prepare_update_sub";
                document.forms[0].indexID.value = index;
                document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
            }
            if (num == 8) {
                document.forms[0].event.value = "itemDelete";
                document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
            }
            if (num == 9) {
        		document.forms[0].event.value="update_read_valuation_from_los";
    			document.forms[0].indexID.value=index;
    			document.forms[0].from_page.value="prepare_update";
    		}

            document.forms[0].submit();
        }

        //-->
    </script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetRecGenAgentCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="subtype" value="AssetRecGenAgent"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.asset.title.create"/>
			<% } else { %>
				<bean:message key="label.security.asset.title.edit"/>
			<% } %>
		</h3></td>
    </tr>
</thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3><bean:message key="label.security.general"/></h3></td>
        <td width="50%" align="right">
            <% if (isDeleting) { %>
            <p class="deletedItem">
                <bean:message key="label.deleted"/>
            </p>
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>

 <%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
<!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="fieldname">&nbsp;</td>
    <td width="30%">&nbsp;</td>
    </td>
    <td class="fieldname"><bean:message key="label.security.fsv"/></td>
    <td>
        <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount"/>&nbsp;
    </td>
</tr>-->


<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.legal.enforceability"/> &nbsp;<span class="mandatoryPerfection">*</span></td>
    <td>
        <html:select property="le" onchange="manda11(this.value)">
            <option value=""><bean:message key="label.please.select"/> </option>
            <html:options name="LEID" labelName="LEValue"/>
        </html:select>
        <html:errors property="le"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.legal.enforceability.date"/>&nbsp;<span class="mandatoryPerfection">*</span><font color="#0000FF"><span id="span11">&nbsp;</span></font>
    </td>
    <td>
        <html:text property="leDate" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('leDate', 'dd/mm/y')"
             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        <html:errors property="leDate"/>
    </td>
</tr>

<%@ include file="/collateral/common/common_fields_update.jsp" %>

<tr class="even">
    <td class="fieldname"><bean:message key="label.security.asset.amountdesc.assignment"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "amtCharge", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:text property="amtCharge" disabled="<%=!isUpdate%>" size="15" maxlength="15"/>&nbsp;
        <html:errors property="amtCharge"/>&nbsp;</td>
    <td class="fieldname"><bean:message key="label.security.asset.nature.assignment"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "natureOfCharge", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="natureOfCharge" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="natureOfChargeID" labelName="natureOfChargeValue"/>
        </html:select>
        <html:errors property="natureOfCharge"/></td>
</tr>
<tr class="odd">
    <html:hidden property="chargeId"/>
    <td class="fieldname"><bean:message key="label.security.charge.type"/><bean:message key="label.mandatory"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "chargeType", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="chargeType" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="chargeID" labelName="chargeValue"/>
        </html:select>
        <html:errors property="chargeType"/>
        <html:errors property="chargeError"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.date.legally"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "legalChargeDate", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:text property="legalChargeDate" disabled="<%=!isUpdate%>" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0"
             id="Image723" <%=isUpdate ? "onclick=\"return showCalendar('legalChargeDate', 'dd/mm/y');\"" : ""%>
             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        <html:errors property="legalChargeDate"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.maturity.date"/></td>

    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "collateralMaturityDate", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:text readonly="true" property="collateralMaturityDate" disabled="<%=!isUpdate%>" style="width:90px" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0"
             id="Image723" <%=isUpdate ? "onclick=\"return showCalendar('collateralMaturityDate', 'dd/mm/y');\"" : ""%>
             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        <html:errors property="collateralMaturityDate"/>
    </td>
        <%@ include file="/collateral/common/common_security_custodian_update.jsp" %>

</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.asset.proceeds.receivables.control"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "proceedRecControlledBank", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:radio property="proceedRecControlledBank" value="true" disabled="<%=!isUpdate%>"/><bean:message key="label.common.yes"/>
        &nbsp;&nbsp;
        <html:radio property="proceedRecControlledBank" value="false" disabled="<%=!isUpdate%>"/><bean:message key="label.common.no"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.exchange.ctr.app"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "exchangeControl", isSSC); %>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="exchangeControl" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
        </html:select>
        <html:errors property="exchangeControl"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.asset.location.bank"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "bankACLoc", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="bankACLoc" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="locationSCBID" labelName="locationSCBValue"/>
        </html:select>&nbsp; </td>
    <td class="fieldname"><bean:message key="label.security.asset.proceeds.receivables.credit"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "proceedRecToBank", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:text property="proceedRecToBank" size="40" maxlength="15" disabled="<%=!isUpdate%>"/>&nbsp;</td>
</tr>
<%--<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.loc.agent.bank"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "locAgentBank", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="locAgentBank" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="countryValues" labelName="countryLabels"/>
        </html:select>&nbsp; </td>
    <td class="fieldname"><bean:message key="label.security.proceed.receiveable.control.agent.bank"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "proceedRecControlledAgent", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:text property="proceedRecControlledAgent" size="40" maxlength="50" disabled="<%=!isUpdate%>"/>&nbsp;</td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.loc.agent"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "locAgent", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="locAgent" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="countryValues" labelName="countryLabels"/>
        </html:select>&nbsp; </td>
    <td class="fieldname"><bean:message key="label.security.agent.name"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "agentName", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:text property="agentName" size="40" maxlength="50" disabled="<%=!isUpdate%>"/>&nbsp;</td>
</tr>--%>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.asset.types.invoices"/></td>
    <% isUpdate = dpUtil.getIsSCCUpdatable(subtypeCode, "typeOfInvoice", isSSC);%>
    <td class="<%=( (isUpdate && isSSC) || (!isUpdate && !isSSC) )?"edit":""%>">
        <html:select property="typeOfInvoice" disabled="<%=!isUpdate%>">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="typeOfInvoiceListID" labelName="typeOfInvoiceListValue"/>
        </html:select>
        <html:errors property="typeOfInvoice"/></td>
    <td class="fieldname">&nbsp;</td>
    <td>&nbsp;</td>
</tr>

<tr class="even">
    <td class="fieldname"><bean:message key="label.security.prj.name"/></td>
     <td><html:text property="projectName" size="40" maxlength="80"/></td>
    <td class="fieldname"><bean:message key="label.security.doa"/> </td>
    <td>
        <html:text readonly="true" property="dateAwarded"  size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0"   id="Image723" alt=""
                            onclick="return showCalendar('dateAwarded', 'dd/mm/y');"
                            onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        <html:errors property="dateAwarded"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.irr.loi"/></td>
    <td> <html:radio property="letterInstructFlag" value="true"/><bean:message key="label.common.yes"/>&nbsp;&nbsp;
         <html:radio property="letterInstructFlag" value="false"/><bean:message key="label.common.no"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.lou"/></td>
    <td>
        <html:radio property="letterUndertakeFlag" value="true"/><bean:message key="label.common.yes"/>&nbsp;&nbsp;
        <html:radio property="letterUndertakeFlag" value="false"/><bean:message key="label.common.no"/>
    </td>
</tr>
<tr class="odd">
     <td class="fieldname"><bean:message key="label.security.prj.name.ba"/> </td>
     <td><html:text property="blanketAssignment" maxlength="80"/></td>
     <td class="fieldname">&nbsp;</td>
     <td>&nbsp; </td>
 </tr>
 <!--<%@ include file="/collateral/common/update_security_instrument.jsp" %>-->
</tbody>
</table></td>
</tr>
</tbody>
</table>
<%@ include file="/collateral/view_pledgor.jsp" %>


<!--Update three valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %>

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
<script language="javascript">
    var s = "<%=colForm.getLe()%>";
    manda11(s);
   
</script>
</html:form>


<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
</body>
</html>