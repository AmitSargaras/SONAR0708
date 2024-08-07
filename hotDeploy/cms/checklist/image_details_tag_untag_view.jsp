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
//FacilityReceiptForm form = (FacilityReceiptForm)request.getAttribute("FacilityReceiptForm");
//System.out.println("form ocamt=>"+form.getDocAmt());
String previous = request.getParameter("previous");
String checkListType = request.getParameter("checkListType");
String context = request.getContextPath() + "/";
String submitEvent = null;
String cancelEvent = null;
String imageGalleryEvent = null;
String formAction = null;
List<Long> uploadedDMSImageIds = null; 
String actions = "";

String itemRef =(String)request.getAttribute("itemRef");
//long itemRef = Long.parseLong((String) map.get("itemRef"));
System.out.println("itemRef=>"+itemRef);
pageContext.setAttribute("itemRef",itemRef);
session.setAttribute("itemRef",itemRef);

Map<Long, String> imageIdUnTaggedStatusMap = (Map) request.getAttribute(ITagUntagImageConstant.IMG_ID_UNTAG_STATUS_MAP);
if(ICMSConstant.CHECKLIST_CAM.equals(checkListType)){
	submitEvent = CAMReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = "chk_view";
	imageGalleryEvent = CAMReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_CAM_CHECKER_VIEW;
	formAction = "CAMReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(CAMReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_OTHER.equals(checkListType)){
	submitEvent = OtherReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = "chk_view";
	imageGalleryEvent = OtherReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_OTHER_CHECKER_VIEW;
	formAction = "OtherReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(OtherReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_FACILITY.equals(checkListType)){
	submitEvent = FacilityReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = "chk_view";
	imageGalleryEvent = FacilityReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_FACILITY_CHECKER_VIEW;
	formAction = "FacilityReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(FacilityReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_SECURITY.equals(checkListType)){
	submitEvent = SecurityReceiptAction.EVENT_TAG_UNTAG_IMAGE;
	cancelEvent = "chk_view";
	imageGalleryEvent = SecurityReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_SECURITY_CHECKER_VIEW;
	formAction = "SecurityReceipt"; 
	uploadedDMSImageIds = (List) session.getAttribute(SecurityReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
}
else if(ICMSConstant.CHECKLIST_RECURRENT.equals(checkListType)){
	formAction = "RecurrentDocReceipt";
	uploadedDMSImageIds = (List) session.getAttribute(RecurrentDocReceiptAction.class.getName() + "." + ITagUntagImageConstant.UPLOADED_DMS_IMG_IDS);
	String event = (String) request.getAttribute("event");
	System.out.println("RecurrentDocReceipt jsp event =>"+event);
	/* if(RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_RECEIVE.equals(event) || 
	RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_FROM_RETRIEVE_RECEIVE.equals(event)){
		submitEvent = RecurrentDocReceiptAction.EVENT_TAG_UNTAG_IMAGE_RECEIVE;
		cancelEvent = "chk_view";
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_RECEIVE;
	}
	else if(RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_UPDATE.equals(event) || 
	RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_FROM_RETRIEVE_UPDATE.equals(event)){
		submitEvent = RecurrentDocReceiptAction.EVENT_TAG_UNTAG_IMAGE_UPDATE;
		cancelEvent = "chk_view";
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_UPDATE;
	} */
//	submitEvent = RecurrentDocReceiptAction.EVENT_TAG_UNTAG_IMAGE_RECEIVE;
//	cancelEvent = "chk_view";
//	imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_RECEIVE;
	cancelEvent = "chk_view";
	if(event.equalsIgnoreCase("prepare_tag_untag_image_view")){
		imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_CHECKER_VIEW;
	}
	else if(event.equalsIgnoreCase("prepare_tag_untag_image")){
	submitEvent = RecurrentDocReceiptAction.EVENT_TAG_UNTAG_IMAGE_RECEIVE;
	imageGalleryEvent = RecurrentDocReceiptAction.EVENT_RETRIEVE_IMAGE_GALLERY_CHK_RECURRENT_RECEIVE;
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
	document.forms[0].action="<%=formAction%>.do?event=chk_view&itemRef=<%=itemRef%>";
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
	<html:hidden property="hdfcAmt"/>
	    
	<html:hidden property="selectedImageIds" />
	<html:hidden property="selectedGalleryImageId" />
	
	<input type="hidden" name="previous" value="<%=previous%>"/>

    <html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="secType"/>
    <html:hidden property="secSubType"/>
    <html:hidden property="secName"/>
    <html:hidden property="collateralID"/>
    <%-- <html:hidden property="facImageTagUntagId"/>
<html:hidden property="facImageTagUntagImgName"/>
<html:hidden property="facImageTagUntagStatus"/> --%>
	
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
												<td width="15%"><bean:message key="label.subfolder.name"/></td>
												<td width="15%"><bean:message key="label.is.tagged"/></td>
												<%-- <td width="15%"><bean:message key="label.select"/></td> --%>
											</tr>
										</thead>
										<tbody>
										<% int counter = 0; String rowClass = ""; int srNoCounter = 0;%>
											<logic:iterate id="obCheckListItemImageDtl" name="<%=ITagUntagImageConstant.TAG_UNTAG_IMAGE_DTL_LIST %>" scope="request">
			      							  	
			      							  	<%
			      							  
			      							  		counter++;
													if (counter % 2 != 0) {
														rowClass = "odd";
													} else {
														rowClass = "even";
													}
													
													OBCheckListItemImageDetail obCheckListItemImageDetail = (OBCheckListItemImageDetail) obCheckListItemImageDtl;
													boolean isSelected1 = ICMSConstant.YES.equals(obCheckListItemImageDetail.getIsSelectedInd());
													if(isSelected1){
														srNoCounter++;
												%>
												<tr class=<%=rowClass%>>
														<td class="index"><%=srNoCounter%></td>
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
														<%-- <td>
														<% boolean isSelected = ICMSConstant.YES.equals(obCheckListItemImageDetail.getIsSelectedInd()); %>
															<input type="checkbox" name="selectedImgId" id="selectedImgId" value="<%=obCheckListItemImageDetail.getImageId()%>" <%if(isSelected){ %> checked <%} %>/> 
														</td> --%>
												</tr>	
												<%} %>
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