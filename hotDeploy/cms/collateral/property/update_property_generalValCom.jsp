<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,                 
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.IAgricultural,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral,
				 com.integrosys.cms.ui.collateral.property.PropertyForm,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.collateral.property.RankList,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.property.propagri.PropAgriForm,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
				 java.util.ArrayList,
                 java.util.Collection,
				 java.util.Iterator,
				 java.util.List"%>				 

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%  
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj");
	PropertyForm pForm=(PropertyForm)request.getAttribute("PropertyForm");
	
	IPropertyCollateral iCol = (IPropertyCollateral) itrxValue.getStagingCollateral();	
	IPropertyCollateral iCol2 = (IPropertyCollateral) itrxValue.getCollateral();
	
    pageContext.setAttribute("obj", iCol);

    List bankList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.bankList");
    pageContext.setAttribute("bankList", bankList);
    
	int rowIdx= Integer.parseInt(request.getParameter("rowIdxInteger")); 
	String isProcessStr = request.getParameter("isProcess");
	boolean isProcess = isProcessStr.equals("true");
	String subtype = request.getParameter("subtype");
	String formName = subtype+"Form";

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String prefix = "Property"; 
	String formActionName = subtype+"Collateral.do";
	PropertyForm colForm = (PropertyForm) request.getAttribute(formName);
	
	String event = (String) request.getAttribute("event");
	
    ITeam team = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    //boolean isSSC = (team.getTeamType().getBusinessCode().equals("SSC"));
    boolean isSSC = false;
    
    boolean masterTitleIsNull = false;
    if(colForm.getMasterTitle()==null||colForm.getMasterTitle().equals("")){
    	masterTitleIsNull = true;
    }
    

	
	String cersaiApplicableInd_general =(String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cersaiApplicableInd");
	List preMortgageCreationList = null;
	preMortgageCreationList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.preMortgageCreationList");
	if(preMortgageCreationList == null)
		preMortgageCreationList=new ArrayList();
	pageContext.setAttribute("preMortgageCreationList",preMortgageCreationList);
	System.out.println("cersaiApplicableInd_general:"+cersaiApplicableInd_general+" iCol.getMortgageCreationAdd():"+iCol.getMortgageCreationAdd()+" iCol2.getMortgageCreationAdd():"+iCol2.getMortgageCreationAdd());
	//String mortgageCreationAddFlag=iCol.getMortgageCreationAdd();
	
	//Santosh propertyTypeLabels
	//System.out.println("######"+iCol.getTotalPropertyAmount().getAmount());
%>

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/emulation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script type="text/javascript" src="js/validation.js"></script>
  <script type="text/javascript" src="js/ajaxListPreMortgage.js"></script>
<script>

	function refreshDropDown(dropdown){
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;	
			}
		}	
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?locationState='+currVal+'&code=DISTRICT&ref='+currVal+'&desc=true';
		sendLoadDropdownReq('locationDistrict', url);
		
		url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?locationState='+currVal+'&code=MUKIM&ref='+currVal+'&desc=true';
		sendLoadDropdownReq2('locationMukim', url);
	}
	
	function refreshMukim(dropdown){
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;	
			}
		}	
		var dep = "";
		var url = "";
		dep ='locationMukim';
		url = '<%=formActionName%>'+'?event=refresh_dropdown&dropdown_name=locationMukimColl&locationState='+currVal+'&desc=true'; 
		sendLoadDropdownReq(dep, url);	
	}
	
	function refreshDevName(dropdown){	
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;	
			}
		}	
		var dep = 'developerName_v1';
	<%--
		var url = '<%=formActionName%>'+'?event=refresh_dropdown&dropdown_name=developerName_v1Coll&developerNameIDX='+currVal;
	--%>	
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=developerName_v1Coll&developerNameIDX='+currVal+'&code=DEVELOPER_CODE'+'&initial='+currVal+'&desc=true';

		//alert(url);
		sendLoadDropdownReq(dep, url);	
	}
	
     function getRemainPeriod(cal, date) {
        cal.sel.value = date;
        calculate_date();
     }

     function calculate_date() {
        baseDate = document.forms[0].collateralMaturityDate.value;
		if (baseDate == null || baseDate == '' || baseDate == ' ') {
			//alert('collateralMaturityDate is empty');
			document.getElementById("remainTenureYear").value = '';
			return;
		}
		else {
			currentTenureYear = document.forms[0].tenureYear.value;
			if (currentTenureYear == null || currentTenureYear == '' || currentTenureYear == ' ') {
				if (document.getElementById("tenureStyleID").value != 'F')
					alert('Security maturity date has a value, please ensure the number of year(s) for Tenure is entered to match it');
			}
		}

      	currentDate = new Date();
      	base = new Date();
      	base.setFullYear(baseDate.substring(7,11));
      	base.setMonth(months[baseDate.substring(3,6)]);
      	base.setDate(baseDate.substring(0,2));
         numOfDays = 0;

         var str2 = document.getElementById("tenureStyleID").value;
         if(str2=='F'){
         	document.getElementById('remainTenureYear').value = '';
         	return;
         }

         if (base.getTime() <= currentDate.getTime()) {
             document.forms[0].remainTenureYear.value = 0;
 /*            document.forms[0].remainTenureMonth.value = 0;
             document.forms[0].remainTenureDay.value = 0;*/
             return;
         }

        var yc = currentDate.getFullYear();
        var mc = currentDate.getMonth() + 1;
        var dc = currentDate.getDate();

        var yb = base.getFullYear();
        var mb = base.getMonth() + 1;
        var db = base.getDate();
 	   var ml = 0;
        // Month length 0->use calendar length

        var ma=0;
        var ya=0;

        var da = db-dc;
        // This is the all-important day borrowing code.
        if(da < 0) {
             mb--;
        // Borrow months from the year if necesssary.
             if(mb < 1) {
 	            yb--;
 	            mb = mb + 12;
 		    }
     	    da = da + 30;
        }

        ma = mb - mc;
        // Month borrowing code - borrows months from years.
        if(ma < 0) {
             yb--;
 	        ma = ma + 12;
        }
        ya = yb - yc;

        document.forms[0].remainTenureYear.value = ya;
 /*       document.forms[0].remainTenureMonth.value = ma;
        document.forms[0].remainTenureDay.value = da;*/
        return;
     }

	function setTenurePManFlag1(dropdown)	{
		var str= dropdown.options[dropdown.selectedIndex].value ;
		var TYPE_LEASEHOLD= '<%=ICMSUIConstant.PROPERTY_TENURE_LEASEHOLD%>' ;
		getlag(str);
		setreMainTenureYearBlank(str);
		
        if ( str==TYPE_LEASEHOLD) {
           document.forms[0].tenureYear.disabled = false;
           document.forms[0].tenureYear.value = "<%=colForm.getTenureYear()%>" ;
           document.getElementById("mandPerfMaturityDate").style.visibility = "visible";
        }else{
           document.forms[0].tenureYear.value="";
           document.forms[0].tenureYear.disabled = true;
           document.getElementById("mandPerfMaturityDate").style.visibility = "hidden";
        }

		if(dropdown.selectedIndex==0){
			document.getElementById("span_tenure_period").style.visibility = "hidden";
		}else if ('FR'==dropdown.options[dropdown.selectedIndex].value){
		    document.getElementById("span_tenure_period").style.visibility = "hidden";
		}else {
		    document.getElementById("span_tenure_period").style.visibility = "visible";
		}

		//need to ensure itgUtilities.js is included
		checkForSecurityMaturityDate();

	}

	function getlag(str){
// 	alert(str);
		if(str=='L'){
			document.getElementById("redAsterisk").style.visibility='hidden';
			document.getElementById("blueAsterisk").style.visibility='visible';
		}else{
			document.getElementById("redAsterisk").style.visibility='visible';
			document.getElementById("blueAsterisk").style.visibility='hidden';
		}
	}
	
	function getlag1(){
		var str = document.getElementById("propertyCompletionStatus_v1ID").value;
		if(str=='N'){
			document.getElementById("mandatoryCompStage").style.visibility='visible';
		}else{
			document.getElementById("mandatoryCompStage").style.visibility='hidden';
		}
		
		if(str=="C"||str=="F"){
			document.getElementById("builtupArea_v1MandatoryID").style.visibility='visible';
		}else{
			document.getElementById("builtupArea_v1MandatoryID").style.visibility='hidden';
		}
	}

	function trim(str, chars) {
	    return ltrim(rtrim(str, chars), chars);
	}

	function ltrim(str, chars) {
	    chars = chars || "\\s";
	    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
	}

	function rtrim(str, chars) {
	    chars = chars || "\\s";
	    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
	}
	
	function phaseNoMandatory(){
		var phaseNo = document.getElementById("projectNameID").value;
		if(phaseNo!=null&&!(trim(phaseNo,' ').length==0)){
			document.getElementById("phaseNoID").style.visibility = "visible";
		  }else{
			  document.getElementById("phaseNoID").style.visibility = "hidden";
		  }
	}

	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	}

	function setMasterTitleNoVisibility(elementID){
		var str = document.getElementById("titleTypeID").value;
		if(str!='M' && !(trim(str,' ').length==0) && str!=null){
            document.getElementById(elementID).style.visibility = "visible";
		}else{
            document.getElementById(elementID).style.visibility = "hidden";
		}
	}

	function checkYear(){
		var yesrs = document.getElementById("remainTenureYear").value;
		
		if(false){
		}
	}
	
	function setreMainTenureYearBlank(str){
		if(str=="F"){
			document.getElementById("remainTenureYear").value = '';
		}
		else{
			calculate_date();
		}
	}	 

    function switchMasterTitleNo(){
        if (document.forms[0].masterTitle[0].checked){
            document.getElementById("masterTitleNo").value = "";
            document.getElementById("masterTitleNo").disabled = true;
	    }else{
            document.getElementById("masterTitleNo").disabled = false;
	    }
    }



