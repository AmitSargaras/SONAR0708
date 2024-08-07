<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
String userType=(String)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.userType");
System.out.println("==============================userType==============================="+userType);
ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
String catg="";
String docTye="";
String custLimitProfileID=request.getParameter("custLimitProfileID");
if(imageTagMapForm!=null){
	catg=imageTagMapForm.getCategory();
	docTye=imageTagMapForm.getDocType();
}
    String rowClass = "";
	String recordsString = PropertyManager.getValue("customer.pagination.nitems");
	list1 = (ArrayList) request.getAttribute("obImageTagAddList");

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

	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	int sno = 0;
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
insertHeader();
insertMenu('examples');
function closePageTag() {
    document.forms[0].action="ImageTag.do?event=image_tag";
    document.forms[0].submit();
}
function submitPageTagView() {
	var docDesc = document.forms[0].docDesc.value;
	if(docDesc==''){
		alert("Please select document for tagging.");
	}else{
	document.forms[0].action="ImageTagMap.do?event=prepare_tag_view_image_list&customerName=<%=customerName%>";
    document.forms[0].method="POST";
    document.forms[0].submit();
	}
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
	else if(docTypeCode=='CAM_DOC'
		||docTypeCode=='RECURRENTDOC_DOC'
		||docTypeCode=='OTHER_DOC'
			||docTypeCode=='LAD_DOC'	){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		
		dep = 'docDesc';
		url ='/cms/ImageTag.do?event=refresh_cheklist&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
	}else if(docTypeCode=='CAM_NOTE'){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		//document.getElementById('stat').style.display = 'none';
		//document.getElementById('camFields').style.display = 'none';
		
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
   var dep = 'secSubtype';
   var url = '/cms/MISecurity.do?event=refresh_subtype&securityType='+curSel; 
   clearDisplayDropdown('securityId');
   clearDisplayDropdown('docDesc');
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

   var dep = 'securityId';
   var url = '/cms/ImageTagMap.do?event=refresh_security_id&custLimitProfileID=<%=custLimitProfileID%>&securitySubType='+curSel;
   clearDisplayDropdown('docDesc'); 
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
</script>
</head>
<body >
		
<html:form action="/ImageTagMap">
<html:hidden name="event" property="event" value="save_image_tag"/>
<input type="hidden" name="custLimitProfileID" value="<%=custLimitProfileID%>" />
<html:hidden name="ImageTagMapForm" property="imgId" />
<html:hidden name="ImageTagMapForm" property="id" />
<html:hidden name="ImageTagMapForm" property="custId" value="<%=custId%>"/>
<input type="hidden" name="customerName" value="<%=customerName%>"/>
<input type="hidden" name="dmsImagePath"/>
<%
if (custLimitProfileID != null && "0".equals(custLimitProfileID)) {
%>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		    <tr>
		        <td nowrap="nowrap" width="100%">
						<font face=Tahoma size=4 color="#FF0000">No CAM found for selected customer,can't proceed for image untagging.</font>
		        </td>
		    </tr>
		</table>
<%
	}
%>
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

    <td colspan="2">
        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
				<tr>
					<td colspan="4">
							Customer Details
					</td>
				</tr>
			</thead>
            <tbody>
                <tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
                    <td class="fieldname" width="25%"><bean:message key="label.list.party.name"/></td>
                    <td width="25%"><integro:empty-if-null value="<%=customerName%>"/>&nbsp;</td>
                    <td class="fieldname" width="25%"><bean:message key="label.list.party.id"/></td>
                    <td width="25%"><integro:empty-if-null value="<%=custId%>"/>&nbsp;</td>
                </tr>
                <tr class="odd">
				<td width="25%" class="fieldname" >Document Type</td>
				<td width="25%" class="even" colspan="4">
				<%
				if (custLimitProfileID != null && "0".equals(custLimitProfileID)) {
				%>
				<html:select property="docType" onchange="javascript:refreshDropwdowns(this)" disabled="true">
             		<integro:common-code 
             			categoryCode="DOC_TYPE" descWithCode="false" />
                 </html:select>&nbsp;<html:errors property="docTypeError"/>
                 <%}else{ %>
				<html:select property="docType" onchange="javascript:refreshDropwdowns(this)">
             		<integro:common-code 
             			categoryCode="DOC_TYPE" descWithCode="false" />
                 </html:select>&nbsp;<html:errors property="docTypeError"/>
                 <%} %>
				</td>
				</tr>  
                  
			<tr class="odd">
			<td colspan="4">
			<table width="100%" id="facilityFields" border="0" cellspacing="0" cellpadding="0" class="tblInfo"
			<%if(!IImageTagConstants.FACILITY_DOC.equals(docTye)){%>
				style="display: none;" 
			<%} %>
			>
			<tr>
				<td colspan="4">
						<br>
					</td>
				</tr>
			<tr class="odd">
			    <td width="30%" class="fieldname">
							Facility Name
				</td>
				<td colspan="3" width="70%">
							<html:select name="ImageTagMapForm" property="facilityId" onchange="javascript:refreshDocumentChecklist(this)">
					      		<option value="">Please Select </option>	
			                    <html:options collection="facilityIdList" property="value" labelProperty="label"/>
			                </html:select>&nbsp;<html:errors property="facilityIdError"/>
			                
			      </td>
			</tr>			
			</table>
			</td>
			</tr>
                <tr class="odd">
                <td colspan="4">
			<table width="100%" id="collateralFields" border="0" cellspacing="0" cellpadding="0" class="tblInfo"
			<% if(!IImageTagConstants.SECURITY_DOC.equals(docTye)){%>
						style="display: none;" 
			<%} %>
			>
			<tr>
					<td colspan="4">
						<br>
					</td>
			</tr>
			<tr class="odd">
                <td width="25%" class="fieldname">
					Collateral Type
				</td>
				<td width="25%" class="">
					<html:select name="ImageTagMapForm" property="secType" onchange="javascript:refreshSubtype(this)">
					      <option value="">Please Select </option>	
                	      <html:options collection="secTypeList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;<html:errors property="secTypeError"/>
                 </td>
			
             <td width="25%" class="fieldname">
             	Collateral subType 
             </td>
             <td width="25%">
             	<html:select name="ImageTagMapForm" property="secSubtype" onchange="javascript:refreshSecurityId(this)">
		      			<option value="">Please Select </option>	
                      	<html:options collection="secSubtypeList" property="value" labelProperty="label"/>
                </html:select>&nbsp;<html:errors property="secSubtypeError"/>
              </td>
			</tr>
		
			<tr class="even">
				<td width="25%" class="fieldname" >
					Security ID
				</td>
				<td class="even" colspan="3">
					<html:select name="ImageTagMapForm" property="securityId" onchange="javascript:refreshDocumentChecklist(this)">
			      		<option value="">Please Select </option>	
	                    <html:options collection="securityIdList" property="value" labelProperty="label"/>
	              	</html:select>&nbsp;<html:errors property="securityIdError"/>
					</td>
				</tr>
			</table>
			</td>
			</tr>      
			
			<tr class="odd">
				<td colspan="4">
						<table width="100%" id="docDescFields" border="0" cellspacing="0" cellpadding="0" class="tblInfo"
						<% if(!(IImageTagConstants.CAM_DOC.equals(docTye)||IImageTagConstants.FACILITY_DOC.equals(docTye)||IImageTagConstants.SECURITY_DOC.equals(docTye))){%>
								style="display: none;" 
						<%} %>
							>
							<tr>
								<td colspan="4">
									<br>
								</td>
							</tr>
							<tr class="odd">					
								<td width="30%" class="fieldname" >Document Description</td>
								<td colspan="3" width="70%">
								<html:select name="ImageTagMapForm" property="docDesc" >
								 	<option value="">Please Select </option>
				             		<html:options collection="documentItemList" property="value" labelProperty="label"/>
				                 </html:select>&nbsp;<html:errors property="docDescError"/>
								</td>
							</tr>
						</table>
						</td>
				</tr>      
            </tbody>
        </table>
    </td>
</tr>
<%//} %>
</tbody>
</table>
<p align="center">

	<%
	if (custLimitProfileID != null&& !"0".equals(custLimitProfileID)) {
	%>
	<a href="javascript:submitPageTagView();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/view2.gif',1)" >
	 	<img src="img/view1.gif" name="Image3311" border="0" id="Image3311" />
	</a>
	<%}%>
	<a href="javascript:closePageTag();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
		<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
	</a>
</p>
</html:form>
</body>
</html>



