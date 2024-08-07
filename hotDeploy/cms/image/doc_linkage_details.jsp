<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String customerName = request.getParameter("customerName");
String legalName = request.getParameter("legalName");
String fromAmt = request.getParameter("fromAmt");
String typeOfDocVal = request.getParameter("typeOfDocVal");
String docNameVal = request.getParameter("docNameVal");
String docDatetypeVal = request.getParameter("docDatetypeVal");
String docToAmt = request.getParameter("docToAmt");
String docFrmDateVal = request.getParameter("docFrmDateVal");
String docToDateval = request.getParameter("docToDateval");

String event=request.getParameter("event");
System.out.println("event: "+event);

List bankList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.bankList");
if(bankList == null){
	bankList = new ArrayList();
}

String imgCatSecurity = ICMSConstant.CODE_IMG_CATEGORY_SECURITY;
String imgCatSecurity1 = "IMG_CATEGORY_SECURITY";
String imgCatFacility = ICMSConstant.CODE_IMG_CATEGORY_FACILITY;
String imgCatOther = ICMSConstant.CODE_IMG_CATEGORY_OTHERS;
String imgCatCam = ICMSConstant.CODE_IMG_CATEGORY_CAM;
String imgCatStatement = ICMSConstant.CODE_IMG_CATEGORY_STOCK_STMT;
String imgCatExchOfInfo = ICMSConstant.CODE_IMG_CATEGORY_EXCH_INFO;

List imgUploadList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.imgUploadList");
if(imgUploadList == null)
	imgUploadList = new ArrayList();

List obImageUploadAddList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.obImageUploadAddList");
if(obImageUploadAddList == null)
	obImageUploadAddList = new ArrayList();

List custImageListWithTag = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.custImageListWithTag");
if(custImageListWithTag == null){
	custImageListWithTag = new ArrayList();
}

Map<String, String> facilityMap = (Map<String, String>) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.facilityMap");
if(facilityMap == null){
	facilityMap = new HashMap<String, String>();
}

List custIdList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.custIdList");
if(custIdList == null)
	custIdList = new ArrayList();
List facilityCodeList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.facilityCodeList");
if(facilityCodeList == null)
	facilityCodeList = new ArrayList();
List otherDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.otherDocList");
if(otherDocList == null)
	otherDocList = new ArrayList();
List securityNameIdList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.securityNameIdList");
if(securityNameIdList == null)
	securityNameIdList = new ArrayList();
List otherSecDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.otherSecDocList");
if(otherSecDocList == null)
	otherSecDocList = new ArrayList();
List statementDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.statementDocList");
if(statementDocList == null)
	statementDocList = new ArrayList();
List camNumberList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.camNumberList");
if(camNumberList == null)
	camNumberList = new ArrayList();
List camDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.camDocList");
if(camDocList == null)
	camDocList = new ArrayList();
List otherMasterDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.otherMasterDocList");
if(otherMasterDocList == null)
	otherMasterDocList = new ArrayList();
List filteredOtherDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.filteredOtherDocList");
if(filteredOtherDocList == null)
	filteredOtherDocList = new ArrayList();
List filteredOtherSecDocList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.filteredOtherSecDocList");
if(filteredOtherSecDocList == null)
	filteredOtherSecDocList = new ArrayList();
String hasError = "N";

if (request.getAttribute("org.apache.struts.action.ERROR") !=null){
	hasError = "Y";
}