</script>
<!--Code Start-->

	<!--Code present here is in file D:\SmartLender Documents\Security Properies\property Code.txt -->
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="title.property.information"/></h3></td>
   </tr>        
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<input type="hidden" name="isSSC" value="<%=String.valueOf(isSSC)%>"/>
		      <%if(subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
				|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN)){ %>
			<input type="hidden" name="builtupArea_v1Mandatory" id="builtupArea_v1MandatoryID" />
			<%} %>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">			
			<td class="fieldname">
			  	Property Id</td>
			<td><html:text property="propertyId"></html:text>
				<html:errors property="propertyId"/></td>
				
			<td class="fieldname">Borrower's Name <span class="mandatoryPerfection"> * </span></td>
			<td colspan="3"><html:text property="description" size="65" maxlength="40" /><html:errors property="description"/></td>
		</tr>	
			
			
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">			
			<td class="fieldname">
			  	<bean:message key="label.security.property.type"/><span class="mandatoryPerfection">*</span></td>
			<td><html:select property="propertyType" onchange="selectedPropertyType(this)" styleId="propertyType">
					<option value=""><bean:message key="label.please.select"/></option>
					<html:options name="propTypeValue" labelName="propTypeLabel"/>
				</html:select>
				<html:errors property="propertyType"/>
			</td>
				
				<td class="fieldname">
				<bean:message key="label.security.property.property.usage"/></td>
			<td><html:select property="propertyUsage" >	
					<option value=""><bean:message key="label.please.select"/> </option>		
					<html:options name="propertyUsageValue" labelName="propertyUsageLabel"/>
				</html:select>&nbsp;
				<html:errors property="propertyUsage"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.sale.purchage.agree.val"/><span class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	        		<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
	        			<td style="border:none">
	        				<html:text property="salePurchareAmount" styleClass="salePurchareAmount_InNum" styleId="salePurchareAmount" 
	        				onchange="dispAmtInWords(this)" onblur="javascript:formatAmountAsCommaSeparated(this)"/> 
	        			</td>
	        			<td style="border:none">
							<textarea id="salePurchareAmount_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
	        			</td>
					</tr>
				</table>
				<html:errors property="salePurchareAmount"/>
			</td>
			<td class="fieldname"><bean:message key="label.security.property.dateof.receipt.title.deed"/></td>
			<td><html:text property="dateOfReceiptTitleDeed" styleId="dateOfReceiptTitleDeed" readonly="true"  />
				<img src="img/calendara.gif"  name="Image11" border="0" id="Image1" 
                onclick="return showCalendar('dateOfReceiptTitleDeed', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                
				</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.previous.mortgage.creation.date"/></td>
			<td><html:select name="PropCommGeneralForm" property="previousMortCreationDate" styleId="previousMortCreationDate" onchange="refreshPreMortgage(this)">
			<option value=""><bean:message key="label.please.select"/> </option>	
			<html:options collection="preMortgageCreationList" labelProperty="label" property="label" />
			</html:select>
				</td>
			<td class="fieldname">
				Mortgage Creation /Extension date	</td>
			<td><html:text property="salePurchaseDate" styleId="salePurchaseDate" onchange="checkIfLegalAuditDateReq();"  readonly="true"  />
			<img src="img/calendara.gif"  name="Image11" border="0" id="Image1MortgageCreation" 
                onclick="return showCalendar('salePurchaseDate', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />  
		
               &nbsp; <input class="btnNormal" type="button" name="mortgageCreDate" value="Add" onclick="javascript:addMortgageCreation()"/>
	            <html:hidden property="mortgageCreationAdd" styleId="mortgageCreationAdd" />
	            <html:hidden property="salePurchaseDate_" styleId="salePurchaseDate_"/>
				<html:errors property="salePurchaseDate"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.legal.audit.date"/>
				&nbsp;<span id ="legalAuditDateReq" style="display:none;" class="mandatoryPerfection"> * </span></td>
			<td><html:text property="legalAuditDate" styleId="legalAuditDate" readonly="true"  />
			<img src="img/calendara.gif"  name="Image11" border="0" id="Image1LegalAuditDate" 
                onclick="return showCalendar('legalAuditDate', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                  	<html:errors property="legalAuditDate"/>
				</td>
			<td class="fieldname"><bean:message key="label.security.property.intervening.period.search.date"/></td>
			<td><html:text property="interveingPeriSearchDate"  styleId="interveingPeriSearchDate" readonly="true"  />
			<img src="img/calendara.gif"  name="Image11" border="0" id="Image1IntervPeriSearchdate" 
                onclick="return showCalendar('interveingPeriSearchDate', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                 <html:errors property="interveingPeriSearchDate"/>
				</td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Type of Mortage <span class="mandatoryPerfection"> * </span></td>
			<td>
			<html:select property="typeOfMargage" styleId="typeOfMargage" onchange="setPhysInsp(this)">
	                <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_MORTGAGE_TYPE%>" descWithCode="false"/>
				</html:select>
				<html:errors property="typeOfMargage"/></td>
			<td class="fieldname">Document Received </td>
			<td><html:select property="documentReceived" onchange="getlag1()" styleId="propertyCompletionStatus_v1ID" >
					<option value=""><bean:message key="label.please.select"/> </option>
					<html:options name="propertyCompletionStatusValue" labelName="propertyCompletionStatusLabel"/>
				</html:select>&nbsp;
		        &nbsp;<html:errors property="documentReceived"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Mortage Created By <span class="mandatoryPerfection"> * </span></td>
			<td><html:select name="PropCommGeneralForm" property="morgageCreatedBy">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="bankList" labelProperty="label" property="value" />
              	</html:select>
				<html:errors property="morgageCreatedBy"/></td>
				<td class="fieldname">Bin Number</td>
			<td><html:text property="binNumber"/>
				<html:errors property="binNumber"/></td>	
		
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Document Block </td>
			<td><html:checkbox property="documentBlock"/>
				<html:errors property="documentBlock"/></td>
		
