<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);

//Uma:To Give Document's authorization right's to Branch User.
boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID) 
|| ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID) 
|| ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID) 
|| ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			   boolean isCputUserChecker=false;
			    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
			    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT_WFH){
			    	isCputUserChecker=true;
			    }	
%>
<%
	int counter = 0;
	OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
	List list1 = null;
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
	String context = request.getContextPath() + "/";
%>

<%
SecurityReceiptForm SecurityReceiptForm = (SecurityReceiptForm) request.getAttribute("SecurityReceiptForm");
String catg="";
String docTye="";
String custLimitProfileID=request.getParameter("custLimitProfileID");

    String rowClass = "";
	String recordsString = PropertyManager
			.getValue("customer.pagination.nitems");
	list1 = (ArrayList) request.getAttribute("tagDetailList");
	
	

	int records_per_page = 10; //default value
	try {
		records_per_page = Integer.parseInt(recordsString);
	} catch (NumberFormatException e) {
		DefaultLogger
				.error(
						this,
						"Caught NumberFormatException. Using Default value of 10.",
						e);
		records_per_page = 10;
	}
	

	
	String event = request.getParameter("event");
	String checkListID = request.getParameter("checkListID");
	String limitBkgLoc = request.getParameter("limitBkgLoc");
	String secType = request.getParameter("secType");
	String secSubType = request.getParameter("secSubType");
	String secName = request.getParameter("secName");
	String collateralID = request.getParameter("collateralID");
	String collateralRef = request.getParameter("collateralRef");
	String limitProfileID = request.getParameter("limitProfileID");
	String legalID = request.getParameter("legalID");
	String custCategory = request.getParameter("custCategory");
	HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.selectedArrayMap");
	if(selectedArrayMap ==null){
		selectedArrayMap =new HashMap();
	}

	
	String customerName = request.getParameter("customerName");
	String legalName = request.getParameter("legalName");
	 ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	 ICMSLegalEntity obLegalEntity=(ICMSLegalEntity)customer.getLegalEntity();
	String custId = obLegalEntity.getLEReference();
//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@custId:"+custId);
	String category = request.getParameter("category");
	String index = request.getParameter("index");
	SearchResult customerList = (SearchResult) request
			.getAttribute("customerList");

	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	int sno = 0;
	// System.out.println("value of records_per_page"+records_per_page);
	
		boolean canView=false;

		  //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
	    boolean isActive=true;
	    if(null!=customer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(customer.getStatus())){
	    isActive=false;
	    	}
	    
	    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
	  //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
if(!isUserCpcMaker || !isActive){
	canView=true;
}
%>


<head>
    <title>Customer Details</title>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />

<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/ajaxGetImage.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>



<script type="text/javascript" src="<%=context%>greybox/base/AJS.js"></script>
<script type="text/javascript" src="<%=context%>greybox/base/AJS_fx.js"></script>
<script type="text/javascript" src="<%=context%>greybox/gb_scripts.js"></script>
<link href="<%=context%>greybox/gb_styles.css" rel="stylesheet" type="text/css" />
<link href="<%=context%>greybox/base/base.css" rel="stylesheet" type="text/css" />

<link href="<%=context%>greybox/window/window.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/window/window.js"></script>


<link href="<%=context%>greybox/set/set.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/set/set.js"></script>

<link href="<%=context%>greybox/gallery/gallery.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/gallery/gallery.js"></script>


<script type="text/javascript" src="js/imageNavigation.js"></script>



<script language="JavaScript" type="text/JavaScript">

insertHeader();
insertMenu('examples');
function cancelPage() {
    document.forms[0].action="ImageTag.do?event=image_tag";
    document.forms[0].submit();
}
function closePage() {
	document.forms["SecurityReceiptForm"].event.value="view_ok";
	document.forms["SecurityReceiptForm"].submit();
}
function returnPage() {
    document.forms["SecurityReceiptForm"].event.value = "view";
    document.forms["SecurityReceiptForm"].submit();
}
function showListing() {
	
	var catg= document.forms[0].category.value;
	if(catg!=null  && catg!=""){
    document.forms[0].action="ImageTagMap.do?category="+catg;
    document.forms[0].event.value="list_tag_page";
    document.forms[0].submit();
	}else{
		alert("Please select category.")
	}
}
function ShowBiggerImage(obj)

{
    document.getElementById("LargeImageContainerDiv").innerHTML = "<img src='" + obj.src + "' >";
}



