<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@ page import="com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecotherlistedlocal.EquityTypeList,
                com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.ui.common.StockExchangeList,
                 com.integrosys.cms.app.feed.bus.stock.IStockExchange,
                 java.util.Arrays,
                 java.util.Comparator,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.app.feed.bus.stock.StockExchangeComparator,                 
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry"
%>

<%
    PortItemForm aForm = (PortItemForm)request.getAttribute("PortItemForm");
    StockExchangeList stockExchangeList = StockExchangeList.getInstance();
    IStockExchange[] stockExchangesArr = stockExchangeList.getStockExchanges();
    Arrays.sort(stockExchangesArr, new StockExchangeComparator());
        String event = (String)request.getAttribute("event");
    List labels = new ArrayList();
    List values = new ArrayList();
    List country = new ArrayList();
    int numOfExchange = 0;
    for (int i = 0; i < stockExchangesArr.length; i++) {
        labels.add(stockExchangesArr[i].getStockExchangeName());
        values.add(stockExchangesArr[i].getStockExchangeCode());
        country.add(stockExchangesArr[i].getCountryCode());
        numOfExchange = i+1;
    }

    pageContext.setAttribute("stockMarketID", values);
    pageContext.setAttribute("stockMarketValue", labels);

    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.serviceColObj");
    String subtypeCode = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
    
    String exchangeCode = (String)request.getAttribute("stockExchange");
    String scriptCode = (String)request.getAttribute("scriptCode");
    
    String prefix1 = "Mark";
   IStockFeedEntry stockFeedEntry = (IStockFeedEntry)request.getAttribute("stockFeedEntry");  
    String strScriptName = "-";
    String strFaceValue = "-";
    String strUnitPrice  = "";
    String stockFeedEntryResult = "";
    
   if(stockFeedEntry!=null)
   {
   strScriptName = stockFeedEntry.getScriptName();
   strFaceValue = Double.toString(stockFeedEntry.getFaceValue());
   strUnitPrice = Double.toString(stockFeedEntry.getScriptValue());
  	  
   }
   else
   {
   //stockFeedEntryResult = "Script Code not found";
   }
	int rowIdx = 0;
	
	String sessionEquityEvent = (String) session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_EQUITY_EVENT);
%>

<script language="javascript">
    var strA = new Array(<%=numOfExchange%>) ;
    <%
     for(int i=0; i<numOfExchange; i++){%>
        strA[<%=i%>] = "<%=country.get(i)%>";
    <%}%>

</script>

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
    	document.forms[0].event.value="marksecotherlistedlocal_create";
    	document.getElementById('scriptCode').value = document.forms[0].isinCode.value;
    	//alert(document.forms[0].stockExchange.value);
    	//alert(document.getElementById('scriptCode').value);
    }
	if (num == 2) {
    	document.forms[0].event.value="marksecotherlistedlocal_update";
    	document.getElementById('scriptCode').value = document.forms[0].isinCode.value;
    	//alert(document.forms[0].stockExchange.value);
    	//alert(document.getElementById('scriptCode').value);
    }
    if (num == 3) {
        document.forms[0].event.value="cancel";
    }
    

    document.forms[0].submit();

   
}

function codeSearch() {
var stockExchange = document.forms[0].stockExchange.options[document.forms[0].stockExchange.selectedIndex].value;
var scriptCode = document.forms[0].isinCode.value;
	document.forms[0].action ="MarketPortItem.do?event=marksecotherlistedlocal_prepare&stockExchange="+stockExchange+"&scriptCode="+scriptCode;
		    document.forms[0].submit();
}

function codeSearchEdit() {
	var stockExchange = document.forms[0].stockExchange.options[document.forms[0].stockExchange.selectedIndex].value;
var scriptCode = document.forms[0].isinCode.value;
	document.forms[0].action ="MarketPortItem.do?event=prepare_update_scriptcode&stockExchange="+stockExchange+"&scriptCode="+scriptCode;
	    document.forms[0].submit();
}

function uncheck_yesno(obj)
{
  var field = obj;
  
   
  for (var i=0; i<field.length; i++)
  field[i].checked = false;
}


