<%@ page import="com.integrosys.cms.ui.limit.ViewLimitsForm,
		 com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
    <title>Edit Limits</title>
    

    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="JavaScript" src="js/imageLoad.js"></script>
    <script language="JavaScript" src="js/calDriver.js"></script>
    <script language="JavaScript" src="js/calendar.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--
  function submitPage() {
      document.forms[0].event.value="edit_co_borrower_limits";
      document.forms[0].customerID.value = <%=request.getParameter("customerID")%>;
	document.forms[0].submit();
}

function returnPage() {
	document.forms[0].event.value="viewlimits";
	document.forms[0].customerID.value = "<%=request.getParameter("BCACustomerID")%>";
	document.forms[0].submit();
}

function changeStatus() {
	if (document.forms[0].isZerorised.checked) {
		document.forms[0].zerorisedDate.disabled = false;
		document.forms[0].Image11.disabled = false;
		document.getElementById('span1').innerText="*";
		document.getElementById('span2').innerText="*";
	} else {
		document.forms[0].zerorisedDate.disabled = true;
		document.forms[0].zerorisedDate.value = "";
		document.forms[0].Image11.disabled = true;
		document.getElementById('span1').innerText="";
		document.getElementById('span2').innerText="";
	}
}

function disableImage() {
	if (!document.forms[0].isZerorised.checked) {
		document.forms[0].Image11.disabled = true;
	}
}

function checkTextSize() {
	var text = document.forms[0].zerorisedReason.value;
	if(text==''){
	}else{
		if(text.length>250){
			document.all['warningRemarks'].innerHTML = '<font color="#FF0000" size="1"><br>Zerorised Reason is too long. Please restrict to 250 characters.</font>';
			document.forms[0].zerorisedReason.value = text.substring(0, 250);
		}else{
			document.all['warningRemarks'].innerHTML = '';
		}
	}
}
-->
    </script>

    <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
</head>

