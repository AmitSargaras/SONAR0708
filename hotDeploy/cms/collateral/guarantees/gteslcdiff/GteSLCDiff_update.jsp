<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.sblcdiffccy.ISBLCDifferentCurrency,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.collateral.guarantees.gteslcdiff.GteSLCDiffForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gteslcdiff/GteSLCDiff_update.jsp,v 1.59 2006/11/23 02:54:25 jzhan Exp $
*
* Purpose: Update Collateral
* Description: Type - Guarantee, Subtype - Standby LC-Different CC
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.59 $
* Date: $Date: 2006/11/23 02:54:25 $
*/
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj");

    ISBLCDifferentCurrency iCol = (ISBLCDifferentCurrency) itrxValue.getStagingCollateral();

    pageContext.setAttribute("obj", iCol);

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    GteSLCDiffForm colForm = (GteSLCDiffForm) request.getAttribute("GteSLCDiffForm");
    String prefix = "Gte";
    String subtype = "GteSLCDiff"; 
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";

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
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function changeValAftMargin() {
    var margin = document.forms[0].margin.value.replace(',', '');
    var valBefMargin = 0;
    if (document.forms[0].valBefMargin.value != null && document.forms[0].valBefMargin.value != "") {
        valBefMargin = parseFloat(document.forms[0].valBefMargin.value.split(',').join(''));
    }
    document.forms[0].valAftMargin.value = Math.round((margin / 100) * valBefMargin);
}

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


function submitPage(num, index) {
	    enableAllFormElements();
	    //selectLists();
		    if (num == 1) {
		    	document.forms[0].event.value="submit";
		    }
			if (num == 2) {
		    	document.forms[0].event.value="update";
		    }
		    if (num == 3) {
		        document.forms[0].event.value="close";
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
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/ssc.jsp"%>

<html:form action="GteSLCDiffCollateral.do">
<input type="hidden" name="event"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="GteSLCDiff"/>
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
      <td > <h3><bean:message key="label.security.general"/></h3></td>
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
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.security.fsv"/></td>
              <td>
              <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;
              </td>
                    <td class="fieldname"><bean:message key="label.security.holding.period"/>&nbsp;</td>
                    <td>
                        <html:text property="holdingPeriod" maxlength="9"/>&nbsp;
                        <html:select property="holdingPeriodTimeUnit">
                            <option value=""><bean:message key="label.please.select"/> </option>
                            <html:options name="frequencyProperty" labelName="frequencyLabel"/>
                        </html:select>&nbsp;
                        &nbsp;<html:errors property="holdingPeriod"/>
                        &nbsp;<html:errors property="holdingPeriodTimeUnit"/>
                    </td>
            </tr>           

<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
            <%
           		int rowIdx = 0;
            %>
<%@ include file="/collateral/common/common_fields_update.jsp" %>

          </tbody>
        </table></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.standby.lcs.desc "/></td>
              <td colspan= "3">
              <html:textarea property="descGuarantee" rows="3" cols="120" style="width:100%" />
              <html:errors property="descGuarantee"/>
              </td>
            </tr>
            <tr class="odd">
            <td class="fieldname"><bean:message key="label.security.claim.period"/></td>
                <td>
                    <html:text property="claimPeriod" maxlength="9"/>&nbsp;
                    <html:errors property="claimPeriod"/>
                    <html:select property="claimPeriodUnit">
                        <option value=""><bean:message key="label.please.select"/> </option>
                        <html:options name="frequencyProperty" labelName="frequencyLabel"/>
                    </html:select>
                    <html:errors property="claimPeriodUnit"/>
                </td>
          	</td>
          	<td class="fieldname">&nbsp;</td>
          	<td>&nbsp;</td>
        </tr>
            <tr class="even">
              <td  class="fieldname"><bean:message key="label.security.standby.lcs.ref.num "/></td>
              <td>
              <html:text property="guaRefNo" maxlength="25"/>
              <html:errors property="guaRefNo"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.standby.lcs.amt"/>&nbsp;
              	<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td>
              <html:text property="amtGuarantee" maxlength="15"/>
              <html:errors property="amtGuarantee"/>
              </td>
            </tr>
            <tr class="odd">

              <td  class="fieldname"><bean:message key="label.security.standby.lcs.date"/>&nbsp;
              	<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>

              <td>
           	  <html:text property="dateGuarantee" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('dateGuarantee', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="dateGuarantee"/>
              </td>
            <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
            <td>
                <html:select property="chargeType">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="chargeID" labelName="chargeValue"/>
                    </html:select>
                <html:errors property="chargeType"/>
            </td>
            </tr>
            <tr class="even">
				<td class="fieldname"><bean:message key="label.security.maturity.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <td>
				<html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11" />
				<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
				<html:errors property="collateralMaturityDate"/>
				</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>            
            </tr>
            <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.security.bank.country.risk.approval"/>&nbsp;</td>
              <td width="30%">
              <html:radio property="bankCountryRiskAppr" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="bankCountryRiskAppr" value="<%=ICMSConstant.FALSE_VALUE%>" /><bean:message key="label.common.no"/>
              &nbsp;&nbsp;
              <html:radio property="bankCountryRiskAppr" value="<%=ICMSConstant.NOT_AVAILABLE_VALUE%>"/><bean:message key="label.common.no"/>t Applicable
              </td>
              <td width="20%"  class="fieldname"><bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
              <td width="30%">
                <html:select property="exchangeControl">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
                    </html:select>
                <html:errors property="exchangeControl"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.issuing.bank"/></td>
              <td>
              <html:text property="secIssueBank" maxlength="50"/>
              <html:errors property="secIssueBank"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.issuing.bank.country"/></td>
              <td>
              <html:select property="countrySecurityIssBank">
                  <option value=""><bean:message key="label.please.select"/></option>
              <html:options name="countryValues" labelName="countryLabels"/>
              </html:select>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.beneficiary.name"/></td>
              <td>
              <html:text property="beneName" maxlength="50"/>
              <html:errors property="beneName"/>
              </td>
              <td  class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor.jsp" %>

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
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
</body>
</html>