int counter = 0;
int counter2 = 0;
pageContext.setAttribute("imgUploadList", imgUploadList);
pageContext.setAttribute("obImageUploadAddList", obImageUploadAddList);
pageContext.setAttribute("bankList", bankList);
pageContext.setAttribute("custIdList", custIdList);
pageContext.setAttribute("facilityCodeList", facilityCodeList);
pageContext.setAttribute("otherDocList", otherDocList);
pageContext.setAttribute("securityNameIdList", securityNameIdList);
pageContext.setAttribute("otherSecDocList", otherSecDocList);
pageContext.setAttribute("statementDocList", statementDocList);
pageContext.setAttribute("camNumberList", camNumberList);
pageContext.setAttribute("camDocList", camDocList);
pageContext.setAttribute("otherMasterDocList", otherMasterDocList);
pageContext.setAttribute("filteredOtherDocList",filteredOtherDocList);
pageContext.setAttribute("filteredOtherSecDocList", filteredOtherSecDocList);
%>
<head>
	<script type="text/javascript" src="js/ajaxDropdown.js"></script>
	<script>
	function toggleSubfolder2() {
    	document.forms[0].hasSubfolder.disabled=true;
    	document.forms[0].subfolderName.disabled=true;
	}
	function toggleSubfolder() {
		if(document.forms[0].category.value==""){
	    	document.forms[0].hasSubfolder.checked=false;
	    	document.forms[0].subfolderName.value="";
	    	document.forms[0].documentName.value="";
	    	document.forms[0].hasSubfolder.disabled=true;
	    	document.forms[0].subfolderName.disabled=true;
	    	document.forms[0].documentName.disabled=true;
	    	
	    }else{
	    	document.forms[0].hasSubfolder.disabled=false;
	    }
    
	}
	function toggleSubfolder1() {
		if(document.forms[0].hasSubfolder.checked==true){
	    	document.forms[0].subfolderName.disabled=false;
	    	document.forms[0].documentName.disabled=false;
	    }else{
	    	document.forms[0].subfolderName.disabled=true;
	    	document.forms[0].documentName.disabled=true;
	    }
	}
	function toggleFacilityCheckBox() {
		if(document.forms[0].hasFacility.checked == true){
			document.forms[0].hasFacility.checked=true;
			document.forms[0].hasSecurity.checked=false;
			document.forms[0].hasCam.checked=false;
		}
	}
	function toggleSecurityCheckBox() {
		if(document.forms[0].hasSecurity.checked==true){
			document.forms[0].hasFacility.checked=false;
			document.forms[0].hasSecurity.checked=true;
			document.forms[0].hasCam.checked=false;
		}
	}
	function toggleCamCheckBox() {
		if(document.forms[0].hasCam.checked==true){
			document.forms[0].hasFacility.checked=false;
			document.forms[0].hasSecurity.checked=false;
			document.forms[0].hasCam.checked=true;
		}
	}
	function populateBank(dropdown){
		if(dropdown.value == '<%=IImageTagConstants.IMG_CATEGORY_EXCH_INFO%>'){
			   document.getElementById("bank").disabled=false;
		}
		else{
			document.getElementById("bank").value="";
			document.getElementById("bank").disabled=true;
		}
	}
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
		    document.getElementById('facilityName').value=curSel;
	}

	function refreshOtherDocName(dropdown) {
		var otherDoc=document.getElementById('facilityDocName').value;
		if(otherDoc === "Other Additional Document"){
			document.getElementById("otherDocName").disabled=false;
			refreshOtherDocument("Facility", "otherDocName");
		}else{
			document.getElementById("otherDocName").disabled=true;
		}
	}
	function refreshSecDocName(dropdown) {
	 document.getElementById("otherSecDocName").disabled=true;
	    var curSel = "";
	        for(i=0; i < dropdown.options.length; i++)   {
	            if (dropdown.options[i].selected == true) {
	                curSel = dropdown.options[i].value;
	            }
	        }
	    var dep = 'securityDocName';
	    var curSels =curSel;
	    var url = '/cms/ImageUploadAdd.do?event=refresh_security_document_name&secDocCode='+curSels;
	    sendLoadDropdownReq(dep, url);
	    document.getElementById('securityNameId').value=curSel;
	}
	function refreshOtherSecDocName(dropdown) {
		var otherDoc=document.getElementById('securityDocName').value;
		if(otherDoc === "Other Additional Document"){
			document.getElementById("otherSecDocName").disabled=false;
			refreshOtherDocument("Security", 'otherSecDocName');
		}else{
			document.getElementById("otherSecDocName").disabled=true;
		}
	  }
	function refreshStatementDocName(value){
	   var val = document.getElementById('statementTyped').value;
	   if(val =="" || val == null){
		   document.getElementById("statementdocNames2").style.display = '';
		   document.getElementById("statementDocName2").disabled=false;
		   document.getElementById("statementDocName").disabled=true;
		   document.getElementById("statementdocNames1").style.display = 'none';
	   }else{
		   document.getElementById("statementdocNames1").style.display = '';
		   document.getElementById("statementDocName").disabled=false;
		   document.getElementById("statementDocName2").disabled=true;
		   document.getElementById("statementdocNames2").style.display = 'none';
	   }
	}
	function refreshDisabledFields(dropdown){
	   var securityImg = '<%=imgCatSecurity%>';
	   var securityImg1 = '<%=imgCatSecurity1%>';
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
			
			document.getElementById("securityNameId").value="";
			document.getElementById("securityDocName").value="";
			document.getElementById("otherSecDocName").value="";
			document.getElementById("statementTyped").value="";
			document.getElementById("statementDocName").value="";
			document.getElementById("camDocName").value="";
			document.getElementById("othersDocsName").value="";
			document.getElementById("hasCam").value="";
			document.getElementById("bank").options[0].selected = "selected";
			
			document.getElementById("securityNameId").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
		}else if(docTypeValue === securityImg || docTypeValue == securityImg1){
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
			
			document.getElementById("facilityName").value="";
			document.getElementById("facilityDocName").value="";
			document.getElementById("otherDocName").value="";
			document.getElementById("statementTyped").value="";
			document.getElementById("statementDocName").value="";
			document.getElementById("camDocName").value="";
			document.getElementById("othersDocsName").value="";
			document.getElementById("hasCam").value="";
			document.getElementById("bank").options[0].selected = "selected";
			
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
		}else if(docTypeValue === camImg){
			
			document.getElementById("facilityName").value="";
			document.getElementById("facilityDocName").value="";
			document.getElementById("securityNameId").value="";
			document.getElementById("securityDocName").value="";
			document.getElementById("otherDocName").value="";
			document.getElementById("otherSecDocName").value="";
			document.getElementById("statementTyped").value="";
			document.getElementById("statementDocName").value="";
			document.getElementById("othersDocsName").value="";
			document.getElementById("bank").options[0].selected = "selected";
			
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
		}else if(docTypeValue === exchOfInfoImg){
			
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
			document.getElementById("bank").disabled=false;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
		}else if(docTypeValue === otherImg){
			
			document.getElementById("facilityName").value="";
			document.getElementById("facilityDocName").value="";
			document.getElementById("securityNameId").value="";
			document.getElementById("securityDocName").value="";
			document.getElementById("otherDocName").value="";
			document.getElementById("otherSecDocName").value="";
			document.getElementById("statementTyped").value="";
			document.getElementById("statementDocName").value="";
			document.getElementById("camDocName").value="";
			document.getElementById("hasCam").value="";
			document.getElementById("bank").options[0].selected = "selected";
			
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
		}else if(docTypeValue === statementImg){
			
			document.getElementById("facilityName").value="";
			document.getElementById("facilityDocName").value="";
			document.getElementById("securityNameId").value="";
			document.getElementById("securityDocName").value="";
			document.getElementById("otherDocName").value="";
			document.getElementById("otherSecDocName").value="";
			document.getElementById("camDocName").value="";
			document.getElementById("hasCam").value="";
			document.getElementById("bank").options[0].selected = "selected";
			
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
			
			var val = document.getElementById('statementTyped').value;
			   if(val =="" || val == null){
				   document.getElementById("statementdocNames2").style.display = '';
				   document.getElementById("statementDocName2").disabled=false;
				   document.getElementById("statementDocName").disabled=true;
				   document.getElementById("statementdocNames1").style.display = 'none';
			   }else{
				   document.getElementById("statementdocNames1").style.display = '';
				   document.getElementById("statementDocName").disabled=false;
				   document.getElementById("statementDocName2").disabled=true;
				   document.getElementById("statementdocNames2").style.display = 'none';
			   }
			
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
			
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
			document.getElementById("bank").options[0].selected = "selected";
		}
	}
	window.onload = function(){
	   var securityImg = '<%=imgCatSecurity%>';
	   var securityImg1 = '<%=imgCatSecurity1%>';
	   var facilityImg = '<%=imgCatFacility%>';
	   var otherImg = '<%=imgCatOther%>';
	   var camImg = '<%=imgCatCam%>';
	   var statementImg = '<%=imgCatStatement%>';
	   var exchOfInfoImg = '<%=imgCatExchOfInfo%>';
	   var hasError = '<%=hasError%>';
	   var docTypeValue=document.getElementById('typeDoc').value;
	   /* if(docTypeValue === "Facility"){ */
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
			var facilityName = document.getElementById("facilityName");
			refreshFacDocName(facilityName);
			
		/* }else if(docTypeValue === "Security"){ */
			}else if(docTypeValue === securityImg || docTypeValue == securityImg1){
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
			var securityNameId = document.getElementById("securityNameId");
			refreshSecDocName(securityNameId);
			
		/* }else if(docTypeValue === "CAM"){ */
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
			
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
			document.getElementById("statementdocNames2").style.display = '';
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("statementdocNames1").style.display = 'none';
			
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
			
			var val = document.getElementById('statementTyped').value;
			   if(val =="" || val == null){
				   document.getElementById("statementdocNames2").style.display = '';
				   document.getElementById("statementDocName2").disabled=false;
				   document.getElementById("statementDocName").disabled=true;
				   document.getElementById("statementdocNames1").style.display = 'none';
			   }else{
				   document.getElementById("statementdocNames1").style.display = '';
				   document.getElementById("statementDocName").disabled=false;
				   document.getElementById("statementDocName2").disabled=true;
				   document.getElementById("statementdocNames2").style.display = 'none';
			   }
			
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
			
			document.getElementById("statementDocName2").disabled=true;
			document.getElementById("statementdocNames2").style.display = 'none';
			
			document.getElementById("facilityName").disabled=true;
			document.getElementById("facilityDocName").disabled=true;
			document.getElementById('securityNameId').disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("otherDocName").disabled=true;
			document.getElementById("otherSecDocName").disabled=true;
			document.getElementById("bank").disabled=true;
			document.getElementById("statementTyped").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("hasCam").disabled=true;
			
			document.getElementById("bank").options[0].selected = "selected";
		}
		if(hasError == 'N')
	   		resetDocLinkage();
	}
	function resetDocLinkage(){
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
		
		document.getElementById("statementdocNames2").style.display = '';
		document.getElementById("statementDocName2").disabled=true;
		document.getElementById("statementDocName").disabled=true;
		document.getElementById("statementdocNames1").style.display = 'none';
		
		document.getElementById("bank").options[0].selected = "selected";
		
		document.getElementById("typeDoc").options[0].selected = "selected";
	}
	function addDocLinkage(){
		var formObj = document.forms[0];
        
        if(document.getElementById("facilityDocName").value == "Other Additional Document"){
        	if(document.getElementById("otherDocName").value ==""){
				alert("Please select Other Facility Document");
        		return;
        	}
        }
        
        if(document.getElementById("securityDocName").value == "Other Additional Document"){
        	if(document.getElementById("otherSecDocName").value ==""){
				alert("Please select Other Security Document");
        		return;
        	}
        }
        
		var idxs = "";
		var j = 0;
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'selectBox') {
                var obj = formObj.elements[i];
                if (obj.checked) {          
                	idxs +=  j + ",";
                }
                j++
            }
        }
        if(idxs == ""){
        	alert("Please select alteast one document from Image Uploaded Details");
        	return;
        }
        
	    formObj.selectIdx.value = idxs;
	    document.forms[0].action="ImageUploadAdd.do?event=add_doc_linkage&legalName=" + '<%=legalName%>';
		document.forms[0].submit();
	}
	function removeDocLinkage(){
		var formObj = document.forms[0];
		var idxs = "";
		var j = 0;
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'removeBox') {
                var obj = formObj.elements[i];
                if (obj.checked) {          
                	idxs +=  j + ",";
                }
                j++
            }
        }
        if(idxs == ""){
        	alert("Please select alteast one document from Document Linkage details with uploaded Images");
        	return;
        }
        
	    formObj.removeIdx.value = idxs;
	    document.forms[0].action="ImageUploadAdd.do?event=remove_doc_linkage&legalName=" + '<%=legalName%>';
		document.forms[0].submit();
	}
	function submitForm(){
	    document.forms[0].action="ImageUploadAdd.do?event=submit_doc_linkage&legalName=" + '<%=legalName%>';
		document.forms[0].submit();
	}
	function refreshOtherDocument(type, dep){
	    var url = '/cms/ImageUploadAdd.do?event=refresh_other_doc&type='+type;
		sendLoadDropdownReq(dep, url);
	}
	</script>
