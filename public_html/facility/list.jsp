
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@ page import="com.integrosys.cms.app.common.StpTrxStatusReadyIndicator"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="java.util.*"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.base.businfra.currency.Amount"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>

<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
		eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		if (restore) selObj.selectedIndex=0;
	}

	function selected(selectObj, limitId) {
		if (1 == selectObj.selectedIndex) {
			document.forms[0].event.value = "<%=FacilityMainAction.EVENT_VIEW_EDIT %>";
			document.forms[0].cmsLimitId.value = limitId;
			document.forms[0].submit();
		}
		else if (2 == selectObj.selectedIndex) {
			document.forms[0].event.value = "cancel_facility";
			document.forms[0].cmsLimitId.value = limitId;
			document.forms[0].submit();
		}
	}
</script>
<%
	Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	ICMSCustomer customer = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	List listLimits = (List) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.listLimits");
	ILimit[] limits = (ILimit[]) listLimits.toArray(new ILimit[0]);
	
	Map limitIdStatusMap = (Map) request.getAttribute("limitIdStatusMap");
	if (limitIdStatusMap == null) {
		limitIdStatusMap = Collections.EMPTY_MAP;
	}
	
	if (limits != null) {
		pageContext.setAttribute("limits", limits);
	}
	List listLimitWoCollateral = (List) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.listLimitWoCollateral");
	if (listLimitWoCollateral != null) {
		pageContext.setAttribute("listLimitWoCollateral", listLimitWoCollateral);
	}
    
    for (int i = 0; i < limits.length; i++) {
        ILimit limit = (ILimit) limits[i];
        System.out.println("Chee Hong : " + limit.getProductCode());
    }
	String[] style = { "even", "odd" };
	
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long membershipID = Long.parseLong(teamTypeMemID);	
%>
</head>
<body>
<html:form action="FacilityMain.do">
	<html:hidden property="event"/>
	<input type="hidden" name="cmsLimitId">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3><bean:message key="label.facility.header" /></h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<thead>
						<tr>
							<td colspan="4" style="text-align: left"><bean:message
								key="label.facility.customer.details" /></td>
						</tr>
					</thead>
					<tbody>
						<tr class="even">
							<td height="22" class="fieldname" width="24%"><bean:message
								key="label.facility.cif" /> <br>
							</td>
							<td width="26%"><%=customer.getCMSLegalEntity().getLEReference()%></td>
							<td class="fieldname" width="24%"><bean:message
								key="label.facility.customer.name" /> <br>
							</td>
							<td width="26%"><%=customer.getCustomerName()%></td>
						</tr>
						<tr class="odd">
							<td class="fieldname" width="23%"><bean:message
								key="label.facility.aa.ref.no" /></td>
							<td width="27%" colspan="3"><%=limitProfile.getBCAReference()%></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3>&nbsp;</h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td colspan="10" style="text-align: left"><bean:message
								key="label.facility.details" /></td>
						</tr>
						<tr>
							<td width="3%"><bean:message key="label.global.sn" /></td>
							<td width="3%"><bean:message key="label.facility.limit.id" /></td>
							<td width="3%"><bean:message key="label.facility.acf.no" /></td>
							<td width="8%"><bean:message key="label.facility.sibs.code" /></td>
							<td width="8%"><bean:message key="label.facility.sibs.seq" /></td>
							<td width="10%"><bean:message
								key="label.facility.product.type" /></td>
							<td width="10%"><bean:message
								key="label.limit.approved.limit" /></td>
							<td width="8%"><bean:message key="label.status" /></td>
							<td width="8%"><bean:message key="label.facility.ready.stp" /></td>
							<td width="10%"><bean:message key="label.global.action" /></td>
						</tr>
					</thead>
					<tbody>
						<logic:empty name="limits">
							<tr>
								<td colspan="9"><bean:message key="label.global.not.found" /></td>
							</tr>
						</logic:empty>
						<logic:notEmpty name="limits">
							<%
								int count = 0;
										Amount totalAmount = new Amount(0, limits[0].getApprovedLimitAmount().getCurrencyCode());
							%>
							<logic:iterate id="limit" name="limits"
								type="com.integrosys.cms.app.limit.bus.ILimit">
								<tr class="<%=style[count%2] %>">
									<td class="index"><%=++count%></td>
									<td><%=limit.getLimitID()%></td>
									<td><integro:empty-if-null value="<%=limit.getAcfNo()%>" /></td>
									<td><integro:empty-if-null
										value="<%=limit.getFacilityCode()%>" /></td>
									<td><%=limit.getFacilitySequence()%></td>
									<td><integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limit.getProductCode() %>" descWithCode="false"/>&nbsp;</td>
									<td style="text-align: right"><%=limit.getApprovedLimitAmount().getCurrencyCode()%>&nbsp;<%=limit.getApprovedLimitAmount().formatOutputString(locale)%>
									<%
										totalAmount.addToThis(limit.getApprovedLimitAmount());
									%>
									</td>
									<%
										StpTrxStatusReadyIndicator facStpTrxStatusReadyIndicator = (StpTrxStatusReadyIndicator) limitIdStatusMap
												.get(new Long(limit.getLimitID()));
										if (facStpTrxStatusReadyIndicator == null) {
											facStpTrxStatusReadyIndicator = new StpTrxStatusReadyIndicator();
										}

										String status = facStpTrxStatusReadyIndicator.getTrxStatus();
										if (status == null) {
											status = "New";
										}
									%>
									<td style="text-align: center"><%=status%></td>
									<td style="text-align: center"><integro:boolean-display value="<%=facStpTrxStatusReadyIndicator.isStpReadyIndicator()%>" style="yn" /></td>
									<% if ((membershipID == ICMSConstant.TEAM_TYPE_SSC_MAKER 
									||membershipID == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
									||membershipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I
									||membershipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
									) && 
											(ICMSConstant.STATE_ACTIVE.equals(facStpTrxStatusReadyIndicator.getOriginalTrxStatus()) || 
											facStpTrxStatusReadyIndicator.getOriginalTrxStatus() == null)) { %>
									<td style="text-align: center"><select
										onchange="selected(this,'<%=limit.getLimitID() %>')">
										<option><bean:message key="label.please.select" /></option>
										<option><bean:message key="label.view.edit" /></option>
									</select></td>
									<% } else {%>
										<td style="text-align: center">
											<a href="FacilityMaster.do?event=master_view&cmsLimitId=<%=limit.getLimitID() %>"><bean:message key="label.view"/></a>
										</td>
									<% } %>
								</tr>
							</logic:iterate>
							<tr>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total" style="text-align: right; padding-right: 3px"><bean:message
									key="label.common.total" /></td>
								<td class="total" style="text-align: right; padding-right: 3px"><%=totalAmount.getCurrencyCode()%>&nbsp;<%=totalAmount.formatOutputString(locale)%></td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
							</tr>
						</logic:notEmpty>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3><bean:message key="title.facility.wo.collateral" /></h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td colspan="10" style="text-align: left"><bean:message
								key="label.facility.details" /></td>
						</tr>
						<tr>
							<td width="3%"><bean:message key="label.global.sn" /></td>
							<td width="3%"><bean:message key="label.facility.limit.id" /></td>
							<td width="3%"><bean:message key="label.facility.acf.no" /></td>
							<td width="8%"><bean:message key="label.facility.sibs.code" /></td>
							<td width="8%"><bean:message key="label.facility.sibs.seq" /></td>
							<td width="10%"><bean:message
								key="label.facility.product.type" /></td>
							<td width="10%"><bean:message
								key="label.limit.approved.limit" /></td>
							<td width="8%"><bean:message key="label.status" /></td>
							<td width="8%"><bean:message key="label.facility.ready.stp" /></td>
							<td width="10%"><bean:message key="label.global.action" /></td>
						</tr>
					</thead>
					<tbody>
						<logic:empty name="listLimitWoCollateral">
							<tr>
								<td colspan="10"><bean:message key="label.global.not.found" /></td>
							</tr>
						</logic:empty>
						<logic:notEmpty name="listLimitWoCollateral">
							<%
								int count = 0;
										Amount totalAmount = new Amount(0, limits[0].getApprovedLimitAmount().getCurrencyCode());
							%>
							<logic:iterate id="limitWoCollateral" name="listLimitWoCollateral"
								type="com.integrosys.cms.app.limit.bus.ILimit">
								<tr class="<%=style[count%2] %>">
									<td class="index"><%=++count%></td>
									<td><%=limitWoCollateral.getLimitID()%></td>
									<td><integro:empty-if-null value="<%=limitWoCollateral.getAcfNo()%>" /></td>
									<td><integro:empty-if-null
										value="<%=limitWoCollateral.getFacilityCode()%>" /></td>
									<td><%=limitWoCollateral.getFacilitySequence()%></td>
									<td>                                                                                                                          
									<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limitWoCollateral.getProductCode() %>" descWithCode="false" />&nbsp;
									</td>
									<td style="text-align: right"><%=limitWoCollateral.getApprovedLimitAmount().getCurrencyCode()%>&nbsp;<%=limitWoCollateral.getApprovedLimitAmount().formatOutputString(locale)%>
									<%
										totalAmount.addToThis(limitWoCollateral.getApprovedLimitAmount());
									%>
									</td>
									<%
										StpTrxStatusReadyIndicator cleanFacStpTrxStatusReadyIndicator = (StpTrxStatusReadyIndicator) limitIdStatusMap
												.get(new Long(limitWoCollateral.getLimitID()));
										if (cleanFacStpTrxStatusReadyIndicator == null) {
											cleanFacStpTrxStatusReadyIndicator = new StpTrxStatusReadyIndicator();
										}

										String status = cleanFacStpTrxStatusReadyIndicator.getTrxStatus();							
									
										if (status == null) {
											status = "New";
										}
									%>
									<td style="text-align: center"><%=status%></td>
									<td style="text-align: center"><integro:boolean-display value="<%=cleanFacStpTrxStatusReadyIndicator.isStpReadyIndicator()%>" style="yn" />&nbsp;</td>
									<td style="text-align: center">
									<a href="FacilityMaster.do?event=master_view&cmsLimitId=<%=limitWoCollateral.getLimitID() %>"><bean:message key="label.view"/></a></td>
								</tr>
							</logic:iterate>
							<tr>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total" style="text-align: right; padding-right: 3px"><bean:message
									key="label.common.total" /></td>
								<td class="total" style="text-align: right; padding-right: 3px"><%=totalAmount.getCurrencyCode()%>&nbsp;<%=totalAmount.formatOutputString(locale)%></td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
								<td class="total">&nbsp;</td>
							</tr>
						</logic:notEmpty>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>