<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.OBProjectSchedule,
                 com.integrosys.base.techinfra.diff.CompareOBUtil"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Project Schedule
* Description: This screen allows viewing new Project Schedule
* Click on the “Add New Progress Stage” button.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date: 2007/03/09 04:34:20 $
* Tag: $Name:  $
*/
%>

<%
    try {
        OBProjectSchedule objStagingProjectSchedule = (OBProjectSchedule) request.getAttribute("objStagingProjectSchedule");
        OBProjectSchedule objActualProjectSchedule = (OBProjectSchedule) request.getAttribute("objActualProjectSchedule");
        OBProjectSchedule objProjectSchedule = ((objActualProjectSchedule != null && objStagingProjectSchedule != null) || objActualProjectSchedule == null ? objStagingProjectSchedule : objActualProjectSchedule);
%>

<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script>
</script>
</head>

<body onload="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_ProjectSchedule.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="81%" ><h3><bean:message key="label.bridgingloan.proj.sche.title.view"/></h3></td>
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
                    <td width="20%" class="<%=CompareOBUtil.compOB(objStagingProjectSchedule, objActualProjectSchedule,"progressStage")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prgs.stg"/></td>
                    <td width="30%"><integro:htmltext value="<%=objProjectSchedule.getProgressStage()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingProjectSchedule, objActualProjectSchedule,"startDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prop.st.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule.getStartDate()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingProjectSchedule, objActualProjectSchedule,"endDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prop.end.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule.getEndDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingProjectSchedule, objActualProjectSchedule,"actualStartDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.act.st.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule.getActualStartDate()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingProjectSchedule, objActualProjectSchedule,"actualEndDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.act.end.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule.getActualEndDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td width="30%" class="<%=CompareOBUtil.compOB(objStagingProjectSchedule, objActualProjectSchedule,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objProjectSchedule.getRemarks()%>" />&nbsp;</td>
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
    <tbody>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<%  } catch (Exception e) { e.printStackTrace(); } %>