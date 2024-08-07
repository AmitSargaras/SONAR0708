<%@ page import="com.integrosys.cms.ui.checklist.ccreceipt.*" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");
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

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script>

function saveForm() {
	document.forms["CCReceiptForm"].event.value="view_ok";
	document.forms["CCReceiptForm"].submit();
}
</script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
<!-- InstanceEndEditable --></head>
<body onload="MM_preloadImages('img/return2.gif','img/cancel2.gif')"> 
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CCReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td><h3>Update Constitutional/Contractual Doc Receipt </h3></td>
    </tr>
    <tr> 
      <td>
      <h3> View Doc Description - Pending Redeem</h3>
    </td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docCode" /></td>
            </tr>
            <tr class="even">
                <td class="fieldname">Doc No</td>
                <td>&nbsp;<bean:write name="CCReceiptForm" property="docNo"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDesc" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Action Party</td>
              <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=aForm.getActionParty()%>" display="true" descWithCode="false" descWithCode="false"/></td>
            </tr>
<%-- start here for cr-17 --%>
         <!--   <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >                
                 <html:radio property="shared" disabled="true" value="true" />Yes
                 <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>  -->
            </tbody>
        </table>
    <%--    <jsp:include page="/checklist/ccreceipt/ViewShareCheckList.jsp" />  --%>
         <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
             <tbody>
            <tr class="odd">
              <td class="fieldname">Remarks</td>
               <td>
                <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;
                </td>
             </tr>
           </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="middle">
                <a href="#" onClick="saveForm()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
            </td>            
          </tr>
        </table>
 <%-- End here for cr-17 --%>
 </td>
    </tr>
  </tbody>
</table>

</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>
