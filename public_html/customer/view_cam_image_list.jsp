<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="com.integrosys.cms.ui.manualinput.aa.AADetailForm"%>
<%@page import="com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptForm"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%
	String context = request.getContextPath() + "/";
%>
<%
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
String event=(String)request.getAttribute("event");
System.out.println("////////////////************** event-"+event);
OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
List list1 =  (ArrayList) request.getAttribute("tagDetailList");
List list2 =  (ArrayList) session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.tagDetailList");
System.out.println("tagDetailList.size : "+list1);
System.out.println("tagDetailList.size : "+list2);
String rowClass = "";
String custId = (String)request.getAttribute("custId");
String custLimitProfileID=request.getParameter("custLimitProfileID");
HashMap selectedArrayMap =new HashMap();
String customerName = request.getParameter("customerName");

String category = request.getParameter("category");
//System.out.println("custId : "+custId);
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
<script type="text/javascript" src="js/imageNavigation.js"></script>

<link href="<%=context%>greybox/set/set.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/set/set.js"></script>

<link href="<%=context%>greybox/gallery/gallery.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/gallery/gallery.js"></script>


<script language="JavaScript" type="text/JavaScript">

insertHeader();
insertMenu('examples');






function pageLoad()
{
	alert("page Loaded");
}	
function getImageForDisplayCAMDoc(imagePath,imageName,status) {
	   /*var dep = 'imagePath';
	   var url = '/cms/CustomerProcess.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	   sendLoadImagePathReq(dep, url);*/
	document.getElementById("imageFrame").src= '/cms/CustomerProcess.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	}

function getImageGallaryCAMDoc(imagePath,imageName,status,count) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
  
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
  //alert("getImageGallary");
	//alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+catg);
	//alert("count is "+count);
	document.forms[0].action="CustomerProcess.do?event=retrieveImageGallaryCAMNote&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg+"&imageId="+s_value+"&unCheckId="+n_value;
	document.forms[0].submit();
}

function downloadImage(imagePath,imageName,status){ //v3.0
	var aLocation = "CustomerProcess.do?event=downloadImage&imageName="+imageName+"&pID="+imagePath+"&status="+status;
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
	    var aLocation = "CustomerProcess.do?event=downloadImage&custId=<%=custId%>&imageId="+s_value+"&unCheckId="+n_value;
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
function printPage() {
	var s_value = "";
	var n_value = "";
	//alert("document.forms[0].selected.length "+document.forms[0].selected.length);
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
	var custId1= "";
	var customerName= "";
	//alert("ddddd");

	if(s_value!=''){
		 //document.forms[0].method="POST";
		//document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    //alert("ddddd11111111");
	   MM_openBrWindow1("CustomerProcess.do?event=print_image&custId=<%=custId%>&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100');
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}
</script>
</head>
<html:form action="MIAADetail" >
<body> 

<input type="hidden" name="event"  />
<table width="100%" >
<tr>
<td>
<html:hidden property="startIndex" />

<input type="hidden" name="customerName" value="<%=customerName%>">
<input type="hidden" name="category" value="<%=category%>">
<input type="hidden" name="dmsImagePath"/>


<br>
<br>
	
<table width="95%"   class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"
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
																		<td width="20%">
																			Category
																		</td>
																		<td width="20%">
																			Sub Folder
																		</td>
																		<td width="20%">
																			Document Name
																		</td>
																		<td width="20%">
																			Select
																		
																		<input type="checkbox" name="list11" id="list11" value="Check All" onclick="checkedAllImages()"/> 
																		
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

																		<td width="25%">
																			&nbsp;
<%if(obImageUploadAdd.getStatus()==3){ %>																				
																		<a href="#"
onclick="javascript:getImageGallaryCAMDoc('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=counter1-1%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>	<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>


																			
																		</td>
																		<td width="25%">
																			&nbsp;
																			<%System.out.println("///////////////// obImageUploadAdd.getCategory() ///"+obImageUploadAdd.getCategory()); %>
																	<integro:common-code-single  entryCode="<%=obImageUploadAdd.getCategory()%>"
                                    								categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY %>" display="true" descWithCode="false" />
																		</td>
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getSubfolderName()%>"/>
																		</td>
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getDocumentName()%>"/>
																		</td>
																<%--		<td width="20%">
																			&nbsp;
																			
																			
																			
<a href="#"
onclick="downloadImage('<%=obImageUploadAdd.getImageFilePath()%>','<%=obImageUploadAdd.getImgFileName()%>','<%=obImageUploadAdd.getStatus()%>')">Download
</a>

																			
																			
																		</td> --%>
													<td width="10%">&nbsp; <%if(selectedArrayMap.containsKey(String.valueOf(obImageUploadAdd.getImgId()))){ %>
														<input type="checkbox" id="selected" name="selected" value="<%=counter1%>" onClick="toggleSelectAll()" checked="checked" />
														 <%}else{ %>
														<input type="checkbox" id="selected" name="selected"value="<%=counter1%>" onClick="toggleSelectAll()" /> 
														<%} %>
														</td>
																	</tr>
																	<%
																		}
																			}else{
																	%>
																	<tr class=<%=rowClass%>>
																		<td colspan="6">
																			Sorry,No records found.
																		</td>
																	</tr>
																	<%} %>
																</tbody>
																


</table>
</tbody>
</table>

<p align="center">
<%if("view_cam_image".equals(event)){ %>
<a href="CustomerProcess.do?event=processcusdetails">
	<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
</a>
<%}%>
</p>
</td>
</tr>
</table>
</body>
</html:form>

</html>



