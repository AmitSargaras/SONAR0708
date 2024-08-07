<%@ page import="com.integrosys.cms.ui.tatdoc.TatDocAction"%>
<%@ page import="com.integrosys.cms.ui.tatdoc.TatDocForm"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="com.integrosys.cms.app.tatdoc.trx.ITatDocTrxValue"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@ page import="com.integrosys.cms.app.tatduration.bus.OBTatParamItem" %>
<%@ page import="com.integrosys.cms.app.tatdoc.bus.*" %>
<%@ page import="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrack" %>
<%@ page import="org.apache.struts.util.LabelValueBean" %>
<html>
<head>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function approve() {
		document.forms[0].event.value = "<%=TatDocAction.EVENT_APPROVE%>";
		document.forms[0].submit();
	}
	function reject() {
		document.forms[0].event.value = "<%=TatDocAction.EVENT_REJECT%>";
		document.forms[0].submit();
	}
	function closeForm() {
		document.forms[0].event.value = "<%=TatDocAction.EVENT_CLOSE%>";
		document.forms[0].submit();
	}

	function setDisplay(){
		document.getElementById('documentReceivedDateDraft1').style.display='none';
		document.getElementById('documentReceivedDateDraft2').style.display='none'; 
		document.getElementById('documentReceivedDateDraft3').style.display='none';
		document.getElementById('documentReceivedDateDraft4').style.display='none';
		document.getElementById('documentReceivedDateDraft5').style.display='none';

		document.getElementById('docSentToLegalDeptDateDraft1').style.display='none'; 
		document.getElementById('docSentToLegalDeptDateDraft2').style.display='none'; 
		document.getElementById('docSentToLegalDeptDateDraft3').style.display='none';
		document.getElementById('docSentToLegalDeptDateDraft4').style.display='none';
		document.getElementById('docSentToLegalDeptDateDraft5').style.display='none';

		document.getElementById('docReceivedFromLegalDeptDateDraft1').style.display='none'; 
		document.getElementById('docReceivedFromLegalDeptDateDraft2').style.display='none'; 
		document.getElementById('docReceivedFromLegalDeptDateDraft3').style.display='none';
		document.getElementById('docReceivedFromLegalDeptDateDraft4').style.display='none';
		document.getElementById('docReceivedFromLegalDeptDateDraft5').style.display='none';

		document.getElementById('documentReturnedDateDraft1').style.display='none';
		document.getElementById('documentReturnedDateDraft2').style.display='none'; 
		document.getElementById('documentReturnedDateDraft3').style.display='none';
		document.getElementById('documentReturnedDateDraft4').style.display='none';
		document.getElementById('documentReturnedDateDraft5').style.display='none';
		
	} 
	

