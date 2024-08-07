<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.checklist.otherreceipt.OtherReceiptForm"%>
<%@page import="com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.otherreceipt.OtherReceiptAction"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptForm"%>
<%@page import="com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptForm"%>
<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm"%>
<%@page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction"%>
<%@page import="com.integrosys.cms.app.checklist.bus.checklistitemimagedetail.OBCheckListItemImageDetail"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.integrosys.cms.app.image.bus.OBImageUploadAdd"%>
<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@page import="java.util.List"%>
<%
String checkListType = request.getParameter("checkListType");
String context = request.getContextPath() + "/";
String submitEvent = null;
String cancelEvent = null;
String imageGalleryEvent = null;
String formAction = null;
List<Long> uploadedDMSImageIds = null; 
Map<Long, String> imageIdUnTaggedStatusMap = (Map) request.getAttribute(ITagUntagImageConstant.IMG_ID_UNTAG_STATUS_MAP);
if(ICMSConstant.CHECKLIST_CAM.equals(checkListType)){
	submitEvent = CAMReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = CAMReceiptAction.EVENT_CANCEL_TAG_UNTAG_IMAGE;
	imageGalleryEvent = CAMReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_CAM;
	formAction = "CAMReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(CAMReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_OTHER.equals(checkListType)){
	submitEvent = OtherReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = OtherReceiptAction.EVENT_CANCEL_TAG_UNTAG_IMAGE;
	imageGalleryEvent = OtherReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_OTHER;
	formAction = "OtherReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(OtherReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_FACILITY.equals(checkListType)){
	submitEvent = FacilityReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = FacilityReceiptAction.EVENT_CANCEL_TAG_UNTAG_IMAGE;
	imageGalleryEvent = FacilityReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_FACILITY;
	formAction = "FacilityReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(FacilityReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_SECURITY.equals(checkListType)){
	submitEvent = SecurityReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = SecurityReceiptAction.EVENT_CANCEL_TAG_UNTAG_IMAGE;
	imageGalleryEvent = SecurityReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_SECURITY;
	formAction = "SecurityReceipt"; 
	uploadedDMSImageIds = (List) session.getAttribute(SecurityReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_RECURRENT.equals(checkListType)){
	formAction = "RecurrentDocReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(RecurrentDocReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
	String event = (String) request.getAttribute("event");
	if(RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_RECEIVE.equals(event) || 
	RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_FROM_RETRIEVE_RECEIVE.equals(event)){
		submitEvent = RecurrentDocReceiptAction.EVENT_TAG_UNTAG_IMAGE_RECEIVE;
		cancelEvent = RecurrentDocReceiptAction.EVENT_CANCEL_TAG_UNTAG_IMAGE_RECEIVE;
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_RECEIVE;
	}
	else if(RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_UPDATE.equals(event) || 
	RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_FROM_RETRIEVE_UPDATE.equals(event)){
		submitEvent = RecurrentDocReceiptAction.EVENT_TAG_UNTAG_IMAGE_UPDATE;
		cancelEvent = RecurrentDocReceiptAction.EVENT_CANCEL_TAG_UNTAG_IMAGE_UPDATE;
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_UPDATE;
	}
}

if(uploadedDMSImageIds == null){
	uploadedDMSImageIds = new ArrayList<Long>();
}

pageContext.setAttribute("checkListType", checkListType);
%>

<head>
<script type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript">

function getSelectedImageIds(){
	var checkboxes = document.getElementsByName('selectedImgId');
	var checkedCheckboxes = [];
	
	for (var i = 0; i < checkboxes.length; i++) {
		if(checkboxes[i].checked){
			checkedCheckboxes.push(checkboxes[i].value);
		}
	}
	return checkedCheckboxes.join();
}

function submitPage(num){
	if (num == 1){
		var selectedImageIds = getSelectedImageIds();
		document.forms[0].selectedImageIds.value = selectedImageIds;
		document.forms[0].event.value = "<%=submitEvent%>";
		
	}
	else if(num == 2){
		document.forms[0].event.value = "<%=cancelEvent%>";
	}
	document.forms[0].submit();
}

function getImageGallery(imageId){
	var selectedImageIds = getSelectedImageIds();
	document.forms[0].selectedImageIds.value = selectedImageIds;
	document.forms[0].selectedGalleryImageId.value = imageId;
	document.forms[0].event.value = "<%=imageGalleryEvent%>";
	document.forms[0].submit();
}
</script>
</head>

<body>


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
	    
	<html:hidden property="selectedImageIds" />
	<html:hidden property="selectedGalleryImageId" />
	
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
			<thead>
			    <tr>
			        <td width="100%" valign="bottom">
			        	<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
			        		<tr>
			        			 <td width="100%">
			        			 	<h3><bean:message key="label.img.details.tag.untag"/></h3>
		      						<hr/>
		      						
		      						<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="tblInfo">
										<thead>
											<tr>
												<td width="15%"><bean:message key="label.global.sn"/></td>
												<td width="25%" nowrap="nowrap"><bean:message key="label.file.name"/></td>
												<td width="10%"><bean:message key="label.image.id"/></td>
												<td width="20%"><bean:message key="label.document.description"/></td>
												<td width="20%"><bean:message key="label.subfolder.name"/></td>
												<td width="15%"><bean:message key="label.is.tagged"/></td>
												<td width="15%"><bean:message key="label.select"/></td>
											</tr>
										</thead>
										<tbody>
										<% int counter = 0; String rowClass = ""; %>
											<logic:iterate id="obCheckListItemImageDtl" name="<%=ITagUntagImageConstant.TAG_UNTAG_IMAGE_DTL_LIST %>" scope="request">
			      							  	
			      							  	<%
			      							  		counter++;
													if (counter % 2 != 0) {
														rowClass = "odd";
													} else {
														rowClass = "even";
													}
													
													OBCheckListItemImageDetail obCheckListItemImageDetail = (OBCheckListItemImageDetail) obCheckListItemImageDtl;
													
												%>
												<tr class=<%=rowClass%>>
														<td class="index"><%=counter%></td>
														<td> 
														<%if(uploadedDMSImageIds.contains(obCheckListItemImageDetail.getImageId())){ %>
															<a href="#" onclick="getImageGallery('<%=obCheckListItemImageDetail.getImageId()%>')"><%=obCheckListItemImageDetail.getFileName()%></a>
														<%}else{%>
														<%=obCheckListItemImageDetail.getFileName()%>
														<%} %>
														</td>
														<td> <%=obCheckListItemImageDetail.getImageId()%></td>
														<td><integro:empty-if-null value="<%=obCheckListItemImageDetail.getDocumentDescription()%>"/></td>
														<td><integro:empty-if-null value="<%=obCheckListItemImageDetail.getSubFolderName()%>"/></td>
														<% String isTagged = ITagUntagImageConstant.UN_TAGGED;
														   if(imageIdUnTaggedStatusMap.get(obCheckListItemImageDetail.getImageId())!= null){
															   isTagged = imageIdUnTaggedStatusMap.get(obCheckListItemImageDetail.getImageId());   
														   }%>
														<td> <%=isTagged%></td>
														<td>
														<% boolean isSelected = ICMSConstant.YES.equals(obCheckListItemImageDetail.getIsSelectedInd()); %>
															<input type="checkbox" name="selectedImgId" id="selectedImgId" value="<%=obCheckListItemImageDetail.getImageId()%>" <%if(isSelected){ %> checked <%} %>/> 
														</td>
												</tr>	
												
			      							  	</logic:iterate>
			      							  	
			      							  	<logic:empty name="<%=ITagUntagImageConstant.TAG_UNTAG_IMAGE_DTL_LIST %>" scope="request">
			      							  	<tr>
			      							  		<td colspan="5">
			      							  			<bean:message key="label.global.not.found"/>
			      							  		</td>	
			      							  	</tr>
												</logic:empty>
			      							  	
										</tbody>
										</table>
		      						
		      						<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
		      							  <tr>
		      							  	<td>&nbsp;</td>
		      							  </tr>
		      							  <tr>
											<td align="center" valign="middle">
											<a href="#" onmouseout="MM_swapImgRestore()" onclick="submitPage(1)"
												onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
													<img src="img/ok1.gif" name="Image1" border="0" id="Image1" /></a> 
											<a href="#" onclick="submitPage(2)" onmouseout="MM_swapImgRestore()"
												onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
													<img src="img/cancel1.gif" name="Image4" border="0"
													id="Image4" /></a>
											</td>
										</tr>
		      						</table>
			        			 </td>
			        		</tr>
			        	</table>
			        </td>
			    </tr>
			</thead>
		</table>	

</html:form>
</body>