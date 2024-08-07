<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatForm"%>

<%
	String context = request.getContextPath() + "/";
%>
<%	 NewTatForm tat = (NewTatForm) request.getAttribute("NewTatForm");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	//ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	 HashMap regionMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.regionMap");
	 HashMap rmMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.rmMap");
	 ArrayList currencyList=(ArrayList) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.currencyList");
	 ArrayList manualFacilityList=(ArrayList) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.manualFacilityList");
	 ArrayList systemFacilityList=(ArrayList) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.systemFacilityList");
	 for(int i =0;i<manualFacilityList.size();i++){
		 LabelValueBean bean = (LabelValueBean)manualFacilityList.get(i);
		 //System.out.println("manualFacilityList :"); 
		 //System.out.println("label :"+bean.getLabel()+" value :"+bean.getValue()); 
	 }
	 for(int i =0;i<systemFacilityList.size();i++){
		 LabelValueBean bean = (LabelValueBean)systemFacilityList.get(i);
		 //System.out.println("systemFacilityList :"); 
		 //System.out.println("label :"+bean.getLabel()+" value :"+bean.getValue()); 
	 }
	 HashMap manualFacilityLineNoMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.manualFacilityLineNoMap");
	 HashMap branchListValues=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.branchListValues");
	 HashMap facilityNameMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityNameMap");
	 String tatBurst=(String) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.tatBurst");
	 long lTatBurst=0;
	 
	 if(tatBurst!=null){
		 lTatBurst=Long.parseLong(tatBurst);
	 }
	 String myList = "";
	 String facSelection = "";
	 if(tat!=null && "SYSTEM".equals(tat.getFacilitySection())){
		 myList = "systemFacilityList";
		 facSelection = "SYSTEM";
	 }
     if(tat!=null && "MANUAL".equals(tat.getFacilitySection())){
    	 myList = "manualFacilityList";
    	 facSelection = "MANUAL";
	 }
	 pageContext.setAttribute("currencyList",currencyList);
	 pageContext.setAttribute("manualFacilityList",manualFacilityList);
	 pageContext.setAttribute("systemFacilityList",systemFacilityList);

	 String event = (String) request.getAttribute("event");
	 
	 List serialList = (List) request.getAttribute("serialList");
	 if (!(serialList == null)) {
	 pageContext.setAttribute("serialList", serialList);
	 }else
	 {
		 pageContext.setAttribute("serialList", new ArrayList());
	 }
	 if(event==null){
		event= "prepare_limit_release";
	 }
	 String valueFTNR="";
	 if(tat.getType()!=null){
	 valueFTNR=tat.getType();
	 }
	 List relationshipMgrList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.relationshipMgrList");
	 if (!(relationshipMgrList == null)) {
			
			pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("relationshipMgrList", new ArrayList());
		 
	 }
	 
	 
	 List facilityCategoryList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityCategoryList");
	 if (!(facilityCategoryList == null)) {
			
			pageContext.setAttribute("facilityCategoryList", facilityCategoryList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("facilityCategoryList", new ArrayList());
		 
	 }
	 
	 List facilityNameList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityNameList");
	 if (!(facilityNameList == null)) {
			
			pageContext.setAttribute("facilityNameList", facilityNameList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("facilityNameList", new ArrayList());
		 
	 }
	 
	 List CAMTypeList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.CAMTypeList");
	 if (!(CAMTypeList == null)) {
			
			pageContext.setAttribute("CAMTypeList", CAMTypeList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("CAMTypeList", new ArrayList());
		 
	 }
	 
	 List DeferralTypeList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.DeferralTypeList");
	 if (!(DeferralTypeList == null)) {
			
			pageContext.setAttribute("DeferralTypeList", DeferralTypeList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("DeferralTypeList", new ArrayList());
		 
	 }
	 
	 List LSSCoOrdinatorBranchList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.LSSCoOrdinatorBranchList");
	 if (!(LSSCoOrdinatorBranchList == null)) {
			
			pageContext.setAttribute("LSSCoOrdinatorBranchList", LSSCoOrdinatorBranchList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("LSSCoOrdinatorBranchList", new ArrayList());
		 
	 }
	 
	 int startIndexInner = 0;
	   
	    String ind= (String) request.getAttribute("startIndexInner");
	  
		if(ind!=null && (!ind.equals("")))
			 startIndexInner = Integer.parseInt(ind);
		String val = "";
		if(tat!=null && tat.getFacilitySection()!=null){
			val = tat.getFacilitySection().trim();
		}
		
		System.out.println();
%>


<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatUtil"%>
<%@page import="org.apache.struts.util.LabelValueBean"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<script type="text/javascript" src="<%=context%>js/ajaxDropdownTat.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/ajaxNewTatFacility.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
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
function cancelPage(){
    document.forms[0].action="NewTat.do?event=list_cancel&startIndexInner="+<%=startIndexInner%>;
    
    document.forms[0].submit();
}

function myFunction(){
var a = '<%=event%>';
var valueFTNR = '<%=valueFTNR%>';
var answer='';

 if(a == 'prepare_limit_release'){
	var answer=confirm("Do you want to Release Limit ?");
		if (answer==true)
		    {
			document.forms[0].action="NewTat.do?event=confirm_limit_release&startIndexInner="+<%=startIndexInner%>;
		    document.forms[0].submit();
		    }

  }else if(a == 'prepare_deferral_raised'){
	var answer=confirm("Do you want to raise Deferral ?");
	  if (answer==true)
	    {
		document.forms[0].action="NewTat.do?event=confirm_deferral_raised&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
	    }
	}else if(a == 'prepare_clims_updated'){
		var answer=confirm("Do you want to update CLIMS ?");
		  if (answer==true)
		    {
			document.forms[0].action="NewTat.do?event=confirm_clims_updated&startIndexInner="+<%=startIndexInner%>;
		    document.forms[0].submit();
		    }
		}
		
}


function enbleBtn(ifChecked){
var value = '<%=val%>'
	if(ifChecked == 1){
		
		document.NewTatForm.serialNumber.disabled=false;
		document.NewTatForm.lineNumber.disabled=false;
		document.getElementById('facilitySection').value = 'MANUAL'
		document.getElementById('facilityManual').value = '';
		document.getElementById('lineNumber').value = '';
		document.getElementById('serialNumberSystem').value = '';
		document.getElementById('manualFac').style.display = ''
		document.getElementById('systemFac').style.display = 'none'
		//document.getElementById('serialNo').style.display = 'none'	
		document.getElementById('serialNoSystem').style.display = 'none'
	    document.getElementById('serialNoManual').style.display = ''
	

            
	}else if (ifChecked == 2 ){
		document.NewTatForm.serialNumber.value='';
		//document.NewTatForm.serialNumber.disabled=true;
		document.NewTatForm.lineNumber.value='';
		document.NewTatForm.lineNumber.disabled=true;
		document.getElementById('facilitySection').value = 'SYSTEM'
	    document.getElementById('facilitySystem').value = '';
		document.getElementById('lineNumber').value = '';
		document.getElementById('serialNumberManual').value = '';
		document.getElementById('manualFac').style.display = 'none'
		document.getElementById('systemFac').style.display = ''
		//document.getElementById('serialNo').style.display = ''	
		document.getElementById('serialNoSystem').style.display = ''
	    document.getElementById('serialNoManual').style.display = 'none'
			
	}
}
function refreshFacilityDetails(dropdown,facSel)
{
 var curSel = "";

 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'lineNumber';
 var url = '/cms/NewTat.do?event=refresh_facility_details&facName='+curSel+'&facSel='+facSel;
 sendLoadNewTatReq(dep, url);
 if(document.getElementById('facilitySection').value == 'SYSTEM')
 {
 refreshFacilityDetails1(dropdown,facSel);
 }
}

function refreshFacilityDetails1(dropdown,facSel)
{
 var curSel = "";

 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'serialNumberSystem';
 var url = '/cms/NewTat.do?event=refresh_facility_details&facName='+curSel+'&facSel='+facSel;
 sendLoadDropdownReq(dep, url);
}

function otherDelayReason(dropdown)
{
 var curSel = "";

 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 
 if(curSel=="OTHER"){
	
	 document.NewTatForm.delayReasonText.disabled=false;
	}else{
		
		 document.NewTatForm.delayReasonText.disabled=true;
		}
}
//-->
</script>
<style type="text/css">
<!--
.hiddenDiv {
	display: none;
}

.visibleDiv {
	display: block;
	border: 1px grey solid;
}

.style1 {
	color: #FF0000
}

.style5 {
	color: #FF0000
}

.style11 {
	color: #FF0000
}
-->
</style>
<!-- InstanceEndEditable -->
</head>

<html:form action="/NewTat">
	<body>

	<!-- InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>

					<%if("prepare_limit_release".equals(event)){ %>
							<h3>Limit Release</h3>
							<%}else if("prepare_clims_updated".equals(event)){ %>
							<h3>CLIMS Update</h3>
							<%}else{ %>
							<h3>Deferral Raise</h3>
							<%} %>

				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInput" id="choiceTable">
					<thead>
					</thead>
					<tbody>

						<tr class="odd">

							<td class="fieldname" width="20%">Party Name:</td>
							<td width="80%"><integro:empty-if-null
								value="<%=tat.getLspShortName() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Party Id: </td>
							<td width="80%"><integro:empty-if-null
								value="<%=tat.getLspLeId() %>" />&nbsp;</td>

						</tr>
						
						<tr class="odd">

							<td class="fieldname" width="20%">Region: </td>
							<td width="80%"><integro:empty-if-null
								value="<%=regionMap.get(tat.getRmRegion()) %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Segment: <font color="red">*</font></td>
							<td width="30%"><integro:common-code-single
								categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
								descWithCode="false" display="true"
								entryCode="<%=tat.getSegment() %>" />&nbsp;</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="20%">Module: </td>
							<td width="25%">
							<%if( tat.getModule()==null || tat.getModule().equalsIgnoreCase("LIMIT")){
											%> Limit
							Release <%
										}
										else if( tat.getModule().equalsIgnoreCase("PDDC") ){
					                  	%> Post Disbursal Deferral Clearance <%
										}else if( tat.getModule().equalsIgnoreCase("CAM") ){
					                  	%> CAM Module <%}%> <br>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Relationship Manager: </td>
							<td width="30%">
							 <integro:empty-if-null
								value="<%=rmMap.get(tat.getRelationshipManager()) %>" />&nbsp;

						</tr>

						<tr class="odd">

							<td class="fieldname" width="20%">Case Initiator: </td>
							<td width="30%"><integro:empty-if-null value="<%=NewTatUtil.getUserName(tat.getCaseInitiator())%>"/>&nbsp;</td>

						</tr>
						
						<tr class="even">

							<td class="fieldname" width="20%">Case Id: </td>
							<td width="30%"><integro:empty-if-null value="<%=tat.getId()%>"/>&nbsp;</td>

						</tr>
						
						<% if(tat.getModule()==null || tat.getModule().equalsIgnoreCase("LIMIT") ){  %>
						<tr class="odd" id="fCategory">

							<td class="fieldname" width="20%">Facility Selected By RM: </td>
							<td><integro:empty-if-null value="<%=facilityNameMap.get(tat.getFacilityName()) %>"/>&nbsp;

						</tr>

						<%}else if(tat.getModule().equalsIgnoreCase("CAM")){ %>
						<tr class="odd" id="fCategory" style="display: none;">

							<td class="fieldname" width="20%">CAM Type: </td>
							<td>
							<integro:empty-if-null value="<%=tat.getCamType() %>"/>
							&nbsp;</br>
							</td>

						</tr>

						<%}else if(tat.getModule().equalsIgnoreCase("PDDC") ){  %>
						<tr class="odd" id="deferralType">

							<td class="fieldname" width="20%">Deferral Type: </td>

							<td>
							<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" 
							entryCode="<%=tat.getDeferralType()%>" display="true" descWithCode="false"  />
							
							&nbsp;
							</br>
							
							</td>



						</tr>

						<%}%>
						<tr class="even">

							<td class="fieldname" width="20%">Last Action: </td>
							<td width="30%"><integro:empty-if-null value="<%=NewTatUtil.getStatusName(tat.getStatus(),tat.getType()) %>"/> <br>
							</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="20%">Last Updated By: </td>
							<td><integro:empty-if-null value="<%=NewTatUtil.getUserName(tat.getLastUpdateBy()) %>"/>&nbsp;
							<br>
							</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Status Updated To: </td>
							<td width="30%">
							<%if("prepare_limit_release".equals(event)){ %>
							Limit Released
							<%}else if("prepare_clims_updated".equals(event)){ %>
							CLIMS Updated
							<%}else{ %>
							Deferral Raised
							<%} %>
							&nbsp;
							 <br>
							</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="20%">LSS Co-ordinator Branch: </td>
							<td width="30%"><integro:empty-if-null value="<%=branchListValues.get(tat.getLssCoordinatorBranch()) %>"/> <br>
							</td>

						</tr>
						<%
						if("prepare_limit_release".equals(event)){
						if(tat.getModule()==null || tat.getModule().equalsIgnoreCase("LIMIT") ){ %>
						<tr class="even">

							<td class="fieldname" width="20%">Facility Selection : <font
								color="red">*</font></td>
							<td width="30%">
							<%if(tat.getFacilitySection()==null){ %>
							<input type="radio"  name ="facilitySection" value="MANUAL" checked="checked" onclick="javascript : enbleBtn(1);">Manual
							<input type="radio"  name ="facilitySection" value="SYSTEM" onclick="javascript : enbleBtn(2);">System
							<%}else if(tat.getFacilitySection()!=null && "SYSTEM".equals(tat.getFacilitySection())){ %>
							<input type="radio"  name ="facilitySection" value="MANUAL"  onclick="javascript : enbleBtn(1);">Manual
							<input type="radio"  name ="facilitySection" value="SYSTEM" checked="checked" onclick="javascript : enbleBtn(2);">System
							<%}else if(tat.getFacilitySection()!=null && "MANUAL".equals(tat.getFacilitySection())){ %>
							<input type="radio"  name ="facilitySection" value="MANUAL"  checked="checked" onclick="javascript : enbleBtn(1);">Manual
							<input type="radio"  name ="facilitySection" value="SYSTEM"  onclick="javascript : enbleBtn(2);">System
							<%} %>
							&nbsp;
							 <br>
							</td>

						</tr>
						<% if(tat.getFacilitySection()==null || "MANUAL".equals(tat.getFacilitySection())){ %>
						<tr class="odd" id="systemFac" style="display: none" >
							<td class="fieldname" width="20%">Facility:<font
								color="red">*</font></td>
							<td width="30%">
							<html:select property="facilitySystem" onchange ="javascript:refreshFacilityDetails(this,'SYSTEM')" >
							<html:option value="">Please Select</html:option>
							<html:options collection="systemFacilityList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="facilitySystemError" />
							<br>
							</td>
						</tr>
						<tr class="odd" id="manualFac">
							<td class="fieldname" width="20%">Facility:<font
								color="red">*</font></td>
							<td width="30%">
							<html:select property="facilityManual" onchange ="javascript:refreshFacilityDetails(this,'MANUAL')" >
							<html:option value="">Please Select</html:option>
							<html:options collection="manualFacilityList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="facilityManualError" />
							<br>
							</td>
						</tr>
						
						
						<%} else if("SYSTEM".equals(tat.getFacilitySection())){ %>
						<tr class="odd" id="systemFac" >
							<td class="fieldname" width="20%">Facility:<font
								color="red">*</font> </td>
							<td width="30%">
							<html:select property="facilitySystem" onchange ="javascript:refreshFacilityDetails(this,'SYSTEM')" >
							<html:option value="">Please Select</html:option>
							<html:options collection="systemFacilityList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="facilitySystemError" />
							<br>
							</td>
						</tr>
						<tr class="odd" id="manualFac" style="display: none">
							<td class="fieldname" width="20%">Facility:<font
								color="red">*</font></td>
							<td width="30%">
							<html:select property="facilityManual" onchange ="javascript:refreshFacilityDetails(this,'MANUAL')" >
							<html:option value="">Please Select</html:option>
							<html:options collection="manualFacilityList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="facilityManualError" />
							<br>
							</td>
						</tr>
						
						<%} %>
						<tr class="even">

							<td class="fieldname" width="20%">Amount : <font
								color="red">*</font>  </td>
							<td width="30%">
							<html:text property="amount" maxlength="22" ></html:text>
							&nbsp;
							Select Currency 
							<html:select property="currency">
							<%
							for(int i=0;i<currencyList.size();i++){
							LabelValueBean bean= (LabelValueBean)currencyList.get(i);
							if(bean.getLabel().trim().equals("INR")){
							%>
							<option value="<%=bean.getValue()%>" selected="selected"><%=bean.getLabel()%></option>
							<%}else{ %>
							<option value="<%=bean.getValue()%>"><%=bean.getLabel()%></option>							
							<%}} %>
							</html:select>
							<html:errors property="errorAmount" />
							 <br>
							</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="20%">Line No :  </td>
							<td width="30%">
							<html:text property="lineNumber"></html:text>
							
							<br>
							</td>

						</tr>
						
						<!--<tr class="odd" id="serialNo">
							<td class="fieldname" width="20%">Serial No :<font
								color="red">*</font></td>
							<td width="30%">
							<html:select property="serialNumber"  >
							<html:option value="">Please Select</html:option>
							<html:options collection="serialList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="serialNumberError" />
							<br>
							</td>
						</tr>
						
						--><% if(tat.getFacilitySection()==null || "MANUAL".equals(tat.getFacilitySection())){ %>
						<tr class="odd" id="serialNoManual">
							<td class="fieldname" width="20%">Serial No :<font
								color="red">*</font></td>
							<td width="30%">
							<html:text property="serialNumberManual" ></html:text>
							<html:errors property="serialNumberError" />
							<br>
							</td>
						</tr>
						<tr class="odd" id="serialNoSystem" style="display: none" >
							<td class="fieldname" width="20%">Serial No :<font
								color="red">*</font></td>
							<td width="30%">
							<html:select property="serialNumberSystem"  >
							<html:option value="">Please Select</html:option>
							<html:options collection="serialList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="serialNumberError" />
							<br>
							</td>
						</tr>
					<%} else if("SYSTEM".equals(tat.getFacilitySection())){ %>
					<tr class="odd" id="serialNoManual"  style="display: none" >
							<td class="fieldname" width="20%">Serial No :<font
								color="red">*</font></td>
							<td width="30%">
							<html:text property="serialNumberManual" ></html:text>
							<html:errors property="serialNumberError" />
							<br>
							</td>
						</tr>
							<tr class="odd" id="serialNoSystem" >
							<td class="fieldname" width="20%">Serial No :<font
								color="red">*</font></td>
							<td width="30%">
							<html:select property="serialNumberSystem"  >
							<html:option value="">Please Select</html:option>
							<html:options collection="serialList" property="value" labelProperty="label" />
							</html:select>
							<html:errors property="serialNumberError" />
							<br>
							</td>
						</tr>
						<%} %>
						<%}} %>
						<% if(tat.getModule().equalsIgnoreCase("CAM")){ %>
						<tr class="odd" id="fCategory" >

							<td class="fieldname" width="20%">CAM Type: </td>
							<td>
							<integro:empty-if-null value="<%=tat.getCamType() %>"/>
							&nbsp;</br>
							</td>

						</tr>

						<%}else if(tat.getModule().equalsIgnoreCase("PDDC") ){  %>
						<tr class="odd" id="deferralType">

							<td class="fieldname" width="20%">Deferral Type: </td>

<td>
<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" entryCode="<%=tat.getDeferralType()%>" display="true" descWithCode="false"  />
							
							&nbsp;
							</br>
							
							</td>



						</tr>

						<%}%>
						<%if(tat.getIsTatBurst()!=null && tat.getIsTatBurst().equals("Y")){ %>
						<%if(tat.getModule().equalsIgnoreCase("LIMIT") ){ %>
						<%if(event!=null && !"prepare_deferral_raised".equals(event)){ %>
						<tr class="even">

							<td class="fieldname" width="20%">Delay Reason : <font color="red">*</font></td>
							<td width="30%">
							<html:select name="NewTatForm" property="delayReason" onchange ="javascript:otherDelayReason(this)">
								<integro:common-code
									categoryCode="TAT_DELAY"
									descWithCode="false" />
							</html:select>
							<html:text property="delayReasonText"  maxlength="75" disabled="true"></html:text>
							<html:errors property="delayReasonError"/>
							<br>
							</td>

						</tr>
						<%} %>
						<%}else if(tat.getModule().equalsIgnoreCase("CAM")||tat.getModule().equalsIgnoreCase("PDDC")){%>
						<%if(event!=null && !"prepare_deferral_raised".equals(event)){ %>
						<tr class="even">

							<td class="fieldname" width="20%">Delay Reason : </td>
							<td width="30%">
							<html:select name="NewTatForm" property="delayReason" onchange ="javascript:otherDelayReason(this)">
								<integro:common-code
									categoryCode="TAT_DELAY"
									descWithCode="false" />
							</html:select>
							<html:text property="delayReasonText"  maxlength="75" disabled="true"></html:text>
							<html:errors property="delayReasonError"/>
							<br>
							</td>

						</tr>
						<%} %>
						<%}} %>
						
						<tr class="even">

							<td class="fieldname" width="20%">Remarks: </td>
							<td><html:textarea property="remarks" rows="6" cols="100"></html:textarea>&nbsp;
							<br>
							<html:errors property="remarksLengthError"/>
							
							</td>

						</tr>
						<html:hidden property="versionTime" />
<html:hidden property="id" />
<html:hidden property="createBy"  />
<html:hidden property="creationDate" />
<html:hidden property="lastUpdateBy" value="<%=user.getLoginID() %>" />
<html:hidden property="lastUpdateDate" />
<html:hidden property="deprecated" value="N" />
<html:hidden property="status" />
<html:hidden property="cmsLeMainProfileId" />
<html:hidden property="lspLeId" value="<%=tat.getLspLeId()%>"/>
<html:hidden property="lspShortName" value="<%=tat.getLspShortName() %>"/>
<html:hidden property="caseId" />
<html:hidden property="module" />
<html:hidden property="caseInitiator" />
<html:hidden property="relationshipManager"/>
<html:hidden property="docStatus" />
<html:hidden property="remarks" />
<html:hidden property="facilityCategory" />
<html:hidden property="facilityName" />
<html:hidden property="camType" />
<html:hidden property="deferralType" />
<html:hidden property="lssCoordinatorBranch" />
<html:hidden property="type" />
<html:hidden property="activityTime" />
<html:hidden property="actualActivityTime" />
<html:hidden property="amount" />
<html:hidden property="currency" />
<html:hidden property="lineNumber" />
<html:hidden property="serialNumber" />
<html:hidden property="serialNumberManual" />
<html:hidden property="serialNumberSystem" />
<html:hidden property="segment" />
<html:hidden property="region"  value="<%=tat.getRegion()%>"/>
<html:hidden property="rmRegion" value="<%=tat.getRmRegion()%>"/>
<html:hidden property="isTatBurst" />





					</tbody>
				</table>
				</td>
			</tr>


		</tbody>
	</table>

	<table width="130" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>
		<tr>
		
			<td colspan="4"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick=" myFunction()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;</td>
			
			<td colspan="4"><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
			</a> &nbsp;&nbsp;</td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>


	<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
