<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.collateral.CollateralAction" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
	boolean isTrack = (new Boolean(request.getParameter("trackInd"))).booleanValue();
	boolean isDeleting = (new Boolean(request.getParameter("deletingInd"))).booleanValue(); 

	String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
	String fromPage = (String)session.getAttribute(ipinPath+".from_page");

	boolean isPrepareDelete = CollateralAction.EVENT_PREPARE_DELETE.equals(fromPage);

	String secType = request.getParameter("secType");
%>

<thead>
    <tr>
		<td colspan="2"><h3>
    <% if (isTrack) { %>
      	<bean:message key="label.view"/>
	<% } else if (isPrepareDelete) { %>
		<bean:message key="label.global.delete"/>
      <% } else { %>
      	<bean:message key="label.close"/>
      <% } %>
		&nbsp;<bean:message key="title.security"/>&nbsp;-&nbsp;
		<% if ("AB".equals(secType)) { %>
		<bean:message key="label.security.asset.based"/>
		<% } else if ("CS".equals(secType)) { %>
		<bean:message key="label.security.cash"/>
		<% } else if ("DC".equals(secType)) { %>
		<bean:message key="label.security.documentation"/>
		<% } else if ("GT".equals(secType)) { %>
		<bean:message key="label.security,guarantees"/>
		<% } else if ("IN".equals(secType)) { %>
		<bean:message key="label.security.insurance.protection"/>
		<% } else if ("MS".equals(secType)) { %>
		<bean:message key="label.security.marketable.securities"/>
		<% } else if ("CL".equals(secType)) { %>
		<bean:message key="label.security.no.col"/>
		<% } else if ("OT".equals(secType)) { %>
		<bean:message key="label.security.others"/>
		<% } else if ("PT".equals(secType)) { %>
		<bean:message key="label.security.property.title"/>
		<% } %>
		</h3></td>
    </tr>
</thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>