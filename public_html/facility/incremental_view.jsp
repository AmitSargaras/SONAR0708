<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.OBFacilityIncremental" %>
<%@page import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction" %>
<%@page import="com.integrosys.cms.ui.limit.facility.incremental.FacilityIncrementalForm" %>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>

<%
	String[] style = { "even", "odd" };
	int count = 0;
	
	OBFacilityIncremental incrementalStaging = (OBFacilityIncremental) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.sessionFacIncrementalObj");
	
	OBFacilityIncremental incrementalActual = (OBFacilityIncremental)request.getAttribute("facilityIncrementalActual");
	
	String event = request.getParameter("event");
	
	boolean isProcess = false;
	if (FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER_PROCESS.equals(event)) {
		isProcess = true;
	}	
	
	FacilityIncrementalForm form = (FacilityIncrementalForm)request.getAttribute("FacilityIncrementalForm");
%>

<script type="text/javascript">
	function submitForm(event) {
		document.forms[0].event.value = event;
		document.forms[0].submit();
	}

	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	}	
	
	function setCancelRejectDateMandatory() {
	    var facStatus = '<%=form.getFacilityStatus()%>';
	    if (facStatus != null &&
	    	    ('<%=ICMSConstant.FACILITY_STATUS_CANCELLED%>' == facStatus
	        || '<%=ICMSConstant.FACILITY_STATUS_REJECTED%>' == facStatus))
		{
			setVisibility("cancelDateMandatoryID","visible");
			setVisibility("cancelDateMandatoryLabelID","visible");
			setVisibility("cancelCodeMandatoryID","visible");
		}else{
			setVisibility("cancelDateMandatoryID","hidden");
			setVisibility("cancelDateMandatoryLabelID","hidden");
			setVisibility("cancelCodeMandatoryID","hidden");
		}
	}		
</script>

