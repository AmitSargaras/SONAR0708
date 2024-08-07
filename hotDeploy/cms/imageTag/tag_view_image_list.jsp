<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.cms.app.imageTag.bus.OBImageTagDetails,com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	int counter = 0;
	OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
	String custLimitProfileID=request.getParameter("custLimitProfileID");
	String catg="";
	String docTye="";
	String docDescription="";
	ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
	if(imageTagMapForm!=null){
		catg=imageTagMapForm.getCategory();
		docTye=imageTagMapForm.getDocType();
		docDescription=imageTagMapForm.getDocDesc();
	}
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
OBImageTagDetails  obImageTagDetails = (OBImageTagDetails)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.OBImageTagDetails");
HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.selectedArrayMap");
OBLimitProfile  camInfo = (OBLimitProfile)request.getAttribute("camInfo");
String failitySourceID=(String)request.getAttribute("failitySourceID");    
String rowClass = "";
String recordsString = PropertyManager.getValue("customer.pagination.nitems");
List tageedImageList = (List) request.getAttribute("tageedImageList");
	String customerName = request.getParameter("customerName");
	int rowIdx = 0;
	int sno = 0;
	
	if(selectedArrayMap ==null){
		selectedArrayMap =new HashMap();
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
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/ajaxGetImage.js"></script>


<script type="text/javascript" src="<%=context%>greybox/base/AJS.js"></script>
<script type="text/javascript" src="<%=context%>greybox/base/AJS_fx.js"></script>
<script type="text/javascript" src="<%=context%>greybox/gb_scripts.js"></script>
<link href="<%=context%>greybox/gb_styles.css" rel="stylesheet" type="text/css" />
<link href="<%=context%>greybox/base/base.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/imageNavigation.js"></script>
<link href="<%=context%>greybox/window/window.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/window/window.js"></script>


<link href="<%=context%>greybox/set/set.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/set/set.js"></script>

<link href="<%=context%>greybox/gallery/gallery.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/gallery/gallery.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxListImageTag.js"/>



<script type="text/javascript">
    var GB_ROOT_DIR = "./greybox/";
</script>
<script type="text/javascript">
window.onload = function () {
resize();
var dep = 'docStatus';
 var url = '/cms/ImageTagMap.do?event=refresh_status_date&docDesc='+document.getElementById("dd").value;
 sendLoadListReqImageTag(dep, url);
}
var image_set = [{'caption': 'Flower', 'url': 'http://static.flickr.com/119/294309231_a3d2a339b9.jpg'},
                 {'caption': 'Nice waterfall', 'url': 'http://www.widerange.org/images/large/plitvicka.jpg'}];
</script>

<script language="JavaScript" type="text/JavaScript">

insertHeader();
insertMenu('examples');

function closePage() {
    document.forms[0].action="ImageTag.do?event=image_tag";
    document.forms[0].submit();
}
function previousPage(){
    document.forms[0].action="ImageTagMap.do?event=create_prepare_untag&custLimitProfileID=<%=custLimitProfileID%>&customerName=<%=customerName%>";
    document.forms[0].submit();
}
function ShowBiggerImage(obj)

{

    document.getElementById("LargeImageContainerDiv").innerHTML = "<img src='" + obj.src + "' >";

    
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
	var catg= document.forms[0].category.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
		document.forms[0].unCheckArray.value=s_value;
		
	    //document.forms[0].submit();
	    
	   //var aLocation ="ImageTagMap.do?event=download_image_zip&custId="+custId1+"&customerName="+customerName+"&category="+catg;  
		//window.location.href = aLocation ;
		document.forms[0].action="ImageTagMap.do?event=download_image_zip&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>;     
	    document.forms[0].submit();

		
		} else{
		alert("Please select the image for downloading.");
	}
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
	
	var custId1= document.forms[0].custId.value;
	
	var customerName= document.forms[0].customerName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow1("ImageTagMap.do?event=print_image&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}


function rejectPage() {
    document.forms[0].action="ImageTagMap.do?event=checker_reject_create";
    document.forms[0].submit();
}
function cancelPage(){
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}
function getImageGallary(imagePath,imageName,status,count) {
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
	//alert("event is "+document.forms[0].event.value);
	document.forms[0].action="ImageTagMap.do?event=retrieveViewImageGallaryChecker&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg+"&imageId="+s_value+"&unCheckId="+n_value;
    document.forms[0].submit();
}

function submitPage () {
	var c_value = "";
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			c_value = c_value + document.forms[0].selected.value + ",\n";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      c_value = c_value + document.forms[0].selected[i].value + ",\n";
		      }
		   }
	}
	
	if(c_value!=''){
		document.forms[0].action="ImageTagMap.do?event=create_image_untag&imageId="+c_value;
	    document.forms[0].method="POST";
	    document.forms[0].submit();
	} else{
		alert("Please select the image for un-tagging.");
	}
}