<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013-->
			<td class="fieldname">Prior Claim <span class="mandatoryPerfection"> * </span></td>
			<td>
			<%System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>colForm.getClaim()>>>>>>>"+colForm.getClaim()); %>
			<%if(colForm.getClaim().equalsIgnoreCase("Y")){ %>
			<input type="radio" name="claim" value="Y" onclick="document.getElementById('claimType').disabled=false" checked="checked">Yes</input>
			<input type="radio" name="claim" value="N" onclick="document.getElementById('claimType').disabled=true" >No</input>
			<%}else if(colForm.getClaim().equalsIgnoreCase("N")){ %>
			<input type="radio" name="claim" value="Y" onclick="document.getElementById('claimType').disabled=false">Yes</input>
			<input type="radio" name="claim" value="N" onclick="document.getElementById('claimType').disabled=true" checked="checked">No</input>
			<%}else{ %>
			<input type="radio" name="claim" value="Y" onclick="document.getElementById('claimType').disabled=false" checked="checked">Yes</input>
			<input type="radio" name="claim" value="N" onclick="document.getElementById('claimType').disabled=true" >No</input>
			<%} %>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Type Of Claim <span class="mandatoryPerfection"> * </span></b>
			<%if(colForm.getClaim().equalsIgnoreCase("Y")){ %>
			<html:select property="claimType" styleId="claimType" >
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.TYPE_OF_CLAIM%>"
									descWithCode="false" />
			        </html:select>&nbsp;
			        <%}else if(colForm.getClaim().equalsIgnoreCase("N")){ %>
			        <html:select property="claimType" styleId="claimType" disabled="true">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.TYPE_OF_CLAIM%>"
									descWithCode="false" />
			        </html:select>&nbsp;
			        <%}else{ %>
			        <html:select property="claimType" styleId="claimType">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.TYPE_OF_CLAIM%>"
									descWithCode="false" />
			        </html:select>&nbsp;
			        <%} %>
        <html:errors property="claimType"/>
			</td>
	<!--End by Pramod Katkar-->		
		</tr>
		
		
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Mortgage registered reference</td>
			<td colspan="3"><html:textarea property="mortageRegisteredRef"  rows="5" cols="120" style="width:100%" />
				<br />
				<html:errors property="mortageRegisteredRef"/>
			</td>
		</tr>	
				
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">Advocate/ Lawyer Name&nbsp;<span class="mandatoryPerfection">*</span></td>
			<td>
             	<html:select property="advocateLawyerName" >
              	<integro:common-code
                  		categoryCode="<%=CategoryCodeConstant.HDFC_ADV_NAME%>" descWithCode="false"/>
              </html:select>
                 <html:errors property="advocateLawyerName"/></td>
	
	    <td class="fieldname">
				<bean:message key="label.security.property.dev.occu.name.dtls"/> <span class="mandatoryPerfection"> * </span></td>
			<td>
			<html:text property="devGrpCo" size="65"></html:text>
				<html:errors property="devGrpCo"/> 
			</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.prj.name"/></td>
			<td><html:select property="projectName" styleId="projectNameID" onchange="phaseNoMandatory()">
                    <integro:common-code categoryCode="<%=CategoryCodeConstant.VEHICLE_DEALER %>"/>
				</html:select>
				<html:errors property="projectName"/> </td>
			
			<td class="fieldname">
				<bean:message key="label.security.property.title.lot.no"/>
				&nbsp;</td>
			<td>
			<html:select property="lotNumberPrefix">
                    <integro:common-code categoryCode="LOT_NO"/>                            
                </html:select>
                <html:errors property="lotNumberPrefix" />
			<html:text property="lotNo" maxlength="50" />
			<html:errors property="lotNo" />&nbsp;</td>
						
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Property Lot Location</td>
			<td><html:text property="propertyLotLocation" size="65" />&nbsp;
				<br /><html:errors property="propertyLotLocation"/>
			</td>
						
		    <td class="fieldname">Other City</td>
			<td ><html:text property="otherCity" size="65"/>
				<br /><html:errors property="otherCity"/>
			</td>
		</tr>
		

		 	
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				 Property Address 1 <span class="mandatoryPerfection"> * </span>
				</td>
			<td ><html:text property="propertyAddress" size="65" maxlength="100"/>&nbsp;
		                <html:errors property="propertyAddress"/>&nbsp;</td>
		    
		    <td class="fieldname">
				 Property Address 2
				</td>
			<td ><html:text property="propertyAddress2" size="65" maxlength="100"/>&nbsp;
		                <html:errors property="propertyAddress2"/>&nbsp;</td>            
		</tr>	
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				 Property Address 3
				</td>
			<td ><html:text property="propertyAddress3" size="65" maxlength="100"/>&nbsp;
		                <html:errors property="propertyAddress3"/>&nbsp;</td>
		    
		    <td class="fieldname">
				 Property Address 4
				</td>
			<td ><html:text property="propertyAddress4" size="65" maxlength="100"/>&nbsp;
		                <html:errors property="propertyAddress4"/>&nbsp;</td>            
		</tr>	
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				 Property Address 5
				</td>
			<td ><html:text property="propertyAddress5" size="65" maxlength="100"/>&nbsp;
		                <html:errors property="propertyAddress5"/>&nbsp;</td>
		    
		    <td class="fieldname">
				 Property Address 6
				</td>
			<td ><html:text property="propertyAddress6" size="65" maxlength="100"/>&nbsp;
		                <html:errors property="propertyAddress6"/>&nbsp;</td>            
		</tr>		


		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Property Description <span class="mandatoryPerfection"> * </span></td>
			<td ><html:text property="description" size="65" maxlength="40" /><html:errors property="description"/></td>
		</tr>
		
		<%@ include file="/collateral/property/update_property_Additional_Doc_Facility_det.jsp" %>
		
		
		</table>
	</td></tr>
	</tbody>
	<html:hidden  property="claimType" styleId="claimType"/>
	<html:hidden  property="propertyTypeLabel" styleId="propertyTypeLabel"/>
	<html:hidden  property="collateralIdProp" styleId="collateralIdProp" value="<%=String.valueOf(iCol.getCollateralID())%>"/>
	<input type="hidden" id="collateralId" value = "<%=String.valueOf(iCol2.getCollateralID())%>">
