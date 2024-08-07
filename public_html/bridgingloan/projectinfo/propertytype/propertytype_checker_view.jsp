<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.OBPropertyType,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.bridgingloan.PropertyTypeForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Checker for Property Type
* Description: This screen allows the checker to approve or reject Property Type.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date: 2007/03/09 02:14:50 $
* Tag: $Name:  $
*/
%>

<%
    try {
        OBPropertyType objStagingPropertyType = (OBPropertyType) request.getAttribute("objStagingPropertyType");
        OBPropertyType objActualPropertyType = (OBPropertyType) request.getAttribute("objActualPropertyType");
        OBPropertyType objPropertyType = ((objActualPropertyType != null && objStagingPropertyType != null) || objActualPropertyType == null ? objStagingPropertyType : objActualPropertyType);
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
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_PropertyType.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="81%" ><h3><bean:message key="label.bridgingloan.prty.typ.title.view"/></h3></td>
            <td width="19%" style="text-align:right" valign="bottom" >&nbsp; </td>
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
                    <td width="20%" class="<%=CompareOBUtil.compOB(objStagingPropertyType, objActualPropertyType,"propertyType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prty.typ"/></td>
                    <td width="30%"><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(objPropertyType.getPropertyType())%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingPropertyType, objActualPropertyType,"noOfUnits")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                    <td><integro:number number="<%=objPropertyType.getNoOfUnits()%>" />&nbsp;</td>
                </tr>

                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingPropertyType, objActualPropertyType,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objPropertyType.getRemarks()%>" />&nbsp;</td>
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
            <td style="text-align:center">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                <a href="javascript:goNextPage('projectinfo')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
            </td>
        </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>