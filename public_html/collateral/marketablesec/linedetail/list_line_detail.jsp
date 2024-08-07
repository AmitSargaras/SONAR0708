<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableCollateral"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.OBMutualFundsFeedEntry"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.Constants"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.AbstractCommonMapper"%>
<%@page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%
List lineDetailList = null;
Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);
Boolean editMode = new Boolean(request.getParameter("editMode"));
Boolean isProcess = new Boolean(request.getParameter("isProcess"));

if(isProcess){
	IMarketableEquity stagingOB = (IMarketableEquity)request.getAttribute("stageEquity");
	IMarketableEquity originOB = (IMarketableEquity) request.getAttribute("actualEquity");
	if((originOB == null || originOB.getLineDetails() == null) && (stagingOB == null || stagingOB.getLineDetails() == null)){
		lineDetailList = (List)session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST);
	}
	else{
		lineDetailList = CompareOBUtil.compOBArray( stagingOB.getLineDetails(),	(originOB == null || originOB.getLineDetails() == null) ? null : originOB.getLineDetails());		
	}
}else{
	lineDetailList = (List)session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST);
}

pageContext.setAttribute("editMode", editMode);
pageContext.setAttribute("isProcess", isProcess);
pageContext.setAttribute(IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST, lineDetailList);

String from_event = (String) request.getParameter("from_event");
String subtype = (String) request.getParameter("subtype");
String indexID = (String) request.getAttribute("indexID");

%>
<head>
	 <script language="JavaScript" type="text/JavaScript">
	 
	 function submitLineDetailPage(num, index, obj) {
		 if(num == 1) {
			 document.forms[0].action = "MarketPortItem.do";
			 document.forms[0].event.value="<%=subtype.toLowerCase()+"_"+MarketableEquityLineDetailAction.EVENT_PREPARE_CREATE_LINE_DETAIL%>";
		 }
		 if(num == 4){
			 document.forms[0].action = "MarketableEquityLineDetail.do";
			 if(obj.value == 'Edit'){
				 document.forms[0].event.value="<%=MarketableEquityLineDetailAction.EVENT_PREPARE_EDIT_LINE_DETAIL%>";
			 }
			 if(obj.value == 'Delete'){
				 if( confirm("Are you sure to delete this record ? ")){
					 document.forms[0].event.value="<%=MarketableEquityLineDetailAction.EVENT_DELETE_LINE_DETAIL%>";	 
				 }
				 else{
					 obj.selectedIndex=0;
					 return;
				 }
			 }
			 if(obj.value == 'View'){
				 document.forms[0].event.value="<%=MarketableEquityLineDetailAction.EVENT_VIEW_LINE_DETAIL%>";
			 }
			 document.forms[0].selectedItem.value = index;
		 }
		 document.forms[0].submit();
	 }
	 
	 </script>
</head>
<input type="hidden" name="selectedItem"/>
<input type = "hidden" name="schemeName" value="<%=request.getParameter("schemeName")%>"/>
<input type = "hidden" name="schemeType" value="<%=request.getParameter("schemeType")%>"/>
<input type = "hidden" name="startDate" value="<%=request.getParameter("startDate")%>"/>
<input type = "hidden" name="endDate" value="<%=request.getParameter("endDate")%>"/>
<input type = "hidden" name="nominalValue" value="<%=request.getParameter("nominalValue")%>"/>

<%System.out.println("schemeName "+request.getParameter("schemeName"));%>
<!-- <input type="hidden" name="event"/> -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	<thead>
	    <tr>
	        <td>
	        	<h3><bean:message key="label.security.line.details"/></h3>
	        </td>
	        <logic:equal value="true" name="editMode">
		        <td align="right" valign="baseline">
		        
				    <input class="btnNormal" type="button" name="lineDetailsSubmit" value="Add New" onclick="javascript:submitLineDetailPage(1)"/>
			    </td>
		    </logic:equal>
	    </tr>
	    <tr>
	        <td colspan="2"><hr/></td>
	    </tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
					<thead>
						<tr>
							<td width="5%"> <bean:message  key="label.global.sn"/> </td>
							<td width="15%"> <bean:message  key="label.security.line.number"/> </td>
							<td width="15%"> <bean:message  key="label.security.serial.no"/> </td>
							<td width="10%"> <bean:message  key="label.security.fas.number"/> </td>
							<td width="20%"> <bean:message  key="label.security.ltv"/> </td>
							<td width="20%"> <bean:message  key="label.security.remarks"/> </td>
							<td width="11%"> <bean:message key ="label.global.action"/></td>
						</tr>
					</thead>
					<tbody>
					<% int srNo = 0; %>
					<logic:present name="<%=IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST%>">
							<logic:iterate id="genericLineDetail" name="<%=IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST%>"
								 scope="page" indexId="index">
								 <%
								 	srNo++;
								 	IMarketableEquityLineDetail lineDetail = null;
								    String key = "index";
								 %>
								 
								 <logic:equal value="true" name="isProcess">
								 	<%
									 	CompareResult result = (CompareResult) genericLineDetail;
									 	key = result.getKey();
									 	lineDetail = (IMarketableEquityLineDetail) result.getObj();
								 	%>
								 </logic:equal>
								 <logic:equal value="false" name="isProcess">
								 	<%
								 		lineDetail = (IMarketableEquityLineDetail) genericLineDetail;
								 	%>
								 </logic:equal>
								 
								 	<tr class="<%=(index % 2 )!= 0 ? "odd" : "even"%>">
									<td class="<%=key%>"><%= srNo%></td>
									<td><%=StringUtils.isBlank(lineDetail.getLineNumber()) ? "-" : lineDetail.getLineNumber() %></td>
									<td><%=StringUtils.isBlank(lineDetail.getSerialNumber()) ? "-" : lineDetail.getSerialNumber() %></td>
									<td><%=StringUtils.isBlank(lineDetail.getFasNumber()) ? "-" : lineDetail.getFasNumber() %></td>
									<td><%=(lineDetail.getLtv() != null && lineDetail.getLtv()>0) ? lineDetail.getLtv() : "-" %></td>
									<td><%=StringUtils.isBlank(lineDetail.getRemarks()) ? "-" : lineDetail.getRemarks() %> </td>
									<td style="text-align: center;">
										<logic:equal value="true" name="editMode">
											<select onchange="submitLineDetailPage(4,'<%=index%>', this)">
												<option value="">-<bean:message key="label.select"/>-</option>
												<option value="View">View</option>
												<option value="Edit">Edit</option>
												<option value="Delete">Delete</option>
											</select>
										</logic:equal>
										<logic:equal value="false" name="editMode">
											<select onchange="javascript:location.href = this.value;">
												<option value="">-<bean:message key="label.select"/>-</option>
												<option value="MarketableEquityLineDetail.do?event=view_line_detail&refId=<%=lineDetail.getRefID()%>&from_event=<%=from_event%>&subtype=<%=subtype%>&indexID=<%=indexID%>">View</option>
											</select>
										</logic:equal>
									</td>
								</tr>
							</logic:iterate>
					</logic:present>
					<logic:notPresent name="<%=IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST%>">
						<tr class="odd">
                        	<td colspan="13" style="text-align:center"><bean:message key="label.no.records.found"/></td>
                    	</tr>
                    </logic:notPresent>	
					</tbody>
				</table>
				
			</td>
		</tr>
	</tbody>
</table>