</head>
<html:form action="/ImageUploadAdd">
<html:hidden property="custId"/>
<input type="hidden" id="removeIdx" name="removeIdx">
<input type="hidden" id="selectIdx" name="selectIdx">
<body>
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
		      <td><h3>Document Linkage Details</h3></td>
		  	</tr>
  			<tr>
    			<td><hr/></td>
  			</tr>
  			 <tr>
  			 	<td><br></td>
  			 </tr>
  			 <tr>
    			<td><b>Image Uploaded Details</b></td>
  			</tr>
  			<tr>
  			 	<td><br></td>
  			 </tr>
  		</thead>
  		<tbody>
  			<tr>
  				<td>
  					<table width="60%" class="tblinfo" style="margin-top: 0" border="0" cellspacing="0" cellpadding="0">
  						<thead>
							<tr>
								<td width="2%">S/N</td>
								<td width="20%">File Name</td>
								<td width="2%">Select</td>
							</tr>
						</thead>
						<tbody>
							<logic:notEmpty name="imgUploadList">
								<logic:iterate id="imgUpload" name="imgUploadList"	type="com.integrosys.cms.app.image.bus.OBImageUploadAdd" 
								scope="page">
								<%
									String rowClass = "";
									counter++;
									if (counter % 2 != 0) {
										rowClass = "odd";
									} else {
										rowClass = "even";
									}
								%>
								<tr class=<%=rowClass%>>
									<td class="index" width="2%"><%=counter%></td>
									<td width="20%"><%=imgUpload.getImgFileName()%> </td>
									<td width="2%">
										<input type="checkbox" name="selectBox">
									</td>
								</tr>
								</logic:iterate>
							</logic:notEmpty>
							<logic:empty name="imgUploadList">
								<tr>
									<td colspan="11">
										Sorry, there are no records found.
									</td>
								</tr>
							</logic:empty>
						</tbody>		
  					</table>
  				</td>
  			</tr>
  		</tbody>
	</table>
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
		      <td><h3>Document Linkage</h3></td>
		  	</tr>
  			<tr>
    			<td><hr/></td>
  			</tr>
  		</thead>
  		<tbody>
  		<tr>
    		<td colspan="2">
        	<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
	            <thead>
	            </thead>
            	<tbody>
		 			<tr class="odd">
		           		<td class="fieldname" width="20%">Type of Document<font color="RED">*</font></td>
			           	<td width="30%">
			           			<html:select property="category" styleId="typeDoc" onchange="javascript:refreshDisabledFields(this);">
			                       <integro:common-code categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY%>" descWithCode="false"/>
			                   </html:select> &nbsp; <br>
							<html:errors property="typeOfDocumentError" />
						</td> 
		               	<td class="fieldname" width="20%"></td>
		               	<td width="30%">&nbsp;</td>
		           	</tr>
                 	<tr class="even">
                    	<td class="fieldname" width="20%">Facility</td>
                    	<td width="30%">
          		 			<html:select property="facilityName" styleId="facilityName" onchange="javascript:refreshFacDocName(this);" style='width: 200px;' disabled="true">
                     		<html:option value="">Please Select</html:option> 
                        	<html:options name="facilityCodeList" labelName="custIdList"></html:options> 
                      		</html:select> 
                      		<html:errors property="facilityNameError"/>&nbsp; 
                      	</td> 
                    	<td class="fieldname" width="20%">Facility Document Name</td>
                     	<td width="30%">
                      	<%	if(event.equals("refresh_facility_document_name")){ %>
	          		 		<html:select property="facilityDocName"  styleId="facilityDocName" onchange="javascript:refreshOtherDocName(this);" style='width: 200px;' disabled="true">
	                     	<html:option value="">Please Select</html:option> 
	                        <html:options  name="facilityDocNameList" ></html:options>
	                      </html:select> 
                       <%}else{ %>
	                       	<html:select property="facilityDocName"  styleId="facilityDocName" onchange="javascript:refreshOtherDocName(this);" style='width: 200px;' disabled="true">
	                     	<html:option value="">Please Select</html:option> 
                      		</html:select>
                      <%} %>
                      &nbsp;
                      		<html:errors property="facilityDocNameError"/>
                      </td> 
                	</tr>
                	<tr class="odd">
                 		<td class="fieldname" width="20%"></td>
                     	<td width="30%"></td>
                    	<td class="fieldname" width="20%">Other Facility Document</td>
                     	<td width="30%">
          		 			<html:select property="otherDocName" disabled="true" styleId="otherDocName" style='width: 200px;'>
	                     		<html:option value="">Please Select</html:option> 
	                        	<html:options name="filteredOtherDocList"></html:options>
                        	</html:select>
                        	&nbsp; 
                      		<html:errors property="otherFacilityDocNameError"/>
                      </td> 
                	</tr>
                	<tr class="even">
	                    <td class="fieldname" width="20%">Security</td>
	                    <td width="30%">
	                    <html:select property="securityNameId" styleId="securityNameId" onchange="javascript:refreshSecDocName(this);" style='width: 200px;' disabled="true">
	                     	<html:option value="">Please Select</html:option> 
	                        <html:options name="securityNameIdList" labelName="securityNameIdList"></html:options> 
	                      </html:select> 
	                    <html:errors property="securityNameIdError"/>
	                    </td>
                    	<td class="fieldname" width="20%">Security Document Name</td> 
                     	<td width="30%">
                      	<%	if(event.equals("refresh_security_document_name")){ %>
	          		 		<html:select property="securityDocName"  styleId="securityDocName" onchange="javascript:refreshOtherSecDocName(this);" style='width: 200px;' disabled="true">
		                     	<html:option value="">Please Select</html:option> 
		                        <html:options  name="securityDocNameList" ></html:options>
                      		</html:select> 
                       <%}else{ %>
                       		<html:select property="securityDocName"  styleId="securityDocName" onchange="javascript:refreshOtherSecDocName(this);" style='width: 200px;' disabled="true">
                     		<html:option value="">Please Select</html:option> 
                      		</html:select>
                      <%} %>
                      		&nbsp; 
                      		<html:errors property="securityDocNameIdError"/>
                      </td> 
                	</tr>
					<tr class="odd">
                 		<td class="fieldname" width="20%"></td>
                     	<td width="30%"></td>
                    	<td class="fieldname" width="20%">Other Security Document</td>
                     	<td width="30%">
          		 			<html:select property="otherSecDocName" disabled="true" styleId="otherSecDocName" style='width: 200px;'>
                     			<html:option value="">Please Select</html:option> 
                        		<html:options name="filteredOtherSecDocList"></html:options> 
                      		</html:select> 
                      		&nbsp; 
                      		<html:errors property="otherSecurityDocNameError"/>
                      </td>  
                	</tr>
                	<tr class="even">
                    	<td class="fieldname" width="20%">Statement Type</td>
                    	<td width="30%">
          		 			<html:select property="statementTyped" styleId="statementTyped" onchange="refreshStatementDocName(this);" style='width: 200px;' disabled="true">
                            	<integro:common-code categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" descWithCode="false" />
                             </html:select>
                      		<html:errors property="statementTypeError"/>
                     		 &nbsp; 
                      	</td> 
	                    <td class="fieldname" width="20%">Statement Document Name</td>
                     	<td width="30%" id="statementdocNames1">
          		 			<html:select property="statementDocName"  styleId="statementDocName" style='width: 200px;' disabled="true">
                     			<html:option value="">Please Select</html:option> 
                         		<html:options  name="statementDocList" ></html:options>
                      		</html:select> 
                      		&nbsp; 
                      		<html:errors property="statementDocNameError"/>
                      	</td>
                      	<td width="30%" id="statementdocNames2">
          		 			<html:select property="statementDocName"  styleId="statementDocName2" style='width: 200px;' disabled="true">
                     			<html:option value="">Please Select</html:option> 
                      		</html:select> 
                      		&nbsp; 
                      		<html:errors property="statementDocNameError"/>
                      </td> 
                	</tr>
                	<tr class="even">
	                    <td class="fieldname" width="20%">CAM Number</td>
	                    <td width="30%">
          		 			<html:select property="hasCam" styleId="hasCam"  style='width: 200px;' disabled="true">
	                     		<html:option value="">Please Select</html:option> 
	                        	<html:options name="camNumberList" ></html:options> 
	                      	</html:select> 
                      		<html:errors property="camNumberError"/>
                      		&nbsp; 
                      	</td> 
                    	<td class="fieldname" width="20%">CAM Document Name</td>
                     	<td width="30%">
          		 			<html:select property="camDocName"  styleId="camDocName" style='width: 200px;' disabled="true">
                     			<html:option value="">Please Select</html:option> 
                       			<html:options  name="camDocList" ></html:options> 
                      		</html:select> 
                      		<html:errors property="camDocNameError"/>
                      </td> 
                	</tr>
                	<tr class="even">
	                    <td class="fieldname" width="20%">Other Document Name</td>
	                    <td width="30%">
          		 			<html:select property="othersDocsName" styleId="othersDocsName" style='width: 200px;' disabled="true">
		                     	<html:option value="">Please Select</html:option> 
		                        <html:options name="otherMasterDocList" ></html:options> 
                      		</html:select> 
	                      	<html:errors property="otherMasterError"/>
	                      	&nbsp; 
                      	</td> 
                     	<td class="fieldname" width="20%">Bank Name</td>
                     	<td width="30%">
	                       	<html:select property="bank" disabled="true" styleId="bank">
		                      	<html:option value="">Please Select</html:option> 
		                        <html:options collection="bankList" property="value" labelProperty="label"></html:options>
	                      	</html:select> 
	                    	<html:errors property="bankError"/>
	                      	&nbsp; 
                      	</td>  
                	</tr>                	                	                			           
  				</tbody>
  				</table>
  			</td>
  		</tr>
  	</table>
  	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
		<thead></thead>
		<tbody>
			<tr>
    			<td width="65">&nbsp;</td>
    			<td width="65">&nbsp;</td>
  			</tr>
  			<tr>
  				<td colspan="2">
  					<input type="button" class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" value="Add" onclick="addDocLinkage();">&nbsp;
  					<input type="button" class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" value="Clear" onclick="resetDocLinkage();">
  					<br>
  				</td>
  			</tr>
		</tbody>
	</table>	
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
		      <td><h3>Document Linkage details with uploaded Images</h3>
		      	<p align="right">
		      			<input type="button" class="btnNormal" value="Remove" onclick="removeDocLinkage();">
		      	</p>
		      </td>

		  	</tr>
  			<tr>
    			<td><hr/></td>
  			</tr>
  		</thead>
  		<tbody>
  			<tr>
  				<td>
  					<table width="100%" class="tblinfo" style="margin-top: 0" border="0" cellspacing="0" cellpadding="0">
  						<thead>
							<tr>
								<td width="2%">S/N</td>
								<td width="20%">File Name</td>
								<td width="10%">Type of Document</td>
								<td width="10%">Type/ID</td>
								<td width="10%">Document Name</td>
								<td width="10%">Other Document Name</td>
								<td width="10%">Subfolder Name</td>
								<td width="10%">Document Name (Migrated)</td>
								<td width="10%">Bank Name</td>
								<td width="10%">Upload Date & Timestamp</td>
								<td width="2%">Remove</td>
							</tr>
						</thead>
						<tbody>
							<logic:notEmpty name="obImageUploadAddList">
								<logic:iterate id="obImageUploadAdd" name="obImageUploadAddList"	type="com.integrosys.cms.app.image.bus.OBImageUploadAdd" 
								scope="page">
								<%
									String rowClass = "";
									counter2++;
									if (counter % 2 != 0) {
										rowClass = "odd";
									} else {
										rowClass = "even";
									}
								%>
								<tr class=<%=rowClass%>>
									<td class="index" width="2%"><%=counter2%></td>
									<td width="20%"><%=obImageUploadAdd.getImgFileName()%> </td>
									<td width="10%"><integro:common-code-single categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY%>" display="true" descWithCode="false" entryCode="<%=obImageUploadAdd.getCategory()%>"/> </td>
									<%if(imgCatFacility.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=facilityMap.get(obImageUploadAdd.getFacilityName()) %>"/>
									</td>
									<%}else if(imgCatSecurity.equals(obImageUploadAdd.getCategory())){ 
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
									<%}else if(imgCatCam.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=obImageUploadAdd.getHasCam() %>"/>
									</td>
									<%}else if(imgCatStatement.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:common-code-single categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=obImageUploadAdd.getStatementTyped()%>" display="true" descWithCode="false"/>
									</td>
									<%}else{%>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="-"/>
									</td>
									<%}%>
									<%if(imgCatFacility.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityDocName() %>"/>
									</td>
									<%}else if(imgCatSecurity.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=obImageUploadAdd.getSecurityDocName() %>"/>
									</td>
									<%}else if(imgCatCam.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=obImageUploadAdd.getCamDocName() %>"/>
									</td>
									<%}else if(imgCatStatement.equals(obImageUploadAdd.getCategory())){ %>
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
									<%if(imgCatFacility.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=obImageUploadAdd.getOtherDocName() %>"/>
									</td>
									<%}else if(imgCatSecurity.equals(obImageUploadAdd.getCategory())){ %>
									<td width="10%">
										&nbsp;
									<integro:empty-if-null value="<%=obImageUploadAdd.getOtherSecDocName() %>"/>
									</td>
									<%}else if(imgCatOther.equals(obImageUploadAdd.getCategory())){ %>
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
									
									<%if(imgCatExchOfInfo.equals(obImageUploadAdd.getCategory())){ %>
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
									<td width="2%">
									<%if(obImageUploadAdd.getImgId() > 0) {%>
										<input type="checkbox" name="removeBox" disabled="disabled">
									<%}else{ %>	
										<input type="checkbox" name="removeBox">
									<%} %>
									</td>
								</tr>
								</logic:iterate>
							</logic:notEmpty>
							<logic:empty name="obImageUploadAddList">
								<tr>
									<td colspan="11">
										Sorry, there are no records found.
									</td>
								</tr>
							</logic:empty>
						</tbody>		
  					</table>
  				</td>
  			</tr>
  		</tbody>
	</table>
	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
		<thead></thead>
		<tbody>
			<tr>
    			<td width="65">&nbsp;</td>
    			<td width="65">&nbsp;</td>
  			</tr>
  			<tr>
  				<td colspan="1">
  					<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" 
  					onClick=" submitForm()">
  						<img src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
					</a>&nbsp;&nbsp;
  				</td>
  			</tr>
		</tbody>
	</table>	
</body>
</html:form>