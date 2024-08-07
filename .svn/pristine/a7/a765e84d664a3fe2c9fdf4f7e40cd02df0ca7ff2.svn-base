<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.cms.ui.collateral.LEList"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLE")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.legal.enforceability"/>&nbsp;<span class="mandatoryPerfection">*</span> </td>
    <td width="30%">
        <% if (!(iCol == null)) { %>
            <integro:empty-if-null value="<%=LEList.getInstance().getLEItem(iCol.getIsLE())%>"/>
        <% } %> &nbsp;</td>
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lEDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.legal.enforceability.date"/>&nbsp; </td>
    <td width="30%">
        <% if (!(iCol == null)) { %>
            <integro:date object="<%=iCol.getLEDate()%>"/>
        <% } %>&nbsp;</td>
</tr>


<script language="JavaScript" type="text/JavaScript">
    <!--
    function setENFORCE_DATE(obj) {
		if (document.getElementById("spanENFORCE_DATE") == null || document.getElementById("spanENFORCE_DATE") == "null" || document.getElementById("spanENFORCE_DATE") == '')
			return;
	
        if (obj == 'Y') {
            document.getElementById("spanENFORCE_DATE").style.visibility = "visible";
       }  else {
            document.getElementById("spanENFORCE_DATE").style.visibility = "hidden";
        }
    }

    var s = "<%=iCol.getIsLE()%>";
    setENFORCE_DATE(s);
-->
</script>
