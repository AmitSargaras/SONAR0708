<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.insurance.subtype.creditinsurance.ICreditInsurance,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.collateral.insprotection.inscrdt.InsCrdtForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insprotection/inscrdt/InsCrdt_update.jsp,v 1.47 2006/11/23 02:55:02 jzhan Exp $
*
* Purpose: Update Collateral
* Description: Type - Insurance, Subtype - Credit Insurance
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.47 $
* Date: $Date: 2006/11/23 02:55:02 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.serviceColObj");

    ICreditInsurance iCol = (ICreditInsurance) itrxValue.getStagingCollateral();

    pageContext.setAttribute("obj", iCol);
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String prefix = "Ins";
    String subtype = "InsCrdt";
    String formName =subtype + "Form";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
    InsCrdtForm colForm = (InsCrdtForm) request.getAttribute(formName);
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	boolean isProcess = false;
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.from");

%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

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

function manda11(obj) {
  if (obj == "Y")
    {
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

function submitPage(num) {
    enableAllFormElements();
    //selectLists();

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
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="InsCrdtCollateral.do">
<input type="hidden" name="event" />
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="InsCrdt"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
		<td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.title.create.insurance.protection"/>
			<% } else { %>
				<bean:message key="label.security.title.edit.insurance.protection"/>
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
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
    <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
<%--          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">
              	<bean:message key="label.security.fsv"/></td>
              <td>
              <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>--%>
          </tbody>
        </table></td>
    </tr>
	</tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
			<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
		</tr>
		<tr>
			<td><hr/></td>
		</tr>
	</thead>
	<tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<% rowIdx++; %>
            <tr class="even">
               	<td class="fieldname">
               		<bean:message key="label.desc.specific.cover"/></td>
               	<td colspan="3"><html:textarea property="description" rows="5" cols="120" style="width:100%" />
              		<html:errors property="description"/> </td>
            </tr>
            
            <tr class="odd">
              	<td class="fieldname">
              		<bean:message key="label.insurer.name"/>&nbsp;<span class="mandatory">*</span></td>
              	<td><html:select property="insureName">
					      <integro:common-code categoryCode="INSURER_NAME"/>                            
					</html:select>
              	<html:errors property="insureName"/>
<%--
              	<html:text property="insureName" maxlength="100"/>&nbsp;
              		<html:errors property="insureName"/> 
--%>
				</td>
              	<td class="fieldname">
              		<bean:message key="label.insurance.type"/>&nbsp;<span class="mandatory">*</span></td>
              	<td><html:select property="insurType">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.INSURANCE_TYPE %>" /> 
                  	</html:select>
                  	<html:errors property="insurType"/> </td>
            </tr>
            
            <tr class="even">
              	<td class="fieldname">
              		<bean:message key="label.insured.amt"/>&nbsp;
              		<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
             	<td><html:text property="insuredAmt" maxlength="14"/>&nbsp;
              		<html:errors property="insuredAmt"/> </td>
              	<td class="fieldname">
              		<bean:message key="label.insurance.effective.date"/>&nbsp;<span class="mandatory">*</span></td>
              	<td><html:text property="effDateInsurance" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('effDateInsurance', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="effDateInsurance"/> </td>
            </tr>
            
            <tr class="odd">
              	<td class="fieldname">
              		<bean:message key="label.security.maturity.date"/>&nbsp;
              		<span class="mandatoryPerfection">*</span></td>
              	<td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="collateralMaturityDate"/> </td>
              	<td class="fieldname"><bean:message key="label.policy.num"/>&nbsp;</td>
              	<td><html:text property="policyNo" maxlength="30" />&nbsp;
              		<html:errors property="policyNo"/> </td>
            </tr>
            
            <tr class="even">
              	<td class="fieldname">
              		<bean:message key="label.insurance.expiry.date"/>&nbsp;</td>
              	<td><html:text property="expiryDateInsure" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('expiryDateInsure', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="expiryDateInsure"/> </td>
              	<td class="fieldname"><bean:message key="label.external.legal.counsel"/></td>
              	<td><html:text property="extLegalCounsel" maxlength="50" />&nbsp;
              		<html:errors property="extLegalCounsel"/> </td>
            </tr>

            <tr class="even">
              	<td width="20%" class="fieldname">
              		<bean:message key="label.acceleration.clause"/></td>
              	<td width="30%">
              		<html:radio property="accelClause" value="true" /><bean:message key="label.common.yes"/> &nbsp;
              		<html:radio property="accelClause" value="false"/><bean:message key="label.common.no"/> &nbsp; </td>
              	<td class="fieldname"><bean:message key="label.local.curr.core.market"/></td>
              	<td><html:select property="localCurrCM">
	                	<option value="" ><bean:message key="label.please.select"/> </option>
	                	<html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select> </td>
            </tr>
            <tr class="odd">
              	<td class="fieldname">
              		<bean:message key="label.core.market"/></td>
              	<td><html:select property="coreMarke">
	                	<option value="" ><bean:message key="label.please.select"/> </option>
	                	<html:options name="coreMarketID" labelName="coreMarketValue"/>
                    </html:select> </td>
              	<td class="fieldname"><bean:message key="label.insurance.premium.amount"/></td>
              	<td><html:text property="premiumAmount" maxlength="20" />&nbsp;
					<html:errors property="premiumAmount"/> </td>
            </tr>

            <tr class="odd">
              	<td class="fieldname">
              		<bean:message key="label.security.asset.nature.assignment"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><html:select property="natureOfCharge">
	                	<option value="" ><bean:message key="label.please.select"/> </option>
	                	<html:options name="natureOfChargeID" labelName="natureOfChargeValue"/>
                    </html:select> </td>
              	<td class="fieldname"><bean:message key="label.security.asset.amountdesc.assignment"/>&nbsp;
              		<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><html:text property="amtCharge" maxlength="14"/>&nbsp;
              		<html:errors property="amtCharge"/> </td>
            </tr>
            
            <tr class="even">
	            <td class="fieldname"><bean:message key="label.security.asset.date.legally"/>
	            	&nbsp;<span class="mandatory">*</span></td>
	            <td><html:text property="legalChargeDate" readonly="true" size="15" maxlength="11" />
	              	<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('legalChargeDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	              	<html:errors property="legalChargeDate"/> </td>
	           	<td class="fieldname"><bean:message key="label.confirmation.assignmnt.date"/></td>
	            <td><html:text property="confirmChargeDate" readonly="true" size="15" maxlength="11" />
	              	<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('confirmChargeDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	              	<html:errors property="confirmChargeDate"/> </td>
            </tr>
            
            <tr class="odd">
	            <td class="fieldname">
	            	<bean:message key="label.security.charge.type"/>
	            	&nbsp;<span class="mandatory">*</span></td>
	            <td><html:select property="chargeType">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="chargeID" labelName="chargeValue"/>
	                    </html:select>
	                <html:errors property="chargeType"/> </td>
	            <td class="fieldname">
	            	<bean:message key="label.credit.arr.insurer"/>&nbsp;</td>
	            <td><html:select property="arrInsurer">
			            <option value=""><bean:message key="label.please.select"/></option>
			            <html:options name="arrInsurerID" labelName="arrInsurerValue"/>
			        </html:select> <html:errors property="arrInsurer"/> &nbsp;</td>
            </tr>        
                
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="fieldname">
					<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			    <td><html:text property="perfectionDate" readonly="true" maxlength="15"/>
			        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
			             onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
              	<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
            </tr>
			
			<%@ include file="/collateral/common/common_fields_update.jsp" %>   
			<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
            <%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/update_netRV.jsp" %>

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
<script>
    var s = "<%=colForm.getLe()%>";
      manda11(s);
</script>
</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
</body>
</html>
