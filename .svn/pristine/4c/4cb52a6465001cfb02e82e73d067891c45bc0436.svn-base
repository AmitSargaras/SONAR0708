<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@ page import="com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.ui.common.StockExchangeList,
                 com.integrosys.cms.app.feed.bus.stock.IStockExchange,
                 java.util.Arrays,
                 java.util.Comparator,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.feed.bus.stock.StockExchangeComparator,
                 com.integrosys.cms.app.common.constant.ICMSConstant"
%>
<%@page import="com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry"%>
<%@page import="com.integrosys.cms.app.feed.bus.bond.OBBondFeedEntry"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    PortItemForm aForm = (PortItemForm)request.getAttribute("PortItemForm");

    StockExchangeList stockExchangeList = StockExchangeList.getInstance();
    IStockExchange[] stockExchangesArr = stockExchangeList.getStockExchanges();
    Arrays.sort(stockExchangesArr, new StockExchangeComparator());
    List labels = new ArrayList();
    List values = new ArrayList();
    for (int i = 0; i < stockExchangesArr.length; i++) {
        labels.add(stockExchangesArr[i].getStockExchangeName());
        values.add(stockExchangesArr[i].getStockExchangeCode());
    }

    pageContext.setAttribute("stockMarketID", values);
    pageContext.setAttribute("stockMarketValue", labels);

    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.serviceColObj");
    String subtypeCode = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
    
    String from_event = (String) session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_EQUITY_EVENT);
    
    String prefix1 = "Mark";
	int rowIdx=0;
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
<script type="text/javascript" src="js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function changeGovtName(theOpt){
    document.forms[0].govtName.disabled=theOpt;
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

function submitPage(num) {
	enableAllFormElements();

    if (num == 1) {
    	document.forms[0].event.value="marksecbondlocal_create";
    }
	if (num == 2) {
    	document.forms[0].event.value="marksecbondlocal_update";
    }
    if (num == 3) {
        document.forms[0].event.value="cancel";
    }
    document.forms[0].submit();
}
function checkNoOfUnit(){
	var noOfUnit = document.forms[0].noOfUnit.value;
	var tempNoOfUnit="";
	for(i=0;i<noOfUnit.length;i++){
		if(noOfUnit.charAt(i)!=","){
			tempNoOfUnit += noOfUnit.charAt(i);
		}
	} 
	document.forms[0].noOfUnit.value = tempNoOfUnit;
}
function getCodeValue() {            

           
            var schemeCode= document.forms[0].stockCode.value;
            
                 document.forms[0].action="MarketPortItem.do?event=marksecbondlocal_prepare&bondCode="+schemeCode;
			
			document.forms[0].submit();
        } 
function getCodeValueEdit() {            

    
    var schemeCode= document.forms[0].stockCode.value;
    
         document.forms[0].action="MarketPortItem.do?event=prepare_update_scriptcode&bondCode="+schemeCode;
	
	document.forms[0].submit();
} 
//-->
</script>
<script type="text/javascript" src="js/calDriver.js"></script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>

<html:form action="MarketPortItem.do">
<input type="hidden" name="event"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>" />
<input type="hidden" name="from_event" value="<%=from_event%>"/>
<% int index =2;

if ("marksecbondlocal_prepare".equals(request.getParameter("event")) 
		||"marksecbondlocal_create".equals(request.getParameter("event"))){
	index = 1;
}


    IBondFeedEntry obMutualFundsEntry = null;
    String bondName =  null;
    String isinCode =  null;
    String maturDate = null;
    String bondRating = null;
    String schemeCode = null;
    String faceValue = null;
    String bondType = null;
    String unitValTemp = null;
    double unitVal = 0.0d;
    DateFormat df= new SimpleDateFormat("dd/MMM/yyyy");
    String event = (String)request.getAttribute("event");
    if(request.getAttribute("bondFeedEntry")!= null){
  		obMutualFundsEntry = (OBBondFeedEntry)request.getAttribute("bondFeedEntry");
  
    schemeCode =  obMutualFundsEntry.getBondCode();
    bondName =  obMutualFundsEntry.getName();
    isinCode =  obMutualFundsEntry.getIsinCode();
    bondRating = obMutualFundsEntry.getRating();
    faceValue = Double.toString(obMutualFundsEntry.getUnitPrice());
    unitVal = obMutualFundsEntry.getUnitPrice();
        if(obMutualFundsEntry.getMaturityDate()!=null)
     	 maturDate = df.format(obMutualFundsEntry.getMaturityDate());
    }else{
   // schemeCode= null;
    	    bondName =  request.getParameter("bondMarket");
    	    isinCode = request.getParameter("isinCode");
    	    maturDate = request.getParameter("maturDate");
    	    bondRating = request.getParameter("bondType");
    	    unitValTemp = request.getParameter("unitPrice");
    	    if(unitValTemp !=null){
     	    	if(unitValTemp.contains(",")){
     	    		unitValTemp=unitValTemp.replaceAll("[,]", "");
     			}
     	    	unitVal = Double.parseDouble(unitValTemp);
     	    	System.out.println("unitval "+unitVal);
    	    }
    	    faceValue = request.getParameter("unitPrice");
    }
 
