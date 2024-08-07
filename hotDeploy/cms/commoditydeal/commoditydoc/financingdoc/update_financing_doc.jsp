<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.FinancingDocAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.FinancingDocForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/financingdoc/update_financing_doc.jsp,v 1.11 2006/10/27 08:39:01 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.11 $
* Date: $Date: 2006/10/27 08:39:01 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");
    String title = indexID.equals("-1")?"Add New":"Edit";

    FinancingDocForm aForm = (FinancingDocForm)request.getAttribute("FinancingDocForm");
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=FinancingDocAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=FinancingDocAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=FinancingDocAction.EVENT_CANCEL%>";
    }
    document.forms[0].submit();
}

function changeFields(selObj) {
    if (selObj.options[selObj.selectedIndex].value == "<%=CommodityDealConstant.SALES_DOCTYPE_OTHER%>") {
        document.forms[0].salesDocDescOth.disabled = false;
    } else {
        document.forms[0].salesDocDescOth.disabled = true;
        document.forms[0].salesDocDescOth.value = "";
    }
    if (selObj.options[selObj.selectedIndex].value == "<%=CommodityDealConstant.SALES_DOCTYPE_BACK_TO_BACK_LC%>") {
        document.forms[0].termMatched[0].disabled = false;
        document.forms[0].termMatched[1].disabled = false;
        document.forms[0].termMatched[0].checked = true;
    } else {
        document.forms[0].termMatched[0].disabled = true;
        document.forms[0].termMatched[1].disabled = true;
        document.forms[0].termMatched[0].checked = false;
        document.forms[0].termMatched[1].checked = false;
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="FinancingDoc.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=FinancingDocAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Financing Document - <%=title%> </h3>
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
        <tr class="odd">
          <td width="20%" class="fieldname">Sales Documentation Description&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
              <html:select property="salesDocDesc" onchange="changeFields(this)">
	              <option value="" >Please Select </option>
	              <html:options name="docTypeID" labelName="docTypeValue"/>
              </html:select>
              <html:errors property="salesDocDesc"/>
          </td>
        </tr>
        <tr class="even">
          <td width="20%" class="fieldname">(if Others)</td>
          <td width="30%">
            <html:text property="salesDocDescOth" maxlength="150"/>
            <html:errors property="salesDocDescOth"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Description of Goods</td>
          <td width="30%">
            <html:text property="descGoods" maxlength="150"/>
            <html:errors property="descGoods"/>
          </td>
        </tr>
        <tr class="even">
          <td width="20%" class="fieldname">Amount of Sales Order</td>
          <td width="30%">
              <html:select property="salesOrderCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="salesOrderCcy"/>
            <html:text property="salesOrderAmt" maxlength="27"/>
            <html:errors property="salesOrderAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Quantity</td>
          <td width="30%">
            <html:text property="quantityVal" maxlength="27"/>
            <html:errors property="quantityVal"/>
          <bean:write name="FinancingDocForm" property="quantityUOM"/>
          <html:hidden property="quantityUOM"/>
<%--
            <html:text property="quantityVal" maxlength="27"/>
            <html:errors property="quantityVal"/>
              <html:select property="quantityUOM">
	              <option value="" >Please Select </option>
	              <html:options name="quantityUOMID" labelName="quantityUOMValue"/>
              </html:select>
              <html:errors property="quantityUOM"/>
--%>
          </td>
        </tr>
        <tbody>
        <tr class="even">
          <td width="20%" class="fieldname">Sales Document No.</td>
          <td width="30%">
          <html:text property="salesDocNo" maxlength="50"/>
          <html:errors property="salesDocNo"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Expiry Date</td>
          <td>
			  <html:text property="expiryDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('expiryDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="expiryDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Country of Export Issuing Bank</td>
          <td>
              <html:select property="countryExportIssBank">
	              <option value="" >Please Select </option>
	              <html:options name="countryValues" labelName="countryLabels"/>
              </html:select>
              <html:errors property="countryExportIssBank"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Export LC Issuing Bank</td>
          <td>
            <html:text property="exportLCIssBank" maxlength="50"/>
            <html:errors property="exportLCIssBank"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">LC Reference</td>
          <td>
            <html:text property="lcReference" maxlength="50"/>
            <html:errors property="lcReference"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"> LC Expiry Date</td>
          <td>
			  <html:text property="lcExpiryDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('lcExpiryDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="lcExpiryDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"> Due Date to Receive Letters of Credit</td>
          <td>
			  <html:text property="locDueDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('locDueDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="locDueDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Counter-Party</td>
          <td>
            <html:text property="counterParty" maxlength="150"/>
            <html:errors property="counterParty"/>
          </td>
        </tr>
        <%
            boolean isEdit = false;
            if (aForm.getSalesDocDesc() != null &&
                    aForm.getSalesDocDesc().equals(CommodityDealConstant.SALES_DOCTYPE_BACK_TO_BACK_LC)) {
                isEdit = true;
            }
        %>
        <tr class="even">
          <td class="fieldname">Terms Matched (for Back-to-Back LC only)</td>
          <td>
              <html:radio property="termMatched" value="<%=ICMSConstant.TRUE_VALUE%>" disabled="<%=!isEdit%>"/>Yes
              &nbsp;&nbsp;
              <html:radio property="termMatched" value="<%=ICMSConstant.FALSE_VALUE%>" disabled="<%=!isEdit%>"/>No
              <html:errors property="termMatched"/>
		  </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Remarks</td>
          <td>
            <html:textarea property="financingDocRemarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="financingDocRemarks"/>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
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
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
