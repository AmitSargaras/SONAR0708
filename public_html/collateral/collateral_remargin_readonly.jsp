<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.collateral.RiskMitigationList"%>
<tr class="odd">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remargin")?"fieldname":"fieldnamediff"):"fieldname"%>">Remargining</td>
    <td>
    <%
        String remarginStr = null;
        if (iCol.getRemargin() != null && (ICMSConstant.TRUE_VALUE).equals(iCol.getRemargin()))
        {
            remarginStr = "Yes";
        } else if (iCol.getRemargin() != null){
            remarginStr = "No";
        }
    %>
    <integro:empty-if-null value="<%=remarginStr%>" />&nbsp;
<%--    <integro:empty-if-null value="<%=(iCol.getRemargin() != null && (ICMSConstant.TRUE_VALUE).equals(iCol.getRemargin()))?"Yes":"No"%>" />&nbsp;--%>
    </td>

    <td class="fieldname">&nbsp;</td>
    <td>&nbsp;
    </td>
</tr>

<tr class="even">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastRemarginDate")?"fieldname":"fieldnamediff"):"fieldname"%>">Last Remargining Date</td>
    <td>
        <integro:date object="<%=iCol.getLastRemarginDate()%>" />&nbsp;
    </td>

    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextRemarginDate")?"fieldname":"fieldnamediff"):"fieldname"%>">Next Remargining Date</td>
    <td><integro:date object="<%=iCol.getNextRemarginDate()%>" />&nbsp;
    </td>
</tr>

<tr class="odd">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"riskMitigationCategory")?"fieldname":"fieldnamediff"):"fieldname"%>">Risk Mitigation Category in SFA</td>
    <td><% if (iCol.getRiskMitigationCategory() != null) { %>
                    <integro:empty-if-null value="<%=RiskMitigationList.getInstance().getRiskMitigationItem(iCol.getRiskMitigationCategory().trim())%>"/><% } %>&nbsp;</td>

    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"extSeniorLien")?"fieldname":"fieldnamediff"):"fieldname"%>">External Senior Lien</td>
    <td>
    <%
        String extStr = null;
        if (iCol.getExtSeniorLien() != null && (ICMSConstant.TRUE_VALUE).equals(iCol.getExtSeniorLien()))
        {
            extStr = "Yes";
        } else if (iCol.getExtSeniorLien() != null){
            extStr = "No";
        }
    %>
    <integro:empty-if-null value="<%=extStr%>" />&nbsp;
    </td>
</tr>