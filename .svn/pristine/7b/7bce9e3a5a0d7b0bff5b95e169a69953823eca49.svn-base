<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.FinancingDocAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.FinancingDocForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.SalesDocTypeList,
                 com.integrosys.cms.ui.common.CountryList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/financingdoc/view_financing_doc.jsp,v 1.8 2006/10/27 08:39:01 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.8 $
* Date: $Date: 2006/10/27 08:39:01 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");

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

function returnPage() {
    document.forms[0].event.value = "<%=FinancingDocAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
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
      <h3>Financing Document - View </h3>
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
          <td width="30%"><integro:empty-if-null value="<%=SalesDocTypeList.getInstance().getSalesDocTypeItem(aForm.getSalesDocDesc())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td width="20%" class="fieldname">(if Others)</td>
          <td width="30%"><bean:write name="FinancingDocForm" property="salesDocDescOth"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Description of Goods</td>
          <td width="30%"><bean:write name="FinancingDocForm" property="descGoods"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td width="20%" class="fieldname">Amount of Sales Order</td>
          <td width="30%"><bean:write name="FinancingDocForm" property="salesOrderCcy"/>&nbsp;
          <bean:write name="FinancingDocForm" property="salesOrderAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Quantity</td>
          <td width="30%"><bean:write name="FinancingDocForm"  property="quantityVal"/>&nbsp;
          <bean:write name="FinancingDocForm" property="quantityUOM"/>
          </td>
        </tr>
        <tbody>
        <tr class="even">
          <td width="20%" class="fieldname">Sales Document No.</td>
          <td width="30%">
          <bean:write name="FinancingDocForm" property="salesDocNo"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Expiry Date</td>
          <td><bean:write name="FinancingDocForm" property="expiryDate"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Country of Export Issuing Bank</td>
          <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getCountryExportIssBank())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Export LC Issuing Bank</td>
          <td><bean:write name="FinancingDocForm" property="exportLCIssBank"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">LC Reference</td>
          <td><bean:write name="FinancingDocForm" property="lcReference"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"> LC Expiry Date</td>
          <td><bean:write name="FinancingDocForm" property="lcExpiryDate"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"> Due Date to Receive Letters of Credit</td>
          <td><bean:write name="FinancingDocForm" property="locDueDate"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Counter-Party</td>
          <td><bean:write name="FinancingDocForm" property="counterParty"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Terms Matched (for Back-to-Back LC only)</td>
          <td>
          <% String value = "";
            if (aForm.getTermMatched() != null) {
                if (aForm.getTermMatched().equals(ICMSConstant.TRUE_VALUE)) {
                    value = "Yes";
                } else{
                    value = "No";
                }
            }
          %> <%=value%>&nbsp;
		  </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Remarks</td>
          <td><integro:wrapper value="<%=aForm.getFinancingDocRemarks()%>"/>&nbsp;</td>
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
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
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
