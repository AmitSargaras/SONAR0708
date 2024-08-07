<%@page
	import="com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
				com.integrosys.cms.ui.manualinput.limit.FacCoBorrowerDetailsForm,
				com.integrosys.cms.app.customer.bus.ICoBorrowerDetails,
				com.integrosys.cms.ui.manualinput.limit.LmtDetailAction,
				java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
LmtDetailForm form = (LmtDetailForm) request.getAttribute("LmtDetailForm");
pageContext.setAttribute("LmtDetailForm", form);

String facCoBorrowerLiabIds = form.getFacCoBorrowerLiabIds() == null ? "" : form.getFacCoBorrowerLiabIds();

List<FacCoBorrowerDetailsForm> facCoBorrowerList = form.getFacCoBorrowerList();
pageContext.setAttribute("facCoBorrowerList", facCoBorrowerList);

%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top: 10px">
	<thead>
		<tr>
			<td><h3>Co-Borrower Details</h3></td>
		</tr>	
	</thead>
	<tbody>
		<tr >
			<td>
				<table border="0" cellpadding="0" cellspacing="0" class="tblInput" style="margin-top: 0" width="100%" id="facCoborrower_table">
					<thead>
						<tr>
							<td>S/N</td>
							<td>Co-Borrower Liab Id</td>
							<td>Co-Borrower Name</td>
						</tr>
					</thead>
					<tbody>
						<logic:present name="facCoBorrowerList">
							<logic:iterate id="facCoBorrower" name="facCoBorrowerList"
								indexId="facCoBorrowerIndex"
								type="com.integrosys.cms.ui.manualinput.limit.FacCoBorrowerDetailsForm"
								scope="page">

								<tr class="<%=(facCoBorrowerIndex++) % 2 == 0 ? "even" : "odd"%>">
									<td class="index"><%=facCoBorrowerIndex%></td>
									<td>
										<center>
											<bean:write name="facCoBorrower" property="coBorrowerLiabId" />
										</center>
									</td>
									<td>
										<center>
											<bean:write name="facCoBorrower" property="coBorrowerName" />
										</center>
									</td>
									
								</tr>
							</logic:iterate>
						</logic:present>
						<logic:notPresent name="facCoBorrowerList">
							<tr class="odd" id="noRecordsLabel_row">
								<td colspan="4"><bean:message key="label.global.not.found" /></td>
							</tr>
						</logic:notPresent>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
