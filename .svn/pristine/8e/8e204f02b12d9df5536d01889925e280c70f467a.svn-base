<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.banksameccy.IBankSameCurrency,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.collateral.guarantees.gtebanksame.GteBankSameForm, 
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gtebanksame/GteBankSame_update.jsp,v 1.55 2006/11/23 02:52:29 jzhan Exp $
     *
     * Purpose: Update Collateral
     * Description: Type - Guarantee, Subtype - Bank-Same Currency
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.55 $
     * Date: $Date: 2006/11/23 02:52:29 $
     */
%>

<%
	String context = request.getContextPath() + "/";
	
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj");
	
	  IBankSameCurrency iCol = (IBankSameCurrency) itrxValue.getStagingCollateral();
    
    
    pageContext.setAttribute("obj", iCol);
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    

    
    GteBankSameForm colForm = (GteBankSameForm) request.getAttribute("GteBankSameForm");
    String prefix = "Gte";
    String subtype = "GteBankSame";
    String formName = subtype + "Form";
    String from_event="prepare_update" ;
    String formActionName = subtype + "Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.from");
	
	String prefix1 = "Gte";
	List countryList = null;
	List regionList = null;
	List stateList = null;
	List cityList = null;

	countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.countryList");
	regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.regionList");
	stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.stateList");
	cityList = (List) session
	.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.cityList");

	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
	pageContext.setAttribute("hideAudit", "true");
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxCurrencyr.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
	
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
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
            if (num == 9) {
        		document.forms[0].event.value="update_read_valuation_from_los";
    			document.forms[0].indexID.value=index;
    			document.forms[0].from_page.value="prepare_update";
    		}
            document.forms[0].submit();

        }
        
	    function setMandatory(from, val){
	    	if (from == 'sec') {
	    		if (val == '0'||trim(val) == '') {
	    			document.getElementById("securedAmountOriginLabel").style.visibility = "hidden";
	    		}
	    		else {
	    			document.getElementById("securedAmountOriginLabel").style.visibility = "visible";
	    		}
	    	}
	    	else if (from == 'unsec') {
	    		if (val == '0'||trim(val) == '') {
	    			document.getElementById("unsecuredAmountOriginLabel").style.visibility = "hidden";
	    		}
	    		else {
	    			document.getElementById("unsecuredAmountOriginLabel").style.visibility = "visible";
	    		}
	    	}
	    }

	    function refreshCurrency(dropdown)
		{
			
			var cur=document.getElementById('collateralCurrency').value;
			
			 var curSel = "";
			 for(i=0; i<dropdown.options.length; i++)
			 {
				if (dropdown.options[i].selected == true)
				    curSel = dropdown.options[i].value;	
			 }
			
			 var depc = 'exchangeRateINR';
			 var urlc = '/cms/GteBankSameCollateral.do?event=refresh_currency&currencyId='+curSel;
			 sendLoadCurrencyValues(depc, urlc);
			setTimeout("exchangeRateINRCal()",1000);
			setTimeout("calculateLoanableAmount()",1000);
			
			 
			}
	    function exchangeRateINRCal() {
				
			var amountCMV = document.getElementById('amountCMV').value;
			if(amountCMV != null){
				amountCMV = amountCMV.replace(/,/g,'');
				var exchangeRateINR = document.getElementById('exchangeRateINR').value;

				//Phase 3 CR:comma separated
				exchangeRateINR=exchangeRateINR.replace(/,/g,'');
				
				var valExchangeRateCal = exchangeRateINR * amountCMV;
				if(isNaN(valExchangeRateCal))
				{
					document.getElementById('valExchangeRateINRCal').innerHTML = "-";
				}
				else{
					//Phase 3 CR:comma separated
					valExchangeRateCal=formatAmountAsCommaSeparated1(valExchangeRateCal.toFixed(2));
				    
					document.getElementById('valExchangeRateINRCal').innerHTML = valExchangeRateCal;
				}
			}	
		}

	    function calculateLoanableAmount(){
	    	
	    	var cur=document.getElementById('collateralCurrency').value;	
	    	   	
			var amountCMV = document.forms[0].amountCMV.value;
			var margin = document.forms[0].margin.value;
			
			if(margin > 100){
				alert("Please enter value between 1 to 100.");
			}
			else{
				if(amountCMV != null && margin != null){
					var exchangeRateINR = 0;
					var loanableAmt = 0; 
					amountCMV = amountCMV.replace(/,/g,'');
					
					if(cur != "INR") {
						exchangeRateINR = document.getElementById('exchangeRateINR').value;

						//Phase 3 CR:comma separated
						exchangeRateINR=exchangeRateINR.replace(/,/g,'');
						
						loanableAmt = (amountCMV * exchangeRateINR) - ((amountCMV * margin * exchangeRateINR) / 100);				
					}else{
						loanableAmt = amountCMV - (amountCMV * margin)/100;
					}
					if(isNaN(loanableAmt)){
						document.getElementById('valLoanableAmount').innerHTML = "-";
					}else{
						//Phase 3 CR:comma separated
						loanableAmt=formatAmountAsCommaSeparated1(loanableAmt.toFixed(2));
					    
						document.getElementById('valLoanableAmount').innerHTML = loanableAmt;
						//document.forms[0].loanableAmount.value = loanableAmt.toFixed(2);
					}
				}else{
					document.getElementById('valLoanableAmount').innerHTML = "-";
				}
			}		
		}

	    function refreshRegionId(dropdown)
		{
		 var curSel = "";
		 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 if(curSel==""){
				clearDisplayDropdown('state');
				clearDisplayDropdown('city');
		}
		 var dep = 'region';
		 var url = '/cms/GteBankSameCollateral.do?event=refresh_region_id&countryId='+curSel;
		 sendLoadDropdownReq(dep, url);
		}
		function refreshStateId(dropdown)
		{
		 var curSel = "";
		 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 if(curSel==""){
			clearDisplayDropdown('city');
  		 }
		 var dep = 'state';
		 var url = '/cms/GteBankSameCollateral.do?event=refresh_state_id&regionId='+curSel;
		 sendLoadDropdownReq(dep, url);
		}

		function refreshCityId(dropdown)
		{
		 var curSel = "";
		 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 var dep = 'city';
		 var url = '/cms/GteBankSameCollateral.do?event=refresh_city_id&stateId='+curSel;
		 sendLoadDropdownReq(dep, url);
		}

        //-->
    </script>
    
