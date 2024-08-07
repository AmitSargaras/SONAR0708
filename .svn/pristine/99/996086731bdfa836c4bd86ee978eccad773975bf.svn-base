<%@ page import="com.integrosys.cms.ui.collateral.commodity.CommodityMainAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/Commodity_view.jsp,v 1.10 2006/10/27 08:30:40 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.10 $
* Date: $Date: 2006/10/27 08:30:40 $
* Tag: $Name:  $
*/
%>

<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null &&
            request.getParameter("from_page").length() > 0) {
        from_event = request.getParameter("from_page");
    }

//    boolean isDone = false;
%>



<html>
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--


function submitPage(num) {
    if (num == 1) {
  	    document.forms[0].event.value="<%=CommodityMainAction.EVENT_CLOSE%>";
    }
    if (num == 2) {
        document.forms[0].event.value="<%=CommodityMainAction.EVENT_EXPOSURE_SUMMARY%>";
    }
    document.forms[0].submit();
}

function viewItem(secIndex, index, type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_VIEW%>";
    document.forms[0].secIndexID.value = secIndex;
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityMain.do">
<input type="hidden" name="event" value="<%=CommodityMainAction.EVENT_CLOSE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="secIndexID"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td ><h3><%=from_event.equals(CommodityMainAction.EVENT_PREPARE_CLOSE)?"Close":"View"%> <bean:message key="label.security.title.commodity"/></h3></td>
      <td width="50%" align="right" valign="baseline">
<%--        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" width="75">
            <%    if (isDeleting) {             %>
                    <p class="required"><font color="#FF0000" size="3"><b>
                    DELETED
                    </b></font></p>
            <% } %>
            </td>
          </tr>
        </table>--%>
    </td>
    </tr>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right" valign="baseline">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="164" valign="bottom" align="right">
                <input type="button" name="button42" id="button4" value="Exposure Summary" class="btnNormal" onclick="submitPage(2)"/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
<%@ include file="Commodity_read_helper.jsp" %>
</table>
    <table width="90" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
  <%
      if (from_event.equals(CommodityMainAction.EVENT_PREPARE_CLOSE)) {
  %>
        <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else { %>
  <td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } %>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </table>

</html:form>
</body>
</html>
