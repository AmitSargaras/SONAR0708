<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.corpthirdparty.ICorporateThirdParty,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.collateral.guarantees.gtecorp3rd.GteCorp3rdForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gtecorp3rd/GteCorp3rd_update.jsp,v 1.59 2006/11/23 02:52:49 jzhan Exp $
     *
     * Purpose: Update Collateral
     * Description: Type - Guarantee, Subtype -  Corporate - Third Party
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.59 $
     * Date: $Date: 2006/11/23 02:52:49 $
     * Tag: $Name: DEV_20061123_B286V1 $
     */
%>

<%
	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>


<% 
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj");

    ICorporateThirdParty iCol = (ICorporateThirdParty) itrxValue.getStagingCollateral();

    pageContext.setAttribute("obj", iCol);
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    GteCorp3rdForm colForm = (GteCorp3rdForm) request.getAttribute("GteCorp3rdForm");
    String prefix = "Gte";
    String subtype = "GteCorp3rd";
    String formName = subtype + "Form";
    String from_event="prepare_update" ;
	String event = itrxValue.getCollateral()==null ? "create" : "update";
    String formActionName = subtype + "Collateral.do";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.from");
	
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
	String prefix1 = "Gte";
	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

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

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
    <script language="JavaScript" type="text/JavaScript">

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

        function changeValAftMargin() {
            var margin = document.forms[0].margin.value.replace(',', '');
            var valBefMargin = 0;
            if (document.forms[0].valBefMargin.value != null && document.forms[0].valBefMargin.value != "") {
                valBefMargin = parseFloat(document.forms[0].valBefMargin.value.split(',').join(''));
            }
            document.forms[0].valAftMargin.value = Math.round((margin / 100) * valBefMargin);
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
			 var urlc = '/cms/GteCorp3rdCollateral.do?event=refresh_currency&currencyId='+curSel;
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

<html:form action="GteCorp3rdCollateral.do">
<input type="hidden" name="event"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="GteCorp3rd"/>
<input type="hidden" name="subtypeOfCorp" value="GteCorp3rd"/>
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
        <td><h3><bean:message key="label.security.general"/></h3></td>
        <td width="50%" align="right">
            <% if (isDeleting) { %>
                <p class="deletedItem"> DELETED </p>
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
         <td class="fieldname" width="20%"><bean:message key="label.security.guaranters.name"/><span class="mandatoryPerfection"> * </span></td>
			            <td width="30%"><html:textarea property="guarantersName" cols="60" rows="2" onkeypress="return imposeMaxLength(this, 99);"    />
			                <html:errors property="guarantersNameError"/> </td> 
			                <td class="fieldname" width="20%"><bean:message key="label.security.net.worth"/><span class="mandatoryPerfection">*</span></td>
	         	<td width="30%"><html:text property="amtGuarantee" maxlength="50" size="68" styleId="amtGuarantee" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
	                <html:errors property="amtGuarantee"/></td>
			                
        </tr>
           <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	         	
	            
	             <td class="fieldname"><bean:message key="label.security.net.worth.date"/></td>
		          	<td><html:text property="claimDate" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('claimDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="claimDate"/></td> 
						<td class="fieldname"><bean:message key="label.security.address.line1"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			            <td><html:textarea property="addressLine1" cols="55" rows="2" onkeypress="return imposeMaxLength(this, 199);"    />
			                <html:errors property="addressLine1"/> </td> 
						  
	         </tr>	
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
         <td class="fieldname">Asset Statement</td>
				    <td><html:text property="assetStatement" maxlength="25"/>
			                <html:errors property="assetStatement"/>&nbsp;</td>	
			                <td class="fieldname"><bean:message key="label.security.guaranters.duns.no"/></td>
			            <td><html:text property="guarantersDunsNumber" maxlength="25"/>
			                <html:errors property="guarantersDunsNumber"/> </td> 
			                
        </tr>
         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	         <td class="fieldname">Guarantor Type 
			 	 	<span class="mandatoryPerfection"> * </span>&nbsp;</td>
				<td><html:select property="guarantorType">
			    	    <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_GUARANTOR_TYPE%>" descWithCode="false"/>
					</html:select>
					<html:errors property="guarantorType"/>
				</td>
		         <td class="fieldname"><bean:message key="label.security.guaranters.pan"/></td>
			            <td><html:text property="guarantersPam" maxlength="10"/>
			                <html:errors property="guarantersPam"/> </td> 	
	        
	         </tr>
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.guaranters.name.prefix"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			            <td><html:textarea property="guarantersNamePrefix" cols="60" rows="2" onkeypress="return imposeMaxLength(this, 49);"    />
			                <html:errors property="guarantersNamePrefix"/> </td> 
			                
			   <td class="fieldname"><bean:message key="label.security.guaranters.full.name"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			            <td><html:textarea property="guarantersFullName" cols="60" rows="2" onkeypress="return imposeMaxLength(this, 199);"  />
			                <html:errors property="guarantersFullName"/> </td>        
	         </tr>
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">		         
			                
			      <td class="fieldname"><bean:message key="label.security.address.line2"/></td>
			            <td><html:textarea property="addressLine2" cols="55" rows="2" onkeypress="return imposeMaxLength(this, 199);"    />
			                <html:errors property="addressLine2"/> </td> 
			                   <td class="fieldname"><bean:message key="label.security.address.line3"/></td>
			            <td><html:textarea property="addressLine3" cols="55" rows="2" onkeypress="return imposeMaxLength(this, 199);"    />
			                <html:errors property="addressLine3"/> </td>      
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">		         
			      
			      <td class="fieldname"> <bean:message key="label.security.country"/>&nbsp;
	            	<span class="mandatoryPerfection">*</span>&nbsp;</td>          
			      <td><html:select name="GteCorp3rdForm" property="country" onchange="javascript:refreshRegionId(this)">
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="countryList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="country"/> </td> 
	                <td class="fieldname"> <bean:message key="label.security.region"/></td>          
			      	<td><html:select name="GteCorp3rdForm" property="region"  onchange="javascript:refreshStateId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
                  		</html:select>
	                <html:errors property="region"/> </td>  
	                        
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">			 		
			 		
			 		<td class="fieldname"> <bean:message key="label.security.state"/></td>          
			      	<td><html:select name="GteCorp3rdForm" property="state"  onchange="javascript:refreshCityId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="stateList" labelProperty="label" property="value" />
                  		</html:select>
	                <html:errors property="state"/> </td>
	                 <td class="fieldname"> <bean:message key="label.security.city"/></td>          
			      	<td><html:select name="GteCorp3rdForm" property="city"  >
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="cityList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="city"/> </td>
	                
			 </tr> 
			  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	
				
				<td class="fieldname">District</td>
				<td><html:text property="district" maxlength="25"/>
			        <html:errors property="district"/>&nbsp;
			    </td>
				 <td class="fieldname">Pincode</td>
				 <td><html:text property="pinCode" size="10" maxlength="6"/>
			        <html:errors property="pinCode"/>
			         <html:errors property="postcodeError"/>&nbsp;
			     </td>
					
			 </tr>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="fieldname"><bean:message key="label.security.telephone.no"/></td>
			            <td><html:text property="telephoneNumber" maxlength="25"/>
			                <html:errors property="telephoneNumber"/> </td> 
			         <td class="fieldname"><bean:message key="label.security.telephone.area.code"/></td>
			            <td><html:text property="telephoneAreaCode" maxlength="25"/>
			                <html:errors property="telephoneAreaCode"/> </td>        
			               
	         </tr>	
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            
		            
		            <td class="fieldname">
		            
					
		            
		            <span ><bean:message key="label.security.start.guarantee.date"/></span>&nbsp;
		            <%--Start:-------->Abhishek Naik --%>
		             <span class="mandatoryPerfection">*</span>
		            <%--End:-------->Abhishek Naik  --%>
		            </td>
		          	<td><html:text property="dateGuarantee" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('dateGuarantee', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="dateGuarantee"/></td>   
						 <td class="fieldname"><bean:message key="label.security.maturity.date"/></td>
		          	<td><html:text property="collateralMaturityDate" size="15" maxlength="11" readonly="true"/>
						<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
							onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
						<html:errors property="collateralMaturityDate"/></td>
		    </tr>  
		     <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    								
					<td class="fieldname"><bean:message key="label.security.ram.id"/></td>
		            <td><html:text property="ramId" maxlength="25"/>
		                <html:errors property="ramId"/> </td>  
		                  <td class="fieldname">Guarantor Nature 
			 	 	</td>
				<td><html:select property="guarantorNature" >
			    	    <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_GUARANTOR_NATURE%>" descWithCode="false"/>
					</html:select>
					<html:errors property="guarantorNature"/>
				</td>   	
	        </tr>  
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			     <td class="fieldname"> <bean:message key="label.security.charge.type"/>&nbsp;
	             </td>          
			      <td><html:select property="chargeType">
	                    <option value=""><bean:message key="label.please.select"/> </option>
	                    <html:options name="chargeID" labelName="chargeValue"/>
	                </html:select>
	                <html:errors property="chargeType"/> </td>
	                
		         <td class="fieldname"><bean:message key="label.security.rating"/></td>
			            <td><html:text property="rating" maxlength="25"/>
			                <html:errors property="rating"/> </td>
			               
			 </tr>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	 <td class="fieldname"><bean:message key="label.security.recourse" /></td>
					<td><html:radio property="recourse" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>
					<html:radio property="recourse" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio>
						&nbsp;<html:errors property="recourse"/></td>
						 <td class="fieldname"><bean:message key="label.security.holding.period"/></td>
					<td><html:text property="claimPeriod" maxlength="9"/>&nbsp;
						<html:errors property="claimPeriod"/>
						<html:select property="claimPeriodUnit">
							<option value=""><bean:message key="label.please.select"/> </option>
							<html:options name="frequencyProperty" labelName="frequencyLabel"/>
						</html:select>
						<html:errors property="claimPeriodUnit"/></td>				
			 </tr>
			 
			
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname"><bean:message key="label.security.discri.assets"/></td>
	            <td class="fieldname">
	                <html:textarea property="discriptionOfAssets" rows="5" cols="120" style="width:100%" />
	                <html:errors property="discriptionOfAssets"/> </td>
	                <td class="fieldname"><bean:message key="label.security.ref.num.guarantee"/></td>
		            <td><html:text property="guaRefNo" maxlength="25"/>
		                <html:errors property="guaRefNo"/> </td>
	        </tr>
       </tbody>
		</table>
	</td>
</tr>
</tbody>
</table>


<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>
<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>

</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
</body>
</html>
