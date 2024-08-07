<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>

<script type="text/javascript">
	function submitForm(event) {
		document.forms[0].event.value = event;
		document.forms[0].submit();
	}

	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	}	
	
	function setCancelRejectDateMandatory() {
	    var facStatus = document.forms[0].facilityStatus.value;
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
	        document.forms[0].cancelRejectDate.value='';
		}
	}	
</script>

<%
	String[] style = { "even", "odd" };
	int count = 0;
	
	String event = request.getParameter("event");
%>

<html:form action="FacilityReduction.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab"/>
	<input type="hidden" name="key" value='<%=request.getParameter("key")%>'/>
	
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.reduction" /> &nbsp;
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
							<td width="30%"><bean:write name="FacilityReductionForm" property="sequenceNumber"/>&nbsp;</td>
							<td width="20%" class="fieldname"><span class="stp">
								<bean:message key="label.facility.incremental.amt.applied"/></span>
								<bean:message key="label.mandatory" />
							</td>				
							<td width="30%">
								<html:text property="amountApplied"/>
								<html:errors property="amountApplied"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.incremental.amount"/> </span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<html:text property="incrementalReductionLimit"/>
								<html:errors property="incrementalReductionLimit"/>
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.original.limit"/></span>
							</td>
							<td><bean:write name="FacilityReductionForm" property="originalLimit"/></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered"/></span>							
							</td>
							<td>
								<bean:write name="FacilityReductionForm" property="dateEntered"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.application.date"/></span>
								<bean:message key="label.mandatory" />								
							</td>
							<td>
								<html:text property="applicationDate" maxlength="11" size="12" readonly="true"></html:text>
								<img src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('applicationDate', 'dd/mm/y');" />		
								<html:errors property="applicationDate"/>				
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.offer.accepted"/></span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<html:text property="offerAcceptanceDate" maxlength="11" size="12" readonly="true"></html:text>
								<img src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('offerAcceptanceDate', 'dd/mm/y');" />		
								<html:errors property="offerAcceptanceDate"/>								
							</td>										
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.approved"/></span>
								<bean:message key="label.mandatory" />
							</td>			
							<td>
								<html:text property="approvedDate" maxlength="11" size="12" readonly="true"></html:text>
								<img src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('approvedDate', 'dd/mm/y');" />		
								<html:errors property="approvedDate"/>								
							</td>	
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.approved.by"/></span>
								<bean:message key="label.mandatory" />
							</td>								
							<td>
								<html:select property="approvedBy" >
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.APPROVED_BY%>" />
								</html:select> 
								<html:errors property="approvedBy" />							
							</td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.cancel.reject.code" /></span>
								<span id="cancelCodeMandatoryID"><bean:message key="label.mandatory"/></span>
							</td>
							<td><html:select property="cancelRejectCode">
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.CANC_REJ_CODE%>" />
								</html:select>
								<html:errors property="cancelRejectCode"/>
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.cancel.reject.date" /> </span>
                                <span id="cancelDateMandatoryLabelID"><bean:message key="label.mandatory" /></span>
                            </td>
							<td>
								<span id="cancelDateMandatoryID">
                                <html:text property="cancelRejectDate" maxlength="11" size="12" readonly="true"></html:text>
								<img src="img/calendara.gif" name="cldr" border="0"
									onClick="return showCalendar('cancelRejectDate', 'dd/mm/y');" />     
								</span>                          
                                <html:errors property="cancelRejectDate" />                                
                            </td>
						</tr>							
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.status" /></span>
								<bean:message key="label.mandatory" />
							</td>
							<td><html:select property="facilityStatus" onchange="setCancelRejectDateMandatory()" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FACILITY_STATUS%>" />
								</html:select> 
								<html:errors property="facilityStatus" />
							</td>	
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>	
						</tr>	
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.instructed" /></span>
							</td>
							<td>
								<html:text property="instructedDate" maxlength="11" size="12" readonly="true"></html:text>
									<img src="img/calendara.gif" name="cldr" border="0"
										onClick="return showCalendar('instructedDate', 'dd/mm/y');" />		
								<html:errors property="instructedDate"/>	      							
							</td>
							<td class="fieldname"><span class="stp">
								<bean:message key="label.facility.solicitor.reference" /></span>
							</td>
							<td>
								<html:text property="solicitorReference"/>
								<html:errors property="solicitorReference"/>
							</td>
						</tr>	
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.solicitor.name" /></span>
							</td>
							<td>
								<html:text property="solicitorName"/>
								<html:errors property="solicitorName"/>
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.offer" /></span>
							</td>
							<td>
								<bean:write name="FacilityReductionForm" property="offerEnterDate"/>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.applied" /></span>
							</td>
							<td>
								<bean:write name="FacilityReductionForm" property="appliedEnterDate"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.approved" /></span>
							</td>
							<td>
								<bean:write name="FacilityReductionForm" property="approveEnterDate"/>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.offer.accepted" /></span>
							</td>
							<td>
								<bean:write name="FacilityReductionForm" property="offerAcceptedEnterDate"/>&nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.entered.cancel.rejected" /></span>
							</td>
							<td>
								<bean:write name="FacilityReductionForm" property="cancelRejectEnterDate"/>&nbsp;
							</td>							
						</tr>		
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.request.reason" /></span>
								<bean:message key="label.mandatory"/>
							</td>
							<td>
								<html:select property="requestReasonCode">
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.REQUEST_REASON_CODE%>" descWithCode="true" />
								</html:select>
                            	<html:errors property="requestReasonCode"/>							
							</td>		
							<td class="fieldname">
								<span class="stp"><bean:message key="label.documentation.status" /></span>
							</td>
							<td>
								<html:select property="docStatus">
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.LMT_STATUS%>" descWithCode="true" />
								</html:select>
                            	<html:errors property="docStatus"/>							
							</td>													
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.date.user.entered.dc.status" /></span>
							</td>
							<td>
								<html:text property="dateUserEnterDocStatus" maxlength="11" size="12" readonly="true"></html:text>
									<img src="img/calendara.gif" name="cldr" border="0"
										onClick="return showCalendar('dateUserEnterDocStatus', 'dd/mm/y');" />		
								<html:errors property="dateUserEnterDocStatus"/>	    							
							</td>		
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.lawyer.code" /></span>
							</td>
							<td>
								<html:select property="lawyerCode">
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.SOLICITOR%>" descWithCode="true" />
								</html:select>
                            	<html:errors property="lawyerCode"/>							
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
				<table width="150" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<%
							String updateEvent = "";
							String listEvent = "";
							if (FacilityMainAction.EVENT_EDIT.equals(event) ||
									FacilityMainAction.EVENT_UPDATE.equals(event)) {
								updateEvent = FacilityMainAction.EVENT_UPDATE;
								listEvent = FacilityMainAction.EVENT_LIST;
							} else {
								updateEvent = FacilityMainAction.EVENT_UPDATE_WO_FRAME;
								listEvent = FacilityMainAction.EVENT_LIST_WO_FRAME;
							}
						%>
						<td width="75" valign="baseline" align="center">
							<a href="#" onclick="submitForm('<%=updateEvent %>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)">
								<img src="img/ok1.gif" name="Image3311" border="0" id="Image331"/> </a>
						</td>
						<td width="75" valign="baseline" align="center">
							<a href="#" onclick="submitForm('<%=listEvent %>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a>
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
<br/>