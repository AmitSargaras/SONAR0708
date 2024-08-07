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
    
    List countryList = null;
	List regionList = null;
	List stateList = null;
	List cityList = null;
	List valuationAgencyList = null;
	
	countryList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryList");
	regionList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionList");
	stateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateList");
	cityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityList");
	
	valuationAgencyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.valuationAgencyList");

	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
	pageContext.setAttribute("valuationAgencyList",valuationAgencyList);
	
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
		var dep = 'developerName';
	<%--
		var url = '<%=formActionName%>'+'?event=refresh_dropdown&dropdown_name=developerNameColl&developerNameIDX='+currVal;
	--%>	
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=developerNameColl&developerNameIDX='+currVal+'&code=DEVELOPER_CODE'+'&initial='+currVal+'&desc=true';

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
		var str = document.getElementById("propertyCompletionStatusID").value;
		if(str=='N'){
			document.getElementById("mandatoryCompStage").style.visibility='visible';
		}else{
			document.getElementById("mandatoryCompStage").style.visibility='hidden';
		}
		
		if(str=="C"||str=="F"){
			document.getElementById("builtUpAreaMandatoryID").style.visibility='visible';
		}else{
			document.getElementById("builtUpAreaMandatoryID").style.visibility='hidden';
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
			clearDisplayDropdown('locationState');
			clearDisplayDropdown('nearestCity');
	}
	 var dep = 'region';
	 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_region_id&countryId='+curSel;
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
		clearDisplayDropdown('nearestCity');
	 }
	 var dep = 'locationState';
	 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_state_id&regionId='+curSel;
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
	 var dep = 'nearestCity';
	 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_city_id&stateId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}

	function calNextDate2(){
    	var frequency=document.getElementById("commonRevalFreq").value;
    	var day=document.forms[0].valuationDate.value;
	
		if(frequency==''){
			document.getElementById('nextValDate').value ='';
		}
		else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
			&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
		
		 document.getElementById('nextValDate').value = day;
		}
		else{
			
			
    	if(isNaN(day)){
    		
    	
    	var udate_month = day.substring(3,6);  
    	
    	 switch(udate_month)
   		 {
   		 case 'Jan':
   			 udate_month='00';
   			
                break;
   		 case 'Feb':
   			 udate_month='01';
   			 break;
   		 case 'Mar':
   			 udate_month='02';
   			
   			 break;
   		 case 'Apr':
   			 udate_month='03';
   			 break;
   		 case 'May':
   			 udate_month='04';
   			
   			 break;
   		 case 'Jun':
   			 udate_month='05';
   			 break;
   		 case 'Jul':
   			 udate_month='06';
   			
   			 break;
   		 case 'Aug':
   			 udate_month='07';
   			
   			 break;
   		 case 'Sep':
   			 udate_month='08';
   			 break;
   		 case 'Oct':
   			 udate_month='09';
   			
   			 break;
   		 case 'Nov':
   			 udate_month='10';
   			 break;
   		 case 'Dec':
   			 udate_month='11';
   			
   			 break;
   			
   			
   			 }
    	 
    	var thisDate = new Date(day.substring(7,11),udate_month,day.substring(0,2));

    	
    	}
    	if(thisDate!=null && isNaN(frequency)){
    	
    	if(frequency == 'DAILY'){
       thisDate.setDate(thisDate.getDate() + 1);
   		 }
    	if(frequency == 'FORTNIGHTLY'){
    	       thisDate.setDate(thisDate.getDate() + 15);
    	   		 }
    	if(frequency == 'HALF_YEARLY'){      	
        	if(thisDate.getMonth()==7){
        		var mn=thisDate.getMonth();        
        		var yr=thisDate.getYear();        	
        				mn=mn+6;
        		        	if(mn>11){
        		            mn=mn-11;
        		            mn--;        		       
        					yr++; 
        					   			
        					var dy=thisDate.getDate();
					if(mn==1){		
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						}       	
        					thisDate.setYear(yr) ;
        					thisDate.setDate(dy) ;
        					thisDate.setMonth(mn) ;
        					
        	}}else{
            	
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            	
            	if(thisDate.getMonth()==4 || thisDate.getMonth()==9){
                	if(dy==31){
                		dy--;
                	}
                	
                	
            	}
            	
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 6) ; 
        		 
        	}	
		  	
    	   		 
    	}
    	if(frequency == 'MONTH'){
        	if(thisDate.getMonth()==00){
        		
        		var mn=thisDate.getMonth();        
        		var yr=thisDate.getYear();
        		mn=mn+1;
        		if(mn==1){
            		
            		
            		var dy=thisDate.getDate();
            				
    					if(dy>28){
    						dy=28;
    						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
    							dy++;
    					}			
    					
    					       	
        					thisDate.setYear(yr) ;
        					thisDate.setDate(dy) ;
        					thisDate.setMonth(mn) ;
        					
        	}
            	}else{
        		

            		
                	var dy=thisDate.getDate();
                	var mn=thisDate.getMonth();  
                
                	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==4 ||thisDate.getMonth()==7 ||thisDate.getMonth()==9){
                    	if(dy==31){
                    		dy--;
                    	}
                    
                    	
                	}
                
                	thisDate.setDate(dy) ;
            		thisDate.setMonth(thisDate.getMonth()+ 1) ; 
        		}
   		      	
    	   		 }
    	if(frequency == 'QUARTERLY'){
        	if(thisDate.getMonth()==10){
    		
    		var mn=thisDate.getMonth();        
    		var yr=thisDate.getYear();
    		mn=mn+3;
    		if(mn==13){
        		mn=mn-11;
        		mn--;
        		yr++;
        		
        		var dy=thisDate.getDate();
        		if(mn==1){		
					if(dy>28){
						dy=28;
						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
							dy++;
					}			
					
					}       	
    					thisDate.setYear(yr) ;
    					thisDate.setDate(dy) ;
    					thisDate.setMonth(mn) ;
    					
    	}
        	}else{
    		
        		
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            
            	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==7){
                	if(dy==31){
                		dy--;
                	}
                
                	
            	}
        
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 3) ; 
    		}
         	
    	   		 }
    	if(frequency == 'WEEKLY'){
    	       thisDate.setDate(thisDate.getDate() + 7);
    	   		 }
    	if(frequency == 'YEARLY'){
    	    
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();
 
        		thisDate.setYear(yr + 1) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
        	
    	}
    	if(frequency == 'TWO_YEARLY'){
    	    
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();
 
        		thisDate.setYear(yr + 2) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
        	
    	}
    	if(frequency == 'THREE_YEARLY'){
    	    
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();
 
        		thisDate.setYear(yr + 3) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
        	
    	}
    	if(frequency == 'FOUR_YEARLY'){
    	    
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();
 
        		thisDate.setYear(yr + 4) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
        	
    	}
        	
    	if(frequency == 'BI_MONTH'){
    		if(thisDate.getMonth()==11){
        		var mn=thisDate.getMonth();        
        		var yr=thisDate.getYear();        	
        				mn=mn+2;
        		        	if(mn>11){
        		            mn=mn-11;
        		            mn--;        		       
        					yr++; 
        				 			
        					var dy=thisDate.getDate();
					if(mn==1){		
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						}       	
        					thisDate.setYear(yr) ;
        					thisDate.setDate(dy) ;
        					thisDate.setMonth(mn) ;
        					
        	}}else{
            	
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            	
            	if(thisDate.getMonth()==6){
                	if(dy==31){
                		dy--;
                	}              	
                	
            	}
            	
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 2) ; 
        		 
        	}	
		  	
 	   		 }
    	
    	
      var cal_month=thisDate.getMonth();  
   
      switch(cal_month.toString())
		 {
      
		 case '0':
			 cal_month='Jan';
             break;
		 case '1':
			 cal_month='Feb';
			 break;
		 case '2':
			 cal_month='Mar';
			 break;
		 case '3':
			 cal_month='Apr';
			 break;
		 case '4':
			 cal_month='May';
			 break;
		 case '5':
			 cal_month='Jun';
			 break;
		 case '6':
			 cal_month='Jul';
			 break;
		 case '7':
			 cal_month='Aug';
			 break;
		 case '8':
			 cal_month='Sep';
			 break;
		 case '9':
			 cal_month='Oct';
			 break;
		 case '10':
			 cal_month='Nov';
			 break;
		 case '11':
			 cal_month='Dec';
			 break;		
			
			 }

		
      if(thisDate.getDate()<10){
			var date=thisDate.getDate().toString();
			var date1='0'+date;
			}
		
		if(date1 != null){
		 var final_date=date1+'/'+cal_month+'/'+thisDate.getFullYear().toString();
		}else{
			 var final_date=thisDate.getDate().toString()+'/'+cal_month+'/'+thisDate.getFullYear().toString();
		}
      	document.getElementById('nextValDate').value = final_date;
      	document.all.nextValDate.value = final_date;
      	document.all.nextValDate.value = final_date;
    	}

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
			<input type="hidden" name="builtUpAreaMandatory" id="builtUpAreaMandatoryID" />			
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
				<bean:message key="label.security.property.sale.purchage.agree.val"/></td>
			<td><html:text property="salePurchareAmount" styleId="salePurchareAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
				<html:errors property="salePurchareAmount"/></td>
			<td class="fieldname">
				Mortgage Creation Date	</td>
			<td><html:text property="salePurchaseDate"  readonly="true"  />
			<img src="img/calendara.gif"  name="Image11" border="0" id="Image1" 
                onclick="return showCalendar('salePurchaseDate', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
				<html:errors property="salePurchaseDate"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Type of Mortage <span class="mandatoryPerfection"> * </span></td>
			<td><html:select property="typeOfMargage" onchange="setPhysInsp(this)">
	                <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_MORTGAGE_TYPE%>" descWithCode="false"/>
				</html:select>
				<html:errors property="typeOfMargage"/></td>
			<td class="fieldname">Date of Valuation <span class="mandatoryPerfection"> * </span></td>
			<td><html:text property="valuationDate"  readonly="true" onchange="calNextDate2()" />
			<img src="img/calendara.gif"  name="Image12" border="0" id="Image2" 
                onclick="return showCalendar('valuationDate', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)" />
				<html:errors property="valuationDate"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Mortage Created By <span class="mandatoryPerfection"> * </span></td>
			<td><html:select name="PropCommGeneralForm" property="morgageCreatedBy">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="bankList" labelProperty="label" property="value" />
              	</html:select>
				<html:errors property="morgageCreatedBy"/></td>
				
			<td class="fieldname">Document Received </td>
			<td><html:select property="documentReceived" onchange="getlag1()" styleId="propertyCompletionStatusID" >
					<option value=""><bean:message key="label.please.select"/> </option>
					<html:options name="propertyCompletionStatusValue" labelName="propertyCompletionStatusLabel"/>
				</html:select>&nbsp;
		        &nbsp;<html:errors property="documentReceived"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Document Block </td>
			<td><html:checkbox property="documentBlock"/>
				<html:errors property="documentBlock"/></td>
			<td class="fieldname">Bin Number</td>
			<td><html:text property="binNumber"/>
				<html:errors property="binNumber"/></td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<td ><html:text property="totalPropertyAmount" styleId="totalPropertyAmount" onblur="javascript:formatAmountAsCommaSeparated(this)" readonly="true"/>
				<html:errors property="totalPropertyAmount"/></td>
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
			<td class="fieldname">Valuation Company&nbsp;<span class="mandatoryPerfection">*&nbsp;</span></td>
			<td colspan="3">
				<html:select name="PropCommGeneralForm" property="valuatorCompany">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="valuationAgencyList" labelProperty="label" property="value" />
              	</html:select>
              	<br/><html:errors property="valuatorCompany"/>
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
			<td class="fieldname">Category of Land Used </td>
			
             <td>
             	<html:select property="categoryOfLandUse" >
              	<integro:common-code
                  		categoryCode="<%=CategoryCodeConstant.CATEGORY_OF_LAND_USE%>" descWithCode="false"/>
              </html:select>
                 <html:errors property="categoryOfLandUse"/></td>
		</tr>
			
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.dev.occu.name"/>&nbsp;
			</td>
			<td>
				<html:text property="developerName" size="65"></html:text>
				<html:errors property="developerName" /></td>
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
			<td colspan="3"><html:text property="propertyLotLocation" size="65" />&nbsp;
				<br /><html:errors property="propertyLotLocation"/>
			</td>
						
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
		
			<td class="fieldname"> <bean:message key="label.security.country"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      <td><html:select name="PropCommGeneralForm" property="country" onchange="javascript:refreshRegionId(this)">
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="countryList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="country"/> </td>           
			 
			 		<td class="fieldname"> <bean:message key="label.security.region"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="region"  onchange="javascript:refreshStateId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
                  		</html:select>
	                <html:errors property="region"/> </td>
	     </tr> 
			 
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">          
			 		
			 		<td class="fieldname"> <bean:message key="label.security.state"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="locationState"  onchange="javascript:refreshCityId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="stateList" labelProperty="label" property="value" />
                  		</html:select>
	                <html:errors property="locationState"/> </td>
	                
			 	 <td class="fieldname"> <bean:message key="label.security.city"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="nearestCity"  >
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="cityList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="nearestCity"/> </td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Pincode <span class="mandatoryPerfection"> * </span></td>
			<td ><html:text property="pinCode" size="10" maxlength="6"/>
				<br /><html:errors property="pinCode"/>
				<html:errors property="pincodeError"/>
				<html:errors property="postcodeError"/>
			</td>
		
			<td class="fieldname">Other City</td>
			<td ><html:text property="otherCity" size="65"/>
				<br /><html:errors property="otherCity"/>
			</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.land.area"/>
				<%if((subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
						|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
				</td>
			<td><%int type=1; %>
			<html:text property="landArea" size="34" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet(landArea,landUOM,'land');"/>&nbsp;
			<html:errors property="landAreaLengthError" />
			
			    <html:select property="landUOM" onchange="convertToSqfeet(landArea,landUOM,'land');">
			    <option value="" ><bean:message key="label.please.select"/> </option>
			    	<html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
			    </html:select>
			    &nbsp;<html:errors property="landUOM" />
			   <%--  <html:errors property="landAreaUomError" /> --%>&nbsp;</td>
			    
			   <td class="fieldname">
				<bean:message key="label.security.property.land.area.sqft"/></td>
		  	<td><html:text property="inSqftLandArea" styleId="inSqftLandArea" size="25" maxlength="30" readonly="true"/>&nbsp;
				Sq.ft</td> 
			  
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
		<%if(!(subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
				|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
			<td class="fieldname">
				<bean:message key="label.security.property.build.up.area"/>
				<span class="mandatoryPerfection" id="builtUpAreaMandatoryID" >*</span></td>
			<td><%type=2; %>			<html:text property="builtUpArea" size="25" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet(builtUpArea,builtUpAreaUnit,'builtUp');"/>&nbsp;
			<html:errors property="builtupAreaLengthError" />
			    <html:select property="builtUpAreaUnit" onchange="convertToSqfeet(builtUpArea,builtUpAreaUnit,'builtUp');" >
			     <option value="" ><bean:message key="label.please.select"/> </option>
				    <html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
				    </html:select>
			     &nbsp; <html:errors property="builtUpAreaUnit" />
			     <html:errors property="builtUpAreaUomError" /></td>
		<%}else{ %>
			<td class="fieldname"> &nbsp;</td>
			<td >&nbsp;</td>
		<%} %>		
		
		<td class="fieldname">
				<bean:message key="label.security.property.build.up.area.sqft"/></td>
		  	<td><html:text property="inSqftBuiltUpArea"  styleId="inSqftBuiltUpArea" size="25" maxlength="30" readonly="true"/> 
		  	&nbsp;
				Sq.ft</td>
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
			<td><html:text property="description" size="65" maxlength="40" /><html:errors property="description"/></td>
			<td class="fieldname">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><html:select property="propertyCompletionStatus" onchange="getlag1()" styleId="propertyCompletionStatusID" >
					<option value=""><bean:message key="label.please.select"/> </option>
					<html:options name="propertyCompletionStatusValue" labelName="propertyCompletionStatusLabel"/>
				</html:select>&nbsp;
				<html:errors property="propertyCompletionStatus"/></td>
		</tr>
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value <span id="mandatorylandValue" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<html:text property="landValue" onkeypress="return onlyNos(event,this);"  styleId="landValue" onchange="totalValue();"/><html:errors property="landValue"/>
			</td>
			<td class="fieldname">
				Building Value <span id="mandatoryBuildingValue" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<html:text property="buildingValue" onkeypress="return onlyNos(event,this);" onchange="totalValue();" styleId="buildingValue" /><html:errors property="buildingValue"/>
			</td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building <span id="mandatoryReconstructionValueOfTheBuilding" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<html:text property="reconstructionValueOfTheBuilding" onkeypress="return onlyNos(event,this);" onchange="totalValue();" styleId="reconstructionValueOfTheBuilding" /><html:errors property="reconstructionValueOfTheBuilding"/>
			</td>
		</tr>
		<!-- End Santosh -->
		</table>
	</td></tr>
	</tbody>
	<html:hidden  property="claimType" styleId="claimType"/>
	<html:hidden  property="propertyTypeLabel" styleId="propertyTypeLabel"/>
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
				document.getElementById("mandatorylandValue").style.display='';
				document.getElementById("mandatoryBuildingValue").style.display='none';
				document.getElementById("mandatoryReconstructionValueOfTheBuilding").style.display='none';
			}
			else {
				document.getElementById("mandatorylandValue").style.display='none';
				document.getElementById("mandatoryBuildingValue").style.display='';
				document.getElementById("mandatoryReconstructionValueOfTheBuilding").style.display='';
			}
	} 
	
	
	
	function totalValue() {
		/* //alert(amt.value);
		var value = parseFloat((amt.value).replace(',',''));
		if(isNaN(value)  || amt.value.trim()=="") {    
			value=0;
		}
			document.getElementById('totalPropertyAmount').value = parseFloat((document.getElementById('totalPropertyAmount').value).replace(',',''))+value;
			document.getElementById('amountCMV').value = parseFloat((document.getElementById('amountCMV').value).replace(',',''))+value;
			calculateLoanableAmount1(); */
			<%-- var totalPropertyAmount=<%=iCol.getTotalPropertyAmount().getAmount()%> --%>
			var landValue= parseFloat((document.getElementById('landValue').value).replace(/,/g , ''));
			var buildingValue= parseFloat((document.getElementById('buildingValue').value).replace(/,/g , ''));
			var reconstructionValueOfTheBuilding= parseFloat((document.getElementById('reconstructionValueOfTheBuilding').value).replace(/,/g , ''));
			 
			/* if(isNaN(totalPropertyAmount)){
				totalPropertyAmount=0;
			} */
			if(isNaN(landValue)){
				landValue=0;
				document.getElementById('landValue').value=0;
			}
			if(isNaN(buildingValue)){
				buildingValue=0;
				document.getElementById('buildingValue').value=0;
			}
			if(isNaN(reconstructionValueOfTheBuilding)){
				reconstructionValueOfTheBuilding=0;
				document.getElementById('reconstructionValueOfTheBuilding').value=0;
			}
			
		var total=landValue+buildingValue;//+reconstructionValueOfTheBuilding;	
		document.getElementById('totalPropertyAmount').value = total;//+totalPropertyAmount;
		document.getElementById('amountCMV').value =total;//+parseFloat(document.getElementById('amountCMV').value);
		calculateLoanableAmount1();
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
        
        function convertToSqfeet(area,areaUnit,type){
        	
        	var areaValue = parseFloat((area.value).replace(',',''));
        	var areaUnitValue = areaUnit.value;
        	var inSqft=0;
        	if(areaUnitValue!=null){
	        	if("ACRES" == areaUnitValue){
	        		inSqft=areaValue*43560;
	        	}	
	        	else if("ARE" == areaUnitValue){
	        		inSqft=areaValue*1076.39;
	        	}
	        	else if("BIGHA" == areaUnitValue){
	        		inSqft=areaValue*17452.0069;
	        	}
	        	else if("BISWA" == areaUnitValue){
	        		inSqft=areaValue*357142.857;
	        	}
	        	else if("BISWANI" == areaUnitValue){
	        		inSqft=areaValue*17857.142;
	        	}
	        	else if("CENTS" == areaUnitValue){
	        		inSqft=areaValue*435.54;
	        	}
	        	else if("CHITTAK" == areaUnitValue){
	        		inSqft=areaValue*45;
	        	} 
	        	else if("DECIMAL" == areaUnitValue){
	        		inSqft=areaValue*436;
	        	}
	        	else if("GROUND" == areaUnitValue){
	        		inSqft=areaValue*2400.3840;
	        	}
	        	else if("GUNTHA" == areaUnitValue){
	        		inSqft=areaValue*1089.0873;
	        	}
	        	else if("HQT" == areaUnitValue){
	        		inSqft=areaValue*107639;
	        	}
	        	else if("KANAL" == areaUnitValue){
	        		inSqft=areaValue*5445;
	        	}
	        	/* else if("Killa" == areaUnitValue){
	        		inSqft=areaValue*43560;
	        	} */
	        	else if("KOTTA" == areaUnitValue){
	        		inSqft=areaValue*720;
	        	}
	        	else if("MARLA" == areaUnitValue){
	        		inSqft=areaValue*272.251;
	        	}
	        	else if("SATAK" == areaUnitValue){
	        		inSqft=areaValue*458;
	        	}
	        	else if("SQFT" == areaUnitValue){
	        		inSqft=areaValue*1;
	        	}
	        	else if("SQM" == areaUnitValue){
	        		inSqft=areaValue*10.7639;
	        	}
	        	else if("SQY" == areaUnitValue){
	        		inSqft=areaValue*9;
	        	}
        	}
        	var valueInSqft=inSqft.toFixed(2);
        	 if(type=="builtUp"){
        		document.getElementById('inSqftBuiltUpArea').value = valueInSqft;
        	} 
        	else if(type=="land"){
        		document.getElementById('inSqftLandArea').value = valueInSqft;
        	}
        }
 
    </script>

