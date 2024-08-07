<%@page import="com.integrosys.component.user.app.bus.OBCommonUser"%>
<%@ page
	import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.ui.cci.CounterpartyUIHelper,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.ui.image.ImageUploadForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.*,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.math.BigDecimal,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 java.util.Collection,
                 java.util.HashMap,
                 com.integrosys.cms.app.image.bus.OBImageUploadAdd,
                 java.util.Iterator
                 "%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% String context = request.getContextPath() + "/"; 


ImageUploadAddForm form=(ImageUploadAddForm) request.getAttribute("imageUploadAddForm");
//System.out.println("================custID==="+form.getCustId());
String imgUploadMethod = PropertyManager.getValue("image.upload.method","jupload");	
OBCommonUser user = (OBCommonUser) session.getAttribute("global.ILosUser");
long userID=user.getUserID();
request.setAttribute("customerName",form.getCustName());
request.setAttribute("legalName",form.getCustId());
String facilityNameFromFCode = (String)request.getAttribute("facilityNameFromFCode");
System.out.println("Facility Name From Facility Code: "+facilityNameFromFCode);
//String camNumber = (String)request.getAttribute("camNumber");
//System.out.println("CAM Number: "+camNumber);
//form.setHasCam(camNumber);
System.out.println("Category == "+form.getCategory());
String category = form.getCategory();
String imageUploadCategory = ICMSConstant.IMAGE_CATEGORY_SECURITY;

/* if("IMG_CATEGORY_FACILITY".equals(category)){
	form.setCategory("Facility");
}else if(imageUploadCategory.equals(category)){
	form.setCategory("Security");
}else if("IMG_CATEGORY_CAM".equals(category)){
	form.setCategory("CAM");
} */

String formCategory=form.getCategory();
String formDocName=form.getDocumentName();
String formSubFolder = form.getSubfolderName();
System.out.println("formCategory:"+formCategory);
System.out.println("formSubFolder:"+formSubFolder);
System.out.println("formDocName:"+formDocName);
//replacing space with asci character as space is not allowed in url
if(formCategory!=null ){
	formCategory=formCategory.replaceAll(" ", "%20");
}
if(formDocName!=null ){
	formDocName=formDocName.replaceAll(" ", "%20");
}

String bankName1=form.getBank();
System.out.println("================bank Name before setting==="+bankName1);

if(null!=bankName1){
	bankName1=bankName1.replaceAll(" ","%20");
	System.out.println("================bank Name after setting==="+bankName1);
}

%>



<%@page import="com.integrosys.cms.ui.image.ImageUploadAddForm"%><html>
<head>
<title>Customer Details</title>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script language="JavaScript" type="text/JavaScript">
function submitPage() {
    document.forms[0].action="ImageUploadAdd.do?event=save_image_upload";
    document.forms[0].method="POST";
    document.forms[0].submit();
}
function cancelPage() {
    document.forms[0].action="ImageUpload.do?event=image_upload";
    document.forms[0].submit();
}
function closePage() {
    document.forms[0].action="ImageUpload.do?event=image_upload";
    document.forms[0].submit();
}

function submitPageNew(userID,custId,category,facName,facDocName,
		otherFacDocName,secIdName,secDocName,otherSecDocName,camNumber,statementDocName,statementTyped,camDocName,
		otherDocName,bankName,securityIdi,subTypeSecurity) {
    var file = document.getElementById('fileUpload');
    if(validateFileExt(file)){
    	return;
    }else {
    	//document.forms[0].action="ProcessUploadRequestServlet?userID="+userID+"&CustId="+custId+"&Catg="+category+"&HasSF="+subFolder+"&sfName="+subFolderName+"&docName="+formDocName+"&bankName="+bankName;
    	document.forms[0].action="ProcessUploadRequestServlet?userID="+userID+"&CustId="+custId+"&Catg="+category+"&facName="+facName+
		   "&facDocName="+facDocName+"&otherFacDocName="+otherFacDocName+"&secName="+secIdName+"&secDocName="+secDocName+"&othersecDocName="+otherSecDocName+
		   "&camNum="+camNumber+"&statementdocName="+statementDocName+"&statementType="+statementTyped+"&camDocName="+camDocName+
		   "&otherDocName="+otherDocName+"&bankName="+bankName+"&securityIdi="+securityIdi+"&subTypeSecurity="+subTypeSecurity;
    	
    	document.forms[0].method="POST";
    	document.forms[0].submit();
    	newShowSilkScreen();
    }
 }

function submitDocLinkage(){
	document.forms[0].action= 'ImageUploadAdd.do?event=get_doc_linkage&newSession=Y';
	document.forms[0].submit();
}
 
function validateFileExt(file){
	var allowedFileExtensions = "jpeg/tif/tiff/pdf";
	var errorFlag = false;
	var value = file.value;
	if(value ==''){
		alert("Please upload file");
		return true;
	}
	
	var files = value.split(",");
	for(var i = 0; i<files.length; i++){
		var file = files[i];
		var fileExt = file.substring(file.lastIndexOf(".") + 1, file.length);
		var fileExt = fileExt ? fileExt.toLowerCase() : fileExt;
		if(!fileExt || allowedFileExtensions.indexOf(fileExt) < 0){
			errorFlag = true;
			alert("File format should be of type " + allowedFileExtensions);
			break;
		}
	}
	return errorFlag;
 } 

</script>
</head>

