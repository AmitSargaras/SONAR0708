<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header$
     *
     * This page will display the results of updating the security parameters
     * via Country Specific Parameters.
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
<logic:iterate id="collateralParameter"
        name="collateral.parameters.list"
        type="com.integrosys.cms.app.collateral.bus.ICollateralParameter">
        <tr>
        <td><%=collateralParameter.getCountryIsoCode()%></td>
        <td><%=collateralParameter.getSecuritySubTypeId()%></td>
        <td><%=collateralParameter.getThresholdPercent()%></td>
        <td><%=collateralParameter.getValuationFrequency()%></td>
        <td><%=collateralParameter.getValuationFrequencyUnit()%></td>
        </tr>
</logic:iterate>
</table>