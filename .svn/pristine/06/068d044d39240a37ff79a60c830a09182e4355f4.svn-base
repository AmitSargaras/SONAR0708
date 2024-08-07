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
session.setAttribute("searchResult",searchResult);
List tagDetailList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.tagDetailList");
String sessioncamType = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.camType");
String sessioncamDate= (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.camDate");
String sessioncamNumber = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.camNumber");



//System.out.println("searchResult:::::::::::"+searchResult.getNItems());
int counter = 0;
int noofItems = 0;
int index = 0;
int sno = 0;
int startInd = 0;
String event = request.getParameter("event");
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
else{
	
		resultList =  tagDetailList;
		
		pageContext.setAttribute("resultList", tagDetailList);
	
}
	ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
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
	String index1 = request.getParameter("index");
	String imagePath = request.getParameter("imagePath");
	String documentID = request.getParameter("documentID");
	String documentVersion = request.getParameter("documentVersion");
	String documentType = request.getParameter("documentType");
	String category = request.getParameter("category");
	//category = "IMG_CATEGORY_CAM";

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
%>


<head>
    <title>Customer Details</title>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />

     <script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/ajaxGetImage.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<style type="text/css">
a:link {text-decoration: none;} //the original link with no underline
a:visited {text-decoration: none;} //the visited link with no underline
a:hover {text-decoration: underline;} //mouseover link and an underline appears
</style>


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
	if('<%=event%>'== 'retrieveImageGallaryCAMNote')
	{
		 document.forms[0].action="MIAADetail.do?event=view_cam_image&camType=<%=sessioncamType %>&camNumber=<%=sessioncamNumber %>&camDate=<%=sessioncamDate%>&category="+catg;
		   document.forms[0].event.value="view_cam_image";
		  
		    document.forms[0].submit();
	}
	else if('<%=event%>'== 'retrieveMigImageGallaryCAMDoc')
	{
		 document.forms[0].action="MIAADetail.do?event=view_mig_image_page&category="+catg;
		   document.forms[0].event.value="view_mig_image_page";
		  
		    document.forms[0].submit();
	}
	
}

function getImageGallary1(imagePath,imageName,status,count,categ) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
    //alert("getImageGallary1");
   // alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+categ);
	//alert("count is "+count);
	if(count<0){
	   alert("This is first Image.");
		}else if(count==<%=resultList.size()%>){
			alert("This is last Image.")
		}else{
			if('<%=event%>' == 'retrieveImageGallaryCAMNote'){
			 document.forms[0].action="MIAADetail.do?event=retrieveImageGallaryCAMNote&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
				document.forms[0].submit();
			}
			else if('<%=event%>' == 'retrieveMigImageGallaryCAMDoc'){
				 document.forms[0].action="MIAADetail.do?event=retrieveMigImageGallaryCAMDoc&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+categ;
					document.forms[0].submit();
				}
			
		}

}



</script>
</head>
<body> 
<div id="loadData" style='display:none;'>
         <% 
        
           String count = String.valueOf(request.getAttribute("count")) ;
          %>
    </div>
<table width="100%" >
<tr>
<td>
<%
	String[] strArray =  new String[6];
	String cnt = request.getParameter("count");
	if(cnt != null){
	OBImageUploadAdd obj = new OBImageUploadAdd();

		if(Integer.parseInt(cnt)!=(tagDetailList.size())){
		obj = (OBImageUploadAdd) tagDetailList.get(Integer.parseInt(request.getParameter("count")));
		}else{
			obj = (OBImageUploadAdd) tagDetailList.get((Integer.parseInt(request.getParameter("count")))-1);
		}
	
	
	
	if(obj != null){
		if(null!=event && event.equals("retrieveMigImageGallaryCAMDoc")){
	%>
	<b style="font-size: x-small">Image Name :</b>&nbsp;<font size="2"><%=strArray[4] %></font> </td>&nbsp;&nbsp;&nbsp;&nbsp;
	<td> <b style="font-size: x-small">Category:</b>&nbsp;
		<font size="2"><integro:common-code
												categoryCode="IMG_UPLOAD_CATEGORY"
												entryCode="<%=strArray[0]%>"
												descWithCode="false"  display="true"/></font></td>
				<td><b style="font-size: x-small">Document Name:</b>&nbsp;<font size="2"><integro:empty-if-null value="<%=obj.getDocumentName() %>"/></font>
	
	
	<%}else{ %>
		<b style="font-size: x-small">Image Name :</b>&nbsp;<font size="2"><%=obj.getImgFileName() %></font></td> &nbsp;&nbsp;&nbsp;&nbsp; 
		<td><b style="font-size: x-small">Category:</b>&nbsp;
		<font size="2"><integro:common-code
												categoryCode="IMG_UPLOAD_CATEGORY"
												entryCode="<%=obj.getCategory()%>"
												descWithCode="false"  display="true"/></font></td>
		<td><b style="font-size: x-small">Document Name:</b>&nbsp;<font size="2"><integro:empty-if-null value="<%=obj.getDocumentName() %>"/></font>
													<%} }}%>
													 
</td>
</tr>
<tr>
<td>
<html:form action="/MIAADetail">
<html:hidden property="startIndex" />
<input type="hidden" name="custLimitProfileID" value="<%=custLimitProfileID%>" />
<input type="hidden" name="event" value="<%=event %>"/>
<input type="hidden" name="index" value="<%=index1 %>"/>
<input type="hidden" name="customerName" value="<%=customerName%>">

<input type="hidden" name="documentID" value="<%=documentID %>"/>
<input type="hidden" name="documentType" value="<%=documentType %>"/>
<input type="hidden" name="documentVersion" value="<%=documentVersion%>">


<input type="hidden" name="dmsImagePath"/>
</html:form>

  <b style="font-size: x-small">Page : </b><font size="2"><%=Integer.parseInt(request.getParameter("count"))+1%>/<%=resultList.size()%></font></td>

<!--<a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/prev2.gif',1)">
	<img src="img/prev1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a>&nbsp;
		-->
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

<a href="javascript:getImageGallary1('<%=request.getParameter("pID").trim()%>','<%=request.getParameter("imageName").trim()%>','<%=request.getParameter("status")%>','<%=tagDetailList.size()-1%>','<%=request.getParameter("category")%>');" >
	<img src="img/last.jpg"  width="30" height="17" border="0"  align="middle"/>
</a>

&nbsp;&nbsp;&nbsp;
		<a href="javascript:showListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)">
	<img src="img/return1.gif" name="Image2" width="70" height="20" border="0" id="Image2" align="middle"/>
</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<!--<a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/next2.gif',1)">
	<img src="img/next1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a><br>
	
-->
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



