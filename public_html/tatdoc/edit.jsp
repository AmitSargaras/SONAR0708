<%@ page import="com.integrosys.cms.ui.tatdoc.TatDocAction"%>
<%@ page import="com.integrosys.cms.ui.tatdoc.TatDocForm"%>
<%@page import="com.integrosys.cms.app.tatdoc.trx.ITatDocTrxValue"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.function.bus.OBTeamFunctionGrp,
				 com.integrosys.cms.app.limit.bus.ILimitProfile,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 org.apache.commons.lang.StringUtils,
				 java.util.HashMap,
				 java.util.Locale " %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<html>
<head>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function submitForm() {
	    document.forms[0].event.value = "<%=TatDocAction.EVENT_SUBMIT%>";
	    document.forms[0].submit();
	}
	function save() {
	    document.forms[0].event.value = "<%=TatDocAction.EVENT_SAVE%>";
	    document.forms[0].submit();
	}
	function submitFormToDo() {
	    document.forms[0].event.value = "<%=TatDocAction.EVENT_SUBMIT_TODO%>";
	    document.forms[0].submit();
	}
	function saveToDo() {
	    document.forms[0].event.value = "<%=TatDocAction.EVENT_SAVE_TODO%>";
	    document.forms[0].submit();
	}
	function setMandatoryPAExecutedDate(){
		var valueStr = document.getElementById('docReadyForPADate').value;
	//	alert('1111111'+valueStr);
	  	if((valueStr==null||valueStr.length==0)||isChangeInDisbmtMaintain()){
	  		document.getElementById('mandatoryPAExecutedDateID').style.visibility = 'hidden';
		}else if(!isChangeInDisbmtMaintain()){
			document.getElementById('mandatoryPAExecutedDateID').style.visibility = 'visible';
		}
	} 
</script>
<%
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	String approvalDate = DateUtil.formatDate(locale,(profile.getApprovalDate()));
	TatDocForm form = (TatDocForm) request.getAttribute("TatDocForm");
	
	String applicationType = (profile.getApplicationType()==null?"":profile.getApplicationType());
	boolean defaultPAOrSolInvolvementReqY = false;
	boolean defaultPAOrSolInvolvementReqN = false;
	if(StringUtils.isBlank(form.getIsPAOrSolInvolvementReq())){
		if(applicationType.equals("HP")||applicationType.equals("HN")){
			defaultPAOrSolInvolvementReqN = true;
		}else{
			defaultPAOrSolInvolvementReqY = true;
		}	
	}

    ITatDocTrxValue trxValue = (ITatDocTrxValue) session
            .getAttribute("com.integrosys.cms.ui.tatdoc.TatDocAction.tatDocTrxValue");
    String[] style = {"even", "odd"};
    int count = 1;
    String oldDisDocComDateExit = null;
    if(trxValue!=null){
    	if(trxValue.getTatDoc()!=null){
    		oldDisDocComDateExit = (trxValue.getTatDoc().getDisbursementDocCompletionDate() != null &&
                    !"".equals(trxValue.getTatDoc().getDisbursementDocCompletionDate())) ? "Y" : null;
    	}
    }
    List teamFunctionList = (List) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_FUNTION);
    boolean canFlowToDisbursement = ((Boolean) session.getAttribute("com.integrosys.cms.ui.tatdoc.TatDocAction.canFlowToDisbursementStage")).booleanValue();
    boolean canFlowToPostDisbursement = ((Boolean) session.getAttribute("com.integrosys.cms.ui.tatdoc.TatDocAction.canFlowToPostDisbursementStage")).booleanValue();
    boolean isPreDisbursementTeam = false;
    boolean isDisbursementTeam = false;
    boolean isPostDisbursementTeam = false;

    if (teamFunctionList != null) {
        for (int i = 0; i < teamFunctionList.size(); i++) {
            long functionGrp = ((OBTeamFunctionGrp)teamFunctionList.get(i)).getFunctionGrpId();
            if(functionGrp == 1) {
                isPreDisbursementTeam = true;
            } else if(functionGrp == 2) {
                isDisbursementTeam = true;
            } else if(functionGrp == 3) {
                isPostDisbursementTeam = true;
            } else {
                DefaultLogger.debug(this, ">>>>>>>>>>>>>>> unknown function group = " + functionGrp);
            }
        }
    } else {
        DefaultLogger.debug(this, ">>>>>>>>>>>>>>>> teamFunctionList is null ");
    }

    DefaultLogger.debug(this, ">>>>>> canFlowToDisbursement = " + canFlowToDisbursement);
    DefaultLogger.debug(this, ">>>>>> canFlowToPostDisbursement = " + canFlowToPostDisbursement);

    boolean isDisbursementAllowed = (isDisbursementTeam) && (canFlowToDisbursement);
    boolean isPostDisbursementAllowed = (isPostDisbursementTeam) && (canFlowToPostDisbursement);
    
    HashMap tatFormMapper = (HashMap) session.getAttribute("com.integrosys.cms.ui.tatdoc.TatDocAction.tatFormMapper");
    String solicitorDate = null;
    String limitProfileID = null;
    String customerID = null;
    String customerName= null;
    if(tatFormMapper!=null){
    	solicitorDate = (String)tatFormMapper.get("solicitorDate");
	    limitProfileID = (String) tatFormMapper.get("limitProfileID");
		customerID = (String) tatFormMapper.get("customerID");
		customerName = (String) tatFormMapper.get("customerName");
    }
    
    if((trxValue==null||trxValue.getTatDoc()==null)&&form.getEvent().equals("read_edit")){
    	form.setSolicitorInstructionDate(solicitorDate);
    }
