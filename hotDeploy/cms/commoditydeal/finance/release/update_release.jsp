<%@ page import="com.integrosys.cms.ui.commoditydeal.finance.release.ReleaseForm,
                 java.util.HashMap,
                 com.integrosys.cms.ui.commoditydeal.finance.release.ReleaseAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/release/update_release.jsp,v 1.7 2006/10/27 08:40:06 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.7 $
* Date: $Date: 2006/10/27 08:40:06 $
* Tag: $Name:  $
*/
%>
<%
    ReleaseForm aForm = (ReleaseForm)request.getAttribute("ReleaseForm");
    System.out.println(aForm + " original stock: "+aForm.getOriginalStock());
    String indexID = request.getParameter("indexID");
    String title = indexID.equals("-1")?"New":"Edit";

    HashMap warehuseReceiptMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.warehouseReceiptMap");
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
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>
<script language="JavaScript" type="text/javascript" src="js/moveDropDownList.js"></script>

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
    List = document.forms[0].warehouseRec;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].selectedWarehouseRec;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    if (num == 1) {
        document.forms[0].event.value = "<%=ReleaseAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=ReleaseAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=ReleaseAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=ReleaseAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="Release.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=ReleaseAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Release Details - <%=title%> </h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td class="fieldname" width="33%">Original Stock (Total)</td>
          <td width="67%" colspan="4"><bean:write name="ReleaseForm" property="originalStock"/>&nbsp;
          <html:hidden property="originalStock"/>
          <bean:write name="ReleaseForm" property="actualDealUOM"/>
          <html:hidden property="actualDealUOM"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="33%" class="fieldname">Warehouse Receipt No.&nbsp;<font color="#0000FF">* </font></td>
          <td width="269" valign="top" style="border-right:0">Selected Fields
            <br/>
            <%
                String[] warehouseRec = aForm.getWarehouseRec();
                String style = "";
            %>
            <html:select property="warehouseRec" style="<%=style%>" multiple="true" size="10">
            <%
                if (warehouseRec != null) {
                    for (int i = 0; i < warehouseRec.length; i++) {
            %>
            <option value="<%=warehouseRec[i]%>"><integro:empty-if-null value="<%=(String)warehuseReceiptMap.get(warehouseRec[i])%>"/></option>
            <%
                    }
                }
            %>
            </html:select>
          </td>
          <td  colspan="2" valign="middle" style="border-left:0;border-right:0;text-align:center">
            <input name="Button" type="button" class="btnNormal" style="width:80" onClick="onAdd(document.forms[0].warehouseRec,document.forms[0].selectedWarehouseRec)" value="Add&gt;&gt;"/>
            <br/> <br/>
            <input name="Button" type="button" class="btnNormal" style="width:80" onClick="onRemove(document.forms[0].warehouseRec,document.forms[0].selectedWarehouseRec)" value="&lt;&lt;Remove"/>
          </td>
          <td width="288" style="border-left:0;border-right:0">Selected Fields&nbsp;<html:errors property="selectedWarehouseRec"/>
            <br />
            <%
                String[] selectedWarehouse = aForm.getSelectedWarehouseRec();
                style = "";
            %>
            <html:select property="selectedWarehouseRec" style="<%=style%>" multiple="true" size="10">
            <%
                if (selectedWarehouse != null) {
                    for (int i = 0; i < selectedWarehouse.length; i++) {
            %>
            <option value="<%=selectedWarehouse[i]%>"><integro:empty-if-null value="<%=(String)warehuseReceiptMap.get(selectedWarehouse[i])%>"/></option>
            <%
                    }
                }
            %>
            </html:select>
            &nbsp;
          </td>
        </tr>
        </table>
    </td>
    </tr>
  </tbody>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Release Details for Selected Receipts</h3>
    </td>
    <td align="right" valign="bottom">
        <input type="button" name="button3" id="refresh" value="Refresh" class="btnNormal" onclick="submitPage(4)"/>
    </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
        <tr>
          <td width="14%">Selected Receipts</td>
          <td width="14%">Actual Quantity</td>
          <td width="14%">Quantity Released So Far</td>
          <td width="14%">Balance Quantity to be Released</td>
          <td width="16%">Quantity to Released</td>
          <td width="14%">Balance</td>
          <td width="14%">Unit of Measure</td>
        </tr>
        </thead>
        <tbody>
        <%
            String[] receiptNo = aForm.getReceiptNo();
            String[] actualQty = aForm.getActualQty();
            String[] qtyReleasedSoFar = aForm.getQtyReleasedSoFar();
            String[] balanceQtyToBeReleased = aForm.getBalanceQtyToBeReleased();
            String[] qtyToReleased = aForm.getQtyToReleased();
            String[] balance = aForm.getBalance();
            if (receiptNo == null || receiptNo.length == 0) {
        %>
        <tr class="odd"><td colspan="7">There is no selected warehouse receipt.</td></tr>
        <%
            } else {
                for (int i = 0; i < receiptNo.length; i++) {
        %>
        <tr class="<%=(i%2==0)?"odd":"even"%>">
          <td width="14%">
            <integro:empty-if-null value="<%=(String)warehuseReceiptMap.get(receiptNo[i])%>"/>&nbsp;
            <html:hidden property="receiptNo" value="<%=receiptNo[i]%>"/>
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=actualQty[i]%>"/> &nbsp;
            <html:hidden property="actualQty" value="<%=actualQty[i]%>"/>
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=qtyReleasedSoFar[i]%>"/>&nbsp;
            <html:hidden property="qtyReleasedSoFar" value="<%=qtyReleasedSoFar[i]%>"/>
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=balanceQtyToBeReleased[i]%>"/>&nbsp;
            <html:hidden property="balanceQtyToBeReleased" value="<%=balanceQtyToBeReleased[i]%>"/>
          </td>
          <td width="16%">
          <%
                    if (qtyToReleased[i] == null) {
                        qtyToReleased[i] = "";
                    }
          %>
            <html:text property="qtyToReleased" value="<%=qtyToReleased[i]%>" size="20" maxlength="21"/>&nbsp;
            <% String qtyErr = "qtyToReleased_"+receiptNo[i]; %>
            <html:errors property="<%=qtyErr%>"/>
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=balance[i]%>"/>&nbsp;
            <html:hidden property="balance" value="<%=balance[i]%>"/>
          </td>
          <td width="14%"><bean:write name="ReleaseForm" property="actualDealUOM"/>&nbsp;</td>
        </tr>
        <% } } %>
        <tr class="Total">
          <td class="Total" style="text-align:center" colspan="4">Total Qty released for this deal:</td>
          <td class="Total">
            <bean:write name="ReleaseForm" property="totalQtyRelForDeal"/>&nbsp;
            <html:hidden property="totalQtyRelForDeal"/>
          </td>
          <td class="Total"><bean:write name="ReleaseForm" property="actualDealUOM"/>&nbsp;</td>
          <td class="Total">&nbsp;</td>
        </tr>
        <tr class="Total">
          <td class="Total" style="text-align:center" colspan="4">Balance to be released:</td>
          <td class="Total">
            <bean:write name="ReleaseForm" property="totalBalanceQtyToBeReleased"/>&nbsp;
            <html:hidden property="totalBalanceQtyToBeReleased"/>
          </td>          
          <td class="Total"><bean:write name="ReleaseForm" property="actualDealUOM"/>&nbsp;</td>
          <td class="Total">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>

<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
    <tr>
      <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="even">
          <td width="33%" class="fieldname">Date of Release&nbsp;<font color="#0000FF">* </font></td>
          <td width="67%">
			  <html:text property="partialReleaseDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('partialReleaseDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="partialReleaseDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="33%">Quantity Released</td>
          <td width="67%">
          <bean:write name="ReleaseForm" property="quantityRelease"/>&nbsp;
            <bean:write name="ReleaseForm" property="quantityReleaseUOM"/>
            <html:hidden property="quantityRelease"/>
            <html:hidden property="quantityReleaseUOM"/>
            &nbsp;<html:errors property="totalQuantityRelease"/>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td width="100%" align="center">
    <html:errors property="selectedReceipt"/>
    </td>
    </tr>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
        <td width="75" valign="baseline" align="center">
        <%
            if (indexID.equals("-1")) {
        %>
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
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
