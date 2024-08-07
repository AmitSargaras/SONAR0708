<%@ page import="java.util.Collection"%>
<%@ page import="java.util.List"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/bfltatparameters/bfl_tat_param_list.jsp,v 1.3 2006/10/27 08:11:12 hmbao Exp $
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.3 $
* Date: $Date: 2006/10/27 08:11:12 $
* Tag: $Name:  $
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
<head>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() {
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage() {
    document.forms[0].submit();
}

//-->
</script>

</head>

<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="/BflTatParams.do?event=prepare">

    <!-- InstanceBeginEditable name="Content" -->
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
      <tr>
        <td colspan="3"><h3>
            <bean:message key="label.global.country"/> - <bean:write name="BflTatParametersForm" property="countryName"/>
          </h3></td>
      </tr>
      <tr>
        <td colspan="3">&nbsp; </td>
      </tr>
        <tr>
        <td width="49%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="tblInfo" align="center">
          <thead>
            <tr>
              <td height="9" colspan="3"  align="center"> <bean:message key="label.bfl.new.bca"/> </td>
              <td colspan="2"  align="center"><bean:message key="label.bfl.parameter"/></td>
            </tr>
            <tr>
              <td height="9"  align="center"><bean:message key="label.global.sn"/></td>
              <td height="9"  align="center"><bean:message key="label.bfl.segment"/></td>
              <td width="14%"  align="center"><bean:message key="label.bfl.type"/></td>
              <td  align="center"><bean:message key="label.bfl.local"/></td>
              <td  align="center"><bean:message key="label.bfl.overseas"/></td>
            </tr>
          </thead>
          <tbody>
          <%  List newList = (List)request.getAttribute("newBCAParamList");
              if(newList == null || newList.size() == 0) {
          %>
            <tr class="odd"><td colspan="5">There is no BFL TAT Parameters.</td></tr>
          <% } else { %>
          <% int i=1; %>
          <logic:iterate id="newBCAParam" name="newBCAParamList">
            <tr class="<%=i%2==0?"odd":"even"%>">
            <td class="index" width="2%"><%=i++%></td>
            <td width="15%"><bean:write name="newBCAParam" property="segment"/></td>
            <td ><bean:write name="newBCAParam" property="bflType"/></td>
            <td width="13%" style="text-align:center"><bean:write name="newBCAParam" property="localDays"/></td>
            <td width="9%" style="text-align:center"><bean:write name="newBCAParam" property="overseasDays"/></td>
            </tr>
          </logic:iterate>
          <% } %>
          </tbody>
        </table></td>
        <td width="2%">&nbsp;</td>
        <td width="49%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="tblInfo" align="center" valign="top">
          <thead>
            <tr>
              <td height="9" colspan="3"  align="center"> <bean:message key="label.bfl.renewal.bca"/> </td>
              <td colspan="2"  align="center"><bean:message key="label.bfl.parameter"/></td>
            </tr>
            <tr>
              <td height="9"  align="center"><bean:message key="label.global.sn"/></td>
              <td height="9"  align="center"><bean:message key="label.bfl.segment"/></td>
              <td width="14%"  align="center"><bean:message key="label.bfl.type"/><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','../img/sorting_down.gif',1)"> </a></td>
              <td  align="center"><bean:message key="label.bfl.local"/></td>
              <td  align="center"><bean:message key="label.bfl.overseas"/></td>
            </tr>
          </thead>
          <tbody>
          <%  List renewalList = (List)request.getAttribute("renewalBCAParamList");
              if(renewalList==null || renewalList.size()==0) {
          %>
            <tr class="odd"><td colspan="5">There is no BFL TAT Parameters.</td></tr>
          <% } else { %>
          <% int j=1; %>
              <logic:iterate id="renewalBCAParam" name="renewalBCAParamList">
                <tr class="<%=j%2==0?"odd":"even"%>">
                <td class="index" width="2%"><%=j++%></td>
                <td width="15%"><bean:write name="renewalBCAParam" property="segment"/></td>
                <td ><bean:write name="renewalBCAParam" property="bflType"/></td>
                <td width="13%" style="text-align:center"><bean:write name="renewalBCAParam" property="localDays"/></td>
                <td width="9%" style="text-align:center"><bean:write name="renewalBCAParam" property="overseasDays"/></td>
                </tr>
              </logic:iterate>
          <% } %>
          </tbody>
        </table></td>
      </tr>
    </table>
    <table width="79" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td width="75" align="center">
            <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Return','','img/return2.gif',1)"><img src="img/return1.gif" alt="Return" name="Return" width="70" height="22" border="0" id="Return" /></a>
        </td>
      </tr>
      <tr>
        <td align="center">&nbsp; </td>
      </tr>
    </table>
    <!-- InstanceEndEditable -->
   </html:form>
  </body>
</html>