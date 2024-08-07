<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.leaseagreement.ILeaseAgreement,
				 com.integrosys.cms.ui.collateral.document.docagreement.DocAgreementForm,
                 com.integrosys.cms.ui.collateral.document.doccomfort.DocComfortForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%--
    /**
     * Copyright Integro Technologies Pte Ltd
     *
     * Purpose: Update Collateral
     * Description: Type - Document, Subtype - Lease Agreement
     *
     * @author $Author: Thurein $<br>
     * @version $Revision: 1.2 $
     * Date: $Date: 2008/Sep/2 $
     */
--%>

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.serviceColObj");
    ILeaseAgreement iCol = (ILeaseAgreement) itrxValue.getStagingCollateral();

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String action = "docagreement.DocAgreementAction";
    String formName = "DocAgreementForm";
    DocAgreementForm colForm = (DocAgreementForm) request.getAttribute(formName);
    String prefix = "Doc";
    String subtype = "DocAgreement";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.from");
	
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ include file="/collateral/locale.jsp" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script>
	<!-- "submitData" can be found here -->
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function checkMinMaxAmount(){
            var min = document.forms[0].minAmount.value;
            var max = document.forms[0].maxAmount.value;
            var tempMin="";
            var tempMax="";
            for(i=0;i<min.length;i++){
                if(min.charAt(i)!=","){
                    tempMin += min.charAt(i);
                }
            }
            for(j=0;j<max.length;j++){
                if(max.charAt(j)!=","){
                    tempMax += max.charAt(j);
                }
            }
            if(parseInt(tempMin)> parseInt(tempMax))
                {
                    alert("Min amount should not be greater than Max amount");
                    return false;
                }
            return true;
        }

		function submitPage(num) {
		    enableAllFormElements();

            if (num == 1) {
                document.forms[0].event.value="submit";
            }
            if (num == 2) {
                document.forms[0].event.value="update";
            }
            document.forms[0].submit();

        }
        //-->
    </script>
</head>

<body>
<%@ include file="/collateral/check_user.jsp" %>
<%@ include file="/collateral/ssc.jsp" %>

