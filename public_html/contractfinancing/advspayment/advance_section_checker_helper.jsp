<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
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
            <td class="<%=CompareOBUtil.compOB(obAdvance,obActualAdvance,"referenceNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.reference.no"/></td>
            <td><%=obAdvanceDetail.getReferenceNo()%>&nbsp;</td>
        </tr>
        <tr class="odd">
            <td class="<%=CompareOBUtil.compOB(obAdvance,obActualAdvance,"drawdownDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.drawdown.date"/></td>
            <td><integro:date object="<%=obAdvanceDetail.getDrawdownDate()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
            <td class="<%=CompareOBUtil.compOB(obAdvance,obActualAdvance,"tenorUOM")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.tenor"/></td>
            <td>
                <%=obAdvanceDetail.getTenor()%> <%=obAdvanceDetail.getTenorUOM()%>&nbsp;
            </td>
        </tr>
        <tr class="odd">
            <%
                Amount stagingAmt = (obAdvance == null) ? null : obAdvance.getAmount();
                Amount actualAmt = (obActualAdvance == null) ? null : obActualAdvance.getAmount();
            %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.amount"/></td>
            <td><integro:amount param="all" amount="<%=obAdvance.getAmount()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
            <%
                stagingAmt = (obAdvance == null) ? null : obAdvance.getAdvanceAmount();
                actualAmt = (obActualAdvance == null) ? null : obActualAdvance.getAdvanceAmount();
            %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.advanced.amount"/></td>
            <td><integro:amount param="all" amount="<%=obAdvanceDetail.getAdvanceAmount()%>" />
            </td>
        </tr>
        <tr class="odd">
            <td width="20%" class="<%=CompareOBUtil.compOB(obAdvance,obActualAdvance,"expiryDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.expiry.date"/></td>
            <td width="30%"><integro:date object="<%=obAdvanceDetail.getExpiryDate()%>"/>&nbsp;</td>
        </tr>
    </tbody>
</table>