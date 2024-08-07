<%@ page import="com.integrosys.cms.ui.collateral.commodity.security.SecurityAction,
                 com.integrosys.cms.ui.collateral.commodity.security.SecurityForm,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.ui.collateral.SecEnvRiskyList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ICommodityCollateral,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.HashMap,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/security/chk_view_security.jsp,v 1.24 2006/10/27 08:31:28 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.24 $
* Date: $Date: 2006/10/27 08:31:28 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    SecurityForm aForm = (SecurityForm)request.getAttribute("CommSecForm");

    ICommodityCollateral actualSecurity = (ICommodityCollateral)request.getAttribute("actualSecurity");
    ICommodityCollateral stageSecurity = (ICommodityCollateral)request.getAttribute("stageSecurity");
    
    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");
    ICollateralTrxValue[] trxValues = (ICollateralTrxValue[])(trxValueMap.get("trxValue"));
    int index = Integer.parseInt(request.getParameter("indexID"));
    ICollateralTrxValue itrxValue = null;
    for(int i=0; i<trxValues.length; i++)
    {
       if (trxValues[i].getStagingCollateral() == stageSecurity)
       {
          itrxValue = trxValues[i];
       }
    } 
    ICommodityCollateral iCol = stageSecurity;
    System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + (iCol.getSecApportionment() == null));
%>

<html>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function returnPage() {
    document.forms[0].event.value = "<%=SecurityAction.EVENT_READ_RETURN%>";  
    document.forms[0].submit();
}
//-->
</script>

</head>
<body>

<html:form action="CommoditySec.do">
<input type="hidden" name="event" value="<%=SecurityAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.title.process.commodity"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.id"/></td>
          <td width="30%"><bean:write name="CommSecForm" property="securityID"/>&nbsp;</td>
          <td width="20%" class="fieldname"><bean:message key="label.security.sub.type"/></td>
          <td width="30%">
          <integro:empty-if-null value="<%=aForm.getSecuritySubType()%>"/>
          </td>
        </tr>
        <tr class="even">
        <td width="20%" class="fieldname"><bean:message key="label.security.sci.currency"/></td>
        <td width="30%"><bean:write name="CommSecForm" property="sciSecurityCurrency"/>&nbsp;
        </td>
        <td width="20%" class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "currencyCode")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.cms.currency"/>&nbsp;<font color="#0000FF">* </font></td>
        <td width="30%"><bean:write name="CommSecForm" property="cmsSecurityCurrency"/>&nbsp;
        </td>
        </tr>
        <%
            ILimitCharge actualCharge = null;
            ILimitCharge stageCharge = null;
            if (actualSecurity != null && actualSecurity.getLimitCharges() != null &&
                    actualSecurity.getLimitCharges().length > 0) {
                actualCharge = actualSecurity.getLimitCharges()[0];
            }
            if (stageSecurity != null && stageSecurity.getLimitCharges() != null &&
                    stageSecurity.getLimitCharges().length > 0) {
                stageCharge = stageSecurity.getLimitCharges()[0];
            }
        %>
            <tr class="odd">
	  <td class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "isLE")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.legal.enforceability"/>
	    <font color="#FF0000">*</font>
	  </td>
	  <td>
	    <integro:empty-if-null value="<%=LEList.getInstance().getLEItem(aForm.getLe())%>"/>
	  </td>
	  <td  class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "lEDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.legal.enforceability.date"/></td>
	  <td><bean:write name="CommSecForm" property="leDate"/>&nbsp;</td>
        </tr>
        
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(stageCharge, actualCharge, "legalChargeDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.date.legal.charge"/></td>
          <td>
            <bean:write name="CommSecForm" property="legalChargeDate"/>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(stageCharge, actualCharge, "chargeType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.charge.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(aForm.getChargeType())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
        <%
                Amount actualAmt = null;
                Amount stageAmt = null;
                if (actualCharge != null) {
                    actualAmt = actualCharge.getChargeAmount();
                }
                if (stageCharge != null) {
                    stageAmt = stageCharge.getChargeAmount();
                }
        %>
        <td class="<%=CompareOBUtil.compOB(stageAmt, actualAmt, "amount")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.charge.amount"/>
        <font color="#FF0000">*</font>
        </td>
        <td><bean:write name="CommSecForm" property="chargeAmount"/>&nbsp;</td>
        <td class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "isExchangeCtrlObtained")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.exchange.ctr.app"/>
        <font color="#FF0000">*</font>
        </td>
        <td><integro:empty-if-null value="<%=ExchangeControlList.getInstance().getExchangeControlItem(aForm.getExchangeControlObtained())%>"/>
        </td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "degreeOfEnvironmentalRisky")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.sec.env.liability"/>
            <font color="#FF0000">*</font>
          </td>
          <td>
            <integro:empty-if-null value="<%=SecEnvRiskyList.getInstance().getSecEnvRiskyItem(aForm.getSecurityEnvRisk().trim())%>"/>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "dateOfDegreeOfEnvironmentalRiskyConfirmed")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.date.sec.confirm.env.risk"/>
          </td>
          <td><bean:write name="CommSecForm" property="dateSecurityEnvRisk"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
          <td colspan="3">
            <integro:wrapper value="<%=aForm.getRemarkSecurityEnvRisk()%>" />&nbsp;
          </td>
        </tr>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tr>
    <td>&nbsp; </td>
  </tr>
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.approved.commodity.type"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td  width="20%" class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "collateralLocation")?"fieldname":"fieldnamediff"%>">Security Location&nbsp;<font color="#FF0000">*</font><font color="#0000FF">* </font></td>
          <td width="30%">
            <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getSecurityLocation())%>"/>&nbsp;
          </td>

          <td width="20%" class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "securityOrganization")?"fieldname":"fieldnamediff"%>">Organisation Code&nbsp;<font color="#FF0000">*</font><font color="#0000FF">* </font></td>
          <td width="30%">
