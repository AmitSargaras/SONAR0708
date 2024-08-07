<%@ page import="com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecbill.EquityTypeList,
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
	int rowIdx = 0;
	
   
    IMarketableEquity stagingOB = (IMarketableEquity)request.getAttribute("stageEquity");
    IMarketableEquity originOB = (IMarketableEquity) request.getAttribute("actualEquity");
    Amount old = null;
    Amount oldNominal = null;
    if (originOB != null) {
        oldNominal = originOB.getNominalValue();
    }
    Amount newNominal = null;
    if (stagingOB != null) {
        newNominal = stagingOB.getNominalValue();
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
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.cert.num"/></td>
				<td width="30%" ><bean:write name="PortItemForm" property="certNo"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "registeredName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.reg.owner"/>&nbsp;<span class="mandatory">*</span></td>
				<td width="30%"><bean:write name="PortItemForm" property="registeredName"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "clientCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.client.code"/>&nbsp;</td>
				<td width="30%"><bean:write name="PortItemForm" property="clientCode"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerIdType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.identify.type"/></td>
				<td ><bean:write name="PortItemForm" property="isserIdentType"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "noOfUnits")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.marketsec.port.detail.noofunits"/></span>&nbsp;
					<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td width="30%"><bean:write name="PortItemForm" property="noOfUnit"/>&nbsp;</td>
				<td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
				<td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>&nbsp;<bean:write name="PortItemForm" property="unitPrice"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.custodian"/> &nbsp;<span class="mandatory">*</span></td>
				<td width="30%">
                <%  if (aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) { %>
					<bean:message key="label.security.custodian.internal"/> &nbsp;&nbsp;
					<integro:empty-if-null value="<%=commonCode.getCommonCodeLabel(aForm.getSecCustodianInt())%>"/>
                <% } else {                %>
					<bean:message key="label.security.custodian.external"/> &nbsp;&nbsp; <bean:write name="PortItemForm" property="secCustodianExt"/>
                <% } %></td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newNominal,oldNominal,"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.nominal.value"/></td>
				<td ><bean:write name="PortItemForm" property="nominalValue"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isinCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
			        <bean:message key="label.security.isin.num"/><span id="spanISINCODE"><span class="mandatory">*</span></span></td>
			    <td><bean:write name="PortItemForm" property="isinCode"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"stockCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.stock.counter.code"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><bean:write name="PortItemForm" property="stockCode"/>&nbsp;</td>
			</tr>

            <%@ include file="../common_portItem_read.jsp" %>
            <%@ include file="../common_exchange_control_read.jsp" %>
			
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td
					class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"isCollateralBlacklisted")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.referred"/>&nbsp;</td>
				<td>
				<% if ("true".equals(aForm.getIsSecurityReferred())) {  %>
				<bean:message key="label.common.yes"/>
				<%} else {%>
				<bean:message key="label.common.no"/>
				<%} %>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.issuer.name"/></td>
				<td><bean:write name="PortItemForm" property="issuerName"/></td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td
					class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"isGuaranteeByGovt")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.guarantee.by.government"/>&nbsp;</td>
				<td>
				<% if ("true".equals(aForm.getIsGuaranteeByGovt())) {  %>
				<bean:message key="label.common.yes"/>
				<%} else {%>
				<bean:message key="label.common.no"/>
				<%} %>
					&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"governmentName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.government.name"/></td>
				<td><bean:write name="PortItemForm" property="govtName"/>&nbsp;</td>
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