</script>
<%
	TatDocForm form = (TatDocForm) request.getAttribute("TatDocForm");
	String customerID = (String) request.getAttribute("customerID");
	String limitProfileID = (String) request.getAttribute("limitProfileID");
	ITatDocTrxValue trxValue = (ITatDocTrxValue) session
			.getAttribute("com.integrosys.cms.ui.tatdoc.TatDocAction.tatDocTrxValue");

    String trxId = request.getParameter("trxId");
	ITatDocDraft[] stagingTatDoc = null;
	ITatDocDraft[] actualTatDoc = null;
	
	boolean changeDocRecDraft1 = false ;
	boolean changeDocRecDraft2 = false ;
	boolean changeDocRecDraft3 = false ;
	boolean changeDocRecDraft4 = false ;
	boolean changeDocRecDraft5 = false ;
	
	boolean changeDocToLegalDraft1 = false ;
	boolean changeDocToLegalDraft2 = false ;
	boolean changeDocToLegalDraft3 = false ;
	boolean changeDocToLegalDraft4 = false ;
	boolean changeDocToLegalDraft5 = false ;
	
	boolean changeDocFromLegalDraft1 = false ;
	boolean changeDocFromLegalDraft2 = false ;
	boolean changeDocFromLegalDraft3 = false ;
	boolean changeDocFromLegalDraft4 = false ;
	boolean changeDocFromLegalDraft5 = false ;
	
	boolean changeDocRetDraft1 = false ;
	boolean changeDocRetDraft2 = false ;
	boolean changeDocRetDraft3 = false ;
	boolean changeDocRetDraft4 = false ;
	boolean changeDocRetDraft5 = false ;
	
    boolean isDocumentReceivedDateChange = false;
    boolean isDocSentToLegalDeptDateChange = false;
    boolean isDocReceivedFromLegalDeptDateChange = false;
    boolean isDocumentReturnedDateChange = false;

    
    if(trxValue != null) {
        if (trxValue.getStagingTatDoc() != null) {
            stagingTatDoc = trxValue.getStagingTatDoc().getDraftList();
        }
        if (trxValue.getTatDoc() != null) {
            actualTatDoc = trxValue.getTatDoc().getDraftList();
        }

        CompareResult[] resultList = new CompareResult[0];
        if (stagingTatDoc != null || actualTatDoc != null) { //required for situations where there is no share checklists
            List res = CompareOBUtil.compOBArray(stagingTatDoc, actualTatDoc);
            resultList = (CompareResult[]) res.toArray(new CompareResult[0]);
        }
        for (int i = 0; i < resultList.length; i++) {
          //  System.out.println("resultList(" + i + ") = " + resultList[i]);
        }
        ArrayList list = new ArrayList(Arrays.asList(resultList));

        for (int i = 0; i < list.size(); i++) {
          //  System.out.println("list.get(" + i + ") = " + list.get(i));
          //  System.out.println("list.get(" + i + ") = " + ((CompareResult) list.get(i)).getKey());
            ITatDocDraft tatDocDraft = (ITatDocDraft) ((CompareResult) (list.get(i))).getObj();
            System.out.println("list.get(" + i + ") getDocDraftStage= " + tatDocDraft.getDocDraftStage()+
            		"---->"+tatDocDraft.getDraftNumber());
            if (ITatDocConstant.DOCUMENT_RECEIVED.equals(tatDocDraft.getDocDraftStage())
                    && !"index".equals(((CompareResult) list.get(i)).getKey())) {
            	
            	if(tatDocDraft.getDraftNumber()==1){
            		changeDocRecDraft1 = true;
            	}else if(tatDocDraft.getDraftNumber()==2){
            		changeDocRecDraft2 = true;
            	}else if(tatDocDraft.getDraftNumber()==3){
            		changeDocRecDraft3 = true;
            	}else if(tatDocDraft.getDraftNumber()==4){
            		changeDocRecDraft4 = true;
            	}else {
            		changeDocRecDraft5 = true;
            	}
            	
                isDocumentReceivedDateChange = true;
                continue;
            }
            if (ITatDocConstant.DOC_SENT_TO_LEGAL_DEPT.equals(tatDocDraft.getDocDraftStage())
                    && !"index".equals(((CompareResult) list.get(i)).getKey())) {
            	
            	if(tatDocDraft.getDraftNumber()==1){
            		changeDocToLegalDraft1 = true;
            	}else if(tatDocDraft.getDraftNumber()==2){
            		changeDocToLegalDraft2 = true;
            	}else if(tatDocDraft.getDraftNumber()==3){
            		changeDocToLegalDraft3 = true;
            	}else if(tatDocDraft.getDraftNumber()==4){
            		changeDocToLegalDraft4 = true;
            	}else {
            		changeDocToLegalDraft5 = true;
            	}
            	
                isDocSentToLegalDeptDateChange = true;
                continue;
            }
            if (ITatDocConstant.DOC_RECEIVED_FROM_LEGAL_DEPT.equals(tatDocDraft.getDocDraftStage())
                    && !"index".equals(((CompareResult) list.get(i)).getKey())) {
            	
            	if(tatDocDraft.getDraftNumber()==1){
            		changeDocFromLegalDraft1 = true;
            	}else if(tatDocDraft.getDraftNumber()==2){
            		changeDocFromLegalDraft2 = true;
            	}else if(tatDocDraft.getDraftNumber()==3){
            		changeDocFromLegalDraft3 = true;
            	}else if(tatDocDraft.getDraftNumber()==4){
            		changeDocFromLegalDraft4 = true;
            	}else {
            		changeDocFromLegalDraft5 = true;
            	}
            	
                isDocReceivedFromLegalDeptDateChange = true;
                continue;
            }
            if (ITatDocConstant.DOCUMENT_RETURNED.equals(tatDocDraft.getDocDraftStage())
                    && !"index".equals(((CompareResult) list.get(i)).getKey())) {
            	
            	if(tatDocDraft.getDraftNumber()==1){
            		changeDocRetDraft1 = true;
            	}else if(tatDocDraft.getDraftNumber()==2){
            		changeDocRetDraft2 = true;
            	}else if(tatDocDraft.getDraftNumber()==3){
            		changeDocRetDraft3 = true;
            	}else if(tatDocDraft.getDraftNumber()==4){
            		changeDocRetDraft4 = true;
            	}else {
            		changeDocRetDraft5 = true;
            	}
            	
                isDocumentReturnedDateChange = true;
                continue;
            }
        }

        pageContext.setAttribute("sltList", list);
    }

	String[] style = { "even", "odd" };
	int count = 1;
	
    HashMap tatFormMapper = (HashMap) session.getAttribute("com.integrosys.cms.ui.tatdoc.TatDocAction.tatFormMapper");
    String getLimitProfileID = null;
    String getCustomerID = null;
    String customerName= null;
    if(tatFormMapper!=null){
    	getLimitProfileID = (String) tatFormMapper.get("limitProfileID");
    	getCustomerID = (String) tatFormMapper.get("customerID");
		customerName = (String) tatFormMapper.get("customerName");
    }
	
    String[] defaultStrList = new String[5];
    if (form.getDocumentReceivedDate()==null){
    	form.setDocumentReceivedDate(defaultStrList);
    }
    if(form.getDocSentToLegalDeptDate()==null){
    	form.setDocSentToLegalDeptDate(defaultStrList);
    }
    if(form.getDocumentReturnedDate()==null){
    	form.setDocumentReturnedDate(defaultStrList);
    }
    if(form.getDocReceivedFromLegalDeptDate()==null){
    	form.setDocReceivedFromLegalDeptDate(defaultStrList);
    }

    int sno = 0;
