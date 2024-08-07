<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.stock.IStockExchange,
                 com.integrosys.cms.app.feed.bus.stock.StockExchangeComparator,
				 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecmainlocal.EquityTypeList,
                 com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.ui.common.StockExchangeList,
				 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
				 com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry,
				 com.integrosys.cms.app.feed.bus.mutualfunds.OBMutualFundsFeedEntry,
				 com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@ page import="java.util.*" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@page import="com.crystaldecisions.thirdparty.com.ooc.CORBA.Request"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>


<%
    PortItemForm aForm = (PortItemForm) request.getAttribute("PortItemForm");
     String event = (String)request.getAttribute("event");
    StockExchangeList stockExchangeList = StockExchangeList.getInstance();
    IStockExchange[] stockExchangesArr = stockExchangeList.getStockExchanges();
    Arrays.sort(stockExchangesArr, new StockExchangeComparator());
    List labels = new ArrayList();
    List values = new ArrayList();
    List country = new ArrayList();
    int numOfExchange = 0;
    for (int i = 0; i < stockExchangesArr.length; i++) {
        labels.add(stockExchangesArr[i].getStockExchangeName());
        values.add(stockExchangesArr[i].getStockExchangeCode());
        country.add(stockExchangesArr[i].getCountryCode());
        numOfExchange = i+1;
        //DefaultLogger.debug(this, ">>>>>>>>>>>>>>> Stock Exchange Country = " + stockExchangesArr[i].getCountryCode());
    }

    DefaultLogger.debug(this, ">>>>>>>>>>>>>>> Stock Exchange Country = " + country);
    pageContext.setAttribute("stockMarketID", values);
    pageContext.setAttribute("stockMarketValue", labels);

    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.serviceColObj");
    String subtypeCode = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
    String le = itrxValue.getStagingCollateral().getIsLE();
    
    String sessionEquityEvent = (String) session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_EQUITY_EVENT);

    String prefix1 = "Mark";
%>

<script language="javascript">
    var strA = new Array(<%=numOfExchange%>) ;
    <%
     for(int i=0; i<numOfExchange; i++){%>
        strA[<%=i%>] = "<%=country.get(i)%>";
    <%}%>
    
