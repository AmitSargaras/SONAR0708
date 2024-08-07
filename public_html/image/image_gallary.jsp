<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="com.integrosys.cms.ui.image.ImageUploadAddForm"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

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
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
   

<%
	String context = request.getContextPath() + "/";
%>

<%


SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.searchResult");
HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.selectedArrayMap");
session.setAttribute("searchResult",searchResult);
//List tageedImageList = (List) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.tageedImageList");
List obImageUploadAddList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.obImageUploadAddList");


 




if(selectedArrayMap ==null){
	selectedArrayMap =new HashMap();
}
System.out.println("selectedArrayMap size:"+selectedArrayMap.size());
System.out.println("selectedArrayMap size:"+selectedArrayMap.values());
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
	System.out.println("searchResult:::::::::::"+resultList.size());
	startInd = searchResult.getStartIndex();
	totalCount = searchResult.getNItems();
	System.out.println("1:::::::::::"+resultList.size());
	listSize = resultList.size();
	System.out.println("2:::::::::::"+resultList.size());
	pageContext.setAttribute("imageListSize", Integer.toString(listSize));
	System.out.println("3"+resultList.size());
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
	System.out.println("80:::::::::::"+resultList.size());
}
else{
	resultList =  obImageUploadAddList;
	System.out.println("80:::::::::::"+obImageUploadAddList.size());
	pageContext.setAttribute("resultList", obImageUploadAddList);
}
ImageUploadAddForm imageTagMapForm = (ImageUploadAddForm) request.getAttribute("imageUploadAddForm");
System.out.println("imageTagMapForm=>"+imageTagMapForm);
System.out.println("imageTagMapForm category=>"+imageTagMapForm.getCategory());
System.out.println("imageTagMapForm getSecurityDocName =>"+imageTagMapForm.getSecurityDocName());
System.out.println("imageTagMapForm Cam number=>"+imageTagMapForm.getHasCam());
String catg="";
String docTye="";
String custLimitProfileID=request.getParameter("custLimitProfileID");

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

	String imagePath = request.getParameter("imagePath");

	String category = request.getParameter("category");
	//category = "IMG_CATEGORY_CAM";
	String event = request.getParameter("event");
	request.setAttribute("event",event);
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
	System.out.println("1200:::::::::::");
	// System.out.println("value of records_per_page"+records_per_page);
	
%>


<head>
    <title>Customer Details</title>
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
var image_set = [{'caption': 'Flower', 'url': 'http://static.flickr.com/119/294309231_a3d2a339b9.jpg'},
                 {'caption': 'Nice waterfall', 'url': 'http://www.widerange.org/images/large/plitvicka.jpg'}];
</script>

<script language="JavaScript" type="text/JavaScript">

insertHeader();
insertMenu('examples');

function showListing() {
	var catg= '<%=category%>';
	if('<%=event%>'== 'retrieveUntagImageGallary')
	{
		 document.forms[0].action="ImageTagMap.do?event=prepare_untag_image_list&category="+catg;
		   document.forms[0].event.value="prepare_untag_image_list";
		  
		    document.forms[0].submit();
	}
	else if('<%=event%>'== 'retrieveViewImageGallary'||'<%=event%>' == 'retrieveViewIndividualImage'){
		 document.forms[0].action="ImageUploadAdd.do?event=view_uploaded_image_listing&category="+catg;
		   document.forms[0].event.value="view_uploaded_image_listing";
		  
		    document.forms[0].submit();
	}
	else{
	if(catg!=null  && catg!=""){
    document.forms[0].action="ImageTagMap.do?category="+catg;
    document.forms[0].event.value="list_tag_page";
    document.forms[0].submit();
	}else{
		alert("Please select category.")
	}
	}
}