<body onload="MM_preloadImages('img/return2.gif');changeStatus();">
<html:form action="Limits.do">
<input name="event" type="hidden" value=""/>
<input type="hidden" name="customerID"/>
<%
    String event = null;
    try {
        ViewLimitsForm vForm = (ViewLimitsForm) request.getAttribute("ViewLimitsForm");
        event = vForm.getFromPage();
        String[] limitIDs = vForm.getLimitIDs();
        String[] limitRefs = vForm.getLimitRefs();
        String[] productDescs = vForm.getProductDescs();
        String[] outerLimitIDs = vForm.getOuterLimitIDs();
        String[] approvedLimits = vForm.getApprovedLimits();
        String[] activatedLimits = vForm.getActivatedLimits();
        String[] approvedCcy = vForm.getApprovedCurrencies();
      //  String[] activatedCcy = vForm.getActivatedCurrencies();
        String[] leIDs = vForm.getLeIDs();
        String[] leNames = vForm.getLeNames();
        String[] isDAP = vForm.getIsDAP();
        String reason = vForm.getZerorisedReason();
        String zerorisedDate = vForm.getZerorisedDate();
        String limitZerorised = vForm.getIsZerorised();
        String remarks = vForm.getRemarks();
        //start..
        String[] securityIDs = vForm.getCoSecurityIDs();
        String[] requiredSecurityCoverages = vForm.getCoRequiredSecurityCoverages();
        String[] limitSecurityLinkages = vForm.getCoLimitSecurityLinkages();
        String[] securityTypes = vForm.getCoSecurityTypes();
        String[] securityLocations = vForm.getCoSecurityLocations();
        String[] coSecurityOrganizations = vForm.getCoSecurityOrganizations();

        int length = 0;
        if (limitIDs != null) {

            length = limitIDs.length;

        }
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Co Borrower Limit</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td>
    <table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <td width="3%"><bean:message key="label.global.sn"/></td>
                <td width="9%"><bean:message key="label.global.co.borrower"/> <bean:message key="label.limit.id"/></td>
                <td width="8%"><bean:message key="label.product.desc"/></td>
                <td width="9%"><bean:message key="label.global.outer.limit.id"/></td>
                <td width="12%">Approved Limit</td>
                <td width="12%">Activated Limit </td>
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
                <!--  Security ID Required Security Coverage (%) Limit-Security Linkage Security Type/Subtype Security Location-->
                <td width="9%"><bean:message key="label.security.id"/></td>
                <td>Required Security Coverage (%)</td>
                <td width="9%">Limit-Security Linkage</td>
                <td width="10%" nowrap="nowrap"><bean:message key="label.security.type"/>/<bean:message key="label.security.sub.type"/></td>
                <td width="15%"><bean:message key="label.security.loc"/></td>
                <td width="15%"><bean:message key="label.org.code "/></td>
            </tr>
        </thead>
        <tbody>
                <%

                    String color;
                    for (int i=0; i<length; i++) {
                    String amountFormatError = "amountFormatError"+i;
                    String amountCompareError = "amountCompareError"+i;
                    String secCoveragesError = "secCoveragesError"+i;    
                        if (i%2==0)
                            color="even";
                        else
                            color="odd";

                %>
            <tr class="<%=color%>">
                <td class="index"><%=i + 1%></td>
                <td nowrap="nowrap"><integro:empty-if-null value="<%=limitRefs[i]%>"/>&nbsp;
                    <input type="hidden" name="limitRefs" value="<%=limitRefs[i]%>"/></td>
                <td><integro:empty-if-null value="<%=productDescs[i]%>"/>&nbsp;
                    <input type="hidden" name="productDescs" value="<%=productDescs[i]%>"/></td>
                <td><integro:empty-if-null value="<%=outerLimitIDs[i]%>"/>&nbsp;
                    <input type="hidden" name="outerLimitIDs" value="<%=outerLimitIDs[i]%>"/></td>
                <td class="amount">
                    <integro:empty-if-null value="<%=approvedCcy[i]%>"/>
                    <%
                        if (outerLimitIDs[i].equals("-")) {
                    %>
                    <integro:empty-if-null value="<%=approvedLimits[i]%>"/>&nbsp;
                    <%
                    } else {
                    %>
                    (<integro:empty-if-null value="<%=approvedLimits[i]%>"/>)&nbsp;
                    <%
                        }
                    %>
                    <input type="hidden" name="approvedLimits" value="<%=approvedLimits[i]%>"/>
                </td>
                <td class="amount"><integro:empty-if-null value="<%=approvedCcy[i]%>"/>
                    <%
                        if (isDAP[i].equals("Y")) {
                            String activatedLimitDis = activatedLimits[i] == null ? "-" : activatedLimits[i];
                            if (outerLimitIDs[i].equals("-")) {
                    %>
                    <integro:empty-if-null value="<%=activatedLimitDis%>"/>&nbsp;
                    <%
                    } else {
                    %>
                    (<integro:empty-if-null value="<%=activatedLimitDis%>"/>)&nbsp;
                    <%
                        }
                    %>
                    <input type="hidden" name="activatedLimits" value="<%=activatedLimitDis%>"/>
                    <%
                    } else {
                        String actLimitAmt = activatedLimits[i] == null ? "" : activatedLimits[i];
                        if (outerLimitIDs[i].equals("-")) {
                    %>
                    <html:text property="activatedLimits" value="<%=actLimitAmt%>"/><html:errors
                        property="<%=amountFormatError%>"/><html:errors property="<%=amountCompareError%>"/>
                    <%
                    } else {
                    %>
                    (<html:text property="activatedLimits" value="<%=actLimitAmt%>"/><html:errors
                        property="<%=amountFormatError%>"/><html:errors property="<%=amountCompareError%>"/>)
                    <%
                            }
                        }
                    %>&nbsp;
                    <input type="hidden" name="approvedCurrencies" value="<%=approvedCcy[i]%>"/>
                </td>
                <td><integro:empty-if-null value="<%=leIDs[i]%>"/>&nbsp;
                    <input type="hidden" name="leIDs" value="<%=leIDs[i]%>"/></td>
                <td nowrap="nowrap"><integro:empty-if-null value="<%=leNames[i]%>"/>&nbsp;
                    <input type="hidden" name="leNames" value="<%=leNames[i]%>"/></td>

<% try { %>
<td nowrap="nowrap"><integro:empty-if-null value="<%=securityIDs[i]%>"/>&nbsp;
    <input type="hidden" name="coSecurityIDs" value="<%=securityIDs[i]%>"/></td>
<td>
    <%
        if (isDAP[i].equals("Y")) {
    %>
    100<%--integro:empty-if-null value="<%=requiredSecurityCoverages[i]%>"/--%>&nbsp;

    <input type="hidden" name="coRequiredSecurityCoverages" value="<%=requiredSecurityCoverages[i]%>"/>
    <%
    } else {
    %>
    <html:text property="coRequiredSecurityCoverages" value="<%=requiredSecurityCoverages[i]%>" readOnly="true" />
    <html:errors property="<%=secCoveragesError%>"/>

    <%
        }
    %>
</td>

<td><integro:empty-if-null value="<%=limitSecurityLinkages[i]%>"/>&nbsp;
    <input type="hidden" name="coLimitSecurityLinkages" value="<%=limitSecurityLinkages[i]%>"/></td>
<td nowrap="nowrap"><integro:empty-if-null value="<%=securityTypes[i]%>"/>&nbsp;
    <input type="hidden" name="coSecurityTypes" value="<%=securityTypes[i]%>"/></td>
<td nowrap="nowrap"><integro:empty-if-null value="<%=securityLocations[i]%>"/>&nbsp;
    <input type="hidden" name="coSecurityLocations" value="<%=securityLocations[i]%>"/></td>
<td nowrap="nowrap"><integro:empty-if-null value="<%=coSecurityOrganizations[i]%>"/>&nbsp;
    <input type="hidden" name="coSecurityOrganizations" value="<%=coSecurityOrganizations[i]%>"/></td>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</tr>


<input type="hidden" name="limitIDs" value="<%=limitIDs[i]%>"/>
<input type="hidden" name="isDAP" value="<%=isDAP[i]%>"/>
<%
    }
%>
<tr class="odd">
    <td colspan="2" class="fieldname">Limit reduced to Zero</td>
    <td>
        <html:multibox property="isZerorised" value="Y" onclick="changeStatus();"/>
        <!--	<input type="checkbox" name="isZerorised" value="<%=limitZerorised%>" <%="Y".equals(limitZerorised)?"checked":""%> onclick="changeStatus();"/> -->
    </td>
    <td colspan="2" class="fieldname">Date Limit reduced to Zero&nbsp;<font color="#0000FF"><span
            id="span1">&nbsp;</span></font></td>
    <td colspan="2"><html:text property="zerorisedDate" value="<%=zerorisedDate%>" readonly="true"/>
        <img src="img/calendara.gif" name="Image11" border="0" id="Image11"
             onclick="return showCalendar('zerorisedDate', 'dd/mm/y'); "
             onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
        <html:errors property="zerorisedDateError"/>
    </td>
    <script language="JavaScript" type="text/JavaScript">
        disableImage();
    </script>
    <td colspan="13">&nbsp;</td>
</tr>
<tr class="odd">
    <td colspan="2" class="fieldname">Reason for Limit Reduced to Zero&nbsp;<font color="#0000FF"><span id="span2">&nbsp;</span>
    </font></td>
    <td colspan="6"><html:textarea property="zerorisedReason" onkeyup="checkTextSize()" rows="4" cols="140"
                                   value="<%=reason%>"/>
        <span id="warningRemarks"></span>
        <br><html:errors property="reasonError"/></td>
    <td colspan="6">&nbsp;</td>
</tr>
<%
    if (event != null && event.equals("re_process_co_borrower_limits")) {
%>
<tr>
    <td colspan="14">&nbsp;</td>
</tr>

<tr class="even">
    <td colspan="2" class="fieldname">Remarks</td>
    <td colspan="6"><integro:empty-if-null value="<%=remarks%>"/>&nbsp;</td>
    <td colspan="6">&nbsp;</td>
</tr>
<%
    }
%>
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
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1"
                                                                                width="75" height="22" border="0"
                                                                                id="Image1"/></a></td>
        <%
            if (event != null && event.equals("re_process_co_borrower_limits")) {
        %>
        <td width="100" valign="baseline" align="center"><a href="ToDo.do" onmouseout="MM_swapImgRestore()"
                                                            onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
                src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
        <%
        } else {
        %>
        <td width="100" valign="baseline" align="center"><a href="javascript:returnPage();"
                                                            onmouseout="MM_swapImgRestore()"
                                                            onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
                src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
        <%
            }
        %>
    </tr>
</table>
</html:form>
</body>
</html>