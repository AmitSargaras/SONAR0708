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
                 java.util.Iterator,
                 com.integrosys.cms.ui.imageTag.IImageTagConstants,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant
                 "%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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

%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% String context = request.getContextPath() + "/"; %>

<html>
<head>
    <title>Customer Details</title>
    <link href="<%=context%>css/smartlender-print.css" media="print" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" media="all" href="<%=context%>css/calendar-blue.css" title="blue"/>
    <script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">


function submitPage() {
	//Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II
	
    document.forms[0].action="ImageUploadAdd.do?event=save_image_details";
    document.forms[0].submit();
	
}
function cancelPage() {
    document.forms[0].action="ImageUpload.do?event=image_upload";
    document.forms[0].submit();
}
function closePage() {
    //document.forms[0].action="ImageUpload.do?event=image_upload&customerID=-999999999&limitProfileID=-999999999";
    document.forms[0].action="ImageUpload.do?event=list_image";
    document.forms[0].submit();
}

</script>
</head>

<%
    String strFileUploadSize = "500000"; 
    session.setAttribute("strFileUploadSize",strFileUploadSize);
    int rowIdx = 0;
    %>
    
    
<body topmargin="1" leftmargin="5">
<html:form action="/ImageUploadAdd">

<html:hidden name="event" property="event" value="save_image_details"/>
<html:hidden name="imgDepricated" property="imgDepricated" value="N"/>
<html:hidden property="custId"/>
<html:hidden property="custName"/>
<input type="hidden" name="customerName" value="<%=customerName%>">
<input type="hidden" name="legalName" value="<%=legalName%>">
<input type="hidden" name="fromAmt" value="<%=fromAmt%>">
<input type="hidden" name="docDatetypeVal" value="<%=docDatetypeVal%>">
<input type="hidden" name="docToAmt" value="<%=docToAmt%>">
<input type="hidden" name="docFrmDateVal" value="<%=docFrmDateVal%>">
<input type="hidden" name="docToDateval" value="<%=docToDateval%>">
<input type="hidden" name="typeOfDocVal" value="<%=typeOfDocVal%>">
<input type="hidden" name="docNameVal" value="<%=docNameVal%>">

<bean:define id="imageUploadAddFormObj" name="imageUploadAddForm" type="com.integrosys.cms.ui.image.ImageUploadAddForm" scope="request"/>
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
                <tr class="even">
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.name"/></td>
                    <td width="30%">
                    <bean:write name="imageUploadAddForm" property="custName"/>&nbsp;</td>
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.id"/></td>
                    <td width="30%"><bean:write name="imageUploadAddForm" property="custId"/>&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
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



