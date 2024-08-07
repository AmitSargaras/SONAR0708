<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.app.image.bus.OBImageUploadAdd,java.util.Iterator,java.util.List,
com.integrosys.cms.ui.imageTag.IImageTagConstants,
com.integrosys.base.techinfra.propertyfile.PropertyManager,
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
                 java.util.Iterator,
                 com.integrosys.cms.ui.imageTag.IImageTagConstants,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant
"%>
<%@ page import ="java.text.DecimalFormat,java.text.NumberFormat" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	String context = request.getContextPath() + "/";
	String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
String event = request.getParameter("event");
System.out.println("Event =>"+event);
String customerName = request.getParameter("customerName");
String legalName = request.getParameter("legalName");

String fromAmt = request.getParameter("fromAmt");
String typeOfDocVal = request.getParameter("typeOfDocVal");
String docNameVal = request.getParameter("docNameVal");
String docDatetypeVal = request.getParameter("docDatetypeVal");
String docToAmt = request.getParameter("docToAmt");
String docFrmDateVal = request.getParameter("docFrmDateVal");
String docToDateval = request.getParameter("docToDateval");

//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II
List bankList=(List)session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.bankList");
DefaultLogger.debug(this,"bankList"+bankList);
if(null!=bankList){
	pageContext.setAttribute("bankList",bankList);
}
//Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II


//Added By Prachit 

List facilityCodeList=(List)request.getAttribute("facilityCodeList");
DefaultLogger.debug(this,"facilityCodesList:"+facilityCodeList);
//System.out.println("Facility Code List : "+ facilityCodeList);

List custIdList=(List)request.getAttribute("custIdList");
DefaultLogger.debug(this,"custIdsList:"+custIdList);
//System.out.println("custIdList  List : "+ custIdList);

//System.out.println("event: "+event);

List facilityDocNameList=null;
List facilityDocNameList1=null;

if(event.equals("refresh_facility_document_name") ){
	facilityDocNameList=(List)request.getAttribute("facilityDocNameList");
	DefaultLogger.debug(this,"facilityDocNameList:"+facilityDocNameList);
	//System.out.println("facilityDocNameList  List : "+ facilityDocNameList);
	pageContext.setAttribute("facilityDocNameList", facilityDocNameList);
	session.setAttribute("facilityDocNameList", facilityDocNameList);
}

 if(event.equals("view_uploaded_image_listing_search")){
	facilityDocNameList=(List)request.getAttribute("facilityDocumentNameListTemp");
	DefaultLogger.debug(this,"facilityDocumentNameListTemp:"+facilityDocNameList);
	//System.out.println("facilityDocumentNameListTemp  List : "+ facilityDocNameList);
	pageContext.setAttribute("facilityDocNameList", facilityDocNameList);
	session.setAttribute("facilityDocNameList", facilityDocNameList);
} 
 

List securityDocNameList=null;

if(event.equals("refresh_security_document_name") || event.equals("view_uploaded_image_listing_search")){
	securityDocNameList=(List)request.getAttribute("securityDocNameList");
	DefaultLogger.debug(this,"securityDocNameList:"+securityDocNameList);
	//System.out.println("securityDocNameList  List : "+ securityDocNameList);
}
if(event.equals("view_uploaded_image_listing_search")){
	securityDocNameList=(List)request.getAttribute("securityDocumentNameListTemp");
	DefaultLogger.debug(this,"securityDocumentNameListTemp:"+securityDocNameList);
	//System.out.println("securityDocumentNameListTemp  List : "+ securityDocNameList);
	pageContext.setAttribute("securityDocNameList", securityDocNameList);
	session.setAttribute("securityDocNameList", securityDocNameList);
} 

List otherDocList=(List)request.getAttribute("otherDocList");
DefaultLogger.debug(this,"OtherFacDocList:"+ otherDocList);
//System.out.println("OtherFacDocList List : "+ otherDocList);

List securityNameIdList=(List)request.getAttribute("securityNameIdList");
DefaultLogger.debug(this,"securityNameIdList:"+ securityNameIdList);
//System.out.println("securityNameIdList List : "+ securityNameIdList);

List otherSecDocList=(List)request.getAttribute("otherSecDocList");
DefaultLogger.debug(this,"otherSecDocList:"+ otherSecDocList);
//System.out.println("otherSecDocList List : "+ otherSecDocList);

String imageUploadCategory = ICMSConstant.IMAGE_CATEGORY_SECURITY;

String imgCatSecurity = ICMSConstant.IMAGE_CATEGORY_SECURITY;
String imgCatFacility = ICMSConstant.IMAGE_CATEGORY_FACILITY;
String imgCatOther = ICMSConstant.IMAGE_CATEGORY_OTHER;
String imgCatCam = ICMSConstant.IMAGE_CATEGORY_CAM;
String imgCatStatement = ICMSConstant.IMAGE_CATEGORY_STATEMENT;
String imgCatExchOfInfo = ICMSConstant.IMAGE_CATEGORY_EXCHANGE_OF_INFO;

List typeOfDocList=(List)request.getAttribute("typeOfDocList");
DefaultLogger.debug(this,"typeOfDocList:"+ typeOfDocList);
//System.out.println("typeOfDocList List : "+ typeOfDocList);

List statementDocList=(List)request.getAttribute("statementDocList");
//System.out.println("statementDocList List : "+ statementDocList);

List camNumberList=(List)request.getAttribute("camNumberList");
//System.out.println("camNumberList List : "+ camNumberList);