%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%if(obMutualFundsEntry != null){ %>
<input type="hidden" name="bondCode" value="<%=obMutualFundsEntry.getBondCode()%>"/>
<%} %>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.sec.details"/> - <% if (index == 1) { %> New <% } else { %> Edit <% } %></h3></td>
    </tr>
    <tr>
     <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
<input type="hidden" name="isSSC" value="<%=String.valueOf(isSSC)%>"/>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
          
          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<%--<td width="20%"  class="fieldname">
					<bean:message key="label.security.legal.enforceability.date"/>&nbsp;<font color="#0000FF"><span id="span11">&nbsp;</span></font></td>
				<td width="30%">
					<html:text property="leDate" readonly="true" />
					<img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('leDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="leDate"/></td>
			--%>
			<%
//if(schemeCode != null)
//{
%>
			<td class="fieldname">
				<span ><bean:message key="label.bond.code"/></span>&nbsp;
				<span class="mandatoryPerfection">*</span></td>
			<td>
			<%if(event.equals("marksecbondlocal_prepare")){ %>
			<html:text property="stockCode" styleId="stockCode" maxlength="30" />
	        
	        <input type="Button" name="btnCode" value="Search" onclick="getCodeValue();"/>
	        <%}else{ %>
	        <html:text property="stockCode" maxlength="30" />
	        
	        <input type="Button" name="btnCode" value="Search" onclick="getCodeValueEdit();"/>
	        <%} %>
	        &nbsp;<html:errors property="stockCode"/>&nbsp;
			</td>
			<td class="fieldname"><bean:message key="label.security.bond.faceValue"/></td>
			<td>&nbsp;<integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(faceValue)%>"/></td> 
					
					
			
			
<%
//}
//else{
 %>
 <%--<td class="fieldname">
				<span ><bean:message key="label.bond.code"/></span>&nbsp;
				<span class="mandatoryPerfection">*</span></td>
			<td><html:text property="stockCode" maxlength="30" value=""  onchange="getCodeValue();"/>
	        &nbsp;<html:errors property="stockCode"/>&nbsp;
	        <input type="Button" name="btnCode" value="Search" onclick="getCodeValue();"/>
			</td>
			 
           <td class="fieldname"><bean:message key="label.security.bond.faceValue"/></td>
			<td>&nbsp;<integro:empty-if-null value="<%=faceValue%>"/></td> 
 				
	--%><%
 //}
  %>			
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--<%=obMutualFu.getSchemeName() %>
            
          --%>
           <td width="20%" class="fieldname">Bond Name&nbsp;</td>   
          <td><html:text property="bondMarket" value="<%=bondName%>" readonly="true" />&nbsp;
          <html:hidden property="bondMarket" value="<%=bondName%>"/></td>
        
        <td width="20%" class="fieldname">ISIN Code&nbsp;</td>
       	<td><html:text property="isinCode" value="<%=isinCode%>" readonly="true" />&nbsp;
          <html:hidden property="isinCode" value="<%=isinCode%>"/></td>      
        
         </tr>
         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--<%=obMutualFu.getSchemeName() %>
            
          --%>
             
        <td width="20%" class="fieldname">Maturity Date&nbsp;</td>
		<td><html:text property="bondMatDate" value="<%=maturDate%>" readonly="true" />&nbsp;
          <html:hidden property="bondMatDate" value="<%=maturDate%>"/></td>   
          
           <td width="20%" class="fieldname">Bond Rating&nbsp;</td>           
			<td><html:text property="bondType" value="<%=bondRating%>" readonly="true" />&nbsp;
          <html:hidden property="bondType" value="<%=bondRating%>"/></td>            
         </tr>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname">
					<span class=stp><bean:message key="label.security.cert.num"/></span><span class="mandatory">*</span></td>
				<td><html:text property="certNo" size="20" maxlength="20"/>&nbsp;
					<html:errors property="certNo"/></td>
				<td width="20%" class="fieldname"><bean:message key="label.security.reg.owner"/></td>
				<td><html:text property="registeredName" maxlength="50"/>&nbsp;
					<html:errors property="registeredName"/></td>
            </tr>
			
			--%>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname">
					<span ><bean:message key="label.marketsec.port.detail.noofunits"/></span>&nbsp;
					<span class="mandatoryPerfection">*</span></td>
				<td><html:text property="noOfUnit" maxlength="15"/>&nbsp;
					<html:errors property="noOfUnit"/></td>
				<%--<td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
					<html:hidden property="unitPriceCcyCode"/>
					<html:hidden property="unitPrice"/>
				<td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>&nbsp;<bean:write name="PortItemForm" property="unitPrice"/>&nbsp;</td>
           
           
            --%>
	             <td width="20%" class="fieldname"><bean:message key="label.predeal.curr.unit.price"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
		    	<td width="30%"><html:text  property="unitPrice" value="<%=UIUtil.formatWithCommaAndDecimal(Double.toString(unitVal))%>" readonly="true"/><html:errors property="unitPrice"/></td>
				<html:hidden property="unitPriceCcyCode"/>
				<html:hidden property="unitPrice"/>
            
            </tr>
            
            <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td width="20%" class="fieldname">
					<bean:message key="label.security.client.code"/>&nbsp;</td>
			    <td><html:text property="clientCode" maxlength="30"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.security.bond.value"/>&nbsp;
					<span class="mandatoryPerfection">*</span></td>
				<td><html:text property="nominalValue" maxlength="15"/>&nbsp;
					<html:errors property="nominalValue"/></td>
					<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.custodian"/>&nbsp;<span class="mandatory">*</span></td>
				<td><% boolean isInternal = false;
                    if (isUpdate && aForm.getSecCustodianType() != null)
                        isInternal = aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN);
					%>
					<html:radio property="secCustodianType" value="<%=ICMSConstant.INTERNAL_COL_CUSTODIAN%>"  onclick="updateInternal()">
						<bean:message key="label.security.custodian.internal"/></html:radio>
					<br>
					<html:select property="secCustodianInt" disabled="<%=!isUpdate || !isInternal%>">
	                    <option value=""><bean:message key="label.please.select"/> </option>
	                    <html:options name="secCustodianID" labelName="secCustodianList"/>
	                </html:select>
	                <html:errors property="secCustodianInt"/>
	                <br>
	                <html:radio property="secCustodianType" value="<%=ICMSConstant.EXTERNAL_COL_CUSTODIAN%>"  onclick="updateExternal()">
	                    <bean:message key="label.security.custodian.external"/></html:radio>
	                <br>
	                <html:text property="secCustodianExt" size="30" maxlength="50" disabled="<%=!isUpdate || isInternal%>"/>&nbsp;
	                <html:errors property="secCustodianExt"/>
					<html:errors property="secCustodianType"/></td>
			    <td class="fieldname"> <bean:message key="label.security.isin.num"/></td>
			    <td><html:text property="isinCode" maxlength="20"/>
			        &nbsp;<html:errors property="isinCode"/></td>
            </tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.issuer.name"/></span><span class="mandatory">*</span></td>
				<td><html:text property="issuerName" maxlength="50"/>&nbsp;
					<html:errors property="issuerName"/></td>
				<td class="fieldname"><bean:message key="label.security.issuer.identify.type"/></td>
				<td><html:text property="isserIdentType" maxlength="30"/>&nbsp;
					<html:errors property="isserIdentType"/></td>
            </tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.lead.manager.syndicate"/></td>
				<td><html:text property="leadMgr" maxlength="50"/>&nbsp;
					<html:errors property="leadMgr"/></td>
				<td class="fieldname"><bean:message key="label.security.bond.market.country"/></td>
				<td><html:select property="countryBondMarket">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="countryValues" labelName="countryLabels"/>
                    </html:select></td>
            </tr>
			
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.settlement.org"/></td>
				<td><html:select property="settleOrg">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="settleOrgID" labelName="settleOrgValue"/>
                    </html:select></td>
				<td class="fieldname"><bean:message key="label.security.bond.issue.date"/></td>
				<td><html:text property="bondIssueDate" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('bondIssueDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="bondIssueDate"/></td>
            </tr>
			
			--%>
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<%--<td class="fieldname"><bean:message key="label.security.bond.faceValue"/></td>
					<td><html:text property="bondMarket" value="<%=faceValue %>"/>&nbsp;<html:errors property="bondMarket"/></td>
						
					--%>
					
					<td class="fieldname"><bean:message key="label.security.bond.interest"/></td>
						
					<td><html:text  property="bondRating"/>&nbsp;
						<html:hidden property="bondRating"/>
						<html:errors property="bondRating"/>
					</td>
					<td>&nbsp;</td>
				<td>&nbsp;</td>
	            </tr>
				<%--<td class="fieldname">
					<span class=stp><bean:message key="label.security.bond.maturity.date"/></span>&nbsp;
					<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>              
				<td><html:text property="bondMatDate" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('bondMatDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="bondMatDate"/></td>
				--%>
			
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.bond.type"/>&nbsp;<span class="mandatory">*</span></td>
				<td><html:select property="bondType">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="bondTypeID" labelName="bondTypeValue"/>
                    </html:select>
					<html:errors property="bondType"/></td>
				<td class="fieldname"><bean:message key="label.security.bond.rating"/></td>
					<html:hidden property="bondRating"/>
				<td><bean:write name="PortItemForm" property="bondRating"/>&nbsp;</td>
            </tr>

			--%><%--<%@ include file="../common_exchange_control_update.jsp" %>

			--%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- <%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %> --%>
<jsp:include page="/collateral/marketablesec/bond/linedetail/list_line_detail.jsp">
	<jsp:param name="editMode" value="true"/>
</jsp:include>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                      <% if (!isSSC) { %>
         <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(<%=index%>)" onclick = "checkNoOfUnit()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image142" width="60" height="22" border="0" id="Image142" /></a></td>

         <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
         <% } else { %>
         <td width="100" colspan="2" valign="baseline" align="center"> <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
         <% } %>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
					  <tr><td height="50">&nbsp;</td></tr>
                    </table>
</html:form>

</body>
</html>
