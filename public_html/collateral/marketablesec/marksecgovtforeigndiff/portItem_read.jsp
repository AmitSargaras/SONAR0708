<%@ page import="com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecgovtforeigndiff.EquityTypeList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.collateral.BookingLocationList"%>
<%
	String actionStr = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	CommonCodeList commonCode = CommonCodeList.getInstance(itrxValue.getStagingCollateral().getCollateralLocation(), ICMSConstant.CATEGORY_CODE_BKGLOC, true);

    PortItemForm aForm = (PortItemForm)request.getAttribute("PortItemForm");
    String from_event = request.getParameter("from_event");
    boolean isProcess = (from_event.equals("process"));

    IMarketableEquity stagingOB = (IMarketableEquity)request.getAttribute("stageEquity");
    IMarketableEquity originOB = (IMarketableEquity) request.getAttribute("actualEquity");
    Amount oldNominal = null;
    Amount newNominal = null;
    if (stagingOB != null) {
        newNominal = stagingOB.getNominalValue();
    }
    if (originOB != null)     {
        oldNominal = originOB.getNominalValue();
    }
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.sec.details"/> - <bean:message key="label.view"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "equityType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.equity.type"/>&nbsp;<span class="mandatory">*</span></td>
              <td width="30%" ><integro:empty-if-null value="<%=EquityTypeList.getInstance().getEquityTypeItem(aForm.getEquityType())%>"/>&nbsp;</td>
               <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.cert.num"/></td>
              <td width="30%" ><bean:write name="PortItemForm" property="certNo"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "registeredName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.reg.owner"/>&nbsp;<span class="mandatory">*</span></td>
              <td width="30%"><bean:write name="PortItemForm" property="registeredName"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "noOfUnits")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.marketsec.port.detail.noofunits"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td width="30%"><bean:write name="PortItemForm" property="noOfUnit"/>&nbsp;</td>
              <td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
              <td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>&nbsp;<bean:write name="PortItemForm" property="unitPrice"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newNominal,oldNominal,"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.nominal.value"/></td>
              <td ><bean:write name="PortItemForm" property="nominalValue"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
                  <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.custodian"/> &nbsp;</td>
              <td width="30%">
                <%
                    if (aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) {
                %>
                <bean:message key="label.security.custodian.internal"/> &nbsp;&nbsp;
                <integro:empty-if-null value="<%=commonCode.getCommonCodeLabel(aForm.getSecCustodianInt())%>"/>
                <%
                    } else {
                %>
                <bean:message key="label.security.custodian.external"/> &nbsp;&nbsp; <bean:write name="PortItemForm" property="secCustodianExt"/>
                <% } %>
              </td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.maturity.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td ><bean:write name="PortItemForm" property="secMaturityDate"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isCollateralBlacklisted")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.referred"/>&nbsp;<span class="mandatory">*</span></td>
              <td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getSecBlackListed()).booleanValue()%>"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td >&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.name"/></td>
              <td><bean:write name="PortItemForm" property="issuerName"/>&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerIdType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.identify.type"/></td>
              <td ><bean:write name="PortItemForm" property="isserIdentType"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isGuaranteeByGovt")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.guarantee.by.government"/></td>
              <td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getIsGuaranteeByGovt()).booleanValue()%>"/>&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "governmentName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.government.name"/></td>
              <td ><bean:write name="PortItemForm" property="govtName"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "rIC")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.ric"/></td>
              <td><bean:write name="PortItemForm" property="ric"/>&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=ExchangeControlList.getInstance().getExchangeControlItem(aForm.getXchangeCtrlObtained())%>"/>&nbsp;</td>

            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- <%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %> --%>
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"> <a href="MarketPortItem.do?event=read_return&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr><td height="50">&nbsp;</td></tr>
</table>

</body>
</html>