List camDocList=(List)request.getAttribute("camDocList");
//System.out.println("camDocList List : "+ camDocList);

List otherMasterDocList=(List)request.getAttribute("otherMasterDocList");
//System.out.println("otherMasterDocList List : "+ otherMasterDocList);

int cnt = 0;
int listSize = 0;
List obImageUploadAddList1 = null;
obImageUploadAddList1 = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.obImageUploadAddList");
listSize = obImageUploadAddList1.size();
int startIndex=0;
String ind= (String) request.getAttribute("startIndex");
if( ind == null || ind.equals("null"))
	startIndex=0;
else 
	 startIndex = Integer.parseInt(ind);

System.out.println("startIndex ====>"+startIndex);
%>


<%@page import="com.integrosys.cms.ui.image.ImageUploadAddForm"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>


<%@page import="java.util.HashMap"%><html>
	<head>
	
	<%
	
	ImageUploadAddForm imageUploadAddForm=(ImageUploadAddForm) request.getAttribute("imageUploadAddForm");
	String typeOfDocs = imageUploadAddForm.getTypeOfDocument();
	System.out.println("imageUploadAddForm party id=>"+imageUploadAddForm.getCustId());
	String legalId =  imageUploadAddForm.getCustId();
	//System.out.println("Type of doc ="+imageUploadAddForm.getTypeOfDocument());
	//System.out.println("Category ="+imageUploadAddForm.getCategory());
	//System.out.println("Facility Name ="+imageUploadAddForm.getFacilityName());
	//System.out.println("Facility doc Name ="+imageUploadAddForm.getFacilityDocName());
	String facdocnamed = imageUploadAddForm.getFacilityName();
	//System.out.println("Security Name ="+imageUploadAddForm.getSecurityNameId());
	//System.out.println("Security doc Name ="+imageUploadAddForm.getSecurityDocName());
	if("view_uploaded_image_listing_search".equals(event)){
		imageUploadAddForm.setCategory(typeOfDocs);
	}
	
	String categoryAfterImageView = (String)request.getAttribute("categoryAfterImageView");
	//System.out.println("categoryAfterImageView=>"+categoryAfterImageView);
	
	if(("view_uploaded_image_listing").equals(event) && categoryAfterImageView != null && !"".equals(categoryAfterImageView)){
		imageUploadAddForm.setCategory(categoryAfterImageView);
	}
	//ImageUploadAddObj
	%>
	
	
	
	
		<script language="JavaScript" type="text/JavaScript">
//function submitImageUpload(){ 
//alert("Alert");
	//document.forms[0].action="ImageUploadAdd.do?event=submit";   
//	document.forms[0].submit();
//}

function getImageGallary(imagePath,imageName,status,count) {
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
	//alert("event is "+document.forms[0].event.value);
	document.forms[0].action="ImageUploadAdd.do?event=retrieveViewImageGallary&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg+"&imageId="+s_value+"&unCheckId="+n_value;
	document.forms[0].submit();
}

function submitImageUpload() {

	var c_value = "";
	for (var i=0; i < document.forms[0].selected.length; i++)
	   {
	   if (document.forms[0].selected[i].checked)
	      {
	      c_value = c_value + document.forms[0].selected[i].value + ",\n";
	      }
	   }
	
	

    document.forms[0].action="ImageUploadAdd.do?event=maker_confirm_submit&imageId="+c_value;
    document.forms[0].method="POST";
    document.forms[0].submit();
}

function cancelPage() {
	//document.forms[0].action="ImageUpload.do?event=image_upload&customerID=-999999999&limitProfileID=-999999999";
	document.forms[0].action="ImageUpload.do?event=list_image";
	document.forms[0].submit();
}
function submitPage() {
	document.forms[0].action="ImageUpload.do?event=image_upload";
	document.forms[0].submit();
}
function remove() {

    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'removeBox') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'removeBox') {
                var obj = formObj.elements[i];
                if ((obj.checked)) {           //updated: changed from "Delete" to "Required"
                    //therefore instead of if(obj.checked), its if(!(obj.checked))
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.removeBox[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'removeBox') {
                var obj = formObj.elements[i];
                if ((obj.checked)) {           //updated: changed from "Delete" to "Required"
                    //therefore instead of if(obj.checked), its if(!(obj.checked))
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.removeBox.value;
                }
            }
        }
    }
    //    alert('j'+j);
    if (temp == "") {
        alert('There is no record to remove!');
    }else{
    	var r=confirm("Are you sure you want to delete the selected images ?");
    	if(r==true){
		    temp = temp.substring(1);
		    formObj.event.value = "remove_images";
		    formObj.removeIdx.value = temp;
		    formObj.submit();
    	}
    }
}





function refreshSubfolders(dropdown)
{
	
var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }	

   var dep = 'subfolderName';
   var url = '/cms/ImageUploadAdd.do?event=get_filter_subfolder_name&category='+curSel+'&custId=<%=imageUploadAddForm.getCustId()%>';
   sendLoadDropdownReq(dep, url);
   clearDisplayDropdown('documentName');
}

function refreshDocumentName(dropdown)
{
	var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }
   var category=document.forms[0].category.value;
   var dep = 'documentName';
   var url = '/cms/ImageUploadAdd.do?event=get_filter_docname&subfolderName='+curSel+'&category='+category+'&custId=<%=imageUploadAddForm.getCustId()%>';
   sendLoadDropdownReq(dep, url);
}

