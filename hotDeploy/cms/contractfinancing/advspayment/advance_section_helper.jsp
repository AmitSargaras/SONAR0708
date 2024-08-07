<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
            <td colspan="2"><bean:message key="label.advancepayment.advance.section"/></td>
        </tr>
    </thead>
    <tbody>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.advancepayment.type.of.facility"/></td>
            <td>
                <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(request.getParameter("facilityType"))%>
                &nbsp;
            </td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.advancepayment.reference.no"/></td>
            <td><%=obAdvance.getReferenceNo()%>&nbsp;</td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.advancepayment.drawdown.date"/></td>
            <td><integro:date object="<%=obAdvance.getDrawdownDate()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.advancepayment.tenor"/></td>
            <td>
                <%=obAdvance.getTenor()%> <%=obAdvance.getTenorUOM()%>&nbsp;
            </td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.advancepayment.amount"/></td>
            <td><integro:amount param="all" amount="<%=obAdvance.getAmount()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.advancepayment.advanced.amount"/></td>
            <td><integro:amount param="all" amount="<%=obAdvance.getAdvanceAmount()%>" />   
            </td>
        </tr>
        <tr class="odd">
            <td width="20%" class="fieldname"><bean:message key="label.advancepayment.expiry.date"/></td>
            <td width="30%"><integro:date object="<%=obAdvance.getExpiryDate()%>"/>&nbsp;</td>
        </tr>
    </tbody>
</table>