function codeSearchStock() {
	//alert(document.forms[0].stockExchange.selectedIndex);
///var stockExchange = document.forms[0].stockExchange.options[document.forms[0].stockExchange.selectedIndex].value;
//var scriptCode = document.forms[0].isinCode.value;
//alert(stockExchange);
document.forms[0].isinCode.value = '';
uncheck_yesno(document.forms[0].isserIdentType);

//document.forms[0].isserIdentType.value = '';
//alert(document.forms[0].isserIdentType.cheked);
document.forms[0].noOfUnit.value = '';
document.forms[0].nominalValue.value = '';
document.forms[0].issuerName.value = '';
document.forms[0].certNo.value = '';
document.forms[0].indexName.value = '';

	document.forms[0].action ="MarketPortItem.do?event=marksecotherlistedlocal_prepare&stockExchange="+null+"&scriptCode="+null;
	//alert(scriptCode);
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

function defaultStockExchangeCountry(selObj){
    var stkExchange = selObj.options[selObj.selectedIndex].value;
    //var xchangeCtry = retrieveStockExchangeCountry(selObj.selectedIndex-1);    //to remove the "Please select"
    var xchangeCtry = strA[selObj.selectedIndex-1];
    for(i=0; i<document.forms[0].countryStockExchange.options.length; i++){
        if (xchangeCtry == document.forms[0].countryStockExchange.options[i].value){
            document.forms[0].countryStockExchange.options[i].selected=true;
        } else {
            document.forms[0].countryStockExchange.options[i].selected=false;
        }
    }
   }
   
   function txtBoxAction(txtAction)
   {
  		if(txtAction=='dis')
  		{
  		 	document.forms[0].indexName.disabled=true;
  	 		document.forms[0].indexName.value = ''; 
  		}
  		if(txtAction=='enb')
  		{
  	    	document.forms[0].indexName.disabled = false; 
  		}
   }
   function txtBoxAction1()
   {
	 //  var scriptCode = document.getElementById('isserIdentType');
	   var scriptCode = document.forms[0].isserIdentType;
var chosen = '';
		   len = scriptCode.length;		   
		   for (i = 0; i <len; i++) {			  
		   if (scriptCode[i].checked) {
		   chosen = scriptCode[i].value
		   }
		   }     	 
	   
	  
  		if(chosen=='others')
  		{
  			document.forms[0].indexName.disabled = false; 
  		 	
  		}
  		else
  		{
  			document.forms[0].indexName.disabled=true;
  	 		document.forms[0].indexName.value = ''; 
  		}
   }

//-->
</script>
<script type="text/javascript" src="js/calDriver.js"></script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%if(stockFeedEntry != null){ %>



<input type="hidden" name="stockExchange" value="<%=(String)request.getAttribute("stockExchange")%>"/>
<%} %>


<html:form action="MarketPortItem.do">
<input type="hidden" name="event" value="<%=event %>"/>
<input type="hidden" name="scriptCode" id="scriptCode" value="<%=request.getParameter("scriptCode")%>" />
<input type="hidden" name="subtype" id="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" id="indexID" value="<%=request.getParameter("indexID")%>" />
<input type="hidden" name="from_event" value="<%=sessionEquityEvent%>"/>


<% int index =2;

  if ("marksecotherlistedlocal_prepare".equals(request.getParameter("event")) || "marksecotherlistedlocal_create".equals(request.getParameter("event")) ||
		  (request.getParameter("event") != null && request.getParameter("event").endsWith(MarketableEquityLineDetailAction.EVENT_PREPARE_CREATE_LINE_DETAIL))) {
	index = 1;
  }

%>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.sec.details"/> - <% if (index == 1) { %> New <% } else { %> Edit <% } %></h3></td>
       <!-- CR CMS-99 -->
  <!--    	  <TD vAlign=bottom align=right >
      	  <TABLE cellSpacing=0 class="tblFormSection" width="35%">
      	    <TBODY>
      	    <TR>
      	    <TD class="edit">&nbsp;</TD>
      	    <TD >SSC Editable Field </TD>
      	    </TR>
      	    </TBODY></TABLE>
      	  </TD>     -->
      <!-- CR CMS-99 -->
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
    <input type="hidden" name="isSSC" value="<%=String.valueOf(isSSC)%>"/>
		<td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>
			
							<tr class="even">
                                <td class="fieldname">Name of Stock Exchange<font color="red">* </font></td>
                                
                                <%
                                if (stockFeedEntry != null)
                                {
%>                               <td>
                                
                                    <html:select property="stockExchange" onchange="codeSearchStock();" >
                                    	<integro:common-code 
                                    		categoryCode="<%=ICMSUIConstant.SHARE_TYPE%>" 
                                    		refEntryCode="<%=ICMSUIConstant.STOCK_TYPE%>" 
                                    		onlyMatchRefEntry="true" />
                                    </html:select>
                                    <html:errors property="stockExchange"/>
                                </td>
                                
                                
					<%}else{ %>          
 					<td>
                                
                                    <html:select property="stockExchange" value="">
                                    	<integro:common-code 
                                    		categoryCode="<%=ICMSUIConstant.SHARE_TYPE%>" 
                                    		refEntryCode="<%=ICMSUIConstant.STOCK_TYPE%>" 
                                    		onlyMatchRefEntry="true" pleaseSelect="true"/>
                                    </html:select>
                                    <html:errors property="stockExchange"/>
                                </td>
						<%} %>                      	
                   					<td width="20%" class="fieldname">Script Code<font color="red">* </font>
									</td>
									<%if(event.equals("marksecotherlistedlocal_prepare")){ %>
							<%
							if(stockFeedEntry != null)
							{
							%>
									<td><html:text property="isinCode" maxlength="30" /><input type="Button" name="btnSearch" value="CodeSearch" onclick="codeSearch();"/>
							<%
							}
							else{
 							%>
							 <td><html:text property="isinCode" maxlength="30"  value="" /><input type="Button" name="btnSearch" value="CodeSearch" onclick="codeSearch();"/><font color="red"><%=stockFeedEntryResult %></font>
 							<%} %>
 							<%}else{ %>
 							<%
							if(stockFeedEntry != null)
							{
							%>
									<td><html:text property="isinCode" maxlength="30" /><input type="Button" name="btnSearch" value="CodeSearch" onclick="codeSearchEdit();"/>
							<%
							}
							else{
 							%>
							 <td><html:text property="isinCode" maxlength="30"  value="" /><input type="Button" name="btnSearch" value="CodeSearch" onclick="codeSearchEdit();"/><font color="red"><%=stockFeedEntryResult %></font>
 							<%} %>
 							<%} %>
									
									<html:errors property="isinCode"/></td>
                            </tr>

			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" >
				<td width="20%" class="fieldname">
					Script Name</td>
				<td><%=strScriptName%></td>
				<td width="20%" class="fieldname">1) Promoters of the borrowing company 2) Group company 3) Others</td>
				<td>1.<html:radio property="isserIdentType" value="promoters" onclick="txtBoxAction('dis')"/>
					&nbsp;&nbsp;
					2.<html:radio property="isserIdentType" value="groupcompany" onclick="txtBoxAction('dis')"/>&nbsp;&nbsp;
					
				Others<html:radio property="isserIdentType"  value="others" onclick="txtBoxAction('enb')"/>
				
				<html:text property="indexName" maxlength="50"  onfocus="txtBoxAction1()"/>&nbsp;
					<html:errors property="indexName"/></td>
            </tr>

			
			<%--
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname">
					<bean:message key="label.security.equity.type"/>&nbsp;<span class="mandatory">*</span></td>
				<td><html:select property="equityType">
						<option value="" ><bean:message key="label.please.select"/> </option>
						<html:options name="equityTypeID" labelName="equityTypeValue" />
					</html:select>
					<html:errors property="equityType"/></td>
				<td width="20%" class="fieldname"><bean:message key="label.security.cert.num"/></td>
				<td><html:text property="certNo" size="20" maxlength="20"/>&nbsp;
					<html:errors property="certNo"/></td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname"><bean:message key="label.security.nominee.name"/></td>
				<td><html:select property="nomineeName">
						<option value="" ><bean:message key="label.please.select"/> </option>
						<html:options name="nomineeNameID" labelName="nomineeNameValue"/>
                    </html:select></td>
				<td width="20%" class="fieldname"><bean:message key="label.security.confirmation.frm.nominee.date"/></td>
				<td><html:text property="dateConfirmNomine" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('dateConfirmNomine', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="dateConfirmNomine"/></td>
            </tr>

			--%>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname"><bean:message key="label.security.reg.owner"/>&nbsp;</td>
				<td><html:text property="registeredName" maxlength="50"/>&nbsp;
					<html:errors property="registeredName"/></td>
			    <td class="fieldname"><bean:message key="label.security.recognize.exchange"/>&nbsp;</td>
				<td><html:radio property="recognizeExchange" value="true"/><bean:message key="label.common.yes"/>
					&nbsp;&nbsp;
					<html:radio property="recognizeExchange" value="false"/><bean:message key="label.common.no"/>
					<html:errors property="recognizeExchange"/></td>
            </tr>

			--%>
			
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td width="20%" class="fieldname">
					<bean:message key="label.security.client.code"/>&nbsp;</td>
			    <td><html:text property="clientCode" maxlength="30"/>&nbsp;</td>
			    <td width="20%" class="fieldname">
					<span class=stp><bean:message key="label.security.cds.number"/></span></td>
			    <td width="30%"><html:text property="cdsNumber"/></td>
			</tr>

			--%>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname">
					<bean:message key="label.marketsec.port.detail.noofunits"/>&nbsp;
					<span class="mandatoryPerfection">*</span></td>
				<td><html:text property="noOfUnit" maxlength="20"/>&nbsp;
					<html:errors property="noOfUnit"/></td>
				<td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
					<html:hidden property="unitPriceCcyCode"/>
			
				<td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>&nbsp;<html:text name="PortItemForm" property="unitPrice" value="<%=UIUtil.formatWithCommaAndDecimal(strUnitPrice)%>" maxlength="8" readonly="True"/><!--<bean:write name="PortItemForm" property="unitPrice"/>-->&nbsp;<html:errors property="unitPrice"/></td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.nominal.value"/></td>
				<td><html:text property="nominalValue" maxlength="15" size="23" styleId="nominalValue" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
					<html:errors property="nominalValue"/></td>
				<td class="fieldname">Face Value</td>
				<td><%=UIUtil.formatWithCommaAndDecimal(strFaceValue)%>&nbsp;
					
				</td>
				<%--<td class="fieldname"><bean:message key="label.security.exercise.price"/></td>
				<td><html:text property="exercisePrice"/>&nbsp;
					<html:errors property="exercisePrice"/>
				</td>
            --%></tr><%--

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.referred"/>&nbsp;<span class="mandatory">*</span></td>
				<td><html:radio property="secBlackListed" value="true"/><bean:message key="label.common.yes"/>
					&nbsp;&nbsp;
					<html:radio property="secBlackListed" value="false"/><bean:message key="label.common.no"/>
					<html:errors property="secBlackListed"/></td>
				<td class="fieldname">&nbsp;</td>
				<td >&nbsp;</td>
            </tr>

			--%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
			<%--<td width="20%" class="fieldname"><bean:message key="label.security.custodian"/></td>
				<td><html:text property="secCustodianInt" size="20" maxlength="20"/>&nbsp;
					<html:errors property="secCustodianInt"/></td>				
					
								
			
			--%><td width="20%" class="fieldname"><bean:message key="label.security.cert.num"/></td>
				<td><html:text property="certNo" size="20" maxlength="20"/>&nbsp;
					<html:errors property="certNo"/></td>
					<td class="fieldname">
					<bean:message key="label.security.issuer.name"/>&nbsp;
					</td>
				<td><html:text property="issuerName" maxlength="200"/>&nbsp;
					<html:errors property="issuerName"/></td>
					
					
					
			<%-- 
				<td class="fieldname"><bean:message key="label.security.custodian"/>&nbsp;</td>
	            <td><% boolean isInternal = false;
	                    if (isUpdate && aForm.getSecCustodianType() != null)
	                        isInternal = aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN);
	                %>
	                <html:radio property="secCustodianType" value="<%=ICMSConstant.INTERNAL_COL_CUSTODIAN%>"  onclick="updateInternal()">
	                    <bean:message key="label.security.custodian.internal"/></html:radio>
	                <br>--%>	<%--
	                <html:select property="secCustodianInt" disabled="<%=!isUpdate || !isInternal%>"  >
	                    --%><!--
	                     <html:select property="secCustodianInt" disabled="true"  >
	                    <option value=""><bean:message key="label.please.select"/> </option>
	                    <html:options name="secCustodianID" labelName="secCustodianList"/>
	                </html:select>
	                <html:errors property="secCustodianInt"/>
	                --><%-- 
	                <br>
	                <html:radio property="secCustodianType" value="<%=ICMSConstant.EXTERNAL_COL_CUSTODIAN%>"  onclick="updateExternal()">
	                    <bean:message key="label.security.custodian.external"/></html:radio>
	                <br>
	                <html:text property="secCustodianExt" size="30" maxlength="50" disabled="<%=!isUpdate || isInternal%>"/>&nbsp;
	                <html:errors property="secCustodianExt"/>
					<html:errors property="secCustodianType"/>
					--%>
				<!--</td>
				
				
				--><%--
			    <td class="fieldname"> <bean:message key="label.security.isin.num.stock.code"/> <span id="spanISINCODE"><span class="mandatory">*</span></span></td>
			    <td><html:text property="isinCode" maxlength="20"/>
			        &nbsp;<html:errors property="isinCode"/></td>
			        --%>
            </tr>

			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.issuer.name"/>&nbsp;
					</td>
				<td><html:text property="issuerName" maxlength="200"/>&nbsp;
					<html:errors property="issuerName"/></td>
					<td width="20%" class="fieldname">&nbsp;</td>
					<td>&nbsp;</td>
				
				<%--  <td class="fieldname"><bean:message key="label.security.issuer.identify.type"/></td>
				<td><html:text property="isserIdentType" maxlength="12"/>&nbsp;
					<html:errors property="isserIdentType"/></td>
            </tr>
