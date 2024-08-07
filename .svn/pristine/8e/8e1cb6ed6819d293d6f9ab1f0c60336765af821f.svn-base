<%@ page import="com.integrosys.cms.ui.limit.ViewLimitsForm,
		 com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
                 
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
function close_co_borrower_limits() {
	document.forms[0].event.value="close_co_borrower_limits";
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
String[] productDescs = vForm.getProductDescs();
String[] outerLimitIDs = vForm.getOuterLimitIDs();
String[] approvedLimits = vForm.getApprovedLimits();
String[] activatedLimits = vForm.getActivatedLimits();
String[] leIDs = vForm.getLeIDs();
String[] leNames = vForm.getLeNames();
String[] isDAP = vForm.getIsDAP();
String[] activatedCcy = vForm.getActivatedCurrencies();
String[] approvedCcy = vForm.getApprovedCurrencies();

String[] coSecurityIDs = vForm.getCoSecurityIDs();
String[] coRequiredSecurityCoverages = vForm.getCoRequiredSecurityCoverages();
String[] coSecurityLocations = vForm.getCoSecurityLocations();
String[] coSecurityOrganizations=vForm.getCoSecurityOrganizations();
String[] coLimitSecurityLinkages = vForm.getCoLimitSecurityLinkages();
String[] coSecurityTypes = vForm.getCoSecurityTypes();
    
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
      <td><h3>Co Borrower Limit</h3></td>
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
              <td width="3%"><bean:message key="label.global.sn"/></td>
              <td width="9%">Co-Borrower <bean:message key="label.limit.id"/></td>
              <td width="8%"><bean:message key="label.product.desc"/></td>
              <td width="9%"><bean:message key="label.global.outer.limit.id"/></td>
              <td width="12%">Approved Limit</td>
              <td width="12%">Activated Limit</td>
              <td width="9%"><bean:message key="label.customer.id"/><br/>
              <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
              <bean:message key="label.customer.subprofile.id"/>
              <% } %>
              </td>
              <td width="24%"><bean:message key="label.global.legal.name"/><br/>
              <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
              <bean:message key="label.customer.subprofile.name"/>
              <% } %>
              </td>
              <td width="9%"><bean:message key="label.security.id"/></td>
              <td>Required Security Coverage (%)</td>
              <td width="9%">Limit-Security Linkage</td>
              <td width="10%" nowrap="nowrap"><bean:message key="label.security.type"/>/<bean:message key="label.global.sub.type"/></td>
              <td width="11%"><bean:message key="label.security.loc"/></td>
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
	<td nowrap="nowrap"><integro:empty-if-null value="<%=limitRefs[i]%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=productDescs[i]%>"/>&nbsp;</td>	
	<td><integro:empty-if-null value="<%=outerLimitIDs[i]%>"/>&nbsp;</td>
<%
	if (approvedLimits[i]!=null) {
%>
	<td class="amount"><integro:empty-if-null value="<%=approvedCcy[i]%>"/>&nbsp;
<%
		if(outerLimitIDs[i].equals("-")) {
%>	
	<integro:empty-if-null value="<%=approvedLimits[i]%>"/>&nbsp;
<%
	 	} else { 
%>	
 	(<integro:empty-if-null value="<%=approvedLimits[i]%>"/>)&nbsp;
<%
	}
%>
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
	<td class="amount"><integro:empty-if-null value="<%=activatedCcy[i]%>"/>&nbsp;
<%
		if (outerLimitIDs[i].equals("-")) {
%>	
	<integro:empty-if-null value="<%=activatedLimits[i]%>"/>&nbsp;
<%
		} else {
%>	
	(<integro:empty-if-null value="<%=activatedLimits[i]%>"/>)&nbsp;
<%
		}
%>
	</td>
<%			
	} else {
%>
	<td class="amount">&nbsp;</td>	
<%
	}	
%>
	<td><integro:empty-if-null value="<%=leIDs[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=leNames[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=coSecurityIDs[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap">100<%--integro:empty-if-null value="<%=coRequiredSecurityCoverages[i]%>"/--%>&nbsp;</td>
	
	<td nowrap="nowrap"><integro:empty-if-null value="<%=coLimitSecurityLinkages[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=coSecurityTypes[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=coSecurityLocations[i]%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=coSecurityOrganizations[i]%>"/>&nbsp;</td>	
	<td valign="top" width="5%"><a href="Limits.do?event=view_co_borrower_limit_details&limitID=<%=limitIDs[i]%>&fromPage=<%=event%>" >View</a></td>      	
	</tr>	
<%
		}
%>
	<tr class="odd">
	<td colspan="2"  class="fieldname">Limit Reduced to Zero</td>
	<td><integro:empty-if-null value="<%=limitZerorised%>"/>&nbsp;</td>
	<td colspan="2"  class="fieldname">Date Limit reduced to Zero</td>
	<td colspan="2"><integro:empty-if-null value="<%=zerorisedDate%>"/>&nbsp;</td>
	<td colspan="10">&nbsp;</td>
	</tr>
	<tr class="odd">
	<td colspan="2"  class="fieldname">Reasons for Limit Reduced to Zero</td>
	<td colspan="17"><integro:empty-if-null value="<%=reason%>"/>&nbsp;</td>		
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
	if ("to_track_coborrower".equals(event)) {
%>	
	<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return1.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
<%
	} else {
%>
    <a href="javascript:close_co_borrower_limits();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a>
<%
	}
%>
	</td>
	</tr>
</table>
</html:form>
</body>
</html>