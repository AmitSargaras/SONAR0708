<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction,
                 com.integrosys.cms.app.commodity.main.trx.price.ICommodityPriceTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.price.ICommodityPrice,
                 com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceForm,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.MarketUOMList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityprice/view_commodityprice.jsp,v 1.13 2006/10/27 08:41:10 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.13 $
    * Date: $Date: 2006/10/27 08:41:10 $
    * Tag: $Name:  $
    */
%>
<%
    ICommodityPriceTrxValue trxValue  = (ICommodityPriceTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction.commPriceTrxValue");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    String category = categoryList.getCommCategoryItem(trxValue.getCommodityCategoryCode());
    String productType = categoryList.getCommProductItem(trxValue.getCommodityCategoryCode(), trxValue.getCommodityProdTypeCode());
    String event = request.getParameter("event");
    CommodityPriceForm aForm = (CommodityPriceForm)request.getAttribute("CommodityPriceForm");
    MarketUOMList uomList = MarketUOMList.getInstance();
    
    String ricType = request.getParameter("ricType");
    boolean isRIC = !IProfile.PRICE_TYPE_NOC_RIC.equals(ricType);
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

<body onload="MM_preloadImages('img/cancel2.gif','img/submit2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityPrice.do">
<input type="hidden" name="event" value="<%=CommodityPriceAction.EVENT_CLOSE%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Maintain Commodity Price</h3></td>
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
          <td width="3%">S/N</td>
          <td width="15%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/></td>
          <td width="10%"><bean:message key="label.cmdt.profile.cmdt.pri.type"/></td>
          <td width="7%">RIC</td>
          <td width="7%">Market Unit</td>
          <td width="15%">Close Price&nbsp;<font color="#00AAFF">* </font></td>
          <td width="14%">Close Update Date</td>
          <%
          		if(isRIC){
          %>
          <td width="15%">Current Price </td>
          <td width="14%">Current Update Date</td>
          <%
      			}
          %>
        </tr>
        </thead>
        <tbody>
        <%
            ICommodityPrice[] priceList = trxValue.getStagingCommodityPrice();
            if (priceList == null || priceList.length == 0) {
        %>
        <tr class="odd"><td colspan="9">There is no Commodity Price.</td></tr>
        <%
            } else {
                String[] productSubType = aForm.getCommodityProduct();
                String[] priceType = aForm.getPriceType();
                String[] ric = aForm.getRic();
                String[] priceUOM = aForm.getPriceUOM();
                String[] closePriceCcy = aForm.getClosePriceCcy();
                String[] closePriceAmt = aForm.getClosePriceAmt();
                String[] closeUpdateDate = aForm.getCloseUpdateDate();
                String[] currentPriceCcy = aForm.getCurrentPriceCcy();
                String[] currentPriceAmt = aForm.getCurrentPriceAmt();
                String[] currentUpdateDate = aForm.getCurrentUpdateDate();
                for (int i = 0; i < priceList.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" width="3%"><%=i + 1%></td>
          <td width="15%"><integro:empty-if-null value="<%=productSubType[i]%>"/></td>
          <td width="10%"><integro:empty-if-null value="<%=priceType[i]%>"/></td>
          <td width="7%"><integro:htmltext value="<%=ric[i]%>"/></td>
          <td width="7%"><integro:empty-if-null value="<%=uomList.getMarketUOMItem(priceUOM[i])%>"/></td>
          <% String closePrice = closePriceCcy[i] + " "+closePriceAmt[i]; %>
          <td width="15%"><integro:empty-if-null value="<%=closePrice%>"/>&nbsp;</td>
          <td width="14%"><integro:empty-if-null value="<%=closeUpdateDate[i]%>"/>&nbsp;</td>
          <%
          		if(isRIC){
          %>
          <% String currentPrice = currentPriceCcy[i] + " "+currentPriceAmt[i]; %>
          <td width="15%"><integro:empty-if-null value="<%=currentPrice%>"/>&nbsp;</td>
          <td width="14%"><integro:empty-if-null value="<%=currentUpdateDate[i]%>"/>&nbsp;</td>
          <%
      			}
          %>
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
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (event.equals(CommodityPriceAction.EVENT_PRE_CLOSE)) {
  %>
        <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else if (event.equals(CommodityPriceAction.EVENT_TO_TRACK)) { %>
  <td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else { %>
  <td colspan="2"><a href="CommodityPrice.do?event=select" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','img/return2.gif',1)"><img src="img/return1.gif" name="Image21" border="0" id="Image2" /></a></td>
  <% } %>
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