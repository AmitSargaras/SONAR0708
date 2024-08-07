<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                 com.integrosys.cms.ui.common.UIUtil,

                  java.util.Collection,
				 java.util.Iterator,
				 java.util.*,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>

<%@page
	import="com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
				com.integrosys.cms.ui.manualinput.limit.FacCoBorrowerDetailsForm,
				com.integrosys.cms.app.customer.bus.ICoBorrowerDetails,
				com.integrosys.cms.ui.manualinput.limit.LmtDetailAction,
				java.util.List"%>
				
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->
<%
String event = request.getParameter("event");

String fromPage = request.getParameter("fromPage");

Collection subSecurityList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subSecurityList");
request.setAttribute("subSecurityList", subSecurityList);

List systemIdList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.systemIdList");
pageContext.setAttribute("systemIdList",systemIdList);

String BASE_INT_RATE =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.BASE_INT_RATE");

String BPLR_INT_RATE =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.BPLR_INT_RATE");

String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String partyId =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.partyId");


XRefDetailForm form = (XRefDetailForm) request.getAttribute("XRefDetailForm");
pageContext.setAttribute("XRefDetailForm", form);	 

List facCoBorrowerList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerList");
pageContext.setAttribute("facCoBorrowerList",facCoBorrowerList);

List restCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerList");
 
String lineCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerIds");
if(null !=lineCoBorrowerLiabIds){
if(!lineCoBorrowerLiabIds.contains("\"")){
List<String> selectedCoBorrowerIds = UIUtil.getListFromDelimitedString(lineCoBorrowerLiabIds, ",");
lineCoBorrowerLiabIds = UIUtil.getJSONStringFromList(selectedCoBorrowerIds, ",");
}
}
		if (!(restCoBorrowerList == null)) {
			System.out.println("restCoBorrowerList size="+restCoBorrowerList.size());
			pageContext.setAttribute("restCoBorrowerList", restCoBorrowerList);
		}else {
			restCoBorrowerList = new ArrayList();
		pageContext.setAttribute("restCoBorrowerList", new ArrayList());
		}
	   
	int vno = 0;
	String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
	pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);
	String wsCall=PropertyManager.getValue("fetch.coBorrower.wsCall");

