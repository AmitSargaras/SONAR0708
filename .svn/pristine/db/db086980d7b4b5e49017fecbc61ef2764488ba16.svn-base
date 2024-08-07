<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.otherreceipt.OtherReceiptAction"%>
<%@page import="com.integrosys.cms.ui.image.IImageUploadAdd"%>
<%@page import="java.util.Map"%>
<%@page import="com.integrosys.cms.app.image.bus.OBImageUploadAdd"%>
<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@page import="com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	String context = request.getContextPath() + "/";
String checkListType = request.getParameter("checkListType");
LinkedList<Long> allImageIds = null;
String formAction = "";
String imageGalleryEvent = "";
String cancelEvent = "";
if(ICMSConstant.CHECKLIST_CAM.equals(checkListType)){
	allImageIds = (LinkedList) session.getAttribute(CAMReceiptAction.class.getName() + "." + ITagUntagImageConstant.ALL_IMG_IDS);
	formAction = "CAMReceipt";
	imageGalleryEvent = CAMReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_CAM_CHECKER_VIEW; 
	cancelEvent = CAMReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_VIEW;
}
else if(ICMSConstant.CHECKLIST_OTHER.equals(checkListType)){
	allImageIds = (LinkedList) session.getAttribute(OtherReceiptAction.class.getName() + "." + ITagUntagImageConstant.ALL_IMG_IDS);
	formAction = "OtherReceipt";
	imageGalleryEvent = OtherReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_OTHER_CHECKER_VIEW; 
	cancelEvent = OtherReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_VIEW;
}else if(ICMSConstant.CHECKLIST_FACILITY_F.equals(checkListType)){
	allImageIds = (LinkedList) session.getAttribute(FacilityReceiptAction.class.getName() + "." + ITagUntagImageConstant.ALL_IMG_IDS);
	formAction = "FacilityReceipt";
	imageGalleryEvent = FacilityReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_FACILITY_CHECKER_VIEW; 
	cancelEvent = FacilityReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_VIEW;
}else if(ICMSConstant.CHECKLIST_SECURITY_S.equals(checkListType)){
	allImageIds = (LinkedList) session.getAttribute(SecurityReceiptAction.class.getName() + "." + ITagUntagImageConstant.ALL_IMG_IDS);
	formAction = "SecurityReceipt";
	imageGalleryEvent = SecurityReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_SECURITY_CHECKER_VIEW; 
	cancelEvent = SecurityReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_VIEW;
}
else if(ICMSConstant.CHECKLIST_RECURRENT.equals(checkListType)){
	allImageIds = (LinkedList) session.getAttribute(RecurrentDocReceiptAction.class.getName() + "." + ITagUntagImageConstant.ALL_IMG_IDS);
	formAction = "RecurrentDocReceipt";
	String event = (String) request.getAttribute("event");
	/* if(RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_RECEIVE.equals(event)){
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_RECEIVE;
		cancelEvent = RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_FROM_RETRIEVE_RECEIVE;
	}
	else if(RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_UPDATE.equals(event)){
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_UPDATE;
		cancelEvent = RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_FROM_RETRIEVE_UPDATE;
	} */
	imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_CHECKER_VIEW;
	cancelEvent = RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_VIEW;
}

 
OBImageUploadAdd selectedOBImageUpload = (OBImageUploadAdd) request.getAttribute(ITagUntagImageConstant.SELECTED_OB_IMAGE_UPLOAD);

Integer currentIndex = (Integer) request.getAttribute(ITagUntagImageConstant.CURRENT_IMAGE_INDEX);
%>

<head>
<script type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />

     <script type="text/javascript" src="js/imageNavigation.js"></script>
<style type="text/css">
a:link {text-decoration: none;} //the original link with no underline
a:visited {text-decoration: none;} //the visited link with no underline
a:hover {text-decoration: underline;} //mouseover link and an underline appears
</style>
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

function backToTagUntagListing(){
	document.forms[0].event.value = "<%=cancelEvent%>";
	document.forms[0].submit();
}

function getImageGallery(imageId){
	if(imageId == 'first'){
		alert("This is the First Image");
		return;
	}
	else if(imageId == 'last'){
		alert("This is the Last Image");
		return;
	}
	document.forms[0].selectedGalleryImageId.value = imageId;
	document.forms[0].event.value = "<%=imageGalleryEvent%>";
	document.forms[0].submit();
}

</script>

</head>

