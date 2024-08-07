<%@ page import="com.integrosys.cms.app.bridgingloan.bus.IPropertyType,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Property Type
* Description: This screen allows the adding of Property Type.
* It can be reached by clicking on the “ADD NEW” button on top of the Contract Info tab.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date: 2007/03/09 02:14:50 $
* Tag: $Name:  $
*/
%>

<%
    try {
        String event = request.getParameter("event");
        DefaultLogger.debug(this, "event="+event);
        int propertyTypeIndex = Integer.parseInt(String.valueOf(request.getParameter("propertyTypeIndex")));

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IPropertyType[] objPropertyType = (IPropertyType[]) objBridgingLoan.getPropertyTypeList();
%>
<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<style type="text/css">
<!--
.style1 {color: #0000FF}
//-->
</style>
<script>
function submitPage(event) {
    document.forms[0].event.value=event;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/return1.gif','img/delete1.gif','img/cancel1.gif')">
<html:form action="BL_PropertyType.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="propertyTypeIndex" value="<%=propertyTypeIndex%>"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="81%" ><h3><bean:message key="label.bridgingloan.prty.typ.title.view"/></h3></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"> <hr/> </td>
        </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prty.typ"/></td>
                    <td width="30%"><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(objPropertyType[propertyTypeIndex].getPropertyType())%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                    <td><integro:number number="<%=objPropertyType[propertyTypeIndex].getNoOfUnits()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objPropertyType[propertyTypeIndex].getRemarks()%>" />&nbsp;</td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
           <td >&nbsp;</td>
        </tr>
        <tr  style="text-align:center">
        <%
        if(event.equals("view")){
            %><td height="14" style="text-align:center" valign="bottom"><a href="javascript:goNextPage('projectinfo')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a></td><%
        }
        else{
            %>
            <td><a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
            <a href="javascript:goNextPage('projectinfo')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a></td>
            <%
        }
        %>
        </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>