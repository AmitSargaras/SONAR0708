<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.discrepency.DiscrepencyAction,com.integrosys.cms.ui.discrepency.DiscrepencyForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.Collection,java.util.List"%>
<%
HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.selectedArrayMap");
String maxDiscrepanciesString= PropertyManager.getValue("discrepancy.maxSubmit.value");
int maxDiscrepancies=0;
if(maxDiscrepanciesString!=null && !maxDiscrepanciesString.trim().equals("")){
	maxDiscrepancies=Integer.parseInt(maxDiscrepanciesString);
}


DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
String systemDate= df.format(new Date());

if(selectedArrayMap ==null){
	selectedArrayMap =new HashMap();
}


String mapValues="false";
if(selectedArrayMap.size()>0){
	mapValues="true";
}
	String startIndex = (String) request.getAttribute("startIndex");
	String event = (String) request.getAttribute("event");
	
	int startIndexInn = 0;
	String ind = (String) request.getAttribute("startIndexInn");

	if (ind != null && (!ind.equals("")))
		startIndexInn = Integer.parseInt(ind);
	
	
	String id = (String) request.getAttribute("legalCustomerId");
	String context = request.getContextPath() + "/";
	DiscrepencyForm form = (DiscrepencyForm) request
			.getAttribute("DiscrepencyForm");
	
	if(form!=null){
		if(form.getCreationDate()!=null&& ! form.getCreationDate().trim().equals("")){
		systemDate=form.getCreationDate();
		}
	}
	//DiscrepencyForm form=new DiscrepencyForm();

	HashMap booleanFacMap = new HashMap();
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List allCreditApproverList = (List) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
	
	if (allCreditApproverList != null) {
		pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
	}
	ILimit[] limits = null;

	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	if (limitProfile != null) {

		limits = limitProfile.getLimits();
	}
	
	
	boolean hasFacility = true;
	int length = 0;
	if (limits != null) {
		length = limits.length;
	}
	String[] hiddenFacListSplit = new String[length];
	if (form.getHiddenList() != null && !form.getHiddenList().equals("")) {
		String hiddenFacilityList = form.getHiddenList();
		String[] hiddenFacilitySplit = hiddenFacilityList.split("-");
		//System.out.println(":::::::::::::::::::::::::hiddenFacilitySplit.length:::::::"+limits.length+":::::::hiddenFacListSplit:::::"+hiddenFacListSplit.length);
		if (hiddenFacListSplit.length != 0) {
			for (int i = 0; i < hiddenFacilitySplit.length; i++) {

				hiddenFacListSplit[i] = hiddenFacilitySplit[i];

			}
		}
		
		if (limits.length > 0 || limits != null) {
			for (int ab = 0; ab < limits.length; ab++) {
				long idFac = limits[ab].getLimitID();
				//System.out.println(":::::::::::::::::::::::::booleanFacMap :::::111111111::::"+hiddenFacilitySplit.length);
				for (int ac = 0; ac < hiddenFacilitySplit.length; ac++) {
					if (!hiddenFacilitySplit[ac].equals("")) {
						if (idFac == Long.parseLong(hiddenFacilitySplit[ac])) {
							booleanFacMap.put(String.valueOf(idFac),"true");
						}
					}
				}
			}
		}
	}
	String styleSelect = "none";
	if (form.getDiscrepencyType() != null) {
		if (form.getDiscrepencyType().equals("Facility")) {
			styleSelect = "";
		}
	}

	int counter = 0;
	int noofItems = 0;
	int index = 0;
	int sno = 0;
	int startInd = 0;

	ArrayList resultList = null;
	int totalCount = 0;
	int listSize = 0;

	resultList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.discrepancyCreateList");
	int indexId = resultList.size();
	ArrayList descList = new ArrayList();
	if(!resultList.isEmpty()){
		for(int i=resultList.size()-1;i>=0;i--){
			descList.add(resultList.get(i));
		}
	}
	//startInd = searchResult.getStartIndex();
	totalCount = resultList.size();
	//listSize = resultList.size();
	//pageContext.setAttribute("discrepencySize", Integer.toString(listSize));
	//System.out.println("*********************//////////// form descList -:"+ descList.size());
	if(!descList.isEmpty()){
		listSize = descList.size();
		pageContext.setAttribute("discrepencySize", Integer.toString(listSize));
		pageContext.setAttribute("discrepencyList", descList);
	}
	else
	{
		listSize = resultList.size();
		pageContext.setAttribute("discrepencySize", Integer.toString(listSize));
		pageContext.setAttribute("discrepencyList", resultList);
	}

	String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	boolean listExist = false;
	boolean maxDiscrepanciesReached = false;
	if (resultList.size() > 0) {
		listExist = true;
	}
	if (resultList.size() == maxDiscrepancies) {
		maxDiscrepanciesReached = true;
	}
	
	boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
			||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
			||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
			||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
			||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
			||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
