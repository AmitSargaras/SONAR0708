<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager" %>
<%@ page import="com.integrosys.cms.ui.collateral.guarantees.gtegovtlink.GteGovtLinkForm" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.gtegovtlink.IGteGovtLink" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.gtegovtlink.IFeeDetails" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.Format" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gtegovtlink/GteGovtLink_update.jsp,v 1.60 2006/11/23 02:53:29 jzhan Exp $
     *
     * Purpose: Update Collateral
     * Description: Type - Guarantee, Subtype - Government
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.60 $
     * Date: $Date: 2006/11/23 02:53:29 $
     * Tag: $Name: DEV_20061123_B286V1 $
     */
%>

<% 	
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj");
    IGteGovtLink iCol = (IGteGovtLink) itrxValue.getStagingCollateral();

    pageContext.setAttribute("obj", iCol);

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    List values = (List) request.getAttribute("schemeValue");
    List labels = (List) request.getAttribute("schemeLabel");
    pageContext.setAttribute("values", values);
    pageContext.setAttribute("labels", labels);

    String prefix = "Gte";
    String subtype = "GteGovtLink";
    String formName = subtype + "Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";    
	String claimDate="";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
    GteGovtLinkForm colForm = (GteGovtLinkForm) request.getAttribute(formName);
	if (colForm.getSecuredPortion().equals("-1.0")) colForm.setSecuredPortion("");
	if (colForm.getUnsecuredPortion().equals("-1.0")) colForm.setUnsecuredPortion("");
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.from");
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>    
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script type="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script type="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
    <script language="JavaScript" type="text/JavaScript">
<!--

        function updateInternal() {
            document.forms[0].secCustodianExt.value = '';
            document.forms[0].secCustodianExt.disabled = true;
            document.forms[0].secCustodianInt.disabled = false;
        }

        function updateExternal() {
            document.forms[0].secCustodianInt.value = '';
            document.forms[0].secCustodianInt.disabled = true;
            document.forms[0].secCustodianExt.disabled = false;
        }

        function changeValAftMargin() {
            var margin = document.forms[0].margin.value.replace(',', '');
            var valBefMargin = 0;
            if (document.forms[0].valBefMargin.value != null && document.forms[0].valBefMargin.value != "") {
                valBefMargin = parseFloat(document.forms[0].valBefMargin.value.split(',').join(''));
            }
            document.forms[0].valAftMargin.value = Math.round((margin / 100) * valBefMargin);
        }


	/*function selectLists(){
	    List = document.forms[0].secInstrument;
	    for (i=0;i<List.length;i++){
		List.options[i].selected = true;
	    }
	}*/

	function submitPage(num, index) {
		enableAllFormElements();
		if (num==1) {
			document.forms[0].event.value="submit";
		}
		else if (num==2) {
			document.forms[0].event.value="update";
		}	  
		else if (num == 3) {
            document.forms[0].event.value="prepare";
            document.forms[0].indexID.value="-1";
            document.forms[0].itemType.value = "<%=CollateralConstant.FEE_DETAILS%>";
        }		
		else if (num==5) {
                document.forms[0].event.value="itemDelete";
                document.forms[0].itemType.value = "<%=CollateralConstant.FEE_DETAILS%>";
		}
		else if (num == 9) {
    		document.forms[0].event.value="update_read_valuation_from_los";
			document.forms[0].indexID.value=index;
			document.forms[0].from_page.value="prepare_update";
		}
		else if (num == 9) {
    		document.forms[0].event.value="update_read_valuation_from_los";
			document.forms[0].indexID.value=index;
			document.forms[0].from_page.value="prepare_update";	        
		}
		document.forms[0].submit();
	}