</table>

<!--Code End-->
<script>
	//Start Santosh
	var el = document.getElementById('propertyType');
	var text = el.options[el.selectedIndex].innerHTML;
   	isMandatory(text);
   	document.getElementById("propertyTypeLabel").value=text;
   	
	function selectedPropertyType(dropdown) {
		var choice = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				choice = dropdown.options[i].text;	
			}
		}	
		isMandatory(choice);
		document.getElementById("propertyTypeLabel").value=choice;
	}
	
	function isMandatory(choice)
	{
		
		 if(choice.indexOf("LAND")!=-1) {
				document.getElementById("mandatorylandValue_v1").style.display='';
				document.getElementById("mandatoryBuildingValue_v1").style.display='none';
				document.getElementById("mandatoryReconstructionValueOfTheBuilding_v1").style.display='none';
			}
			else {
				document.getElementById("mandatorylandValue_v1").style.display='none';
				document.getElementById("mandatoryBuildingValue_v1").style.display='';
				document.getElementById("mandatoryReconstructionValueOfTheBuilding_v1").style.display='';
			}
	} 
	
	

	
	//End santosh
	
	if(<%=masterTitleIsNull%>){
	   document.forms[0].masterTitle[2].checked = true;
	}
	  phaseNoMandatory();    
	  if (document.forms[0].stdQuitRent[0].checked){
	     setVisibility('quitRentAmountID','visible');
	  }else{
		  setVisibility('quitRentAmountID','hidden');
		  }
	  if (document.forms[0].assessment[0].checked){
		     setVisibility('assessmentRateID','visible');
		  }else{
			  setVisibility('assessmentRateID','hidden');
			  }
	  if (document.forms[0].masterTitle[1].checked){
		     setVisibility('masterTitleNoID','visible');
	    }else{
	        setVisibility('masterTitleNoID','hidden');
	    }

        switchMasterTitleNo();
	//  setMasterTitleNoVisibility('masterTitleNoID');
	  getlag(document.getElementById('tenureStyleID').value);
	  getlag1();
	  setreMainTenureYearBlank(document.getElementById('tenureStyleID').value);

	
	  
