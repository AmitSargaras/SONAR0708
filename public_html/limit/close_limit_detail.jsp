<%@ page import="com.integrosys.cms.ui.limit.ViewLimitsForm"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>
<title>Edit Limits</title>


<script language="JavaScript" src="js/imageLoad.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" type="text/JavaScript">
function close_limits() {
	document.forms[0].event.value="close_limits";
	document.forms[0].submit();
}
</script>
</head>
<body onload="MM_preloadImages('img/return2.gif');">
<html:form  action="Limits.do">
<input name="event" type="hidden" value=""/>
<%  
String event = null;
try {
ViewLimitsForm vForm = (ViewLimitsForm)request.getAttribute("ViewLimitsForm");
event = vForm.getFromPage();
String[] limitIDs = vForm.getLimitIDs();
String[] limitRefs = vForm.getLimitRefs();
String[] leSubProfiles = vForm.getLeSubProfiles();
String[] productDescs = vForm.getProductDescs();
String[] limitLocation = vForm.getLimitLocation();
String[] bcaLocation = vForm.getBcaLocation();
String[] outerLimitIDs = vForm.getOuterLimitIDs();
String[] isSameBCA = vForm.getIsSameBCA();
String[] approvedLimits = vForm.getApprovedLimits();
String[] approvedCcy = vForm.getApprovedCurrencies();
String[] activatedLimits = vForm.getActivatedLimits();
String[] activatedCcy = vForm.getActivatedCurrencies();
String[] securityIDs = vForm.getSecurityIDs();
String[] requiredSecurityCoverages = vForm.getRequiredSecurityCoverages();
String[] limitSecurityLinkages = vForm.getLimitSecurityLinkages();
String[] securityTypes = vForm.getSecurityTypes();
String[] securityLocations = vForm.getSecurityLocations();
String[] securityOrganizations=vForm.getSecurityOrganizations();
String[] isDAP = vForm.getIsDAP();
String reason = vForm.getZerorisedReason();
String zerorisedDate = vForm.getZerorisedDate();
String limitZerorised = vForm.getIsZerorised();

int length = 0;
if (limitIDs!=null) {
	length = limitIDs.length;
}
%>		
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Limit List</h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>  
  <tbody>
    <tr>
      <td>
  <table  width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
      <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="8%">Product Desc</td>              
              <td width="9%">LE ID /<br> Customer Name </td>
              <td width="15%">Limit Location</td>
              <td width="9%"><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/> /<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
              <td width="9%">Outer Limit ID</td>
              <td width="12%">Approved Limit</td>
              <td width="12%">Activated Limit </td>              
              <td width="9%">Security ID</td>
              <td>Required Security Coverage (%)</td>
              <td width="9%">Limit-Security Linkage</td>
              <td width="14%" nowrap="nowrap">Security Type/Subtype</td>
              <td width="11%">Security Location</td>
			  <td width="4%">Organisation Code</td>
              <td width="15%">Action</td>
            </tr>
      </thead>
<tbody>
<%
	String color = "";
	for (int i=0; i<length; i++) {
		if (i%2==0)
			color="even";
		else
			color="odd";
%>
	<tr class="<%=color%>">
	<td class="index"><%=i+1%></td>
	<td><integro:empty-if-null value="<%=limitRefs[i]%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=productDescs[i]%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=leSubProfiles[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=limitLocation[i]%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=bcaLocation[i]%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=outerLimitIDs[i]%>"/>&nbsp;</td>
<%
	if (approvedLimits[i]!=null) {
%>	
    <td class="amount">
    <integro:empty-if-null value="<%=approvedCcy[i]%>"/>&nbsp;
    <% if (outerLimitIDs[i].equals ("-")) { %>
	<integro:empty-if-null value="<%=approvedLimits[i]%>"/>&nbsp;
    <% } else { %>
	(<integro:empty-if-null value="<%=approvedLimits[i]%>"/>)&nbsp;
    <% } %>
    </td>
<%
	} else {
%>
	<td class="amount">&nbsp;</td>    
<%
	}
%>
    
<%
	if (activatedLimits[i]!=null) {
%>    
    <td class="amount">
    <integro:empty-if-null value="<%=activatedCcy[i]%>"/>&nbsp;
    <% if (outerLimitIDs[i].equals ("-")) { %>
	<integro:empty-if-null value="<%=activatedLimits[i]%>"/>&nbsp;
    <% } else { %>
	(<integro:empty-if-null value="<%=activatedLimits[i]%>"/>)&nbsp;
    <% } %>
    </td>
<%
	} else {
%>
	<td class="amount">&nbsp;</td>
<%
	}
%>    
	<td><integro:empty-if-null value="<%=securityIDs[i]%>"/>&nbsp;</td>
	<td class="amount">100<%--integro:empty-if-null value="<%=requiredSecurityCoverages[i]%>"/--%>&nbsp;</td>
	<td><integro:empty-if-null value="<%=limitSecurityLinkages[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=securityTypes[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=securityLocations[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=securityOrganizations[i]%>"/>&nbsp;</td>
	<td width="5%"><a href="Limits.do?event=view_limit_details&limitID=<%=limitIDs[i]%>&fromPage=<%=event%>" >View</a></td>      
	</tr>	
<%
		}
%>
	<tr class="odd">
	<td colspan="2"  class="fieldname">Limit reduced to Zero</td>
	<td><integro:empty-if-null value="<%=limitZerorised%>"/>&nbsp;</td>
	<td colspan="2"  class="fieldname">Date Limit reduced to Zero</td>
	<td colspan="2"><integro:empty-if-null value="<%=zerorisedDate%>"/>&nbsp;</td>
	<td colspan="9">&nbsp;</td>
	</tr>
	<tr class="even">
	<td colspan="2"  class="fieldname">Reasons for Limit Reduced to Zero</td>
	<td colspan="14"><integro:empty-if-null value="<%=reason%>"/>&nbsp;</td>		
	</tr>	
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<br>
<table width="90" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td>
<%
	if ("to_track".equals(event)) {
%>
<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return1.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
<%
	} else {
%>
    <a href="javascript:close_limits()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a>
<%
	}
%>	
	</td>
	</tr>
</table>
</html:form>
</body>
</html>