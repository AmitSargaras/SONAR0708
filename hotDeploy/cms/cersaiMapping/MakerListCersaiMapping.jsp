<%@ page import="  com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                com.integrosys.cms.ui.cersaiMapping.CersaiMappingMapper,
                com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction,
                com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping,
                com.integrosys.cms.app.cersaiMapping.bus.OBCersaiMapping,
                java.util.regex.Matcher,
				java.util.regex.Pattern,
				com.integrosys.cms.asst.validator.ASSTValidator,
                 java.util.*"%>
           
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
CersaiMappingForm cersaiMappingForm = (CersaiMappingForm) request.getAttribute("CersaiMappingForm");
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
List masterNameList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterNameList");
String mastername = (String)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterName");
if(mastername != null){
	if(mastername.equalsIgnoreCase("FACILITY_CATEGORY")){
		mastername="Facility Category";
	}else if(mastername.equalsIgnoreCase("Entity")){
		mastername = "Entity";
	}else if(mastername.equalsIgnoreCase("PROPERTY_TYPE")){
		mastername = "Property Type";
	}
}

if(mastername == null){
	mastername=cersaiMappingForm.getMasterName();
}
System.out.println("xxxxxxxxxxxxxxxxxxxxxxxx CersaiMappingForm Is ==="+cersaiMappingForm);
String masterListFlag = (String)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterListFlag");
System.out.println("masterListFlag is ===///**--++//*=====  "+masterListFlag);

ICersaiMapping[] masterValueList1 = (ICersaiMapping[])session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueList");
String event = (String)request.getParameter("event");
System.out.println("event is ===///**--++//*=====  "+event);
if(event.equalsIgnoreCase("submit") || event.equalsIgnoreCase("list_pagination")){
	masterListFlag="Y";
}

        if (!(mastername == null)) {
    		pageContext.setAttribute("masterName", mastername);
    		session.setAttribute("masterName", mastername);
    		}
        
        if (!(masterListFlag == null)) {
    		pageContext.setAttribute("masterListFlag", masterListFlag);
    		session.setAttribute("masterListFlag", masterListFlag);
    		 
    		}

        if (!(masterValueList1 == null)) {
        	System.out.println("<<<<<<xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx>>>>>>"+masterValueList1);
    		pageContext.setAttribute("masterValueList", masterValueList1);
    		session.setAttribute("masterValueList", masterValueList1);
    		 
    		}
        
        if (!(masterNameList == null)) {
        	System.out.println("<<<<<<xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx>>>>>>"+masterNameList);
    		pageContext.setAttribute("masterNameList", masterNameList);
    		session.setAttribute("masterNameList", masterNameList);
    		}

        ICersaiMapping ic=new OBCersaiMapping();
        int arrSize=4;
        String nameMaster=mastername;

String fromPage = (String) request.getAttribute("frompage");
if (fromPage == null) {
    fromPage = request.getParameter("frompage");
}

 int sno = 0;
 int startIndex = 0;
String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);

DefaultLogger.debug(this, "fromPage >>>>>>>>>> " + fromPage);
DefaultLogger.debug(this, "startIndex >>>>>>>>>> " + startIndex);
int counter = 0;

SearchResult sr = (SearchResult)request.getAttribute("listOfMasterValue");
List listOfMasterValue1=null;
if(sr!=null){
	 listOfMasterValue1 = new ArrayList(sr.getResultList());
		pageContext.setAttribute("listOfMasterValue",listOfMasterValue1);
		session.setAttribute("listOfMasterValue", listOfMasterValue1);
	}

String masterNameOfPagination="";
String mname="";
if(mastername != null){
masterNameOfPagination=mastername;

if(masterNameOfPagination.equalsIgnoreCase("Facility Category")){
	mname="Facility Category";
}else if(masterNameOfPagination.equalsIgnoreCase("Entity")){
	mname = "Entity";
}else if(masterNameOfPagination.equalsIgnoreCase("Property Type")){
	mname = "Property Type";
}
}


ICersaiMapping[] masterValueForArray = (ICersaiMapping[])session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueOfValue");

ICersaiMapping[] masterValueForArrayNew=(ICersaiMapping[])request.getAttribute("masterValueOfValue");

