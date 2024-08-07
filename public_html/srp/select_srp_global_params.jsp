<%@ page import="java.util.List,
                 com.integrosys.cms.ui.srp.SRPAction"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/srp/selectSRP.jsp,v 1.1 2003/06/27 13:21:13 jtan Exp $
     *
     * This page will display the security types for selection.
     *
     * @author $Author: btchng $<br>
     * @version $Revision: 1.1 $
     * @since $Date: 2003/06/27 13:21:13 $
     * Tag: $Name:  $
     */
%>




<html><!-- InstanceBegin template="../Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
if (restore) selObj.selectedIndex=0;
}

function formHandler(form){
var URL = document.form.sectype.options[document.form.sectype.selectedIndex].value;
window.location.href = URL;
}

function submitForm() {
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="srp.do">

<input type="hidden" name="event" value="<%=SRPAction.EVENT_EDIT_SRP_GP%>"/>

<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><h3> Security Recovery Parameter</h3></td>
</tr>
<tr>
<td>
<hr></td>
</tr>
<tr>
<td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr>
<td width="22%" class="fieldname">Security Type</td>
<td width="78%" class="odd">
<html:select property="securityTypeCode">
<option value="">Please Select</option>
<html:options
        collection="com.integrosys.cms.ui.srp.SRPAction.collateral.types.list"
        property="typeCode" labelProperty="typeName"/>
</html:select>
<html:errors property="securityTypeCode"/>
</td>
</tr>
</tbody>
</table></td>
</tr>
<tr><td>
<html:errors property="no.records"/>
</td></tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center">&nbsp;</td>
</tr>
<tr>
<td align="center">
<a href="#" onmouseout="MM_swapImgRestore()"
        onmouseover="MM_swapImage('Image1','','img/edit2.gif',1)"
        onClick="submitForm()">
    <img src="img/edit1.gif" name="Image1"  border="0" id="Image1" />
</a>
</td>
</tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>