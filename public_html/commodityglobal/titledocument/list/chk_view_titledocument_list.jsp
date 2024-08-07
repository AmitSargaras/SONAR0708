<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.commodity.main.trx.titledocument.ITitleDocumentTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 java.util.*,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.OBTitleDocument,
                 com.integrosys.cms.ui.commodityglobal.titledocument.list.TitleDocumentListAction,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.TitleDocumentComparator"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/titledocument/list/chk_view_titledocument_list.jsp,v 1.6 2006/10/27 08:42:06 hmbao Exp $
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
    ITitleDocumentTrxValue trxValue = (ITitleDocumentTrxValue)session.getAttribute("com.integrosys.cms.ui.commodityglobal.titledocument.TitleDocumentAction.titleDocumentTrxValue");
    HashMap titleDocObj = (HashMap)session.getAttribute("com.integrosys.cms.ui.commodityglobal.titledocument.TitleDocumentAction.titleDocumentObj");
    int counter = 0;
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

function submitPage(num) {
    if (num == 1) {
    	document.forms[0].event.value="approve";
    }
	if (num == 2) {
    	document.forms[0].event.value="reject";
    }

    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/approve2.gif','img/cancel2.gif','img/reject2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="TitleDocumentList.do">
<input type="hidden" name="event" value="<%=TitleDocumentListAction.EVENT_APPROVE%>"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Maintain Commodity Title Documentation</h3></td>
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
        ITitleDocument[] stagingNonNeg = (ITitleDocument[])((Collection)titleDocObj.get("stageTitleDocNonNeg")).toArray(new OBTitleDocument[0]);
        ITitleDocument[] actualNonNeg = (ITitleDocument[])((Collection)titleDocObj.get("actualTitleDocNonNeg")).toArray(new OBTitleDocument[0]);
        List res = CompareOBUtil.compOBArray(stagingNonNeg, actualNonNeg);
        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new TitleDocumentComparator(TitleDocumentComparator.BY_NAME));
        ArrayList nonNeglist = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("nonNegDoc", nonNeglist);
        if (nonNeglist == null || nonNeglist.size() == 0) {
%>
            <tr class="odd">
            <td colspan="2">There is no Non-Negotiable Documentation.</td>
            </tr>
<%
        } else {
%>
		<logic:present name="nonNegDoc" >
        <logic:iterate id="compResult" name="nonNegDoc"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ITitleDocument nonNegDocItem = (ITitleDocument)compResult.getObj();
        %>
            <tr class="<%=counter%2==0?"odd":"even"%>">
              <td class="<bean:write name="compResult" property="key" />" style="text-align:center"><%=counter + 1%></td>
              <td><integro:empty-if-null value="<%=nonNegDocItem.getName()%>"/></td>
            </tr>
            <%
                counter++;
            %>
        </logic:iterate>
        </logic:present>
<%
        }
%>
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
          <%
              counter = 0;
          %>
          <tbody>
<%      
        ITitleDocument[] stagingNeg = (ITitleDocument[])((Collection)titleDocObj.get("stageTitleDocNeg")).toArray(new OBTitleDocument[0]);
        ITitleDocument[] actualNeg = (ITitleDocument[])((Collection)titleDocObj.get("actualTitleDocNeg")).toArray(new OBTitleDocument[0]);
        res = CompareOBUtil.compOBArray(stagingNeg, actualNeg);
        resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new TitleDocumentComparator(TitleDocumentComparator.BY_NAME));
        ArrayList neglist = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("negDoc",neglist);
        if (neglist == null || neglist.size() == 0) {
%>
            <tr class="odd">
            <td colspan="2">There is no Negotiable Documentation.</td>
            </tr>
<%
        } else {
%>
		<logic:present name="negDoc" >
        <logic:iterate id="compResult" name="negDoc"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ITitleDocument negDocItem = (ITitleDocument)compResult.getObj();
        %>
            <tr class="<%=counter%2==0?"odd":"even"%>">
              <td class="<bean:write name="compResult" property="key" />" style="text-align:center"><%=counter + 1%></td>
              <td><integro:empty-if-null value="<%=negDocItem.getName()%>"/></td>
            </tr>
            <%
                counter++;
            %>
        </logic:iterate>
        </logic:present>
<%
        }
%>
          </tbody>
        </table></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td class="fieldname" width="39%">Remarks</td>
        <td class="odd" width="61%">
            <html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="remarks"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">Last Action By</td>
        <td class="even"><%=trxValue!=null?trxValue.getUserInfo():""%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname">Last Remarks Made</td>
        <td><% if (trxValue != null) { %>
            <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
            <% } %>&nbsp;
       </td>
    </tr>
    </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
        <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