%>
<%
	String searchstatus = (String) request.getAttribute("searchstatus");
	String discType = (String) request.getAttribute("discType");
	
	if (searchstatus == null) {
		searchstatus = "Please";
	}
	if (discType == null) {
		discType = "Please";
	}
System.out.println("********************--------------- searchstatus "+searchstatus);
%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><head>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<script language="JavaScript" type="text/JavaScript">
    function MM_swapImgRestore() { //v3.0
      var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
    }

    function MM_jumpMenu(targ,selObj,restore){ //v3.0
  	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  	  if (restore) selObj.selectedIndex=0;
  	 
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

    function showFacility()
    {
    	document.getElementById('mutlipleSelect').style.display = '';
    }

    function hideFacility()
    {
    	document.getElementById('mutlipleSelect').style.display = 'none';
        
    }

    function selectLists(){
        List = document.forms[0].selectedFacilityList;
        Append = document.forms[0].hiddenList;
        for (i=0;i<List.length;i++){
            List.options[i].selected = true;
           // alert("List.options[i].value :"+List.options[i].value+"Append.value"+Append.value)
          
            if(Append.value.search(List.options[i].value)==-1){
             //   alert("Appending........");
            Append.value = List.options[i].value + "-" + Append.value;
            }
            //alert(Append.value);
        }
    }
      
    function createDiscrepency()
 	{   
    	var c_value = "";
    	var list_exist=<%=listExist%>;
    	//alert(list_exist);

    	if(list_exist==true){
    	for (var i=0; i < document.forms[0].selected.length; i++)
    	  {
    	  if (document.forms[0].selected[i].checked)
    	    {
    	     c_value = c_value + document.forms[0].selected[i].value + "-";
    	     }
    	  }
  	  
    	document.forms[0].action = "Discrepency.do?event=maker_create_bulk_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType%>&startIndex=<%=startIndex%>";
        document.forms[0].submit();
  	  }else{
  			alert("Please Create Atleast One Discrepancy");
  	  	  }       
 	}
    
    function createTempDiscrepency()
 	{   
		var maxDiscrepanciesReached=<%=maxDiscrepanciesReached%>;
var maxDiscrepancies=<%=maxDiscrepancies%>;
     	if(maxDiscrepanciesReached==true){
     		alert("Maximum "+Math.abs(maxDiscrepancies)+" Discrepancies can be created at a time.");
         	
     	}else{
    	selectLists(); 
    	document.forms[0].action = "Discrepency.do?event=maker_create_discrepency_temp&searchstatus=<%=searchstatus%>&discType=<%=discType%>&startIndex=<%=startIndex%>";
        document.forms[0].submit();
     	}      
 	}

    function removeDiscrepency()
 	{   
    	//selectLists();
    	var mapValues =<%=mapValues%>; 
    	
    	var c_value = "";
    	var n_value="";
    	
	for (var i=0; i < document.forms[0].selected.length; i++) 
	  {
	  if (document.forms[0].selected[i].checked)
	    {
	     c_value = c_value + document.forms[0].selected[i].value + "-";
	     
	     }
	  else{
    	  n_value =n_value + document.forms[0].selected[i].value + "-";
      }
	     
	  }
	  
	  if(c_value!=""){
		   
			  document.forms[0].action      	= "Discrepency.do?selectId="+c_value+"&unCheckId="+n_value+"&startIndexInn=<%=startIndexInn%>";
		     	document.forms[0].event.value 	= "maker_remove_discrepency_temp";
		     	document.forms[0].submit(); 
		  
		  
	  }
	  else{ 
		  
		  if(mapValues){		  
		  
			  document.forms[0].action      	= "Discrepency.do?selectId="+c_value+"&unCheckId="+n_value+"&startIndexInn=<%=startIndexInn%>";
		     	document.forms[0].event.value 	= "maker_remove_discrepency_temp";
		     	document.forms[0].submit(); 
			  
			  }
	 
		  else {
			 
			  alert("Please Select Atleast One Discrepancy");
		  }

	  }
 		      
 	}



    function goPageIndex(targetOffset) {
    	//alert("targetOffset"+targetOffset);
    	var s_value="" ;
    	var n_value="" ;
    	
    		for (var i=0; i < document.forms[0].selected.length; i++)
    		   {
    		   if (document.forms[0].selected[i].checked)
    		      {
    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
    		      }
 		      else{
    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
    		      }
    		      
    		   }
    	

    	 //alert("s_value "+s_value);
    	 //alert("n_value "+n_value);
    	
    	document.forms[0].startIndexInn.value = targetOffset;
    	document.forms[0].selectedArray.value=s_value;
    	document.forms[0].unCheckArray.value=n_value;
    	document.forms[0].event.value = "maker_next_create_temp_list_discrepency";
    	document.forms[0].action="Discrepency.do?event=maker_next_create_temp_list_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType%>&checkId="+s_value+"&unCheckId="+n_value+"&startIndex=<%=startIndex%>&startIndexInn="+targetOffset;
        document.forms[0].submit();
    }

    

    function goView(viewId) {
    	//alert("viewId"+viewId);
    	var s_value="" ;
    	var n_value="" ;
    	
    		for (var i=0; i < document.forms[0].selected.length; i++)
    		   {
    		   if (document.forms[0].selected[i].checked)
    		      {
    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
    		      }
 		      else{
    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
    		      }
    		      
    		   }
    	

    	 //alert("s_value "+s_value);
    	 //alert("n_value "+n_value);
    	
    	//document.forms[0].startIndexInn.value = targetOffset;
    	//document.forms[0].selectedArray.value=s_value;
    	//document.forms[0].unCheckArray.value=n_value;
    	//document.forms[0].event.value = "maker_next_create_temp_list_discrepency";
    	document.forms[0].action="Discrepency.do?event=maker_view_discrepancy&discId="+viewId+"&searchstatus=<%=searchstatus%>&discType=<%=discType%>&checkId="+s_value+"&unCheckId="+n_value+"&startIndex=<%=startIndex%>&startIndexInn=<%=startIndexInn%>";
        document.forms[0].submit();
    }

    function goUpdate(viewId) {
    	//alert("viewId"+viewId);
    	var s_value="" ;
    	var n_value="" ;
    	
    		for (var i=0; i < document.forms[0].selected.length; i++)
    		   {
    		   if (document.forms[0].selected[i].checked)
    		      {
    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
    		      }
 		      else{
    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
    		      }
    		      
    		   }
    	

    	 //alert("s_value "+s_value);
    	 //alert("n_value "+n_value);
    	
    	//document.forms[0].startIndexInn.value = targetOffset;
    	//document.forms[0].selectedArray.value=s_value;
    	//document.forms[0].unCheckArray.value=n_value;
    	//document.forms[0].event.value = "maker_next_create_temp_list_discrepency";
    	document.forms[0].action="Discrepency.do?event=maker_update_temp_discrepancy&discId="+viewId+"&searchstatus=<%=searchstatus%>&discType=<%=discType%>&checkId="+s_value+"&unCheckId="+n_value+"&startIndex=<%=startIndex%>&startIndexInn=<%=startIndexInn%>";
        document.forms[0].submit();
    }
 	
    function goBack(){ 
    	document.forms[0].action = "Discrepency.do?event=return_list_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType%>&startIndex=<%=startIndex%>";
        document.forms[0].submit();
		
	}
    function checkedAll(){ 
    	var a =0;
    	if(document.getElementById("list11").checked){
    	for(var s=0;s<document.getElementsByName("selected").length;s++){
    	   document.getElementsByName("selected")[s].checked=true;
    	}
    	}else{
    		for(var s=0;s<document.getElementsByName("selected").length;s++){
    		   document.getElementsByName("selected")[s].checked=false;
    		}
    	}
    }

</script>
<style type="text/css">
.hiddenDiv {display: none;}.visibleDiv {display: block;	border: 1px grey solid;}.style1 {color: #FF0000}.style5 {color: #FF0000}.style11 {color: #FF0000}</style>
</head>
<body onload="hideFacility();">
<html:form action="/Discrepency">
	<html:hidden property="startIndex" />
	<html:hidden property="numItems" />
	<html:hidden property="event" />
		<input type="hidden" name="startIndexInn"  />
	<input type="hidden" name="searchstatus" value="<%=searchstatus%>" />
	<input type="hidden" name="discType" value="<%=discType%>" />
	<table width="100%" height="100%" border="0" align="center"
		cellpadding="0" cellspacing="0" class="tblFormSection"
		id="contentWindow">
		<tr height="95%">
			<td valign="top">
			<div id="contentCanvas" style="height: 100%; width: 100%;">
			<table width="96%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<tr>
					<td width="70%">
					<p class="required" ><font color="red">*</font> Mandatory for Submission&nbsp;</p>
					</td>
				</tr>
				
				<tr>
					<td width="70%">
					<h3>Create Discrepancy</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="tblInfo">
						<tbody>
							<tr>
								<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tblInput">
									<thead>
									</thead>
									<tbody>

										<%
										
											if (form.getDiscrepencyType() == null) {
										%>
										<tr class="odd">
											<td class="fieldname" width="20%">Type of Discrepancy</td>
											<td class="even" width="20%" colspan="3">General <input
												type="radio" name="discrepencyType" id="radio1"
												value="General" checked="checked" onclick="hideFacility()">
											Facility <input type="radio" name="discrepencyType"
												id="radio2" value="Facility" onclick="showFacility()">
											</td>
										</tr>
										<%
											} else {
													if (form.getDiscrepencyType().equals("Facility")) {
										%>
										<tr class="odd">
											<td class="fieldname" width="20%">Type of Discrepancy</td>
											<td class="even" width="20%" colspan="3">General <input
												type="radio" name="discrepencyType" id="radio1"
												value="General" onclick="hideFacility()"> Facility <input
												type="radio" name="discrepencyType" id="radio2"
												value="Facility" checked="checked" onclick="showFacility()">
											</td>
										</tr>
										<%
											} else {
										%>
										<tr class="odd">
											<td class="fieldname" width="20%">Type of Discrepancy</td>
											<td class="even" width="20%" colspan="3">General <input
												type="radio" name="discrepencyType" id="radio1"
												value="General" checked="checked" onclick="hideFacility()">
											Facility <input type="radio" name="discrepencyType"
												id="radio2" value="Facility" onclick="showFacility()">
											</td>
										</tr>
										<%
											}
												}
										%>

										<%
											if (form.getHiddenList() == null) {
										%>
										<tr class="even" id="mutlipleSelect" style="width: 260"
											style="display: <%=styleSelect%>">
											<td class="fieldname" width="20%">Facility <font
												color="#ff0000">*</font></td>
											<td width="30%"><html:select name="DiscrepencyForm"
												size="5" multiple="multiple" style="width:150"
												property="facilityList">
												<%
													if (limits != null) {

																	for (int i = 0; i < limits.length; i++) {
												%>
												<option value="<%=limits[i].getLimitID()%>"><integro:empty-if-null
													value="<%=limits[i].getFacilityName() %>" /></option>

												<%
													}
																}
												%>
											</html:select>
											<td><input type="button" name="Button"
												value="Add&gt;&gt;" style="width: 80"
												onclick="moveDualList(facilityList,selectedFacilityList, false),getOrgCodesByCtryCodes()"
												class="btnNormal" /> <br />
											<br />
											<input type="button" name="Button" value="&lt;&lt;Remove"
												style="width: 80"
												onclick="moveDualList(selectedFacilityList,facilityList,false),delOrgCodesByCtryCodes()"
												class="btnNormal" /></td>
											<td><html:select name="DiscrepencyForm" size="5"
												multiple="multiple" style="width:150"
												property="selectedFacilityList">
											</html:select> &nbsp;<br/><html:errors property="facilityError" /></td>
											
										</tr>
										<%
											} else {
										%>
										<tr class="even" id="mutlipleSelect" style="width: 260"
											style="display: <%=styleSelect%>">
											<td class="fieldname" width="20%">Facility <font
												color="#ff0000">*</font></td>
											<td width="30%"><html:select name="DiscrepencyForm"
												size="5" multiple="multiple" style="width:150"
												property="facilityList">
												<%
													if (limits != null) {

																	for (int i = 0; i < limits.length; i++) {
																		String availFac = (String) booleanFacMap
																				.get(String.valueOf(limits[i]
																						.getLimitID()));
																		if (!"true".equals(availFac)) {
												%>
												<option value="<%=limits[i].getLimitID()%>"><integro:empty-if-null
													value="<%=limits[i].getFacilityName() %>" /></option>

												<%
													}
																	}
																}
												%>
											</html:select>
											<td><input type="button" name="Button"
												value="Add&gt;&gt;" style="width: 80"
												onclick="moveDualList(facilityList,selectedFacilityList, false),getOrgCodesByCtryCodes()"
												class="btnNormal" /> <br />
											<br />
											<input type="button" name="Button" value="&lt;&lt;Remove"
												style="width: 80"
												onclick="moveDualList(selectedFacilityList,facilityList,false),delOrgCodesByCtryCodes()"
												class="btnNormal" /></td>
											<td><html:select name="DiscrepencyForm" size="5"
												multiple="multiple" style="width:150"
												property="selectedFacilityList">

												<%
													if (limits != null) {

																	for (int i = 0; i < limits.length; i++) {
																		String availFac = (String) booleanFacMap
																				.get(String.valueOf(limits[i]
																						.getLimitID()));
																		if ("true".equals(availFac)) {
												%>
												<option value="<%=limits[i].getLimitID()%>"><integro:empty-if-null
													value="<%=limits[i].getFacilityName() %>" /></option>

												<%
													}
																	}
																}
												%>


											</html:select> &nbsp; <br/><html:errors property="facilityError" /></td>
											
										</tr>

										<%
											}
										%>
										</tr>


										<tr class="odd">
											<td class="fieldname" width="20%">Creation Date<font
												color="red">*</font></td>
											<td class="even" width="20%"><html:text
												property="creationDate" name="DiscrepencyForm"
												readonly="true" value="<%=systemDate %>" /> <img src="img/calendara.gif"
												alt="calender" name="Image723" border="0" id="Image725"
												onclick="showCalendar('creationDate', 'dd/mm/y')"
												onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
												onmouseout="MM_swapImgRestore()" />&nbsp; <br />
											<html:errors property="creationDateError" /></td>

											<td class="fieldname" width="20%">Approved Date</td>
											<td class="even" width="20%"><html:text
												property="acceptedDate" name="DiscrepencyForm"
												readonly="true" /> <img src="img/calendara.gif"
												alt="calender" name="Image723" border="0" id="Image725"
												onclick="showCalendar('acceptedDate', 'dd/mm/y')"
												onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
												onmouseout="MM_swapImgRestore()" />&nbsp; <br />
											<html:errors property="acceptedDateError" /></td>
										</tr>
										<tr class="even">
											<td class="fieldname" width="20%">Original Target Date<font
												color="red">*</font></td>
											<td class="even" width="20%"><html:text
												property="originalTargetDate" name="DiscrepencyForm"
												readonly="true" /> <img src="img/calendara.gif"
												alt="calender" name="Image723" border="0" id="Image725"
												onclick="showCalendar('originalTargetDate', 'dd/mm/y')"
												onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
												onmouseout="MM_swapImgRestore()" />&nbsp; <br />
											<html:errors property="originalTargetDateError" /></td>

											<td class="fieldname" width="20%">Next Due Date</td>
											<td class="even" width="20%"><html:text
												property="nextDueDate" name="DiscrepencyForm"
												readonly="true" /> <img src="img/calendara.gif"
												alt="calender" name="Image723" border="0" id="Image725"
												onclick="showCalendar('nextDueDate', 'dd/mm/y')"
												onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
												onmouseout="MM_swapImgRestore()" />&nbsp; <br />
											<html:errors property="nextDueDateError" /></td>


										</tr>
										<tr class="odd">
											<td class="fieldname" width="20%">Critical</td>
											<td class="even" width="20%">Yes <input type="radio"
												name="critical" id="radio3" value="Yes"> No <input
												type="radio" name="critical" id="radio4" value="No"
												checked="checked"> <br />
											<html:errors property="criticalError" /></td>

											<td class="fieldname" width="20%">Credit Approver<font
												color="red">*</font></td>
											<td class="even" width="20%"><html:select
												property="approvedBy" name="DiscrepencyForm">
												<option value="">Please Select</option>
												<html:options collection="allCreditApproverList"
													labelProperty="label" property="value" />
											</html:select> <br />
											<html:errors property="approvedByError" /></td>
										</tr>

										<tr class="even">
											<td class="fieldname" width="20%">Discrepency<font
												color="red">*</font></td>
											<td class="even" width="20%" colspan="3"><html:select
												property="discrepency" name="DiscrepencyForm">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>"
													descWithCode="false" />
											</html:select> <br />
											<html:errors property="discrepencyError" /></td>
											<!--<td class="fieldname" width="20%">Discrepency Counter</td>
											<td class="even" width="20%"><bean:write name="DiscrepencyForm" property="counter"/>
											</td>
											
										-->
										</tr>

										<tr>
											<td class="fieldname">Creation Remarks<font
												color="red">*</font></td>
											<td class="even" colspan="3"><html:textarea
												property="discrepencyRemark" rows="6" cols="120" /> <br />
											<html:errors property="discrepencyRemarkError" /></td>
										</tr>
										<html:hidden property="status" value="PENDING_CREATE" />
									</tbody>
								</table>
								</td>
							</tr>
<html:hidden name="DiscrepencyForm" property="hiddenList" />
	<html:hidden name="DiscrepencyForm" property="discrepencyType" />
	<html:hidden name="DiscrepencyForm" property="approvedBy" />
	<html:hidden name="DiscrepencyForm" property="customerId"
		value="<%=id %>" />
							<table width="130" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="65">&nbsp;</td>
									<td width="65">&nbsp;</td>
								</tr>
								<tr>
									<!--<td colspan="2">
							<center><a href="javascript:saveDiscrepency()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/save2.gif',1)"><img
								src="img/save1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
							-->
									<td colspan="2">
									<center><a href="javascript:createTempDiscrepency()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/button/add2.gif',1)"><img
										src="img/button/add1.gif" name="Image4411" border="0" id="Image4411" />
									</a></center>
									</td>

								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
							
							<tr>
					<td width="70%">
					<h3>Discrepency List</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>
							
							<tr>
								<td valign="bottom" align="right"><input type="button"
									name="Submit" value="Remove" class="btnNormal"
									onclick="removeDiscrepency()" /></td>
							</tr>
								
							<tr>
								<td colspan="2">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="tblInfo">
									
									<thead>
										<tr>
											<td width="4%">S/N</td>

											<!--							<td width="15%">Discrepency Type</td>-->
											<td width="15%">Discrepency</td>
											<td width="25%">Creation Remarks</td>
											<td width="12%">Creation Date</td>
											<td width="12%">Original Target Date</td>
											<!--							<td width="15%">Critical</td>-->
											
											<td width="12%">Next Due Date</td>
											<td width="12%">Status</td>
											<td width="3%">Action</td>
											<td width="5%">Remove
											<%	if (listSize>0) { %>
											<center>
											<input type="checkbox" name="list11" id="list11" value="Check All" onClick="checkedAll()" /> </center>
																		<%} %>
											
											</td>
										</tr>
									</thead>
									<tbody>
										<%
											
										%>
										<logic:greaterThan name="discrepencySize" value="0">
											<logic:iterate id="OB" name="discrepencyList"
												type="com.integrosys.cms.app.discrepency.bus.OBDiscrepency"
												scope="page" length="10"
												offset="<%=String.valueOf(startIndexInn)%>">
												<%
													String rowClass = "";
																counter++;
																if (counter % 2 != 0)
																	rowClass = "odd";
																else
																	rowClass = "even";
																indexId--;
																
												%>
												<tr class="<%=rowClass%>">
													<td class="index" width="4%"><%=counter+startIndexInn %></td>

													<!--								<td>-->
													<!--								<center><%=OB.getDiscrepencyType()%></center>-->
													<!--								</td>-->

													<%
														long i = OB.getId();
																	//System.out.println("////////////****************** getDiscrepencyRemark :"+OB.getDiscrepencyRemark().length());
													%>
													<td><integro:common-code-single
														entryCode="<%=OB.getDiscrepency()%>" display="true"
														categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>"
														descWithCode="false" /></td>
															<%
														if (OB.getDiscrepencyRemark().length() > 0) {
																		
																		if (OB.getDiscrepencyRemark().length() > 47) {
													%>

													<td><%=OB.getDiscrepencyRemark().substring(0, 47)%>...</td>
													<%
														} else if (OB.getDiscrepencyRemark().length() <= 47) {
													%>
													<td>&nbsp;<%=OB.getDiscrepencyRemark()%></td>
													<%
														}
																	} else if (OB.getDiscrepencyRemark().length() <= 0) {
																		
													%>
													<td>-</td>
													<%} %>
													<td><integro:date object="<%=OB.getCreationDate()%>" /></td>
													<td><integro:date
														object="<%=OB.getOriginalTargetDate()%>" /></td>
													<!--								<td><%=OB.getCritical()%></td>-->
												
													<%
														if(OB.getNextDueDate()==null){
													%>
													<td>-</td>
													<%} else{%>
													<td><integro:date object="<%=OB.getNextDueDate()%>" /></td>
													<%}
														String status = OB.getStatus();
																	 if (status.equals("PENDING_CREATE")) {
																		status = "PENDING CREATE";
																	} 
													%>
													<td>
													<center><%=status%></center>
													</td>
													<td>
													<%String viewId="";
													if(startIndexInn!=0){
														viewId=String.valueOf(indexId-startIndexInn);
														}else{
															viewId=String.valueOf(indexId);
														}
													%>
													<select name="select6" onchange="MM_jumpMenu('self',this,0)">
													 <option value="#" selected="selected">Please Select</option>
				 										 <option value="javascript:goView(<%=viewId %>)"  >View</option>
				  										 <option value="javascript:goUpdate(<%=viewId %>)" >Update</option>
													</select>
													
													</td>
													<td><center>
													
													<% 
													String selectId="";
													if(startIndexInn!=0){
													 selectId=String.valueOf(indexId-startIndexInn);
													}else{
														 selectId=String.valueOf(indexId);
													}
													
													if(selectedArrayMap.containsKey(selectId)){ %>
													<input type="checkbox" id="selected" name="selected" value="<%=startIndexInn-indexId %>" checked="checked"  />
													<%}else{
														%>
													<input type="checkbox" id="selected" name="selected" value="<%=startIndexInn-indexId %>"  />
													<%} %>
													 <input	type="hidden" name="selected" id="selected"></center>
													</td>
												</tr>
											</logic:iterate>
										</logic:greaterThan>
										<%
											if (listSize == 0) {
										%>
										<tr class="odd">
											<td colspan="9"><bean:message
												key="label.global.not.found" /></td>
										</tr>
										<%}%>
									</tbody>
								</table>
								</td>
								<html:hidden property="selectedArray" />
													<html:hidden property="unCheckArray" />
							</tr>
							<%if(listSize>10){ %>
			<tr>
				<% String url="Discrepency.do?event=maker_next_create_temp_list_discrepency&searchstatus="+searchstatus+"&discType="+discType+"&startIndex="+startIndex+"&startIndexInn=" ;%>
				<td height="10">
				<table id="generalPurposeBar" width="100%" border="0"
					cellspacing="0" cellpadding="5" align="center">
					<tr>
						<td valign="middle"><integro:pageindex
							pageIndex="<%=new PageIndex(startIndexInn, 10, listSize)%>"
							url='<%=url %>' submitFlag="true"/></td>
					</tr>
				</table>
				</td>
			</tr>
			<%} %>
							
						</tbody>
					</table>
					<table width="130" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="65">&nbsp;</td>
							<td width="65">&nbsp;</td>
						</tr>
						<tr>
							<!--<td colspan="2">
							<center><a href="javascript:saveDiscrepency()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/save2.gif',1)"><img
								src="img/save1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
							-->
							<td colspan="2">
							<center><a href="javascript:createDiscrepency()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)"><img
								src="img/submit1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
							<td colspan="2">
							<center><a href="javascript:goBack()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</div>
			</td>
		</tr>
		<html:hidden property="creationDate" />
	</table>
	
</html:form>
</body>