function refreshSubtype(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }	
   var dep = 'secSubtype';
   var url = '/cms/MISecurity.do?event=refresh_subtype&securityType='+curSel; 
   sendLoadDropdownReq(dep, url);
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

function refreshSecurityId(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }

   var dep = 'securityId';
   var url = '/cms/ImageTagMap.do?event=refresh_security_id&securitySubType='+curSel; 
   sendLoadDropdownReq(dep, url);
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

</script>
</head>
<body >
		
<html:form action="/ImageTagMap">
<html:hidden name="event" property="event" value="create_image_untag"/>
<html:hidden name="ImageTagMapForm" property="id" />
<html:hidden name="ImageTagMapForm" property="imgId" />
<html:hidden name="ImageTagMapForm" property="custId" />
<html:hidden name="ImageTagMapForm" property="docType" />
<html:hidden name="ImageTagMapForm" property="docDesc" />
<html:hidden name="ImageTagMapForm" property="facilityId" />
<input type="hidden" name="customerName" value="<%=customerName%>">
<html:hidden name="ImageTagMapForm" property="securityId" />
<input type="hidden" name="custLimitProfileID"
				value="<%=custLimitProfileID%>" />

<html:hidden name="ImageTagMapForm" property="subfolderName" value = "<%=imageTagMapForm.getSubfolderName()%>"/>
<html:hidden name="ImageTagMapForm" property="documentName" value = "<%=imageTagMapForm.getDocumentName()%>"/>

<html:hidden name="ImageTagMapForm" property="category" value="<%=catg%>"/>
<html:hidden property="selectedArray" />
<html:hidden property="unCheckArray" />
<input type="hidden" name="dmsImagePath"/>
								
<table width="100%" >
<tr>
<td width="50%" height="100%" valign="top">		
									
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Customer Details</h3>
        