<html:form action="DocAgreementCollateral.do">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="subtype" value="DocAgreement"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.documentation.title.create"/>
			<% } else { %>
				<bean:message key="label.security.documentation.title.edit"/>
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
                DELETED
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
	<td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<tbody>
		    <%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
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
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;
			    	<span class="mandatory">*</span>&nbsp;</td>
			    <td>
			        <html:select property="chargeType">
			            <option value=""><bean:message key="label.please.select"/> </option>
			            <html:options name="chargeID" labelName="chargeValue"/>
			        </html:select>
			        <html:errors property="chargeType"/>
			    </td>
			    <td class="fieldname"><bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			    <td>
			        <html:text property="securityPerfectionDate" readonly="true" size="15" maxlength="11"/>
			        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('securityPerfectionDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
			        <html:errors property="securityPerfectionDate"/>
			    </td>
			</tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.maturity.date"/>&nbsp;
			   <span class="mandatoryPerfection">*</span></td>
			    <td>
			        <html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
			        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
			        <html:errors property="collateralMaturityDate"/>
			    </td>
			   <td class="fieldname"><bean:message key="label.security.leaseAgreement.issurer"/>&nbsp;</td>
			    <td>
			        <html:text property="issuer" size="15" maxlength="11"/>
			        <html:errors property="issuer"/>
			    </td>
			</tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.lease.agree.date"/>&nbsp;
			    	<span class="mandatory">*</span>&nbsp;</td>
			    <td>
			        <html:text property="documentDate" readonly="true" size="15" maxlength="11"/>
			        <img src="img/calendara.gif" name="Image723" border="0"	 id="Image723" onclick="return showCalendar('documentDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
			        <html:errors property="documentDate"/>
			    </td>
			     <td class="fieldname"><bean:message key="label.security.leaseAgreement.lease.type"/>&nbsp;
			      	
			    </td>
			    <td colspan="3">
			    <html:select property="leaseType">
			   	     	<option value="" ><bean:message key="label.please.select"/> </option>
			        <html:options name="leaseID" labelName="leaseValue"/>
			        </html:select>&nbsp;
			        <html:errors property="leaseType"/>
			    </td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.ref.no"/>&nbsp;</td>
			    <td>
			        <html:text property="numberLetter" size="30" maxlength="30"/>
			        <html:errors property="numberLetter"/>
			    </td>
			    <td class="fieldname"><bean:message key="label.security.doc.amt"/>&nbsp;
			    	<span class="mandatory">*</span>&nbsp;</td>
			    <td>
			        <html:text property="amountLetter" size="15" maxlength="11"/>
			        <html:errors property="amountLetter"/>
			    </td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.amt.min"/>&nbsp;</td>
			    <td>
			        <html:text property="minAmount" size="15" maxlength="11"/>
			        <html:errors property="minAmount"/>
			    </td>
			    <td class="fieldname"><bean:message key="label.security.amt.max"/>&nbsp;</td>
			    <td>
			        <html:text property="maxAmount" size="15" maxlength="11"/>
			        <html:errors property="maxAmount"/>
			    </td>
			</tr>
			<!-- added by thurein -->
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.lease.rental.agreement"/>&nbsp;</td>
			    <td>
			       <html:select property="leaseRentalAgreement">
			            <option value=""><bean:message key="label.please.select"/></option>
			           <html:option value="Yes"><bean:message key="label.common.yes"/></html:option>
						<html:option value="No"><bean:message key="label.common.no"/></html:option>
			       	</html:select>
			        <html:errors property="leaseRentalAgreement"/>
			    </td>
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.lease.limitation"/>&nbsp;</td>
			    <td>
			        <html:text property="limitationOfLease" size="15" maxlength="11"/>
			        <html:errors property="limitationOfLease"/>
			    </td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.property.type"/>&nbsp;</td>
			    <td>
			        <html:select property="propertyType">
			           <option value="" ><bean:message key="label.please.select"/> </option>
			           <html:options name="propID" labelName="propValue"/>
			        </html:select>&nbsp;
			        <html:errors property="propertyType"/>
			    </td>
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.lots.location"/>&nbsp;</td>
			    <td>
			        <html:text property="locationOfLots" size="15" maxlength="11"/>
			        <html:errors property="locationOfLots"/>
			    </td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.tile.number"/>&nbsp;</td>
			    <td>
			     	<html:select property="titleNumber">
			           <option value="" ><bean:message key="label.please.select"/> </option>
			           <html:options name="titleID" labelName="titleValue"/>
			        </html:select>&nbsp;
			        <html:errors property="titleNumber"/>
			        <html:text property="titleNumberValue" size="15" maxlength="11"/>
			        <html:errors property="titleNumberValue"/>
			    </td>
			    <td class="fieldname"><span class = stp><bean:message key="label.security.leaseAgreement.buyback.value"/></span><span class="mandatory">*</span>&nbsp;</td>
			    <td>
			        <html:text property="buybackValue" size="15" maxlength="11"/>
			        <html:errors property="buybackValue"/>
			    </td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.borrower.dependency"/>&nbsp;</td>
			    <td>
			      	 <html:radio property="borrowerDependencyOnCollateral" value="Yes" />&nbsp;<bean:message key="label.security.leaseAgreement.borrower.dependency.yes"/>&nbsp;
					<html:radio property="borrowerDependencyOnCollateral" value="No" />&nbsp;<bean:message key="label.security.leaseAgreement.borrower.dependency.no"/>
			    </td>
			    <td class="fieldname"><span class = stp><bean:message key="label.security.leaseAgreement.gurantee.amount"/></span><span class="mandatory">*</span>&nbsp;</td>
			    <td>
			        <html:text property="guranteeAmount" size="15" maxlength="11"/>
			        <html:errors property="guranteeAmount"/>
			    </td>
			</tr>


			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname"><bean:message key="label.security.leaseAgreement.collateral.description"/></td>
			    <td colspan="3">
			        <html:textarea property="description" rows="3" cols="120" style="width:100%" />
			        <html:errors property="description"/>
			    </td>
			</tr>
			<%-- <%@ include file="/collateral/common/update_security_instrument.jsp" %> --%>

		</tbody>
		</table>
	</td>
</tr>
</tbody>
</table>

<%@ include file="/collateral/view_pledgor.jsp" %>
<%@ include file="/collateral/view_pledge.jsp" %>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>
<%@ include file="/collateral/common/update_netRV.jsp" %>
<%--<%@ include file="/collateral/secapportion/update_apportion_summary.jsp" %>--%>


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
</html:form>

<%-- <%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %> --%>
</body>
</html>
