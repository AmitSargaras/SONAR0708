
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.cms.app.limit.bus.OBLimitProfile"%>
<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@ page import="com.integrosys.cms.app.common.StpTrxStatusReadyIndicator"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page
	import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="java.util.*"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>
<%@page import="com.integrosys.cms.app.collateral.bus.ICollateral"%>
<%@page import="com.integrosys.cms.app.collateral.bus.support.CollateralLimitEntry"%>
<%@page
	import="com.integrosys.cms.ui.collateral.CollateralLoadingUiHelper"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<html>
<head>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function MM_jumpMenu(targ,selObj,restore){ //v3.0
		eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		if (restore) selObj.selectedIndex=0;
	}
	function selected(selectObj, limitId) {
		if (1 == selectObj.selectedIndex) {
			document.forms[0].event.value = "";
			document.forms[0].cmsLimitId.value = limitId;
			document.forms[0].submit();
		}
		else if (2 == selectObj.selectedIndex) {
			document.forms[0].event.value = "<%=ICommonEventConstant.EVENT_DELETE%>"
	;
			document.forms[0].cmsLimitId.value = limitId;
			document.forms[0].submit();
		}
	}
</script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 0;
	String styleFieldname = "fieldname";

	Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	OBLimitProfile limitProfile = (OBLimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	Map collateralLimitMap = (Map) request.getAttribute("collateralLimitMap");
	Set entrySet = collateralLimitMap.entrySet();
	if (entrySet != null) {
		pageContext.setAttribute("entrySet", entrySet);
	}

	Map collateralIdStatusMap = (Map) request.getAttribute("collateralIdStatusMap");
	if (collateralIdStatusMap == null) {
		collateralIdStatusMap = Collections.EMPTY_MAP;
	}
	
	Map collateralLimitEntryStatusMap = (Map) request.getAttribute("collateralLimitEntryStatusMap");
	Map collateralIdEditableMap = (Map) request.getAttribute("collateralIdEditableMap");
	Map collateralIdDeletableMap = (Map) request.getAttribute("collateralIdDeletableMap");
	
	Long fromLimitProfileId = (Long) request.getAttribute("fromLimitProfileId");

	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long membershipID = Long.parseLong(teamTypeMemID);		
%>
<body>
<table width="97%" cellspacing="0" cellpadding="0" border="0"
	class="tblFormSection" align="center">
	<thead>
		<tr>
			<td>
			<h3><bean:message key="title.collateral.loading" /></h3>
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			<hr>
			</td>
		</tr>
		<tr>
			<td>
			<table width="100%" height="100%" cellspacing="0" cellpadding="0"
				border="0" class="tblInfo">
				<thead>
					<tr>
						<td colspan="4"><bean:message
							key="label.facility.customer.details" /></td>
					</tr>
				</thead>
				<tbody>
					<tr class="<%=style[count++ % 2]%>">
						<td class="<%=styleFieldname%>"><bean:message
							key="label.facility.cif" /></td>
						<td><%=customer.getCMSLegalEntity().getLEReference()%></td>
						<td class="<%=styleFieldname%>"><bean:message
							key="label.facility.customer.name" /></td>
						<td><%=customer.getCustomerName()%></td>
					</tr>
					<tr class="<%=style[count++ % 2]%>">
						<td class="<%=styleFieldname%>"><bean:message
							key="label.facility.aa.ref.no" /></td>
						<td colspan="3"><%=limitProfile.getBCAReference()%></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			<hr>
			</td>
		</tr>
		<%
			//reset table row style counter
			count = 0;
		%>
		<tr>
			<td>
			<table width="100%" height="100%" cellspacing="0" cellpadding="0"
				border="0" class="tblInfo">
				<thead>
					<tr>
						<td colspan="5" width="40%"><bean:message
							key="label.collateral.details" /></td>
						<td colspan="3" width="30%"><bean:message
							key="label.facility.details" /></td>
						<td rowspan="2" width="10%"><bean:message key="label.status" /></td>
						<td rowspan="2" width="10%"><bean:message
							key="label.facility.ready.stp" /></td>
						<td rowspan="2" width="10%"><bean:message
							key="label.global.action" /></td>
					</tr>
					<tr>
						<td width="2%"><bean:message key="label.global.sn" /></td>
						<td width="8%"><bean:message
							key="label.collateral.originating.source" /></td>
						<td width="10%"><bean:message key="label.security.id" /></td>
						<td width="10%"><bean:message
							key="label.collateral.type.subtype" /></td>
						<td width="10%"><bean:message key="label.collateral.sibs.id" /></td>
						<td width="10%"><bean:message key="label.limit.id" /></td>
						<td width="10%"><bean:message
							key="label.facility.product.type" /></td>
						<td width="10%"><bean:message
							key="label.pledge.approved.limit" /></td>
					</tr>
				</thead>
				<tbody>
					<logic:empty name="entrySet">
						<tr class="odd">
							<td colspan="11"><bean:message key="label.global.not.found" /></td>
						</tr>
					</logic:empty>
					<logic:notEmpty name="entrySet">

						<%
							int indexId = 1;
								for (Iterator iter = entrySet.iterator(); iter.hasNext(); indexId++) {
									Map.Entry mapEntry = (Map.Entry) iter.next();
									ICollateral collateral = (ICollateral) mapEntry.getKey();
									List limitList = (List) mapEntry.getValue();
									int limitListSize = 1;
									ILimit limit = null;
									if (limitList != null) {
										limitListSize = limitList.size();
										limit = (ILimit) limitList.get(0);
									}
									
									for (int l = 0; l < limitList.size(); l++) {
										ILimit tempLimit = (ILimit) limitList.get(l);
										CollateralLimitEntry entry = new CollateralLimitEntry(collateral.getCollateralID(), tempLimit.getLimitID());
										String hostStatus = (String) collateralLimitEntryStatusMap.get(entry);
										if (ICMSConstant.HOST_STATUS_DELETE.equals(hostStatus)) {
											if (limitListSize != 1) {
												limitListSize--;
											}
										}
									}
									CollateralLimitEntry firstEntry = new CollateralLimitEntry(collateral.getCollateralID(), limit.getLimitID());
									String firstEntryHostStatus = (String) collateralLimitEntryStatusMap.get(firstEntry);
									if (ICMSConstant.HOST_STATUS_DELETE.equals(firstEntryHostStatus)) {
										if (limitList.size() > 1) {
											limit = (ILimit)limitList.get(1);
											CollateralLimitEntry thisEntry = new CollateralLimitEntry(collateral.getCollateralID(), limit.getLimitID());
											String thisEntryStatus = (String) collateralLimitEntryStatusMap.get(thisEntry);
											if (ICMSConstant.HOST_STATUS_DELETE.equals(thisEntryStatus)) {
												limit = null;
											}
										}
										else {
											limit = null;
										}
									}
									
						%>
						<tr class="<%=style[count % 2]%>">
							<td rowspan="<%=limitListSize%>" class="index"><%=indexId%></td>
							<td rowspan="<%=limitListSize%>"><integro:empty-if-null
								value="<%=collateral.getSourceId()%>" /></td>
							<td rowspan="<%=limitListSize%>"><%=collateral.getCollateralID()%></td>
							<td rowspan="<%=limitListSize%>"><%=collateral.getCollateralType().getTypeName()%>
							- <%=collateral.getCollateralSubType().getSubTypeName()%></td>
							<td rowspan="<%=limitListSize%>"><integro:empty-if-null
								value="<%=collateral.getSCISecurityID()%>" /></td>
							<td><%=limit != null ? String.valueOf(limit.getLimitID()) : "-"%></td>
							<td>
							<%
								if (limit != null) {										
					        %>
							<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limit.getProductCode() %>" descWithCode="false"/>&nbsp;
							<%
								} else {
							%>-<%
								}
							%>
							</td>
							<td><%=limit != null ? CollateralLoadingUiHelper.convertAmountToString(limit
							.getApprovedLimitAmount(), locale) : "-"%></td>
							<%
								StpTrxStatusReadyIndicator colStpTrxStatusReadyIndicator = (StpTrxStatusReadyIndicator) collateralIdStatusMap.
									get(new Long(collateral.getCollateralID()));
							%>
							<td rowspan="<%=limitListSize%>"><%=colStpTrxStatusReadyIndicator.getTrxStatus()%></td>
							<td rowspan="<%=limitListSize%>"><integro:boolean-display value="<%=colStpTrxStatusReadyIndicator.isStpReadyIndicator()%>" style="yn" /></td>
							<%
								Long theCollateralId = new Long(collateral.getCollateralID());
								Boolean isEditable = (Boolean) collateralIdEditableMap.get(theCollateralId);
								Boolean isDeletable = (Boolean) collateralIdDeletableMap.get(theCollateralId);
							
								if (Boolean.TRUE.equals(isEditable)) {
							%>
							<td rowspan="<%=limitListSize%>"><select
								onchange="MM_jumpMenu('self',this,0)">
								<option value="#"><bean:message
									key="label.please.select" /></option>
								<option
									value="<%=SecuritySubTypeUtil.getUrl(collateral.getCollateralSubType().getSubTypeCode(),
									"prepare_update", 2) + "&collateralID=" + collateral.getCollateralID()
							+ "&frameRequested=true&fromLimitProfileId=" + fromLimitProfileId + "&from=" + CollateralAction.COLLATERALLOADING%>"><bean:message
									key="label.view.edit" /></option>
									<% if (Boolean.TRUE.equals(isDeletable)) { %>
								<option
									value="<%=SecuritySubTypeUtil.getUrl(collateral.getCollateralSubType().getSubTypeCode(), "prepare_delete", 2)
							+ "&collateralID=" + collateral.getCollateralID() + "&frameRequested=true&fromLimitProfileId=" + fromLimitProfileId + "&from="
							+ CollateralAction.COLLATERALLOADING%>"><bean:message
									key="label.global.delete" /></option>
									<% } %>
							</select></td>
							<%
								}
								else {
							%>
							<td rowspan="<%=limitListSize%>">
								<a href="<%=SecuritySubTypeUtil.getUrl(collateral.getCollateralSubType().getSubTypeCode(),
									"read", 2) + "&collateralID=" + collateral.getCollateralID()
							+ "&frameRequested=true&from=" + CollateralAction.COLLATERALLOADING %>"><bean:message
									key="label.view" /></a>
							</td>
							<%  } %>
						</tr>
						<%
							for (int i = 1;  i < limitListSize; i++) {
										limit = (ILimit) limitList.get(i);
						%>
						<tr class="<%=style[count % 2]%>">
							<td><%=limit != null ? String.valueOf(limit.getLimitID()) : "-"%></td>
							<td>
							<%
								if (limit != null) {
							%>
								<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limit.getProductCode() %>" descWithCode="false"/>&nbsp;
							<%
								}
											else {
							%>-<%
								}
							%>
							</td>
							<td><%=limit != null ? CollateralLoadingUiHelper.convertAmountToString(limit
								.getApprovedLimitAmount(), locale) : "-"%></td>
						</tr>
						<%
							}
						%>
						<%
							count++;
							}
						%>
					</logic:notEmpty>

				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>
</body>
</html>