function showListing() {
	 var catg= document.forms[0].category.value;
	 <%--
	//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II
	var bank=document.getElementById("bank").value;

	if(catg== '<%=IImageTagConstants.IMG_CATEGORY_EXCH_INFO%>' && (bank!=null && bank=="")){
		alert("Please Select Bank");
	    } 
	//Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II
	else{
    document.forms[0].action="ImageUploadAdd.do?category="+catg;
    document.forms[0].event.value="view_uploaded_image_listing_search";
    document.forms[0].submit();
	}
	--%>
	var facilityName1= document.forms[0].facilityName.value;
	//alert(facilityName1);
	//var facilityDocName1= document.forms[0].facilityDocName.value;
	document.forms[0].action="ImageUploadAdd.do?facilityName="+facilityName1+"&category="+catg+"&reset=Y";
    document.forms[0].event.value="view_uploaded_image_listing_search";
    document.forms[0].submit();
}

function downloadImage(imagePath,imageName,status){ //v3.0
	var aLocation = "ImageUploadAdd.do?event=downloadImage&pID="+imagePath+"&imageName="+imageName+"&status="+status;
	window.location.href = aLocation ;
	//document.forms[0].submit();
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


function downloadImageZip(recordNum) {
	var s_value = "";
	var n_value = "";
	var v_value_count = document.forms[0].selected.length;
	var recordNumss = recordNum;
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
			recordNumss++;
		   if (document.forms[0].selected[i].checked)
		      {
		     // s_value = s_value + document.forms[0].selected[i].value + "-";
			   s_value = s_value + (recordNumss) + "-";
		      }else{
		    	//  n_value = n_value + document.forms[0].selected[i].value + "-";
		    	  n_value = n_value + (recordNumss) + "-";
		    	  
		      }
		   }
	}
	//alert('s_value=>'+s_value+' n_value=>'+n_value);
	var facNamed= document.forms[0].facilityName.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
//alert('v_value_count='+v_value_count);
	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
		document.forms[0].unCheckArray.value=n_value;
	    //document.forms[0].submit();
	   // var checkArray = new Array();
	   // var unCheckArray = new Array();
	   // checkArray[0] =s_value;
	   // unCheckArray[0] = n_value;
	    var aLocation = "ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&facNames="+facNamed+"&imageId="+s_value+"&unCheckId="+n_value;
	  //  var aLocation = "ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&facNames="+facNamed+"&imageId="+s_value+"&unCheckId="+v_value_count;
	window.location.href = aLocation ;
	
       // document.forms[0].action="ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&category="+catg;
	   // document.forms[0].submit();
	 //MM_openBrWindow("ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  
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
	var facNamed= document.forms[0].facilityName.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow1("ImageUploadAdd.do?event=print_image&custId="+custId1+"&customerName="+customerName+"&facNames="+facNamed+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}

//Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II 
function populateBank(dropdown){
	//alert("inside populateBank:"+dropdown.value);
	if(dropdown.value == '<%=IImageTagConstants.IMG_CATEGORY_EXCH_INFO%>'){
	//	alert("inside if");
		//document.forms[0].bank.disabled=false;
		
	//	 var curSel = "";
	/*	 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
			    curSel = dropdown.options[i].value;	
			}
			
		   }	*/

	/*	   var custId=document.getElementById("custId").value;
		   alert(custId);
		   var dep = 'bank';
		   var url = '/cms/ImageUploadAdd.do?event=refresh_bankList&custId='+custId; 
		   alert(url);
		 //  clearDisplayDropdown('securityId');
		 //  clearDisplayDropdown('docDesc');
		   sendLoadDropdownReq(dep, url); */
		   document.getElementById("bank").disabled=false;
	//	   alert("enabled");
	}
	else{
	//	alert("inside else");
		 document.getElementById("bank").value="";
		 document.getElementById("bank").disabled=true;
		 
	}
}
//Added by Uma Khot:End: Phase 3 CR:tag scanned images of Annexure II 


//Added By Prachit:
	
	
	function refreshFacDocName(dropdown) {
	 document.getElementById("otherDocName").disabled=true;
        var curSel = "";
            for(i=0; i < dropdown.options.length; i++)   {
                if (dropdown.options[i].selected == true) {
                    curSel = dropdown.options[i].value;
                }
            }
        var dep = 'facilityDocName';
        var url = '/cms/ImageUploadAdd.do?event=refresh_facility_document_name&facDocCode='+curSel;
        sendLoadDropdownReq(dep, url);
        document.getElementById('facilityDocName').value=curSel;
   }
   
	function refreshFacDocName1(dropdown) {
		 document.getElementById("otherDocName").disabled=true;
	        var curSel = dropdown;
	            
	        var dep = 'facilityDocName';
	        var url = '/cms/ImageUploadAdd.do?event=refresh_facility_document_name&facDocCode='+curSel;
	        sendLoadDropdownReq(dep, url);
	        document.getElementById('facilityDocName').value=curSel;
	   }

function refreshOtherDocName(dropdown) {
	var otherDoc=document.getElementById('facilityDocName').value;
	if(otherDoc === "Other Additional Document"){
		document.getElementById("otherDocName").disabled=false;
	}else{
		document.getElementById("otherDocName").disabled=true;
	}
   }
   