<body>
<table width="100%" >
<tr><td>
<%
String documentName = "";
		if(currentIndex != null){
			if(selectedOBImageUpload != null){
				
				System.out.println("selectedOBImageUpload.getTypeOfDocument() =>"+selectedOBImageUpload.getTypeOfDocument());
				if("Facility".equals(selectedOBImageUpload.getTypeOfDocument())){ 
					
					if(selectedOBImageUpload.getFacilityDocName() != null && !"".equals(selectedOBImageUpload.getFacilityDocName())){
						documentName = selectedOBImageUpload.getFacilityDocName();
					}else{
						documentName = selectedOBImageUpload.getDocumentName();
					}
					
				}else if("Security".equals(selectedOBImageUpload.getTypeOfDocument())){ 
					if(selectedOBImageUpload.getSecurityDocName() != null && !"".equals(selectedOBImageUpload.getSecurityDocName())){
						documentName = 	selectedOBImageUpload.getSecurityDocName();
					}else{
						documentName = selectedOBImageUpload.getDocumentName();
					}
					
				}else if("CAM".equals(selectedOBImageUpload.getTypeOfDocument())){ 
					
					if(selectedOBImageUpload.getCamDocName() != null && !"".equals(selectedOBImageUpload.getCamDocName())){
						documentName = 	selectedOBImageUpload.getCamDocName();
					}else{
						documentName = selectedOBImageUpload.getDocumentName();
					}
					
				}else if("Statement".equals(selectedOBImageUpload.getTypeOfDocument())){ 
					if(selectedOBImageUpload.getStatementDocName() != null && !"".equals(selectedOBImageUpload.getStatementDocName())){
						documentName = selectedOBImageUpload.getStatementDocName() ;
					}else{
						documentName = selectedOBImageUpload.getDocumentName() ;
					}
				}
				else if("Other".equals(selectedOBImageUpload.getTypeOfDocument())){ 
					if(selectedOBImageUpload.getOthersDocsName() != null && !"".equals(selectedOBImageUpload.getOthersDocsName())){
						documentName = selectedOBImageUpload.getOthersDocsName() ;
					}else{
						documentName = selectedOBImageUpload.getDocumentName() ;
					}	
				}else{
					documentName = selectedOBImageUpload.getDocumentName() ;
				}
			}
		
	%>
		
	       
		<b style="font-size: x-small">Image Name :</b>&nbsp;<font size="2"><%=selectedOBImageUpload.getImgFileName() %></font></td><td>
		  
		 <b style="font-size: x-small">Category:</b>&nbsp;
		<font size="2"><integro:common-code
												categoryCode="IMG_UPLOAD_CATEGORY"
												entryCode="<%=selectedOBImageUpload.getCategory()%>"
												descWithCode="false"  display="true"/></font>
												
		</td><td>										
	<b style="font-size: x-small">Document Name:</b>&nbsp;<font size="2"><integro:empty-if-null value="<%=documentName %>"/> </font>
	
												<%} %>
												
												
</td></tr>
<tr>
<td>
<html:form action="<%=formAction%>">

	<html:hidden property="event"/>
	<html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="actionTypeName"/>
    <html:hidden property="index"/>
    <html:hidden property="secType"/>
    <html:hidden property="secSubType"/>
    <html:hidden property="secName"/>
    <html:hidden property="collateralID"/>
    <html:hidden property="collateralRef" />
    <html:hidden property="docCode"/>
	<html:hidden property="docNo"/>
	<html:hidden property="docDesc"/>
	<html:hidden property="selectedGalleryImageId" />
	<html:hidden property="selectedImageIds" />
</html:form>
		  <b style="font-size: x-small">Page : </b><font size="2"><%=currentIndex+1%>/<%=allImageIds.size()%></font>
		</td>
		<td colspan="2" align="left">
		<a href="javascript:getImageGallery('<%=allImageIds.getFirst()%>');" onmouseout="MM_swapImgRestore()" >
	<img src="img/first.jpg"  width="30" height="17" border="0"  align="middle"/>
</a>
<a href="javascript:getImageGallery('<%=currentIndex>0 ? allImageIds.get(currentIndex-1): "first"%>');">
	<img src="img/prev1.gif"  width="90" height="20" border="0"  align="middle"/>
</a>
<a href="javascript:getImageGallery('<%=currentIndex < allImageIds.size()-1 ? allImageIds.get(currentIndex+1): "last"%>');">
	<img src="img/next1.gif"  width="70" height="20" border="0"  align="middle"/>
</a>
<a href="javascript:getImageGallery('<%=allImageIds.getLast()%>');" >
	<img src="img/last.jpg"  width="30" height="17" border="0"  align="middle"/>
</a>
&nbsp;&nbsp;&nbsp;
<a href="javascript:backToTagUntagListing();">
	<img src="img/return1.gif"  width="70" height="20" border="0"  align="middle"/>
</a>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- A4 standard size is width="1010px" height="720px"  -->
</td>
</tr>
<%
String scaledHeight =PropertyManager.getValue("integrosys.image.scaledHeight")+"px";	
String scaledWidth = PropertyManager.getValue("integrosys.image.scaledWidth")+"px";	
%>
<tr>
<td colspan="3">
<iframe id="imageFrame" src="<%=request.getContextPath() %>/imageTag/viewImageZ.jsp" width="<%=scaledWidth%>" height="<%=scaledHeight%>" >
</iframe>
</td>
</tr>
</table>

<script type="text/javascript">  
    getImageByImageId('<%=allImageIds.get(currentIndex)%>');
</script>

</body>