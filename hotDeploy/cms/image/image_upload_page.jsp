<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
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
                 java.util.Iterator
                 "%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% String context = request.getContextPath() + "/"; %>

<%

    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
  // System.out.println("value of records_per_page"+records_per_page);
%>

<html>
<head>
    <title>Customer Details</title>
    <link href="<%=context%>css/smartlender-print.css" media="print" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" media="all" href="<%=context%>css/calendar-blue.css" title="blue"/>
    <script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<script language="JavaScript" type="text/JavaScript">
function submitPage() {
    document.forms[0].action="ImageUploadAdd.do?event=save_image_upload";
    document.forms[0].method="POST";
    document.forms[0].submit();
}
function cancelPage() {
    document.forms[0].action="ImageUpload.do?event=image_upload";
    document.forms[0].submit();
}
function closePage() {
    document.forms[0].action="ImageUpload.do?event=image_upload";
    document.forms[0].submit();
}

</script>
</head>

<%
    String event = (String) request.getParameter("event");
    com.integrosys.cms.ui.image.ImageUploadForm aForm;
    aForm = (com.integrosys.cms.ui.image.ImageUploadForm) request.getAttribute("ImageUploadForm");
    if (aForm == null) {
    	//aForm = (com.integrosys.cms.ui.custodian.CustodianSearchForm) request.getAttribute("CustodianSearchForm");  //Shiv
    }
    
    CountryList cList = CountryList.getInstance();
	String customerName = request.getParameter("customerName");
	if(customerName!=null)
	{
		customerName = customerName.replace('~',' ');
	}
	String legalName = request.getParameter("legalName");
    Collection results = aForm.getSearchResult();
    session.removeAttribute("imageUploadProxyManager");
    session.setAttribute("imageUploadProxyManager",request.getAttribute( "imageUploadProxyManager"));
    session.setAttribute("legalName",request.getParameter( "legalName"));
    session.setAttribute("custName",customerName);
    String strFileUploadSize = "500000"; 
    session.setAttribute("strFileUploadSize",strFileUploadSize);
    if(results!=null) {
       pageContext.setAttribute("customerList",results);
    }
	
    CustomerSearchCriteria search = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
    }
    int rowIdx = 0;
   int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}
    %>
    
    
    <% if(results!=null)  {%>
              <logic:present name="customerList">
               <logic:iterate id="OB" name="customerList"  type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
               </logic:iterate>
               </logic:present>
              <% } %>
<body topmargin="1" leftmargin="5">
<html:form action="/ImageUploadAdd">
<html:hidden name="event" property="event" value="save_image_upload"/>
<html:hidden name="imgDepricated" property="imgDepricated" value="N"/>
<html:hidden name="custId" property="custId" value="<%=legalName%>"/>
<html:hidden name="custName" property="custName" value="<%=customerName%>"/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Customer Details</h3></td>
     

    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
    <td colspan="2">
        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
            </thead>
            <tbody>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.name"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=customerName%>"/>&nbsp;</td>
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.id"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=legalName%>"/>&nbsp;</td>
                </tr>

                <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")){ %>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.customer.subprofile.name"/></td>
                    
                    <td><integro:empty-if-null value="<%=customerName%>"/>&nbsp;</td>
                    <td class="fieldname"><bean:message key="label.customer.subprofile.id"/></td>
                    <td><integro:empty-if-null value="<%=legalName%>"/>&nbsp;</td>
                </tr>
                <% } %>
            </tbody>
            
        </table>
    </td>
</tr>
</tbody>

<td><h3>Image upload</h3></td>

<tbody>
<thead>
<tr>
    <td colspan="2">
    <hr>
    
<table align="center"  width="55%"  border="0" cellpadding="0" cellspacing="0" class="tblFormSection" >
<tr>
	<td align="center">
	<!-- Image Upload Applet  Start Here-->
	<applet code="wjhk.jupload2.JUploadApplet" archive="fileUploadLib/jupload/wjhk.jupload.jar, fileUploadLib/jupload/jakarta-commons-oro.jar, fileUploadLib/jupload/jakarta-commons-net.jar" name="jupload" mayscript="" width="600" height="280">
					   
					   <param name="postURL" value="image/parseRequest.jsp">
					   <param name="appletHeight" value="280">
					   <param name="appletWidth" value="600">
					   <param name="lookAndFeel" value="system">
					   <param name="showLogWindow" value="false">
					   <param name="allowedFileExtensions" value="jpg/jpeg/gif/tiff/tif">
					   <param name="stringUploadSuccess" value="">
					   <param name="maxChunkSize" value="<%=strFileUploadSize%>">
					Java 1.5 or higher plugin required.
					</applet>
				
	</td>
<!-- Image Upload Applet End Here -->

</tr>
</table>
</td>
</tr>
</thead>
</table>
<p align="center">

<a href="#">
        <img src="<%=context%>img/next1.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="submitPage();"/>
    </a>
    <a href="#">
        <img src="<%=context%>img/close1a.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="closePage();"/>
    </a>
</p>

</html:form>
</body>
</html>



