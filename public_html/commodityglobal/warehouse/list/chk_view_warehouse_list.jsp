<%@ page import="com.integrosys.cms.ui.common.CountryList,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.app.commodity.main.trx.warehouse.IWarehouseTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.warehouse.IWarehouse,
                 com.integrosys.cms.ui.commodityglobal.warehouse.list.WarehouseListAction,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Arrays,
                 com.integrosys.cms.app.commodity.main.bus.warehouse.WarehouseComparator"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/warehouse/list/chk_view_warehouse_list.jsp,v 1.7 2006/10/27 08:42:26 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.7 $
    * Date: $Date: 2006/10/27 08:42:26 $
    * Tag: $Name:  $
    */
%>
<%
    String strCountry = (String) session.getAttribute("com.integrosys.cms.ui.commodityglobal.warehouse.WarehouseAction.warehouseCountry");
    strCountry = CountryList.getInstance().getCountryName(strCountry);

    String from_event = request.getParameter("event");
    if (request.getParameter("from_event") != null &&
            request.getParameter("from_event").length() > 0) {
        from_event = request.getParameter("from_event");
    }

    IWarehouseTrxValue trxValue  = (IWarehouseTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.warehouse.WarehouseAction.warehouseTrxValue");
    IWarehouse[] actual = trxValue.getWarehouse();
    IWarehouse[] staging = trxValue.getStagingWarehouse();

    int counter = 0;
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

function viewItem(index) {
    document.forms[0].event.value = "view";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/approve2.gif','img/cancel2.gif','img/reject2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="WarehouseList.do">
<input type="hidden" name="event" value="<%=WarehouseListAction.EVENT_APPROVE%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Maintain Warehouse Located in <%=strCountry%></h3></td>
      <td width="42%" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%">S/N</td>
              <td width="80%">Warehouse Name</td>
              <td width="12%">Action</td>
            </tr>
          </thead>
          <tbody>
<%	    List res = CompareOBUtil.compOBArray(staging,actual);
        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new WarehouseComparator(WarehouseComparator.BY_NAME));
        ArrayList list = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("warehouse",list);
        if (list == null || list.size() == 0) {
%>
            <tr class="odd">
            <td colspan="3">There is no Warehouse</td>
            </tr>
<%
        } else {
%>
		<logic:present name="warehouse" >
        <logic:iterate id="compResult" name="warehouse"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IWarehouse warehouseItem = (IWarehouse) compResult.getObj();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" width="8%"><%=counter + 1%></td>
          <td><integro:empty-if-null value="<%=warehouseItem.getName()%>"/>&nbsp;</td>
          <td width="12%"><a href="javascript:viewItem(<%=warehouseItem.getCommonRef()%>)">View</a></td>
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
        </table></td>
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
