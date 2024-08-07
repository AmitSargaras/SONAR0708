<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants,com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html
	xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page
	import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
<%
	
	//OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
	List list1 = null;
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<%
List docList=(List) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.docList");
System.out.println("docList:  "+docList);
if(null!=docList)
    pageContext.setAttribute("docList",docList);
	String context = request.getContextPath() + "/";

	//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II   
	List bankList=(List)	session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.bankList");
	DefaultLogger.debug(this,"bankList:"+bankList);
	System.out.println("bankList:  "+bankList);
	if(null!=bankList){
		 pageContext.setAttribute("bankList",bankList); 
		 DefaultLogger.debug(this,"bankList is not null, setting in pagecontext");
	}
	
	
/*String category1=(String)request.getAttribute("category");
System.out.println("category:"+category1);
if(null!=category1 && !category1.isEmpty()){
	 pageContext.setAttribute("category",category1); 
System.out.println("category1 inside if loop:"+category1); 
} */
//Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II
%>

<%


SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.searchResult");
HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.selectedArrayMap");
session.setAttribute("searchResult",searchResult);

String pID1 = request.getParameter("pID");
String imageName1 = request.getParameter("imageName");
String status1 = request.getParameter("status");
String count2 =(String)request.getParameter("count");
 
int count1 = 0;

if(pID1==null)
{
	pID1 = "";
}
if(imageName1==null)
{
	imageName1 = "";
}
if(status1==null)
{
	status1 = "";
}
if(count2==null)
{
	 count1 = Integer.parseInt("1");
}
else{
	 count1 = Integer.parseInt(count2);
}

if(selectedArrayMap ==null){
	selectedArrayMap =new HashMap();
}

//System.out.println("searchResult:::::::::::"+searchResult.getNItems());
int counter = 0;
int noofItems = 0;
int index = 0;
int sno = 0;
int startInd = 0;

Collection resultList = null;
int totalCount = 0;
int listSize = 0;
if (searchResult != null) {
	resultList = searchResult.getResultList();
	
	startInd = searchResult.getStartIndex();
	totalCount = searchResult.getNItems();
	listSize = resultList.size();
	pageContext.setAttribute("imageListSize", Integer.toString(listSize));
	
	/*if (resultList != null) {
		TreeMap soretedMap = new TreeMap();
		Iterator itr = resultList.iterator();
		while(itr.hasNext()){
		    OBImageUploadAdd ob=(OBImageUploadAdd)itr.next();
		    
			soretedMap.put(ob.getImgFileName()==null?"":ob.getImgFileName().toUpperCase(),ob);	
			
		}
		resultList = new ArrayList(soretedMap.values());
	}*/
	pageContext.setAttribute("resultList", resultList);
}
	ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
	
String catg="";
String docTye="";
String docDescription="";
String custLimitProfileID=request.getParameter("custLimitProfileID");

if(imageTagMapForm!=null){
	catg=imageTagMapForm.getCategory();
	docTye=imageTagMapForm.getDocType();
	docDescription=imageTagMapForm.getDocDesc();
}
//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II
List excludeList=new ArrayList();
//String str="EXCHANGE_OF_INFO";
if((IImageTagConstants.IMG_CATEGORY_EXCH_INFO).equals(imageTagMapForm.getCategory())){
	excludeList.add(IImageTagConstants.CAM_DOC);
	excludeList.add(IImageTagConstants.CAM_NOTE);
	excludeList.add(IImageTagConstants.FACILITY_DOC);
	excludeList.add(IImageTagConstants.LAD_DOC);
	excludeList.add(IImageTagConstants.OTHER_DOC);
	excludeList.add(IImageTagConstants.RECURRENTDOC_DOC);
	excludeList.add(IImageTagConstants.SECURITY_DOC);
}
else{
excludeList.add(IImageTagConstants.EXCHANGE_OF_INFO);
}
System.out.println("excludeList:"+excludeList);
System.out.println("docTye:"+docTye);
System.out.println("catg:"+catg);
//pageContext.setAttribute("excludeList",excludeList);

//Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II
    String rowClass = "";
	String recordsString = PropertyManager
			.getValue("customer.pagination.nitems");
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
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	
	// System.out.println("value of records_per_page"+records_per_page);
	
	// code start:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
	
	String imgCatSecurity = ICMSConstant.IMAGE_CATEGORY_SECURITY;
	String imgCatFacility = ICMSConstant.IMAGE_CATEGORY_FACILITY;
	String imgCatOther = ICMSConstant.IMAGE_CATEGORY_OTHER;
	String imgCatCam = ICMSConstant.IMAGE_CATEGORY_CAM;
	String imgCatStatement = ICMSConstant.IMAGE_CATEGORY_STATEMENT;
	String imgCatExchOfInfo = ICMSConstant.IMAGE_CATEGORY_EXCHANGE_OF_INFO;
	
	List typeOfDocList=(List)request.getAttribute("typeOfDocList");
	DefaultLogger.debug(this,"typeOfDocList:"+ typeOfDocList);
	System.out.println("typeOfDocList List : "+ typeOfDocList);
	
	Set<String> taggedImageIdSet=(HashSet)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.taggedImageIdSet");
	DefaultLogger.debug(this,"taggedImageIdSet:"+taggedImageIdSet);
	
	List statementDocList=(List)request.getAttribute("statementDocList");
	System.out.println("statementDocList List : "+ statementDocList);

	List camDocList=(List)request.getAttribute("camDocList");
	System.out.println("camDocList List : "+ camDocList);

	List otherMasterDocList=(List)request.getAttribute("otherMasterDocList");
	System.out.println("otherMasterDocList List : "+ otherMasterDocList);
	
	List securityDocTagModuleList=(List)request.getAttribute("securityDocTagModuleList");
	System.out.println("securityDocTagModuleList List : "+ securityDocTagModuleList);
	
	List facilityDocTagModuleList=(List)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.facilityDocTagModuleList");
	DefaultLogger.debug(this,"facilityDocTagModuleList:"+facilityDocTagModuleList);
	if(null!=facilityDocTagModuleList){
		 pageContext.setAttribute("facilityDocTagModuleList",facilityDocTagModuleList); 
		 DefaultLogger.debug(this,"facilityDocTagModuleList is not null, setting in pagecontext");
	}

	
	//ImageUploadAddForm imageUploadAddForm=(ImageUploadAddForm) request.getAttribute("imageUploadAddForm");
	String event = request.getParameter("event");
	String typeOfDocs = imageTagMapForm.getTypeOfDocument();
	System.out.println("Type of doc ="+imageTagMapForm.getTypeOfDocument());
	System.out.println("Category ="+imageTagMapForm.getCategory());
	System.out.println("Facility Name ="+imageTagMapForm.getFacilityName());
	System.out.println("Facility doc Name ="+imageTagMapForm.getFacilityDocName());
	String facdocnamed = imageTagMapForm.getFacilityName();
	System.out.println("Security Name ="+imageTagMapForm.getSecurityNameId());
	System.out.println("Security doc Name ="+imageTagMapForm.getSecurityDocName());
	if("list_tag_page".equals(event) || "paginate".equals(event)){
		imageTagMapForm.setCategory(typeOfDocs);
	}
	
    // code end:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
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
<script type="text/javascript">
    var GB_ROOT_DIR = "./greybox/";
</script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/ajaxGetImage.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxListCAMInfoValues.js"></script>	
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxListImageTag.js"></script>



<script type="text/javascript" src="<%=context%>greybox/base/AJS.js"></script>
<script type="text/javascript" src="<%=context%>greybox/base/AJS_fx.js"></script>
<script type="text/javascript" src="<%=context%>greybox/gb_scripts.js"></script>
<link href="<%=context%>greybox/gb_styles.css" rel="stylesheet"
	type="text/css" />
<link href="<%=context%>greybox/base/base.css" rel="stylesheet"
	type="text/css" />

<link href="<%=context%>greybox/window/window.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=context%>greybox/window/window.js"></script>


<link href="<%=context%>greybox/set/set.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/set/set.js"></script>

<link href="<%=context%>greybox/gallery/gallery.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=context%>greybox/gallery/gallery.js"></script>







