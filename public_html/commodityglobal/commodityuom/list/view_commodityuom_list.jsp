<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.list.CommodityUOMListAction,
                 com.integrosys.cms.app.commodity.main.trx.uom.IUnitofMeasureTrxValue,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.commodity.main.bus.uom.IUnitofMeasure,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityuom/list/view_commodityuom_list.jsp,v 1.12 2006/11/06 11:29:19 nkumar Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: nkumar $<br>
    * @version $Revision: 1.12 $
    * Date: $Date: 2006/11/06 11:29:19 $
    * Tag: $Name:  $
    */
%>
<%
    String event = request.getParameter("event");
    IUnitofMeasureTrxValue trxValue  = (IUnitofMeasureTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityUOMTrxValue");
    String category = (String)session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityCategory");
    String productType = (String)session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityProductType");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    productType = categoryList.getCommProductItem(category, productType);
    category = categoryList.getCommCategoryItem(category);
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
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
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
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
<html:form action="CommodityUOMList.do">
<input type="hidden" name="event" value="<%=CommodityUOMListAction.EVENT_CLOSE%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Maintain Commodity Unit of Measure</h3></td>
    </tr>
    <tr>
      <td> <hr/></td>
    </tr>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="even">
          <td width="20%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.sub.type"/>: <%=category%></td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>: <%=productType%></td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr>
          <td width="5%">S/N</td>
          <td width="28%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font color="#00AAFF">* </font></td>
          <td width="23%">Unit of Measure&nbsp;<font color="#00AAFF">* </font></td>
          <td width="22%">Market Unit of Measure&nbsp;<font color="#00AAFF">* </font></td>
          <td width="22%">Metric Unit of Measure&nbsp;<font color="#00AAFF">* </font></td>
        </tr>
        </thead>
        <tbody>
        <%
            IUnitofMeasure[] uomList = null;
            if (event.equals(CommodityUOMListAction.EVENT_READ)) {
                uomList = trxValue.getUnitofMeasure();
            } else {
                uomList = trxValue.getStagingUnitofMeasure();
            }
            if (uomList == null || uomList.length == 0) {
        %>
              <tr class="odd">
              <td colspan="5">There is no Unit of Measure.</td>
              </tr>
        <%
            } else {
                for (int i = 0; i < uomList.length; i++) {
                    IUnitofMeasure uom = uomList[i];
                    IProfile profile = uom.getCommodityProfile();
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" width="5%"><%=i + 1%></td>
          <td width="28%">
            <integro:empty-if-null value="<%=profile.getProductSubType()%>"/>
          </td>
          <td class="name" width="23%">
            <integro:empty-if-null value="<%=uom.getName()%>"/>
          </td>
          <td style="text-align:center" width="22%">
          <% if (uom.getMarketQuantity() != null) { %>
            <integro:empty-if-null value="<%=UIUtil.formatNumber(uom.getMarketQuantity().getQuantity(), 6 , locale)%>"/>
            <% if (uom.getMarketQuantity().getUnitofMeasure() != null) { %>
            <integro:empty-if-null value="<%=uom.getMarketQuantity().getUnitofMeasure().getLabel()%>"/>
          <% } } else { %> - <% } %>
          </td>
          <td style="text-align:center" width="22%">
          <%
            if (uom.getMetricQuantity() != null) {
          %>
            <integro:empty-if-null value="<%=UIUtil.formatNumber(uom.getMetricQuantity().getQuantity(), 6, locale)%>"/>
            <% if (uom.getMetricQuantity().getUnitofMeasure() != null) { %>
            <integro:empty-if-null value="<%=uom.getMetricQuantity().getUnitofMeasure().getLabel()%>"/>
          <% } } else { %> - <% } %>
          </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (event.equals(CommodityUOMListAction.EVENT_PRE_CLOSE)) {
  %>
        <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else if (event.equals(CommodityUOMListAction.EVENT_TO_TRACK)) { %>
  <td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else { %>
  <td colspan="2"><a href="CommodityUOMList.do?event=select" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
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
