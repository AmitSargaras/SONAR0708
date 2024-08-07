<%@page
	import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm,
com.integrosys.cms.ui.manualinput.customer.CoBorrowerDetailsForm"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
CoBorrowerDetailsForm form = (CoBorrowerDetailsForm) request.getAttribute("CoBorrowerDetailsForm");
pageContext.setAttribute("CoBorrowerDetailsForm", form);
%>

<script type="text/javascript">

function cancelCoBorrowerDetails() {
	document.forms[0].action = "coBorrowerDetails.do?event=return_co_borrower_details";
	document.forms[0].submit();
}
	
</script>
<html:form method="post" action="coBorrowerDetails.do">
	<table width="65%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="100%" valign="bottom">
					<table width="100%" border="0" align="right" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="100%">
								<h3>Co-Borrower Details</h3>
								
								<hr />

								<table class="tblFormSection" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
									style="margin-top: 0">
									<tbody>
										<tr>
											<td><br />
												<table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
													style="margin-top: 0">
													<tbody>
														<tr class="even">
															<td width="20%" class="fieldname">Co-Borrower Liab Id</td>
															<td width="30%">&nbsp;
																<bean:write name="CoBorrowerDetailsForm" property="coBorrowerLiabId" />
															</td>
															<td width="20%" class="fieldname">Co-Borrower Name</td>
															<td width="30%">&nbsp;
																<bean:write name="CoBorrowerDetailsForm" property="coBorrowerName" />
															</td>
														</tr>
												</table></td>
										</tr>
									</tbody>
								</table>

								<table width="150" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class="makerOnly"><a
											href="javascript:cancelCoBorrowerDetails();"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('img_cancel','','img/cancel2.gif',1)">
												<img src="img/cancel1.gif" name="img_cancel" border="0" />
										</a></td>
									</tr>

								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</thead>
	</table>
</html:form>