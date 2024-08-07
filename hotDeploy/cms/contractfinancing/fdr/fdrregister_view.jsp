<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.contractfinancing.bus.OBFDR"%>
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
    String event = request.getParameter("event");
    OBFDR obFdr = (OBFDR)request.getAttribute("obFdr");
%>

<html:form action="CF_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="fdrIndex" value="<%=request.getParameter("fdrIndex")%>" />

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%">
            <h3>
            <%
            if(event.equals("view")){
                %><bean:message key="label.fdr.view"/><%
            }
            else{
                %><bean:message key="label.fdr.delete"/><%
            }
            %>
            </h3>
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
        <td width="20%" class="fieldname"><bean:message key="label.fdr.date"/></td>
        <td width="30%"><integro:date object="<%=obFdr.getFdrDate()%>" /></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.fdr.account.no"/></td>
        <td><%=obFdr.getAccountNo()%></td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.fdr.amount"/> </td>
        <td><integro:amount param="all" amount="<%=obFdr.getFdrAmount()%>" /></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.fdr.total.accumulated"/></td>
        <td><%=request.getParameter("amountAccumulated")%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.fdr.ref.number"/></td>
        <td><%=obFdr.getReferenceNo()%></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.fdr.remarks"/></td>
        <td>
            <integro:htmltext value="<%=obFdr.getRemarks()%>" lineLength="100" />&nbsp;
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
        <%
        if(event.equals("view")){
            %><a href="javascript:submitPage('list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
        }
        else{
            %>
            <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
            <a href="javascript:submitPage('list_summary')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <%
        }
        %>
        </td>
    </tr>
</thead>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>