<script language="javascript" type="text/javascript">
function imposeMaxLength(Object, MaxLen)
{
  return (Object.value.length <= MaxLen);
}

</script> 
    
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="GteBankSameCollateral.do">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="subtype" value="GteBankSame"/>
<input type="hidden" name="from_event" value="update"/>
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
        <td><h3>
			<bean:message key="label.security.general"/>
		</h3></td>
        <td width="50%" align="right">
            <% if (isDeleting) { %>
                <p class="deletedItem"> DELETED</p>
            <% } %>
        </td>
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
                <%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
			</tbody>
        </table>
    </td>
</tr>
<%@ include file="/collateral/collateral_general_common_field.jsp" %>
</tbody>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

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
	        			
		            <td class="fieldname"><bean:message key="label.security.holding.period"/></td>
					<td><html:text property="claimPeriod" maxlength="9" />&nbsp;
						<html:errors property="claimPeriod"/>
						<html:select property="claimPeriodUnit">
							<option value=""><bean:message key="label.please.select"/> </option>
							<html:options name="frequencyProperty" labelName="frequencyLabel"/>
						</html:select>
						 <html:errors property="claimPeriodUnit"/>
						
						<html:hidden name="GteBankSameForm" property="claimPeriod" />
				        <html:hidden name="GteBankSameForm" property="claimPeriodUnit" /></td>
						
						<td class="fieldname">&nbsp;
		            	&nbsp;</td>
		            <td></td>
	        	
			</tr>		
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><bean:message key="label.security.ref.num.guarantee"/></td>
		            <td><html:text property="guaRefNo" maxlength="25"/>
		                <html:errors property="guaRefNo"/>
		                <html:hidden name="GteBankSameForm" property="guaRefNo" /> </td>
		            
		            <td class="fieldname">
		          	
		            <span ><bean:message key="label.security.start.guarantee.date"/></span>&nbsp;
		            <%--Start:-------->Abhishek Naik --%>
		          	<%--Necessary Field --%>
		            
		            <span class="mandatoryPerfection">*</span>
		            <%--End:-------->Abhishek Naik--%>
		            </td>
		          	<td><html:text property="dateGuarantee" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('dateGuarantee', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="dateGuarantee"/>
						<html:hidden name="GteBankSameForm" property="dateGuarantee" /></td>    
		    </tr>     
		    
		    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    		<td class="fieldname"><bean:message key="label.security.maturity.date"/></td>
		          	<td><html:text property="collateralMaturityDate" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="collateralMaturityDate"/>
						<html:hidden name="GteBankSameForm" property="collateralMaturityDate" /></td>
						
					<td class="fieldname"><bean:message key="label.security.ram.id"/>
						</td>
		            <td><html:text property="ramId" maxlength="25" />
		                <html:errors property="ramId"/> 
		                <html:hidden name="GteBankSameForm" property="ramId" /></td>      	
	        </tr>
		    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    		<td class="fieldname"><bean:message key="label.security.follow.up.date"/></td>
		          	<td><html:text property="followUpDate" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('followUpDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="followUpDate"/>
						<html:hidden name="GteBankSameForm" property="followUpDate" />
					</td>
					<td class="fieldname">&nbsp;</td>
		            <td>&nbsp;</td> 	
	        </tr>	        
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	         	<td class="fieldname"><bean:message key="label.security.net.worth"/></td>
	         	<td><html:text property="amtGuarantee" maxlength="50" size="68" styleId="amtGuarantee" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
	                <html:errors property="amtGuarantee"/>
	                <html:hidden name="GteBankSameForm" property="amtGuarantee" /></td>
	            
	             <td class="fieldname"><bean:message key="label.security.net.worth.date"/></td>
		          	<td><html:text property="claimDate" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('claimDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="claimDate"/>
						<html:hidden name="GteBankSameForm" property="claimDate" /></td>   
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.telephone.no"/></td>
			            <td><html:text property="telephoneNumber" maxlength="25" />
			                <html:errors property="telephoneNumber"/> 
			                <html:hidden name="GteBankSameForm" property="telephoneNumber" /></td> 
			                
			      <td class="fieldname"><bean:message key="label.security.guaranters.duns.no"/>
			      	</td>
			            <td><html:text property="guarantersDunsNumber" maxlength="25" />
			                <html:errors property="guarantersDunsNumber"/> 
			                <html:hidden name="GteBankSameForm" property="guarantersDunsNumber" /></td>          
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.guaranters.pan"/>
		         	</td>
			            <td><html:text property="guarantersPam" maxlength="10"/>
			                <html:errors property="guarantersPam"/>
			                <html:hidden name="GteBankSameForm" property="guarantersPam" /> </td> 
			                
			      <td class="fieldname"><bean:message key="label.security.guaranters.name"/></td>
			            <td><html:textarea property="guarantersName" cols="60" rows="2" onkeypress="return imposeMaxLength(this, 99);"    />
			                <html:errors property="guarantersNameError"/> 
			                <html:hidden name="GteBankSameForm" property="guarantersName" /></td>          
	         </tr>
	         
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.guaranters.name.prefix"/></td>
			            <td><html:textarea property="guarantersNamePrefix" cols="60" rows="2" onkeypress="return imposeMaxLength(this, 49);"    />
			                <html:errors property="guarantersNamePrefix"/>
			                <html:hidden name="GteBankSameForm" property="guarantersNamePrefix" /> </td> 
			                
			      <td class="fieldname"><bean:message key="label.security.guaranters.full.name"/></td>
			            <td><html:textarea property="guarantersFullName" cols="60" rows="2" onkeypress="return imposeMaxLength(this, 99);"  />
			                <html:errors property="guarantersFullName"/> 
			                <html:hidden name="GteBankSameForm" property="guarantersFullName" /></td>          
	         </tr>
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.address.line1"/></td>
			            <td><html:textarea property="addressLine1" cols="55" rows="2" onkeypress="return imposeMaxLength(this, 199);"    />
			                <html:errors property="addressLine1"/> 
			                <html:hidden name="GteBankSameForm" property="addressLine1" /></td> 
			                
			      <td class="fieldname"><bean:message key="label.security.address.line2"/></td>
			            <td><html:textarea property="addressLine2" cols="55" rows="2" onkeypress="return imposeMaxLength(this, 199);"    />
			                <html:errors property="addressLine2"/> 
			                <html:hidden name="GteBankSameForm" property="addressLine2" /></td>          
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.address.line3"/></td>
			            <td><html:textarea property="addressLine3" cols="55" rows="2" onkeypress="return imposeMaxLength(this, 199);"    />
			                <html:errors property="addressLine3"/> 
			                <html:hidden name="GteBankSameForm" property="addressLine3" /></td>
			      
			      <td class="fieldname"> <bean:message key="label.security.country"/></td>          
			      <td><html:select name="GteBankSameForm" property="country" onchange="javascript:refreshRegionId(this)">
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="countryList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="country"/> 
	                <html:hidden name="GteBankSameForm" property="country" /></td>           
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 		<td class="fieldname"> <bean:message key="label.security.region"/></td> 
			 		         
			      	<td>
                  		<html:select name="GteBankSameForm" property="region"  onchange="javascript:refreshStateId(this)" >
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
                  		</html:select>
	                <html:errors property="region"/>
	                <html:hidden name="GteBankSameForm" property="region" /> </td>
	                
			 		
			 		<td class="fieldname"> <bean:message key="label.security.state"/></td>          
			      	<td><html:select name="GteBankSameForm" property="state"  onchange="javascript:refreshCityId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="stateList" labelProperty="label" property="value" />
                  		</html:select>
	                <html:errors property="state"/>
	                <html:hidden name="GteBankSameForm" property="state" /> </td>
	                
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	 <td class="fieldname"> <bean:message key="label.security.city"/></td>          
			      	<td><html:select name="GteBankSameForm" property="city"  >
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="cityList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="city"/> 
	                <html:hidden name="GteBankSameForm" property="city" /></td>
	                
		         <td class="fieldname"><bean:message key="label.security.telephone.area.code"/></td>
			            <td><html:text property="telephoneAreaCode" maxlength="25" />
			                <html:errors property="telephoneAreaCode"/> 
			                <html:hidden name="GteBankSameForm" property="telephoneAreaCode" /></td>
			      
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			     <td class="fieldname"> <bean:message key="label.security.charge.type"/>&nbsp;
	            	</td>          
			      <td><html:select property="chargeType">
	                    <option value=""><bean:message key="label.please.select"/> </option>
	                    <html:options name="chargeID" labelName="chargeValue"/>
	                </html:select>
	                <html:errors property="chargeType"/>
	                <html:hidden name="GteBankSameForm" property="chargeType" /> </td>
	                
		         <td class="fieldname"><bean:message key="label.security.rating"/>
		         	</td>
			            <td><html:text property="rating" maxlength="25"/>
			                <html:errors property="rating"/> 
			                <html:hidden name="GteBankSameForm" property="rating" /></td>
			               
			 </tr>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	 <td class="fieldname"><bean:message key="label.security.recourse" />
			 	 	</td>
					<td><html:radio property="recourse" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>
					<html:radio property="recourse" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio>&nbsp;&nbsp;&nbsp;<html:errors property="recourse"/></td>
				 <td class="fieldname">Asset Statement</td>
				    <td><html:text property="assetStatement" maxlength="25"/>
				    <html:hidden name="GteBankSameForm" property="assetStatement" />
			                <html:errors property="assetStatement"/>&nbsp;</td>	
			 </tr>
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	<td class="fieldname">Guarantor Type 
			 	 	</td>
				<td><html:select property="guarantorType">
			    	    <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_GUARANTOR_TYPE%>" descWithCode="false"/>
					</html:select>
					<html:hidden name="GteBankSameForm" property="guarantorType" />
					<html:errors property="guarantorType"/>
				</td>
				
				<td class="fieldname">District</td>
				<td><html:text property="district" maxlength="25"/>
				<html:hidden name="GteBankSameForm" property="district" />
			        <html:errors property="district"/>&nbsp;
			    </td>
				
					
			 </tr>
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	 <td class="fieldname">Pincode</td>
				 <td><html:text property="pinCode" size="10" maxlength="6" />
			        <html:errors property="pinCode"/>
			        <html:hidden name="GteBankSameForm" property="pinCode" />
			        <html:errors property="postcodeError"/>&nbsp;
			     </td>
			 
			 	 <td class="fieldname">Guarantor Nature 
			 	 	</td>
				<td><html:select property="guarantorNature" >
			    	    <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_GUARANTOR_NATURE%>" descWithCode="false"   />
					</html:select>
					<html:hidden name="GteBankSameForm" property="guarantorNature" />
					<html:errors property="guarantorNature"/>
				</td>
			 </tr>
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname"><bean:message key="label.security.discri.assets"/></td>
	            <td colspan="3">
	                <html:textarea property="discriptionOfAssets" rows="5" cols="120" style="width:100%" />
	                <html:hidden name="GteBankSameForm" property="discriptionOfAssets" />
	                <html:errors property="discriptionOfAssets"/> </td>
	        </tr>
	              
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>
<br>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>
<jsp:include page="/collateral/guarantees/linedetail/list_line_detail.jsp">
	<jsp:param name="editMode" value="true"/>
</jsp:include>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<tr>
		<td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
	</tr>	
	<%@ include file="/collateral/common/view_audit_details.jsp"%> 		
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>

</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
</body>
</html>
