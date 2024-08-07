<%@ page import="com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecotherlistedlocal.EquityTypeList,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.marketablesec.NomineeNameList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.StockExchangeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.marketablesec.BaselCompliantList,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry"%>
<%

	String actionStr = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	CommonCodeList commonCode = CommonCodeList.getInstance(itrxValue.getStagingCollateral().getCollateralLocation(), ICMSConstant.CATEGORY_CODE_BKGLOC, true);

    PortItemForm aForm = (PortItemForm)request.getAttribute("PortItemForm");

    String from_event = request.getParameter("from_event");
    boolean isProcess = (from_event.equals("process"));

    IMarketableEquity stagingOB = (IMarketableEquity)request.getAttribute("stageEquity");
    IMarketableEquity originOB = (IMarketableEquity) request.getAttribute("actualEquity");
    String prefix1 = "Mark";
    Amount oldNominal = null;
    Amount newNominal = null;
    if (stagingOB != null) {
        newNominal = stagingOB.getNominalValue();
    }
    if (originOB != null)     {
        oldNominal = originOB.getNominalValue();
    }

	int rowIdx=0;
	
	IStockFeedEntry stockFeedEntry = (IStockFeedEntry)request.getAttribute("stockFeedEntry");  
    String strScriptName = "-";
    String strFaceValue = "-";
    
   if(stockFeedEntry!=null)
   {
   strScriptName = stockFeedEntry.getScriptName();
   strFaceValue = Double.toString(stockFeedEntry.getFaceValue());
      }
      
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
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
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "equityType")?"fieldname":"fieldnamediff"):"fieldname"%>">Name of Stock Exchange</td>
                <td width="30%">
                <integro:common-code display="true" categoryCode="<%=ICMSUIConstant.SHARE_TYPE%>" entryCode="<%=aForm.getStockExchange() %>" descWithCode="false"/>
               </td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>">Script Code</td>
				<td width="30%" ><bean:write name="PortItemForm" property="isinCode"/>&nbsp;</td>
			 </tr>
			 
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "equityType")?"fieldname":"fieldnamediff"):"fieldname"%>">Script Name</td>
				<td width="30%" ><%=strScriptName%>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>">1) Promoters of the borrowing company 2) Group company 3) Others</td>
				<td width="30%" ><bean:write name="PortItemForm" property="isserIdentType"/>&nbsp;<bean:write name="PortItemForm" property="indexName"/></td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "noOfUnits")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.marketsec.port.detail.noofunits"/><!-- <span class="mandatoryPerfection">*</span> --></td>
				<td width="30%"><bean:write name="PortItemForm" property="noOfUnit"/>&nbsp;</td>
				<td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
				<td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>&nbsp;<bean:write name="PortItemForm" property="unitPrice"/>&nbsp;</td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newNominal,oldNominal,"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.nominal.value"/></td>
				<td><bean:write name="PortItemForm" property="nominalValue"/>&nbsp;</td>
				<%--<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"exercisePrice")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exercise.price"/></td>
				<td><bean:write name="PortItemForm" property="exercisePrice"/>&nbsp;</td>
            --%>
            <td class="fieldname">Face Value</td>
				<td><%=UIUtil.formatWithCommaAndDecimal(strFaceValue)%>&nbsp;</td>
            </tr>
          
          	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <%--<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.custodian"/> &nbsp;</td>
				<td width="30%">
	                <%  if (aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) {	%>
						<bean:message key="label.security.custodian.internal"/> &nbsp;&nbsp;
						<integro:empty-if-null value="<%=commonCode.getCommonCodeLabel(aForm.getSecCustodianInt())%>"/>
	                <%	} else {	%>
						<bean:message key="label.security.custodian.external"/> &nbsp;&nbsp; <bean:write name="PortItemForm" property="secCustodianExt"/>
					<% } %></td>
					
					--%><%--
			    <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isinCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
			        <bean:message key="label.security.isin.num.stock.code"/><span id="spanISINCODE"><span class="mandatory">*</span></span></td>
			    <td><bean:write name="PortItemForm" property="isinCode"/>&nbsp;</td>
            --%>
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.cert.num"/></td>
            <td width="30%" ><bean:write name="PortItemForm" property="certNo"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.name"/>
					</td>
				<td><bean:write name="PortItemForm" property="issuerName"/>&nbsp;</td>
				
            </tr>
          <%--
          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.name"/>
					</td>
				<td><bean:write name="PortItemForm" property="issuerName"/>&nbsp;</td>
				<td width="20%" class="fieldname">&nbsp;
				</td>
				<td>&nbsp;
				</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerIdType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.identify.type"/></td>
				<td><bean:write name="PortItemForm" property="isserIdentType"/>&nbsp;</td>
           </tr>
          
           --%>
          
          
          <!-- -------------------------------- --><%--
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "equityType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.equity.type"/>&nbsp;<span class="mandatory">*</span></td>
				<td width="30%" ><integro:empty-if-null value="<%=EquityTypeList.getInstance().getEquityTypeItem(aForm.getEquityType())%>"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.cert.num"/></td>
				<td width="30%" ><bean:write name="PortItemForm" property="certNo"/>&nbsp;</td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "agentName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.nominee.name"/></td>
				<td width="30%" ><integro:empty-if-null value="<%=NomineeNameList.getInstance().getNomineeNameItem(aForm.getNomineeName())%>"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "agentConfirmDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.confirmation.frm.nominee.date"/></td>
				<td width="30%" ><bean:write name="PortItemForm" property="dateConfirmNomine"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "registeredName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.reg.owner"/></td>
				<td width="30%"><bean:write name="PortItemForm" property="registeredName"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "recognizeExchange")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.recognize.exchange"/></td>
				<td><integro:yesno-display value="<%= aForm.getRecognizeExchange() %>" />&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "clientCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.client.code"/>&nbsp;</td>
				<td width="30%"><bean:write name="PortItemForm" property="clientCode"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "cdsNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.cds.number"/>&nbsp;</td>
				<td width="30%"><bean:write name="PortItemForm" property="cdsNumber"/>&nbsp;</td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isCollateralBlacklisted")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.referred"/>&nbsp;<span class="mandatory">*</span></td>
				<td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getSecBlackListed()).booleanValue()%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"stockCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.stock.counter.code"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><bean:write name="PortItemForm" property="stockCode"/>&nbsp;</td>
            </tr>
			

			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.name"/>
					&nbsp;<span class="mandatory">*</span></td>
				<td><bean:write name="PortItemForm" property="issuerName"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerIdType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer.identify.type"/></td>
				<td><bean:write name="PortItemForm" property="isserIdentType"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "stockExchange")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.stock.exchange"/></td>
				<td><integro:empty-if-null value="<%=StockExchangeList.getInstance().getStockExchangeName(aForm.getStockExchange())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "stockExchangeCountry")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.stock.exchange.country"/></td>
				<td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getCountryStockExchange())%>"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isLocalStockExchange")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.local.stock.exchange"/></td>
				<td><%  if (aForm.getLocalStockExchange().equals(ICMSConstant.TRUE_VALUE) || Boolean.valueOf(aForm.getLocalStockExchange()).booleanValue()) {	%>
						Yes
					<% } else { %>
						No
					<% } %> </td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "nameOfIndex")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.index.name"/></td>
				<td><bean:write name="PortItemForm" property="indexName"/>&nbsp;</td>
            </tr>
			
            <%@ include file="../common_portItem_read.jsp" %>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "brokerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.broker.name"/></td>
				<td><bean:write name="PortItemForm" property="brokerName"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "baselCompliant")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.basel.compliant.unittrust.sec"/></td>
				<td><integro:empty-if-null value="<%=BaselCompliantList.getInstance().getBaselCompliantItem(aForm.getBaselComplaintUT())%>"/>&nbsp;</td>
            </tr>
			
            <%@ include file="../common_exchange_control_read.jsp" %>
          --%></tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- <%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %> --%>

<jsp:include page="/collateral/marketablesec/linedetail/list_line_detail.jsp">
	<jsp:param name="editMode" value="false"/>
	<jsp:param name="isProcess" value="<%=isProcess%>"/>
</jsp:include>

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