function getImageGallary1(imagePath,imageName,status,count,categ) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
    //alert("get view ImageGallary1");
   // alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+categ);
	//alert("count is "+count);
	//alert("event is "+event);
	if(count<0){
	   alert("This is first Image.");
		}else if(count==<%=resultList.size()%>){
			alert("This is last Image.")
		}else{
			if('<%=event%>' == 'retrieveImageGallary'){
			 document.forms[0].action="ImageTagMap.do?event=retrieveImageGallary&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
				document.forms[0].submit();
			}
			else if ('<%=event%>' == 'retrieveViewImageGallary'){
				 document.forms[0].action="ImageUploadAdd.do?event=retrieveViewImageGallary&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
					document.forms[0].submit();
			}
			else{
				 document.forms[0].action="ImageTagMap.do?event=retrieveUntagImageGallary&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
					document.forms[0].submit();

			}
		}

}



</script>
</head>
<body> 
<div id="loadData" style='display:none;'>
         <% 
         System.out.println("273:::::::::::");
           String count = String.valueOf(request.getAttribute("count")) ;
           String imageName = String.valueOf(request.getAttribute("imageName")) ;
          %>
    </div>
<table width="100%" >
<tr>
<td>
<%
		String cnt = request.getParameter("count");
		if(cnt != null){
		OBImageUploadAdd obj = new OBImageUploadAdd();
		
		if(Integer.parseInt(cnt)!=(obImageUploadAddList.size())){
            obj  = (OBImageUploadAdd) obImageUploadAddList.get(Integer.parseInt(request.getParameter("count")));
		}else{
			obj  = (OBImageUploadAdd) obImageUploadAddList.get((Integer.parseInt(request.getParameter("count")))-1);
		}
		if(obj != null){
			
			String documentName = "";
			if("Facility".equals(obj.getTypeOfDocument())){ 
				
				if(obj.getFacilityDocName() != null && !"".equals(obj.getFacilityDocName())){
					documentName = obj.getFacilityDocName();
				}else{
					documentName = obj.getDocumentName();
				}
				
			}else if("Security".equals(obj.getTypeOfDocument())){ 
				if(obj.getSecurityDocName() != null && !"".equals(obj.getSecurityDocName())){
					documentName = 	obj.getSecurityDocName();
				}else{
					documentName = obj.getDocumentName();
				}
				
			}else if("CAM".equals(obj.getTypeOfDocument())){ 
				
				if(obj.getCamDocName() != null && !"".equals(obj.getCamDocName())){
					documentName = 	obj.getCamDocName();
				}else{
					documentName = obj.getDocumentName();
				}
				
			}else if("Statement".equals(obj.getTypeOfDocument())){ 
				if(obj.getStatementDocName() != null && !"".equals(obj.getStatementDocName())){
					documentName = obj.getStatementDocName() ;
				}else{
					documentName = obj.getDocumentName() ;
				}
			}
			else if("Other".equals(obj.getTypeOfDocument())){ 
				if(obj.getOthersDocsName() != null && !"".equals(obj.getOthersDocsName())){
					documentName = obj.getOthersDocsName() ;
				}else{
					documentName = obj.getDocumentName() ;
				}	
			}else{
				documentName = obj.getDocumentName() ;
			}
			
		%>
		<b style="font-size: x-small">Image Name :</b>&nbsp;<font size="2"><%=obj.getImgFileName() %></font></td> &nbsp;&nbsp;&nbsp;&nbsp;
		<td> <b style="font-size: x-small">Category:</b>&nbsp;
		<font size="2"><integro:common-code
												categoryCode="IMG_UPLOAD_CATEGORY"
												entryCode="<%=obj.getCategory()%>"
												descWithCode="false"  display="true"/></font></td>
												<td>										
	<b  style="font-size: x-small">Document Name:</b>&nbsp;<font size="2"><integro:empty-if-null value="<%=documentName %>"/></font> 
												
												<%} }%>
