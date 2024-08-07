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
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/release/view_release.jsp,v 1.6 2006/10/27 08:40:06 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.6 $
* Date: $Date: 2006/10/27 08:40:06 $
* Tag: $Name:  $
*/
%>
<%
    ReleaseForm aForm = (ReleaseForm)request.getAttribute("ReleaseForm");
    String indexID = request.getParameter("indexID");
    HashMap warehuseReceiptMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.warehouseReceiptMap");
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>

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
    document.forms[0].event.value = "<%=ReleaseAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif')">
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
      <h3>Release Details - View </h3>
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
          <bean:write name="ReleaseForm" property="actualDealUOM"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="33%" class="fieldname">Warehouse Receipt No.&nbsp;<font color="#0000FF">* </font></td>
          <td width="269" valign="top" style="border-right:0">Selected Fields
            <br/>
            <%
                String[] warehouseRec = aForm.getWarehouseRec();
                String style = "";
                if (warehouseRec == null || warehouseRec.length == 0) {
                    style = "width:100%";
                }
            %>
            <html:select disabled="true" property="warehouseRec" style="<%=style%>" multiple="true" size="10">
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
            <input name="Button" type="button" disabled class="btnNormal" style="width:80" onClick="moveDualList(warehouseRec,selectedWarehouseRec, false )" value="Add&gt;&gt;"/>
            <br/> <br/>
            <input name="Button" type="button" disabled class="btnNormal" style="width:80" onClick="moveDualList(selectedWarehouseRec,warehouseRec,false )" value="&lt;&lt;Remove"/>
          </td>
          <td width="288" style="border-left:0;border-right:0">Selected Fields
            <br />
            <%
                String[] selectedWarehouse = aForm.getSelectedWarehouseRec();
                style = "";
                if (selectedWarehouse == null || selectedWarehouse.length == 0) {
                    style = "width:100%";
                }
            %>
            <html:select property="selectedWarehouseRec" disabled="true" style="<%=style%>" multiple="true" size="10">
            <%
                if (selectedWarehouse != null) {
                    for (int i = 0; i < selectedWarehouse.length; i++) {
            %>
            <option vlaue="<%=selectedWarehouse[i]%>"><integro:empty-if-null value="<%=(String)warehuseReceiptMap.get(selectedWarehouse[i])%>"/></option>
            <%
                    }
                }
            %>
            </html:select>
          </td>
        </tr>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Release Details for Selected Receipts</h3>
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
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=actualQty[i]%>"/> &nbsp;
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=qtyReleasedSoFar[i]%>"/>&nbsp;
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=balanceQtyToBeReleased[i]%>"/>&nbsp;
          </td>
          <td width="16%">
            <integro:empty-if-null value="<%=qtyToReleased[i]%>"/>&nbsp;
          </td>
          <td width="14%">
            <integro:empty-if-null value="<%=balance[i]%>"/>&nbsp;
          </td>
          <td width="14%"><bean:write name="ReleaseForm" property="actualDealUOM"/>&nbsp;</td>
        </tr>
        <% } } %>
        <tr class="Total">
          <td class="Total" style="text-align:center" colspan="4">Total Qty released for this deal:</td>
          <td class="Total">
            <bean:write name="ReleaseForm" property="totalQtyRelForDeal"/>&nbsp;
          </td>
          <td class="Total"><bean:write name="ReleaseForm" property="actualDealUOM"/>&nbsp;</td>
          <td class="Total">&nbsp;</td>
        </tr>
        <tr class="Total">
          <td class="Total" style="text-align:center" colspan="4">Balance to be released:</td>
          <td class="Total">
            <bean:write name="ReleaseForm" property="totalBalanceQtyToBeReleased"/>&nbsp;
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
            <td width="67%"><bean:write name="ReleaseForm" property="partialReleaseDate"/>&nbsp;
            </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="33%">Quantity Released</td>
          <td width="67%"><bean:write name="ReleaseForm" property="quantityRelease"/>&nbsp;
            <bean:write name="ReleaseForm" property="quantityReleaseUOM"/>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
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
