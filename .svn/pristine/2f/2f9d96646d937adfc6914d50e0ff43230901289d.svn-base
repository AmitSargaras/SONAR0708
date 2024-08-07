<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%><html
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

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<%
	String context = request.getContextPath() + "/";
List list1 = null;


SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.searchResult");
HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.selectedArrayMap");
HashMap pdfPagesMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.pdfPagesMap");



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
	System.out.println("searchResult:::::::::::"+resultList.size());
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
String custLimitProfileID=request.getParameter("custLimitProfileID");
if(imageTagMapForm!=null){
	catg=imageTagMapForm.getCategory();
	docTye=imageTagMapForm.getDocType();
}
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
%>


<head>
<title><%=customerName%></title>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />
<!--<script>  
    window.onload = function() {
	    alert('Hi there!');  
    }  
 </script>-->
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/ajaxGetImage.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">

function PrintWindow()
{                     
   window.print();  
             
   CheckWindowState(); 
}

function CheckWindowState()
{            
    if(document.readyState=="complete")
    {
        window.close();  
    }
    else
    {            
        setTimeout("CheckWindowState()", 2000)
    }
}    


</script>


<script type="text/javascript" src="<%=context%>greybox/base/AJS.js"></script>
<script type="text/javascript" src="<%=context%>greybox/base/AJS_fx.js"></script>

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

<script type="text/javascript">
var image_set = [{'caption': 'Flower', 'url': 'http://static.flickr.com/119/294309231_a3d2a339b9.jpg'},
                 {'caption': 'Nice waterfall', 'url': 'http://www.widerange.org/images/large/plitvicka.jpg'}];
</script>


</head>
<body onload="javascript:PrintWindow();">
<html:form action="/ImageTagMap">
	<html:hidden name="ImageTagMapForm" property="custId"
		value="<%=custId%>" />
	<input type="hidden" name="customerName" value="<%=customerName%>">
	
		<logic:greaterThan name="resultList" value="0">
			<logic:iterate id="obImageUploadAdd" name="resultList"
				type="com.integrosys.cms.app.image.bus.OBImageUploadAdd">

         <%
         System.out.println("===========================2.0=================:"+PropertyManager.getValue("contextPath"));
     	String basePathName=PropertyManager.getValue("contextPath");
         System.out.println("===========================2.1=================:"+basePathName);
         System.out.println("===========================2.2=================:"+obImageUploadAdd.getImageFilePath());
		String pdfFilePath="dmsImages/downloads/"+obImageUploadAdd.getImageFilePath().replace(' ', '_');
         //System.out.println("basepath:"+basePathName);
         // System.out.println("pdfFilePath:"+pdfFilePath);
        // System.out.println("obImageUploadAdd.getImageFilePath():"+obImageUploadAdd.getImageFilePath());
         %>
				<%
				System.out.println("==================3==========================:"+selectedArrayMap.containsKey(String.valueOf(obImageUploadAdd.getImgId())));
				if(selectedArrayMap.containsKey(String.valueOf(obImageUploadAdd.getImgId()))){ 
					 System.out.println("pdfFilePath-------:"+pdfFilePath);
					if(pdfPagesMap.containsKey(String.valueOf(obImageUploadAdd.getImgId()))){
						//String sNoOFPages=(String)pdfPagesMap.get(String.valueOf(obImageUploadAdd.getImgId()));
						Integer pages=(Integer)pdfPagesMap.get(String.valueOf(obImageUploadAdd.getImgId()));
						int noOfPages = pages.intValue();
						for(int num=1 ; num<=noOfPages ; num++ ){
				%>
				
				<img src="<%=pdfFilePath+"_"+num+".jpeg" %>"  height="1000" width="750" />
				<%}}else{%>
			<img src="<%=pdfFilePath+".jpeg" %>"  height="1000" width="750" />
				
				<%}} %>
			</logic:iterate>
		</logic:greaterThan>
	
</html:form>

</body>
</html>



