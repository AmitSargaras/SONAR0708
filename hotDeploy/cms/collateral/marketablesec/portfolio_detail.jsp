<%@ page import="com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquityDetail,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.CommonCodeList"%>

<%
	//IMarketableEquityDetail[] detailOB = (IMarketableEquityDetail[]) request.getAttribute("equityDetail");
	//pageContext.setAttribute("equityDetailOB", detailOB);
%>

<table width="98%" border="0" align="center" cellpadding="0"
	cellspacing="0" class="tblFormSection" style="margin-top: 10px">
	<thead>
		<tr>
			<td>
			<h3>Portfolio Details</h3>
			</td>
			<td width="50%" align="right" valign="baseline"></td>
		</tr>
		<tr>
			<td colspan="2">
			<hr />
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tblInput">
				<thead>
					<tr>
						<td width="3%"><bean:message key="label.global.sn"/></td>
						<td width="30%"><bean:message key="label.marketsec.port.detail.sharetype"/></td>
						<td width="24%"><bean:message key="label.marketsec.port.detail.transactiondate"/></td>
						<td width="24%"><bean:message key="label.marketsec.port.detail.signofunits"/></td>
						<td width="23%"><bean:message key="label.marketsec.port.detail.noofunits"/></td>

					</tr>
				</thead>
				<tbody>
			<% int count = 1; %>	
			 <logic:present name="equityDetail" >	
		   		<logic:iterate id="detail" name="equityDetail"  type="com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquityDetail"  >
					<tr class="odd">
						<td class="index"><%=count++ %></td>
						<td><%=CommonCodeList.getInstance(CategoryCodeConstant.PORTFOLIO_SHARETYPE).getCommonCodeLabel(detail.getShareType())%></td>
						<td><integro:date object="<%=detail.getTransactionDate()%>" /> </td>
						<td><integro:empty-if-null value="<%=detail.getUnitSign()%>"/></td>
						<td><integro:empty-if-null value="<%=String.valueOf(detail.getNoOfUnits())%>"/></td>
					</tr>
				</logic:iterate>
			  </logic:present>
			  <logic:notPresent name="equityDetail" >
				<tr class="odd">
                	<td colspan="5"><bean:message key="label.marketsec.port.detail.noportfolio" /></td>
                </tr>			  
			  </logic:notPresent>		
			<% if (request.getAttribute("equityDetail") != null) {
					IMarketableEquityDetail[] detailOB = (IMarketableEquityDetail[]) request.getAttribute("equityDetail");
					
					if (detailOB.length == 0) {
			%>		
				<tr class="odd">
                	<td colspan="5"><bean:message key="label.marketsec.port.detail.noportfolio" /></td>
                </tr>
            <% } } %>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>