--%><%--
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.stock.exchange"/></td>
				<td><html:select property="stockExchange" onchange="defaultStockExchangeCountry(this)">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="stockMarketID" labelName="stockMarketValue"/>
                    </html:select></td>
				
				<td class="fieldname"><bean:message key="label.security.stock.exchange.country"/></td>
				<td><html:select property="countryStockExchange">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="countryValues" labelName="countryLabels"/>
                    </html:select></td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.local.stock.exchange"/></td>
				<td><html:radio property="localStockExchange" value="true"/><bean:message key="label.common.yes"/>
					&nbsp;&nbsp;
					<html:radio property="localStockExchange" value="false"/><bean:message key="label.common.no"/>
					<html:errors property="localStockExchange"/></td>
				<td class="fieldname"><bean:message key="label.security.index.name"/></td>
				<td><html:text property="indexName" maxlength="50"/>&nbsp;
					<html:errors property="indexName"/></td>
            </tr>

			<%@ include file="../common_portItem_update.jsp" %>
			
  			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.broker.name"/></td>
				<td><html:text property="brokerName"/>&nbsp;<html:errors property="brokerName"/></td>
			    <td class="fieldname"><bean:message key="label.security.basel.compliant.unittrust.sec"/></td>
			    <td><html:select property="baselComplaintUT">
			            <option value=""><bean:message key="label.please.select"/> </option>
			            <html:options name="baselCompliantID" labelName="baselCompliantValue"/>
			        </html:select>
			        <html:errors property="baselComplaintUT"/></td>
			</tr>
			
			--%><%--
			
			<%@ include file="../common_exchange_control_update.jsp" %>
			--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
--%><%--
				<td width="20%"  class="fieldname">
					<bean:message key="label.security.legal.enforceability.date"/>&nbsp;<font color="#0000FF"><span id="span11">&nbsp;</span></font></td>
				<td width="30%">
					<html:text property="leDate" readonly="true" />
					<img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('leDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="leDate"/></td>
--%>
				<%--<td class="fieldname">
					<span class=stp><bean:message key="label.security.stock.counter.code"/></span>&nbsp;
					<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><html:text property="stockCode" maxlength="30"/>&nbsp;<html:errors property="stockCode" /></td>
			</tr>	
          --%></tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%--
	<%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %>
--%>

<jsp:include page="/collateral/marketablesec/linedetail/list_line_detail.jsp">
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