%>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
     <script type="text/javascript" src="js/jquery.min.js"></script> 
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
   function submitAccount()
   {
	   document.getElementById('adhocLineY').disabled = false;
	   document.getElementById('adhocLineN').disabled = false;
    if(document.getElementById('interestRateType').checked=='false'||document.getElementById('interestRateType').checked==false)
   	{
    	var margin=eval(document.getElementById('intRateFloatingMargin').value);
		var range=eval(document.getElementById('intRateFloatingRange').value);
   		if(document.getElementById('intRateFloatingMarginFlag').checked=='false'||document.getElementById('intRateFloatingMarginFlag').checked==false)
   		{
   			if(margin>range)
   			{
   			 alert('Interest rate cannot be negative');
   			 return;
   			}
   		}else if((margin + range) > 100){
   		 		alert('Interest rate cannot greater than 100');
			 return;
   		}   		
   	}
	if (document.forms[0].indexID.value == '')
	{
	    document.forms[0].event.value = 'create';
        }
        else
	{
	    document.forms[0].event.value = 'submit';	
	} 

	if(document.forms[0].isPrioritySector.value != 'Blank') {
		if(document.forms[0].isPrioritySector[0].checked) {
			document.forms[0].prioritySector.value = document.all.prioritySector[1].value;
			document.getElementById('prioritySector').value = document.all.prioritySector[1].value;
		}
	}
	document.forms[0].submit();	
   }
   function cancelSubmit()
   {
	document.forms[0].event.value = 'cancel';
	document.forms[0].submit();
   }
	
   function refreshHostSystem(dropdown)
   {
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
        }	
        var dep = 'hostSystemName';
        var url = '/cms/MIAcntDetail.do?event=refresh_hostsyscountry&hostSystemCountry='+curSel;
        sendLoadDropdownReq(dep, url);
   }	



   function JumpOnSelect(selectObj)
   {
     		var selectIndex = selectObj.selectedIndex;
   		
   		//Process Customer
   		if (selectObj.options[selectIndex].value == 1)
   		window.location.href('../customer/CustDetails(mode=view,cpcMaker).htm');
   		
   		//View Limits
   		else if (selectObj.options[selectIndex].value == 2)
   		window.location.href('searchLimit(SACmaker,result).htm');
   		
   		/*View Sec Coverage
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Collateral/ViewSecurityCoverageContainer.htm');*/
   		
   		//View Securities
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Deal/Dealframe(GMRA,MRmaker).htm');
   		
   		//View Valuation
   		else if(selectObj.options[selectIndex].value == 4)
   		parent.window.location.href('../Valuation/Valuationframe(MRmaker).htm');
   		
   		//Maintain Security Checklist
   		else if(selectObj.options[selectIndex].value == 5)
   		window.location.href('#');
   		
   		//Update C/C Doc Receipt
   		else if(selectObj.options[selectIndex].value == 6)
   		parent.window.location.href('../Documentation/UpCCDocReceiptContainer(cpcdocmaker).htm');
   		else if(selectObj.options[selectIndex].value == 9)
   		window.location.href('../Collateral/ViewLimitsContainer(SACmaker).htm');
   		
   }
   function shwhd(selfObj){
   	if(selfObj.value == 'fixed'){
   		document.getElementById('intRateFloatingMarginFlag').value='';
   		document.getElementById('intRateFloatingMargin').value='';	
   		document.getElementById('intRateFloatingRange').value='';	
   		document.getElementById('intRateFloatingType').value='';
   		document.getElementById('fixed').style.display = ''; 
   		document.getElementById('margin').style.display = 'none';
   	}
	if (selfObj.value == 'floating'){
   		document.getElementById('fixed').style.display = 'none';
   		document.getElementById('margin').style.display = '';
   	}
   }  
   function shwhdPSec(selfObj){
	   
	   	if(selfObj.value == 'No'){
	   		document.getElementById('pSec_No').style.display = ''; 
	   		document.getElementById('pSec_Yes').style.display = 'none';
	   		
	   		document.all.prioritySector[0].name='prioritySector';
	   	 	document.all.prioritySector[1].name='';	
	   	}
		if (selfObj.value == 'Yes'){
	   		document.getElementById('pSec_Yes').style.display = '';
	   		document.getElementById('pSec_No').style.display = 'none';
	   		
	   		document.all.prioritySector[1].name='prioritySector';   
	   	 	document.all.prioritySector[0].name='';
	   	 	
	   	}
		document.all.prioritySector[0].value='';
		document.all.prioritySector[1].value='';
  }
	   function shwhdEstateType(selfObj){
		   	if(selfObj.value == 'Commercial Real estate'){
		   		document.getElementById('CommRE').style.display = ''; 
		   	} else {
		   		document.getElementById('CommRE').style.display = 'none';
		   	}
		}
	   function shwhdRealEstateExposer(selfObj){
		   	if(selfObj== 'Yes'){
		   		document.forms[0].estateType[0].disabled =false;
				document.forms[0].estateType[1].disabled =false;
				document.forms[0].estateType[2].disabled =false;
				document.forms[0].estateType[0].checked =false;
				document.forms[0].estateType[1].checked =false;
				document.forms[0].estateType[2].checked =false;
				document.getElementById('CommRE').style.display = 'none';
		   	}
			if(selfObj == 'No'){
				document.forms[0].estateType[0].disabled =true;
				document.forms[0].estateType[1].disabled =true;
				document.forms[0].estateType[2].disabled =true;
				document.getElementById('CommRE').style.display = 'none';
		   	}
		}
		
	   function enableUtilizedAmount()
		{
			var relAmt="";
			var releasedAmount=document.forms[0].releasedAmount.value;
			if(releasedAmount=='')
			{
				document.forms[0].utilizedAmount.disabled=true;
			}
			else
			{
				document.forms[0].utilizedAmount.disabled=false;
			}
			for(var i=0;i<releasedAmount.length;i++){
				if(releasedAmount[i]!=="m" && releasedAmount[i]!=="M" && releasedAmount[i]!=="b" && releasedAmount[i]!=="B"){
					relAmt=relAmt+releasedAmount.charAt(i);			
				}
				
	        if(releasedAmount[i]==="m"|| releasedAmount[i]==="M"){	        	
	        	releasedAmount=releasedAmount.toLowerCase().replace('M'," ");	        
	        	releasedAmount=relAmt*1000000;	    	        
	        }
	        
	        if(releasedAmount[i]==="B"|| releasedAmount[i]==="b"){
	        	releasedAmount=releasedAmount.replace('B'," ");
	        	releasedAmount=relAmt*1000000000;		       
		        }
	        }
		}
		

		function onBlurEvent(txtReleaseAmount){
			var releasedAmount=txtReleaseAmount.value;
			var len="";
			if(releasedAmount.length>=1 && releasedAmount.length<=38){
				var secondLastChar=releasedAmount.charAt(releasedAmount.length-1);
				if(secondLastChar==="M"){
					releasedAmount=releasedAmount.replace("M"," ");
					releasedAmount=releasedAmount*1000000;
					len=releasedAmount.toString().length;
					if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
						txtReleaseAmount.value=releasedAmount;
					}else{
						txtReleaseAmount.value="0.00";
					}
				}
				else if(secondLastChar==="m"){
					releasedAmount=releasedAmount.replace("m"," ");
					releasedAmount=releasedAmount*1000000;
					len=releasedAmount.toString().length;
					if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
						txtReleaseAmount.value=releasedAmount;
					}else{
						txtReleaseAmount.value="0.00";
					}
				}
				else if(secondLastChar==="B"){
					releasedAmount=releasedAmount.replace("B"," ");
					releasedAmount=releasedAmount*1000000000;
					len=releasedAmount.toString().length;
					if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
						txtReleaseAmount.value=releasedAmount;
					}else{
						txtReleaseAmount.value="0.00";
					}
				}
				else if(secondLastChar==="b"){
					releasedAmount=releasedAmount.replace("b"," ");
					releasedAmount=releasedAmount*1000000000;
					len=releasedAmount.toString().length;
					if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
						txtReleaseAmount.value=releasedAmount;
					}else{
						txtReleaseAmount.value="0.00";
					}
				}
				else if(secondLastChar == 0 || secondLastChar == 1|| secondLastChar == 2|| 
						secondLastChar == 3|| secondLastChar == 4|| secondLastChar == 5|| secondLastChar == 6
						|| secondLastChar == 7 || secondLastChar == 8 || secondLastChar == 9){
					len=releasedAmount.toString().length;
					if(len<=38){
						txtReleaseAmount.value=releasedAmount;
					}else{
						txtReleaseAmount.value="0.00";
					}
				}
				else{
					txtReleaseAmount.value="0.00";
				}
			}
			else{
				txtReleaseAmount.value="0.00";
			}
		}

		function onKeyUpEvent(txtReleaseAmount){
			var releasedAmount=txtReleaseAmount.value;
			if(releasedAmount.length>1){
				var secondLastChar=releasedAmount.charAt(releasedAmount.length-2);
				if(secondLastChar==="M"){
					releasedAmount=releasedAmount.slice(0,-1);
					txtReleaseAmount.value=releasedAmount;
				}
				if(secondLastChar==="m"){
					releasedAmount=releasedAmount.slice(0,-1);
					txtReleaseAmount.value=releasedAmount;
					
				}
				if(secondLastChar==="B"){
					releasedAmount=releasedAmount.slice(0,-1);
					txtReleaseAmount.value=releasedAmount;
				}
				if(secondLastChar==="b"){
					releasedAmount=releasedAmount.slice(0,-1);
					txtReleaseAmount.value=releasedAmount;
				}
			}
		}

		function floatingRate(rateType) {
			if(rateType == 'BASE'){
				document.getElementById('intRateFloatingRange').value='<%=BASE_INT_RATE%>';
			}else if(rateType == 'BPLR'){
				document.getElementById('intRateFloatingRange').value='<%=BPLR_INT_RATE%>';
			}else {
				document.getElementById('intRateFloatingRange').value='0';
			}
		}
		
		//fetch co borrower name WS 
		function fetchCoBorrowerNameWS(){ 
			
			var facilitySystem = document.forms[0].facilitySystem.value;
			var coBorrowerDropDown = document.getElementById("coBorrowerId"); 
			var coBorrowerDropDownId = coBorrowerDropDown.options[coBorrowerDropDown.selectedIndex].value;
			 var xmlhttp;
			 if (window.XMLHttpRequest)
			 {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			 }
			 else
		  	 {// code for IE6, IE5
		  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		     }
		     var systemId;   
		   
			 var partyId= '<%=partyId%>';
		    
		     var lineNo=document.forms[0].lineNo.value;
		     var serialNo=document.forms[0].serialNo.value;
		 
		     if("UBS-LIMITS" == facilitySystem) {
				 
				 xmlhttp.open("GET","/cms/MIAcntDetail.do?event=fetch_CoBorrowerName_FCUBS&systemId="+systemId+"&lineNo="+lineNo+"&serialNo="+serialNo+"&partyId="+partyId+"&coBorrowerDropDownId="+coBorrowerDropDownId,true);
				 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			     xmlhttp.send();
			     
				} if("BAHRAIN" == facilitySystem) {
						 
						 xmlhttp.open("GET","/cms/MIAcntDetail.do?event=fetch_CoBorrowerName_BH&systemId="+systemId+"&lineNo="+lineNo+"&serialNo="+serialNo+"&partyId="+partyId+"&coBorrowerDropDownId="+coBorrowerDropDownId,true);
						 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					     xmlhttp.send();
					     
			    } 
	    
				 if("HONGKONG" == facilitySystem) {
						 xmlhttp.open("GET","/cms/MIAcntDetail.do?event=fetch_CoBorrowerName_HK&systemId="+systemId+"&lineNo="+lineNo+"&serialNo="+serialNo+"&partyId="+partyId+"&coBorrowerDropDownId="+coBorrowerDropDownId,true);
						 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					     xmlhttp.send();
					     
			    } if("GIFTCITY" == facilitySystem) {
								 
								 xmlhttp.open("GET","/cms/MIAcntDetail.do?event=fetch_CoBorrowerName_GC&systemId="+systemId+"&lineNo="+lineNo+"&serialNo="+serialNo+"&partyId="+partyId+"&coBorrowerDropDownId="+coBorrowerDropDownId,true);
								 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
							     xmlhttp.send();
							     
				}
			    
		     xmlhttp.onreadystatechange=function()
				{
		    	
				 if (xmlhttp.readyState==4 && xmlhttp.status==200)
				 {
				 		document.getElementById('fcubsCoBorrowerResponceText').innerHTML =  xmlhttp.responseText;
				 		
				 		var str=document.getElementById('fcubsCoBorrowerResponceText').innerHTML;
				 		if(str.indexOf("fcubsCoBorrowerResponce")==-1){
				 	
				 		if(str.indexOf("coborrowerName:")!=-1){
						var sep=str.indexOf(":");
				 		var coborrowerNm=str.substr(sep+1);
				 	//	alert("coborrowerNm from WS:"+coborrowerNm);
				 		document.getElementById('coBorrowerName').value=coborrowerNm ;
				 		}
				 		}
				 		else{
				 	//		alert(str);
				 		}
				 
				 }
				}
		  
		     
		} //End Co Borrower WS
		
		
		  //Co-Borrower Delete 
		  function deleteRestCoBorrower(coBorrowerId,index) {
				document.forms[0].action = "MIAcntDetail.do?coBorrowerId=" +coBorrowerId +"&indexIDD="+index;		
				document.forms[0].event.value = "delete_coBorrower_rest_1";
				document.forms[0].submit();
			}	     
   
		  var lineCoBorrowerLiabIds = "["+'<%=lineCoBorrowerLiabIds%>'+"]"; 
	//	  var coBorrowerIdArr = JSON.parse("[" + lineCoBorrowerLiabIds + "]");
		  var coBorrowerIdArr = jQuery.parseJSON(lineCoBorrowerLiabIds);
		  //console.log("LineCoBorrowerLiabIds:--"+lineCoBorrowerLiabIds+"--");

        //Add Co-Borrower
			function addCoBorrower(){
			//	document.getElementById('coBorrowerId').disabled = true;
			//	document.getElementById('coBorrowerName').disabled = true;
				var coBorrowerDropDown = document.getElementById("coBorrowerId"); 
				var coBorrowerId = coBorrowerDropDown.options[coBorrowerDropDown.selectedIndex].value;
				var coBorrowerName =  document.getElementById('coBorrowerName').value;
			//	alert("coBorrowerId::"+coBorrowerId+"  && coBorrowerName::"+coBorrowerName)
			//	//console.log("selected id : "+coBorrowerId+", name: "+coBorrowerName+", coBorrowerIdArr: "+coBorrowerIdArr.length);
				
				if(validateInput(coBorrowerId))
					return;
			
				
		//	alert(" ## "+coBorrowerName);
			document.forms[0].action="MIAcntDetail.do?coBorrowerName="+coBorrowerName;
			document.forms[0].event.value = "add_coBorrower_1";

			document.forms[0].submit();
			setLineCoBorrowerLiabIds();
			}
			
