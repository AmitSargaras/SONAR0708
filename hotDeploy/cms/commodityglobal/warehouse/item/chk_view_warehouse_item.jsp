<%@ page import="com.integrosys.cms.ui.commodityglobal.warehouse.item.WarehouseItemAction,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.commodityglobal.warehouse.item.WarehouseItemForm,
                 com.integrosys.cms.app.commodity.main.bus.warehouse.IWarehouse,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.commodity.main.bus.warehouse.IWarehouseContact"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    String strCountry = (String) session.getAttribute("com.integrosys.cms.ui.commodityglobal.warehouse.WarehouseAction.warehouseCountry");
    strCountry = CountryList.getInstance().getCountryName(strCountry);

    String from_event = request.getParameter("from_event");

    IWarehouse actual = (IWarehouse)request.getAttribute("actualWarehouse");
    IWarehouse staging = (IWarehouse)request.getAttribute("stageWarehouse");
    WarehouseItemForm aForm = (WarehouseItemForm) request.getAttribute("WarehouseItemForm");
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
    }
}
</style>

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
    document.forms[0].event.value = "read_return";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<html:form action="WarehouseItem.do">
<input type="hidden" name="event" value="<%=WarehouseItemAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Maintain Warehouse - Process</h3>
    </td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <tbody>
            <tr class="odd">
              <td width="20%" class="<%=CompareOBUtil.compOB(staging, actual, "name")?"fieldname":"fieldnamediff"%>">Warehouse Name&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="3"><bean:write name="WarehouseItemForm" property="warehouseName"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%
    IWarehouseContact actualContact = null;
    IWarehouseContact stageContact = null;
    if (actual != null) {
        actualContact = actual.getContact();
    }
    if (staging != null) {
        stageContact = staging.getContact();
    }
%>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Location</h3>
    </td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "addressLine1")?"fieldname":"fieldnamediff"%>">Address 1&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="3"><bean:write name="WarehouseItemForm" property="address1"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "addressLine2")?"fieldname":"fieldnamediff"%>">Address 2</td>
              <td colspan="3"><bean:write name="WarehouseItemForm" property="address2"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(stageContact, actualContact, "city")?"fieldname":"fieldnamediff"%>">City&nbsp;<font color="#0000FF">* </font></td>
              <td width="30%"><bean:write name="WarehouseItemForm" property="city"/>&nbsp;</td>
              <td width="20%" class="<%=CompareOBUtil.compOB(stageContact, actualContact, "state")?"fieldname":"fieldnamediff"%>">State</td>
              <td width="30%"><bean:write name="WarehouseItemForm" property="state"/>&nbsp;
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "postalCode")?"fieldname":"fieldnamediff"%>">Postal Code</td>
              <td><bean:write name="WarehouseItemForm" property="postalCode"/>&nbsp;</td>
              <td class="fieldname">Country</td>
              <td><integro:empty-if-null value="<%=strCountry%>"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Contact Details</h3>
    </td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <tbody>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "attentionParty")?"fieldname":"fieldnamediff"%>">Contact Person</td>
              <td><bean:write name="WarehouseItemForm" property="contactName"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "faxNumber")?"fieldname":"fieldnamediff"%>">Fax</td>
              <td><bean:write name="WarehouseItemForm" property="fax"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "emailAddress")?"fieldname":"fieldnamediff"%>">Email</td>
              <td><bean:write name="WarehouseItemForm" property="email"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "telephoneNumer")?"fieldname":"fieldnamediff"%>">Telephone</td>
              <td><bean:write name="WarehouseItemForm" property="telephone"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stageContact, actualContact, "telex")?"fieldname":"fieldnamediff"%>">Extension</td>
              <td><bean:write name="WarehouseItemForm" property="extensionNumber"/>&nbsp;
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Remarks</h3>
    </td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(staging, actual, "remarks")?"fieldname":"fieldnamediff"%>">Remarks</td>
              <td colspan="3"><integro:wrapper value="<%=aForm.getWarehouseRemarks()%>"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
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
<!-- InstanceEnd -->
</html>