<% String securityOrg=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getSecurityOrganization());%>
            <integro:empty-if-null value="<%=securityOrg%>"/>&nbsp;
          </td>
        </tr>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <tbody>
        <tr class="odd">

    <td class="tblFormSection">
      <h3><bean:message key="label.security.approved.cust.diff.eod.price"/></h3>
          </td>
          </tr>
        <tr class="even">
          <td class="tblFormSection">
            <hr/>
          </td>
          </tr>
        <tr class="even">
          <td class="tblFormSection">

      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "approvedCustomerDifferentialSign")?"fieldname":"fieldnamediff"%>"><bean:message key="label.cash.margin.plus.minus"/></td>
          <td width="30%">
            <%  if (aForm.getPlusmnSign() != null) {
                if (aForm.getPlusmnSign().equals(CommodityConstant.SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getPlusmnSign().equals(CommodityConstant.SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getPlusmnSign().equals(CommodityConstant.SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <%  } } %>&nbsp;
          </td>
          <td width="20%" class="<%=CompareOBUtil.compOB(stageSecurity, actualSecurity, "approvedCustomerDifferential")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.cust.diff"/></td>
          <td width="30%"><bean:write name="CommSecForm" property="customerDiff"/>
          </td>
        </tr>
        </tbody>
      </table>
      </td>
      </tr>
  </tbody>
</table>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.title"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                  <thead>
                    <tr>
                      <td width="5%"><bean:message key="label.global.sn"/></td>
                      <td width="20%"><bean:message key="label.security.pledgor.id"/></td>
                      <td width="20%"><bean:message key="label.security.le.id"/></td>
                      <td width="28%"><bean:message key="label.security.pledgor.name"/></td>
                      <td width="27%"><bean:message key="label.security.pledgor.relationship"/></td>
                    </tr>
                  </thead>
                  <tbody>
				<%
                    ICollateralPledgor[] pledgor = actualSecurity.getPledgors();
                    String classtype = "odd";
                    if (pledgor != null) {
                        if (pledgor.length == 0) {
				%>
                    <tr class="<%=classtype%>">
                    <td colspan="5">
                    <bean:message key="label.security.pledgor.info.none"/>
                    </td>
                    </tr>
				<% } for (int counter = 0; counter < pledgor.length; counter++) { %>
                    <tr class="<%=classtype%>">
                      <td width="5%" class="index"><%=counter + 1%></td>
                      <td width="20%"><%=pledgor[counter].getSCIPledgorID()%>
                      <%
                    if (pledgor[counter].getSCIPledgorMapStatus() != null &&
                            pledgor[counter].getSCIPledgorMapStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
                      %>
                      &nbsp;<font color="#FF0000"><b>DELETED</b></font>
                      <% } %>
                      </td>
                      <td width="20%"><%=(pledgor[counter].getLegalID() > 0)?String.valueOf(pledgor[counter].getLegalID()):"-"%></td>
                      <td width="28%"><integro:empty-if-null value="<%=pledgor[counter].getPledgorName()%>"/></td>
                      <td width="27%"><integro:empty-if-null value="<%=pledgor[counter].getPledgorRelship()%>"/></td>
                    </tr>
					<%	if (classtype.equals("odd")) {
                            classtype = "even";
                        }
                        else {
                            classtype = "odd";
                        }
                    }
                    } else { %>
                    <tr class="<%=classtype%>">
                    <td colspan="5">
                    <bean:message key="label.security.pledgor.info.none"/>
                    </td>
                    </tr>
                    <% } %>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
<%@ include file="/collateral/commodity/security/view_apportion_summary.jsp" %>
<%
	IValuation actualValuation = actualSecurity.getValuation();
	IValuation stageValuation = stageSecurity.getValuation();
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.valuation.details"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td width="20%" class="<%=CompareOBUtil.compOB(stageValuation, actualValuation, "currencyCode")?"fieldname":"fieldnamediff"%>"><bean:message key="label.valuation.currency"/></td>
          <td width="30%"><bean:write name="CommSecForm" property="valuationCurrency"/>&nbsp;</td>
          <td width="20%" class="fieldname"><bean:message key="label.security.val.date"/></td>
          <td width="30%"><bean:write name="CommSecForm" property="valDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
        	<td class="fieldname"><bean:message key="label.security.valuation.cmv"/></td>
        	<td><bean:write name="CommSecForm" property="valCMV"/>&nbsp;</td>
        	<td class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
        	<td><bean:write name="CommSecForm" property="valFSV"/>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td>
    <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>
