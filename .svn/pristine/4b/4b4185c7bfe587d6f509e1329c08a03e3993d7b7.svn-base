<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.list.CommodityUOMListAction,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.app.commodity.main.trx.uom.IUnitofMeasureTrxValue,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.commodity.main.bus.uom.IUnitofMeasure,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Arrays,
                 com.integrosys.cms.app.commodity.main.bus.uom.UnitofMeasureComparator,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.UIUtil"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityuom/list/chk_view_commodityuom_list.jsp,v 1.12 2006/11/06 11:26:58 nkumar Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: nkumar $<br>
    * @version $Revision: 1.12 $
    * Date: $Date: 2006/11/06 11:26:58 $
    * Tag: $Name:  $
    */
%>
<%
    IUnitofMeasureTrxValue trxValue  = (IUnitofMeasureTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityUOMTrxValue");
    String category = (String)session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityCategory");
    String productType = (String)session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityuom.CommodityUOMAction.commodityProductType");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    productType = categoryList.getCommProductItem(category, productType);
    category = categoryList.getCommCategoryItem(category);
    IUnitofMeasure[] actual = trxValue.getUnitofMeasure();
    IUnitofMeasure[] staging = trxValue.getStagingUnitofMeasure();
    int counter = 0;
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
<html:form action="CommodityUOMList.do">
<input type="hidden" name="event"/>

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
        </thead> <tbody>
<%	    List res = CompareOBUtil.compOBArray(staging,actual);
        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new UnitofMeasureComparator(UnitofMeasureComparator.BY_PROFILE));
        ArrayList list = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("commodityUOM",list);
        if (list == null || list.size() == 0) {
%>
            <tr class="odd">
            <td colspan="4">There is no Unit of Measure.</td>
            </tr>
<%
        } else {
%>
		<logic:present name="commodityUOM" >
        <logic:iterate id="compResult" name="commodityUOM"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IUnitofMeasure commUomItem = (IUnitofMeasure)compResult.getObj();
            IProfile profile = commUomItem.getCommodityProfile();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" width="5%"><%=counter + 1%></td>
          <td width="28%"><integro:empty-if-null value="<%=profile.getProductSubType()%>"/></td>
          <td width="23%"><integro:empty-if-null value="<%=commUomItem.getName()%>"/></td>
          <td style="text-align:center" width="22%">
          <% if (commUomItem.getMarketQuantity() != null) { %>
            <integro:empty-if-null value="<%=UIUtil.formatNumber(commUomItem.getMarketQuantity().getQuantity(), 6 , locale)%>"/>
            <% if (commUomItem.getMarketQuantity().getUnitofMeasure() != null) { %>
            <integro:empty-if-null value="<%=commUomItem.getMarketQuantity().getUnitofMeasure().getLabel()%>"/>
          <% } } else { %> - <% } %>
          </td>
          <td style="text-align:center" width="22%">
          <%
            if (commUomItem.getMetricQuantity() != null) {
          %>
            <integro:empty-if-null value="<%=UIUtil.formatNumber(commUomItem.getMetricQuantity().getQuantity(), 6, locale)%>"/>
            <% if (commUomItem.getMetricQuantity().getUnitofMeasure() != null) { %>
            <integro:empty-if-null value="<%=commUomItem.getMetricQuantity().getUnitofMeasure().getLabel()%>"/>
          <% } } else { %> - <% } %>
          </td>
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
      </table>
    </td>
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
