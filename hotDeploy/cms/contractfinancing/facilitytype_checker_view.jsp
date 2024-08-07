<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.contractfinancing.bus.OBContractFacilityType,
                 com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.cms.ui.contractfinancing.FacilityTypeForm" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage(event) {
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function goNextPage(nextPage){
    document.forms[0].next_page.value = nextPage;
    document.forms[0].event.value = "maker_navigate_tab";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: contract financing - maker update page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.2 $
* @since $Date: 2007/May/07 $
* Tag: $Name:  $
*/
%>

<%
    OBContractFacilityType obFacilityType = (OBContractFacilityType)request.getAttribute("obFacilityType");
    OBContractFacilityType obActualFacilityType = (OBContractFacilityType)request.getAttribute("obActualFacilityType");

    FacilityTypeForm aForm = (FacilityTypeForm) request.getAttribute("CF_FacilityTypeForm");
%>

<html:form action="CF_FacilityType.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%" >
            <h3><bean:message key="label.facilitytype.view"/></h3>
        </td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
</thead>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
    <tr class="even">
        <td width="25%" class="<%=CompareOBUtil.compOB(obFacilityType,obActualFacilityType,"facilityType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.facilitytype.title"/></td>
        <td width="75%">
            <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(aForm.getFacilityType())%>
            <%=aForm.getFacilityOthers()%>
        </td>
    </tr>
    <tr class="odd">
        <td width="25%" class="<%=CompareOBUtil.compOB(obFacilityType,obActualFacilityType,"facilityDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.facilitytype.date"/></td>
        <td width="75%"><%=aForm.getFacilityDate()%></td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(obFacilityType,obActualFacilityType,"moa")?"fieldname":"fieldnamediff"%>"><bean:message key="label.facilitytype.moa"/></td>
        <td><%=aForm.getMoa()%></td>
    </tr>
    <tr class="odd">
        <%
            Amount stagingAmt = (obFacilityType == null) ? null : obFacilityType.getMaxCap();
            Amount actualAmt = (obActualFacilityType == null) ? null : obActualFacilityType.getMaxCap();
        %>
        <td class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.facilitytype.maximum.cap"/></td>
        <td>
            <integro:empty-if-null value="<%=aForm.getMaxCapCurrency()%>" />  
            <integro:empty-if-null value="<%=aForm.getMaxCapAmount()%>" />&nbsp;
        </td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(obFacilityType,obActualFacilityType,"remarks")?"fieldname":"fieldnamediff"%>" width="25%"><bean:message key="label.facilitytype.remarks"/></td>
        <td width="75%">
            <integro:htmltext value="<%=aForm.getRemarks()%>" lineLength="100" />&nbsp;
        </td>
    </tr>
</tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td height="14" align="right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td height="14" align="center" valign="bottom">
            <a href="javascript:goNextPage('contractdetail')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
        </td>
    </tr>
</thead>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>