<html:form action="FacilityIncremental.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab"/>
	
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.incremental" /> &nbsp;
					<bean:message key="label.facility.limit"/></h3>
				</td>
				<td width="30%" align="right"><bean:message key="label.indicate.mandatory" /></td>
			</tr>	
			<tr>
				<td colspan="2">
				<hr>
				</td>
			</tr>				
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.incremental.number" /></span><bean:message
								key="label.mandatory" /></td>	
							<td width="30%"><bean:write name="FacilityIncrementalForm" property="sequenceNumber"/>&nbsp;</td>
							<td width="20%" 
								class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "AmountApplied")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.incremental.amt.applied"/></span>
								<bean:message key="label.mandatory" />
							</td>				
							<td width="30%">
								<bean:write name="FacilityIncrementalForm" property="amountApplied"/>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "IncrementalLimit")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.incremental.amount"/> </span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="incrementalReductionLimit"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.original.limit"/></span>
							</td>
							<td><bean:write name="FacilityIncrementalForm" property="originalLimit"/>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered"/></span>							
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="dateEntered"/>&nbsp;
							</td>
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "ApplicationDate")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.application.date"/></span>
								<bean:message key="label.mandatory" />								
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="applicationDate"/>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "LoanPurposeCodeEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.loan.purpose.code"/></span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<integro:common-code categoryCode="<%=CategoryCodeConstant.LOAN_PURPOSE%>" 
									entryCode="<%=form.getPurpose() %>" display="true"/> &nbsp;
							</td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>					
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateOfOffer")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.offer"/></span>
								<bean:message key="label.mandatory"/>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="offerDate"/>&nbsp;
							</td>						
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateOfferAccepted")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.offer.accepted"/></span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="offerAcceptanceDate"/>&nbsp;
							</td>										
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateApproved")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.approved"/></span>
								<bean:message key="label.mandatory" />
							</td>			
							<td>
								<bean:write name="FacilityIncrementalForm" property="approvedDate"/>&nbsp;
							</td>	
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "ApprovedByEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.approved.by"/></span>
								<bean:message key="label.mandatory" />
							</td>								
							<td>
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.APPROVED_BY%>" 
										entryCode="<%=form.getApprovedBy() %>" display="true"/>&nbsp;
							</td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "CancelRejectCodeEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.cancel.reject.code" /></span>
								<span id="cancelCodeMandatoryID"><bean:message key="label.mandatory"/></span>
							</td>
							<td>
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.CANC_REJ_CODE%>" 
										entryCode="<%=form.getCancelRejectCode() %>" display="true"/>&nbsp;
							</td>
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "CancelRejectDate")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.cancel.reject.date" /> </span>
                                <span id="cancelDateMandatoryLabelID"><bean:message key="label.mandatory" /></span>
                            </td>
							<td>
								<span id="cancelDateMandatoryID">
								<bean:write name="FacilityIncrementalForm" property="cancelRejectDate"/>&nbsp;
								</span>                                                          
                            </td>
						</tr>							
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "FacilityStatus")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.status" /></span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FACILITY_STATUS%>" 
									entryCode="<%=form.getFacilityStatus() %>" display="true"/>&nbsp;
							</td>		
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "PrimeReviewDate")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.prime.review.date"/></span>
							</td>		
							<td><bean:write name="FacilityIncrementalForm" property="primeReviewDate"/>&nbsp;</td>
						</tr>	
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "PrimeReviewTerm")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.prime.review.term"/></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="primeReviewTerm"/>&nbsp;
							</td>
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "PrimeReviewTermEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.prime.review.term.code"/></span>
							</td>
							<td>
									<integro:common-code categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE %>" 
										entryCode="<%=form.getPrimeReviewTermCode() %>" display="true"/>&nbsp;
							</td>							
						</tr>		
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DealerLLPCodeEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.dealer.number.llp.code" /></span></td>
							<td>
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.DEALER%>" descWithCode="true" 
										entryCode="<%=form.getDealerNumber() %>" display="true"/>&nbsp;
                            </td>	
                            <td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateSendToDecisionCenter")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
                            	<span class="stp"><bean:message key="label.facility.date.send.decision.center"/></span>                            	
                            </td>					
                            <td>
                            	<bean:write name="FacilityIncrementalForm" property="dateSendToDecisionCenter"/>&nbsp;
                            </td>
						</tr>		
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateReceiveFromDecisionCenter")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.receive.decision.center" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="dateReceiveFromDecisionCenter"/>&nbsp;
							</td>
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateApprovedByCGCBNM")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.approved.by.cgc/bnm" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="dateApproveByCGCBNM"/>&nbsp;
							</td>
						</tr>	
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DateInstructed")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.instructed" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="instructedDate"/>&nbsp;
							</td>
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "SolicitorReference")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>"><span class="stp">
								<bean:message key="label.facility.solicitor.reference" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="solicitorReference"/>&nbsp;
							</td>
						</tr>	
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "SolicitorName")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.solicitor.name" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="solicitorName"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.offer" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="offerEnterDate"/>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.applied" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="appliedEnterDate"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.approved" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="approveEnterDate"/>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.offer.accepted" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="offerAcceptedEnterDate"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.cancel.rejected" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="cancelRejectEnterDate"/>&nbsp;
							</td>							
						</tr>		
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "RequestReasonEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.request.reason" /></span>
								<bean:message key="label.mandatory"/>
							</td>
							<td>
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.REQUEST_REASON_CODE%>" descWithCode="true" 
										entryCode="<%=form.getRequestReasonCode() %>" display="true"/>&nbsp;
							</td>		
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DocumentationStatusEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.documentation.status" /></span>
							</td>
							<td>
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.LMT_STATUS%>" descWithCode="true" 
										entryCode="<%=form.getDocStatus() %>" display="true"/>&nbsp;
							</td>													
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "DocumentationDate")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.date.user.entered.dc.status" /></span>
							</td>
							<td>
								<bean:write name="FacilityIncrementalForm" property="dateUserEnterDocStatus"/>&nbsp;
							</td>		
							<td class="<%=isProcess?(!CompareOBUtil.compOB(incrementalActual, incrementalStaging, "LawyerCodeEntryCode")?ICMSUIConstant.STYLE_FIELDNAME_DIFF:ICMSUIConstant.STYLE_FIELDNAME):ICMSUIConstant.STYLE_FIELDNAME %>">
								<span class="stp"><bean:message key="label.facility.lawyer.code" /></span>
							</td>
							<td>
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.SOLICITOR%>" descWithCode="true" 
										entryCode="<%=form.getLawyerCode() %>" display="true"/>&nbsp;
							</td>														
						</tr>						
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
				<table width="75" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<%
							String returnEvent = "";
							if (FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER_PROCESS.equals(event)) {
								returnEvent = FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER_PROCESS;
							} else if (FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(event) ||
									FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER.equals(event) ||
									FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER.equals(event)) {
								returnEvent = FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER;
							} else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY.equals(event)) {
								returnEvent = FacilityMainAction.TAB_FACILITY_INCREMENTAL_VIEW_WO_FRAME;
							} else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY_WITH_FRAME.equals(event)) {
								returnEvent = FacilityMainAction.TAB_FACILITY_INCREMENTAL_VIEW;
							}
						%>
						<td width="75" valign="baseline" align="center">
							<a href="#" onclick="submitForm('<%=returnEvent %>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
								<img src="img/return1.gif" name="Image3311" border="0" id="Image331"/> </a>
						</td>
					</tr>
				</table>
				</td>
			</tr>			
		</tbody>		
	</table>
</html:form>

<script language="JavaScript" type="text/JavaScript">	
	setCancelRejectDateMandatory();
</script>