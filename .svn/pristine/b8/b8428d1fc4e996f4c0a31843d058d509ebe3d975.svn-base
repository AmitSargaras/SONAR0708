<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			   boolean isCputUserChecker=false;
			    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
			    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_CHECKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
			    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
			    	isCputUserChecker=true;
			    }		
%>
<%
	int counter = 0;
	String [] obImageUploadAdd = new String[6];
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
	ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
String catg="";
String docTye="";
String custLimitProfileID=request.getParameter("custLimitProfileID");
if(imageTagMapForm!=null){
	catg=imageTagMapForm.getCategory();
	docTye=imageTagMapForm.getDocType();
}
    String rowClass = "";
	String recordsString = PropertyManager
			.getValue("customer.pagination.nitems");
	list1 = (ArrayList) request.getAttribute("migCheckListImages");
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
	String customerName = request.getParameter("customerName");
	String legalName = request.getParameter("legalName");
	String custId = request.getParameter("custId");
	String category = request.getParameter("category");
	SearchResult customerList = (SearchResult) request
			.getAttribute("customerList");

	String documentID = request.getParameter("documentID");
	String documentVersion = request.getParameter("documentVersion");
	String documentType = request.getParameter("documentType");
	
	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	int sno = 0;
	// System.out.println("value of records_per_page"+records_per_page);
%>


<head>
    <title>Customer Details</title>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />
<!--<script>  
    window.onload = function() {
	    alert('Hi there!');  
    }  
 </script>--> 	
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





<script type="text/javascript">
var image_set = [{'caption': 'Flower', 'url': 'http://static.flickr.com/119/294309231_a3d2a339b9.jpg'},
                 {'caption': 'Nice waterfall', 'url': 'http://www.widerange.org/images/large/plitvicka.jpg'}];
</script>

<script language="JavaScript" type="text/JavaScript">
function submitPage() {

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
		document.forms[0].action="ImageTagMap.do?event=save_image_tag&imageId="+c_value;
	    document.forms[0].method="POST";
	    document.forms[0].submit();
	} else{
		alert("Please select the image for tagging.");
	}
}
insertHeader();
insertMenu('examples');
function cancelPage() {
    document.forms[0].action="ImageTag.do?event=image_tag";
    document.forms[0].submit();
}
function closePage() {
	document.forms["RecurrentDocReceiptForm"].event.value="list";
	document.forms["RecurrentDocReceiptForm"].submit();
}
function returnPage() {
    document.forms["RecurrentDocReceiptForm"].event.value = "list";
    document.forms["RecurrentDocReceiptForm"].submit();
}

function getImageGallaryRecurrentDoc(imagePath,imageName,status,count) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
  var catg= document.forms[0].category.value;
  //alert("getImageGallary");
	//alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+catg);
	//alert("count is "+count);
	document.forms[0].action="RecurrentDocReceipt.do?event=retrieveMigImageGallaryRecurrentDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg;
	document.forms[0].submit();
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



function refreshDropwdowns(dropdown)
{
	var docTypeCode = document.forms[0].docType.value;
	var dep;
	var url;
	if(docTypeCode=='FACILITY_DOC'){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = '';
		document.getElementById('docDescFields').style.display = '';
		
		dep = 'facilityId';
		url ='/cms/ImageTag.do?event=refresh_dropdowns&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
		}
	else if(docTypeCode=='SECURITY_DOC'){
		document.getElementById('collateralFields').style.display = '';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		
		dep = 'secType';
		url ='/cms/ImageTag.do?event=refresh_dropdowns&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
		}
	else if(docTypeCode=='CAM_DOC'){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		
		dep = 'docDesc';
		url ='/cms/ImageTag.do?event=refresh_cheklist&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
	}else{
			document.getElementById('collateralFields').style.display = 'none';
			document.getElementById('facilityFields').style.display = 'none';
			document.getElementById('docDescFields').style.display = 'none';	
	}
	 clearDisplayDropdown('docDesc');
	 sendLoadDropdownReq(dep, url);
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
 clearDisplayDropdown('securityId');
 clearDisplayDropdown('docDesc');
   var dep = 'secSubtype';
   var url = '/cms/MISecurity.do?event=refresh_subtype&securityType='+curSel; 
   sendLoadDropdownReq(dep, url);
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
   clearDisplayDropdown('docDesc');
   var dep = 'securityId';
   var url = '/cms/ImageTagMap.do?event=refresh_security_id&custLimitProfileID=<%=custLimitProfileID%>&securitySubType='+curSel; 
   sendLoadDropdownReq(dep, url);
}	

