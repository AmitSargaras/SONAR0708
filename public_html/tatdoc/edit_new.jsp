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

<%@page import="com.integrosys.cms.app.tatduration.bus.OBTatParamItem"%><html>
<head>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript"><!--


function startDateChange1(field, span)
{
	alert(field);
}
	

	

	/*function getStoredFormatDateByDB(storedDate)
	{
		var date = storedDate.split(" ")[0];
		var time = storedDate.split(" ")[1];
		alert(date + "\t" + time);
		var day = date.split("-")[2] + "/";
		var month = date.split("-")[1] + "/";
		var year = date.split("-")[0] + "-";

		var hour = time.split(":")[0] + ":";
		var minute = time.split(":")[1] + ":";
		var second = time.split(":")[2];
		second = second.split(".")[0];
		
		var time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
		
		return day + month + year + time;
	}*/

	function reformatDateField()
	{
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
				if(name == 'startDate')
				{
					row++;
					span = "startDateSpan" + row;
					alert(formObj.elements[i].value);
				}
				
				var date = formObj.elements[i].value;
				if(date != "")
				{
					String storedDate = getStoredFormatDateByDB(date);
					formObj.elements[i].value = getddmmyyyy(date);
				}
			}

		 }
		
	}

	// input yyyy-mm-dd
	function getddmmyyyy(date)
	{
		var dates = date.split("-");
		return dates[2] + "/" + dates[1] + "/" + dates[0];
	}

	

	

	function isChangeInDisbmtMaintain (){
		if(document.forms[0].isPAOrSolInvolvementReq[0].checked){
			return false;
		}else{
			return true;
			}
	}

	function setByPAOrSolInvolvementReq(){
		
	}

	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	} 
--></script>
<%
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	String approvalDate = DateUtil.formatDate(locale,(profile.getApprovalDate()));
	
    int sno = 0;
%>
</head>