function refreshSecDocName(dropdown) {
	//alert(document.getElementById('facilityName').value);
	 document.getElementById("otherSecDocName").disabled=true;
        var curSel = "";
            for(i=0; i < dropdown.options.length; i++)   {
                if (dropdown.options[i].selected == true) {
                    curSel = dropdown.options[i].value;
                }
            }
           // alert(curSel);
        var dep = 'securityDocName';
        var curSel1 = curSel.split("-");
        var curSels = curSel1[0];
        var url = '/cms/ImageUploadAdd.do?event=refresh_security_document_name&secDocCode='+curSels;
        sendLoadDropdownReq(dep, url);
        document.getElementById('securityNameId').value=curSel;
       // alert(document.getElementById('secDocCode').value);
       
   }
   
   function refreshOtherSecDocName(dropdown) {
		var otherDoc=document.getElementById('securityDocName').value;
		if(otherDoc === "Other Additional Document"){
			document.getElementById("otherSecDocName").disabled=false;
		}else{
			document.getElementById("otherSecDocName").disabled=true;
		}
	  }
	
   function refreshDisabledFields(dropdown){
	   var securityImg = '<%=imgCatSecurity%>';
	   var facilityImg = '<%=imgCatFacility%>';
	   var otherImg = '<%=imgCatOther%>';
	   var camImg = '<%=imgCatCam%>';
	   var statementImg = '<%=imgCatStatement%>';
	   var exchOfInfoImg = '<%=imgCatExchOfInfo%>';
	   
	   var docTypeValue=document.getElementById('typeDoc').value;
	   if(docTypeValue === facilityImg){
			document.getElementById("facilityName").disabled=false; 
			document.getElementById("facilityDocName").disabled=false;
			if(document.getElementById("facilityDocName").value == "Other Additional Document"){
				document.getElementById("otherDocName").disabled=false;
			}else{
				document.getElementById("otherDocName").disabled=true;
			}
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
		}else if(docTypeValue === securityImg){
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById("securityNameId").disabled=false;
			document.getElementById("securityDocName").disabled=false;
			document.getElementById("bank").disabled=true;
			if(document.getElementById("securityDocName").value == "Other Additional Document"){
				document.getElementById("otherSecDocName").disabled=false;
			}else{
				document.getElementById("otherSecDocName").disabled=true;
			}
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
			
		}else if(docTypeValue === camImg){
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=false;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=false;
		}else if(docTypeValue === exchOfInfoImg){
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=false;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
		}else if(docTypeValue === otherImg){
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=false;
			document.getElementById("hasCam").disabled=true;
			
		}else if(docTypeValue === statementImg){
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=false;
			document.getElementById("statementDocName").disabled=false;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
			
		}else{
			document.getElementById("facilityName").value="";
			document.getElementById("facilityDocName").value="";
			document.getElementById("securityNameId").value="";
			document.getElementById("securityDocName").value="";
			document.getElementById("otherDocName").value="";
			document.getElementById("otherSecDocName").value="";
			document.getElementById("statementTyped").value="";
			document.getElementById("statementDocName").value="";
			document.getElementById("camDocName").value="";
			document.getElementById("othersDocsName").value="";
			document.getElementById("hasCam").value="";
			
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
		}
   }
   
   
   window.onload = function(){
   
	   var securityImg = '<%=imgCatSecurity%>';
	   var facilityImg = '<%=imgCatFacility%>';
	   var otherImg = '<%=imgCatOther%>';
	   var camImg = '<%=imgCatCam%>';
	   var statementImg = '<%=imgCatStatement%>';
	   var exchOfInfoImg = '<%=imgCatExchOfInfo%>';
	   
	   var docTypeValue=document.getElementById('typeDoc').value;
	   /* if(docTypeValue === "Facility"){ */
		   if(docTypeValue === facilityImg){
			document.getElementById("securityNameId").value='';
			document.getElementById("hasCam").value='';
			document.getElementById("statementTyped").value='';
			document.getElementById("bank").value='';   
			
			document.getElementById("facilityName").disabled=false;
			document.getElementById("facilityempty").disabled=true;
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("hasCam").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("bank").disabled=true;
			
			document.getElementById("facility1").style.display = '';
			document.getElementById("security2").style.display = 'none';
			document.getElementById("cam3").style.display = 'none';
			document.getElementById("statement4").style.display = 'none';
			document.getElementById("typeidhide").style.display = 'none';
			}
		   else if(docTypeValue === securityImg){
			    document.getElementById("facilityName").value='';
				document.getElementById("hasCam").value='';
				document.getElementById("statementTyped").value='';
				document.getElementById("bank").value=''; 
		   
			    document.getElementById("facilityName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityNameId").disabled=false;
				document.getElementById("hasCam").disabled=true;
				document.getElementById("statementTyped").disabled=true;
				document.getElementById("bank").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = '';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
			}
		   else if(docTypeValue === camImg){
			    document.getElementById("facilityName").value='';
				document.getElementById("securityNameId").value='';
				document.getElementById("statementTyped").value='';
				document.getElementById("bank").value=''; 
			   
			    document.getElementById("facilityName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityNameId").disabled=true;
				document.getElementById("hasCam").disabled=false;
				document.getElementById("statementTyped").disabled=true;
				document.getElementById("bank").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = '';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
			}
		   else if(docTypeValue === statementImg){
			    document.getElementById("facilityName").value='';
				document.getElementById("securityNameId").value='';
				document.getElementById("hasCam").value='';
				document.getElementById("bank").value='';
				
			    document.getElementById("facilityName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityNameId").disabled=true;
				document.getElementById("hasCam").disabled=true;
				document.getElementById("statementTyped").disabled=false;
				document.getElementById("bank").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = '';
				document.getElementById("typeidhide").style.display = 'none';
				
			}else if(docTypeValue === otherImg){
				document.getElementById("facilityName").value='';
				document.getElementById("securityNameId").value='';
				document.getElementById("hasCam").value='';
				document.getElementById("statementTyped").value='';
				document.getElementById("bank").value='';
				
				document.getElementById("facilityName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityNameId").disabled=true;
				document.getElementById("hasCam").disabled=true;
				document.getElementById("statementTyped").disabled=true;
				document.getElementById("bank").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
				
			}else if(docTypeValue === exchOfInfoImg){
				document.getElementById("facilityName").value='';
				document.getElementById("securityNameId").value='';
				document.getElementById("hasCam").value='';
				document.getElementById("statementTyped").value='';
				
				document.getElementById("facilityName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityNameId").disabled=true;
				document.getElementById("hasCam").disabled=true;
				document.getElementById("statementTyped").disabled=true;
				document.getElementById("bank").disabled=false;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
				
			}else{
				document.getElementById("facilityName").value='';
				document.getElementById("securityNameId").value='';
				document.getElementById("hasCam").value='';
				document.getElementById("statementTyped").value='';
				document.getElementById("bank").value='';
				
				document.getElementById("facilityName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityNameId").disabled=true;
				document.getElementById("hasCam").disabled=true;
				document.getElementById("statementTyped").disabled=true;
				document.getElementById("bank").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
			}
   }
	   
	   function refreshVisibilityOfFields(){
		   
		   var securityImg = '<%=imgCatSecurity%>';
		   var facilityImg = '<%=imgCatFacility%>';
		   var otherImg = '<%=imgCatOther%>';
		   var camImg = '<%=imgCatCam%>';
		   var statementImg = '<%=imgCatStatement%>';
		   var exchOfInfoImg = '<%=imgCatExchOfInfo%>';
		   
		   var docTypeValue=document.getElementById('typeDoc').value;
		   /* if(docTypeValue === "Facility"){ */
			   if(docTypeValue === facilityImg){
				document.getElementById("securityNameId").value='';
				document.getElementById("hasCam").value='';
				document.getElementById("statementTyped").value='';
				document.getElementById("bank").value='';   
				
				document.getElementById("facilityName").disabled=false;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityNameId").disabled=true;
				document.getElementById("hasCam").disabled=true;
				document.getElementById("statementTyped").disabled=true;
				document.getElementById("bank").disabled=true;
				
				document.getElementById("facility1").style.display = '';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
				}
			   else if(docTypeValue === securityImg){
				    document.getElementById("facilityName").value='';
					document.getElementById("hasCam").value='';
					document.getElementById("statementTyped").value='';
					document.getElementById("bank").value=''; 
			   
				    document.getElementById("facilityName").disabled=true;
					document.getElementById("facilityempty").disabled=true;
					document.getElementById("securityNameId").disabled=false;
					document.getElementById("hasCam").disabled=true;
					document.getElementById("statementTyped").disabled=true;
					document.getElementById("bank").disabled=true;
					
					document.getElementById("facility1").style.display = 'none';
					document.getElementById("security2").style.display = '';
					document.getElementById("cam3").style.display = 'none';
					document.getElementById("statement4").style.display = 'none';
					document.getElementById("typeidhide").style.display = 'none';
				}
			   else if(docTypeValue === camImg){
				    document.getElementById("facilityName").value='';
					document.getElementById("securityNameId").value='';
					document.getElementById("statementTyped").value='';
					document.getElementById("bank").value=''; 
				   
				    document.getElementById("facilityName").disabled=true;
					document.getElementById("facilityempty").disabled=true;
					document.getElementById("securityNameId").disabled=true;
					document.getElementById("hasCam").disabled=false;
					document.getElementById("statementTyped").disabled=true;
					document.getElementById("bank").disabled=true;
					
					document.getElementById("facility1").style.display = 'none';
					document.getElementById("security2").style.display = 'none';
					document.getElementById("cam3").style.display = '';
					document.getElementById("statement4").style.display = 'none';
					document.getElementById("typeidhide").style.display = 'none';
				}
			   else if(docTypeValue === statementImg){
				    document.getElementById("facilityName").value='';
					document.getElementById("securityNameId").value='';
					document.getElementById("hasCam").value='';
					document.getElementById("bank").value='';
					
				    document.getElementById("facilityName").disabled=true;
					document.getElementById("facilityempty").disabled=true;
					document.getElementById("securityNameId").disabled=true;
					document.getElementById("hasCam").disabled=true;
					document.getElementById("statementTyped").disabled=false;
					document.getElementById("bank").disabled=true;
					
					document.getElementById("facility1").style.display = 'none';
					document.getElementById("security2").style.display = 'none';
					document.getElementById("cam3").style.display = 'none';
					document.getElementById("statement4").style.display = '';
					document.getElementById("typeidhide").style.display = 'none';
					
				}else if(docTypeValue === otherImg){
					document.getElementById("facilityName").value='';
					document.getElementById("securityNameId").value='';
					document.getElementById("hasCam").value='';
					document.getElementById("statementTyped").value='';
					document.getElementById("bank").value='';
					
					document.getElementById("facilityName").disabled=true;
					document.getElementById("facilityempty").disabled=false;
					document.getElementById("securityNameId").disabled=true;
					document.getElementById("hasCam").disabled=true;
					document.getElementById("statementTyped").disabled=true;
					document.getElementById("bank").disabled=true;
					
					document.getElementById("facility1").style.display = 'none';
					document.getElementById("security2").style.display = 'none';
					document.getElementById("cam3").style.display = 'none';
					document.getElementById("statement4").style.display = 'none';
					document.getElementById("typeidhide").style.display = '';
					
				}else if(docTypeValue === exchOfInfoImg){
					document.getElementById("facilityName").value='';
					document.getElementById("securityNameId").value='';
					document.getElementById("hasCam").value='';
					document.getElementById("statementTyped").value='';
					
					document.getElementById("facilityName").disabled=true;
					document.getElementById("facilityempty").disabled=false;
					document.getElementById("securityNameId").disabled=true;
					document.getElementById("hasCam").disabled=true;
					document.getElementById("statementTyped").disabled=true;
					document.getElementById("bank").disabled=false;
					
					document.getElementById("facility1").style.display = 'none';
					document.getElementById("security2").style.display = 'none';
					document.getElementById("cam3").style.display = 'none';
					document.getElementById("statement4").style.display = 'none';
					document.getElementById("typeidhide").style.display = '';
					
				}else{
					document.getElementById("facilityName").value='';
					document.getElementById("securityNameId").value='';
					document.getElementById("hasCam").value='';
					document.getElementById("statementTyped").value='';
					document.getElementById("bank").value='';
					
					document.getElementById("facilityName").disabled=true;
					document.getElementById("facilityempty").disabled=false;
					document.getElementById("securityNameId").disabled=true;
					document.getElementById("hasCam").disabled=true;
					document.getElementById("statementTyped").disabled=true;
					document.getElementById("bank").disabled=true;
					
					document.getElementById("facility1").style.display = 'none';
					document.getElementById("security2").style.display = 'none';
					document.getElementById("cam3").style.display = 'none';
					document.getElementById("statement4").style.display = 'none';
					document.getElementById("typeidhide").style.display = '';
				}
				
		   
	   }
	