function pageLoad()
{
	alert("page Loaded");
}	
function getImageForDisplaySecurityDoc(imagePath,imageName,status) {
	   /*var dep = 'imagePath';
	   var url = '/cms/SecurityReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	   sendLoadImagePathReq(dep, url);*/
	document.getElementById("imageFrame").src= '/cms/SecurityReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	}

function downloadImage(imagePath,imageName,status){ //v3.0
	var aLocation = "SecurityReceipt.do?event=downloadImage&imageName="+imageName+"&pID="+imagePath+"&status="+status;
	window.location.href = aLocation ;
	//document.forms[0].submit();
}


function downloadImageZip() {

	var s_value = "";
	var n_value = "";
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      s_value = s_value + document.forms[0].selected[i].value + "-";
		      }else{
		    	  n_value = n_value + document.forms[0].selected[i].value + "-";
		      }
		   }
	}
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		//document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    var aLocation = "SecurityReceipt.do?event=downloadImage&custId=<%=custId%>&imageId="+s_value+"&unCheckId="+n_value;
	window.location.href = aLocation ;
	 
		} else{
		alert("Please select the image for downloading.");
	}
}


function toggleSelectAll() {
	
	//alert("srf"+document.forms[0].selectedArray.value);
	
	var c_value = "";
	var toggleSelect = false;
	if(document.forms[0].selected.length==undefined ){
		if(!document.forms[0].selected.checked)
			toggleSelect=true;
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (!document.forms[0].selected[i].checked)
		      {
			   toggleSelect=true;
		      }
		   }
	}
	
	if(toggleSelect){
		document.forms[0].list11.checked=false;
	}else{
		document.forms[0].list11.checked=true;
	}
	
}
function checkedAllImages(){ 
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
function getImageGallarySecurityDoc(imagePath,imageName,status,count) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
  var catg= document.forms[0].category.value;
	var s_value = "";
	var n_value = "";
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      s_value = s_value + document.forms[0].selected[i].value + "-";
		      }else{
		    	  n_value = n_value + document.forms[0].selected[i].value + "-";
		      }
		   }
	}
  //alert("getImageGallary");
	//alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+catg);
	//alert("count is "+count);
	document.forms[0].action="SecurityReceipt.do?event=retrieveImageGallarySecurityDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg+"&imageId="+s_value+"&unCheckId="+n_value;
	document.forms[0].submit();
}
function printPage() {

	var s_value = "";
	var n_value = "";
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      s_value = s_value + document.forms[0].selected[i].value + "-";
		      }else{
		    	  n_value = n_value + document.forms[0].selected[i].value + "-";
		      }
		   }
	}
	var catg= document.forms[0].category.value;
	//var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		//document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow1("SecurityReceipt.do?event=print_image&custId=<%=custId%>&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}
</script>
</head>
<body> 
		
<html:form action="SecurityReceipt">

<input type="hidden" name="custLimitProfileID" value="<%=custLimitProfileID%>" />

<input type="hidden" name="event" value="<%=event %>"/>
<input type="hidden" name="checkListID" value="<%=checkListID %>"/>
<input type="hidden" name="limitBkgLoc" value="<%=limitBkgLoc %>"/>

<html:hidden property="secType" value="<%=secType %>"/>
<html:hidden property="index" value="<%=index %>"/>
<html:hidden property="secSubType" value="<%=secSubType %>"/>
<html:hidden property="secName" value="<%=secName %>"/>
<html:hidden property="collateralID" value="<%=collateralID %>"/>
<html:hidden property="collateralRef" value="<%=collateralRef %>"/>
<html:hidden property="limitProfileID" value="<%=limitProfileID %>"/>
<html:hidden property="legalID" value="<%=legalID %>"/>
<html:hidden property="custCategory" value="<%=custCategory %>"/>

<input type="hidden" name="customerName" value="<%=customerName%>">
<input type="hidden" name="category" value="<%=category%>">
<input type="hidden" name="dmsImagePath"/>
<br>
<br>
<table width="100%" >
<tr>
<td width="50%" height="100%" valign="top" >	

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<!--<thead>
    <tr>
        <td><h3>Customer Details</h3>
        
      <a href="#" onclick="return GB_showImageSet(image_set, 1)">Launch gallery</a>
        </td>
     

    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>-->

<tbody>

<tr>
										<td colspan="3" valign="top"
											style="height: 100%; width: 100%;">

											<table width="95%"   class="tblFormSection" border="0"
												align="center" cellpadding="0" cellspacing="0"
												style="margin-bottom: 15px">
												<thead>
													<tr>
														<td>
															<h3>
																Image Details : Tag   
															</h3>
															<integro:user-role role="<%=teamTypeMemID%>" moduleId="36" operation="Download">
														<a href="#" onclick="downloadImageZip()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
									<img src="img/download.jpg" name="Image3316" border="0"
										id="Image3316" align="right" /> </a>
										<a href="#" onclick="printPage()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3311','','img/print2.gif',1)">
									<img src="img/print1.gif" name="Image3311" border="0"
										id="Image3311" align="right" /> </a>
										</integro:user-role>
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
															<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
																<thead>
																	<tr>
																		<td width="5%">
																			S/N
																		</td>
																		<td width="20%" nowrap="nowrap">
																			FileName
																		</td>
																		<td width="10%">
																			Type Of Document
																		</td>
																		<td width="10%">
																			Type/ID
																		</td>
																		<td width="10%">
																			Document Name
																		</td>
																		<td width="10%">
																			Other Document Name
																		</td>
																		<td width="10%">
																			Subfolder Name
																		</td>
																		<td width="10%">
																			Document Name(Migrated)
																		</td>