function validateInput(coBorrowerId){
			  //	alert("validateInput id=="+coBorrowerId)
				  if("" == coBorrowerId){
				  		document.getElementById("restCoBorrowerListError")
				  		.innerHTML = "<font color=red size=1 >Select Co-Borrower</font>";
				  		
				  		return true;
				  	}
			  document.getElementById("restCoBorrowerListError").innerHTML = "";
			 //alert("coBorrowerIdArr.length ==="+coBorrowerIdArr.length)
			  	if(coBorrowerIdArr.length === 5){
			  		document.getElementById("restCoBorrowerListError")
			  		.innerHTML = "<font color=red size=1 >Maximum 5 Co-Borrowers are allowed</font>";
			  		return true;
			  	}

			  for(var i = 0 ; i < coBorrowerIdArr.length ; i++) {
			//  	alert("coBorrowerIdArr[i]:: "+coBorrowerIdArr[i]+ "   && coBorrowerId:: "+coBorrowerId )
			  		if(coBorrowerIdArr[i] == coBorrowerId) {
			  			document.getElementById("restCoBorrowerListError")
			  			.innerHTML = "<font color=red size=1 >Duplicate Co-Borrower, Co-Borrower Liab Id "+coBorrowerId+" is already added.</font>";
			  			 return true;
			  		}
			  }
	}
	
	function setLineCoBorrowerLiabIds(){
		var latestCoBorrowerIds = coBorrowerIdArr.join(",");
		//console.log("latestCoBorrowerIds: "+latestCoBorrowerIds);
		document.getElementById("lineCoBorrowerIds").value=latestCoBorrowerIds;
		//console.log("lineCoBorrowerIds.value: "+document.getElementById("lineCoBorrowerIds").value);
	}
			  
   
      
 </script>
 <html:form action="MIAcntDetail">
   <html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
  <html:hidden name="XRefDetailForm" property="lineCoBorrowerLiabIds" styleId="lineCoBorrowerIds" value="<%=form.getLineCoBorrowerLiabIds()%>"/>
 
  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  <html:hidden property="customerID"/>
  
  <input type="hidden" name="inrValue"/>
  <input type="hidden" name="facilityType" value="<%=request.getParameter("facilityType") %>">
 <input type="hidden" name="facCat" value="<%=request.getParameter("facCat") %>"/>
 
 <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
  <%System.out.println("+++++++memoExposer+++++"+request.getAttribute("memoExposer")); %>
   <bean:define id="formObj" name="XRefDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.XRefDetailForm"/>
   
  <input type="hidden" name="createdBy"	value="<%=formObj.getCreatedBy()%>" />
 
  <input type="hidden" name="createdOn"	value="<%=(formObj.getCreatedOn()==null)?"":formObj.getCreatedOn()%>" />
  
   <input type="hidden" name="hiddenSerialNo"	value="<%=(formObj.getHiddenSerialNo()==null)?"":formObj.getHiddenSerialNo()%>" />
    <input type="hidden" name="edited"	value="<%=(formObj.getEdited()==null)?"":formObj.getEdited()%>" />
  
  <input type="hidden" name="updatedBy"	value="<%= formObj.getUpdatedBy()%>" />
  <input type="hidden" name="updatedOn"	value="<%=(formObj.getUpdatedOn()==null)?"":formObj.getUpdatedOn()%>" />
      <input type="hidden" name="adhocFacility"  value="<%=request.getParameter("adhocFacility") %>">
  
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td><h3>Released Line Details </h3></td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
   </thead>
   <tbody>
    <tr> 
     <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
       <thead>
       </thead> 
       <tbody>
        <tr class="even">
		  <%-- <td width="20%" class="fieldname">Serial No.  <%=formObj.getUpdatedBy() %>  <font color="#FF0000">*</font> </td> --%>
		  		  <td width="20%" class="fieldname">Serial No.<font color="#FF0000">*</font> </td>
                  <td width="30%"><html:text property="serialNo" maxlength="2" />
                  <html:errors property="serialNo"/></td>
                   <html:errors property="accountNo"/></td>
                  
                  <td width="20%" class="fieldname">System</td>
                  <td width="30%"><html:text property="facilitySystem" readonly="true"/></td>
           </tr>
          <tr class="even">
		 		  <td width="20%" class="fieldname">Line No.</td>
                  <td width="30%"><html:text property="lineNo" readonly="true"/></td>
                  
                  <td width="20%" class="fieldname">System ID <font color="#FF0000">*</font> </td>
                  <td width="30%"><html:select property="facilitySystemID" >
		      		<option value="">Please Select </option>	
                      <html:options collection="systemIdList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;<html:errors property="facilitySystemID"/></td>
          </tr>
                
          <tr class="odd">
		  <td class="fieldname">Interest rate <font color="#FF0000">*</font></td>
                  <td><html:radio property="interestRateType" styleId="interestRateType"  onclick="javascript : shwhd(this);" value="fixed" />
                    Fixed                     
                    <html:radio property="interestRateType" styleId="interestRateType"  onclick="javascript : shwhd(this);" value="floating"  />
                    Floating                    
                    <br>
                    <div id="fixed" style="background:transparent;height:auto;border:0 none;display:none;">
                    <html:text property="intRateFix" styleId="intRateFix" maxlength="5"/>  <html:errors property="intRateFix"/>
                    </div>                
                    <div id="margin" style="background:transparent;height:auto;border:0 none;display:none;">
                      <html:select property="intRateFloatingType" styleId="intRateFloatingType" onchange="javascript : floatingRate(this.value);">
                        <html:option value="">Please Select</html:option>
                        <html:option value="BPLR">BPLR</html:option>
                        <html:option value="BASE">BASE</html:option>
                        </html:select>
                      <html:text property="intRateFloatingRange" styleId="intRateFloatingRange" readonly="true"> </html:text>
                      <br>
                      <html:radio property="intRateFloatingMarginFlag" styleId="intRateFloatingMarginFlag" value="+" />
                      +
                      <html:radio property="intRateFloatingMarginFlag" styleId="intRateFloatingMarginFlag" value="-" />
                      - Margin
                      <html:text property="intRateFloatingMargin" styleId="intRateFloatingMargin" maxlength="5" />
                      </div>  <html:errors property="interestRateType"/>  <html:errors property="intRateFloatingMargin"/>                  
                      </td>
                      <td class="fieldname"><p>&nbsp;</p>
                      </td>
                  <td>  </td> 
                </tr>
                <tr class="even">
                  <td class="fieldname">Released&nbsp; Amount <font color="#FF0000">*</font> </td>
                  <td><html:text property="releasedAmount" maxlength="41" styleId="releasedAmount" onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this); enableUtilizedAmount(); javascript:formatAmountAsCommaSeparated(this);"/><html:errors property="releasedAmount"/></td>
                  <td class="fieldname">Released date</td>
                  <td><html:text property="releaseDate" style="width:90px" readonly="true" onblur="itg_checkform('frmMain','releaseDate','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
                     <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('releaseDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; <html:errors property="releaseDate"/>
                </tr>
                <tr class="even">
		  <td class="fieldname">Utilized Amount </td>
                  <td><html:text property="utilizedAmount" maxlength="23" styleId="utilizedAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/><html:errors property="utilizedAmount"/></td>	
                  <td class="fieldname">Facility line expiry date</td>
                  <td><p>
                    <html:text property="dateOfReset" style="width:90px" readonly="true"  onblur="itg_checkform('frmMain','dateOfReset','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
                    <img src="img/calendara.gif"  name="Image211" border="0" id="Image211" onclick="return showCalendar('dateOfReset', 'dd/mm/y');" onmouseover="MM_swapImage('Image211','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                    <html:errors property="dateOfReset"/> </p></td> 
                </tr>
                <tr class="odd">
		  <td class="fieldname">Capital market  exposure <font color="#FF0000">*</font></td>
                  <td><html:radio property="isCapitalMarketExposer" value="Yes" /> Yes
  					  <html:radio property="isCapitalMarketExposer" value="No" /> No <html:errors property="isCapitalMarketExposer"/>
  				  </td>		
		  <td class="fieldname">&nbsp;  </td>
                  <td>&nbsp;
  				  </td>	
                </tr>
                <tr class="even">
                  <td class="fieldname">Real Estate Exposure <font color="#FF0000">*</font> </td>
                  <td><html:radio property="isRealEstateExposer" value="Yes"  onclick="javascript : shwhdRealEstateExposer(this.value);" /> Yes
  					  <html:radio property="isRealEstateExposer" value="No"  onclick="javascript : shwhdRealEstateExposer(this.value);"  /> No  <html:errors property="isRealEstateExposer"/>
  				  </td>
                  <td class="fieldname">Commercial Real estate/ Residential real Estate  / Indirect real estate</td>
                  <td><html:radio property="estateType"  value="Commercial Real estate" onclick="javascript : shwhdEstateType(this);"  />
                    <span class="fieldname">Commercial Real estate</span> <br>
                    <html:radio property="estateType"  value="Residential real Estate" onclick="javascript : shwhdEstateType(this);" />
                    <span class="fieldname">Residential real Estate <br>
                    <html:radio property="estateType"  value="Indirect real estate" onclick="javascript : shwhdEstateType(this);" />
                    Indirect real estate</span>&nbsp; 
                    <%if(formObj.getEstateType()== null ||"".equals(formObj.getEstateType())){%>
                   <br><html:errors property="commRealEstateType"/>
               <div id="CommRE" style="background:transparent;height:auto;border:0 none;display:none;">
   				<html:select property="commRealEstateType" >
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" descWithCode="false" />   
					</html:select>
					</div>
					<%}else{ %>
					<br><html:errors property="commRealEstateType"/>
                <div id="CommRE" style="background:transparent;height:auto;border:0 none;">
   				<html:select property="commRealEstateType" >
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" descWithCode="false" />   
					</html:select>
					</div>
					<%} %>
                    </td> 			
                </tr>
                
                          <tr class="odd">
               <td class="fieldname"><bean:message key="label.lineRelease.adhocLine"/><font color="#FF0000">*</font></td>
                        <%  
                  if(null != request.getParameter("adhocFacility")){  
                  
                   if(request.getParameter("adhocFacility").equalsIgnoreCase("Y")  ){%> 
                     <td>
                    <input type="radio" id="adhocLineY" name="adhocLine" value="Y" checked="checked" disabled="true" >Yes
                   <input type="radio" id="adhocLineN" name="adhocLine" value="N" disabled="true"  >No 
                   </td>
  					  <%}else{
                      System.out.println("formObj.getAdhocLine() .............."+formObj.getAdhocLine()); 
                if("N".equalsIgnoreCase(request.getParameter("adhocFacility") )  || null==formObj.getAdhocLine() || "N".equals(formObj.getAdhocLine())){%> 
                   
                 <td><input type="radio" id="adhocLineY" name="adhocLine"  value="Y"  disabled="true"  /> Yes
 					  <input type="radio" id="adhocLineN" name="adhocLine" value="N" checked="checked"  disabled="true" /> No  
 				  </td> 
 				  <html:hidden property="adhocLine" />
 				<%}else if("Y".equals(formObj.getAdhocLine())){  %>
 				  <td><input type="radio" id="adhocLineY" name="adhocLine"  value="Y"  checked="checked"  disabled="true" /> Yes
 					  <input type="radio" id="adhocLineN" name="adhocLine" value="N"  disabled="true" /> No  
 				  </td>
 				  <html:hidden property="adhocLine" />
 				  <%}
                  } } %>
                  <html:hidden property="adhocLine" />
                  
                  <td></td> <td></td>
                  
           </tr>
           
                <%if(request.getParameter("facilityType").equalsIgnoreCase("Funded")) { %>
                <tr class="odd">
                
                 <td class="fieldname">Priority Sector <%if(request.getParameter("facilityType").equalsIgnoreCase("Funded")) { %> <font color="#FF0000">*</font>  <%} %> </td>
                 
                  <td>
                  
                     <html:radio property="isPrioritySector" styleId="isPrioritySector" value="Yes" onclick="javascript : shwhdPSec(this);" value="Yes"/>Yes
  					 <html:radio property="isPrioritySector" styleId="isPrioritySector" value="No" onclick="javascript : shwhdPSec(this);" value="No" />No 
  					 <html:errors property="isPrioritySector"/>
				
				<div id="pSec_No" style="background:transparent;height:auto;border:0 none;display:none;">
   				<html:select property="prioritySector" styleId="prioritySector" >
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" descWithCode="false" />   
					</html:select>
				</div>
				<div id="pSec_Yes" style="background:transparent;height:auto;border:0 none;display:none;">
   				<html:select property="prioritySector" styleId="prioritySector">
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" descWithCode="false" />   
					</html:select>
				</div>
				<html:errors property="prioritySector"/>
				
					
				</td>
                  <td class="fieldname">&nbsp;</td>
                  <td><p>&nbsp;</p></td>
                </tr>
                <%}else{%>
					<html:hidden property="isPrioritySector" value="Blank"/>
				<% } %>
				<%if("METG".equals(formObj.getFacilitySystem())){%>
				<td class="fieldname">Banking Arrangement</td>
				<td>                  	
					<html:select property="bankingArrangement" disabled = "true" style="width:250px">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
					</html:select>
					<html:hidden property="bankingArrangement" />
				</td>
				<%}%>
                <script language="javascript">

                <%if(formObj.getIsRealEstateExposer() != null && formObj.getIsRealEstateExposer().equals("Yes")) { %>
    		   		document.forms[0].estateType[0].disabled =false;
    				document.forms[0].estateType[1].disabled =false;
    				document.forms[0].estateType[2].disabled =false;
    				document.getElementById('CommRE').style.display = 'none';
    				<%}else{%>
    				document.forms[0].estateType[0].disabled =true;
    				document.forms[0].estateType[1].disabled =true;
    				document.forms[0].estateType[2].disabled =true;
    				document.getElementById('CommRE').style.display = 'none';
    				<%}%>

				
                <%if(formObj.getInterestRateType() != null && formObj.getInterestRateType().equals("fixed")) { %>
               		document.getElementById('intRateFloatingMarginFlag').value='';
               		document.getElementById('intRateFloatingMargin').value='';	
               		document.getElementById('intRateFloatingRange').value='';	
               		document.getElementById('intRateFloatingType').value='';
               		document.getElementById('fixed').style.display = ''; 
               		document.getElementById('margin').style.display = 'none';
               	<%}%>
               	<%if(formObj.getInterestRateType() != null && formObj.getInterestRateType().equals("floating")) { %>
               		document.getElementById('fixed').style.display = 'none';
               		document.getElementById('margin').style.display = '';
               	<%}%>


                
            	<%if(formObj.getEstateType() != null && formObj.getEstateType().equals("Commercial Real estate")) { %>
			   		document.getElementById('CommRE').style.display = ''; 
			   	 <%}else{%>
			   		document.getElementById('CommRE').style.display = 'none';
			   	<%}%>

                
                 <% if(formObj.getIsPrioritySector() == null || formObj.getIsPrioritySector().equals("")){%>
               
					document.forms[0].prioritySector.readonly =true;
				 
				 <%}else if(formObj.getIsPrioritySector().equalsIgnoreCase("No")) { %>
					 document.getElementById('pSec_No').style.display = '';
					 document.getElementById('pSec_Yes').style.display = 'none'; 
					 
					 document.all.prioritySector[0].name='prioritySector';
				   	 	document.all.prioritySector[1].name='';	
				 <%}else if(formObj.getIsPrioritySector().equalsIgnoreCase("Yes")) { %>
					 document.getElementById('pSec_No').style.display = 'none';
					 document.getElementById('pSec_Yes').style.display = ''; 
					 
						document.all.prioritySector[1].name='prioritySector';   
				   	 	document.all.prioritySector[0].name='';
				   	 	
						
				 <%}%>
				 <% if(formObj.getIsRealEstateExposer() == null || formObj.getIsRealEstateExposer().equals("No")){%>
				 		shwhdRealEstateExposer('No');
				 <%}%>
				 <% if(formObj.getInterestRateType() == null || formObj.getInterestRateType().equals("")){%>
				 <%}else{
					 if(formObj.getInterestRateType().equals("fixed")){
				 %>			 
				 		document.getElementById('fixed').style.display = ''; 
		   				document.getElementById('margin').style.display = 'none';
				 <%}if(formObj.getInterestRateType().equals("floating")){%>
				 		document.getElementById('fixed').style.display = 'none';
			   			document.getElementById('margin').style.display = '';
				 <%} }%>
				 
				 </script>
				 
        <%if(  "UBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem()) 
        	//|| "FCUBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem())
           ||  "BAHRAIN".equalsIgnoreCase(formObj.getFacilitySystem())  
           ||  "HONGKONG".equalsIgnoreCase(formObj.getFacilitySystem()) 
           ||  "GIFTCITY".equalsIgnoreCase(formObj.getFacilitySystem())      ) { 
          %>
             <tr class="odd">
            <td class="fieldname" >Co-borrower Details </td>
            
            <td colspan="3">
	             <table><tbody>
	         
	             <tr>
	             <td  class="fieldname" colspan="2">Co-Borrower Liab Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	              <td >  <html:select property="coBorrowerId" styleId= "coBorrowerId" style="width:250">
		      		   <option value="" selected="selected">Please Select </option>	
		      		    <html:options collection="facCoBorrowerList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
                    </td> 
                     <% 
					if("false".equalsIgnoreCase(wsCall)  ){ 					
					%>
                     <td>  <input type="button" id="fetchCoBorrower" disabled="disabled"  value="Fetch Co-Borrower Name" class="btnNormal" onclick="fetchCoBorrowerNameWS()" />
                     </td>
                <% }else{%>
                    <td>  <input type="button" id="fetchCoBorrower"  value="Fetch Co-Borrower Name" class="btnNormal" onclick="fetchCoBorrowerNameWS()" />
                    </td>
                <% }%>
	             </tr>
	             
	             <tr>
	             <td  class="fieldname" colspan="2">Co-Borrower Name                        </td>
	             <td ><input type="text" style="width:250" property="coBorrowerName" id="coBorrowerName"></td> 
	             <td>  <input type="button" id="addBorrower"  value="Add" class="btnNormal" onclick="addCoBorrower()" />
                    </td>
	             </tr>
	             </tbody>
	             </table>
		       </td>
            </tr>
            
            <tr id="addCountryDetails">
   <td class="fieldname"></td>
							<td colspan="6">
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr> <span id="restCoBorrowerListError"></span></tr>
									<tr>
										<td>Sr No</td>
										<td>Co-Borrower Liab Id </td>
										<td>Co-Borrower Name</td>
										<td>Action</td>
									</tr>
								</thead>
								 <tbody>
									<logic:present name="restCoBorrowerList">
										<logic:iterate id="ob" name="restCoBorrowerList"
											type="com.integrosys.cms.app.customer.bus.OBLimitXRefCoBorrower"
											 scope="page">
											<%
												String rowClass = "";
														vno++;
														rowClass = "odd";
										%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getCoBorrowerName()%>&nbsp;</center>
												<%-- <html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/> --%>
												</td>
												 <td><a href="javascript:deleteRestCoBorrower('<%=ob.getCoBorrowerId()%>','<%=vno%>')">Delete</a></td>
											</tr> 
										</logic:iterate>
									</logic:present>
										<%if(restCoBorrowerList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody> 
							</table>
							</td>
						</tr>
						 <%} %>
        	                <tr class="even">
                  <td class="fieldname">Security 1</td>
                  <td>
                   <html:select property="security1" value="<%=formObj.getSecurity1() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subSecurityList" labelProperty ="label" property ="value" />								                   
					</html:select>
                  </td>
                  <td class="fieldname">Security 2</td>
                  <td><p>
                    <html:select property="security2" value="<%=formObj.getSecurity2() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subSecurityList" labelProperty ="label" property ="value" />								                   
					</html:select>
                  </p></td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Security 3</td>
                  <td>
                 <html:select property="security3" value="<%=formObj.getSecurity3() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subSecurityList" labelProperty ="label" property ="value" />								                   
					</html:select>
                  </td>
                  <td class="fieldname">Security 4</td>
                  <td><p>
                   <html:select property="security4" value="<%=formObj.getSecurity4() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subSecurityList" labelProperty ="label" property ="value" />								                   
					</html:select>
                  </p></td>
                  </tr>
                  <tr class="odd">
                  <td class="fieldname">Security 5</td>
                  <td>
                 <html:select property="security5" value="<%=formObj.getSecurity5() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subSecurityList" labelProperty ="label" property ="value" />								                   
					</html:select>
                  </td>
                  <td class="fieldname">Security 6</td>
                  <td><p>
                    <html:select property="security6" value="<%=formObj.getSecurity6() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subSecurityList" labelProperty ="label" property ="value" />								                   
					</html:select>
                  </p></td>
                  </tr>
                  <%// SimpleDateFormat sdf = new SimpleDateFormat("dd-Mon-yy");
                 // String createdOn = "";
                 // String updatedOn = "";
                 // if(formObj.getCreatedOn()!=null && !"".equals(formObj.getCreatedOn())){
				//	 createdOn =	sdf.parse(formObj.getCreatedOn().toString()).toString();
                 // }
                // if(formObj.getUpdatedOn()!=null && !"".equals(formObj.getUpdatedOn())){
				//	 updatedOn =	sdf.parse(formObj.getUpdatedOn().toString()).toString();
                //  }
                   %>
                   
       </tbody>
      </table>
     </td>
    </tr>
    <tr>
     <td>
      &nbsp;
     </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  
    
   </tbody>
  </table>
     <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
     <tr> 
     <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
  <tr class="odd">
                  <td class="fieldname">Created/Edited By</td>
                  <td>
               
                 <integro:empty-if-null value="<%=formObj.getCreatedBy()%>"/>
                  </td>
                  <td class="fieldname">Approved By</td>
                  <td>  
                   
                     <integro:empty-if-null value="<%=formObj.getUpdatedBy()%>"/>
                    </td>
                  </tr>
      <tr class="odd">
                  <td class="fieldname">Created/Edited On</td>
                  <td>
                  <integro:empty-if-null value="<%=formObj.getCreatedOn()%>"/>
               
                  </td>
                  <td class="fieldname">Approved On</td>
                  <td>   

 <integro:empty-if-null value="<%=formObj.getUpdatedOn()%>"/>
</td>
                                         <html:hidden name="XRefDetailForm" property="coBorrowerId" styleId="coBorrowerId"/> 
                                         <html:hidden name="XRefDetailForm" property="coBorrowerName" styleId="coBorrowerName"/> 
                  </tr>
              </table>
               </td>
                  </tr></table>
  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:submitAccount()"><img src="img/ok1.gif" border="0" /></a></td>
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>
    <div id="fcubsCoBorrowerResponceText" style="display: none"  /> 
  
 </html:form>
</body>