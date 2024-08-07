<%@ page import="com.integrosys.cms.app.collateral.bus.type.nocollateral.INoCollateral" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.ui.common.CountryList"%>
<%@ page import="java.util.*"%>

<%
    INoCollateral oldCollateral = (INoCollateral) itrxValue.getCollateral();
    INoCollateral newCollateral = (INoCollateral) itrxValue.getStagingCollateral();

    String prefix = "NoCollateral";
    String subtype = "NoCollateral";
    String formActionName = "NoCollateral.do";
    String valuationDate = null;

%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>

					<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
					<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
                </tbody>
            </table>
        </td>
    </tr>
    <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
</tbody>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>


<%-- <%@ include file="/collateral/view_pledge_read.jsp" --%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>


