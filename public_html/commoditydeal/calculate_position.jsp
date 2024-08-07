<%@ page import="com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealForm,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/calculate_position.jsp,v 1.15 2006/10/27 08:38:43 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.15 $
* Date: $Date: 2006/10/27 08:38:43 $
* Tag: $Name:  $
*/
%>
<%
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

    CommodityDealForm aForm = (CommodityDealForm)request.getAttribute("CommodityDealForm");
    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.ARM_Code");
    boolean isPrint = false;
    String event = request.getParameter("event");
    if (event.equals(CommodityDealAction.EVENT_CAL_POSITION)) {
        isPrint = true;
    }
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
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

function refreshPage(num) {
    if (num == 0) {
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_REFRESH%>";
    }
    if (num == 1) {
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_REFRESH_CAL_POSITION%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_REFRESH%>";
        document.forms[0].productSubType.value = "";
        document.forms[0].uomUnit.value = "";
    }
    document.forms[0].submit();
}

function returnPage() {
    document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
    document.forms[0].submit();
}

function printPage() {
	var isPrintable = true;
	var errorMsg="";
    if (document.forms[0].limitID.value == null || document.forms[0].limitID.value == "") {
        errorMsg=errorMsg+'Limit ID must be input.\n';
       isPrintable = false;
    }
    if (document.forms[0].proposedFaceValueCcy.value == null || document.forms[0].proposedFaceValueCcy.value == "") {
        errorMsg=errorMsg+'Proposed face value currency code must be input.\n';
       isPrintable = false;
    }
    if (document.forms[0].proposedFaceValueAmt.value == null || document.forms[0].proposedFaceValueAmt.value == "") {
        errorMsg=errorMsg+'Proposed face value amount must be input.\n';
        isPrintable = false;
    }
    if (document.forms[0].percentageFinancing.value == null || document.forms[0].percentageFinancing.value == "") {
        errorMsg=errorMsg+'Percentage financing must be input.';
        isPrintable = false;
    }
   
    
    
    if (isPrintable) {
	    var strPath = "CommodityDeal.do?event=<%=CommodityDealAction.EVENT_CAL_POSITION%>";
	    strPath = strPath+"&securityID="+document.forms[0].securityID.value;
	    strPath = strPath+"&productType="+document.forms[0].productType.value;
	    strPath = strPath+"&productSubType="+document.forms[0].productSubType.value;
	    strPath = strPath+"&uomValue="+document.forms[0].uomValue.value;
	    strPath = strPath+"&uomUnit="+document.forms[0].uomUnit.value;
	    strPath = strPath+"&limitID="+document.forms[0].limitID.value;
	    strPath = strPath+"&proposedFaceValueCcy="+document.forms[0].proposedFaceValueCcy.value;
	    strPath = strPath+"&proposedFaceValueAmt="+document.forms[0].proposedFaceValueAmt.value;
	    strPath = strPath+"&percentageFinancing="+document.forms[0].percentageFinancing.value;
	    window.open(strPath);
	}else
	{ 
		alert(errorMsg);
	}
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="CommodityDeal.do">
<input type="hidden" name="event"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3>Calculate Existing/Proposed Position</h3>
    </td>
    <td align="right" valign="bottom">
    <%
        if (!isPrint) {
    %>
        <input type="button" name="button3" id="calculate_position" value="Refresh" class="btnNormal" onclick="refreshPage(1)"/>
    <% } %>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname">Customer ID</td>
          <td width="30%"><%=customer.getCMSLegalEntity().getLEReference()%></td>
          <td width="20%" class="fieldname">Customer Name</td>
          <td width="30%"><integro:empty-if-null value="<%=customer.getCustomerName()%>"/></td>
        </tr>
        <tr class="even">
          <td class="fieldname">Customer Legal Name</td>
          <td><integro:empty-if-null value="<%=customer.getCMSLegalEntity().getLegalName()%>"/><br />
          </td>
          <td  class="fieldname">FAM Code</td>
          <td><integro:empty-if-null value="<%=armCode%>"/>&nbsp;</td>
        </tr>
        <tbody>
        <tr class="odd">
        <td class="fieldname">Security ID</td>
        <td>
        <%
            if (isPrint) {
                ArrayList secID = (ArrayList)request.getAttribute("secID");
                ArrayList secValue = (ArrayList)request.getAttribute("secValue");
                int index = secID.indexOf(aForm.getSecurityID());
                String securityID = (String)secValue.get(index);
        %>
        <integro:empty-if-null value="<%=securityID%>"/>&nbsp;
        <% } else { %>
              <html:select property="securityID" onchange="refreshPage(0)">
	              <option value="" >Please Select </option>
	              <html:options name="secID" labelName="secValue"/>
              </html:select>
              <html:errors property="securityID"/>
        <% } %>
        </td>
        <td class="fieldname">Security Sub Type</td>
        <td><integro:empty-if-null value="<%=categoryList.getCommCategoryItem(aForm.getSecuritySubType())%>"/>&nbsp;
        <html:hidden property="securitySubType"/>
        </td>
        </tr>
        <tr class="even">
        <td class="fieldname">Commodity Product Type</td>
        <td>
        <%
            if (isPrint) {
        %>
        <integro:empty-if-null value="<%=categoryList.getCommProductItem(aForm.getSecuritySubType(), aForm.getProductType())%>"/>&nbsp;
        <% } else { %>
              <html:select property="productType" onchange="refreshPage(2)">
	              <option value="" >Please Select </option>
	              <html:options name="productTypeID" labelName="productTypeValue"/>
              </html:select>
              <html:errors property="productType"/>
        <% } %>
        </td>
        <td class="fieldname">Commodity Product Sub-Type</td>
        <td>
        <%
            if (isPrint) {
                ArrayList productSubTypeID = (ArrayList)request.getAttribute("productSubTypeID");
                ArrayList productSubTypeValue = (ArrayList)request.getAttribute("productSubTypeValue");
                int index = productSubTypeID.indexOf(aForm.getProductSubType());
                String productSubType = null;
                if (index > -1) {
                    productSubType = (String)productSubTypeValue.get(index);
                }
        %>
        <integro:empty-if-null value="<%=productSubType%>"/>&nbsp;
        <% } else { %>
              <html:select property="productSubType" onchange="refreshPage(0)">
	              <option value="" >Please Select </option>
	              <html:options name="productSubTypeID" labelName="productSubTypeValue"/>
              </html:select>
              <html:errors property="productSubType"/>
        <% } %>
        </td>
        </tr>
        <tr class="odd">
        <td class="fieldname">Market Price</td>
        <td><bean:write name="CommodityDealForm" property="marketPrice"/>&nbsp;
        <html:hidden property="marketPrice"/>
        </td>
        <td class="fieldname">Commodity Differential</td>
        <td><bean:write name="CommodityDealForm" property="commodityDifferential"/>&nbsp;
        <html:hidden property="commodityDifferential"/>
        </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Limit ID&nbsp;<font color="#0000FF">* </font></td>
          <td>
          <%
              if (isPrint) {
                  ArrayList limitValues = (ArrayList)request.getAttribute("limitValues");
                  ArrayList limitLabels = (ArrayList)request.getAttribute("limitLabels");
                  int index = limitValues.indexOf(aForm.getLimitID());
                  String limitDesc = (String)limitLabels.get(index);
          %>
          <integro:empty-if-null value="<%=limitDesc%>"/>&nbsp;
          <% } else { %>
              <html:select property="limitID">
	              <option value="" >Please Select </option>
	              <html:options name="limitValues" labelName="limitLabels"/>
              </html:select>
              <html:errors property="limitID"/>
          <% } %>
          </td>
          <td class="fieldname">Activated Limit</td>
          <td><bean:write name="CommodityDealForm" property="activatedLimit"/>&nbsp;
          <html:hidden property="activatedLimit"/>
          </td>
        </tr>
        <tr class="odd">
        <td class="fieldname">Quantity</td>
        <td>
        <%
            if (isPrint) {
        %>
        <bean:write name="CommodityDealForm" property="uomValue"/>&nbsp;
        <% } else { %>
        <html:text property="uomValue" maxlength="21"/>&nbsp;
        <html:errors property="uomValue"/>
        <% } %>
        </td>
        <td class="fieldname">Unit Of Measure</td>
        <td>
        <%
            if (isPrint) {
                ArrayList uomIDList = (ArrayList)request.getAttribute("uomIDList");
                ArrayList uomValueList = (ArrayList)request.getAttribute("uomValueList");
                int index = uomIDList.indexOf(aForm.getUomUnit());
                String uomValue = null;
                if (index > -1) {
                    uomValue = (String)uomValueList.get(index);
                }
        %>
        <integro:empty-if-null value="<%=uomValue%>"/>&nbsp;
        <% } else { %>
              <html:select property="uomUnit">
	              <option value="" >Please Select </option>
	              <html:options name="uomIDList" labelName="uomValueList"/>
              </html:select>
              <html:errors property="uomUnit"/>
        <% } %>
        </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Proposed Face Value&nbsp;<font color="#0000FF">* </font></td>
          <td>
          <% if (!isPrint) { %>
              <html:select property="proposedFaceValueCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
          <html:text property="proposedFaceValueAmt" maxlength="21"/>
          <html:errors property="proposedFaceValueCcy"/>
          <html:errors property="proposedFaceValueAmt"/>
          <% } else { %>
          <bean:write name="CommodityDealForm" property="proposedFaceValueCcy"/>&nbsp;
          <bean:write name="CommodityDealForm" property="proposedFaceValueAmt"/>
          <% } %>
          </td>
          <td class="fieldname">Percentage of Financing&nbsp;<font color="#0000FF">* </font></td>
          <td>
          <%
              if (isPrint) {
          %>
          <bean:write name="CommodityDealForm" property="percentageFinancing"/>&nbsp;%
          <% } else { %>
            <html:text property="percentageFinancing" maxlength="3" size="5" disabled="<%=isPrint%>"/>%
            <html:errors property="percentageFinancing"/>
          <% } %>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Proposed Deal Amount <br>
            (Deal Operational Limit)</td>
          <td>
          <bean:write name="CommodityDealForm" property="proposedFaceValueCcy"/>&nbsp;
          <bean:write name="CommodityDealForm" property="proposedDealAmt"/>
          <html:hidden property="proposedDealAmt"/>
          </td>
          <td class="fieldname">Balance of Proposed Face Value</td>
          <td>
              <bean:write name="CommodityDealForm" property="proposedFaceValueCcy"/>&nbsp;
           <bean:write name="CommodityDealForm" property="balanceProposedFaceVal"/>
           <html:hidden property="balanceProposedFaceVal"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Outstanding Operational Limit</td>
          <td><bean:write name="CommodityDealForm" property="outstandingOpLimit"/>&nbsp;
          <html:hidden property="outstandingOpLimit"/>
          </td>
          <td class="fieldname">Collateral Position</td>
          <td><bean:write name="CommodityDealForm" property="collateralPosition"/>&nbsp;
          <html:hidden property="collateralPosition"/>
          </td>
        </tr>
        <% if (false) { %>
        <tr class="odd">
          <td class="fieldname">&nbsp;</td>
          <td colspan="3">

            <a href="#" onclick="refreshPage(1)">Click here to see calculated values</a>
          &nbsp;
          </td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<%
    if (!isPrint) {
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">

</table>

<table width="142" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="76">&nbsp;</td>
    <td width="66">&nbsp;</td>
  </tr>
  <tr>
    <td width="76"><a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image511','','img/return2.gif',1)"><img src="img/return1.gif" name="Image511" border="0" id="Image5" /></a></td>
    <td width="66"><a href="javascript:printPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image411','','img/print2.gif',1)"><img src="img/print1.gif" name="Image411" width="70" height="20" border="0" id="Image4" /></a></td>
  </tr>
  <tr>
    <td style="text-align:center" width="76">&nbsp;</td>
    <td style="text-align:center" width="66">&nbsp;</td>
  </tr>
</table>
<% } %>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
