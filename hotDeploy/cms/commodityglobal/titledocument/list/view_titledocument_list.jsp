<%@ page import="com.integrosys.cms.ui.commodityglobal.titledocument.list.TitleDocumentListAction,
                 com.integrosys.cms.app.commodity.main.trx.titledocument.ITitleDocumentTrxValue,
                 java.util.HashMap,
                 java.util.ArrayList,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/titledocument/list/view_titledocument_list.jsp,v 1.6 2006/10/27 08:42:06 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.6 $
    * Date: $Date: 2006/10/27 08:42:06 $
    * Tag: $Name:  $
    */
%>
<%
    String event = request.getParameter("event");

    HashMap titleDocObj = (HashMap)session.getAttribute("com.integrosys.cms.ui.commodityglobal.titledocument.TitleDocumentAction.titleDocumentObj");
    ArrayList titledocNonNeg = new ArrayList();
    ArrayList titledocNeg = new ArrayList();

    titledocNonNeg = (ArrayList)titleDocObj.get("stageTitleDocNonNeg");
    titledocNeg = (ArrayList)titleDocObj.get("stageTitleDocNeg");

%>


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

function submitPage() {
  	document.forms[0].event.value="close";

    document.forms[0].submit();
}
//-->
</script>

<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<html:form action="TitleDocumentList.do">
<input type="hidden" name="event" value="<%=TitleDocumentListAction.EVENT_CLOSE%>"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>
    <%
        if (event.equals(TitleDocumentListAction.EVENT_PRE_CLOSE_TITLE_DOC)) {
    %>
      <h3>Maintain Commodity Title Documentation</h3>
      <% } else { %>
      <h3>Maintain Commodity Title Documentation</h3>
      <% } %>
      </h3></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td width="58%"> <h3>Non-Negotiable Documentation</h3></td>
      <td width="42%" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%">S/N</td>
              <td width="92%">Documentation Description&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <tbody>
            <%
                if (titledocNonNeg == null || titledocNonNeg.size() == 0) {
            %>
          <tr class="odd">
          <td colspan="2">
          There is no Non-Negotiable Documentation
          </td>
          </tr>
          <%
                } else {
                    for (int i = 0; i <titledocNonNeg.size(); i++) {
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td width="8%" class="index" style="text-align:center"><%=i + 1%></td>
              <td width="92%"><integro:empty-if-null value="<%=((ITitleDocument)titledocNonNeg.get(i)).getName()%>"/></td>
            </tr>
          <%  } } %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Negotiable Documentation</h3></td>
      <td valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%">S/N</td>
              <td width="92%">Documentation Description&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <tbody>
          <%
              if (titledocNeg == null || titledocNeg.size() == 0) {
          %>
          <tr class="odd">
          <td colspan="2">
          There is no Negotiable Documentation
          </td>
          </tr>
          <%
                } else {
                    for (int i = 0; i <titledocNeg.size(); i++) {
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td width="8%" class="index" style="text-align:center"><%=i + 1%></td>
              <td width="92%"><integro:empty-if-null value="<%=((ITitleDocument)titledocNeg.get(i)).getName()%>"/></td>
            </tr>
            <%
                    }}
            %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (event.equals(TitleDocumentListAction.EVENT_PRE_CLOSE_TITLE_DOC)) {
  %>
        <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else if (event.equals(TitleDocumentListAction.EVENT_TO_TRACK)) { %>
  <td colspan="2" style="text-align:center"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } %>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