</script>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/ajaxGetImage.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="<%=context%>js/imageNavigation.js"></script>
	</head>
	<html:form action="/ImageUploadAdd">
	

<input type="hidden" name="customerName" value="<%=customerName%>">
<input type="hidden" name="legalName" value="<%=legalName%>">
<input type="hidden" name="fromAmt" value="<%=fromAmt%>">
<input type="hidden" name="docDatetypeVal" value="<%=docDatetypeVal%>">
<input type="hidden" name="docToAmt" value="<%=docToAmt%>">
<input type="hidden" name="docFrmDateVal" value="<%=docFrmDateVal%>">
<input type="hidden" name="docToDateval" value="<%=docToDateval%>">
<input type="hidden" name="typeOfDocVal" value="<%=typeOfDocVal%>">
<input type="hidden" name="docNameVal" value="<%=docNameVal%>">
	<html:hidden property="event" value="<%=event%>"/>
	<html:hidden property="custId"/>
	<html:hidden property="custName"/>

	<body>
		<%
			OBImageUploadAdd obImageUploadAdd = new com.integrosys.cms.app.image.bus.OBImageUploadAdd();
			List obImageUploadAddList = null;
			//System.out.println("category ="+obImageUploadAdd.getCategory()+" typeodDocument = "+obImageUploadAdd.getTypeOfDocument());
			obImageUploadAddList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.obImageUploadAddList");
			
			HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.selectedArrayMap");
			if(selectedArrayMap ==null){
				selectedArrayMap =new HashMap();
			}
			 //System.out.println("obImageUploadAddList:"+obImageUploadAddList);
			NumberFormat formatter = new DecimalFormat("#0.000");
			int index=0;
		%>
		<input type="hidden" id="removeIdx" name="removeIdx">
			<tr>
				<td width="85%" valign="top">
					<table id="window" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<td>
				  <table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center">
				  		<thead>
							<tr>
								<td >
									<h3>
										Customer Details
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
								<table width="100%" class="tblinfo" style="margin-top: 0"
																border="0" cellspacing="0" cellpadding="0">
					                <tr class="even">
					                    <td class="fieldname" width="20%"><bean:message key="label.list.party.name"/></td>
					                    <td width="33%">
					                    <bean:write name="imageUploadAddForm" property="custName"/>&nbsp;</td>
					                    <td class="fieldname" width="20%"><bean:message key="label.list.party.id"/></td>
					                    <td width="33%"><bean:write name="imageUploadAddForm" property="custId"/>&nbsp;</td>
					                </tr>
			                		</table>
			                </td>
			               </tr>
			              </tbody>
			      <!--  </table>
					</td>
					</tr> -->
					<tr>
					<td>
					<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
							
							
					<tr class="odd">
                    <td class="fieldname" width="33%">Type of Document</td>
           			 <%-- <td width="33%"><html:select property="typeOfDocument" styleId="typeDoc" onchange="javascript:refreshDisabledFields(this);"> --%>
           			 <%-- <td width="33%"><html:select property="category" styleId="typeDoc" onchange="javascript:refreshDisabledFields(this);">
							<html:option value="">Please select</html:option>
							<html:option value="IMG_CATEGORY_FACILITY">Facility</html:option>
							<html:option value="<%=imageUploadCategory%>">Security</html:option>
							<html:option value="IMG_CATEGORY_CAM">CAM</html:option>
					</html:select> <br>
					</td> --%>
					 <td width="30%"><html:select property="category" styleId="typeDoc" onchange="javascript:refreshVisibilityOfFields(this);refreshSubfolders(this);">
                      <html:option value="">Please Select</html:option> 
                        <html:options name="typeOfDocList" labelName="typeOfDocList"></html:options> 
                      </html:select> &nbsp; <br>
			<html:errors property="typeOfDocumentError" />
			</td> 
                   
                   
                     <td align="left" width="33%" class="fieldname" rowspan="8">&nbsp;