</script>
<script language="Javascript" type="text/javascript">
 
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }
        
		function checkIfLegalAuditDateReq(){
			var salePurchaseDate = document.getElementById('salePurchaseDate');
			var salePurchaseDate_ = document.getElementById('salePurchaseDate_');
			if(salePurchaseDate && salePurchaseDate.value && salePurchaseDate_ && salePurchaseDate_.value
					&& salePurchaseDate.value != salePurchaseDate_.value){
				todaysDate = new Date();
				todaysDate.setHours(0,0,0,0);
				salePurchaseDate_ = new Date(salePurchaseDate_.value);
				var duration = (todaysDate.getTime() - salePurchaseDate_.getTime()) / (1000 * 60 * 60 * 24 * 365);
				if(duration > 3){
					document.getElementById('legalAuditDateReq').style = null;
				}else {
					document.getElementById('legalAuditDateReq').style.display = 'none';
				}
			}
		}
    	function addMortgageCreation()
    	{
    		 
    		//alert("salePurchareAmount");
    		document.getElementById("mortgageCreationAdd").value="true";
    		
    		 document.getElementById("salePurchareAmount").value ='';
    		//alert("2");
    		document.getElementById("legalAuditDate").value ='';
    		document.getElementById("interveingPeriSearchDate").value ='';
    		document.getElementById("typeOfMargage").value ='';
    	
    		/*alert("cersaiTransactionRefNumber:"+document.getElementById("cersaiTransactionRefNumber"));
    		alert("cersaiTransactionRefNumber:"+document.getElementById("cersaiTransactionRefNumber").value);
    		document.getElementById("Image1MortgageCreation").disabled =false; */
    	 	document.getElementById("salePurchareAmount").disabled =false;
    	
    	//	document.getElementById("Image1LegalAuditDate").setAttribute('disabled', '');
    	
    	//	document.getElementById("Image1IntervPeriSearchdate").setAttribute('disabled', '');
    	
    		document.getElementById("Image1LegalAuditDate").disabled =false;
    		document.getElementById("Image1IntervPeriSearchdate").disabled =false; 
    		document.getElementById("typeOfMargage").disabled =false; 
    		<% if(ICMSConstant.YES.equals(cersaiApplicableInd_general)){%>
    		document.getElementById("dateOfCersaiRegisteration").value ='';
    		document.getElementById("cersaiId").value ='';
      		document.getElementById("cersaiTransactionRefNumber").value ='';
      		
      		//document.getElementById("dateOfCersaiRegisterationImg").setAttribute('disabled', '');
    		document.getElementById("dateOfCersaiRegisterationImg").disabled =false;
    		document.getElementById("cersaiId").disabled =false;
    		document.getElementById("cersaiTransactionRefNumber").disabled =false; 
    		<%}%>
    		document.getElementById("salePurchareAmount_InWords").value ='';
    		
   	} 
    
     	function refreshPreMortgage(dropdown)
    	{
     	
    	 var curSel = "";
    	 for(i=0; i<dropdown.options.length; i++)
    	 {
    		if (dropdown.options[i].selected == true)
    		{
    		    curSel = dropdown.options[i].value;	
    		}    	
    	 }
    	 if(curSel == "") return;
    	 var collateralid=document.getElementById("collateralId").value;
    	// alert("collateralid:"+collateralid);
         var dep = 'legalAuditDate';
      	 var url = '/cms/PropCommGeneralCollateral.do?event=refreshPreMortgage&preMortgageDate='+curSel+'&collateralID='+collateralid;
    	 sendLoadListPrevMortReq(dep, url); 

    //	document.getElementById("Image1MortgageCreation").disabled =false;
    	 document.getElementById("mortgageCreationAdd").value="preMortDdTrue";
 	 	document.getElementById("salePurchareAmount").disabled =true;
 		 document.getElementById("Image1LegalAuditDate").disabled =true;
 		document.getElementById("Image1IntervPeriSearchdate").disabled =true; 
 		/*  document.getElementById("Image1LegalAuditDate").setAttribute('disabled', 'true');
 		document.getElementById("Image1IntervPeriSearchdate").setAttribute('disabled', 'true'); */
 		document.getElementById("typeOfMargage").disabled =true; 
 		<% if(ICMSConstant.YES.equals(cersaiApplicableInd_general)){%>
 		 	document.getElementById("dateOfCersaiRegisterationImg").disabled =true;
 			document.getElementById("cersaiId").disabled =true;
 			document.getElementById("cersaiTransactionRefNumber").disabled =true; 
 		<%}%>
 		setTimeout(refreshSalePurAmt, 1000);
 		} 
     	
     	function refreshSalePurAmt(){
     		//alert("calling refreshSalePurAmt");
     		var salePurchaseAmt=document.getElementById("salePurchareAmount").value;
     		//alert(salePurchaseAmt);
     		dispAmtInWords(document.getElementById("salePurchareAmount"));
     		//alert("completed refreshSalePurAmt");
     		
     	}
     	checkIfLegalAuditDateReq();
    	/* window.onload = function(){
    		alert("mortgageCreationAdd 1:"+document.getElementById("mortgageCreationAdd").value);
    		alert("typeOfMortgage:");
    	} */
    </script>

