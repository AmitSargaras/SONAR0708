<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction,
                 com.integrosys.cms.app.commodity.main.trx.price.ICommodityPriceTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.price.ICommodityPrice,
                 com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceForm,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.MarketUOMList,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfHelper,
                 com.integrosys.cms.ui.common.UIUtil"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityprice/chk_view_commodityprice.jsp,v 1.14 2006/10/27 08:41:10 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.14 $
    * Date: $Date: 2006/10/27 08:41:10 $
    * Tag: $Name:  $
    */
%>
<%
    ICommodityPriceTrxValue trxValue  = (ICommodityPriceTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction.commPriceTrxValue");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    String category = categoryList.getCommCategoryItem(trxValue.getCommodityCategoryCode());
    String productType = categoryList.getCommProductItem(trxValue.getCommodityCategoryCode(), trxValue.getCommodityProdTypeCode());
    MarketUOMList uomList = MarketUOMList.getInstance();
    String ricType = request.getParameter("ricType");
    boolean isRIC = !IProfile.PRICE_TYPE_NOC_RIC.equals(ricType);
%>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>


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

<body onload="MM_preloadImages('img/cancel2.gif','img/submit2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityPrice.do">
<input type="hidden" name="event" value="<%=CommodityPriceAction.EVENT_APPROVE%>"/>

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
  <thead>
    <tr><td>&nbsp;</td></tr>
  </thead>
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
          <td width="15%">Current Price </font></td>
          <td width="14%">Current Update Date</td>
          <%
      			}
          %>
        </tr>
        </thead>
        <tbody>
<%
        List res = CompareOBUtil.compOBArray(trxValue.getStagingCommodityPrice(),trxValue.getCommodityPrice());
        ArrayList list = new ArrayList(res);
        pageContext.setAttribute("commodityPrice",list);
        if (list == null || list.size() == 0) {
%>
        <tr><td colspan="9">There is no Commodity Price.</td></tr>
<%
        } else {
            int counter = 0;
%>
		<logic:present name="commodityPrice" >
        <logic:iterate id="compResult" name="commodityPrice"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ICommodityPrice price = (ICommodityPrice) compResult.getObj();
            IProfile profile = price.getCommodityProfile();
            String priceType = "";
            if (profile.getPriceType() != null) {
	            priceType = CMDTProfHelper.getPriceTypeDesc(profile.getPriceType());
            }
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" width="3%"><%=counter + 1%></td>
          <td width="20%"><integro:empty-if-null value="<%=profile.getProductSubType()%>"/></td>
          <td width="10%"><integro:empty-if-null value="<%=priceType%>"/></td>
          <td width="7%"><integro:htmltext value="<%=profile.getReuterSymbol()%>"/></td>
          <td width="7%"><integro:empty-if-null value="<%=uomList.getMarketUOMItem(price.getPriceUOM())%>"/></td>
          <td width="15%">
          <%  String priceStr = null;
              if (price.getClosePrice() != null && price.getClosePrice().getCurrencyCode() != null) {
                  priceStr = UIUtil.formatAmount(price.getClosePrice(), 6, locale);
              }
          %>
          <integro:empty-if-null value="<%=priceStr%>"/>&nbsp;
          </td>
          <td width="15%"><integro:date object="<%=price.getCloseUpdateDate()%>" /></td>
          <%
          		if(isRIC){
          %>
          <td width="15%">
            <%  priceStr = null;
                if (price.getCurrentPrice() != null && price.getCurrentPrice().getCurrencyCode() != null) {
                      priceStr = UIUtil.formatAmount(price.getCurrentPrice(), 6, locale);
                }
            %>
            <integro:empty-if-null value="<%=priceStr%>"/>&nbsp;
          </td>
          <td width="15%"><integro:date object="<%=price.getCurrentUpdateDate()%>"/></td>
          <%
      			}
          %>
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