<%@ page import="com.integrosys.cms.ui.collateral.SecEnvRiskyList"%>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyStatus")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.sec.env.liability"/>
       
    </td>
    <td> 
        <% if (newCollateral.getEnvRiskyStatus() != null) { %>
            <integro:empty-if-null value="<%=SecEnvRiskyList.getInstance().getSecEnvRiskyItem(newCollateral.getEnvRiskyStatus().trim())%>"/>
        <%} else{ %>
            -
        <% }%>
    </td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.date.sec.confirm.env.risk"/>&nbsp;
        <span id="span_ENVRISKY_DATE"></span>
    </td>
    <td><integro:date object="<%=iCol.getEnvRiskyDate()%>"/>&nbsp;</td>
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
    String EnvRiskyStatus = iCol.getEnvRiskyStatus() ;
    if (EnvRiskyStatus != null){
        EnvRiskyStatus = EnvRiskyStatus.trim();
    }
   %>
    var s = "<%=EnvRiskyStatus%>";
    spanENVRISKY_DATE(s);
-->
</script>