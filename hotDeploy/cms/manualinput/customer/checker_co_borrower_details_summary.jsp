<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm,
				com.integrosys.cms.ui.manualinput.customer.CoBorrowerDetailsForm,
				java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
List<CoBorrowerDetailsForm> coBorrowerList = form.getCoBorrowerDetails();
pageContext.setAttribute("coBorrowerList", coBorrowerList);
%>

<script type="text/javascript">

</script>
		<tr id="coBorrowerDetailsBlockHeader" >
			
			<td align="right">
				<h3 align="left">Co-Borrower Details</h3>
			</td>
			
			<tr id="coBorrowerDetailsBlock" >
				<td>
					<table border="0" cellpadding="0" cellspacing="0"
						class="tblinfo" style="margin-top: 0" width="100%"
						align="center">
						<thead>
							<tr>
								<td>S/N</td>
								<td>Co-Borrower Liab Id</td>
								<td>Co-Borrower Name</td>
							</tr>
						</thead>
						<tbody>
							<logic:present name="coBorrowerList">
								<logic:iterate id="coBorrower" name="coBorrowerList" indexId="coBorrowerIndex"
									type="com.integrosys.cms.ui.manualinput.customer.CoBorrowerDetailsForm" scope="page">
	
									<tr class="<%=(coBorrowerIndex++)%2 == 0 ? "even" : "odd" %>">
										<td class="index"><%=coBorrowerIndex%></td>
										<td>
											<center>
												<bean:write name="coBorrower" property="coBorrowerLiabId" />
											</center>
										</td>
										<td>
											<center>
												<bean:write name="coBorrower" property="coBorrowerName" />
											</center>
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
							<logic:notPresent name="coBorrowerList">
								<tr class="odd">
									<td colspan="8"><bean:message key="label.global.not.found" /></td>
								</tr>
							</logic:notPresent>
						</tbody>
					</table>
				</td>
			</tr>
		</tr>	