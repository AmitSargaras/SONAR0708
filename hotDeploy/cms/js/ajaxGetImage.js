
var ajaxDropdownObj = new Object();
ajaxDropdownObj.ajaxobj = null;
ajaxDropdownObj.name = "";
ajaxDropdownObj.url = "";



function processLoadImagePath(myajax, curDropDown) {
   	if (myajax.readyState == 4) {
    	if (myajax.status == 200 || window.location.href.indexOf("http") == -1) {
	 		var xmlDoc = createXMLDOM_string(myajax.responseText);
	 		//alert("myajax.responseText "+myajax.responseText);
	 		if (typeof xmlDoc != "undefined"){
	 			//alert("hh");
			    displayImagePath(xmlDoc, curDropDown);
	 		}
      	}
		else{
		//	alert("The server could be too busy at the moment. Please try again");
		}
   	}
}

function displayImagePath(curDoc, curDropDown) {
	if (curDropDown != null && curDoc != null) {
		var toAdd = document.getElementById(curDropDown);
		if (toAdd == null) {	//fix for other browsers since IE can retrieve those under Name as Id
			elname = document.getElementsByName(curDropDown);
			toAdd = elname[0];
		}
      	var optionList = curDoc.getElementsByTagName("option");
      	document.getElementById("dmsImagePath").value=optionList[0].getAttribute("dmsImagePath");
      	var image=optionList[0].getAttribute("dmsImagePath");
      	GB_showImage('Image', image);
      	if (toAdd != null && optionList != null) {
      		document.getElementById("dmsImagePath").value=optionList[0].getAttribute("dmsImagePath");
		}	
	}	
}

