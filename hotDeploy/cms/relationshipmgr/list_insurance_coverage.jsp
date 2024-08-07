<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	SearchResult notificationList = (SearchResult) request.getAttribute("insuranceCoverageList");
	
	String ICId = null;
	int index = 0;
	int sno = 0;
	int startInd = 0;
	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	if (notificationList != null) {
		resultList = notificationList.getResultList();
		startInd = notificationList.getStartIndex();
		totalCount = notificationList.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("listSize", Integer.toString(listSize));
		pageContext.setAttribute("InsuranceCoverageList", resultList);
	}
%> 



<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.insurancecoverage.InsuranceCoverageAction"%><html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}

	function addNew() {
	    document.forms[0].action = "InsuranceCoverage.do?event=prepare_create_insurance_coverage";
	    document.forms[0].submit();
	}

	function searchIC()
    {	
	    var icCode = document.getElementById("txtICCode").value;
        var companyName = document.getElementById("txtCompanyName").value;
        if(icCode=='' && companyName==''){
	        document.forms[0].action = "InsuranceCoverage.do?event=list_insurance_coverage";
	        document.forms[0].submit();
        }else{
	    	document.forms[0].action  = "InsuranceCoverage.do?event=list_insurance_coverage&ICCode="+icCode+"&CompanyName="+companyName;
		    document.forms[0].submit();
        }        
    }

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="InsuranceCoverage.do">
		<input type="hidden" name="ICId" />
		<input type="hidden"
			name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0" />
		<input type="hidden" name="totalNotificationCount"
			value="<%=notificationList.getNItems()%>" />

		<tr>
				
			<td width="100%" height="100%" valign="bottom">
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tblFormSection"
				id="contentWindow">
				
				<tr height="95%">
					<td valign="top">
					<table width="96%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<tr>
							<td width="100%" valign="bottom"><h3>Insurance Coverage</h3>
                                    <hr />
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tr>
									<td><br />
									<font size="2"> IC Code : <input type="text"
										size="25" id="txtICCode" /> &nbsp;&nbsp; Company Name : <input
										type="text" size="25" id="txtCompanyName" /> &nbsp;&nbsp;
									&nbsp;&nbsp;</font>
									<a href="#" target="_self"><img src="img/search.gif"
										border="0" onclick="searchIC()" /></a></td>
								</tr>	
									<tr>
										<td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add" class="btnNormal" onclick="addNew()"/>
										</td>
										
									</tr>

									<tr>
										<td colspan="2">
										<br />
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="10%">Insurance Coverage Code</td>
													<td width="15%">Company Name</td>
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>
												<logic:greaterThan name="listSize" value="0">
													<logic:iterate id="OB" name="InsuranceCoverageList"
														type="com.integrosys.cms.app.insurancecoverage.bus.OBInsuranceCoverage"
														scope="page">
														<%
															String rowClass = "";
																		sno++;
																		if (sno % 2 != 0) {
																			rowClass = "odd";
																		} else {
																			rowClass = "even";
																		}
														%>
														<tr class="<%=rowClass%>">
															<%
															ICId = Long.toString(OB.getId());
															%>
															<td class="index"><%=sno%></td>

															<td><%=OB.getInsuranceCoverageCode()%></td>

															<td><%=OB.getCompanyName()%></td>

															<td><select name="chooseAction"
																onchange="MM_jumpMenu('self',this,0)">
																<option value="#" selected="selected">Please Select</option>

																<option
																	value="InsuranceCoverage.do?event=view_insurance_coverage_by_index&ICId=<%=ICId%>">View</option>

																<option
																	value="InsuranceCoverage.do?event=prepare_maker_submit_edit&ICId=<%=ICId%>">Edit</option>

																<option
																	value="InsuranceCoverage.do?event=prepare_maker_submit_remove&ICId=<%=ICId%>">Delete</option>

															</select></td>

														</tr>
													</logic:iterate>
												</logic:greaterThan>
												<logic:equal name="listSize" value="0">
													<tr>
														<td colspan="13">Sorry,No Records Found</td>
													</tr>
												</logic:equal>
											</tbody>
										</table>
										</td>
									</tr>
							</table>
							</td>
							</tr>
					</table>
					</td>
				</tr>
			</table>

			</td>
		</tr>
	</html:form>
</table>
</body>
</html>