%>
</head>

<script type="text/javascript">
	function sel(){
		if(<%=defaultPAOrSolInvolvementReqY%>){
			document.forms[0].isPAOrSolInvolvementReq[0].checked = true;
		}
		if(<%=defaultPAOrSolInvolvementReqN%>){
			document.forms[0].isPAOrSolInvolvementReq[1].checked = true;
		}
	}

	function isChangeInDisbmtMaintain (){
		if(document.forms[0].isPAOrSolInvolvementReq[0].checked){
			return false;
		}else{
			return true;
			}
	}

	function setByPAOrSolInvolvementReq(){
		if(document.forms[0].isPAOrSolInvolvementReq[1].checked){
			document.getElementById("disbursementRemarks").disabled=false;
			setVisibility("docRecDateManditoryID","hidden");
			setVisibility("mandatoryPAExecutedDateID","hidden");
		}else if(<%=!isDisbursementAllowed%>){
			document.getElementById("disbursementRemarks").disabled=true;
		}

		if(document.forms[0].isPAOrSolInvolvementReq[0].checked){
			setVisibility("docRecDateManditoryID","visible");
			var valueStr = document.getElementById('docReadyForPADate').value;
			  	if((valueStr==null||valueStr.length==0)){
			  		setVisibility("mandatoryPAExecutedDateID","hidden");
				  }else{
					  setVisibility("mandatoryPAExecutedDateID","visible");
			      }
			
		}
	}

	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	} 

</script>