</td>
</tr>
<tr>
<td>
<html:form action="/ImageUploadAdd">
<html:hidden property="startIndex" />
<html:hidden name="event" property="event" value="<%=event%>"/>
<html:hidden name="imageUploadAddForm" property="category" value = "<%=imageTagMapForm.getCategory()%>"/>
<html:hidden name="imageUploadAddForm" property="subfolderName" value = "<%=imageTagMapForm.getSubfolderName()%>"/>
<html:hidden name="imageUploadAddForm" property="documentName" value = "<%=imageTagMapForm.getDocumentName()%>"/>
<html:hidden name="imageUploadAddForm" property="custName" value="<%=customerName%>"/>
<html:hidden name="imageUploadAddForm" property="custId" value="<%=legalName%>"/>
<input type="hidden" name="customerName" value="<%=customerName%>">
<input type="hidden" name="legalName" value="<%=legalName%>">
<html:hidden name="imageUploadAddForm" property="hasCam" value="<%=imageTagMapForm.getHasCam()%>"/>
<html:hidden name="imageUploadAddForm" property="statementTyped" value="<%=imageTagMapForm.getStatementTyped()%>"/>
<html:hidden name="imageUploadAddForm" property="securityNameId" value="<%=imageTagMapForm.getSecurityNameId()%>"/>
<html:hidden name="imageUploadAddForm" property="facilityName" value="<%=imageTagMapForm.getFacilityName()%>"/>
<html:hidden name="imageUploadAddForm" property="bank" value="<%=imageTagMapForm.getBank()%>"/>

<input type="hidden" name="dmsImagePath"/>
</html:form>
<!--<a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/prev2.gif',1)">
	<img src="img/prev1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a>&nbsp;
		-->
		
			<b style="font-size: x-small">Page : </b><font size="2"><%=Integer.parseInt(request.getParameter("count"))+1%>/<%=resultList.size()%></font>
	</td>
	<td colspan="2" align="left">
	
		<a href="javascript:getImageGallary1('<%=request.getParameter("pID").trim()%>','<%=request.getParameter("imageName").trim()%>','<%=request.getParameter("status")%>','<%=0%>','<%=request.getParameter("category")%>');" onmouseout="MM_swapImgRestore()" >
	<img src="img/first.jpg"  width="30" height="17" border="0"  align="middle"/>
</a>
		
		<a href="javascript:getImageGallary1('<%=request.getParameter("pID").trim()%>','<%=request.getParameter("imageName").trim()%>','<%=request.getParameter("status")%>','<%=Integer.parseInt(request.getParameter("count"))-1%>','<%=request.getParameter("category")%>');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/prev2.gif',1)">
	<img src="img/prev1.gif" name="Image2" width="90" height="20" border="0" id="Image2" align="middle"/>
</a>
<a href="javascript:getImageGallary1('<%=request.getParameter("pID").trim()%>','<%=request.getParameter("imageName").trim()%>','<%=request.getParameter("status")%>','<%=Integer.parseInt(request.getParameter("count"))+1%>','<%=request.getParameter("category")%>');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/next2.gif',1)">
	<img src="img/next1.gif" name="Image2" width="70" height="20" border="0" id="Image2" align="middle"/>
</a>

<a href="javascript:getImageGallary1('<%=request.getParameter("pID").trim()%>','<%=request.getParameter("imageName").trim()%>','<%=request.getParameter("status")%>','<%=obImageUploadAddList.size()-1%>','<%=request.getParameter("category")%>');" >
	<img src="img/last.jpg"  width="30" height="17" border="0"  align="middle"/>
</a>
&nbsp;&nbsp;&nbsp;

		<a href="javascript:showListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)">
	<img src="img/return1.gif" name="Image2" width="70" height="20" border="0" id="Image2" align="middle"/>
</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

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

    getImageTest('<%=request.getParameter("pID").trim()%>','<%=request.getParameter("imageName").trim()%>','<%=request.getParameter("status")%>','<%=(request.getParameter("count"))%>','<%=request.getParameter("category")%>');
   
    //document.getElementById("imageFrame").src="/cms/ImageTagMap.do?event=retrieveIndividualImage&imageName="+""+"&status="+""+"&count="+7+"&pID="+"";

</script>


</body>

</html>