</script> 

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
                document.forms[0].event.value="marksecmainlocal_create";
            }
            if (num == 2) {
                document.forms[0].event.value="marksecmainlocal_update";
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
          
         function getCodeValue() {            

            
            var schemeCode= document.forms[0].stockCode.value;
            
                 document.forms[0].action="MarksecMainLocalCollateral.do?event=marksecmainlocal_prepare&schemeCode="+schemeCode;
			
			document.forms[0].submit();
        } 

         function getCodeValueEdit() {            

             
             var schemeCode= document.forms[0].stockCode.value;
             
                  document.forms[0].action="MarksecMainLocalCollateral.do?event=prepare_update_code&schemeCode="+schemeCode;
 			
 			document.forms[0].submit();
         } 

        //-->
    </script>
    <script type="text/javascript" src="js/calDriver.js"></script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>

<html:form action="MarketPortItem.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="itemType" value="<%=request.getParameter("itemType")%>"/>
<input type="hidden" name="from_event" value="<%=sessionEquityEvent%>"/>

<% 	int index = 2;
	int rowIdx=0;

    if ("marksecmainlocal_prepare".equals(request.getParameter("event")) || "marksecmainlocal_create".equals(request.getParameter("event")) || 
    		(request.getParameter("event") != null && request.getParameter("event").endsWith(MarketableEquityLineDetailAction.EVENT_PREPARE_CREATE_LINE_DETAIL))) {
        index = 1;
    }
    IMutualFundsFeedEntry obMutualFundsEntry = null;
    DateFormat df= new SimpleDateFormat("dd/MMM/yyyy");
    double unitVal = 0.0d;
    String unitValTemp = null;
    String schemeName =  null;
    String typeSheme =  null;
    String startDate = null;
    String endDate = null;
    String schemeCode= (String)request.getAttribute("schemeCode");
   
	if(request.getAttribute("fundsFeedEntry")!= null){
	    System.out.println("Inside If condition "+schemeCode);
	    System.out.println("Inside If Condition "+schemeName);
		obMutualFundsEntry = (OBMutualFundsFeedEntry)request.getAttribute("fundsFeedEntry");
	    schemeCode =  obMutualFundsEntry.getSchemeCode();
	    schemeName =  obMutualFundsEntry.getSchemeName();
	    System.out.println("Inside If Condition "+schemeName);
	      unitVal = obMutualFundsEntry.getCurrentNAV();
	     typeSheme =  obMutualFundsEntry.getSchemeType();
	     if(obMutualFundsEntry.getStartDate()!=null)
	    	 startDate = df.format(obMutualFundsEntry.getStartDate());
	     if(obMutualFundsEntry.getExpiryDate()!=null)
	     	endDate =df.format( obMutualFundsEntry.getExpiryDate());
	    // request.setAttribute("schemeCode",schemeCode);
	    }else{
 		 System.out.println("Inside else");
 		 unitValTemp = request.getParameter("nominalValue"); 
 		 System.out.println("unitvalTemp "+unitValTemp);
 		 if(unitValTemp !=null){
 	    	if(unitValTemp.contains(",")){
 	    		unitValTemp=unitValTemp.replaceAll("[,]", "");
 	    	    System.out.println("unitvalTemp post replace "+unitValTemp);
 			}
 		    
 	    	unitVal = Double.parseDouble(unitValTemp);
 	    	System.out.println("unitval "+unitVal);
 	    }
 		schemeName =  request.getParameter("schemeName");
 	    typeSheme =  request.getParameter("schemeType");
 	    startDate = request.getParameter("startDate");
 	    endDate = request.getParameter("endDate");
 	    System.out.println("SchemeName in portCreate "+request.getParameter("schemeName"));
 	    System.out.println("Validate If condition "+schemeCode);
	    }
 
%>
<%if(obMutualFundsEntry != null){ 
System.out.println("Adding hidden Values"+obMutualFundsEntry);
schemeName = obMutualFundsEntry.getSchemeName();
System.out.println("Adding hidden Values"+schemeName);%>
<input type="hidden" name="schemeCode" value="<%=obMutualFundsEntry.getSchemeCode()%>"/>
<input type="hidden" name="schemeName" value="<%=obMutualFundsEntry.getSchemeName()%>"/>
<%} 
%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="label.security.sec.details"/> - <% if (index == 1) { %> New <% } else { %> Edit <% } %></h3></td>
        <!-- CR CMS-99 -->
        <!--      	  <TD vAlign=bottom align=right >
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
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>

	   
	   
	   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	   <td class="fieldname"><bean:message key="label.global.scheme.Code"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	     <%if(event.equals("marksecmainlocal_prepare")) {%>
	      <td colspan="3"><html:text property="stockCode" maxlength="20" />
	        &nbsp;
	        <input type="Button" name="btnCode" value="Search" onclick="getCodeValue();"/>
	        <html:errors property="stockCode"/>&nbsp;
	       </td>
	       <%}else {%>
	        <td colspan="3"><html:text property="stockCode" maxlength="20" />
	        &nbsp;
	        <input type="Button" name="btnCode" value="Search" onclick="getCodeValueEdit();"/>
	        <html:errors property="stockCode"/>&nbsp;
	       </td>
	       <%} %>
	      
<%
//if(schemeCode == null)
//{
%>

<%
//}
//else{
 %><%--
 <td class="fieldname"><bean:message key="label.global.scheme.Code"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	      <td colspan="3"><html:text property="stockCode" maxlength="20" value="" onchange="getCodeValue();"/>
	        &nbsp;<html:errors property="stockCode"/>&nbsp;
	        <input type="Button" name="btnCode" value="Search" onclick="getCodeValue();"/>
	       </td>
	       
 
 --%><%
// }
  %>

	    </tr> 
	    
	    
	    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--<%=obMutualFu.getSchemeName() %>
            
          --%>
           <td width="20%" class="fieldname" >Scheme Name&nbsp;</td>
           <td width="30%">
           <html:text property="schemeName" value="<%=schemeName%>" readonly="true" />&nbsp;
           <html:hidden property="schemeName" value="<%=schemeName%>"/>
           </td>       
        
        <td width="20%" class="fieldname">Scheme Type&nbsp;</td>
        <td width="30%">
        <html:text property="schemeType" value="<%=typeSheme%>" readonly="true" />&nbsp;
        <html:hidden property="schemeType" value="<%=typeSheme%>"/>
        </td>       
        
         </tr>
         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--<%=obMutualFu.getSchemeName() %>
            
          --%>
             
        <td width="20%" class="fieldname">Start Date&nbsp;</td>
        <td width="30%"><html:text property="startDate" value="<%=startDate%>" readonly="true" />&nbsp;
        <html:hidden property="startDate" value="<%=startDate%>"/>
        </td>
        <td width="20%" class="fieldname">End Date&nbsp;</td>           
        <td width="30%"><html:text property="endDate" value="<%=endDate%>" readonly="true" />&nbsp;
           <html:hidden property="endDate" value="<%=endDate%>"/>
           </td>
         </tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>"><%--
	    <td width="20%" class="fieldname">
			<bean:message key="label.security.equity.type"/>&nbsp;<span class="mandatory">*</span></td>
	    <td><html:select property="equityType" onclick="set_ISINCODE(this.value);">
	            <option value=""><bean:message key="label.please.select"/> </option>
	            <html:options name="equityTypeID" labelName="equityTypeValue"/>
	        </html:select>
	        <html:errors property="equityType"/></td>
	    --%>
	    <td width="20%" class="fieldname"><bean:message key="label.security.cert.num"/></td>
	    <td ><html:text property="certNo" size="20" maxlength="20"/>&nbsp;
	        <html:errors property="certNo"/></td>
	        <td width="20%" class="fieldname">
			<span class="fieldname"><bean:message key="label.marketsec.port.detail.noofunits"/></span>&nbsp;
	    	<span class="mandatoryPerfection">*</span></td>
	    <td ><html:text property="noOfUnit" maxlength="15"/>&nbsp;
	        <html:errors property="noOfUnit"/></td>
	    <%--<td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
	    <td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>
	        &nbsp;<bean:write name="PortItemForm" property="unitPrice"/></td>
			--%><html:hidden property="unitPriceCcyCode"/>
			<html:hidden property="unitPrice"/>
	</tr>

	<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td width="20%" class="fieldname"><bean:message key="label.security.nominee.name"/></td>
	    <td><html:select property="nomineeName">
	            <option value=""><bean:message key="label.please.select"/> </option>
	            <html:options name="nomineeNameID" labelName="nomineeNameValue"/>
	        </html:select></td>
	    <td width="20%" class="fieldname"><bean:message key="label.security.confirmation.frm.nominee.date"/></td>
	    <td><html:text property="dateConfirmNomine" readonly="true" size="15" maxlength="11"/>
	        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('dateConfirmNomine', 'dd/mm/y')"
	             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	        <html:errors property="dateConfirmNomine"/></td>
	</tr>

	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td width="20%" class="fieldname">
			<bean:message key="label.security.reg.owner"/>&nbsp;</td>
	    <td><html:text property="registeredName" maxlength="50"/>&nbsp;
	        <html:errors property="registeredName"/></td>
	    <td class="fieldname"><bean:message key="label.security.recognize.exchange"/>&nbsp;</td>
	    <td><html:radio property="recognizeExchange" value="true"/><bean:message key="label.common.yes"/>
	        &nbsp;&nbsp;
	        <html:radio property="recognizeExchange" value="false"/><bean:message key="label.common.no"/>
	        <html:errors property="recognizeExchange"/></td>
	</tr>--%>
<%--
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td width="20%" class="fieldname">
			<bean:message key="label.security.client.code"/>&nbsp;</td>
	    <td><html:text property="clientCode" maxlength="30"/>&nbsp;</td>
	    <td width="20%" class="fieldname">
			<span class=stp><bean:message key="label.security.cds.number"/></span></td>
	    <td width="30%"><html:text property="cdsNumber"/></td>
	</tr>
--%>
	<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td width="20%" class="fieldname">
			<span class="fieldname"><bean:message key="label.marketsec.port.detail.noofunits"/></span>&nbsp;
	    	<span class="mandatoryPerfection">*</span></td>
	    <td colspan="3"><html:text property="noOfUnit" maxlength="15"/>&nbsp;
	        <html:errors property="noOfUnit"/></td>
	    <%--<td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
	    <td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>
	        &nbsp;<bean:write name="PortItemForm" property="unitPrice"/></td>
			<html:hidden property="unitPriceCcyCode"/>
			<html:hidden property="unitPrice"/>
	</tr>

	--%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td class="fieldname"><bean:message key="label.security.nav.value"/></td>
	    <td >
	    <%--<integro:empty-if-null property="nominalValue" value="<%=Double.toString(unitVal) %>"/>--%>
	    <html:text property="nominalValue" maxlength="15" value="<%=UIUtil.formatWithCommaAndDecimal(Double.toString(unitVal)) %>" readonly="true" />&nbsp;
	        <html:errors property="nominalValue"/></td>
	        <td class="fieldname">
			<span class="fieldname"><bean:message key="label.security.issuer.name"/></span></td>
	    <td><html:text property="issuerName" maxlength="200"/>&nbsp;
	        <html:errors property="issuerName"/></td>
	    <%--<td class="fieldname"><bean:message key="label.security.referred"/>&nbsp;<span class="mandatory">*</span></td>
	    <td><html:radio property="secBlackListed" value="true"/><bean:message key="label.common.yes"/>
	        &nbsp;&nbsp;
	        <html:radio property="secBlackListed" value="false"/><bean:message key="label.common.no"/>
	        <html:errors property="secBlackListed"/></td>
	--%></tr>

	<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td class="fieldname">
			<bean:message key="label.security.custodian"/>&nbsp;<span class="mandatory">*</span></td>
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
			<html:errors property="secCustodianExt"/><html:errors property="secCustodianType"/></td>
	    <td class="fieldname">
			<span class=stp><bean:message key="label.security.stock.counter.code"/></span>&nbsp;
			<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
		<td><html:text property="stockCode" maxlength="30"/>&nbsp;<html:errors property="stockCode" /></td>
	</tr>

	--%>
	        
	         <%--
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td class="fieldname">
			<span class="fieldname"><bean:message key="label.security.issuer.name"/></span></td>
	    <td colspan="3"><html:text property="issuerName" maxlength="200"/>&nbsp;
	        <html:errors property="issuerName"/></td>
	         <td class="fieldname"><bean:message key="label.stock.code"/>&nbsp;<span class="mandatory">*</span></td>
	    <td><html:text property="stockCode" maxlength="20"/>
	        &nbsp;<html:errors property="stockCode"/></td>
	       <input type="Button" name="btnCode" value="Search" onclick="getCodeValue();"/> 
	       <%=obMutualFundsEntry %>
	    --%><%--<td class="fieldname"><bean:message key="label.security.issuer.identify.type"/></td>
	    <td><html:text property="isserIdentType" maxlength="12"/>&nbsp;
	        <html:errors property="isserIdentType"/></td>
	</tr>
 --%>
	<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td class="fieldname"><bean:message key="label.stock.exchange"/></td>
	    <td><html:select property="stockExchange" onchange="defaultStockExchangeCountry(this)">
	            <option value=""><bean:message key="label.please.select"/> </option>
	            <html:options name="stockMarketID" labelName="stockMarketValue"/>
	        </html:select></td>
	    <td class="fieldname"><bean:message key="label.security.stock.exchange.country"/></td>
	    <td><html:select property="countryStockExchange">
	            <option value=""><bean:message key="label.please.select"/> </option>
	            <html:options name="countryValues" labelName="countryLabels"/>
	        </html:select></td>
	</tr>

	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td class="fieldname"><bean:message key="label.security.local.stock.exchange"/></td>
	    <td><html:radio property="localStockExchange" value="true"/><bean:message key="label.common.yes"/> &nbsp;&nbsp;
	        <html:radio property="localStockExchange" value="false"/><bean:message key="label.common.no"/>
	        <html:hidden property="localStockExchange"/></td>
	    <td class="fieldname"><bean:message key="label.security.index.name"/></td>
	    <td><html:text property="indexName" maxlength="50"/>&nbsp;
	        <html:errors property="indexName"/></td>
	</tr>

	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td class="fieldname"> <bean:message key="label.security.isin.num"/> <span id="spanISINCODE"><span class="mandatory">*</span></span></td>
	    <td><html:text property="isinCode" maxlength="20"/>
	        &nbsp;<html:errors property="isinCode"/></td>
	    <td class="fieldname"><bean:message key="label.security.basel.compliant.unittrust.sec"/></td>
	    <td><html:select property="baselComplaintUT">
	            <option value=""><bean:message key="label.please.select"/> </option>
	            <html:options name="baselCompliantID" labelName="baselCompliantValue"/>
	        </html:select>
	        <html:errors property="baselComplaintUT"/></td>
	</tr>
--%><!--	    <td class="fieldname"><bean:message key="label.stock.code"/></td>
	    <td><html:text property="stockCode" maxlength="20"/>
	        &nbsp;<html:errors property="stockCode"/></td>--><%--

    <%@ include file="../common_portItem_update.jsp" %>
	<%@ include file="../common_exchange_control_update.jsp" %>
	
--%></tbody>
</table>
</td>
</tr>
</tbody>
</table>
<%--
	<%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %>
--%>
<jsp:include page="/collateral/marketablesec/linedetail/list_line_detail.jsp">
	<jsp:param name="editMode" value="true"/>
</jsp:include>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <% if (!isSSC) { %>
                <td width="100" valign="baseline" align="center">
                    <a href="javascript:submitPage(<%=index%>)" onclick="checkNoOfUnit()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                        <img src="img/ok1.gif" name="Image142"  border="0" id="Image142"/></a></td>
                <td width="100" valign="baseline" align="center">
                    <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                        <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
                <% } else { %>
            <td width="100" colspan="2" valign="baseline" align="center">
                <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a>
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
