<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>

<%@ page import="com.integrosys.cms.ui.collateral.SecEnvRiskyList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
        <bean:message key="label.security.sec.env.liability"/>&nbsp;</td>
    <td> 
        <% if (propertyValuation2.getEnvironmentRiskyStatus() != null) { %>
            <integro:empty-if-null value="<%=SecEnvRiskyList.getInstance().getSecEnvRiskyItem(propertyValuation2.getEnvironmentRiskyStatus().trim())%>"/>
        <%} else{ %>
            -
        <% }%>
    </td>
    <td class="fieldname">
        <bean:message key="label.security.date.sec.confirm.env.risk"/>&nbsp;
        <span id="span_ENVRISKY_DATE"><span class="mandatory">*</span></span>
    </td>
    <td><integro:date object="<%=propertyValuation2.getEnvironmentRiskDate()%>"/>&nbsp;</td>
</tr>


<script language="JavaScript" type="text/JavaScript">
    <!--
    function spanENVRISKY_DATE(obj) {
        if (obj == 'Y') {
            document.getElementById("span_ENVRISKY_DATE").style.visibility = "visible";
       }  else {
            document.getElementById("span_ENVRISKY_DATE").style.visibility = "hidden";
        }
    }
   <%
    String EnvRiskyStatus = propertyValuation2.getEnvironmentRiskyStatus() ;
    if (EnvRiskyStatus != null){
        EnvRiskyStatus = EnvRiskyStatus.trim();
    }
   %>
    var s = "<%=EnvRiskyStatus%>";
    spanENVRISKY_DATE(s);
-->
</script>
