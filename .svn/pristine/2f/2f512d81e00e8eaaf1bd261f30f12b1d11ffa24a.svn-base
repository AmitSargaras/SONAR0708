<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.fxisda.IFXISDA,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.collateral.document.docdervisd.DocDervISDForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/document/docdervisd/DocDervISD_update.jsp,v 1.61 2007/03/15 16:15:15 Jerlin Exp $
*
* Purpose: Update Collateral
* Description: Type - Document, Subtype - FX-Derivative-ISDA_FEMA
*
* @author $Author: Jerlin $<br>
* @version $Revision: 1.61 $
* Date: $Date: 2007/03/15 16:15:15 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.serviceColObj");

    IFXISDA iCol = (IFXISDA) itrxValue.getStagingCollateral();

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String action = "docdervisd.DocDervISDAction";
    String formName = "DocDervISDForm";
    DocDervISDForm colForm = (DocDervISDForm) request.getAttribute(formName);
    
    String prefix = "Doc";
    String subtype = "DocDervISD";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.from");
    
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ include file="/collateral/locale.jsp"%>

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
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<html:form action="DocDervISDCollateral.do">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="itemType"/>
<input type="hidden" name="subtype" value="DocDervISD"/>

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
      <td > <h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
	                    <bean:message key="label.deleted"/>
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

			<tr>
                <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;
                	<span class="mandatory">*</span></td>
				<td><html:select property="chargeType">
						<option value="" ><bean:message key="label.please.select"/> </option>
						<html:options name="chargeID" labelName="chargeValue"/>
					</html:select>
					<html:errors property="chargeType"/></td>
				<td class="fieldname"> <bean:message key="label.security.perfection.date"/>
					&nbsp;<span class="mandatoryPerfection">*</span>	</td>
				<td><html:text property="perfectionDate" readonly="true"/>
					<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('perfectionDate', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/><br>
					<html:errors property="perfectionDate"/></td>
			</tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.maturity.date"/>&nbsp;
					<span class="mandatoryPerfection">*</span></td>
				<td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="collateralMaturityDate"/> </td>
				<td class="fieldname">
                    <bean:message key="label.security.issuing.bank"/></td>
                <td><html:text property="issuer"/>&nbsp;</td>
            </tr>

			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.isda.agree.date"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:text property="documentDate" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('documentDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="documentDate"/></td>
				<td class="fieldname"><bean:message key="label.security.isda.desc.product"/></td>
				<td><html:text property="descProducISDA" size="40" maxlength="50" />
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.ifema.agree.date"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:text property="dateIFREMAAgmt" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('dateIFREMAAgmt', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="dateIFREMAAgmt"/> </td>
				<td class="fieldname"><bean:message key="label.security.ifema.desc.product"/></td>
				<td><html:text property="descProdIFEMA" size="40" maxlength="50" />
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.icom.doc.date"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:text property="dateICOMDocument" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('dateICOMDocument', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="dateICOMDocument"/></td>
				<td class="fieldname"><bean:message key="label.security.icom.desc.product"/></td>
				<td><html:text property="descProdICOM" size="40" maxlength="50" />
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.ref.no"/>&nbsp;</td>
				<td><html:text property="numberLetter"  size="30" maxlength="30" />
					<html:errors property="numberLetter"/></td>
				<td class="fieldname"><bean:message key="label.security.doc.amt"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:text property="amountLetter"  size="15" maxlength="11" />
					<html:errors property="amountLetter"/> </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.amt.min"/>&nbsp;</td>
				<td><html:text property="minAmount"  size="15" maxlength="11" />
					<html:errors property="minAmount"/> </td>
				<td class="fieldname"><bean:message key="label.security.amt.max"/>&nbsp;</td>
				<td><html:text property="maxAmount"  size="15" maxlength="11" />
					<html:errors property="maxAmount"/> </td>
            </tr>
<%--
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.exchange.ctr.app" /> </td>
				<td><html:select property="exchangeControl">
						<option value=""><bean:message key="label.please.select"/></option>
						<html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
					</html:select>&nbsp;</td>
				<td class="fieldname">
					<bean:message key="label.security.exchange.ctr.app.date" /></td>
			    <td><html:text property="exchangeControlDate" readonly="true" maxlength="15"/>
			        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
			             onclick="showCalendar('exchangeControlDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;</td>
			</tr>
--%>			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.borrower.collateral" /></td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio></td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.remarks"/></td>
				<td colspan="3">
					<html:textarea property="description" rows="3" cols="120" style="width:100%" />
					<html:errors property="description"/>&nbsp; </td>
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

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
</body>
</html>
