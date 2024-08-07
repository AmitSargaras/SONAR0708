<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	int counter = 0;
	OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
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
    String rowClass = "";
ImageTagMapForm mapForm = (ImageTagMapForm)request.getAttribute("ImageTagMapForm");

%>


<head>
    <title>Customer Details</title>
<link href="<%=context%>css/smartlender-print.css" media="print" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all" href="<%=context%>css/calendar-blue.css" title="blue" />
<script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
function showListing() {
	
	var catg= document.forms[0].category.value;
	if(catg!=null  && catg!=""){
    document.forms[0].action="ImageTag.do?category="+catg;
    document.forms[0].event.value="list_tag_page";
    document.forms[0].submit();
	}else{
		alert("Please select category.")
	}
}
</script>
</head>
<body >
		
<html:form action="/ImageTagMap">

<html:hidden name="event" property="event" value="save_image_tag"/>

<html:hidden name="ImageTagMapForm" property="imgId" />
<html:hidden name="ImageTagMapForm" property="id" />
<html:hidden name="ImageTagMapForm" property="custId"/>
custId==============<bean:write name="ImageTagMapForm" property="custId"/><br>
category==============<bean:write name="ImageTagMapForm" property="category"/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<tr>
	<td>Category</td>	
		<td>								
			<html:select property="category">
                  <integro:common-code 
         			categoryCode="IMG_UPLOAD_CATEGORY" descWithCode="false" />
         	</html:select>&nbsp;
         </td>
    	<td>&nbsp;</td>
    	<td>&nbsp;<input type="button" name="Go" value="Go" class="btnNormal"   onclick="showListing()"/></td>
	</tr>
</table>	
</html:form>
</body>
</html>



