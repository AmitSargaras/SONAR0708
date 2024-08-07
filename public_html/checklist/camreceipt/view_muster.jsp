<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*, 
				com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    SecurityReceiptForm form = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
    String lableDocDate = "Doc Expiry Date";

    /*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0)
	{
		
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if(monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))
	{
				lableDocDate = "Due Date to Receive Premium Receipt";
	}*/

	String getEvent = (String)request.getParameter("event");
	System.out.print("event is ========="+getEvent);
	
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
	document.forms["SecurityReceiptForm"].event.value="view_ok";
	document.forms["SecurityReceiptForm"].submit();
}
</script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
<!-- InstanceEndEditable --></head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="SecurityReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Security Doc Receipt </h3></td>
    </tr>
    <tr>
      <td>
      <h3> View Doc Description - Completed</h3>
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
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docCode" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Doc No</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docNo" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docDesc" /></td>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docRef" /></td>
            </tr>
--%>
            <tr class="even">
              <td class="fieldname">Document Type</td>
              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>
              <td>-</td>
              <%}else{ %>
              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>
            	<%} %>
            </tr>
            <tr class="odd">
              <td class="fieldname">Form No</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="formNo" /></td>
            </tr>
            <%if(getEvent.equals("VIEW_RECEIVED")){ %>
            <tr class="even">
              <td class="fieldname">Doc Received Date&nbsp;<font color="#0000FF">*</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="receivedDate" /></td>
            </tr>
            <% }%>
            <tr class="odd">
              <td class="fieldname">Doc Date</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docDate" /></td>
            </tr>
<%--
            <%
				if(isPolicy!=null && isPolicy.equals("true"))
				{
	
			%>
			<tr class="odd">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docEffDate" /></td>
            </tr>
            
            <%
       			 }
       		%>
--%>
            <tr class="even">
              <td class="fieldname"><%=lableDocDate%></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docExpDate" /></td>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="identifyDate" /></td>
            </tr>
--%>
            <tr class="odd">
              <td class="fieldname">Action Party</td>
              <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=form.getActionParty()%>" display="true" descWithCode="false"/></td>
            </tr>
<%-- start here for cr-17 
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                   <html:radio property="shared" disabled="true" value="true" />Yes
                   <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>
--%>
            </tbody>
        </table>
<%-- 
        <jsp:include page="/checklist/secreceipt/ViewShareCheckList.jsp" />
--%>   
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
            <tbody>
            <tr class="even">
                <td class="fieldname">Remarks</td>
                <td>
                    <% SecurityReceiptForm aForm = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm"); %>
                    <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80"  />&nbsp;
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
    <%-- end here for cr-17 --%>
        </td>
    </tr>
  </tbody>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