%>
</head>

<p class="required"><%--<bean:message key="label.mandatory" /><bean:message key="label.global.mandatory.for.submission"/>--%></p>
<br>
<body>
<html:form action="TatDoc.do">
	<input type="hidden" name="event">
	<input type="hidden" name="trxId" value="<%=trxId %>">
	<html:hidden property="limitProfileID" value="<%=getLimitProfileID %>" />
    <html:hidden property="tatTrackID" value="<%=form.getTatTrackID()%>" />

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
				<table border="0" width="100%" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="8" style="text-align: left"><bean:message
								key="label.pre.disbursement.documentation" /></td>
						</tr>
						<tr>
							<td width="10%">Start Date</td>
							<td width="25%">Pre Stage</td>
							<td width="25%">Post Stage</td>
							<td>Duration<br>(w/days)</td>
							<td width="10%">Forecasted<br>End Date</td>
							<td width="10%">Actual date</td>
							<td>Applicable<br>TAT Stage</td>
						</tr>
					</thead>
					<tbody>
					<logic:present name="stagePreDibursmentList">
   						<logic:iterate id="ob" name="stagePreDibursmentList"  type="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrackStage" >
   							   <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }

								boolean defaultStartDateReadOnly = false;
								if(sno==1)
									defaultStartDateReadOnly  = ob.isStageActive();

								String startDateField = "startDateField" + sno;
								String endDateField = "endDateField" + sno;
								String startDateSpan = "startDateSpan" + sno;
								String endDateSpan = "endDateSpan" + sno;
								OBTatParamItem item = ob.getTatParamItem();
								String duration = item.getDuration() + "";
	       						if(duration.endsWith(".0") && duration.length()>2)
	       							duration = duration.substring(0, duration.length()-2);

	       						String durationType = "";
	       						if("D".equals(item.getDurationType()))
	       							durationType = "Day(s)";
	       						else
	       							durationType = "Hour(s)";

							%>
                            <tr class="<%=rowClass%>">
   							<td>
   							<html:hidden property="tatTrackingStageId" name="ob"/>
   							<html:hidden property="tatParamItemId" name="ob"/>
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getStartDate())%>' disabled="true" readonly=""/>
   							<center><span id='<%=startDateSpan%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="start" value="Start" style="width:80px" class="btnNormal"
									onClick="submitForm('startAction', 'update_duration_date')" disabled="true" readonly=""/>
							<% } %>
							</center>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>' disabled="true" readonly=""/>
							<input type="hidden" name="duration" value='<%=duration%>' disabled="true" readonly=""/>
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getEndDate())%>' disabled="true" readonly=""/>
							<center><span id='<%=endDateSpan%>'></span></center></td>

							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getActualDate())%>' disabled="true" readonly=""/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal"
									onClick="submitForm('endAction', 'update_duration_date')" disabled="true" readonly=""/>
							<%} %>
							</center></td>

							</td>
							<td><center>
							<%
								boolean isTracked = false;
								if(ob.getTatTrackingStageId() != 0)
									isTracked = true;

                                String storeReasonForExt = ob.getReasonExceeding();
                                String reasonForExt = "-";
                                List list = (List)request.getAttribute("reasonValList");
                                for (int i = 0; i < list.size(); i++) {
                                    LabelValueBean lvb = (LabelValueBean) list.get(i);

                                    if (!lvb.getValue().equals(storeReasonForExt)) continue;

                                    reasonForExt = lvb.getLabel();
                                    break;
                                }
							%>
							<%--<html:checkbox property="isTatApplicable" name="ob" disabled='<%=isTracked%>' /></center>--%>
                            <html:checkbox property="isTatApplicable" name="ob" disabled="true"/></center>
							</td></tr>
   							<tr class="<%=rowClass%>"><td>Reason for Exceeding TAT</td>
   							<td colspan="6"><%--<html:select name="ob" disabled="<%=!ob.isStageActive()%>" property="reasonExceeding" >
                  			<option value="0"><bean:message key="label.please.select"/></option>
							<html:options collection="reasonValList" property="value" labelProperty="label"/>
                			</html:select>--%>
                            <%=reasonForExt%>       
                			</td></tr>
   						</logic:iterate>
					</logic:present>

					<tr>
					<td>Remarks</td>
					<td colspan="7"><html:textarea property="preDisburseRemarks" disabled="true" readonly=""/></td>
					</tr>
					</tbody>
					</table>

				</td></tr>


                <!--  Disbursment Table -->
			<tr>
				<td><br>
				<br>
				<hr>
				<table border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="8" style="text-align: left"><bean:message
								key="label.disbursement.documentation" /></td>
						</tr>
						<tr>
							<td width="10%">Start Date</td>
							<td width="25%">Pre Stage</td>
							<td width="25%">Post Stage</td>
							<td>Duration<br>(w/days)</td>
							<td width="10%">Forecasted<br>End Date</td>
							<td width="10%">Actual date</td>
							<td>Applicable<br>TAT Stage</td>
						</tr>
					</thead>
					<tbody>
					<logic:present name="stageDibursmentList">
   						<logic:iterate id="ob" name="stageDibursmentList"  type="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrackStage" >
   							   <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }

                                   String startDateField = "startDateField" + sno;
   								   String endDateField = "endDateField" + sno;
   								   String startDateSpan = "startDateSpan" + sno;
   								   String endDateSpan = "endDateSpan" + sno;
   									OBTatParamItem item = ob.getTatParamItem();
   									String duration = item.getDuration() + "";
   		       						if(duration.endsWith(".0") && duration.length()>2)
   		       							duration = duration.substring(0, duration.length()-2);

	   		       					String durationType = "";
		       						if("D".equals(item.getDurationType()))
		       							durationType = "Day(s)";
		       						else
		       							durationType = "Hour(s)";
                                %>

                            <tr class="<%=rowClass%>">
   							<td>
   							<html:hidden property="tatTrackingStageId" name="ob"/>
   							<html:hidden property="tatParamItemId" name="ob"/>
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getStartDate())%>' disabled="true" readonly=""/>
   							<center><span id='<%=startDateSpan%>'></span>
							<%--<% if(sno == 1 && ob.isStageActive()){ %>--%>
                            <% if(ob.isStageActive()){ %>       
								<input type="button" name="Submit" value="Start" style="width:80px" class="btnNormal"
									onClick="submitForm('startAction', 'update_duration_date')" disabled="true" readonly=""/>
							<% } %>
							</center>
							</td>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>' disabled="true" readonly=""/>
							<input type="hidden" name="duration" value='<%=duration%>' disabled="true" readonly=""/>
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getEndDate())%>' disabled="true" readonly=""/>
							<center><span id='<%=endDateSpan%>'></span></center></td>

							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getActualDate())%>' disabled="true" readonly=""/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal"
									onClick="submitForm('endAction', 'update_duration_date')" disabled="true" readonly=""/>
							<%} %>
							</center></td>
							<td><center>
							<%
								boolean isTracked = false;
								if(ob.getTatTrackingStageId() != 0)
									isTracked = true;

                                String storeReasonForExt = ob.getReasonExceeding();
                                String reasonForExt = "-";
                                List list = (List)request.getAttribute("reasonValList");
                                for (int i = 0; i < list.size(); i++) {
                                    LabelValueBean lvb = (LabelValueBean) list.get(i);

                                    if (!lvb.getValue().equals(storeReasonForExt)) continue;

                                    reasonForExt = lvb.getLabel();
                                    break;
                                }                                
							%>
							<%--<html:checkbox property="isTatApplicable" name="ob" disabled='<%=isTracked%>' value="1"/>--%><html:checkbox property="isTatApplicable" name="ob" disabled="true" value="1"/>
							</center></td></tr>
   							<tr class="<%=rowClass%>"><td>Reason for Exceeding TAT</td>
   							<td colspan="6"><%--<html:select name="ob" disabled="<%=!ob.isStageActive()%>" property="reasonExceeding">
                  			<option value="0"><bean:message key="label.please.select"/></option>
							<html:options collection="reasonValList" property="value" labelProperty="label"/>
                			</html:select>--%>
                            <%=reasonForExt%>       
                			</td></tr>
   						</logic:iterate>
					</logic:present>

					<tr>
					<td>Remarks</td>
					<td colspan="7"><html:textarea property="disbursementRemarks" disabled="true" readonly=""/></td>
					</tr>
					</tbody>
					</table>

				</td></tr>

                <!--  Disbursment Table -->
			<tr>
				<td><br>
				<br>
				<hr>
				<table border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="8" style="text-align: left"><bean:message
								key="label.post.disbursement.documentation" /></td>
						</tr>
						<tr>
							<td width="10%">Start Date</td>
							<td width="25%">Pre Stage</td>
							<td width="25%">Post Stage</td>
							<td>Duration<br>(w/days)</td>
							<td width="10%">Forecasted<br>End Date</td>
							<td width="10%">Actual date</td>
							<td>Applicable<br>TAT Stage</td>
						</tr>
					</thead>
					<tbody>
					<logic:present name="stagePostDibursmentList">
   						<logic:iterate id="ob" name="stagePostDibursmentList"  type="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrackStage" >
   							   <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }

                                   String endDateField = "endDateField" + sno;
                                   String startDateField = "startDateField" + sno;
     							   String startDateSpan = "startDateSpan" + sno;
     							   String endDateSpan = "endDateSpan" + sno;
                                   OBTatParamItem item = ob.getTatParamItem();
                                   String duration = item.getDuration() + "";
	   	       						if(duration.endsWith(".0") && duration.length()>2)
	   	       							duration = duration.substring(0, duration.length()-2);
		   	       					String durationType = "";
		       						if("D".equals(item.getDurationType()))
		       							durationType = "Day(s)";
		       						else
		       							durationType = "Hour(s)";
                                %>

                            <tr class="<%=rowClass%>">
   							<td>
   							<html:hidden property="tatTrackingStageId" name="ob"/>
   							<html:hidden property="tatParamItemId" name="ob"/>
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getStartDate())%>' disabled="true" readonly=""/>
   							<center><span id='<%=startDateSpan%>'></span>
							<%--<% if(sno == 1 && ob.isStageActive()){ %>--%>
                            <% if(ob.isStageActive()){ %>       
								<input type="button" name="Submit" value="Start" style="width:80px" class="btnNormal"
									onClick="submitForm('startAction', 'update_duration_date')" disabled="true" readonly=""/>
							<% } %>
							</center>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>' disabled="true" readonly=""/>
							<input type="hidden" name="duration" value='<%=duration%>' disabled="true" readonly=""/>
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getEndDate())%>' disabled="true" readonly=""/>
							<center><span id='<%=endDateSpan%>'></span></center></td>

							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getActualDate())%>' disabled="true" readonly=""/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal"
									onClick="submitForm('endAction', 'update_duration_date')" disabled="true" readonly=""/>
							<%} %>
							</center></td>
							<td><center>
							<%
								boolean isTracked = false;
								if(ob.getTatTrackingStageId() != 0)
									isTracked = true;

                                String storeReasonForExt = ob.getReasonExceeding();
                                String reasonForExt = "-";
                                List list = (List)request.getAttribute("reasonValList");
                                for (int i = 0; i < list.size(); i++) {
                                    LabelValueBean lvb = (LabelValueBean) list.get(i);

                                    if (!lvb.getValue().equals(storeReasonForExt)) continue;

                                    reasonForExt = lvb.getLabel();
                                    break;
                                }
							%>
							<%--<html:checkbox property="isTatApplicable" name="ob" disabled='<%=isTracked%>' value="1"/>--%><html:checkbox property="isTatApplicable" name="ob" disabled="true" value="1"/>
							</center></td></tr>
   							<tr class="<%=rowClass%>"><td>Reason for Exceeding TAT</td>
   							<td colspan="6"><%--<html:select name="ob" disabled="<%=!ob.isStageActive()%>" property="reasonExceeding" >
                  			<option value="0"><bean:message key="label.please.select"/></option>
							<html:options collection="reasonValList" property="value" labelProperty="label"/>
                			</html:select>--%>
                            <%=reasonForExt%>       
                			</td></tr>
   						</logic:iterate>
					</logic:present>

					<tr>
					<td>Remarks</td>
					<td colspan="7"><html:textarea property="postDisburseRemarks" disabled="true" readonly=""/></td>
					</tr>
					</tbody>
					</table>

				</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <%--
            <tr>
                <td>
                    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                        <td width="100" valign="baseline" align="center">
                            <a href="#" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image0','','img/confirm2.gif',1)"
                               onClick="submitForm('submitAction', 'commit')">
                                <img src="img/confirm1.gif" name="Image3" border="0" id="Image0"/>
                            </a>
                        </td>
                        <td width="100" valign="baseline" align="center">
                            <a href="TatDoc.do?event=read_edit" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
                        </td>
                    </table>
                </td>
            </tr>
            --%>

            <tr>
				<td><br><br>
				<table width="150" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="75" valign="baseline" align="center"></td>
					</tr>
					<tr>
						<td valign="baseline" align="center"><br/><br/>&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
            <%--Old viewer    
			<tr>
				<td>
				<hr><br>
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
							<td width="15%" class="fieldname"><bean:message key="label.cif" /><br></td>
							<td width="35%"><%=getCustomerID %>&nbsp;</td>
							<td width="15%" class="fieldname"><bean:message
								key="label.customer.name" /></td>
							<td width="35%"><%=customerName %>&nbsp;</td>
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
						<tr class="odd">
							<td colspan="4" style="text-align: left"><bean:message
								key="label.pre.disbursement.documentation" /></td>
						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
									(CompareOBUtil.compOB(trxValue.getTatDoc(),trxValue.getStagingTatDoc(),"solicitorInstructionDate")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.date.instruction.solicitor" /></td>
							<td width="35%"><bean:write name="TatDocForm"
								property="solicitorInstructionDate" />&nbsp;</td>
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
										(CompareOBUtil.compOB(trxValue.getTatDoc(),trxValue.getStagingTatDoc(),"fileReceivedFromBizCenter")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message key="label.date.file.received" /><font
								color="#0000FF">*</font></td>
							<td width="35%"><bean:write name="TatDocForm"
								property="fileFromBizCenterDate" />&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
										(CompareOBUtil.compOB(trxValue.getTatDoc(),trxValue.getStagingTatDoc(),"isPAOrSolInvolvementReq")?"fieldname":"fieldnamediff"):"fieldname"%>' 
								width="15%"><bean:message
								key="label.date.pa.solicitor.involvement.required" /></td>
							<td colspan="3">&nbsp;
								<html:radio property="isPAOrSolInvolvementReq" value="Y" onclick="setByPAOrSolInvolvementReq()" disabled="true"></html:radio>
								<bean:message key="label.common.yes" />&nbsp;
								<html:radio property="isPAOrSolInvolvementReq" value="N" onclick="setByPAOrSolInvolvementReq()" disabled="true">
								</html:radio><bean:message key="label.common.no" />
							</td>
						</tr>

						<tr class="<%=style[count++%2] %>">
							<td class="fieldname" width="20%">&nbsp;</td>
							<td colspan="3">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
									<tbody>
										<tr>
											<td class="fieldname" width="20%" style="text-align: center"><bean:message
												key="label.first.draft" /></td>
											<td class="fieldname" width="20%" style="text-align: center"><bean:message
												key="label.second.draft" /></td>
											<td class="fieldname" width="20%" style="text-align: center"><bean:message
												key="label.third.draft" /></td>
											<td class="fieldname" width="20%" style="text-align: center"><bean:message
												key="label.fourth.draft" /></td>
											<td class="fieldname" width="20%" style="text-align: center"><bean:message
												key="label.fifth.draft" /></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
										(isDocumentReceivedDateChange?"fieldnamediff":"fieldname"):"fieldname"%>' >
								<bean:message key="label.document.received" /></td>
							<td colspan="3">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
									<tbody>
										<tr>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRecDraft1?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReceivedDateDraft1"></td>
											<td width="20%">
											<bean:write name="TatDocForm"
												property="documentReceivedDate[0]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRecDraft2?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReceivedDateDraft2"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReceivedDate[1]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRecDraft3?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReceivedDateDraft3"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReceivedDate[2]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRecDraft4?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReceivedDateDraft4"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReceivedDate[3]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRecDraft5?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReceivedDateDraft5"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReceivedDate[4]" />&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
										(isDocSentToLegalDeptDateChange?"fieldnamediff":"fieldname"):"fieldname"%>'><bean:message
								key="label.document.sent.legal.dept" /></td>
							<td colspan="3">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
									<tbody>
										<tr>								
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocToLegalDraft1?"fieldnamediff":"fieldname"):"fieldname"%>' id="docSentToLegalDeptDateDraft1"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docSentToLegalDeptDate[0]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocToLegalDraft2?"fieldnamediff":"fieldname"):"fieldname"%>' id="docSentToLegalDeptDateDraft2"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docSentToLegalDeptDate[1]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocToLegalDraft3?"fieldnamediff":"fieldname"):"fieldname"%>' id="docSentToLegalDeptDateDraft3"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docSentToLegalDeptDate[2]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocToLegalDraft4?"fieldnamediff":"fieldname"):"fieldname"%>' id="docSentToLegalDeptDateDraft4"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docSentToLegalDeptDate[3]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocToLegalDraft5?"fieldnamediff":"fieldname"):"fieldname"%>' id="docSentToLegalDeptDateDraft5"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docSentToLegalDeptDate[4]" />&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
										(isDocReceivedFromLegalDeptDateChange?"fieldnamediff":"fieldname"):"fieldname"%>'><bean:message
								key="label.document.received.legal.dept" /></td>
							<td colspan="3">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
									<tbody>
										<tr>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocFromLegalDraft1?"fieldnamediff":"fieldname"):"fieldname"%>' id="docReceivedFromLegalDeptDateDraft1"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docReceivedFromLegalDeptDate[0]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocFromLegalDraft2?"fieldnamediff":"fieldname"):"fieldname"%>' id="docReceivedFromLegalDeptDateDraft2"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docReceivedFromLegalDeptDate[1]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocFromLegalDraft3?"fieldnamediff":"fieldname"):"fieldname"%>' id="docReceivedFromLegalDeptDateDraft3"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docReceivedFromLegalDeptDate[2]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocFromLegalDraft4?"fieldnamediff":"fieldname"):"fieldname"%>' id="docReceivedFromLegalDeptDateDraft4"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docReceivedFromLegalDeptDate[3]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocFromLegalDraft5?"fieldnamediff":"fieldname"):"fieldname"%>' id="docReceivedFromLegalDeptDateDraft5"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="docReceivedFromLegalDeptDate[4]" />&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
										(isDocumentReturnedDateChange?"fieldnamediff":"fieldname"):"fieldname"%>'><bean:message
								key="label.document.returned" /></td>
							<td colspan="3">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
									<tbody>
										<tr>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRetDraft1?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReturnedDateDraft1"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReturnedDate[0]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRetDraft2?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReturnedDateDraft2"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReturnedDate[1]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRetDraft3?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReturnedDateDraft3"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReturnedDate[2]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRetDraft4?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReturnedDateDraft4"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReturnedDate[3]" />&nbsp;</td>
											<td class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? 
														(changeDocRetDraft5?"fieldnamediff":"fieldname"):"fieldname"%>' id="documentReturnedDateDraft5"></td>
											<td width="20%"><bean:write name="TatDocForm"
												property="documentReturnedDate[4]" />&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"docReceviceForPADate")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.date.doc.rec.exec" /></td>
							<td width="35%"><bean:write name="TatDocForm"
								property="docReadyForPADate" />&nbsp;</td>
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"docPAExcuteDate")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.date.doc.exec" />
								<%if(form.getDocReadyForPADate()!=null&&form.getDocReadyForPADate().length()!=0){ %>
								<font color="#0000FF" id="mandatoryPAExecutedDateID">*</font>
								<%} %>
								</td>
							<td><bean:write name="TatDocForm"
								property="PAExecutedDate" />&nbsp;</td>
						</tr width="35%">
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"preDisbursementRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>'><bean:message
								key="label.remarks" /></td>
							<td colspan="5"><bean:write name="TatDocForm"
								property="preDisburseRemarks" />&nbsp;</td>
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
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"solicitorAdviseReleaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.solicitor.release"/></td>
							<td width="35%"><bean:write name="TatDocForm"
								property="solicitorAdviseReleaseDate" />&nbsp;</td>
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"disbursementDocCompletionDate")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.date.doc.complete.disb" /></td>
							<td width="35%"><bean:write name="TatDocForm"
								property="disbursementDocCompletedDate" />&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"disbursementDate")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.date.disbursement" /></td>
							<td colspan="3"><bean:write name="TatDocForm"
								property="disbursementDate" />&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"disbursementRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>'
								width="15%"><bean:message
								key="label.remarks" /></td>
							<td colspan="3"><bean:write name="TatDocForm"
								property="disbursementRemarks" />&nbsp;</td>
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
							<td class="odd" colspan="2"><bean:message
								key="label.post.disbursement.documentation" />&nbsp;</td>
						</tr>
					</thead>
					<tbody>
						<%
							count = 1;
						%>
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"docCompletionDate")?"fieldname":"fieldnamediff"):"fieldname"%>'><bean:message
								key="label.doc.completion.date" /></td>
							<td><bean:write name="TatDocForm"
								property="docCompletionDate" />&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td
								class='<%=TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())? (CompareOBUtil.compOB(trxValue.getStagingTatDoc(),trxValue.getTatDoc(),"postDisbursementRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>'><bean:message
								key="label.remarks" /></td>
							<td><bean:write name="TatDocForm"
								property="postDisbursementRemarks" />&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<%
				if (TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())
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
							<td class="odd"><textarea name="remarks" rows="4" style="width: 90%"></textarea></td>
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
				<td>
				<table width="150" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td valign="baseline" align="center">&nbsp;</td>
						<td valign="baseline" align="center">&nbsp;</td>
						<td valign="baseline" align="center">&nbsp;</td>
					</tr>
					<tr>
						<%
							if (TatDocAction.EVENT_CHECKER_READ.equals(form.getEvent())) {
						%>
						<td><a href="#" onclick="approve()"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
							src="img/approve1.gif" name="Image8" width="80" height="20"
							border="0" id="Image8" /></a></td>
						<td><a href="#" onclick="reject()"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
							src="img/reject1.gif" name="Image9" width="70" height="20"
							border="0" id="Image9" /></a></td>
						<%
							}
								else if (TatDocAction.EVENT_READ_CLOSE.equals(form.getEvent())) {
						%>
						<td><a href="#" onclick="closeForm()"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image12','','img/close2a.gif',1)"><img
							src="img/close1a.gif" name="Image12" width="75" height="20"
							border="0" id="Image12" /></a></td>
						<%
							}
						%>
						<%
							if (TatDocAction.EVENT_VIEW.equals(form.getEvent())) {
						%>
						<td><a href="ToDo.do?event=totrack"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a></td>
						<%
							}
								else if (TatDocAction.EVENT_VIEW_CHECKER.equals(form.getEvent())) { //do nothing
						%>
						<%
							}
								else {
						%>
						<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td valign="baseline" align="center">&nbsp;</td>
						<td valign="baseline" align="center">&nbsp;</td>
						<td valign="baseline" align="center">&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
            --%>
		</tbody>
	</table>
</html:form>
<script type="text/javascript">
	var formObj = document.forms[0];
	var row = 0;
	var span = "";

	for (var i=0; i<formObj.elements.length; i++)
	{
	    var type = formObj.elements[i].type;
		var name = formObj.elements[i].name;
		var id = formObj.elements[i].id;

		if (type == 'hidden')
		{
			var date = formObj.elements[i].value;

			if(name == 'startDate')
			{
				row++;
				span = "startDateSpan" + row;
			}

			if(date != "" && date != "null" && name == "startDate")
			{
				formObj.elements[i].value = date;
				document.getElementById(span).innerHTML = getDisplayFormatDate(date) + "<br/>";
			}

			if(date != "" && date != "null" && name == "endDate")
			{
				span = "endDateSpan" + row;
				formObj.elements[i].value = date;
				document.getElementById(span).innerHTML = getDisplayFormatDate(date) + "<br/>";
			}

			if(date != "" && date != "null" && name == "actualDate")
			{
				span = "actualDateSpan" + row;
				formObj.elements[i].value = date;
				document.getElementById(span).innerHTML = getDisplayFormatDate(date) + "<br/>";
			}
		}
	}


	// input = stored date dd/mm/yyyy;hh:mm:ss
	function getDisplayFormatDate(storedDate)
	{
		var date = storedDate.split("-")[0];
		var time = storedDate.split("-")[1];
		var day = date.split("/")[0];
		if(day.length < 2)
			day = "0" + day + " ";
		else
			day = day + " ";

		var month = getMonthName(date.split("/")[1]) + " ";
		var year = date.split("/")[2];

		var hour = time.split(":")[0];
		var minute = time.split(":")[1];
		var sec = time.split(":")[2];

		if(eval(hour)<10)
			time = "0" + hour;
		else
			time = hour;

		if(eval(minute)<10)
			time += ":0" + minute;
		else
			time += ":" + minute;

		if(eval(sec)<10)
			time += ":0" + sec;
		else
			time += ":" + sec;

		return day + month + year + " " + time;
	}

	// 0 = January
	function getMonthName(month)
	{
		if(month == 1)
			return "Jan";
		if(month == 2)
			return "Feb";
		if(month == 3)
			return "Mar";
		if(month == 4)
			return "Apr";
		if(month == 5)
			return "May";
		if(month == 6)
			return "Jun";
		if(month == 7)
			return "Jul";
		if(month == 8)
			return "Augt";
		if(month == 9)
			return "Sep";
		if(month == 10)
			return "Oct";
		if(month == 11)
			return "Nov";
		if(month == 12)
			return "Dec";
	}


	function getStoredFormatDate(date)
	{
		var day = date.getDate() + "/";
		var month = date.getMonth() + "/";
		var year = date.getFullYear() + "-";

		var time = "";//date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
		var hour = date.getHours();
		if(hour<10)
			time += "0";
		time += hour + ":";

		var minute = date.getMinutes();
		if(minute<10)
			time += "0";
		time += minute + ":";

		var second = date.getSeconds();
		if(second<10)
			time += "0";
		time += second;

		return day + month + year + time;
	}

	function submitForm(action, event)
	{
		var formObj = document.forms[0];
		var startDate = "";
		var endDate = "";
		var valueString = "";

		for (var i=0; i<formObj.elements.length; i++)
		 {
		    var type = formObj.elements[i].type;
			var name = formObj.elements[i].name;
			var id = formObj.elements[i].id;
			if (type == 'hidden' && name == 'tatTrackingStageId')
			{
				var tatTrackingStageId = formObj.elements[i].value;
				if(tatTrackingStageId == "")
					tatTrackingStageId = "0";
				valueString += tatTrackingStageId + ",";
			}

			if (type == 'hidden' && name == 'tatParamItemId')
			{
				var tatParamItemId = formObj.elements[i].value;
				valueString += tatParamItemId + ",";
			}

			if (type == 'hidden' && name == 'startDate')
			{
				var startDate = formObj.elements[i].value;
				valueString += startDate + ",";
			}

			else if (type == 'hidden' && name == 'endDate')
			{
				var endDate = formObj.elements[i].value;
				valueString += endDate + ",";
			}

			else if (type == 'hidden' && name == 'actualDate')
			{
				var actualDate = formObj.elements[i].value;
				if(actualDate == "")
					valueString += "0,";
				else
					valueString += actualDate + ",";
			}

			else if (type == 'checkbox' && name == 'isTatApplicable')
			{
				var checked = formObj.elements[i].checked;
				if(checked == true)
					valueString += "Y,";
				else
					valueString += "N,";

			}
			else if (type == 'select-one' && name == 'reasonExceeding')
			{
				var value = formObj.elements[i].value;
				valueString += value + ";";
			}

		 }

		valueString = valueString.substring(0, valueString.length - 1);

	    if(action == 'startAction')
			document.forms[0].isStartAction.value = "Y";
	    else if(action == 'endAction')
			document.forms[0].isStartAction.value = "N";
	    else
	    	document.forms[0].isStartAction.value = "";

	    document.forms[0].event.value = event;
	    document.forms[0].tatParamStageTrackingString.value = valueString;
	    document.forms[0].submit();
	}
</script>
<script>
	//setDisplay();
</script>
</body>
</html>