function sendLoadImagePathReq(dropdownName, url) {
	//check if the last character is =, this means no parameter passed
	//alert("Inside sendLoadImagePathReq()");
	if ((url.length-1) == url.lastIndexOf("="))
	{
		cleardisplayImagePath(dropdownName);
		return;
	}
    var xhr = createAjaxObj();
    
	//alert("xhr: " + xhr + "   ajaxDropdownObj: " + ajaxDropdownObj.ajaxobj + "   name: " + ajaxDropdownObj.name);
	if (ajaxDropdownObj.ajaxobj != null)
	{
		if (ajaxDropdownObj.ajaxobj.readyState != 0)
		{
			if (ajaxDropdownObj.name == dropdownName)
			{
				//if the previous request is for the same dropdown, then abort it
				ajaxDropdownObj.ajaxobj.abort();
				//window.status = "Aborting previous request for '" + dropdownName + "' dropdown list";
			}
		}
	}
	xhr.onreadystatechange = function() {
		processLoadImagePath(xhr, dropdownName);
	};
	xhr.open('POST', url, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	//xhr.setRequestHeader("Content-length", ''.length);	//bypass ie6 bug
	//xhr.setRequestHeader("Connection", "close");		//bypass ie6 bug
	xhr.send('');
	
	ajaxDropdownObj.ajaxobj = xhr;
	ajaxDropdownObj.name = dropdownName;
	ajaxDropdownObj.url = url;
}


function cleardisplayImagePath(curDropDown) {
	if (curDropDown != null)
	{
		var xmlDoc = createXMLDOM_string('<?xml version="1.0"?><objectlist></objectlist>');
		if (typeof xmlDoc != "undefined")
			displayImagePath(xmlDoc, curDropDown);
	}
}

function getImageTest1(imagePath,imageName,status,count,categ,imgId) {
	 if(document.forms[0].event.value == 'retrieveImageTagUntagFacReceipt'){
		document.getElementById("imageFrame").src="FacilityReceipt.do?event=retrieveIndImageTagUntagFacReceiptPath&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category="+categ+"&imageId="+imgId;
	}
	 else if(document.forms[0].event.value == 'retrieveImageTagUntagSecReceipt'){
			document.getElementById("imageFrame").src="SecurityReceipt.do?event=retrieveIndImageTagUntagSecReceiptPath&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category="+categ+"&imageId="+imgId;
		}
}


function getImageTest(imagePath,imageName,status,count,categ) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
	//alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+categ);
	//alert("count is "+count);
	//alert("event is "+document.forms[0].event.value);
	if(document.forms[0].event.value == 'retrieveImageGallary'){
		document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveIndividualImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryMakerTodo'){
		document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveIndividualImageMakerTodo&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryMakerClose'){
		document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveIndividualImageMakerClose&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryMakerTotrack'){
		document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveIndividualImageMakerTotrack&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryChecker'){
		document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveIndividualImageChecker&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
	}
	else if(document.forms[0].event.value == 'retrieveViewImageGallary'){
		document.getElementById("imageFrame").src="/cms/ImageUploadAdd.do?event=retrieveViewIndividualImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveViewImageGallaryChecker'){
		document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveViewIndividualImageChecker&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
    else if(document.forms[0].event.value == 'retrieveImageGallarySecurityDoc'){
		document.getElementById("imageFrame").src="SecurityReceipt.do?event=retrieveIndividualImageSecurityDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryCAMDoc'){
		document.getElementById("imageFrame").src="CAMReceipt.do?event=retrieveIndividualImageCAMDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveMigImageGallaryCAMDoc'){
		document.getElementById("imageFrame").src="CAMReceipt.do?event=retrieveMigIndividualImageCAMDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryFacilityDoc'){
		document.getElementById("imageFrame").src="FacilityReceipt.do?event=retrieveIndividualImageFacilityDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryCaseCreation'){
		document.getElementById("imageFrame").src="caseCreationUpdate.do?event=retrieveIndividualImageCaseCreation&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'makerretrieveImageLADDoc'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryLADDoc'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'chk_view_reject_img'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'draft_lad_process_img'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'retrieveImageGallaryChecklistDoc'){
		document.getElementById("imageFrame").src="DocumentCheckList.do?event=retrieveIndividualImageCHKDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'chkretrieveImageLADDoc'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'draft_lad_img'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'chk_view_approve_img'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'closeToTrackImage'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'toTrackImageLADDoc'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'closeImageGallaryLADDoc'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'mkr_view_draft_close'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'mkr_view_draft_process'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'retrieveLADDocImage'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'rejectImageGallaryLADDoc'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'mkr_view_totrack_img'){
		document.getElementById("imageFrame").src="LADReceipt.do?event=retrieveIndividualImageLADDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryRecurrentDoc'){
		document.getElementById("imageFrame").src="RecurrentDocReceipt.do?event=retrieveIndividualImageRecurrentDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveMigImageGallaryRecurrentDoc'){
		document.getElementById("imageFrame").src="RecurrentDocReceipt.do?event=retrieveMigIndividualImageRecurrentDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveImageGallaryOtherDoc'){
		document.getElementById("imageFrame").src="OtherReceipt.do?event=retrieveIndividualImageOtherDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
	else if(document.forms[0].event.value == 'retrieveMigImageGallaryOtherDoc'){
		document.getElementById("imageFrame").src="OtherReceipt.do?event=retrieveMigIndividualImageOtherDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}else if(document.forms[0].event.value == 'retrieveImageGallaryCAMNote'){
		document.getElementById("imageFrame").src="MIAADetail.do?event=retrieveIndividualImageCAMNote&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;

	}
//	else if(document.forms[0].event.value == 'retrieveImageTagUntagFacReceipt'){
//		document.getElementById("imageFrame").src="FacilityReceipt.do?event=retrieveImageTagUntagFacReceipt&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category="+categ;
//	}
	else{
	document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveUntagIndividualImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
}
}
function getImage(imagePath,imageName,status) {
//   var dep = 'imagePath';
//   var url = '/cms/ImageTagMap.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
   //sendLoadImagePathReq(dep, url);
   document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveImage&pID="+imagePath+"&imageName="+imageName+"&status="+status;
  
}
function getImageForDisplaySecurityDoc(imagePath,imageName,status) {
	   //var dep = 'imagePath';
	   //var url = '/cms/SecurityReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	   //sendLoadImagePathReq(dep, url);
	document.getElementById("imageFrame").src= '/cms/SecurityReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	}
function getImageForDisplayFacilityDoc(imagePath,imageName,status) {
	   /*var dep = 'imagePath';
	   var url = '/cms/FacilityReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	   sendLoadImagePathReq(dep, url);*/
	document.getElementById("imageFrame").src='/cms/FacilityReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	}
function getImageForDisplayCAMDoc(imagePath,imageName,status) {
	   /*var dep = 'imagePath';
	   var url = '/cms/CAMReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	   sendLoadImagePathReq(dep, url);*/
	document.getElementById("imageFrame").src='/cms/CAMReceipt.do?event=retrieveImage&pID='+imagePath+'&imageName='+imageName+'&status='+status;
	}

function getImageByImageId(imageId){
	if(document.forms[0].event.value == 'retrieve_image_gallery_chk_cam'){
		document.getElementById("imageFrame").src='CAMReceipt.do?event=retrieve_individual_image_chk_cam&selectedGalleryImageId='+imageId;
	}
	else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_other'){
		document.getElementById("imageFrame").src='OtherReceipt.do?event=retrieve_individual_image_chk_other&selectedGalleryImageId='+imageId;
	}
	else if((document.forms[0].event.value == 'retrieve_image_gallery_chk_recurrent_receive') || (document.forms[0].event.value == "retrieve_image_gallery_chk_recurrent_update") || (document.forms[0].event.value == 'retrieve_image_gallery_chk_recurrent_checker_view')){
		document.getElementById("imageFrame").src='RecurrentDocReceipt.do?event=retrieve_individual_image_chk_recurrent&selectedGalleryImageId='+imageId;
	}else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_facility'){
		document.getElementById("imageFrame").src='FacilityReceipt.do?event=retrieve_individual_image_chk_facility&selectedGalleryImageId='+imageId;
	}else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_security'){
		document.getElementById("imageFrame").src='SecurityReceipt.do?event=retrieve_individual_image_chk_security&selectedGalleryImageId='+imageId;
	}
	else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_cam_checker_view'){
		document.getElementById("imageFrame").src='CAMReceipt.do?event=retrieve_individual_image_chk_cam&selectedGalleryImageId='+imageId;
	}
	else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_other_checker_view'){
		document.getElementById("imageFrame").src='OtherReceipt.do?event=retrieve_individual_image_chk_other&selectedGalleryImageId='+imageId;
	}
	else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_facility_checker_view'){
		document.getElementById("imageFrame").src='FacilityReceipt.do?event=retrieve_individual_image_chk_facility&selectedGalleryImageId='+imageId;
	}else if(document.forms[0].event.value == 'retrieve_image_gallery_chk_security_checker_view'){
		document.getElementById("imageFrame").src='SecurityReceipt.do?event=retrieve_individual_image_chk_security&selectedGalleryImageId='+imageId;
	}
}