<body topmargin="1" leftmargin="5">
<html:form action="/ImageUploadAdd" enctype="multipart/form-data">
	<html:hidden name="event" property="event" value="save_image_upload" />
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3>Customer Details</h3>
				<html:errors property="numericLengthError"></html:errors></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr />
				</td>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td colspan="2">
				<table width="95%" border="0" cellspacing="0" cellpadding="0"
					class="tblInfo">
					<thead>
					</thead>
					<tbody>
						<tr class="even">
							<td class="fieldname" width="20%"><bean:message
								key="label.list.party.name" /></td>
							<td width="30%"><bean:write name="imageUploadAddForm"
								property="custName" /></td>
							<td class="fieldname" width="20%"><bean:message
								key="label.list.party.id" /></td>
							<td width="30%"><bean:write name="imageUploadAddForm"
								property="custId" /></td>
						</tr>
					</tbody>

				</table>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
				<% if (imgUploadMethod.equalsIgnoreCase("zip")) { %>
				<table width="80%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblFormSection">
					<thead>
						<br>
						<br>
						<br>
						<br>
						<br>
						<tr>
							<td align="center">
							<h3>Upload .zip File for Images.</h3>
							</td>
						</tr>
						<tr>
							<td>
							<hr width="50%" />
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td valign="bottom" align="center"><html:file
								property="imageFile" size="50"></html:file></td>
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
						<td colspan="2"><a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick="submitPage()"><img src="img/submit1.gif"
							name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;</td>
						<td>
						<center><a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
						</a></center>
						&nbsp;</td>

					</tr>

					<tr>
						<td colspan="2"></td>
					</tr>
				</table>
				<% } else {
String facName=form.getFacilityName();
String facDocName=form.getFacilityDocName();
String otherFacDocName = form.getOtherDocName();

String secIdName=form.getSecurityNameId();
String secDocName=form.getSecurityDocName();
String otherSecDocName = form.getOtherSecDocName();

String statementTyped=form.getStatementTyped();
String statementDocName=form.getStatementDocName();
String camNumber = form.getHasCam();
String camDocName = form.getCamDocName();
String otherDocName = form.getOthersDocsName();
String bankName = form.getBank();
String securityIdi = form.getSecurityIdi();
String subTypeSecurity = form.getSubTypeSecurity();


System.out.println("facName:"+facName);
System.out.println("facDocName:"+facDocName);
System.out.println("otherFacDocName:"+otherFacDocName);
System.out.println("secIdName:"+secIdName);
System.out.println("secDocName:"+secDocName);
System.out.println("otherSecDocName:"+otherSecDocName);
System.out.println("statementTyped:"+statementTyped);
System.out.println("statementDocName:"+statementDocName);
System.out.println("camNumber:"+camNumber);
System.out.println("camDocName:"+camDocName);
System.out.println("otherDocName:"+otherDocName);
System.out.println("bankName:"+bankName);
System.out.println("securityIdi:"+securityIdi);
System.out.println("subTypeSecurity:"+subTypeSecurity);
//replacing space with asci character as space is not allowed in url
if(facName!=null ){
	facName=facName.replaceAll(" ", "%20");
}
if(facDocName!=null ){
	facDocName=facDocName.replaceAll(" ", "%20");
}
if(otherFacDocName!=null ){
	otherFacDocName=otherFacDocName.replaceAll(" ", "%20");
}
if(secIdName!=null ){
	secIdName=secIdName.replaceAll(" ", "%20");
}
if(secDocName!=null ){
	secDocName=secDocName.replaceAll(" ", "%20");
}
if(otherSecDocName!=null ){
	otherSecDocName=otherSecDocName.replaceAll(" ", "%20");
}

if(statementTyped!=null ){
	statementTyped=statementTyped.replaceAll(" ", "%20");
}
if(statementDocName!=null ){
	statementDocName=statementDocName.replaceAll(" ", "%20");
}
if(camNumber!=null ){
	camNumber=camNumber.replaceAll(" ", "%20");
}
if(camDocName!=null ){
	camDocName=camDocName.replaceAll(" ", "%20");
}
if(otherDocName!=null ){
	otherDocName=otherDocName.replaceAll(" ", "%20");
}
if(bankName!=null ){
	bankName=bankName.replaceAll(" ", "%20");
}

if(securityIdi!=null ){
	securityIdi=securityIdi.replaceAll(" ", "%20");
}

if(subTypeSecurity!=null ){
	subTypeSecurity=subTypeSecurity.replaceAll(" ", "%20");
}

%>

 
<table align="center"  width="55%"  border="0" cellpadding="0" cellspacing="0" class="tblFormSection" >
<tr>
	<td align="center"><input type="file" id="fileUpload" name="formFile" enctype="multipart/form-data" onkeydown="this.blur();" size="50" multiple/>
    <input class="btnNormal" type="button" name="btnAddXRef" id="btnAddXRef" value="Upload files" onclick="submitPageNew('<%=userID%>','<%=form.getCustId()%>','<%=category%>','<%=facName%>','<%=facDocName%>',
	'<%=otherFacDocName%>','<%=secIdName%>','<%=secDocName%>','<%=otherSecDocName%>','<%=camNumber%>','<%=statementDocName%>','<%=statementTyped%>','<%=camDocName%>',
	'<%=otherDocName%>','<%=bankName%>','<%=securityIdi%>','<%=subTypeSecurity%>')"/>&nbsp;		
	<input class="btnNormal" type="button" id="btnDocLinkage" value="Document Linkage" onclick="submitDocLinkage();"/>&nbsp;
	</td>
	
	
<!-- Image Upload Applet End Here -->

					</tr>
				</table>
				<% } %>
				</td>
			</tr>
	</table>
	<!--<p align="center">

<a href="#">
        <img src="<%=context%>img/next1.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="submitPage();"/>
    </a>
    <a href="#">
        <img src="<%=context%>img/close1a.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="closePage();"/>
    </a>
</p>

-->
</html:form>
</body>
</html>



