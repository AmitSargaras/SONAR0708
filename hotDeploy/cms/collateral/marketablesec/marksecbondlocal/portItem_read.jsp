<%@ page import="com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecbondlocal.BondTypeList,
                 com.integrosys.cms.ui.collateral.marketablesec.SettleOrgList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.StockExchangeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.collateral.BookingLocationList"%>
                 <%@page import="com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry"%>
                 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.integrosys.cms.app.feed.bus.bond.OBBondFeedEntry"%>
<%
	String actionStr = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	CommonCodeList commonCode = CommonCodeList.getInstance(itrxValue.getStagingCollateral().getCollateralLocation(), ICMSConstant.CATEGORY_CODE_BKGLOC, true);

    PortItemForm aForm = (PortItemForm)request.getAttribute("PortItemForm");
    String from_event = request.getParameter("from_event");
    boolean isProcess = (from_event.equals("process"));
    String prefix1 = "Mark";
    IMarketableEquity stagingOB = (IMarketableEquity)request.getAttribute("stageEquity");
    IMarketableEquity originOB = (IMarketableEquity) request.getAttribute("actualEquity");
    Amount oldNominal = null;
    Amount newNominal = null;
    if (stagingOB != null) {
        newNominal = stagingOB.getNominalValue();
    }
    if (originOB != null) {
        oldNominal = originOB.getNominalValue();
    }

	int rowIdx = 0;
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript">

function getCodeValue() {            

           
            var schemeCode= document.forms[0].stockCode.value;
           
                 document.forms[0].action="MarketPortItem.do?event=marksecbondlocal_prepare&bondCode="+schemeCode;
			
			document.forms[0].submit();
        } </script>

</head>
<% 	
    IBondFeedEntry obMutualFundsEntry = null;
    String bondName =  null;
    String isinCode =  null;
    String maturDate = null;
    String bondRating = null;
    String schemeCode= null;
     String faceValue = null;
    double unitVal = 0.0d;
    if(request.getAttribute("bondFeedEntry")!= null){
  		obMutualFundsEntry = (OBBondFeedEntry)request.getAttribute("bondFeedEntry");
  
    schemeCode =  obMutualFundsEntry.getBondCode();
    bondName =  obMutualFundsEntry.getName();
    isinCode =  obMutualFundsEntry.getIsinCode();
    bondRating = obMutualFundsEntry.getRating();
     faceValue = Double.toString(obMutualFundsEntry.getUnitPrice());
    unitVal = obMutualFundsEntry.getUnitPrice();
     DateFormat df= new SimpleDateFormat("dd/MMM/yyyy");
    if(obMutualFundsEntry.getMaturityDate()!=null)
     	 maturDate = df.format(obMutualFundsEntry.getMaturityDate());
    }
    else{
    schemeCode= null;
    }
 
