<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.ui.bridgingloan.PropertyTypeForm,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
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
* Purpose: Add Property Type
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
        DefaultLogger.debug(this,"event="+event);
        PropertyTypeForm objPropertyTypeForm = (PropertyTypeForm) request.getAttribute("BL_PropertyTypeForm");
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
    document.forms[0].event.value = event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function showTextBox(selectObj, othersFieldName) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].text == "Others (99)" || selectObj.options[selectIndex].text == "Others") {
        eval("document.forms[0]."+othersFieldName+".style").display="";
    }
    else {
        eval("document.forms[0]."+othersFieldName).value="";
        eval("document.forms[0]."+othersFieldName+".style").display="none";
    }
}
</script>
</head>

<body onLoad="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<html:form action="BL_PropertyType.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="propertyTypeIndex" value="<%=request.getParameter("propertyTypeIndex")%>"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right"><span class="style1">*</span> <bean:message key="label.common.mandatory"/></td>
        </tr>
        <tr>
            <td width="81%" ><h3><bean:message key="label.bridgingloan.prty.typ.title.add"/></h3></td>
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
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prty.typ"/><span class="style1">*</span></td>
                    <td width="30%">
                        <html:select property="propertyType" onchange="javascript:showTextBox(this, 'propertyTypeOthers')" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="propertyTypeValues" labelName="propertyTypeLabels"/>
                        </html:select>
                        <html:errors property="propertyType" />
                        <%
                        if (objPropertyTypeForm.getPropertyType() != null && objPropertyTypeForm.getPropertyType().equals("99")) {
                            %><html:text property="propertyTypeOthers" style="display:" /><%
                        } else{
                            %><html:text property="propertyTypeOthers" style="display:none" /><%
                        }
                        %>
                        <html:errors property="propertyTypeOthers"/>                        
                    </td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.prop.no.unt"/><span class="style1">*</span></td>
                    <td><html:text property="noOfUnits" /><html:errors property="noOfUnits"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><html:text property="remarks" /><html:errors property="remarks"/></td>
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
            <%
            if (event.equals("maker_prepare_create") || event.equals("create")) { %>
                <a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
                <a href="javascript:gotoPage('BridgingLoan.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a>
            <% }
            else { %>
                <a href="javascript:submitPage('update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BridgingLoan.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
            <% } %>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>