<p class="required"><font color="#0000FF">*</font> Mandatory for
Submission&nbsp;</p>
<br>
<body onload="javascript:init()" >
<html:form action="TatDoc.do">
	<input type="hidden" name="event">
	<input type="hidden" name="tatParamStageTrackingString" />

	<table width="100%" border="0" align="center" cellpadding="0"
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
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="8" style="text-align: left"><bean:message
								key="label.pre.disbursement.documentation" /></td>
						</tr>
						<tr>
							<td width="10%">Start Date</td>
							<td width="30%">Pre Stage</td>
							<td width="30%">Post Stage</td>
							<td>Duration<br>(w/days)</td>
							<td width="10%">Forecasted<br>End Date</td>
							<td width="10%">Actual date</td>
							<td>Reason for<br>Exceeding TAT</td>
							<td>Applicable<br>TAT Stage</td>
						</tr>
					</thead>
					<tbody>
					<logic:present name="stagePreDibursmentList">
   						<logic:iterate id="ob" name="stagePreDibursmentList"  type="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrack" >
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
   							<html:hidden property="tatTrackingId" name="ob"/>
   							<html:hidden property="tatParamItemId" name="ob"/>
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=ob.getStartDate()%>'/>
   							<center><span id='<%=startDateSpan%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="start" value="Start" style="width:80px" class="btnNormal" 
									onClick="startDateChange('<%=startDateField%>', '<%=startDateSpan%>')"/>
							<% } %>	
							</center>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>'  />
							<input type="hidden" name="duration" value='<%=duration%>'  />
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=ob.getEndDate()%>'/>
							<center><span id='<%=endDateSpan%>'></span></center></td>
							
							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=ob.getActualDate()%>'/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal" 
									onClick="actualDateChange('<%="actualDateSpan" + sno%>', '<%="actualDateSpan" + sno%>')"/>
							<%} %>
							</center></td>
							<td align="center">&nbsp;&nbsp;
							 <html:select name="ob" disabled="<%=!ob.isStageActive()%>" property="reasonExceeding" >
                  			<option value=""><bean:message key="label.please.select"/></option>
							<!--<html:options collection="reasonValList" property="value" labelProperty="label"/>-->
                			</html:select>
							<!--<html:select property="reasonExceeding" disabled='<%=!ob.isStageActive()%>'  name="ob">
								<html:option value="0">Please Select</html:option>
                                <html:option value="1">Days</html:option>
                                <html:option value="2">Hours</html:option>
							</html:select> -->
							</td>
							<td><center>
							<%
								boolean isTracked = false;
								if(ob.getTatTrackingId() != 0)
									isTracked = true;
									
							%>
							<html:checkbox property="isTatApplicable" name="ob" disabled='<%=isTracked%>' />
							</center>
							</td>
   							</tr>
   						</logic:iterate>
					</logic:present>
					
					<tr>
					<td>Remarks</td>
					<td colspan="7"><html:textarea property="remarks"  /></td>
					</tr>
					</tbody>
					</table>
					
				</td></tr>
				
			
				<!--  Disbursment Table -->
			<tr>
				<td><br>
				<br>
				<hr>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="8" style="text-align: left"><bean:message
								key="label.disbursement.documentation" /></td>
						</tr>
						<tr>
							<td width="10%">Start Date</td>
							<td width="30%">Pre Stage</td>
							<td width="30%">Post Stage</td>
							<td>Duration<br>(w/days)</td>
							<td width="10%">Forecasted<br>End Date</td>
							<td width="10%">Actual date</td>
							<td>Reason for<br>Exceeding TAT</td>
							<td>Applicable<br>TAT Stage</td>
						</tr>
					</thead>
					<tbody>
					<logic:present name="stageDibursmentList">
   						<logic:iterate id="ob" name="stageDibursmentList"  type="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrack" >
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
   							<html:hidden property="tatTrackingId" name="ob"/>
   							<html:hidden property="tatParamItemId" name="ob"/>
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=ob.getStartDate()%>'/>
   							<center><span id='<%=startDateSpan%>'></span>
							<% if(sno == 1 && ob.isStageActive()){ %>
								<input type="button" name="Submit" value="Start" style="width:80px" class="btnNormal" 
									onClick="startDateChange('<%=startDateField%>', '<%=startDateSpan%>')"/>
							<% } %>	
							</center>
							</td>			
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>'  />
							<input type="hidden" name="duration" value='<%=duration%>'  />
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=ob.getEndDate()%>'/>
							<center><span id='<%=endDateSpan%>'></span></center></td>
							
							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=ob.getActualDate()%>'/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal" 
									onClick="actualDateChange('<%="actualDateSpan" + sno%>', '<%="actualDateSpan" + sno%>')"/>
							<%} %>
							</center></td>
							 <td align="center">&nbsp;&nbsp;
							 <html:select name="ob" disabled="<%=!ob.isStageActive()%>" property="reasonExceeding" >
                  			<option value=""><bean:message key="label.please.select"/></option>
							<!--<html:options collection="reasonValList" property="value" labelProperty="label"/>-->
                			</html:select>
							<!--<html:select property="reasonExceeding" disabled='<%=!ob.isStageActive()%>'  name="ob">
								<html:option value="0">Please Select</html:option>
                                <html:option value="1">Days</html:option>
                                <html:option value="2">Hours</html:option>
							</html:select> -->
							</td>
							<td><center>
							<%
								boolean isTracked = false;
								if(ob.getTatTrackingId() != 0)
									isTracked = true;
									
							%>
							<html:checkbox property="isTatApplicable" name="ob" disabled='<%=isTracked%>' value="1"/>
							</center>
							</td>
   							</tr>
   						</logic:iterate>
					</logic:present>
					
					<tr>
					<td>Remarks</td>
					<td colspan="7"><html:textarea property="remarks" /></td>
					</tr>
					</tbody>
					</table>
					
				</td></tr>
				
				<!--  Disbursment Table -->
			<tr>
				<td><br>
				<br>
				<hr>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblinfo" style="margin-top: 0" >
					<thead>
						<tr class="odd">
							<td colspan="8" style="text-align: left"><bean:message
								key="label.post.disbursement.documentation" /></td>
						</tr>
						<tr>
							<td width="10%">Start Date</td>
							<td width="30%">Pre Stage</td>
							<td width="30%">Post Stage</td>
							<td>Duration<br>(w/days)</td>
							<td width="10%">Forecasted<br>End Date</td>
							<td width="10%">Actual date</td>
							<td>Reason for<br>Exceeding TAT</td>
							<td>Applicable<br>TAT Stage</td>
						</tr>
					</thead>
					<tbody>
					<logic:present name="stagePostDibursmentList">
   						<logic:iterate id="ob" name="stagePostDibursmentList"  type="com.integrosys.cms.app.maintaintat.bus.OBTatLimitTrack" >
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
   							<html:hidden property="tatTrackingId" name="ob"/>
   							<html:hidden property="tatParamItemId" name="ob"/>
   							<input type="hidden" name="startDate" id='<%=startDateField%>' value='<%=ob.getStartDate()%>'/>
   							<center><span id='<%=startDateSpan%>'></span>
							<% if(sno == 1 && ob.isStageActive()){ %>
								<input type="button" name="Submit" value="Start" style="width:80px" class="btnNormal" 
									onClick="startDateChange('<%=startDateField%>', '<%=startDateSpan%>')"/>
							<% } %>	
							</center>
							</td>
   							<td><%= item.getPreStage()%></td>
                         	<td><%= item.getPostStage()%></td>
							<td><input type="hidden" name="durationType" value='<%=item.getDurationType()%>'  />
							<input type="hidden" name="duration" value='<%=duration%>'  />
							<center><%=duration + "<br/>" + durationType%></center></td>
							<td><input type="hidden" name="endDate" id='<%=endDateField%>' value='<%=ob.getEndDate()%>'/>
							<center><span id='<%=endDateSpan%>'></span></center></td>
							
							<td><input type="hidden" name="actualDate" id='<%="actualDateField" + sno%>' value='<%=ob.getActualDate()%>'/>
							<center><span id='<%="actualDateSpan" + sno%>'></span>
							<% if(ob.isStageActive()){ %>
								<input type="button" name="end" value="End" style="width:80px" class="btnNormal" 
									onClick="actualDateChange('<%="actualDateSpan" + sno%>', '<%="actualDateSpan" + sno%>')"/>
							<%} %>
							</center></td>
							 <td align="center">&nbsp;&nbsp;
							 <html:select name="ob" disabled="<%=!ob.isStageActive()%>" property="reasonExceeding" >
                  			<option value=""><bean:message key="label.please.select"/></option>
							<!--<html:options collection="reasonValList" property="value" labelProperty="label"/>-->
                			</html:select>
							<!--<html:select property="reasonExceeding" disabled='<%=!ob.isStageActive()%>'  name="ob">
								<html:option value="0">Please Select</html:option>
                                <html:option value="1">Days</html:option>
                                <html:option value="2">Hours</html:option>
							</html:select> -->
							</td>
							<td><center>
							<%
								boolean isTracked = false;
								if(ob.getTatTrackingId() != 0)
									isTracked = true;
									
							%>
							<html:checkbox property="isTatApplicable" name="ob" disabled='<%=isTracked%>' value="1"/>
							</center>
							</td>
   							</tr>
   						</logic:iterate>
					</logic:present>
					
					<tr>
					<td>Remarks</td>
					<td colspan="7"><html:textarea property="remarks" /></td>
					</tr>
					</tbody>
					</table>
					
				</td></tr>
				
			<tr>
			<td>
			<br><br>
			<center><a href="#"	onclick="submitForm()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)">
						<img src="img/submit1.gif" name="Image3" width="75" height="20"	border="0" id="Image3" /> </a></center>
			<br><br><br>
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
				var storedDate = getStoredFormatDateByDB(date);
				formObj.elements[i].value = storedDate;
				document.getElementById(span).innerHTML = getDisplayFormatDate(storedDate) + "<br/>";
			}

			if(date != "" && date != "null" && name == "endDate")
			{
				span = "endDateSpan" + row;
				var storedDate = getStoredFormatDateByDB(date);
				formObj.elements[i].value = storedDate;
				document.getElementById(span).innerHTML = getDisplayFormatDate(storedDate) + "<br/>";
			}

			if(date != "" && date != "null" && name == "actualDate")
			{
				span = "actualDateSpan" + row;
				var storedDate = getStoredFormatDateByDB(date);
				formObj.elements[i].value = storedDate;
				document.getElementById(span).innerHTML = getDisplayFormatDate(storedDate) + "<br/>";
			}
		}
	}


	function getStoredFormatDateByDB(storedDate)
	{
		var date = storedDate.split(" ")[0];
		var time = storedDate.split(" ")[1];

		var day = date.split("-")[2] + "/";
		var month = date.split("-")[1] + "/";
		var year = date.split("-")[0] + "-";

		var hour = time.split(":")[0];
		var minute = time.split(":")[1];
		var second = time.split(":")[2];
		second = second.split(".")[0];

		var time = hour + ":" + minute + ":" + second;
		
		return day + month + year + time;
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

		return day + month + year + " " + time;
	}

	// 0 = January
	function getMonthName(month)
	{
		if(month == 0)
			return "Jan";
		if(month == 1)
			return "Feb";
		if(month == 2)
			return "Mar";
		if(month == 3)
			return "Apr";
		if(month == 4)
			return "May";
		if(month == 5)
			return "Jun";
		if(month == 6)
			return "Jul";
		if(month == 7)
			return "Augt";
		if(month == 8)
			return "Sep";
		if(month == 9)
			return "Oct";
		if(month == 10)
			return "Nov";
		if(month == 11)
			return "Dec";
	}

	

	function startDateChange(field, span)
	{
		var formObj = document.forms[0];
		var endDate = "";
		var durationType = "";
		var row = 1;
		var activeRowStarted = false;
		var currentTime = new Date();
		var startDate = getStoredFormatDate(currentTime);
		document.getElementById(field).value= startDate;
		document.getElementById(span).innerHTML = getDisplayFormatDate(startDate) + "<br/>";

		for (var i=0; i<formObj.elements.length; i++)
		{
		    var type = formObj.elements[i].type;
			var name = formObj.elements[i].name;
			var id = formObj.elements[i].id;

				if (type == 'button' && name == 'start')
					activeRowStarted = true;

				if (type == 'hidden' && name == 'actualDate')
					row++;

				if(activeRowStarted)
				{
					if (type == 'hidden' && name == 'duration')
					{
						var duration = formObj.elements[i].value;
						endDate = getDueDate(startDate, duration, durationType);
					}

					else if (type == 'hidden' && name == 'durationType')
					{
						durationType = formObj.elements[i].value;
					}
					
					else if (type == 'hidden' && name == 'endDate')
					{
						formObj.elements[i].value = endDate;
						document.getElementById("endDateSpan" + row).innerHTML = getDisplayFormatDate(endDate);
					}
					
					else if (type == 'hidden' && name == 'startDate')
					{
						formObj.elements[i].value = endDate;
						document.getElementById("startDateSpan" + row).innerHTML = getDisplayFormatDate(endDate);
						startDate = endDate;
					}
				}
				
		 }
		
	}

	function actualDateChange(field, span)
	{
		var formObj = document.forms[0];
		var startDate = "";
		var endDate = "";
		var durationType = "";
		var row = 1;
		var activeRowStarted = false;
		var currentTime = new Date();
		var actualDate = getStoredFormatDate(currentTime);
		document.getElementById(field).value= actualDate;
		document.getElementById(span).innerHTML = getDisplayFormatDate(actualDate) + "<br/>";
		
		for (var i=0; i<formObj.elements.length; i++)
		{
		    var type = formObj.elements[i].type;
			var name = formObj.elements[i].name;
			var id = formObj.elements[i].id;

			if (type == 'button' && name == 'end')
				activeRowStarted = true;

			if (type == 'hidden' && name == 'actualDate')
				row++;
			
			if(activeRowStarted)
			{
				if (type == 'hidden' && name == 'actualDate')
				{
					actualDate = formObj.elements[i].value;
				}

				else if (type == 'hidden' && name == 'durationType')
				{
					durationType = formObj.elements[i].value;
				}

				else if (type == 'hidden' && name == 'startDate')
				{
					if(actualDate != "" && actualDate != "null")
					{
						formObj.elements[i].value = actualDate;
						document.getElementById("startDateSpan" + row).innerHTML = getDisplayFormatDate(actualDate);
						startDate = actualDate;
					}
					else if(actualDate == "" && formObj.elements[i].value != "")
					{
						// do nothing
					}
					else
					{
						formObj.elements[i].value = endDate;
						document.getElementById("startDateSpan" + row).innerHTML = getDisplayFormatDate(endDate);
						startDate = endDate;
					}
				}
				
				if (type == 'hidden' && name == 'duration')
				{
					var duration = formObj.elements[i].value;
					endDate = getDueDate(startDate, duration, durationType);
				}
				
				else if (type == 'hidden' && name == 'endDate')
				{
					if(actualDate != "" || actualDate != "null")
					{
						formObj.elements[i].value = endDate;
						document.getElementById("endDateSpan" + row).innerHTML = getDisplayFormatDate(endDate);
						actualDate = "";
					}
				}

			}

		 }
		
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

	// format date dd/M/y 13/08/1989
	function getDueDate(dateTime, duration, type)
	{
		var date = dateTime.split("-")[0];
		var time = dateTime.split("-")[1];
		var dates = date.split("/");
		var dd = dates[0], mm = dates[1], yy = dates[2];
		var numberDayOfMonth = getNumberDaysOfMonth(date);
		var balanceDay = numberDayOfMonth - dd;
		if(type == "D")
			return getNextMonthDate(date, duration, balanceDay) + "-" + time;
		else if(type == "H")
			return addHour(date, time, duration);
	}

	function addHour(date, time, duration)
	{
		var dateTime = "";

		var day = eval(date.split("/")[0]);
		var month = eval(date.split("/")[1]);
		var year = eval(date.split("/")[2]);

		var hour = eval(time.split(":")[0]);
		var minute = eval(time.split(":")[1]);
		var second = time.split(":")[2];

		var durHour = 0;
		var durDay = 0;
		var durMinute = 0;
		if(duration.split(".").length > 1)
		{
			durMinute = eval("0." + duration.split(".")[1]) * 60;
			duration = eval(duration.split(".")[0]);

			minute = minute + durMinute;
			if(minute>=60)
			{
				duration = duration + 1;
				minute = minute - 60;
			}

			if(minute<10)
				minute = "0" + minute;
		}
				
		durHour = eval(duration);
		if(durHour>=24)
		{
			var balanceHour = durHour % 24;
			durDay = eval(durHour / 24);
			durHour = balanceHour;
		}

		hour = hour + durHour;
		if(hour>=24)
		{
			durDay++;
			hour = hour - 24;
		}

		day = day + durDay;
		if(day>getNumberDaysOfMonth(date))
		{
			month = month + 1;
			day = day - getNumberDaysOfMonth(date);
		}

		var time = hour + ":" + minute + ":" + second;

		return day + "/" + month + "/" + year + "-" + time;
	}

	function getNextMonthDate(date, duration, balanceDay)
	{
		var dates = date.split("/");
		if(duration <= balanceDay)
		{
			dates[0] = eval(dates[0]) + eval(duration);
			return dates[0] + "/" + dates[1] + "/" + dates[2];
		}
		else if(duration > balanceDay)
		{
			duration = duration - balanceDay;
			dates[0] = 0;
			if(dates[1] == "12")
			{
				dates[1] == "1";
				dates[2] = eval(dates[2]) + 1;
			}
			else
				dates[1] = eval(dates[1]) + 1;

			date = dates[0] + "/" + dates[1] + "/" + dates[2];
			balanceDay = getNumberDaysOfMonth(date) - eval(dates[0]);

			return getNextMonthDate(date, duration, balanceDay);
		}
	}

	function getNumberDaysOfMonth(date)
	{
		var dates = date.split('/');
		var month = dates[1];

		if(eval(month) == 1 || eval(month) == 3 || eval(month) == 5 || eval(month) == 7 || eval(month) == 8
			|| eval(month) == 10 || eval(month) == 12)
			return 31;
		else if(eval(month) == 4 || eval(month) == 6 || eval(month) == 9 || eval(month) == 11)
			return 30;
		else if(eval(month) == 2 && eval(month)%4 == 0)
			return 29;
		else
			return 28;

		return 0;
	}

	function submitForm() 
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
			if (type == 'hidden' && name == 'tatTrackingId')
			{
				var tatTrackingId = formObj.elements[i].value;
				if(tatTrackingId == "")
					tatTrackingId = "0";
				valueString += tatTrackingId + ",";
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

			else if (type == 'select-one' && name == 'reasonExceeding') 
			{
				var value = formObj.elements[i].value;
				valueString += value + ",";
			}

			else if (type == 'checkbox' && name == 'isTatApplicable')
			{
				var checked = formObj.elements[i].checked;
				if(checked == true)
				{
					valueString += "Y;";
				}
				else
				{
					valueString += "N;";
				}

			}
			
	
		 }

		valueString = valueString.substring(0, valueString.length - 1);
	    document.forms[0].event.value = "<%=TatDocAction.EVENT_COMMIT%>";
	    document.forms[0].tatParamStageTrackingString.value = valueString;
	    document.forms[0].submit();
	}
</script>
</body>
</html>