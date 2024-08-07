<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String indexID = (String) request.getParameter("indexID");
    String title = "title.bank.entity.branch.param.add";
    String event = "maker_add_item";
    if(indexID != null && indexID.length()>0)
    {
        event = "maker_edit_item";
        title = "title.bank.entity.branch.param.edit";
    }
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="CssStyle" -->
<!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>


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

function cancelForm() {
    document.forms[0].event.value = 'maker_return_item';
    document.forms[0].submit();
}

//-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>
 <html:form action="bankEntityBranchParamItem.do">
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h3><bean:message key="<%=title%>"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>

        <html:hidden property="remarks"/>
        <input type="hidden" name="event" value="<%=event%>"/>
        <input type="hidden" name="indexID" value="<%=indexID%>"/>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead></thead> <tbody>
                    <tr class="even">
                        <td class="fieldname" width="29%"><bean:message key="label.bank.entity"/>&nbsp;<font color="#0000FF">* </font></td>
                        <td width="72%">
                            <html:select property="entityTypeCode">
                                <html:options collection="bankEntity" property="value" labelProperty="label" />
                            </html:select>
                            <html:errors property="entityTypeCode"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname" width="29%"><bean:message key="label.bank.entity.branch.param.branch.code"/>&nbsp;<font color="#0000FF">* </font></td>
                        <td width="72%">
                            <html:select property="branchCode">
                                <integro:common-code categoryCode="<%= ICMSConstant.CATEGORY_CODE_BKGLOC%>" descWithCode="true"/>
                            </html:select>
                            <html:errors property="branchCode"/>
                        </td>
                    </tr>
                </tbody>
                </table>
            </td>
        </tr>
        <tr>
        <td >&nbsp;</td>
        </tr>
        <tr>
            <td> <html:errors property="duplicateEntryError"/></td>
        </tr>
    </tbody>
</table>

<table width="120" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
            <img src="img/ok1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a></td>
        <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2"/></a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>