<%@ page import="com.integrosys.cms.ui.common.FrequencyList" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%
String strSubType = (String)pageContext.getAttribute("strSubType");
if(strSubType==null)
{
strSubType = "";
}

%>
<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013--> 
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isPhysicalInspection")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/><span class="mandatoryPerfection">*</span>&nbsp;</td><%--<span class="mandatoryPerfection">*</span></td>--%>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol.getIsPhysicalInspection()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        if (isProcess) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreq")||(iCol.getPhysicalInspectionFreq() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreqUnit");
        }
    %>
    <td class="<%=isProcess?(physicalUpdated?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
        <%if (iCol.getIsPhysicalInspection()) {%>
        &nbsp;<%--<span class="mandatory">*</span>
        --%><%}%>
    </td>
 
        <% if (iCol.getPhysicalInspectionFreqUnit() != null) { %>
      <td>  <integro:common-code-single entryCode="<%=iCol.getPhysicalInspectionFreqUnit()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% } else{ %>
        <td>-&nbsp;</td>
        <%} %>
       
        
    
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.last.phy.verification.date"/><span class="mandatoryPerfection">*</span>
        <%if (iCol.getIsPhysicalInspection()) {%>
        &nbsp;<%}%></td>
        <%if(iCol.getLastPhysicalInspectDate()!=null){ %>
    <td><integro:date object="<%=iCol.getLastPhysicalInspectDate()%>"/>&nbsp;</td>
    <%}else{ %>
     <td>-&nbsp;</td>
    <%} %>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
    <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
    <%if(iCol.getNextPhysicalInspectDate()!=null){ %>
    <td><integro:date object="<%=iCol.getNextPhysicalInspectDate()%>"/>&nbsp;</td>
    <%}else{ %>
     <td>-&nbsp;</td>
    <%} %>
    
</tr>
<!--End by Pramod Katkar-->  