<!--																		<td width="25%">-->
<!--																			Download-->
<!--																		</td>-->
																		
<td width="20%">Select <%	if (list1 != null && list1.size()>0) { %>
												<input type="checkbox" name="list11" id="list11"
													value="Check All" onClick="checkedAllImages()" /> <%} %>
												</td>
																	</tr>
																</thead>
																<tbody>
																	<%
																		int counter1 = 0;

																			if (list1 != null && list1.size()>0) {
																				for (Iterator it = list1.iterator(); it.hasNext();) {

																					obImageUploadAdd = (OBImageUploadAdd) it.next();

																					counter1++;
																					if (counter1 % 2 != 0) {
																						rowClass = "odd";
																					} else {
																						rowClass = "even";
																					}
																	%>
																	<tr class=<%=rowClass%>>
																		<td class="index" width="5%"><%=counter1%></td>
																		<%
																			String subs = obImageUploadAdd.getImgFileName();
																						//subs = subs.substring();
																		%>

																		<td width="15%">
																			&nbsp;
<%if(obImageUploadAdd.getStatus()==3){ %>																			
																		<a href="#"
onclick="javascript:getImageGallarySecurityDoc('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=counter1-1%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>
<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>																			
																		</td>
																		<%-- <td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td> --%>
																		<td width="10%">
																			&nbsp;
																			<%-- <integro:common-code-single categoryCode="IMG_UPLOAD_CATEGORY"
								entryCode="<%=obImageUploadAdd.getCategory()%>" display="true" descWithCode="false" /> --%>
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/> 
																		</td>
																		<!--<td width="10%">
																			&nbsp;
																		</td>-->
																		<%if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityName() %>"/>
																		</td>
																		<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ 
																			String securityNameIds = obImageUploadAdd.getSecurityIdi()+"-"+obImageUploadAdd.getSubTypeSecurity() ;
																			if(!"".equals(obImageUploadAdd.getSecurityIdi()) && obImageUploadAdd.getSecurityIdi() != null){
																				%>
																				<td width="10%">
																					&nbsp;
																				<integro:empty-if-null value="<%=securityNameIds%>"/>
																				</td>
																				<%}else{ %>
																					<td width="10%">
																					&nbsp;
																				<integro:empty-if-null value="-"/>
																				</td>
																				<%} %>
																		<%}else if("CAM".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getHasCam() %>"/>
																		</td>
																		<%}else if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getStatementTyped() %>"/>
																		</td>
																		<%}else{%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%}%>
																		
																		<%if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityDocName() %>"/>
																		</td>
																		<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getSecurityDocName() %>"/>
																		</td>
																		<%}else if("CAM".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getCamDocName() %>"/>
																		</td>
																		<%}else if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getStatementDocName() %>"/>
																		</td>
																		<%}else{%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%}%>
																		
																		<%if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOtherDocName() %>"/>
																		</td>
																		<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOtherSecDocName() %>"/>
																		</td>
																		<%}else if("Other".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOthersDocsName() %>"/>
																		</td>
																		<%}else{%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%}%>
																		
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getSubfolderName() %>"/>
																		</td>
																		
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getDocumentName() %>"/>
																		</td>
																		
														<%--				<td width="20%">
																			&nbsp;
																			
																			
																			
<a href="#"
onclick="downloadImage('<%=obImageUploadAdd.getImageFilePath()%>','<%=obImageUploadAdd.getImgFileName()%>','<%=obImageUploadAdd.getStatus()%>')">Download
</a>

																			
																			
																		</td> --%>
																		<td width="10%">&nbsp; <%if(selectedArrayMap.containsKey(String.valueOf(obImageUploadAdd.getImgId()))){ %>
														<input type="checkbox" id="selected" name="selected"
															value="<%=counter1%>"
															onClick="toggleSelectAll()" checked="checked" /> <%}else{ %>

														<input type="checkbox" id="selected" name="selected"
															value="<%=counter1%>"
															onClick="toggleSelectAll()" /> <%} %>
														</td>
																	</tr>
																	<%
																		}
																			}else{
																	%>
																	<tr class=<%=rowClass%>>
																		<td colspan="10">
																			No records found.
																		</td>
																	</tr>
																	<%} %>
																</tbody>
																
															</table>
														</td>
														<td>
										

										</td>
																	
													</tr>
													</tbody>
													</table>
													</td>
													</tr>

</tbody>
</table>

</td>

</tr>
</table>

<p align="center">
 <%   if (canView) { %>
                <a href="#" onclick="returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
             <% } else { %>
               <a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
	<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
</a>
             <% } %>
</p>


</html:form>
</body>
</html>