<a href="#" style="background-color: #ABC6DE; border: 1px solid #002439; padding: 2px; outline-color: black; color: black " shape="rect"  onclick="showListing()">GO</a>
						    	</td>
                </tr>
                
                <tr class="even" id = "facility1">
                    <td class="fieldname" width="33%">Type/ID</td>
                    <td width="33%">
          		 <html:select property="facilityName" styleId="facilityName"  style='width: 200px;' disabled="true">
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="facilityCodeList" labelName="custIdList"></html:options>
                      </html:select> 
                      &nbsp; 
                      </td> 
                      </tr>
                      
                      <tr class="even" id = "security2">
                    <td class="fieldname" width="33%">Type/ID</td>
                    <td width="33%">
                    <html:select property="securityNameId" styleId="securityNameId"  disabled="true">
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="securityNameIdList" labelName="securityNameIdList"></html:options> 
                      </html:select> 
                    </td>
                      </tr>
                      
                      <tr class="even" id = "cam3">
                    <td class="fieldname" width="20%">Type/ID</td>
                    <td width="30%">
          		 <html:select property="hasCam" styleId="hasCam"  style='width: 200px;' disabled="true">
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="camNumberList" ></html:options> 
                      </html:select> 
                      <html:errors property="camNumberError"/>
                      &nbsp; 
                      </td>
                      </tr>
                      
                      <tr class="even" id = "statement4">
                    <td class="fieldname" width="20%">Type/ID</td>
                    <td width="30%">
          		 <html:select property="statementTyped" styleId="statementTyped" style='width: 200px;' disabled="true">
                                    	<integro:common-code 
                                    		categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" descWithCode="false" />
                                    </html:select>
                      <html:errors property="statementTypeError"/>
                      &nbsp; 
                      </td>
                      </tr>
                      
                      <tr class="even" id = "typeidhide">
                    <td class="fieldname" width="20%">Type/ID</td>
                    <td width="30%">
          		 <html:select property="hasFacility" styleId="facilityempty" style='width: 200px;'>
                     	<html:option value="">Please Select</html:option> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
                      
                      <tr>
								<td class="fieldname" width="33%">Subfolder Name</td>
								<td width="33%">								
									<html:select property="subfolderName" name="imageUploadAddForm"  >
										  <option value="">Please Select </option>
						                  <html:options collection="subfolderNameList" property="value" labelProperty="label"/>
						         	</html:select>&nbsp;
						         </td>
							</tr>
							
							<tr>
								<td class="fieldname" width="33%">Bank Name</td>
									<td width="33%">
									<% if(imageUploadAddForm.getCategory().equals(IImageTagConstants.IMG_CATEGORY_EXCH_INFO)){%>
									<html:select property="bank"

										name="imageUploadAddForm" disabled="false" styleId="bank">

										<html:option value="">Please Select</html:option>
										<html:options collection="bankList" property="value"
											labelProperty="label" />
									   </html:select>
									    <%}else{ %>
				                       <html:select property="bank" disabled="true" styleId="bank">

				                     
				                         <html:option value="">Please Select</html:option> 
				                        <html:options collection="bankList" property="value" labelProperty="label"></html:options> 
				                      </html:select> 
				                      <%} %>&nbsp;</td>
							</tr>
							</table>	
						
					</td>
					</tr>
					
					</table></td></tr>
						<tr>
							<td>
								<table width="100%" height="100%" border="0" cellpadding="0"
									cellspacing="0" id="contentWindow">
									<tr>
										<td valign="top">
											<table width="90%" class="tblFormSection" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="100%">

													</td>
												</tr>
											</table>
										</td>
									</tr>
									<!--//End CR-120 Search Diary Item-->
									<%int counter = 0;%>
									<tr>
										<td valign="top" align="center"
											style="height: 100%; width: 100%;">

											<table width="80%" class="tblFormSection" border="0"
												align="center" cellpadding="0" cellspacing="0"
												style="margin-bottom: 15px">
												<thead>
													<tr>
														<td>
															<h3>
																Image Uploaded Details
															</h3>
															<integro:user-role role="<%=teamTypeMemID%>" moduleId="36" operation="Download">
															<a href="#" onclick="downloadImageZip(<%=startIndex%>)"
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
												<td >
												<table>
												
													<tr>
														<td width="50%" valign="top" align="center">
															<table width="100%" class="tblinfo" style="margin-top: 0"
																border="0" cellspacing="0" cellpadding="0">
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
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			Other Document Name
																		</td>
																		<td width="10%">
																			Subfolder Name
																		</td>
																		<td width="10%">
																			Document Name(Migrated)
																		</td>
																		<td width="10%">
																			Bank Name
																		</td>
																		<td width="15%">
																			Upload Date & Timestamp
																		</td>																		
																		<!--Added by Uma Khot:End: Phase 3 CR:tag scanned images of Annexure II-->