<script language="JavaScript" type="text/JavaScript">
function submitPage() {

	var s_value = "";
	var n_value = "";
	var docDesc= document.forms[0].docDesc.value;
	//alert(docDesc);

	if(docDesc!=''){
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
		document.forms[0].action="ImageTagMap.do?event=save_image_tag&imageId="+s_value+"&unCheckId="+n_value;
	    document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    document.forms[0].submit();
	} else{
		alert("Please select the image for tagging.");
	}
	}else{
		alert("Please select the document for tagging.");
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
	var catg= document.forms[0].category.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
     
     
	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow1("ImageTagMap.do?event=print_image&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}
function viewImage() {

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
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow("ImageTagMap.do?event=view_image&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=1800,height=1600,left=0,top=0')
	  // window.focus(); 
		} else{
		alert("Please select the image for view.");
	}
}

//at new requirement in doc maintenance below line shows errors therefore commented.
//insertHeader();
//insertMenu('examples');

function goPageIndex(targetOffset) {
	//alert("targetOffset"+targetOffset);
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


	
	document.forms[0].startIndex.value = targetOffset;
	document.forms[0].selectedArray.value=s_value;
	document.forms[0].unCheckArray.value=n_value;
	document.forms[0].event.value = "paginate";
	document.forms[0].action="ImageTagMap.do?event=paginate&custLimitProfileID=<%=custLimitProfileID%>&legalName=<%=custId%>&imageId="+s_value+"&unCheckId="+n_value+"&category=<%=category%>&custId=<%=custId%>&customerName=<%=customerName%>&startIndex="+targetOffset;
    document.forms[0].submit();
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
  document.forms[0].selectedArray.value=s_value;
  //alert("getImageGallary");
	//alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+catg);
	//alert("count is "+count);
	document.forms[0].action="ImageTagMap.do?event=retrieveImageGallary&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg+"&imageId="+s_value+"&unCheckId="+n_value;
	document.forms[0].submit();
}


function cancelPage() {
    document.forms[0].action="ImageTag.do?event=image_tag&customerID=-999999999&limitProfileID=-999999999";
    document.forms[0].submit();
}
function closePage() {
    document.forms[0].action="ImageTag.do?event=image_tag&customerID=-999999999&limitProfileID=-999999999";
    document.forms[0].submit();
}
function showListing() {
	
	var catg= document.forms[0].category.value;
	if(catg!=null  && catg!=""){
		//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II
		var bank=document.getElementById("bank").value;
	
		if(catg== '<%=IImageTagConstants.IMG_CATEGORY_EXCH_INFO%>' && (bank!=null && bank=="")){
			alert("Please Select Bank");
		    }
		//Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II
		else{
    document.forms[0].action="ImageTagMap.do?category="+catg+"&reset=Y";
    document.forms[0].event.value="list_tag_page";
    document.forms[0].submit();
		}
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
	document.forms[0].docStatus.value='';
	document.forms[0].receivedDate.value='';
	document.forms[0].docDate.value='';
	document.forms[0].docAmt.value='';
	document.forms[0].camType.value='';
	document.forms[0].camDate.value='';
	document.forms[0].expiryDate.value='';
	//alert(docTypeCode);
	if(docTypeCode=='FACILITY_DOC'){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = '';
		document.getElementById('docDescFields').style.display = '';
		document.getElementById('camFields').style.display = 'none';
		document.getElementById('stat').style.display = '';
		
		dep = 'facilityId';
		url ='/cms/ImageTag.do?event=refresh_dropdowns&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
		}
	else if(docTypeCode=='SECURITY_DOC'){
		document.getElementById('collateralFields').style.display = '';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		document.getElementById('camFields').style.display = 'none';
		document.getElementById('stat').style.display = '';
		
		dep = 'secType';
		url ='/cms/ImageTag.do?event=refresh_dropdowns&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
		}
	else if(docTypeCode=='CAM_DOC' 
			||docTypeCode=='RECURRENTDOC_DOC'
			||docTypeCode=='OTHER_DOC'
			||docTypeCode=='LAD_DOC'
			||docTypeCode == 'EXCHANGE_OF_INFO'	
			){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		document.getElementById('camFields').style.display = 'none';
		document.getElementById('stat').style.display = '';
		
		dep = 'docDesc';
		url ='/cms/ImageTag.do?event=refresh_cheklist&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
	}else if(docTypeCode=='CAM_NOTE'){
		document.getElementById('collateralFields').style.display = 'none';
		document.getElementById('facilityFields').style.display = 'none';
		document.getElementById('docDescFields').style.display = '';
		document.getElementById('stat').style.display = 'none';
		document.getElementById('camFields').style.display = 'none';
		
		dep = 'docDesc';
		url ='/cms/ImageTag.do?event=refresh_cheklist&custLimitProfileID=<%=custLimitProfileID%>&docTypeCode='+docTypeCode; 
	}else{
			document.getElementById('collateralFields').style.display = 'none';
			document.getElementById('facilityFields').style.display = 'none';
			document.getElementById('docDescFields').style.display = 'none';	
			document.getElementById('camFields').style.display = 'none';
			document.getElementById('stat').style.display = '';
	      
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
 	document.forms[0].docStatus.value='';
	document.forms[0].receivedDate.value='';
	document.forms[0].docDate.value='';
	document.forms[0].docAmt.value='';
	document.forms[0].camType.value='';
	document.forms[0].camDate.value='';
	document.forms[0].expiryDate.value='';
	
 clearDisplayDropdown('securityId');
 clearDisplayDropdown('docDesc');
   var dep = 'secSubtype';
   var url = '/cms/ImageTag.do?event=refresh_subtype&custLimitProfileID=<%=custLimitProfileID%>&securityType='+curSel; 
   sendLoadDropdownReq(dep, url);
}


function refreshSecurityId(dropdown)
{

	document.forms[0].docStatus.value='';
	document.forms[0].receivedDate.value='';
	document.forms[0].docDate.value='';
	document.forms[0].docAmt.value='';
	document.forms[0].camType.value='';
	document.forms[0].camDate.value='';
	document.forms[0].expiryDate.value='';
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

function showStat(val)
{
	var docTypeCode = document.forms[0].docType.value;
		if(docTypeCode == 'EXCHANGE_OF_INFO'){

			 var curSel = "";
			 for(i=0; i<val.options.length; i++)
			 {
				if (val.options[i].selected == true)
				    curSel = val.options[i].value;	
			 }
			 var txt = new String(val.value);
			 var dep = 'docStatus';
			 var url = '/cms/ImageTagMap.do?event=refresh_recc_doc_status_date&docDesc='+curSel;
			 sendLoadListReqImageTag(dep, url);
			
		}else if(docTypeCode!='CAM_NOTE'){
			 var curSel = "";
			 for(i=0; i<val.options.length; i++)
			 {
				if (val.options[i].selected == true)
				    curSel = val.options[i].value;	
			 }
			 var txt = new String(val.value);
			 var dep = 'docStatus';
			 var url = '/cms/ImageTagMap.do?event=refresh_status_date&docDesc='+curSel;
			 sendLoadListReqImageTag(dep, url);
		}
		else if(docTypeCode=='CAM_NOTE'){
					
					var cam ="";// document.forms[0].docDesc.value;
					for(i=0; i<val.options.length; i++)
					 {
						if (val.options[i].selected == true)
						    cam = val.options[i].value;	
					 }
					
					var camNo=cam.substring(0,13);
			
					document.getElementById('camFields').style.display = '';
					document.getElementById('collateralFields').style.display = 'none';
					document.getElementById('facilityFields').style.display = 'none';
					document.getElementById('docDescFields').style.display = '';	
				
					var depv = 'camType';
					 var urlv = '/cms/ImageTagMap.do?event=retrive_cam_info&custLimitProfileID=<%=custLimitProfileID%>&camNo='+camNo;
					
			
					 sendLoadListReqCamInfoValues(depv, urlv);
		}
}

function refreshDocumentChecklist(dropdown)
{
	document.forms[0].docStatus.value='';
	document.forms[0].receivedDate.value='';
	document.forms[0].docDate.value='';
	document.forms[0].docAmt.value='';
	document.forms[0].camType.value='';
	document.forms[0].camDate.value='';
	document.forms[0].expiryDate.value='';
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
   var url = '/cms/ImageTag.do?event=get_filter_subfolder_name&category='+curSel+'&custId=<%=custId%>';
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
   var url = '/cms/ImageTag.do?event=get_filter_docname&subfolderName='+curSel+'&category='+category+'&custId=<%=custId%>';
   sendLoadDropdownReq(dep, url);
}

function downloadImage(imagePath,imageName,status){ //v3.0

	
	var aLocation = 'ImageTag.do?event=downloadImage&imageName='+imageName+'&status='+status+'&pID='+imagePath;
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
	var catg= document.forms[0].category.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
		document.forms[0].unCheckArray.value=n_value;
	    //document.forms[0].submit();
	    //alert("document.forms[0].selectedArray.value"+ document.forms[0].selectedArray.value);
	   var aLocation ="ImageTagMap.do?event=download_image_zip&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value;     
		window.location.href = aLocation ;
		//document.forms[0].action="ImageTagMap.do?event=download_image_zip&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&custLimitProfileID="+<%=custLimitProfileID%>+"&imageId="+s_value+"&unCheckId="+n_value;     
	   // document.forms[0].submit();
		} else{
		alert("Please select the image for downloading.");
	}
}

//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II
function populateBank(dropdown){
	//alert("inside populateBank:"+dropdown.value);
	 var exchOfInfoImg = '<%=imgCatExchOfInfo%>';
	
	if(dropdown.value == exchOfInfoImg){
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
			document.getElementById("securityDocName").value='';
			document.getElementById("othersDocsName").value='';
			document.getElementById("statementDocName").value='';
			document.getElementById("camDocName").value='';   
			
			document.getElementById("facilityDocName").disabled=false;
			document.getElementById("facilityempty").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			
			document.getElementById("facility1").style.display = '';
			document.getElementById("security2").style.display = 'none';
			document.getElementById("cam3").style.display = 'none';
			document.getElementById("statement4").style.display = 'none';
			document.getElementById("typeidhide").style.display = 'none';
			document.getElementById("others5").style.display = 'none';
			}
		   else if(docTypeValue === securityImg){
			    document.getElementById("facilityDocName").value='';
				document.getElementById("othersDocsName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=false;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = '';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
			}
		   else if(docTypeValue === camImg){
			    document.getElementById("facilityDocName").value='';
				document.getElementById("othersDocsName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("securityDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=false;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = '';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
			}
		   else if(docTypeValue === statementImg){
			    document.getElementById("facilityDocName").value='';
				document.getElementById("othersDocsName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=false;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = '';
				document.getElementById("others5").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
				
			}else if(docTypeValue === otherImg){
				document.getElementById("facilityDocName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=false;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
				document.getElementById("others5").style.display = '';
				
			}else if(docTypeValue === exchOfInfoImg){
				document.getElementById("facilityDocName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';
				document.getElementById("othersDocsName").value='';
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				document.getElementById("bank").disabled=false;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
				document.getElementById("others5").style.display = 'none';
				
			}else{
				document.getElementById("facilityDocName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';  
				document.getElementById("othersDocsName").value='';  
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
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
			document.getElementById("securityDocName").value='';
			document.getElementById("othersDocsName").value='';
			document.getElementById("statementDocName").value='';
			document.getElementById("camDocName").value='';   
			
			document.getElementById("facilityDocName").disabled=false;
			document.getElementById("facilityempty").disabled=true;
			document.getElementById("securityDocName").disabled=true;
			document.getElementById("othersDocsName").disabled=true;
			document.getElementById("statementDocName").disabled=true;
			document.getElementById("camDocName").disabled=true;
			
			document.getElementById("facility1").style.display = '';
			document.getElementById("security2").style.display = 'none';
			document.getElementById("cam3").style.display = 'none';
			document.getElementById("statement4").style.display = 'none';
			document.getElementById("typeidhide").style.display = 'none';
			document.getElementById("others5").style.display = 'none';
			}
		   else if(docTypeValue === securityImg){
			    document.getElementById("facilityDocName").value='';
				document.getElementById("othersDocsName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=false;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = '';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
			}
		   else if(docTypeValue === camImg){
			    document.getElementById("facilityDocName").value='';
				document.getElementById("othersDocsName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("securityDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=false;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = '';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
			}
		   else if(docTypeValue === statementImg){
			    document.getElementById("facilityDocName").value='';
				document.getElementById("othersDocsName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=false;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = '';
				document.getElementById("typeidhide").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
				
			}else if(docTypeValue === otherImg){
				document.getElementById("facilityDocName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';   
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=true;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=false;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = 'none';
				document.getElementById("others5").style.display = '';
				
			}else if(docTypeValue === exchOfInfoImg){
				document.getElementById("facilityDocName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';
				document.getElementById("othersDocsName").value='';
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				document.getElementById("bank").disabled=false;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
				document.getElementById("others5").style.display = 'none';
				
			}else{
				document.getElementById("facilityDocName").value='';
				document.getElementById("statementDocName").value='';
				document.getElementById("camDocName").value='';
				document.getElementById("securityDocName").value='';  
				document.getElementById("othersDocsName").value='';  
				
				document.getElementById("facilityDocName").disabled=true;
				document.getElementById("facilityempty").disabled=false;
				document.getElementById("securityDocName").disabled=true;
				document.getElementById("othersDocsName").disabled=true;
				document.getElementById("statementDocName").disabled=true;
				document.getElementById("camDocName").disabled=true;
				
				document.getElementById("facility1").style.display = 'none';
				document.getElementById("security2").style.display = 'none';
				document.getElementById("cam3").style.display = 'none';
				document.getElementById("statement4").style.display = 'none';
				document.getElementById("others5").style.display = 'none';
				document.getElementById("typeidhide").style.display = '';
			}
			
	   
}


//Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II
</script>
</head>
<body>
<table width="100%">
	<tr>
		<td width="50%" height="100%" valign="top"><html:form
			action="/ImageTagMap">
			<html:hidden property="startIndex" />
			
			<html:hidden name="event" property="event" value="save_image_tag" />
			<input type="hidden" name="custLimitProfileID"
				value="<%=custLimitProfileID%>" />

			<html:hidden name="ImageTagMapForm" property="imgId" />
			
			<html:hidden name="ImageTagMapForm" property="id" />
			<html:hidden name="ImageTagMapForm" property="custId"
				value="<%=custId%>" />
			<input type="hidden" name="customerName" value="<%=customerName%>">
			<input type="hidden" name="dmsImagePath" />
			<input type="hidden" name="imageName"/>

			 <br> <br>
			<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblInfo">
				<tr class="even">
					<%-- <td class="fieldname" width="33%">Category</td>
					<td width="33%"><html:select property="category" styleId="typeDoc"
						name="ImageTagMapForm"
						onchange="javascript:refreshSubfolders(this);javascript:populateBank(this);javascript:refreshVisibilityOfFields(this);">
						<integro:common-code categoryCode="IMG_UPLOAD_CATEGORY"
							descWithCode="false" />
					</html:select>&nbsp;</td> --%>
					
					<td class="fieldname" width="33%">Type Of Document</td>
					<td width="30%"><html:select property="category" styleId="typeDoc" onchange="javascript:refreshSubfolders(this);javascript:populateBank(this);javascript:refreshVisibilityOfFields(this);">
                      <html:option value="">Please Select</html:option> 
                        <html:options name="typeOfDocList" labelName="typeOfDocList"></html:options> 
                      </html:select> &nbsp; <br>
			<html:errors property="typeOfDocumentError" />
			</td> 
					
					
					
					<td align="center" valign="middle"  width="33%" class="fieldname" rowspan="4" >&nbsp;
<!--    	<input type="button" name="Go" value="Go" class="btnNormal"   onclick="showListing()"/>-->
    	<a href="#" style="background-color: #ABC6DE; border: 1px solid #002439; padding: 2px; outline-color: black; color: black " shape="rect"  onclick="showListing()">GO</a>
    	</td>
				</tr>
				<tr class="odd">
					<td class="fieldname" width="33%">Subfolder Name</td>
					<td width="33%"><html:select property="subfolderName"
						name="ImageTagMapForm"
						onchange="javascript:refreshDocumentName(this)">
						<option value="">Please Select</option>
						<html:options collection="subfolderNameList" property="value"
							labelProperty="label" />
					</html:select>&nbsp;</td>
				</tr>
				<tr class="even">
					<td class="fieldname" width="33%">Document Name(Migrated)</td>
					<td width="33%"><html:select property="documentName"
						name="ImageTagMapForm">
						<option value="">Please Select</option>
						<html:options collection="docNameList" property="value"
							labelProperty="label" />
					</html:select>&nbsp;</td>

				</tr>
				<!--  Added by Uma Khot: start: Phase 3 CR:tag scanned images of Annexure II  -->
				<tr>
				<td class="fieldname" width="33%">Bank Name<font color="RED">*</font></td>
					<td width="33%">
					
                      
                      <html:select property="bank"
						name="ImageTagMapForm" disabled="true" styleId="bank">
						<html:option value="">Please Select</html:option>
						<html:options collection="bankList" property="value"
							labelProperty="label" />
					   </html:select>
                      
                      
                      <%//} %>&nbsp;</td>
				</tr>
				
				<%-- <tr class="even">
					<td class="fieldname" width="33%">Document Name</td>
					<td width="33%"><html:select property="facilityDocName"
						name="ImageTagMapForm">
						<option value="">Please Select</option>
						<html:options collection="facilityDocTagModuleList" property="value"
							labelProperty="label" />
					</html:select>&nbsp;</td>

				</tr> --%>
				
				 <tr class="even" id = "facility1">
                    <td class="fieldname" width="20%">Document Name</td>
                    <td width="30%">
          		 <html:select property="facilityDocName" styleId="facilityDocName"  style='width: 200px;' >
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="facilityDocTagModuleList" ></html:options> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
                      
                       <tr class="even" id = "security2">
                    <td class="fieldname" width="20%">Document Name</td>
                    <td width="30%">
          		 <html:select property="securityDocName" styleId="securityDocName"  style='width: 200px;' >
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="securityDocTagModuleList" ></html:options> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
                      
                      <tr class="even" id = "others5">
                    <td class="fieldname" width="20%">Document Name</td>
                    <td width="30%">
          		 <html:select property="othersDocsName" styleId="othersDocsName"  style='width: 200px;' >
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="otherMasterDocList" ></html:options> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
                      <tr class="even" id = "statement4">
                    <td class="fieldname" width="20%">Document Name</td>
                    <td width="30%">
          		 <html:select property="statementDocName" styleId="statementDocName"  style='width: 200px;' >
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="statementDocList" ></html:options> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
                      
                      <tr class="even" id = "cam3">
                    <td class="fieldname" width="20%">Document Name</td>
                    <td width="30%">
          		 <html:select property="camDocName" styleId="camDocName"  style='width: 200px;' >
                     	<html:option value="">Please Select</html:option> 
                        <html:options name="camDocList" ></html:options> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
                      
                       <tr class="even" id = "typeidhide">
                    <td class="fieldname" width="20%">Document Name</td>
                    <td width="30%">
          		 <html:select property="camDocName" styleId="facilityempty" style='width: 200px;'>
                     	<html:option value="">Please Select</html:option> 
                      </html:select> 
                      &nbsp; 
                      </td>
                      </tr>
				<!-- Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II  -->
			</table>
			<%if(category!=null && ! "".equals(category)) {%>
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
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
						<td colspan="3" valign="top" style="height: 100%; width: 100%;">

						<table width="95%" class="tblFormSection" border="0"
							align="center" cellpadding="0" cellspacing="0"
							style="margin-bottom: 15px">
							<thead>
								<tr>
									<td>
									<h3>Image Details : Tag</h3>

									<!--<a href="#" onclick = "viewImage()" 
														onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/view2.gif',1)" >
		                                                <img src="img/view1.gif" name="Image3311" border="0" id="Image3311" align="right" />
	                                                   </a> 
														-->
														<a href="#" onclick="downloadImageZip()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
									<img src="img/download.jpg" name="Image3316" border="0"
										id="Image3316" align="right" /> </a>
														
														<a href="#" onclick="printPage()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3311','','img/print2.gif',1)">
									<img src="img/print1.gif" name="Image3311" border="0"
										id="Image3311" align="right" /> </a></td>
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
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="tblInfo">
										<thead>
											<tr>
												<td width="5%">S/N</td>
												<td width="20%" nowrap="nowrap">FileName</td>
												<td width="10%">Category</td>
												<td width="10%">Sub Folder</td>
												<td width="10%">Document Name(Migrated)</td>
												<td width="15%">Document Name</td>
												<td width="10%">Other Document Name</td>
												<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->
												<td width="10%">Bank Name</td>
											    <!--Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II -->
												<!-- code start:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document -->
												<td width="5%">Is Tagged</td>
												<!-- code end:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document -->
<!--												<td width="20%">-->
<!--																			Download-->
<!--																		</td>-->
												<td width="5%">Select <%	if (list1 != null && list1.size()>0) { %>
												<input type="checkbox" name="list11" id="list11"
													value="Check All" onClick="checkedAllImages()" /> <%} %>
												</td>
											</tr>
										</thead>
										<tbody>
											<%int counter1 = 0; %>
											<logic:greaterThan name="resultList" value="0">
												<logic:iterate id="obImageUploadAdd" name="resultList"
													type="com.integrosys.cms.app.image.bus.OBImageUploadAdd"
													scope="page" length="10"
													offset="<%=String.valueOf(startIndex) %>">


													<%
																		

																		
																					counter1++;
																					if (counter1 % 2 != 0) {
																						rowClass = "odd";
																					} else {
																						rowClass = "even";
																					}
																	%>
													<tr class=<%=rowClass%>>
														<td class="index" width="5%"><%=counter1+startIndex%></td>
														<%
																			String subs = obImageUploadAdd.getImgFileName();
																						//subs = subs.substring();
																		%>

														<td width="20%">&nbsp;
															<%if(obImageUploadAdd.getStatus()==3){ %>		
														 <a href="#"
															onclick="getImageGallary('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=(counter1-1)+startIndex%>')"><%=obImageUploadAdd.getImgFileName()%>
														</a>
														<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>
														
														</td>
														<td width="10%">&nbsp; <integro:common-code-single
															entryCode="<%=obImageUploadAdd.getCategory()%>"
															categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY %>"
															display="true" descWithCode="false" /></td>
														<td width="10%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getSubfolderName()%>" /></td>
														<td width="10%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getDocumentName()%>" /></td>
															
														<% if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){%>
														<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getFacilityDocName()%>" /></td>
															
														<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>	
															<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getSecurityDocName()%>" /></td>
														<%} else if("CAM".equals(obImageUploadAdd.getTypeOfDocument())){ %>	
															<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getCamDocName()%>" /></td>
														<%} else if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>	
															<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getStatementDocName()%>" /></td>
														<%} else if("Other".equals(obImageUploadAdd.getTypeOfDocument())){ %>	
															<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getOthersDocsName()%>" /></td>
														<%} else { %>	
															<td width="15%">&nbsp; <integro:empty-if-null
															value="" /></td>
														<%} %>
															
														<% if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){%>
														<td width="10%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getOtherDocName()%>" /></td>
															
														<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>	
														<td width="10%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getOtherSecDocName()%>" /></td>
															
														<%}else{%>
														<td width="10%">&nbsp; <integro:empty-if-null
															value="" /></td>
														<%} %>
														
															<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->
															<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getBank()%>" /></td>
															<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->
														<% 
														// code start:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
														if(null!=taggedImageIdSet){
														//	DefaultLogger.debug(this,"Inside if(null!=taggedImageIdSet)");
														//	DefaultLogger.debug(this,"obImageUploadAdd.getImgId():"+obImageUploadAdd.getImgId());
														//	DefaultLogger.debug(this,"taggedImageIdSet.contains(String.valueOf(obImageUploadAdd.getImgId())):"+taggedImageIdSet.contains(String.valueOf(obImageUploadAdd.getImgId())));
														  if(taggedImageIdSet.contains(String.valueOf(obImageUploadAdd.getImgId()))){
														//	  DefaultLogger.debug(this,"if(taggedImageIdSet.contains(obImageUploadAdd.getImgId()))");%>	
														<td width="5%">&nbsp; Tagged</td>	
													    <% }else{ %>
													    <td width="5%">&nbsp; UnTagged</td>	
													    <% }} else{%>
													    <td width="5%">&nbsp; UnTagged</td>
													    <% }
													    // code end:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
													     %>	
													<%--		<td width="20%">
																			&nbsp;
																			
																			
																			
<a href="#"
onclick="downloadImage('<%=obImageUploadAdd.getImageFilePath()%>','<%=obImageUploadAdd.getImgFileName()%>','<%=obImageUploadAdd.getStatus()%>')">Download
</a>

																			
																			
																		</td>  --%>
														<td width="5%">&nbsp; <%if(selectedArrayMap.containsKey(String.valueOf(obImageUploadAdd.getImgId()))){ %>
														<input type="checkbox" id="selected" name="selected"
															value="<%=(counter1)+startIndex%>"
															onClick="toggleSelectAll()" checked="checked" /> <%}else{ %>

														<input type="checkbox" id="selected" name="selected"
															value="<%=(counter1)+startIndex%>"
															onClick="toggleSelectAll()" /> <%} %>
														</td>
													</tr>
												</logic:iterate>
											</logic:greaterThan>

											<logic:equal name="list1" value="0">
												<tr class="even">
													<td colspan="8">No Record Found</td>
												</tr>
											</logic:equal>
										</tbody>

									</table>
									</td>
									<td></td>

								</tr>
								<html:hidden property="selectedArray" />
								<html:hidden property="unCheckArray" />
								<% if(searchResult != null && searchResult.getNItems() != 0) {%>
								<tr> 
									<td height="25">
									<table id="generalPurposeBar" width="100%" border="0"
										cellspacing="0" cellpadding="5" align="center">
										<tr class="even">
											<%
											String url="ImageTagMap.do?event=paginate&custLimitProfileID="+custLimitProfileID+"&legalName="+custId+"&category="+category+"&custId="+custId+"&customerName="+customerName+"&startIndex=";
				         %><td valign="middle" ><integro:pageindex
												pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
												url="<%=url %>" submitFlag="true" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<%} %>
							</tbody>
						</table>
						</td>
					</tr>
					<%
if (list1 != null && list1.size()>0) {
%>
					<tr>

						<td colspan="2">
						<table width="95%" border="0" cellspacing="0" cellpadding="0"
							class="tblInfo" align="center">
							<thead>
								<tr>
									<td colspan="4">Customer Details</td>
								</tr>
							</thead>
							<tbody>
								<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
									<td class="fieldname" width="25%"><bean:message
										key="label.list.party.name" /></td>
									<td width="25%"><integro:empty-if-null
										value="<%=customerName%>" />&nbsp;</td>
									<td class="fieldname" width="25%"><bean:message
										key="label.list.party.id" /></td>
									<td width="25%"><integro:empty-if-null value="<%=custId%>" />&nbsp;</td>
								</tr>
								<tr class="odd">
									<td width="25%" class="fieldname">Document Type</td>
									<td width="25%" class="even" colspan="4"><html:select
										property="docType" 
										onchange="javascript:refreshDropwdowns(this)">
										<integro:common-code categoryCode="DOC_TYPE"
											descWithCode="false" excludeList="<%= excludeList  %>"/>
									</html:select>&nbsp;<html:errors property="docTypeError" /></td>
								
								</tr>

								<tr class="odd">
									<td colspan="4">
									<table width="100%" id="facilityFields" border="0"
										cellspacing="0" cellpadding="0" class="tblInfo"
										<%if(!IImageTagConstants.FACILITY_DOC.equals(docTye)){%>
										style="display: none;" <%} %>>
										<tr>
											<td colspan="4"><br>
											</td>
										</tr>
										<tr class="odd">
											<td width="30%" class="fieldname">Facility Name</td>
											<td colspan="3" width="70%"><html:select 
												name="ImageTagMapForm" property="facilityId"
												onchange="javascript:refreshDocumentChecklist(this)">
												<option value="">Please Select</option>
												<html:options collection="facilityIdList" property="value"
													labelProperty="label" />
											</html:select>&nbsp;<html:errors property="facilityIdError" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr class="odd">
									<td colspan="4">
									<table width="100%" id="collateralFields" border="0"
										cellspacing="0" cellpadding="0" class="tblInfo" align="center"
										<%
										System.out.println("$$$$$$$$$$$$$$$$$$$$$docTye $$$$$$$$$$$$$$$ :"+docTye);
										if(!IImageTagConstants.SECURITY_DOC.equals(docTye)){%>
										style="display: none;" <%} %>>

										<tr>
											<td colspan="4"><br>
											</td>
										</tr>
										<tr class="odd">
											<td width="25%" class="fieldname">Collateral Type</td>
											<td width="25%" class=""><html:select 
												name="ImageTagMapForm" property="secType"
												onchange="javascript:refreshSubtype(this)">
												<option value="">Please Select</option>
												<html:options collection="secTypeList" property="value"
													labelProperty="label" />
											</html:select>&nbsp;<html:errors property="secTypeError" /></td>

											<td width="25%" class="fieldname">Collateral subType</td>
											<td width="25%"><html:select name="ImageTagMapForm" 
												property="secSubtype"
												onchange="javascript:refreshSecurityId(this)">
												<option value="">Please Select</option>
												<html:options collection="secSubtypeList" property="value"
													labelProperty="label" />
											</html:select>&nbsp;<html:errors property="secSubtypeError" /></td>
										</tr>

										<tr class="even">
											<td width="25%" class="fieldname">Security ID</td>
											<td class="even" colspan="3"><html:select
												name="ImageTagMapForm" property="securityId"
												onchange="javascript:refreshDocumentChecklist(this)">
												<option value="">Please Select</option>
												<html:options collection="securityIdList" property="value" 
													labelProperty="label" />
											</html:select>&nbsp;<html:errors property="securityIdError" /></td>
										</tr>
									</table>
									</td>
								</tr>

								<tr class="odd">
									<td colspan="4">
									<table width="100%" id="docDescFields" border="0"
										cellspacing="0" cellpadding="0" class="tblInfo"
										<% if("".equals(docTye)){%> style="display: none;" <%} %>>
										<tr>
											<td colspan="4">
											</td>
										</tr>
										<tr class="odd">
											<td width="30%" class="fieldname">Document Description</td>
											<td colspan="3" width="70%"><html:select 
												name="ImageTagMapForm" property="docDesc"  onchange="javascript:showStat(this)" >
												<option value="">Please Select</option>
												<html:options collection="documentItemList" property="value"
													labelProperty="label" />
											</html:select>&nbsp;<html:errors property="docDescError" /></td>
										</tr>
										
										
										
										
											
										<tr class="odd">
                <td colspan="4">
					<table id="stat" width="100%"  class="tblInfo" <% if(IImageTagConstants.CAM_NOTE.equals(docTye)){%>
										style="display: none;" <%} %>>
							
							
			<tr class="even">
			    <td class="fieldname">
			     	Status
				</td>
				<td>
				<html:text name="ImageTagMapForm" property="docStatus" readonly="true" styleId="docStatus" />
							&nbsp;
			      </td>
			       <td class="fieldname">
			     	Document Date
				</td>
				<td>
				<html:text name="ImageTagMapForm" property="docDate" readonly="true" styleId="docDate" />
							&nbsp;
			      </td>
			      
			</tr>		
			<tr class="even">
			    <td class="fieldname">
							Received Date
				</td>
				<td>
				<html:text name="ImageTagMapForm" property="receivedDate" readonly="true" styleId="receivedDate"/>
							&nbsp;
			                
			      </td>
			       <td class="fieldname">
							Document Amount
				</td>
				<td >
				<html:text name="ImageTagMapForm" property="docAmt" readonly="true" styleId="docAmt"/>
							&nbsp;
			                
			      </td>
			</tr>		
			</table>
			</td>
			</tr>
			
			 
		</table>
									</td>
								</tr>
								<tr class="odd">
								<td colspan="4">
								<table width="100%" id="camFields" border="0"
										cellspacing="0" cellpadding="0" class="tblInfo" align="center" <% if(!IImageTagConstants.CAM_NOTE.equals(docTye)){%>
										style="display: none;" <%} %>>
								<tr>
											<td colspan="4"><br>
											</td>
										</tr>
										<tr class="odd">
											<td width="25%" class="fieldname">CAM Type</td>
											<td width="25%">
											
											<html:text name="ImageTagMapForm" property="camType" readonly="true" styleId="camType"/>
							
											
							&nbsp;
											
											</td>

											<td width="25%" class="fieldname">CAM Date</td>
											<td width="25%">
											<html:text name="ImageTagMapForm" property="camDate" readonly="true" styleId="camDate"/>
							&nbsp;
											
											</td>
										</tr>

										<tr class="even">
											<td width="25%" class="fieldname">CAM Expiry Date</td>
											<td class="even" colspan="3">
											<html:text name="ImageTagMapForm" property="expiryDate" readonly="true" styleId="expiryDate"/>
							&nbsp;
											
											</td>
										</tr>
								</table>
								</td>
								</tr>
								<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
								<tr class="odd">
								<td colspan="4">
								<table width="100%" id="docFields" border="0"
										cellspacing="0" cellpadding="0" class="tblInfo" align="center" <% if(!IImageTagConstants.CAM_NOTE.equals(docTye)){%>
										style="display: none;" <%} %>>
								<tr>
											<td colspan="4"><br>
											</td>
										</tr>
										<tr class="odd">
											<td width="25%" class="fieldname">CAM Type</td>
											<td width="25%">
											
											<html:text name="ImageTagMapForm" property="camType" readonly="true" styleId="camType"/>
							
											
							&nbsp;
											
											</td>

											<td width="25%" class="fieldname">CAM Date</td>
											<td width="25%">
											<html:text name="ImageTagMapForm" property="camDate" readonly="true" styleId="camDate"/>
							&nbsp;
											
											</td>
										</tr>

										<tr class="even">
											<td width="25%" class="fieldname">CAM Expiry Date</td>
											<td class="even" colspan="3">
											<html:text name="ImageTagMapForm" property="expiryDate" readonly="true" styleId="expiryDate"/>
							&nbsp;
											
											</td>
										</tr>
								</table>
								</td>
								</tr>
								<!--Added by Uma Khot:End: Phase 3 CR:tag scanned images of Annexure II-->
								
							</tbody>

						</table>
						</td>

					</tr>
					<%} %>
				</tbody>
			</table>
			<p align="center">
			<%
if (custLimitProfileID != null&& !"0".equals(custLimitProfileID)) {
	if (list1 != null && list1.size()>0) { %> <a
				href="javascript:submitPage();" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
			<img src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
			</a> <%}
}%> <a href="javascript:closePage();" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"> <img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /> </a></p>
			<%}else{ %> <input type="hidden" name="selected" />
			<p align="center"><a href="javascript:closePage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"> <img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /> </a></p>

			<%} %>
			
		</html:form></td>

	</tr>
</table>
</body>
</html>