function refreshDocumentChecklist(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }
 var docTypeCode =document.forms[0].docType.value;
	 var dep = 'docDesc';;
	 var url ; 
	 
	if(docTypeCode=='FACILITY_DOC'){
		url ='/cms/ImageTag.do?event=refresh_cheklist&custLimitProfileID=<%=custLimitProfileID%>&facilityId='+curSel+'&docTypeCode='+docTypeCode; 
	}else if(docTypeCode=='SECURITY_DOC'){
		url ='/cms/ImageTag.do?event=refresh_cheklist&custLimitProfileID=<%=custLimitProfileID%>&securityId='+curSel+'&docTypeCode='+docTypeCode; 
		}
	
   sendLoadDropdownReq(dep, url);
}	
function pageLoad()
{
	alert("page Loaded");
}	
function getImageForDisplayRecurrentDocDoc(imagePath,imageName,status) {
	   /*var dep = 'imagePath';
	   var url = '/cms/RecurrentDocReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	   sendLoadImagePathReq(dep, url);*/
	document.getElementById("imageFrame").src= '/cms/RecurrentDocReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	}
</script>
</head>
<body> 
		
<html:form action="RecurrentDocReceipt" >
<html:hidden property="event" />

<input type="hidden" name="documentID" value="<%=documentID %>"/>
<input type="hidden" name="documentType" value="<%=documentType %>"/>
<input type="hidden" name="documentVersion" value="<%=documentVersion%>">

<input type="hidden" name="custLimitProfileID" value="<%=custLimitProfileID%>" />
<input type="hidden" name="category" value="<%=category%>">
<input type="hidden" name="customerName" value="<%=customerName%>">
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
																			Document Id
																		</td>
																		<td width="25%">
																			Document Version
																		</td>
<!--																		<td width="20%">-->
<!--																			Select-->
<!--																		</td>-->
																	</tr>
																</thead>
																<tbody>
																	<%
																		int counter1 = 0;

																			if (list1 != null && list1.size()>0) {
																				for (Iterator it = list1.iterator(); it.hasNext();) {
																					 int status=0;	
																					obImageUploadAdd = (String[]) it.next();
																					  String DocumentType=(String)obImageUploadAdd[0];
																					  String DocumentId=(String)obImageUploadAdd[1];
																					  String DocumentVersion=(String)obImageUploadAdd[2];
																					  String DocumentPath=(String)obImageUploadAdd[3];
																					  String DocumentName=(String)obImageUploadAdd[4];
																					  String DocumentStatus=(String)obImageUploadAdd[5];
																					  if(DocumentStatus!=null){
																						  status=Integer.parseInt(DocumentStatus);
																					  }
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
																			String subs = DocumentName;
																						//subs = subs.substring();
																		%>

																		<td width="25%">
																			&nbsp;
																			<%if(status==3){ %>
																		<a href="#"
onclick="javascript:getImageGallaryRecurrentDoc('<%=DocumentPath%>','<%=DocumentName%>','<%=status%>','<%=counter1-1%>')"><%=DocumentName%>
</a>	
<%}else{ %>
<%=DocumentName%>
<%} %>
																			
																		</td>
																		
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=DocumentType%>"/>
																		</td>
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=DocumentId%>"/>
																		</td>
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=DocumentVersion%>"/>
																		</td>
																	</tr>
																	<%
																		}
																			}else{
																	%>
																	<tr class=<%=rowClass%>>
																		<td colspan="5">
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
 <%   if (isCputUserChecker) { %>
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



