<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.OBCustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierForm" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="java.util.Locale" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    Locale locale1 = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    CustGrpIdentifierForm aFormMGEL = (CustGrpIdentifierForm) request.getAttribute("CustGrpIdentifierForm");
    if (aFormMGEL == null) {
        aFormMGEL = new CustGrpIdentifierForm();
    }
%>

<html:hidden property="currencyCD"/>
<html:hidden property="internalLmt"/>
<html:hidden property="groupLmt"/>
<html:hidden property="lastReviewDt"/>
<html:hidden property="approvedBy"/>
<html:hidden property="remarks"/>

<table width="98%" align="center">
    <tr>
        <td><h3><bean:message key="label.group.mgel"/></h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
    <tbody>
        <tr>
            <td width="18%"></td>
            <td width="34%"></td>
            <td width="15%"></td>
            <td width="33%"></td>
        </tr>
        <tr class="even">
            <td class='fieldname'>
                <bean:message key="label.group.bgel.ind"/> &nbsp;</td>
            <td>
                <%=(StringUtils.equals(aFormMGEL.getIsBGELInd(), "Y")?"Yes":"No")%> &nbsp;
            </td>
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr class="odd">
            <td class='fieldname'>
                <bean:message key="label.group.currency"/><span class="mandatory"> * </span> &nbsp;</td>
            <td width="34%"><%=CustGrpIdentifierUIHelper.getCodeDesc(aFormMGEL.getCurrencyCD(), ICMSUIConstant.ISO_CUR)%>
                &nbsp;</td>
            <td class='fieldname'>
                <bean:message key="label.group.internal.limit"/><span class="mandatory"> * </span></td>
            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(aFormMGEL.getInternalLmt(), ICMSUIConstant.INT_LMT_APPLY)%>
                &nbsp; </td>
        </tr>
        <tr class="even">
            <td class='fieldname'>
                <bean:message key="label.group.last.review.date"/> <span class="mandatory"> * </span> &nbsp;</td>
            <td>
                <% String lastReviewDt = UIUtil.mapOBDate_FormString(locale1, stagingObj.getLastReviewDt()); %>
                <integro:empty-if-null value="<%=lastReviewDt%>"/> &nbsp;</td>
            <td class='fieldname'>
                <bean:message key="label.group.limit"/> <span class="mandatory"> * </span> &nbsp;</td>
            <td>
                <%
                    String groupLmt = "-";
                    if (stagingObj.getGroupLmt() != null && stagingObj.getGroupLmt().getCurrencyCode() != null) {
                        groupLmt = UIUtil.formatNumber(stagingObj.getGroupLmt().getAmountAsBigDecimal(), 0, locale1);
                        out.print(stagingObj.getGroupLmt().getCurrencyCode() + " ");
                    }
                %>
                <%=groupLmt%>&nbsp; </td>
        </tr>
        <tr class="odd">
            <td class='fieldname'>
                <bean:message key="label.security.remarks"/></td>
            <td colspan="3">
                <%
                    String disRemarks = "-";
                    if (stagingObj.getGroupRemarks() != null && !"".equals(stagingObj.getGroupRemarks())) {
                        disRemarks = stagingObj.getGroupRemarks().trim();
                %>
                <integro:wrapper value="<%=disRemarks%>"/>
            <%} else {%>
            <integro:empty-if-null value="<%=disRemarks%>"/>
            <%}%>
            </td>
        </tr>

</table>