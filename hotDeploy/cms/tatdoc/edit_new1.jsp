<%@ page import="com.integrosys.cms.app.tatdoc.bus.MaintainTatDurationUtil"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant " %>
<%@ page import="com.integrosys.cms.ui.tatdoc.TatDocForm"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.tatduration.bus.OBTatParamItem"%>
<%@ page import="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrackStage" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.function.bus.OBTeamFunctionGrp" %>
<%@ page import="java.util.*" %>
<html>
<head>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript"><!--



--></script>
<%
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	String approvalDate = DateUtil.formatDate(locale,(profile.getApprovalDate()));
    TatDocForm form = (TatDocForm) request.getAttribute("TatDocForm");
    List teamFunctionList = (List) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_FUNTION);
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

    int sno = 0;

    int preCount = 0;
    int inCount = 0;
    int postCount = 0;
%>
</head>

<%--<p class="required"><font color="#0000FF">*</font> Mandatory for
Submission&nbsp;</p>
<br>--%>
<body onload="javascript:init()" >
<html:form action="TatDoc.do">
	<input type="hidden" name="event">
	<input type="hidden" name="isStartAction">
	<input type="hidden" name="tatParamStageTrackingString" />
    <html:hidden property="tatTrackID" value="<%=form.getTatTrackID()%>" />

	<table border="0" width="100%" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3><bean:message key="title.tatdoc" /></h3>
                <br><bean:message key="title.tatdoc.instruction" />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
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

                                preCount++;

                                //OBTatLimitTrack OB = (OBTatLimitTrack) ob;
                                OBTatLimitTrackStage OB = (OBTatLimitTrackStage) ob;
                                //let put some hidden value here to map into the TatDocForm
                                out.println("<input type='hidden' value='" + OB.getTatTrackingStageId() + "' name='preTrackingStageID' id='preTrackingStageID" + sno + "'>");  //inject from DB
                                out.println("<input type='hidden' value='" + OB.getTatParamItemId() + "' name='preTatParamItemID' id='preTatParamItemID" + sno + "'>");  //inject from DB
                                out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getStartDate()) + "' name='preStartDateString' id='preStartDateString" + sno + "'>");  //inject from DB, but can be overwrite by user input
                                out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getEndDate()) + "' name='preEndDateString' id='preEndDateString" + sno + "'>");  //inject from DB
                                out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getActualDate()) + "' name='preActualDateString' id='preActualDateString" + sno + "'>");  //inject from DB
                                out.println("<input type='hidden' value='" + OB.getTatApplicable() + "' name='preTatApplicable' id='preTatApplicable" + sno + "'>");  //inject from DB
                                out.println("<input type='hidden' value='" + OB.getReasonExceeding() + "' name='preReason' id='preReason" + sno + "'>");  //user input
                                out.println("<input type='hidden' value='" + OB.isStageActive() + "' name='preIsStageActive' id='preIsStageActive" + sno + "'>");

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
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getStartDate())%>'/>
   							<center><span id='<%=startDateSpan%>'></span>
							<% if(ob.isStageActive() && isPreDisbursementTeam){ %>
								<input type="button" name="start" value="Start" style="width:80px" class="btnNormal" 
									onClick="submitForm('startAction', 'update_duration_date')"/>
							<% } %>	
							</center>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>'  />
							<input type="hidden" name="duration" value='<%=duration%>'  />
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getEndDate())%>'/>
							<center><span id='<%=endDateSpan%>'></span></center></td>
							
							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getActualDate())%>'/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive() && isPreDisbursementTeam){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal" 
									onClick="submitForm('endAction', 'update_duration_date')"/>
							<%} %>
							</center></td>
							
							</td>
							<td><center>
							<html:checkbox property="isTatApplicable" name="ob" disabled='<%=!(ob.isStageActive() && isPreDisbursementTeam)%>' /></center>
							</td></tr>
   							<tr class="<%=rowClass%>"><td>Reason for Exceeding TAT</td>
   							<td colspan="6"><html:select name="ob" disabled="<%=!(ob.isStageActive() && isPreDisbursementTeam)%>" property="reasonExceeding">
                  			<option value="0"><bean:message key="label.please.select"/></option>
							<html:options collection="reasonValList" property="value" labelProperty="label"/>
                			</html:select>
                            <%
                            String preError = "Stage" + (sno - 1);
                            %>
                            <html:errors property="<%=preError%>"/>
                			</td></tr>
   						</logic:iterate>
					</logic:present>
					<tr>
					<td>Remarks</td>
					<td colspan="7"><%--<html:textarea property="remarks"  />--%><html:textarea property="preDisburseRemarks" disabled="<%=!isPreDisbursementTeam%>" cols="90" rows="5"/></td>
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

                                   inCount++;

                                   //OBTatLimitTrack OB = (OBTatLimitTrack) ob;
                                   OBTatLimitTrackStage OB = (OBTatLimitTrackStage) ob;
                                   //let put some hidden value here to map into the TatDocForm
                                   out.println("<input type='hidden' value='" + OB.getTatTrackingStageId() + "' name='inTrackingStageID' id='inTrackingStageID" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + OB.getTatParamItemId() + "' name='inTatParamItemID' id='inTatParamItemID" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getStartDate()) + "' name='inStartDateString' id='inStartDateString" + sno + "'>");  //inject from DB, but can be overwrite by user input
                                   out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getEndDate()) + "' name='inEndDateString' id='inEndDateString" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getActualDate()) + "' name='inActualDateString' id='inActualDateString" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + OB.getTatApplicable() + "' name='inTatApplicable' id='inTatApplicable" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + OB.getReasonExceeding() + "' name='inReason' id='inReason" + sno + "'>");  //user input
                                   out.println("<input type='hidden' value='" + OB.isStageActive() + "' name='inIsStageActive' id='inIsStageActive" + sno + "'>");
                                   
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
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getStartDate())%>'/>
   							<center><span id='<%=startDateSpan%>'></span>
							<%--<% if(sno == 1 && ob.isStageActive()){ %>--%>
                            <% if(ob.isStageActive() && isDisbursementTeam){ %>
								<input type="button" name="Submit" value="Start" style="width:80px" class="btnNormal" 
									onClick="submitForm('startAction', 'update_duration_date')"/>
							<% } %>	
							</center>
							</td>			
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>'  />
							<input type="hidden" name="duration" value='<%=duration%>'  />
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getEndDate())%>'/>
							<center><span id='<%=endDateSpan%>'></span></center></td>
							
							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getActualDate())%>'/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive() && isDisbursementTeam){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal" 
									onClick="submitForm('endAction', 'update_duration_date')"/>
							<%} %>
							</center></td>
							<td><center>
							<html:checkbox property="isTatApplicable" name="ob" disabled='<%=!(ob.isStageActive() && isDisbursementTeam)%>' value="1"/>
							</center></td></tr>
   							<tr class="<%=rowClass%>"><td>Reason for Exceeding TAT</td>
   							<td colspan="6"><html:select name="ob" disabled="<%=!(ob.isStageActive() && isDisbursementTeam)%>" property="reasonExceeding">
                  			<option value="0"><bean:message key="label.please.select"/></option>
							<html:options collection="reasonValList" property="value" labelProperty="label"/>
                			</html:select>
                            <%
                            String inError = "Stage" + (sno - 1);
                            %>
                            <html:errors property="<%=inError%>"/>
                			</td></tr>
   						</logic:iterate>
					</logic:present>
					
					<tr>
					<td>Remarks</td>
					<td colspan="7"><%--<html:textarea property="remarks" />--%><html:textarea property="disbursementRemarks" disabled="<%=!isDisbursementTeam%>" cols="90" rows="5"/></td>
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

                                   postCount++;

                                   //OBTatLimitTrack OB = (OBTatLimitTrack) ob;
                                   OBTatLimitTrackStage OB = (OBTatLimitTrackStage) ob;   
                                   //let put some hidden value here to map into the TatDocForm
                                   out.println("<input type='hidden' value='" + OB.getTatTrackingStageId() + "' name='postTrackingStageID' id='postTrackingStageID" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + OB.getTatParamItemId() + "' name='postTatParamItemID' id='postTatParamItemID" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getStartDate()) + "' name='postStartDateString' id='postStartDateString" + sno + "'>");  //inject from DB, but can be overwrite by user input
                                   out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getEndDate()) + "' name='postEndDateString' id='postEndDateString" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + MaintainTatDurationUtil.getFormattedDate(OB.getActualDate()) + "' name='postActualDateString' id='postActualDateString" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + OB.getTatApplicable() + "' name='postTatApplicable' id='postTatApplicable" + sno + "'>");  //inject from DB
                                   out.println("<input type='hidden' value='" + OB.getReasonExceeding() + "' name='postReason' id='postReason" + sno + "'>");  //user input
                                   out.println("<input type='hidden' value='" + OB.isStageActive() + "' name='postIsStageActive' id='postIsStageActive" + sno + "'>");

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
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getStartDate())%>'/>
   							<center><span id='<%=startDateSpan%>'></span>
							<%--<% if(sno == 1 && ob.isStageActive()){ %>--%>
                            <% if(ob.isStageActive() && isPostDisbursementTeam){ %>       
								<input type="button" name="Submit" value="Start" style="width:80px" class="btnNormal" 
									onClick="submitForm('startAction', 'update_duration_date')"/>
							<% } %>	
							</center>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>'  />
							<input type="hidden" name="duration" value='<%=duration%>'  />
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getEndDate())%>'/>
							<center><span id='<%=endDateSpan%>'></span></center></td>
							
							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=MaintainTatDurationUtil.getFormattedDate(ob.getActualDate())%>'/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive() && isPostDisbursementTeam){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal" 
									onClick="submitForm('endAction', 'update_duration_date')"/>
							<%} %>
							</center></td>
							<td><center>
							<html:checkbox property="isTatApplicable" name="ob" disabled='<%=!(ob.isStageActive() && isPostDisbursementTeam)%>' value="1"/>
							</center></td></tr>
   							<tr class="<%=rowClass%>"><td>Reason for Exceeding TAT</td>
   							<td colspan="6"><html:select name="ob" disabled="<%=!(ob.isStageActive() && isPostDisbursementTeam)%>" property="reasonExceeding">
                  			<option value="0"><bean:message key="label.please.select"/></option>
							<html:options collection="reasonValList" property="value" labelProperty="label"/>
                			</html:select>
                            <%
                            String postError = "Stage" + (sno - 1);
                            %>
                            <html:errors property="<%=postError%>"/>       
                			</td></tr>
   						</logic:iterate>
					</logic:present>
					
					<tr>
					<td>Remarks</td>
					<td colspan="7"><%--<html:textarea property="remarks" />--%><html:textarea property="postDisburseRemarks" disabled="<%=!isPostDisbursementTeam%>" cols="90" rows="5"/></td>
					</tr>
					</tbody>
					</table>
					
				</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
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

        var isTatApplicableCount = 1;
        var reasonExceedingCount = 1;
        
        var preCount = <%=preCount%>;
        var inCount = <%=inCount%>;
        var postCount = <%=postCount%>;
		
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
                var value = "";
				if(checked == true) {
					valueString += "Y,";
                    value = "Y";
                } else {
					valueString += "N,";
                    value = "N";
                }

                if (isTatApplicableCount <= (preCount)) {
                    document.getElementById("preTatApplicable" + isTatApplicableCount).value = value;
                    //alert("pre");
                }else if (isTatApplicableCount <= (preCount + inCount)) {
                    document.getElementById("inTatApplicable" + isTatApplicableCount).value = value;
                    //alert("in");
                }else if (isTatApplicableCount <= (preCount + inCount + postCount)) {
                    document.getElementById("postTatApplicable" + isTatApplicableCount).value = value;
                    //alert("post");
                }

                isTatApplicableCount++;

			}
			else if (type == 'select-one' && name == 'reasonExceeding') 
			{
				var value = formObj.elements[i].value;
				valueString += value + ";";

                if (reasonExceedingCount <= (preCount)) {
                    document.getElementById("preReason" + reasonExceedingCount).value = value;
                    //alert("pre");
                }else if (reasonExceedingCount <= (preCount + inCount)) {
                    document.getElementById("inReason" + reasonExceedingCount).value = value;
                    //alert("in");
                }else if (reasonExceedingCount <= (preCount + inCount + postCount)) {
                    document.getElementById("postReason" + reasonExceedingCount).value = value;
                    //alert("post");
                }

                reasonExceedingCount++;
			}
	
		 }

		valueString = valueString.substring(0, valueString.length - 1);
	    
	    if(action == 'startAction') {
			document.forms[0].isStartAction.value = "Y";
        } else if(action == 'endAction') {
			document.forms[0].isStartAction.value = "N";
        } else {
	    	document.forms[0].isStartAction.value = "";
        }
	    document.forms[0].event.value = event;
	    document.forms[0].tatParamStageTrackingString.value = valueString;
	    document.forms[0].submit();
	}
</script>
</body>
</html>