<%@ page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.gtegovtlink.IFeeDetails"%>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.fee.details" /></h3></td>
            <td align="right" valign="baseline">
                <input class="btnNormal" type="button" name="Submit1" value="Add New" onclick="javascript:submitPage(3, -1)"/>&nbsp;
                <input class="btnNormal" type="button" name="Submit2" value="Remove" onclick="javascript:submitPage(5, 0)"/>
            </td>
        </tr>
	    <tr>
			<td colspan="2"><hr/></td>
	    </tr>
	</thead>
	<tbody>
				<tr>
					<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="FeeDetailsInput">
							<thead>
								<tr>
									<td width="5%"><bean:message key="label.global.sn"/></td>
									<td width="20%"><bean:message key="label.fee.details.effective.date"/></td>
									<td width="20%"><bean:message key="label.fee.details.expiration.date"/></td>
									<td width="28%"><bean:message key="label.fee.details.guarantee.amount"/></td>
									<td width="15%"><bean:message key="label.global.action"/></td>
									<td width="12%"><bean:message key="label.global.delete"/></td>
								</tr>
							</thead>
							<tbody>
								<%
									Locale localy1 = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
									String conversion1 = null;
									CurrencyCode curencycy1 = null;
									if (!event.equals("create")) {
										conversion1 = SecuritySubTypeUtil.getConversionCcy(iCol);
										curencycy1 = new CurrencyCode(conversion1);
									}

									IFeeDetails[] iFeeDetails = iCol.getFeeDetails();
									String classtype_w = "odd";

									if (iFeeDetails != null) {
										if (iFeeDetails.length == 0) {
								%>
									<tr class="<%=classtype_w%>">
										<td colspan="6">
											<bean:message key="label.fee.detail.infor.none"/>
										</td>
									</tr>

								<%	}
								
									for (int counter = 0; counter < iFeeDetails.length; counter++) {
								%>
									<tr class="<%=classtype_w%>">
										<td class="index"><%=counter + 1%></td>
										<td>
											<% if (iFeeDetails[counter].getEffectiveDate() != null) { %>
											<integro:date object="<%=iFeeDetails[counter].getEffectiveDate()%>"/>
											<% } %> &nbsp;
											&nbsp;</td>
										<td>
											<% if (iFeeDetails[counter].getExpirationDate() != null) { %>
											<integro:date object="<%=iFeeDetails[counter].getExpirationDate()%>"/>
											<% } %> &nbsp;
											&nbsp;</td>
										<td>
										<%if(iFeeDetails[counter].getAmountFee()!=null){ %>
											<integro:empty-if-null value="<%=UIUtil.getConvertAmountStr(iFeeDetails[counter].getAmountFee(), iFeeDetails[counter].getAmountFee().getCurrencyCodeAsObject(), localy1)%>"/>
										<% }%>
											&nbsp;</td>

										<td>
											<a href="FeeDetails.do?&formActionName=<%=formActionName %>&event=prepare_update&indexID=<%=counter%>&subtype=<%=subtype%>">Edit</a>
										</td>
										<td style="text-align: center;"><html:multibox property="deleteItem" value="<%=String.valueOf(counter)%>"/></td>
									</tr>
									<%
										if (classtype_w.equals("odd")) {
											classtype_w = "even";
										} else {
											classtype_w = "odd";
										}
									}
									} else { 
									%>

									<tr class="<%=classtype_w%>">
										<td colspan="6">
											<bean:message key="label.fee.detail.infor.none"/>
										</td>
									</tr>

									<% } %>
							</tbody>
						</table>
					</td>
				</tr>
	</tbody>
</table>