%>
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
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"stockCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.bond.code"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			    <td><bean:write name="PortItemForm" property="stockCode"/>&nbsp;
			    <script type="text/javascript">
				getCodeValue()
				</script>
			    </td>
				<td class="fieldname"><bean:message key="label.security.bond.faceValue"/></td>
			<td>&nbsp;<integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(faceValue)%>"/></td> 
			</tr>
                 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--<%=obMutualFu.getSchemeName() %>
            
          --%>
           <td width="20%" class="fieldname">Bond Name&nbsp;</td>
           <td>&nbsp;<integro:empty-if-null value="<%=bondName%>"/></td>       
        
        <td width="20%" class="fieldname">ISIN Code&nbsp;</td>
        <td>&nbsp;<integro:empty-if-null value="<%=isinCode%>"/></td>       
        
         </tr>
         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--<%=obMutualFu.getSchemeName() %>
            
          --%>
             
        <td width="20%" class="fieldname">Maturity Date&nbsp;</td>
        <td>&nbsp;<integro:empty-if-null value="<%=maturDate%>"/></td>
        <td width="20%" class="fieldname">Bond Rating&nbsp;</td>           
           <td>&nbsp;<integro:empty-if-null value="<%=bondRating%>"/></td>
         </tr>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "certificateNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.cert.num"/></span>&nbsp;<span class="mandatory">*</span></td>
				<td width="30%" ><bean:write name="PortItemForm" property="certNo"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "registeredName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.reg.owner"/></td>
				<td width="30%"><bean:write name="PortItemForm" property="registeredName"/>&nbsp;</td>
            </tr>
			
			--%>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "noOfUnits")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span ><bean:message key="label.marketsec.port.detail.noofunits"/></span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td width="30%"><bean:write name="PortItemForm" property="noOfUnit"/>&nbsp;</td>
				<td width="20%" class="fieldname"><bean:message key="label.predeal.curr.unit.price"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td width="30%"><bean:write name="PortItemForm" property="unitPrice"/>&nbsp;</td>
            </tr>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "clientCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.client.code"/>&nbsp;</td>
				<td width="30%"><bean:write name="PortItemForm" property="clientCode"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newNominal,oldNominal,"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.bond.value"/></td>
				<td ><bean:write name="PortItemForm" property="nominalValue"/>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			
			
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.custodian"/> &nbsp;<span class="mandatory">*</span></td>
				<td width="30%">
					<%  if (aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) {	%>
						<bean:message key="label.security.custodian.internal"/> &nbsp;&nbsp;
						<integro:empty-if-null value="<%=commonCode.getCommonCodeLabel(aForm.getSecCustodianInt())%>"/>
					<%  } else {	%>
						<bean:message key="label.security.custodian.external"/> &nbsp;&nbsp; <bean:write name="PortItemForm" property="secCustodianExt"/>
					<% } %> </td>
			    <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isinCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
			        <bean:message key="label.security.isin.num"/></td>
			    <td><bean:write name="PortItemForm" property="isinCode"/>&nbsp;</td>
            </tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.issuer.name"/></span>&nbsp;<span class="mandatory">*</span></td>
				<td><bean:write name="PortItemForm" property="issuerName"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerIdType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.issuer.identify.type"/></td>
				<td ><bean:write name="PortItemForm" property="isserIdentType"/>&nbsp;</td>
            </tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "leadManager")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.lead.manager.syndicate"/></td>
				<td><bean:write name="PortItemForm" property="leadMgr"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "stockExchangeCountry")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.bond.market.country"/></td>
				<td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getCountryBondMarket())%>"/>&nbsp;</td>
            </tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "settlementOrganisation")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.settlement.org"/></td>
				<td><integro:empty-if-null value="<%=SettleOrgList.getInstance().getSettlementOrgItem(aForm.getSettleOrg())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "bondIssueDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.bond.issue.date"/></td>
				<td><bean:write name="PortItemForm" property="bondIssueDate"/>&nbsp;</td>
            </tr>
			
			--%>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<%--<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "bondMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.bond.maturity.date"/></span>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><bean:write name="PortItemForm" property="bondMatDate"/>&nbsp;</td>
				--%>
				
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<!-- <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "equityType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.bond.type"/>&nbsp;<span class="mandatory">*</span></td>
				<td><integro:empty-if-null value="<%=BondTypeList.getInstance().getBondTypeItem(aForm.getBondType())%>" />&nbsp;</td> -->
				
				<%--<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "stockExchange")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.bond.faceValue"/></td>
				<td><integro:empty-if-null value="<%=aForm.getStockExchange()%>"/>&nbsp;</td>
				
				--%><td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "bondRating")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.bond.interest"/></td>
				<td><bean:write name="PortItemForm" property="bondRating"/>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
            </tr>
			
            <%-- @ include file="../common_exchange_control_read.jsp" --%>
				
			
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- <%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %> --%>
<jsp:include page="/collateral/marketablesec/bond/linedetail/list_line_detail.jsp">
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
