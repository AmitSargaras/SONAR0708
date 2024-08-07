<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
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

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
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
%>

<html:form action="CF_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="fdrIndex" value="<%=request.getParameter("fdrIndex")%>" />   <%--for edit--%>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td align="right" colspan="2"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></td>
    </tr>
    <tr>
        <td width="81%">
            <h3>
            <%
            if(event.equals("maker_prepare_create")||event.equals("create")){
                %><bean:message key="label.fdr.add"/><%
            }
            else{
                %><bean:message key="label.fdr.edit"/><%
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

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr>
        <td colspan="2" ><bean:message key="label.fdr.advance.section"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.fdr.date"/> <font color="#0000FF">*</font> </td>
        <td width="30%">
            <html:text property="fdrDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onClick="return showCalendar('fdrDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="fdrDate" />
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.fdr.account.no"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="accountNo"/>
            <html:errors property="accountNo" />
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.fdr.amount"/> <font color="#0000FF">*</font></td>
        <td>
            <html:select property="fdrCurrency">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="fdrCurrency"/>

            <html:text property="fdrAmount" size="20" maxlength="15"/>
            <html:errors property="fdrAmount" />
        </td>
    </tr>
    <%
    if(event.equals("maker_prepare_update")){
        %>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.fdr.total.accumulated"/></td>
            <td><%=request.getParameter("amountAccumulated")%>&nbsp;</td>
        </tr>
        <%
    }
    %>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.fdr.ref.number"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="referenceNo" size="20" maxlength="15"/>
            <html:errors property="referenceNo" />
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.fdr.remarks"/></td>
        <td>
            <html:textarea property="remarks" rows="5" style="width:100% "/>
            <html:errors property="remarks" />
        </td>
    </tr>
</tbody>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
</tr>
<tr>
    <td>
    <%
    if(event.equals("maker_prepare_create")||event.equals("create")){
        %><a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:submitPage('list_summary')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    else{
        %><a href="javascript:submitPage('update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:submitPage('list_summary')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    %>
    </td>
</tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>