<!--																		<td width="20%">-->
<!--																			Action-->
<!--																		</td>-->
																		<td width="5%">Select <%	if (obImageUploadAddList != null && obImageUploadAddList.size()>0) { %>
												<input type="checkbox" name="list11" id="list11"
													value="Check All" onClick="checkedAllImages()" /> <%} %>
												</td>
																	</tr>
																</thead>
																<tbody>
																	<%
																		//int counter = 0;
																	
																	
																		if (obImageUploadAddList != null && obImageUploadAddList.size() != 0) {
																			//for (Iterator it = obImageUploadAddList.iterator(); it.hasNext();) {
																				for (int i=startIndex; i < obImageUploadAddList.size(); i++) {
																					
																				System.out.println("cnt=>"+cnt+"   obImageUploadAddList.size()=>"+obImageUploadAddList.size());
																			
																				cnt++;
																				if(cnt > 100){
																				break;	
																				}
																				index++;
																				//obImageUploadAdd = (OBImageUploadAdd) it.next();
																				obImageUploadAdd = (OBImageUploadAdd) obImageUploadAddList.get(i);
																				String rowClass = "";
																				counter++;
																				if (counter % 2 != 0) {
																					rowClass = "odd";
																				} else {
																					rowClass = "even";
																				}
																	%>
																	<tr class=<%=rowClass%>>
																		<td class="index" width="5%"><%=counter+startIndex%></td>
																		<td width="20%">
																			&nbsp;
																			
																			
		<%if(obImageUploadAdd.getStatus()==3){ %>																
<a href="#"
onclick="getImageGallary('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=(counter+startIndex)-1%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>
<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>

																			
																			
																		</td>
																		<%-- <td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td> --%>
																		<%-- <td width="10%">
																			&nbsp;
																			<%System.out.println("obImageUploadAdd.getCategory()"+obImageUploadAdd.getCategory()); %>
                    															<integro:common-code-single categoryCode="IMG_UPLOAD_CATEGORY" entryCode="<%=obImageUploadAdd.getCategory()%>" display="true" descWithCode="false"/>&nbsp;
																			</td> --%>
																			<td width="10%">
																			&nbsp;
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
																		<%-- <integro:empty-if-null value="<%=obImageUploadAdd.getStatementTyped() %>"/> --%>
																		<integro:common-code-single categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=obImageUploadAdd.getStatementTyped()%>" display="true" descWithCode="false"/>
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
																		
																		<%if("Exchange of Info".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getBank() %>"/>
																		</td>
																		<%}else{ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%} %>
																		<td width="15%">
																		<%if(obImageUploadAdd.getCreationDate() != null){ %>
																			<%=new SimpleDateFormat("dd/MMM/yyyy HH:mm:ss").format(obImageUploadAdd.getCreationDate())%>
																		<%}else {%>
																			-
																		<%} %>	
																		</td>
																		
																		<!--Added by Uma Khot:End: Phase 3 CR:tag scanned images of Annexure II-->
														<%--			<td width="20%">
																			&nbsp;
																			
																			
																			
<a href="#"
onclick="downloadImage('<%=obImageUploadAdd.getImageFilePath()%>','<%=obImageUploadAdd.getImgFileName()%>','<%=obImageUploadAdd.getStatus()%>')">Download
</a>

																			
																			
																		</td>  --%>	
																		
																		
																		<td width="5%">&nbsp; <%if(selectedArrayMap.containsKey(String.valueOf(obImageUploadAdd.getImgId()))){ %>
														<input type="checkbox" id="selected" name="selected"
															value="<%=counter%>"
															onClick="toggleSelectAll()" checked="checked" /> <%}else{ %>

														<input type="checkbox" id="selected" name="selected"
															value="<%=counter%>"
															onClick="toggleSelectAll()" /> <%} %>
														</td>
																	</tr>
																	<%
																		//}
																			}
																		}else{
																			%>
																			<tr>
																			<td colspan="10">
																			Sorry, there are no records found.
																			</td>
																			</tr>
																			<%
																		}
																	%>
																	
														
																</tbody>
															</table>
														</td>
														
		</tr>
			</table></td></tr>	
			
			
			<% if(obImageUploadAddList != null && obImageUploadAddList.size() != 0) {%>
								<tr> 
									<td height="25">
									<table id="generalPurposeBar" width="100%" border="0"
										cellspacing="0" cellpadding="5" align="center">
										<tr class="even">
										
											<%
											String facNames = "";
											String catog = "";
											String url="ImageUploadAdd.do?event=view_uploaded_image_listing_search_page&facilityName="+facNames+"&category="+catog+"&customerName="+customerName+"&legalName="+legalId+"&startIndex=";
				         %><td width="86" valign="middle"><integro:pageindex
												pageIndex="<%=new PageIndex(startIndex, 100, listSize)%>"
												url="<%=url%>" /></td>
										</tr>
									</table>
									</td>
								</tr>
								
								
								<%} %>			
			
			<html:hidden property="selectedArray" />
								<html:hidden property="unCheckArray" />							
<td align="center">
	<br>
		<a href="javascript:cancelPage()"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a>
<!--  
<a href="ImageUploadAdd.do?event=submit" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit1.gif',1)">
<img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a>
-->
<!--  
<%//if (obImageUploadAddList != null && obImageUploadAddList.size() != 0) { %>
	<a href="javascript:submitImageUpload();"><img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a>
	<a href="javascript:cancelPage()"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a>
	
<%// }else{%>
	<!-- <a href="ImageUpload.do?event=image_upload" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /> </a>-> 

<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
<img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a>

<%//} %>
-->
</td>
	</html:form>
												</tbody>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</body>
</html>