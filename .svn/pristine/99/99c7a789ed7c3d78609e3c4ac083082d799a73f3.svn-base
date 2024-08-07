<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CollateralSearchForm,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%

    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    CollateralSearchForm form_ad_common = (CollateralSearchForm) request.getAttribute("CollateralSearchForm");
    String advanceSearchType = form_ad_common.getAdvanceSearchType();
    String advanceSearchSubType = form_ad_common.getSecuritySubType();
    DefaultLogger.debug("advance_search_template.jsp --> ", "SearchType [" + advanceSearchType + "],SubType [" + advanceSearchSubType + "]");
%>
<% if (form_ad_common.getAdvanceSearch()
        && !"".equals(form_ad_common.getSecurityType())
        && !"".equals(form_ad_common.getSecuritySubType())) {
    if ((ICMSConstant.SECURITY_TYPE_ASSET.equals(advanceSearchType))
            || (ICMSConstant.SECURITY_TYPE_GUARANTEE.equals(advanceSearchType))
            || (ICMSConstant.SECURITY_TYPE_PROPERTY.equals(advanceSearchType))
            || (ICMSConstant.SECURITY_TYPE_MARKETABLE.equals(advanceSearchType))
            || (ICMSConstant.SECURITY_TYPE_INSURANCE.equals(advanceSearchType))
            || (ICMSConstant.SECURITY_TYPE_DOCUMENT.equals(advanceSearchType))
            || (ICMSConstant.SECURITY_TYPE_CASH.equals(advanceSearchType) )
            || (ICMSConstant.SECURITY_TYPE_OTHERS.equals(advanceSearchType))
       ) {
%>

     <jsp:include page="common_advance_search.jsp"/>

        <% if (ICMSConstant.SECURITY_TYPE_ASSET.equals(advanceSearchType)) { %>
            <jsp:include page="advance_search_assetbased.jsp"/>
        <%} else if (ICMSConstant.SECURITY_TYPE_GUARANTEE.equals(advanceSearchType)) {%>
            <jsp:include page="advance_search_gurantee.jsp"/>
        <%} else if (ICMSConstant.SECURITY_TYPE_PROPERTY.equals(advanceSearchType)) {%>
            <jsp:include page="advance_search_property.jsp"/>
        <%} %>

<%
        }
    } %>

<br>