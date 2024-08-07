<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 com.integrosys.cms.app.bridgingloan.bus.OBBridgingLoan,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.Locale" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="java.util.HashMap" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ILimitProfile user = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

    String collectionAccount = "";
    String projectAccount = "";
    String projectNumber = "";
    IBridgingLoanTrxValue bridgingLoanTrxValue = (IBridgingLoanTrxValue) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanTrxValue");
    if (bridgingLoanTrxValue != null) {
        OBBridgingLoan OBBridgingLoan = (OBBridgingLoan) bridgingLoanTrxValue.getStagingBridgingLoan();
        collectionAccount = OBBridgingLoan.getCollectionAccount();
        projectAccount = OBBridgingLoan.getProjectAccount();
        projectNumber = OBBridgingLoan.getProjectNumber();
    }

    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="1%" nowrap="nowrap">&nbsp; </td>
        <td width="99%" colspan="12" nowrap="nowrap" id="contentTitleBar">
            <label>AA Number: </label>
            <label id="txtContentTitle"><%=user.getBCAReference()%></label>&nbsp;
            <img src="img/icon/seprate_bar.gif" height="12"/>
            &nbsp;
            <label>Approved Date:</label>
            <label id="txtContentTitle"><%=DateUtil.formatDate(locale, user.getApprovalDate())%></label>&nbsp;
            <img src="img/icon/seprate_bar.gif" height="12"/>
            &nbsp;
            <label>Coll A/C No:</label>
            <label id="txtContentTitle"><integro:empty-if-null value="<%=collectionAccount%>"/></label>&nbsp;
            <img src="img/icon/seprate_bar.gif" height="12"/>
            &nbsp;
            <label>Project A/C No:</label>
            <label id="txtContentTitle"><integro:empty-if-null value="<%=projectAccount%>"/></label>&nbsp;

            <br>
            <label>Project No:</label>
            <label id="txtContentTitle"><integro:empty-if-null value="<%=projectNumber%>" /></label>&nbsp;
        </td>
    </tr>
</table>