<p class="required"><font color="#0000FF">*</font> Mandatory for
Submission&nbsp;</p>
<br>
<body>
<html:form action="TatDoc.do">
	<input type="hidden" name="event">
	<html:hidden property="oldDisDocComDateExit" value="<%=oldDisDocComDateExit %>" />
	<html:hidden property="approvalDate" value="<%=approvalDate %>" />
	<html:hidden property="disbursementDate" value="<%=form.getDisbursementDate() %>" />
	<html:hidden property="limitProfileID" value="<%=limitProfileID %>" />

	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3><bean:message key="title.tatdoc" /></h3>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><br>
				<br>
				<hr>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0">
					<thead>
						<tr class="odd">
							<td colspan="4" style="text-align: left"><bean:message
								key="label.customer.details" /></td>
						</tr>
					</thead>
					<tbody>
						<tr class="odd">
							<td width="25%" class="fieldname"><bean:message key="label.cif" /><br></td>
							<td width="25%"><%=customerID %>&nbsp;</td>
							<td width="25%"class="fieldname"><bean:message
								key="label.customer.name" /></td>
							<td width="25%"><%=customerName %>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td><br>
				<br>
				<hr>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="4" style="text-align: left"><bean:message
								key="label.pre.disbursement.documentation" /></td>
						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname" width="15%"><bean:message
								key="label.date.instruction.solicitor" /></td>
							<td width="35%"><integro:empty-if-null value="<%=form.getSolicitorInstructionDate()%>" />
								<html:hidden property="solicitorInstructionDate" /><html:errors property="solicitorInstructionDate" /></td>
							<td class="fieldname" width="15%"><bean:message
								key="label.date.file.received" /><font color="#0000FF">*</font>
							</td>
							<td width="35%"><html:text property="fileFromBizCenterDate"
								styleId="fileRecDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('fileRecDate', 'dd/mm/y') : '' ;" /><html:errors
								property="fileFromBizCenterDate" /></td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname" width="15%"><bean:message
								key="label.date.pa.solicitor.involvement.required" /></td>
							<td colspan="3">&nbsp;
								<html:radio property="isPAOrSolInvolvementReq" value="Y" onclick="setByPAOrSolInvolvementReq()"></html:radio>
								<bean:message key="label.common.yes" />&nbsp;
								<html:radio property="isPAOrSolInvolvementReq" value="N" onclick="setByPAOrSolInvolvementReq()">
								</html:radio><bean:message key="label.common.no" />
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">&nbsp;</td>
							<td colspan="3">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
									<tr>
										<td class="fieldname" style="text-align: center"><bean:message
											key="label.first.draft" /></td>
										<td class="fieldname" style="text-align: center"><bean:message
											key="label.second.draft" /></td>
										<td class="fieldname" style="text-align: center"><bean:message
											key="label.third.draft" /></td>
										<td class="fieldname" style="text-align: center"><bean:message
											key="label.fourth.draft" /></td>
										<td class="fieldname" style="text-align: center"><bean:message
											key="label.fifth.draft" /></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td class="fieldname"><bean:message
								key="label.document.received" /><font color="#0000FF" id="docRecDateManditoryID">*</font></td>
							<td colspan="3">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
								<tr class="<%=style[count++%2] %>">
									<td><html:text property="documentReceivedDate"
										value='<%=form != null && form.getDocumentReceivedDate() != null && form.getDocumentReceivedDate()[0]!= null && !"".equals(form.getDocumentReceivedDate()[0])?form.getDocumentReceivedDate()[0]:"" %>'
										styleId="docRecDate1" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecDate1', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReceivedDate"
										value='<%=form != null && form.getDocumentReceivedDate() != null && form.getDocumentReceivedDate()[1]!= null && !"".equals(form.getDocumentReceivedDate()[1])?form.getDocumentReceivedDate()[1]:"" %>'
										styleId="docRecDate2" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecDate2', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReceivedDate"
										value='<%=form != null && form.getDocumentReceivedDate() != null && form.getDocumentReceivedDate()[2]!= null && !"".equals(form.getDocumentReceivedDate()[2])?form.getDocumentReceivedDate()[2]:"" %>'
										styleId="docRecDate3" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecDate3', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReceivedDate"
										value='<%=form != null && form.getDocumentReceivedDate() != null && form.getDocumentReceivedDate()[3]!= null && !"".equals(form.getDocumentReceivedDate()[3])?form.getDocumentReceivedDate()[3]:"" %>'
										styleId="docRecDate4" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecDate4', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReceivedDate"
										value='<%=form != null && form.getDocumentReceivedDate() != null && form.getDocumentReceivedDate()[4]!= null && !"".equals(form.getDocumentReceivedDate()[4])?form.getDocumentReceivedDate()[4]:"" %>'
										styleId="docRecDate5" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecDate5', 'dd/mm/y') : '';" /></td>
								</tr>
								<tr>
									<td colspan="5"><html:errors
										property="documentReceivedDate" /></td>
								</tr>
							</table>
							</td>
						</tr>

						<tr>
							<td class="fieldname"><bean:message
								key="label.document.sent.legal.dept" /></td>
							<td colspan="3">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
								<tr class="<%=style[count++%2] %>">
									<td><html:text property="docSentToLegalDeptDate"
										value='<%=form != null && form.getDocSentToLegalDeptDate() != null && form.getDocSentToLegalDeptDate()[0]!= null && !"".equals(form.getDocSentToLegalDeptDate()[0])?form.getDocSentToLegalDeptDate()[0]:"" %>'
										styleId="docSentDate1" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docSentDate1', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docSentToLegalDeptDate"
										value='<%=form != null && form.getDocSentToLegalDeptDate() != null && form.getDocSentToLegalDeptDate()[1]!= null && !"".equals(form.getDocSentToLegalDeptDate()[1])?form.getDocSentToLegalDeptDate()[1]:"" %>'
										styleId="docSentDate2" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docSentDate2', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docSentToLegalDeptDate"
										value='<%=form != null && form.getDocSentToLegalDeptDate() != null && form.getDocSentToLegalDeptDate()[2]!= null && !"".equals(form.getDocSentToLegalDeptDate()[2])?form.getDocSentToLegalDeptDate()[2]:"" %>'
										styleId="docSentDate3" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docSentDate3', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docSentToLegalDeptDate"
										value='<%=form != null && form.getDocSentToLegalDeptDate() != null && form.getDocSentToLegalDeptDate()[3]!= null && !"".equals(form.getDocSentToLegalDeptDate()[3])?form.getDocSentToLegalDeptDate()[3]:"" %>'
										styleId="docSentDate4" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docSentDate4', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docSentToLegalDeptDate"
										value='<%=form != null && form.getDocSentToLegalDeptDate() != null && form.getDocSentToLegalDeptDate()[4]!= null && !"".equals(form.getDocSentToLegalDeptDate()[4])?form.getDocSentToLegalDeptDate()[4]:"" %>'
										styleId="docSentDate5" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docSentDate5', 'dd/mm/y') : '';" /></td>
								</tr>
								<tr>
									<td colspan="5"><html:errors
										property="docSentToLegalDeptDate" /></td>
								</tr>
							</table>
							</td>
						</tr>

						<tr>
							<td class="fieldname"><bean:message
								key="label.document.received.legal.dept" /></td>
							<td colspan="3">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
								<tr class="<%=style[count++%2] %>">
									<td><html:text property="docReceivedFromLegalDeptDate"
										value='<%=form != null && form.getDocReceivedFromLegalDeptDate() != null && form.getDocReceivedFromLegalDeptDate()[0]!= null && !"".equals(form.getDocReceivedFromLegalDeptDate()[0])?form.getDocReceivedFromLegalDeptDate()[0]:"" %>'
										styleId="docRecLDDate1" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecLDDate1', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docReceivedFromLegalDeptDate"
										value='<%=form != null && form.getDocReceivedFromLegalDeptDate() != null && form.getDocReceivedFromLegalDeptDate()[1]!= null && !"".equals(form.getDocReceivedFromLegalDeptDate()[1])?form.getDocReceivedFromLegalDeptDate()[1]:"" %>'
										styleId="docRecLDDate2" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecLDDate2', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docReceivedFromLegalDeptDate"
										value='<%=form != null && form.getDocReceivedFromLegalDeptDate() != null && form.getDocReceivedFromLegalDeptDate()[2]!= null && !"".equals(form.getDocReceivedFromLegalDeptDate()[2])?form.getDocReceivedFromLegalDeptDate()[2]:"" %>'
										styleId="docRecLDDate3" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecLDDate3', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docReceivedFromLegalDeptDate"
										value='<%=form != null && form.getDocReceivedFromLegalDeptDate() != null && form.getDocReceivedFromLegalDeptDate()[3]!= null && !"".equals(form.getDocReceivedFromLegalDeptDate()[3])?form.getDocReceivedFromLegalDeptDate()[3]:"" %>'
										styleId="docRecLDDate4" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecLDDate4', 'dd/mm/y') : '';" /></td>
									<td><html:text property="docReceivedFromLegalDeptDate"
										value='<%=form != null && form.getDocReceivedFromLegalDeptDate() != null && form.getDocReceivedFromLegalDeptDate()[4]!= null && !"".equals(form.getDocReceivedFromLegalDeptDate()[4])?form.getDocReceivedFromLegalDeptDate()[4]:"" %>'
										styleId="docRecLDDate5" readonly="true" size="12"
										maxlength="11"></html:text><img src="img/calendara.gif"
										name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecLDDate5', 'dd/mm/y') : '';" /></td>
								</tr>
								<tr>
									<td colspan="5"><html:errors
										property="docReceivedFromLegalDeptDate" /></td>
								</tr>
							</table>
							</td>
						</tr>

						<tr>
							<td class="fieldname"><bean:message
								key="label.document.returned" /></td>
							<td colspan="3">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
								<tr class="<%=style[count++%2] %>">
									<td><html:text property="documentReturnedDate"
										value='<%=form != null && form.getDocumentReturnedDate() != null && form.getDocumentReturnedDate()[0]!= null && !"".equals(form.getDocumentReturnedDate()[0])?form.getDocumentReturnedDate()[0]:"" %>'
										styleId="docRetDate1" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRetDate1', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReturnedDate"
										value='<%=form != null && form.getDocumentReturnedDate() != null && form.getDocumentReturnedDate()[1]!= null && !"".equals(form.getDocumentReturnedDate()[1])?form.getDocumentReturnedDate()[1]:"" %>'
										styleId="docRetDate2" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRetDate2', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReturnedDate"
										value='<%=form != null && form.getDocumentReturnedDate() != null && form.getDocumentReturnedDate()[2]!= null && !"".equals(form.getDocumentReturnedDate()[2])?form.getDocumentReturnedDate()[2]:"" %>'
										styleId="docRetDate3" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRetDate3', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReturnedDate"
										value='<%=form != null && form.getDocumentReturnedDate() != null && form.getDocumentReturnedDate()[3]!= null && !"".equals(form.getDocumentReturnedDate()[3])?form.getDocumentReturnedDate()[3]:"" %>'
										styleId="docRetDate4" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRetDate4', 'dd/mm/y') : '';" /></td>
									<td><html:text property="documentReturnedDate"
										value='<%=form != null && form.getDocumentReturnedDate() != null && form.getDocumentReturnedDate()[4]!= null && !"".equals(form.getDocumentReturnedDate()[4])?form.getDocumentReturnedDate()[4]:"" %>'
										styleId="docRetDate5" readonly="true" size="12" maxlength="11"></html:text><img
										src="img/calendara.gif" name="cldr" border="0"
										onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRetDate5', 'dd/mm/y') : '';" /></td>
								</tr>
								<tr>
									<td colspan="5"><html:errors
										property="documentReturnedDate" /></td>
								</tr>
							</table>
							</td>
						</tr>

						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.date.doc.rec.exec" /></td>
							<td><html:text property="docReadyForPADate"
								styleId="docRecExecDate" maxlength="11" size="12"
								readonly="true" onchange="setMandatoryPAExecutedDate();"></html:text><img src="img/calendara.gif"
								name="cldr" border="0"
								onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docRecExecDate', 'dd/mm/y') : '';" /><html:errors
								property="docReadyForPADate" /></td>
							<td class="fieldname"><bean:message
								key="label.date.doc.exec" /><font color="#0000FF" id="mandatoryPAExecutedDateID">*</font></td>
							<td><html:text property="PAExecutedDate"
								styleId="docExecDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return (<%=isPreDisbursementTeam%>) ? showCalendar('docExecDate', 'dd/mm/y') : '';" /><html:errors
								property="PAExecutedDate" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message key="label.remarks" /></td>
							<td colspan="3"><html:textarea property="preDisburseRemarks"
								rows="5" cols="150" readonly="<%=!isPreDisbursementTeam%>"></html:textarea><br /><html:errors
								property="preDisburseRemarks" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td><br>
				<br>
				<hr>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0">
					<thead>
						<tr>
							<td class="odd" colspan="4"><bean:message
								key="label.disbursement.documentation" /></td>
						</tr>
					</thead>
					<tbody>
						<%
							count = 1;
						%>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.solicitor.release" /></td>
							<td><html:text property="solicitorAdviseReleaseDate"
								styleId="solRelDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return (<%=isDisbursementAllowed%>)||isChangeInDisbmtMaintain() ? showCalendar('solRelDate', 'dd/mm/y') : '';" /> <html:errors
								property="solicitorAdviseReleaseDate" /></td>
							<td class="fieldname"><bean:message
								key="label.date.doc.complete.disb" /></td>
							<td><html:text property="disbursementDocCompletedDate"
								styleId="docComplDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return (<%=isDisbursementAllowed%>)||isChangeInDisbmtMaintain() ? showCalendar('docComplDate', 'dd/mm/y') : '';" /> <html:errors
								property="disbursementDocCompletedDate" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.date.disbursement" /></td>
							<td colspan="3"><bean:write name="TatDocForm" property="disbursementDate" />&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message key="label.remarks" /></td>
							<td colspan="3"><html:textarea
								property="disbursementRemarks" rows="5" cols="150"></html:textarea><br /><html:errors
								property="disbursementRemarks" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td><br>
				<br>
				<hr>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0">
					<thead>
						<tr>
							<td class="odd" colspan="4"><bean:message
								key="label.post.disbursement.documentation" /></td>
						</tr>
					</thead>
					<tbody>
						<%
							count = 1;
						%>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.doc.completion.date" /></td>
							<td><html:text property="docCompletionDate"
								styleId="docCompDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return (<%=isPostDisbursementAllowed%>) ? showCalendar('docCompDate', 'dd/mm/y') : '';" /> <html:errors
								property="docCompletionDate" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message key="label.remarks" /></td>
							<td colspan="3"><html:textarea
								property="postDisbursementRemarks" rows="5" cols="150" readonly="<%=!isPostDisbursementAllowed%>"></html:textarea><br /><html:errors
								property="postDisbursementRemarks" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<%
				if (TatDocAction.EVENT_READ_EDIT_TODO.equals(form.getEvent())
							|| TatDocAction.EVENT_READ_CLOSE.equals(form.getEvent())) {
			%>
			<tr>
				<td><br>
				<br>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4" style="width:100%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=trxValue.getRemarks() != null ? trxValue.getRemarks() : ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td><br>
				<br>
				<table width="150" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>

						<%
							if (TatDocAction.EVENT_READ_EDIT_TODO.equals(form.getEvent())
                                    || TatDocAction.EVENT_READ_EDIT_NO_WIP_NO_LEFT_FRAME.equals(form.getEvent())
                                    ||TatDocAction.AFTER_ERROR_EVENT_TODO.equals(form.getEvent())) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="saveToDo()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/save2.gif',1)"><img
							src="img/save1.gif" name="Image3312" border="0" id="Image3312"
							width="75" height="20" /> </a></td>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="submitFormToDo()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('ImageD','','img/submit2.gif',1)"><img
							src="img/submit1.gif" name="ImageD" width="75" height="20"
							border="0" id="ImageD" /> </a></td>
						<%
							}
								else {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="save()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img
							src="img/save1.gif" name="Image3311" border="0" id="Image331"
							width="75" height="20" /> </a></td>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="submitForm()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img
							src="img/submit1.gif" name="Image3" width="75" height="20"
							border="0" id="Image3" /> </a></td>
						<%
							}
								if (TatDocAction.EVENT_READ_EDIT_TODO.equals(form.getEvent())
                                        || TatDocAction.EVENT_READ_EDIT_NO_WIP_NO_LEFT_FRAME.equals(form.getEvent())
                                        || TatDocAction.EVENT_READ_CLOSE.equals(form.getEvent())
                                        || TatDocAction.AFTER_ERROR_EVENT_TODO.equals(form.getEvent())) {
						%>
						<td width="75" valign="baseline" align="center"><a
							href="ToDo.do" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
						<img src="img/cancel1.gif" name="Image2" width="70" height="20"
							border="0" id="Image2" /></a></td>
						<%
							}
								
						%>
						<%-- <%else { %>
						<td width="75" valign="baseline" align="center"><a
							href="CustomerProcess.do?event=view_borrower_list&customerID=<bean:write name="TatDocForm" property="cif" />&limitProfileID=<bean:write name="TatDocForm" property="limitProfileID" />&startIndex=0"
							onclick="save()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332"
							width="70" height="20" /> </a></td>
						<%
							}
						%> --%>
					</tr>
					<tr>
						<td valign="baseline" align="center">&nbsp;</td>
						<td valign="baseline" align="center">&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
<script>
	sel();  
	setMandatoryPAExecutedDate(); 
	setByPAOrSolInvolvementReq(); 
</script>
</body>
</html>