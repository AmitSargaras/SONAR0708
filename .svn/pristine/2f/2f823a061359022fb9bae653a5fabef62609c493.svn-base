<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.OBValuationFromLOS,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceAction"%>
<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    OBValuationFromLOS obValuationFromLOS = (OBValuationFromLOS) request.getAttribute("valuationFromLOSOb");
    String indexID = (String)request.getParameter("indexID");
    String from_event = request.getParameter("from_event");
    String formActionName = request.getParameter("formActionName");    
    //System.out.println("formActionName = " + formActionName);
%>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function returnPage() {

//    document.forms[0].action.value = "AssetSpecOtherCollateral.do?event=read&flag=1&collateralID20031001961";
    document.forms[0].event.value = "<%=InsuranceAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="AssetSpecOtherCollateral.do">
<input type="hidden" name="event" value="<%=InsuranceAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.valuation.from.los"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
          <tr class="odd">
          	<td width="20%" class="fieldname"><bean:message key="label.valuation.valuer"/></td>
          	 <td ><%=obValuationFromLOS.getValuerName()%>&nbsp;</td>
            <td width="20%" class="fieldname"><bean:message key="label.valuation.date"/> </td>
             <td><% if ( obValuationFromLOS.getValuationDate() != null) { %>
                 <integro:date object="<%=obValuationFromLOS.getValuationDate()%>" />
                                       <% } %> &nbsp;</td>
          </tr>
          <tr class="even">
            <td width="20%"  class="fieldname"><bean:message key="label.valuation.currency"/>&nbsp;</td>
           <td ><%=obValuationFromLOS.getCurrencyCode()%>&nbsp;</td>
            <td width="20%" class="fieldname"><bean:message key="label.valuation.omv.cms.sec.currency"/>&nbsp;<span id="span22"> </span></td>
             <td><% if ( obValuationFromLOS.getEvaluationDateFSV() != null) { %>
                  <integro:date object="<%=obValuationFromLOS.getEvaluationDateFSV()%>" />
                                       <% } %> &nbsp;</td>
          </tr>
          <tr class="odd">
            <td class="fieldname"><bean:message key="label.valuation.date.received"/> </td>
             <td> <% if ( obValuationFromLOS.getValuationDate() != null) { %>
                 <integro:date object="<%=obValuationFromLOS.getValuationDate()%>" />
                                        <% } %> &nbsp;</td>
            <td class="fieldname"><bean:message key="label.valuation.type"/> </td>
             <td ><%=obValuationFromLOS.getValuationType()%>&nbsp;</td>
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
             <a href="<%=formActionName%>?event=read_return&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
            <%--<a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>--%>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>

</body>
</html>

