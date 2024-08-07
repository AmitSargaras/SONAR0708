<%@ page import="java.util.List,
                 com.integrosys.cms.ui.srp.SRPAction,
                 com.integrosys.cms.ui.srp.SRPForm,
                 java.util.Iterator,
                 com.integrosys.cms.app.collateral.bus.ICollateralType,
                 com.integrosys.cms.app.collateral.trx.ICollateralSubTypesTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralSubType,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/srp/selectSRP.jsp,v 1.1 2003/06/27 13:21:13 jtan Exp $
     *
     * This page will display the security items for user to input the maximum
     * percentages.
     *
     * @author $Author: btchng $<br>
     * @version $Revision: 1.1 $
     * @since $Date: 2003/06/27 13:21:13 $
     * Tag: $Name:  $
     */
%>

<%
    // Get the ActionForm.
    SRPForm srpForm = (SRPForm)pageContext.findAttribute("srpForm");
    // srpForm must not be null.

    // Get the security type name from the session and form inputs.
    ICollateralSubTypesTrxValue value = (ICollateralSubTypesTrxValue)
            session.getAttribute(
                    "com.integrosys.cms.ui.srp.SRPAction.collateral.subtypes.trx.value");
    ICollateralSubType[] collateralSubTypesArr = value.getCollateralSubTypes();
    pageContext.setAttribute("collateral.subtypes.arr", collateralSubTypesArr);
    String collateralTypeName = null;
    for (int i = 0; i < collateralSubTypesArr.length; i++) {
        if (collateralSubTypesArr[i].getTypeCode().equals(
                srpForm.getSecurityTypeCode())) {
            collateralTypeName = collateralSubTypesArr[i].getSubTypeName();
            break;
        }
    }

    boolean isEditable = true;
    if (value.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)) {
        isEditable = false;
    }
    
//    List collateralTypeList = (List)session.getAttribute(
//            "com.integrosys.cms.ui.srp.SRPAction.collateral.types.list");

//    ICollateralType collateralType = null;
//    for (Iterator iter = collateralTypeList.iterator(); iter.hasNext();) {
//        collateralType = (ICollateralType)iter.next();
//        if (collateralType.getTypeCode().equals(srpForm.getSecurityTypeCode())) {
//            collateralTypeName = collateralType.getTypeName();
//        }
//    }
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function submitForm() {
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
<tr>
<td><h3>Security Recovery Global Parameters - <%=collateralTypeName%></h3></td>
</tr>
<tr>
<td><hr /></td>
</tr>
</thead>
<tbody>
<tr>
<td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
<thead>
<tr class="tblInfo">
<td width="10%">S/N</td>
<td width="65%">Description</td>
<td width="12%">Max %</td>
</tr>
</thead>
<tbody>
<html:form action="srp.do">
<input type="hidden" name="event" value="<%=SRPAction.EVENT_SAVE_SRP_GP%>"/>
<%
    String cssClass = "odd";
%>
<logic:iterate id="collateralSubType"
        name="collateral.subtypes.arr"
        indexId="counter"
        type="com.integrosys.cms.app.collateral.bus.ICollateralSubType">
<tr class="<%=cssClass%>">
<td class="index"><%=counter.intValue()+1%></td>
<td><%=collateralSubType.getSubTypeDesc()%></td>
<td style="text-align:right;padding-right:5px">
    <% if (isEditable) { %>
    <input name="percentages" type="text"
            value="<%=srpForm.getPercentages(counter.intValue())%>"
            size="3" maxlength="3" class="currency"/>
    <html:errors property="<%=String.valueOf(counter.intValue())%>"/>
    <% } else {
        out.println(srpForm.getPercentages(counter.intValue()));
    } %>

</td>
</tr>
</logic:iterate>
</html:form>
</tbody>
</table></td>
</tr>

</tbody>
</table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="75">&nbsp;</td>
<td width="74">&nbsp;</td>
</tr>
<tr>
<td>
<% if (isEditable) { %>
<a href="#" onmouseout="MM_swapImgRestore()"
        onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"
        onClick="submitForm()">
        <img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
<% } else { %>
    &nbsp;
<% } %>
<td><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>


<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>