<!--      <a href="#" onclick="return GB_showImageSet(image_set, 1)">Launch gallery</a>-->
        </td>
     

    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

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
																Image Details :Tag 
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
																		<td width="25%" nowrap="nowrap">
																			FileName
																		</td>
																		<td width="25%">
																			Category
																		</td>
																		<td width="25%">
																			Sub Folder
																		</td>
																		<td width="25%">
																			Document Name
																		</td>
																			<td width="10%">Select <%	if (tageedImageList != null && tageedImageList.size()>0) { %>
												<input type="checkbox" name="list11" id="list11"
													value="Check All" onClick="checkedAllImages()" /> <%} %>
												</td>
																	</tr>
																</thead>
																<tbody>
																	<%
																		int counter1 = 0;

																			if (tageedImageList != null && tageedImageList.size()>0) {
																				for (Iterator it = tageedImageList.iterator(); it.hasNext();) {

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
																		<td width="25%">
																		&nbsp;
<%if(obImageUploadAdd.getStatus()==3){ %>	
<a href="#"
onclick="getImageGallary('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=counter1-1%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>
<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>																		</td>
																		<td width="25%">
																			&nbsp;
																	<integro:common-code-single  entryCode="<%=obImageUploadAdd.getCategory()%>"
                                    								categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY %>" display="true" descWithCode="false" />
																		</td>
																		<td width="10%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getSubfolderName()%>"/>
																		</td>
																		<td width="10%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getDocumentName()%>"/>
																		</td>
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
																	<tr class="even">
																		<td colspan="6">
																			No Records Found.
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
<tr>

    <td colspan="2">
        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
													<tr><td colspan="4">
																Customer Details
														</td>
													</tr>
												</thead>
            <tbody>
                <tr class="even">
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.name"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=customerName %>" />&nbsp;</td>
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.id"/></td>
                    <td width="30%"><bean:write name="ImageTagMapForm" property="custId"/>&nbsp;</td>
                </tr>
                <tr class="odd">
					<td width="25%" class="fieldname" >Document Type</td>
					<td width="25%" class="even" colspan="4">
					<bean:write name="ImageTagMapForm" property="docType"/>
						&nbsp;
					</td>
				</tr>     
<%//if(IImageTagConstants.SECURITY_DOC.equals(obImageTagDetails.getDocType())) {%>
<logic:equal name="ImageTagMapForm" property="docType" value="<%=IImageTagConstants.SECURITY_DOC%>">
                <tr class="odd">
					<td width="25%" class="fieldname" >Security Type</td>
					<td width="25%" class="even" >
						<bean:write name="ImageTagMapForm" property="secTypeLabel"/>&nbsp;
					</td>
					<td width="25%" class="fieldname" >Document Description</td>
					<td width="25%" class="even">
					<bean:write name="ImageTagMapForm" property="secSubtypeLabel"/>&nbsp;
					</td>
				</tr>     
                <tr class="odd">
					<td width="25%" class="fieldname" >Security</td>
					<td width="25%" class="even" colspan="4">
					<bean:write name="ImageTagMapForm" property="securityId"/>&nbsp;
					</td>
				</tr>   
</logic:equal>				  
<%//} else if(IImageTagConstants.FACILITY_DOC.equals(obImageTagDetails.getDocType())){ %>
<logic:equal name="ImageTagMapForm" property="docType" value="<%=IImageTagConstants.FACILITY_DOC%>">
                <tr class="odd">
					<td width="25%" class="fieldname" >Facility</td>
					<td width="25%" class="even" colspan="4">
						<bean:write name="ImageTagMapForm" property="facilityIdLabel"/>
						<%if(failitySourceID!=null){ %>
							&nbsp;-&nbsp;<integro:common-code-single categoryCode="<%=ICMSConstant.CATEGORY_SOURCE_SYSTEM%>" entryCode="<%=failitySourceID%>" display="true" descWithCode="false"  />
						<%} %>
						&nbsp;
					</td>
				</tr>     
</logic:equal>
<%//} %>
                <tr  class="even">
					<td width="25%" class="fieldname" >Document Description</td>
					<%if(!imageTagMapForm.getDocType().equals("CAM_NOTE")){ %>
					<td width="25%" class="even" colspan="4">
<input type="hidden" id="dd" value="<%=imageTagMapForm.getDocDesc()%>"/>
						<bean:write name="ImageTagMapForm" property="docDescLabel"/>&nbsp;
					</td>
					<%}else{%>
					<td width="25%" class="even" colspan="4">
					<%=imageTagMapForm.getDocDesc().substring(0,13) %>
					</td>
					<%} %>
				</tr>     
             <%if(!imageTagMapForm.getDocType().equals("CAM_NOTE")){ %>		  
               <tr  class="even">
			    <td width="25%" class="fieldname">
			     	Status
				</td>
				<td>
				<input  type="text" readonly="readonly" id="docStatus" />
							&nbsp;
			      </td>
			       <td width="25%" class="fieldname">
			     	Document Date
				</td>
				<td>
				<input  type="text" readonly="readonly" id="docDate" />
							&nbsp;
			      </td>
			</tr>		
			<tr  class="even">
			    <td width="25%" class="fieldname">
							Received Date
				</td>
				<td>
				<input type="text" readonly="readonly" id="receivedDate"/>
							&nbsp;
			                
			      </td>
			      <td width="25%" class="fieldname">
							Document Amount
				</td>
				<td>
				<input type="text" readonly="readonly" id="docAmt"/>
							&nbsp;
			                
			      </td>
			</tr>	
			<%}else{ %>	    
			<tr  class="even">
			    <td width="25%" class="fieldname">
			     	CAM Type
				</td>
				<td>
				<%=camInfo.getCamType() %>	&nbsp;
			      </td>
			       <td width="25%" class="fieldname">
			     	CAM Date
				</td>
				<td>
				<%=camInfo.getApprovalDate() %>
							&nbsp;
			      </td>
			</tr>	
			<tr  class="even">
			    <td width="25%" class="fieldname">
			     	CAM Expiry Date
				</td>
				<td colspan="3">
				<%=camInfo.getNextAnnualReviewDate() %>
							&nbsp;
			      </td>			       
				
			</tr>	
			<%} %>		    
</tbody>
</table>
</td></tr></tbody></table>

</td>

</tr>
</table>
<p align="center">
<a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
	<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
</a>
</p>

</html:form>
</body>
</html>



