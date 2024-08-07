<%@ page import="com.integrosys.cms.ui.commodityglobal.CommodityGlobalConstants,
                 com.integrosys.cms.ui.commodityglobal.titledocument.item.TitleDocumentItemAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    String type = request.getParameter("type");
    String from_event = request.getParameter("event");
    if (request.getParameter("from_event") != null) {
        from_event = request.getParameter("from_event");
    }

    String event = TitleDocumentItemAction.EVENT_UPDATE;

    String title = null;
    if (type.equals(CommodityGlobalConstants.NON_NEGOTIABLE_DOCUMENT)) {
        title = "Non-Negotiable ";
    } else {
        title = "Negotiable ";
    }
    title = title + "Documentation - ";

    if (from_event.equals(TitleDocumentItemAction.EVENT_PREPARE_ADD)) {
        title = title + "Add New";
        event = TitleDocumentItemAction.EVENT_ADD;
    } else {
        title = title + "Edit";
    }
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
    }
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "add";
    }
    if (num == 2) {
        document.forms[0].event.value = "update";
    }
    if (num == 3) {
        document.forms[0].event.value = "cancel";
    }
    document.forms[0].submit();
}

//-->
</script>

<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<body >
<!-- InstanceBeginEditable name="Content" -->
<html:form action="TitleDocumentItem.do">
<input type="hidden" name="event" value="<%=event%>"/>
<input type="hidden" name="type" value="<%=type%>"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3><%=title%></h3>
    </td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Document Description&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="documentDesc" maxlength="100" size="80"/>&nbsp;
              <html:errors property="documentDesc"/>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="75" valign="baseline" align="center">
        <%
            if (from_event.equals(TitleDocumentItemAction.EVENT_PREPARE_ADD)) {
        %>
            <a href="javascript:submitPage(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="javascript:submitPage(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
