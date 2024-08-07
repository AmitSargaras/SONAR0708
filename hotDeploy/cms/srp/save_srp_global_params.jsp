<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header$
     *
     * This page will display the results of updating the security parameters
     * via Global Parameters.
     *
     * @author $Author$<br>
     * @version $Revision$
     * @since $Date$
     * Tag: $Name$
     */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table>
<logic:iterate id="collateralSubType"
        name="collateral.subtypes.list"
        type="com.integrosys.cms.app.collateral.bus.ICollateralSubType">
    <tr>
    <!--
    <td><%=collateralSubType.getSubTypeCode()%></td>
    <td><%=collateralSubType.getSubTypeName()%></td>
    <td><%=collateralSubType.getSubTypeDesc()%></td>
    -->
    <td><%=collateralSubType.getMaxValue()%></td>
    </tr>
</logic:iterate>
</table>