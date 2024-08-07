<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.contractfinancing.bus.OBFDR,
                 com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.cms.ui.contractfinancing.fdr.FDRForm" %>
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

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage(event) {
    document.forms[0].event.value = event;
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
    OBFDR obFdr = (OBFDR)request.getAttribute("obFdr");
    OBFDR obActualFdr = (OBFDR)request.getAttribute("obActualFdr");

    FDRForm aForm = (FDRForm) request.getAttribute("CF_FDRForm");
    DefaultLogger.debug(this,"aForm="+aForm);
%>

<html:form action="CF_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%">
            <h3><bean:message key="label.fdr.view"/></h3>
        </td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
</thead>
</table>

<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="2" ><bean:message key="label.fdr.advance.section"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="<%=CompareOBUtil.compOB(obFdr,obActualFdr,"fdrDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.fdr.date"/> </td>
        <td width="30%"><%=aForm.getFdrDate()%></td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(obFdr,obActualFdr,"accountNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.fdr.account.no"/> </td>
        <td><%=aForm.getAccountNo()%></td>
    </tr>
    <tr class="odd">
        <%
            Amount stagingAmt = (obFdr == null) ? null : obFdr.getFdrAmount();
            Amount actualAmt = (obActualFdr == null) ? null : obActualFdr.getFdrAmount();
        %>
        <td class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.fdr.amount"/> </td>
        <td><%=aForm.getFdrCurrency()%> <%=aForm.getFdrAmount()%></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.fdr.total.accumulated"/></td>
        <td><%=request.getParameter("amountAccumulated")%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="<%=CompareOBUtil.compOB(obFdr,obActualFdr,"referenceNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.fdr.ref.number"/></td>
        <td><%=aForm.getReferenceNo()%></td>
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(obFdr,obActualFdr,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.fdr.remarks"/></td>
        <td>
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
            <a href="javascript:submitPage('checker_list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
        </td>
    </tr>
</thead>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>