if(masterValueForArray != null){
for(int i=0;i<masterValueForArray.length;i++){
String m=masterValueForArray[i].getClimsValue();
String n=masterValueForArray[i].getCersaiValue();
System.out.println(" masterValueForArray VVVAAALLL === "+m+"   CER VVAALL === "+n);
}
}

if(!event.equals("submit")){
	cersaiMappingForm.setStatus(ind);
	System.out.println("Number before Load "+cersaiMappingForm.getStatus());
}else{
	System.out.println("Number After Load "+cersaiMappingForm.getStatus());
	if(!cersaiMappingForm.getStatus().equals("") && !cersaiMappingForm.getStatus().equals(null)){
	startIndex=Integer.parseInt(cersaiMappingForm.getStatus());
	ind=cersaiMappingForm.getStatus();
	}
}
%>

<head>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">


var delete_cookie = function(name) {
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
};

function MM_swapImgRestore() { //v3.0
	var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

	function MM_preloadImages() { //v3.0
	var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}

	function MM_findObj(n, d) { //v4.01
	var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	if(!x && d.getElementById) x=d.getElementById(n); return x;
	}

	function MM_swapImage() { //v3.0
	var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}

	function gotopage() {
	    window.location = "Welcome.do";
	    //sessionStorage.removeItem('UpdatedValues');
		sessionStorage.clear();
		delete_cookie('mycookie');
	}

	function submitForm() {
		var elem = document.getElementById("changeValue");
	    if (elem.value=="UPDATE ALL"){ 
	    	alert("Please first click 'UPDATE ALL' Button then click Submit.");
	    }else{
	    document.forms[0].action = "cersaiMapping.do?event=submit";
	    document.forms[0].submit();
	    sessionStorage.removeItem('UpdatedValues');
	    delete_cookie('mycookie');
	   }
	}
	
	var listOfCersaiValues1 = [];
	//var counts= 0;
	
	function change() 
	{
		var cersaiList =[];
		var st="<%=nameMaster%>";
		var climsLength=[];
		climsLength=document.getElementsByName("climsValues");
		var elem = document.getElementById("changeValue");
	    if (elem.value=="EDIT ALL"){ 
	    	elem.value = "UPDATE ALL"; 
	    	//counts++;
	    	
	    	// if (elem.innerHTML=="EDIT ALL"){ 
		    //	elem.innerHTML = "UPDATE ALL"; 
	    	
	    	for(var i=1;i<=climsLength.length;i++){
	    	document.getElementById("editBtn"+i).value="Update";
	    	// document.getElementById("readClimsValue"+i).disabled = false;
	    	//document.getElementById("readClimsValue"+i).readOnly = true;
	    	//document.getElementById("editCersaiValue"+i).disabled = false;
	    	//document.getElementById("editCersaiValue"+i).readOnly = false; 
	    	
	    	//document.getElementById("editBtn"+i).innerHTML="Update";
	    	document.getElementById("readClimsValue"+i).removeAttribute("disabled");
	    	document.getElementById("editCersaiValue"+i).removeAttribute("disabled");
	    	document.getElementById("editCersaiValue"+i).removeAttribute("readOnly");
	    	document.getElementById("readClimsValue"+i).setAttribute("readOnly","readonly");
	    	cersaiList.push(document.getElementById("editCersaiValue"+i).value);
	    	//if(counts === 1){
	    		listOfCersaiValues1 = cersaiList;
	    //	}
	    	///document.getElementById("editCersaiValue"+i).value = "";
	    	//document.getElementById("editCersaiValue"+i).innerHTML = "";
	    	
	    	//document.getElementById("editCersaiValue"+i).style.backgroundColor = "white";
	    	}
	    	//for(var i=1;i<=climsLength.length;i++){
	    	//	alert(listOfCersaiValues1[i-1]);
	    	//}
	    }
	    else {
	    	elem.value = "EDIT ALL";
	    	
	    	for(var i=1;i<=climsLength.length;i++){
	    		cersaiList.push(document.getElementById("editCersaiValue"+i).value);
	    	}
	    	//for(var i=1;i<=climsLength.length;i++){
	    	//	alert(cersaiList[i-1]);
	    	//}
	    	
	    	//elem.innerHTML = "EDIT ALL";
	    	for(var i=1;i<=climsLength.length;i++){
	    		var enteredValue=document.getElementById("editCersaiValue"+i).value;
	    		var checkCersaiVal = listOfCersaiValues1[i-1];
	    		//var enteredValue=document.getElementById("editCersaiValue"+i).innerHTML;
	    		//if(enteredValue.trim()==""){
	    			if(!Boolean(enteredValue) || enteredValue === checkCersaiVal){
	    			
	    		
		    		// document.getElementById("editCersaiValue"+i).disabled = true;
		    		//document.getElementById("readClimsValue"+i).disabled = true;
			    	//document.getElementById("readClimsValue"+i).readOnly = false; 
			    	
			    	document.getElementById("readClimsValue"+i).removeAttribute("readOnly");
			    	document.getElementById("editCersaiValue"+i).setAttribute("disabled","disabled");
			    	document.getElementById("readClimsValue"+i).setAttribute("disabled","disabled");
		    	}else{
		    		// document.getElementById("editCersaiValue"+i).readOnly = true;
		    		//document.getElementById("readClimsValue"+i).disabled = false;
			    	//document.getElementById("readClimsValue"+i).readOnly = true; 
			    	
			    	document.getElementById("readClimsValue"+i).removeAttribute("disabled");
			    	document.getElementById("editCersaiValue"+i).setAttribute("readOnly","readonly");
			    	document.getElementById("readClimsValue"+i).setAttribute("readOnly","readonly");
		    	}
	    		document.getElementById("editBtn"+i).value="Edit";
	    		//document.getElementById("editBtn"+i).innerHTML="Edit";
	    	}
	    }
	}
	
	var cersaiValchk;
	
function changeEditUpdate(num){
		var elem = document.getElementById("editBtn"+num);
		
	    if (elem.value=="Edit")
	    //	 if (elem.innerHTML=="Edit")
	    { 
	    	elem.value = "Update";
	    	
	    	//elem.innerHTML = "Update";
	    	// document.getElementById("editCersaiValue"+num).disabled = false;
	    	//document.getElementById("editCersaiValue"+num).readOnly = false;
	    	
	    	//document.getElementById("readClimsValue"+num).disabled = false;
	    	//document.getElementById("readClimsValue"+num).readOnly = true; 
	    	//document.getElementById("editCersaiValue"+num).style.backgroundColor = "white";
	    	//document.getElementById("editCersaiValue"+num).value = "";
	    	
	    	document.getElementById("editCersaiValue"+num).removeAttribute("disabled");
	    	document.getElementById("editCersaiValue"+num).removeAttribute("readOnly");
	    	document.getElementById("readClimsValue"+num).removeAttribute("disabled");
	    	document.getElementById("readClimsValue"+num).setAttribute("readOnly","readonly");
	    	//document.getElementById("editCersaiValue"+num).value = "";
	    	//document.getElementById("editCersaiValue"+num).innerHTML = "";
	    	cersaiValchk = document.getElementById("editCersaiValue"+num).value;
	    }
	    else{
	    	var enteredValue=document.getElementById("editCersaiValue"+num).value;
	    	//var enteredValue=document.getElementById("editCersaiValue"+num).innerHTML;
	    	//alert(" ok.. "+enteredValue);
	    	
	    	elem.value = "Edit";
	    	//elem.innerHTML = "Edit";
	    	//if(enteredValue.trim()==""){
	    		if(!Boolean(enteredValue) || enteredValue === cersaiValchk){
	    		// document.getElementById("editCersaiValue"+num).disabled = true;
	    		//document.getElementById("readClimsValue"+num).disabled = true;
		    	//document.getElementById("readClimsValue"+num).readOnly = false;
		    	
		    	document.getElementById("editCersaiValue"+num).setAttribute("disabled","disabled");
		    	document.getElementById("readClimsValue"+num).setAttribute("disabled","disabled");
		    	document.getElementById("readClimsValue"+num).removeAttribute("readOnly");
	    	}else{
	    		// document.getElementById("editCersaiValue"+num).readOnly = true;
	    		//document.getElementById("readClimsValue"+num).disabled = false;
		    	//document.getElementById("readClimsValue"+num).readOnly = true;
		    	
		    	document.getElementById("editCersaiValue"+num).setAttribute("readOnly","readonly");
		    	document.getElementById("readClimsValue"+num).removeAttribute("disabled");
		    	document.getElementById("readClimsValue"+num).setAttribute("readOnly","readonly");
	    	}
	    	
	    }
	}
	
	function generateMasterValueList(dropdown) {

		var curSel = "";
		for (i = 0; i < dropdown.options.length; i++) {
			if (dropdown.options[i].selected == true) {
				curSel = dropdown.options[i].value;
			}
		}
		if (curSel != "") {
			document.forms[0].action = "cersaiMapping.do?event=maker_list_cersai_mapping_on_select_master";
			document.forms[0].submit();
		}
	}
	
	
	var createCookie = function(name, value) {
	    document.cookie = name + "=" + value +";";
	}
	
	var arr=[];
	var storedArray=[];
	var staticArray=[];
	var event1='<%=event%>';
	
	if(event1 == "submit"){
		staticArray=JSON.parse(sessionStorage.getItem("arrayReload"));
		arr=staticArray;
		
	}
	if(event1 == "maker_list_cersai_mapping" || event1 == "maker_list_cersai_mapping_on_select_master"){
		sessionStorage.clear();
	}
	if(event1 == "submit"){
		staticArray=JSON.parse(sessionStorage.getItem("arrayReload"));
		arr=staticArray;
		
	}
	if(event1 == "list_pagination"){
		
		staticArray=JSON.parse(sessionStorage.getItem("arrayReload"));
		if(staticArray != null){
			arr=staticArray;
		 	window.sessionStorage.setItem("UpdatedValues", JSON.stringify(arr));
		}
	}

	function myFunction(val,num) {
		  
		  var climVal="";
		  climVal=document.getElementById("readClimsValue"+num).value;
		  //alert(climVal);
			
		if(arr == null || arr.length <= 0){
			  storedArray = JSON.parse(sessionStorage.getItem("UpdatedValues"));
			  
			  var i;
			  if(storedArray !=null){
			  for (i = 0; i < storedArray.length; i++) {
			  }
			  arr=storedArray.slice();
			  }}
		
		if(arr !=null || arr.length > 0){
		for(var j=0;j<arr.length;j++){
			
			if(arr[j].Clims_Value == climVal){
				arr.splice( j,1);
			}
		}
		
		if(val.trim()==""){
			val="";
		}else{
			val.trim();
		}
		arr.push({
		    "Clims_Value": climVal,
		    "Cersai_Value": val
		});
		}
		
		  
		  if(arr != null){
		  for(var l=0;l<arr.length;l++){
		  }
		  window.sessionStorage.setItem("arrayReload", JSON.stringify(arr));
		  if(event1 != "submit"){
			  staticArray=arr;
			  window.sessionStorage.setItem("arrayReload", JSON.stringify(staticArray));
		  }
		  window.sessionStorage.setItem("UpdatedValues", JSON.stringify(arr));
		  
		  var json_str = JSON.stringify(arr);
			createCookie('mycookie', json_str);
		  }
		}

	function cersaiFunction(num){
		var arryStore=JSON.parse(sessionStorage.getItem("UpdatedValues"));
		var valClim=document.getElementById("readClimsValue"+num).value;
		var i;
		  if(arryStore !=null){
		  for (i = 0; i < arryStore.length; i++) {
			  
		      if(valClim == arryStore[i].Clims_Value){
		    	  document.getElementById("editCersaiValue"+num).value=arryStore[i].Cersai_Value;
		      }
		  }
		  }}
		  
	function cersaiFunction1(num){
		var number=num+10;
		var arryStore=[];
		if(event1 == "submit"){
			arryStore=JSON.parse(sessionStorage.getItem("arrayReload"));
		}else{
			arryStore=JSON.parse(sessionStorage.getItem("UpdatedValues"));
		}
		for(var k=0;k<number;k++){
		var valClim=document.getElementById("readClimsValue"+num).value;
		var i;
		  if(arryStore !=null){
		  for (i = 0; i < arryStore.length; i++) {
			  
		      if(valClim == arryStore[i].Clims_Value){
		    	document.getElementById("editCersaiValue"+num).value=arryStore[i].Cersai_Value;
		    	  if((arryStore[i].Cersai_Value != null) && ((arryStore[i].Cersai_Value).trim() != "")){
		    	// document.getElementById("editCersaiValue"+num).readOnly = true;
		    	//document.getElementById("editCersaiValue"+num).disabled = false;
		    	//document.getElementById("readClimsValue"+num).disabled = false;
			    //document.getElementById("readClimsValue"+num).readOnly = true; 
			   
			    
			    document.getElementById("editCersaiValue"+num).setAttribute("readOnly","readonly");
			    document.getElementById("editCersaiValue"+num).removeAttribute("disabled");
		    	document.getElementById("readClimsValue"+num).removeAttribute("disabled");
		    	document.getElementById("readClimsValue"+num).setAttribute("readOnly","readonly");
		    	  }else{
		    		  // document.getElementById("editCersaiValue"+num).readOnly = false;
				    	//document.getElementById("editCersaiValue"+num).disabled = true;
				    	//document.getElementById("readClimsValue"+num).disabled = true;
					    //document.getElementById("readClimsValue"+num).readOnly = false; */
					    
					    document.getElementById("editCersaiValue"+num).setAttribute("disabled","disabled");
					    document.getElementById("editCersaiValue"+num).removeAttribute("readOnly");
				    	document.getElementById("readClimsValue"+num).removeAttribute("readOnly");
				    	document.getElementById("readClimsValue"+num).setAttribute("disabled","disabled");
		    	  }
		      }
		  }
		  }
		  num++;
		  }}
	
</script>
</head>
<html:form action="cersaiMapping.do">
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <h3>CERSAI Mapping</h3>
    </td>
  </tr>
  <tr>
    <td><hr /></td>
  </tr>
  </thead>
  <tbody>
  <%if(event.equals("list_pagination") || event.equals("submit")){  %>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      <tr class="even">
          <td class="fieldname" width="29%">Master Name&nbsp;<font color="red">* </font></td>
          <td width="71%">
               <html:select onchange="javascript:generateMasterValueList(this)" property="masterName" >
         				<html:option value=""><%=mname%></html:option>
                  		<html:options collection="masterNameList" property="value"  labelProperty="label"/>
                </html:select>
                <html:errors property="masterName"/>
                <html:hidden property="masterName"/>
                     
            </td>
        </tr>
      </table>
    </td>
    </tr>
    <%}else{ %>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      <tr class="even">
          <td class="fieldname" width="29%">Master Name&nbsp;<font color="red">* </font></td>
          <td width="71%">
               <html:select onchange="javascript:generateMasterValueList(this) "property="masterName" >
         				<html:option value="">Please Select</html:option>
                  		<html:options collection="masterNameList" property="value"  labelProperty="label"/>
                </html:select>
                <html:errors property="masterName"/>
                <html:hidden property="masterName"/>
                     
            </td>
        </tr>
      </table>
    </td>
    </tr>
    <%} %>
      <tr >
   <%if(masterListFlag.equals("Y")){  %>
   
                <td colspan="3" valign="top" style="height:100%;width:100%;">
                    <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px">
                      
                      <thead>
                      <tr style="position: absolute; right:300;">
                        <td>
                          <INPUT TYPE="BUTTON" VALUE="EDIT ALL" style=" width:100px" id="changeValue" onclick="change()">
                          <html:errors property="updateatleastonevalue"/>
                        </td>
                   
                      </tr>
                      <tr>
                        <td></td>
                      </tr>
                      </thead>
                      
                      
                      <thead>
                      <tr>
                        <td width="24%">
                          <h3><%=mastername%></h3>
                        </td>
                  <td width="76%" valign="bottom">
<!--                         <strong>Access Country:</strong>-->

                        </td>  
                      </tr>
                      <tr>
                        <td colspan="2"> <hr /></td>
                      </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td  colspan="2">
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="5%">S/N</td>                            
                              <td width="40%">CLIMS Value</td>
                              <td width="45%" nowrap="nowrap">CERSAI Value</td>
                              <td width="10%">Action</td>
                               <!--<td width="5%">Obsolete</td>-->
                            </tr>
                            </thead>
                         
                 
					 <logic:present name="masterValueList">
					  <logic:iterate length="10"  offset="<%=String.valueOf(startIndex)%>" indexId="counter1"
                     id="OB" name="masterValueList" type="com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping" scope="session" >
					  
                   <%
                       String rowClass = "";
                       counter++;
                       if ( counter%2 != 0 ) {
                           rowClass = "odd";
                       } else {
                           rowClass = "even";
                       }
                       
                       Cookie[] cookies = request.getCookies();
                       
                       if (cookies != null) {
                        for (Cookie cookie : cookies) {
                          if (cookie.getName().equals("mycookie")) {
                        	  for (int i = 0; i < cookies.length; i++) {
                        		    Cookie c = cookies[i];
                        		    
                        		    if(cookies[i].getName().equals("mycookie")){
                        		    	Cookie c1=cookies[i];
                        		    String drr=(c1.getValue());
                        		    String [] drr1=drr.split(",");
                        		    int ct=0;
                        		    //System.out.println("masterValueForArray.length"+masterValueForArray.length);
                        		    for(int d=0;d<masterValueForArray.length;d++){
                        		    	masterValueForArray[d].setClimsValue(null);
                        		    	masterValueForArray[d].setCersaiValue(null);
                        		    }
                        		    
                        		    for(int k=0;k<drr1.length;k++){
                        		    	drr1[k]=drr1[k].replace("[","");
                        		    	drr1[k]=drr1[k].replace("]","");
                        		    	drr1[k]=drr1[k].replace("{","");
                        		    	drr1[k]=drr1[k].replace("}","");
                        		    	String[] dr=drr1[k].split(":");
                        		    	String tr=dr[1];
                        		    	tr=tr.replace("\"","");
                        		    	if(k%2==0){
                        		    		masterValueForArray[ct].setClimsValue(tr);
                        		    		//System.out.println("--- "+tr);
                        		    	}else{
                        		    		masterValueForArray[ct].setCersaiValue(tr);
                        		    		//System.out.println("++++ "+tr);
                        		    		ct++;
                        		    	}
                        		    }
                        		    
                        		    	for(int p=0;p<masterValueForArray.length;p++){
                        		    	String m=masterValueForArray[p].getClimsValue();
                        		    	String n=masterValueForArray[p].getCersaiValue();
                        		    	//System.out.println(" masterValueForArray VVVAAALLL 222 === "+m+"   CER VVAALL === "+n);
                        		    	}
                        		    
                        	    		pageContext.setAttribute("masterValueOfValue", masterValueForArray);
                        	    		request.setAttribute("masterValueOfValue", masterValueForArray);
                        	    		session.setAttribute("masterValueOfValue", masterValueForArray);
                        	    		pageContext.setAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueOfValueService", masterValueForArray);
                        	    		session.setAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueOfValueService", masterValueForArray);
                        	    		request.setAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueOfValueService", masterValueForArray);
                        	  }
                        	}
                           }
                         }
                       }
                     
                  %>
                  <body onload="cersaiFunction1(<%=counter%>)"></body>
                  <tbody>
                    <tr class=<%=rowClass%>>
                      <td class="index" width="5%"><%=counter1.intValue()+1%></td>
                      <td width="45%">
                      <%
                      if(counter%2 == 0){
                      %>
                      <input value="<%=OB.getClimsValue()%>" style="width:362px;background-color:#E0E6E9;color:black;border-color:transparent;" name="updatedClimsValue" id="readClimsValue<%=counter%>" disabled/><input type="hidden" name="climsValues" value="<%=OB.getClimsValue()%>" />  
                      <%} else{ %>
                      <input value="<%=OB.getClimsValue()%>" style="width:362px;background-color:white;color:black;border-color:transparent;" name="updatedClimsValue" id="readClimsValue<%=counter%>" disabled/><input type="hidden" name="climsValues" value="<%=OB.getClimsValue()%>" /> 
                      <%} %>
                      </td>
                      <td width="40%">
                       <%
                      if(counter%2 == 0){
                      %>
                <input type="text" name="updatedCersaiValue" value="<%=OB.getCersaiValue()%>" style="width:375px;background-color:#E0E6E9;color:black;" maxlength="200" id="editCersaiValue<%=counter%>" onblur="myFunction(this.value,<%=counter%>)" onchange="myFunction(this.value,<%=counter%>)"  style="width:370px;" disabled/>
            	<%} else{ %>
            	<input type="text" name="updatedCersaiValue" value="<%=OB.getCersaiValue()%>" style="width:375px;background-color:white;color:black;" maxlength="200" id="editCersaiValue<%=counter%>" onblur="myFunction(this.value,<%=counter%>)" onchange="myFunction(this.value,<%=counter%>)"  style="width:370px;" disabled/>
            	<%} %>
            	
            	<%  
            	
            	//if(cersaiMappingForm.getUpdatedCersaiValue() != null){
				//	for(int i=0;i < cersaiMappingForm.getUpdatedCersaiValue().length;i++){
				//		if(cersaiMappingForm.getUpdatedCersaiValue()[i].equals(OB.getCersaiValue())){
							//System.out.println("2222=== "+cersaiMappingForm.getUpdatedCersaiValue()[i]);
            	%>
            	<html:errors property="cersaiValueSameError"/> 
            	<%
            	//break;
					//	}
					//}}
            	
            	  if(cersaiMappingForm.getUpdatedCersaiValue() != null){
					for(int i=0;i < cersaiMappingForm.getUpdatedCersaiValue().length;i++){
						if(cersaiMappingForm.getUpdatedClimsValue()[i].equals(OB.getClimsValue())){
							if(cersaiMappingForm.getUpdatedCersaiValue()[i].equals(OB.getClimsValue())){
            	%>
            	<html:errors property="cersaiValueSameBothValueError"/> 
            	<%
            	
							}
						}
					}}
            	
            	
            	if(cersaiMappingForm.getUpdatedCersaiValue() != null){
            		for(int j=0;j < cersaiMappingForm.getUpdatedCersaiValue().length;j++){
						if(OB.getClimsValue().equals(cersaiMappingForm.getUpdatedClimsValue()[j])){
						
            		//System.out.println("8888888 ==== "+cersaiMappingForm.getUpdatedClimsValue()[j]);
            		boolean codeFlag = ASSTValidator.isValidAlphaNumStringWithSpace(cersaiMappingForm.getUpdatedCersaiValue()[j]);
					if (codeFlag == true) {
						//System.out.println("getUpdatedCersaiValue  ==== "+cersaiMappingForm.getUpdatedCersaiValue()[j]);
					%>
					<html:errors property="cersaiValueError"/>
					<% 
					}}}}
            	%>
            </td>  
               <%--        <td width="40%"> <html:text  property="cersaiValue" value="<%=entry.getValue().toString()%>"></html:text></td>            --%>      
                      <td width="10%">
                      <%
                      if(counter%2 == 0){
                      %>
                      <a>
                      <input value="Edit" lineLength="40" id="editBtn<%=counter%>" onclick="changeEditUpdate(<%=counter%>)" style="color:blue; text-decoration: underline;background-color:#E0E6E9;color:blue;" readonly/></a>
                      <%} else{ %>
                      <input value="Edit" lineLength="40" id="editBtn<%=counter%>" onclick="changeEditUpdate(<%=counter%>)" style="color:blue; text-decoration: underline;background-color:white;color:blue;" readonly/></a>
                      <%} %>
                      </td>
                    </tr>
                    
                              </tbody>
                              </logic:iterate>
                              <% if (counter == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <%} %>
                              </logic:present>
                 <logic:notPresent name="masterValueList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                             
                          </table>
                        </td>
                        </tr>
                      </tbody>
                    </table>
				</td>
          <%} %> 
          </tr>
             
              <logic:present name="masterValueList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table  width="100%" border="0" cellspacing="0" cellpadding="0">
                         
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, masterValueList1.length)%>"
					                            url="cersaiMapping.do?event=list_pagination&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					
                      </table>
                 </td>
              </tr>
              </logic:present>
                 
              
    </tbody>
  </table>
  
   <html:hidden name="CersaiMappingForm" property="createBy"/>
 <html:hidden name="CersaiMappingForm" property="lastUpdateBy"/>
  <html:hidden name="CersaiMappingForm" property="lastUpdateDate"/>
    <html:hidden name="CersaiMappingForm" property="creationDate"/>
     <html:hidden name="CersaiMappingForm" property="status"/>
    
  
  <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td width="75" valign="baseline" align="center">
            <!-- <a href="Welcome.do" onclick="gotopage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/cancel1.gif',1)"><img src="img/cancel1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a> -->
			<center><a
				href="#" onclick="gotopage()" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
				<img
				src="img/cancel1.gif" name="Image2" width="70" height="22"
				border="0" id="Image2" />
			</a> &nbsp;<center>
		</td>
		<%
		if(!event.equals("maker_list_cersai_mapping")){
		%>
        <td width="75" valign="baseline" align="center">
            <a href="#" onClick="submitForm()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a></td>
            
         <% } %>
            <td width="75" valign="baseline" align="center">
           <!--  <a href="#" onclick="goBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a> -->
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

  </html:form>