/*
    function setMandatory(from, val){
    	if (from == 'sec') {
    		if (val == '0') {
    			document.getElementById("securedAmountOriginLabel").style.visibility = "hidden";
    		}
    		else {
    			document.getElementById("securedAmountOriginLabel").style.visibility = "visible";
    		}
    	}
    	else if (from == 'unsec') {
    		if (val == '0') {
    			document.getElementById("unsecuredAmountOriginLabel").style.visibility = "hidden";
    		}
    		else {
    			document.getElementById("unsecuredAmountOriginLabel").style.visibility = "visible";
    		}
    	}
    }
*/

	function removeCommas(aNum) {
		aNum=aNum.replace(/,/g,"");
		return aNum;
	}

	function calculateGteAmt() {
		securedAmtStr = removeCommas(document.forms[0].securedAmountOrigin.value);
		if (isNaN(securedAmtStr)) {
			document.forms[0].amtGuarantee.value = '';
			alert('Invalid number  - Secured Amount Origin');
			document.forms[0].securedAmountOrigin.focus();
			return;
		}
		securedAmt = eval(securedAmtStr);
		unsecuredAmtStr = removeCommas(document.forms[0].unsecuredAmountOrigin.value);
		if (isNaN(unsecuredAmtStr)) {
			document.forms[0].amtGuarantee.value = '';
			alert('Invalid number  - Unsecured Amount Origin');
			document.forms[0].unsecuredAmountOrigin.focus();
			return;
		}
		unsecuredAmt = eval(unsecuredAmtStr);

		if (securedAmt == undefined) securedAmt = 0;
		if (unsecuredAmt == undefined) unsecuredAmt = 0;
			
		document.forms[0].amtGuarantee.value = securedAmt + unsecuredAmt;
	}
//-->
    </script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="GteGovtLinkCollateral">
