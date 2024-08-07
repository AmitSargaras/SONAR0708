<%@ page import="com.integrosys.cms.ui.commoditydeal.finance.hedging.HedgingAction,
                 com.integrosys.cms.ui.commoditydeal.finance.hedging.HedgingForm"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/hedging/view_hedging.jsp,v 1.6 2006/10/27 08:39:39 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.6 $
* Date: $Date: 2006/10/27 08:39:39 $
* Tag: $Name:  $
*/
%>
<%
    HedgingForm aForm = (HedgingForm)request.getAttribute("HedgingForm");
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
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

function returnPage() {
    document.forms[0].event.value = "<%=HedgingAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="Hedging.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=HedgingAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3>Hedging</h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname">TP Deal Ref. No.</td>
          <td width="30%"><bean:write name="HedgingForm" property="tpDealRefNo"/>&nbsp;
          </td>
          <td width="20%" class="fieldname">Global Treasury Ref. NoglobalTreasuryRefNo.</td>
          <td width="30%"><bean:write name="HedgingForm" property="globalTreasuryRefNo"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Date of Deal</td>
          <td><bean:write name="HedgingForm" property="dealdate"/>&nbsp;
          </td>
          <td  class="fieldname">Amount of Deal</td>
          <td><bean:write name="HedgingForm" property="dealAmt"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Hedging Agreement Ref.</td>
          <td><bean:write name="HedgingForm" property="hedgeAgreeRef"/>&nbsp;
          </td>
          <td class="fieldname">Date of Hedging Agreement</td>
          <td><bean:write name="HedgingForm" property="hedgeAgreeDate"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" height="16">Name of Counterparty</td>
          <td height="16"><bean:write name="HedgingForm" property="counterPartyName"/>&nbsp;
          </td>
          <td class="fieldname" height="16">Margin</td>
          <td height="16"><bean:write name="HedgingForm" property="margin"/>&nbsp;%
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Hedging Price&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%"><bean:write name="HedgingForm" property="hedgingPriceCcy"/>&nbsp;
          <bean:write name="HedgingForm" property="hedgingPriceAmt"/>
          </td>
          <td class="fieldname" height="16">&nbsp;</td>
          <td height="16">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableCell">
  <thead>
  <tr>
    <td>
      <h3>Hedging Quantity</h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td class="fieldname" width="21%">Total Quantity of Goods</td>
          <td width="30%"><bean:write name="HedgingForm" property="totalQtyGoods"/>&nbsp;
          </td>
          <td class="fieldname" width="17%">Unit of Measure</td>
          <td width="32%"><bean:write name="HedgingForm" property="hedgeQtyUOM"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="21%">Total Quantity of Goods Hedged&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%"><bean:write name="HedgingForm" property="totalQtyGoodsHedge"/>&nbsp;
          </td>
          <td class="fieldname" width="17%">Unit of Measure</td>
          <td width="32%"><bean:write name="HedgingForm" property="hedgeQtyUOM"/>&nbsp;</td>
        </tr>
        <tbody>
        <tr class="odd">
          <td class="fieldname" width="21%">Percentage of Goods Hedged</td>
          <td colspan="3"><bean:write name="HedgingForm" property="percentageGoodsHedge"/>&nbsp;%
          </td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td width="75%">
      <h3>Hedging Price/Period and Settlement</h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="11%" class="fieldname" height="20">S/N</td>
          <td width="32%" height="20">Period (Tenor)&nbsp;<font color="#00AAFF">* </font></td>
          <td width="30%" height="20">Start Date&nbsp;<font color="#00AAFF">* </font></td>
          <td width="27%" height="20">End Date</td>
        </tr>
        </thead>
        <tbody>
        <%
            String[] period = aForm.getPeriod();
            String[] periodUnit = aForm.getPeriodUnit();
            String[] periodStartDate = aForm.getPeriodStartDate();
            String[] periodEndDate = aForm.getPeriodEndDate();
            String[] periodID = aForm.getPeriodID();
            if (periodID == null || periodID.length == 0) {
        %>
        <tr class="odd"><td colspan="4">There is no Hedging Period.</td></tr>
        <%
            } else {
                for (int i = 0 ; i < periodID.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td width="11%" class="index"><%=i + 1%></td>
          <td width="32%"><integro:empty-if-null value="<%=period[i]%>"/>&nbsp;
          <integro:empty-if-null value="<%=periodUnit[i]%>"/>
          </td>
          <td width="30%"><integro:empty-if-null value="<%=periodStartDate[i]%>"/>&nbsp;</td>
          <td width="27%" ><integro:empty-if-null value="<%=periodEndDate[i]%>"/>&nbsp;
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
<br>


<table width="142" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="76">&nbsp;</td>
    <td width="66">&nbsp;</td>
  </tr>
  <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
  </tr>
  <tr>
    <td style="text-align:center" width="76">&nbsp;</td>
    <td style="text-align:center" width="66">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