<input type="hidden" name="event"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="GteGovtLink"/>
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.title.create.guarantees"/>
			<% } else { %>
				<bean:message key="label.security.title.edit.guarantees"/>
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
                <p class="deletedItem"> DELETED  </p>
            <% } %>
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
                <%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
	        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
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
				<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
				<%@ include file="/collateral/common/common_fields_update.jsp" %>
				<tr>
					<td class="fieldname"> <bean:message key="label.security.perfection.date"/>
						&nbsp;<span class="mandatoryPerfection">*</span>	</td>
					<td><html:text property="perfectionDate" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('perfectionDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/><br>
						<html:errors property="perfectionDate"/></td>
					<td class="fieldname"><bean:message key="label.security.borrower.collateral" /></td>
					<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>
						<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio></td>
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><bean:message key="label.security.desc.guarantees"/></td>
		            <td colspan="3">
		                <html:textarea property="descGuarantee" rows="5" style="width=100%" />
		                <html:errors property="descGuarantee"/></td>
		        </tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><bean:message key="label.security.claim.period"/></td>
		            <td><html:text property="claimPeriod" maxlength="9"/>&nbsp;
		            	<html:errors property="claimPeriod"/>
		                <html:select property="claimPeriodUnit">
		                    <option value=""><bean:message key="label.please.select"/> </option>
		                    <html:options name="frequencyProperty" labelName="frequencyLabel"/>
		                </html:select>
		                <html:errors property="claimPeriodUnit"/></td>
		          	<td class="fieldname"><bean:message key="label.security.claim.date"/></td>
		          	<td><html:text property="claimDate" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('claimDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="claimDate"/></td>
		        </tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><bean:message key="label.security.ref.num.guarantee"/></td>
		            <td><html:text property="guaRefNo" maxlength="25"/>
		                <html:errors property="guaRefNo"/> </td>
		            <td class="fieldname"><bean:message key="label.security.guarantee.amt"/>&nbsp;
		            	<span class="mandatory">*</span></td>
		            <td><html:text property="amtGuarantee" maxlength="15" disabled="true"/>
		                <html:errors property="amtGuarantee"/></td>
		        </tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><span class=stp><bean:message key="label.security.guarantee.date"/></span>&nbsp;</td>
		            <td><html:text property="dateGuarantee" readonly="true" size="15" maxlength="11"/>
		                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('dateGuarantee', 'dd/mm/y')"
		                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
		                <html:errors property="dateGuarantee"/> </td>
		            <td class="fieldname"><bean:message key="label.security.beneficiary.name"/></td>
		            <td><html:text property="beneName" maxlength="50"/>
		                <html:errors property="beneName"/> </td>
		        </tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td width="20%" class="fieldname"><bean:message key="label.security.bank.country.risk.approval"/>&nbsp;</td>
		            <td width="30%">
						<html:select property="bankCountryRiskAppr">
							<html:option value="">Please select</html:option>
							<html:option value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:option>
							<html:option value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:option>
							<html:option value="<%=ICMSConstant.NOT_AVAILABLE_VALUE%>"><bean:message key="label.common.no"/>t Applicable</html:option>
						</html:select> </td>
		            <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;
		            	<span class="mandatory">*</span><span class="mandatoryPerfection">*</span></td>
		            <td><html:select property="chargeType">
		                    <option value=""><bean:message key="label.please.select"/> </option>
		                    <html:options name="chargeID" labelName="chargeValue"/>
		                </html:select>
		                <html:errors property="chargeType"/>
		            </td>
		        </tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><span class=stp><bean:message key="label.security.issuing.bank"/></span></td>
		            <td><html:text property="secIssueBank" maxlength="50"/>
		                <html:errors property="secIssueBank"/> </td>
		            <td class="fieldname"><bean:message key="label.security.issuing.bank.country"/></td>
		            <td><html:select property="countrySecurityIssBank">
		                    <option value=""><bean:message key="label.please.select"/></option>
		                    <html:options name="countryValues" labelName="countryLabels"/>
		                </html:select>
		            </td>
		        </tr>
						
				<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><bean:message key="label.security.scheme"/>&nbsp;<span class="mandatory">*</span></td>
		            <td><html:select property="currentScheme">
		            		<integro:common-code categoryCode="<%=CategoryCodeConstant.SCHEME%>" />
		                </html:select>
		                <html:errors property="currentScheme"/></td>
		            <td class="fieldname">&nbsp;</td>
		            <td>&nbsp;</td>
		        </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.secured.portion"/><bean:message key="label.mandatory"/></td>
				<td><html:text property="securedPortion" size="8" maxlength="7" />%&nbsp;<html:errors property="securedPortion"/></td>
				<td class="fieldname"><bean:message key="label.security.secured.amt.original"/>
				<bean:message key="label.mandatory"/> </td>
				<td><html:text property="securedAmountOrigin" maxlength="15" onkeyup="calculateGteAmt()"/>
	                <html:errors property="securedAmountOrigin"/></td>
			</tr>
					
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.unsecured.portion"/><bean:message key="label.mandatory"/></td>
				<td><html:text property="unsecuredPortion" size="8" maxlength="7" />%&nbsp;<html:errors property="unsecuredPortion"/></td>
				<td class="fieldname"><bean:message key="label.security.unsecured.amt.original"/>
				<bean:message key="label.mandatory"/></td>
				<td><html:text property="unsecuredAmountOrigin" maxlength="15" onkeyup="calculateGteAmt()"/>
	                <html:errors property="unsecuredAmountOrigin"/></td>
			</tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname">
						<bean:message key="label.security.secured.amt.calculated"/></td>
					<td><integro:currency amount="<%=iCol.getSecuredAmountCalc()%>" param="amount"/>&nbsp;</td>
					<td class="fieldname">
						<bean:message key="label.security.unsecured.amt.calculated"/></td>
					<td><integro:currency amount="<%=iCol.getUnsecuredAmountCalc()%>" param="amount"/>&nbsp;</td>
				</tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname"><bean:message key="label.security.guarantee.amt.calculated"/></td>
		            <td><integro:currency amount="<%=iCol.getGuaranteeAmtCalc()%>" param="amount"/>&nbsp;</td>
					<td class="fieldname">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><span class=stp><bean:message key="label.security.maturity.date"/></span>&nbsp;<span class="mandatory">*</span><span class="mandatoryPerfection">*</span></td>
		            <td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
		                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
		                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
		                <html:errors property="collateralMaturityDate"/></td>
					<td class="fieldname"><bean:message key="label.security.lg.cancellation.date"/></td>
                     <td><html:text property="cancellationDateLG" readonly="true" style="width:90px" size="15" maxlength="11" />
                             <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('cancellationDateLG', 'dd/mm/y')" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                             &nbsp;<html:errors property="cancellationDateLG" />
                     </td>            
		        </tr>
						
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname"><bean:message key="label.global.comment"/></td>
					<td colspan="3"><html:textarea property="comments" rows="5" style="width=100%"/></td>
				</tr>

		         <%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>

			</tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

<%@ include file="update_fee_details.jsp" %>

<!--View valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp" %>
<%@ include file="/collateral/common/view_valuation_from_los.jsp" %>
<%@ include file="/collateral/common/update_netRV.jsp" %>

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value='<%=subtype+"Collateral.do"%>'/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
<%-- <%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %> --%>
</html:form>

</body>
</html>
