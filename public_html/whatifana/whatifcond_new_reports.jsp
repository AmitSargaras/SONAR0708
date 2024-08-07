<%@ page
	import="com.integrosys.cms.ui.whatifana.WhatIfCondReportAction,
	com.integrosys.cms.ui.whatifana.WhatIfCondReportForm,
	com.integrosys.cms.ui.whatifana.WhatIfCondReportConstants,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	org.apache.commons.lang.StringUtils,
	com.integrosys.cms.ui.common.CommonCodeList,
	com.integrosys.base.techinfra.context.BeanHouse,
	com.integrosys.base.techinfra.dbsupport.JdbcResultGenerator,
	org.apache.struts.util.LabelValueBean,
	java.util.List,
	java.util.Iterator,
	java.util.ArrayList
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<html>
<head>
<title>What-If-Conditions</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgCheckForm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/calendar.js"></script>
<script language="JavaScript" type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/enableFields.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function submitForm() {
    document.forms[0].submit();
}

function getSample(reportType) {
    document.forms[0].sample.value = reportType;
    document.forms[0].event.value = "<%=WhatIfCondReportAction.EVENT_SAMPLE%>";
    document.forms[0].submit();
}

function refreshDistrictAndMukim(stateDropDown) {
	var stateValue = stateDropDown.options[stateDropDown.selectedIndex].value;

	if (stateValue == 'ALL') {
		var districtDropDown = document.getElementsByName('district')[0];
		while(districtDropDown.options.length > 0) {
        	districtDropDown.remove(0);
     	}
		districtDropDown.options[0] = new Option('ALL', 'ALL');
		
		var mukimDropDown = document.getElementsByName('mukim')[0];
		while(mukimDropDown.options.length > 0) {
        	mukimDropDown.remove(0);
     	}
		mukimDropDown.options[0] = new Option('ALL', 'ALL');
	}
	else {		
		var url = 'RefreshCommonCodesWithAllOption.do?categoryCode=DISTRICT&refEntryCode='+stateValue;
		sendLoadDropdownReq('district', url);
	
		var url = 'RefreshCommonCodesWithAllOption.do?categoryCode=MUKIM&refEntryCode='+stateValue;
		sendLoadDropdownReq('mukim', url);
	}
}

function refreshCounters(indexTypeDropDown) {
	var indexTypeValue = indexTypeDropDown.options[indexTypeDropDown.selectedIndex].value;

	var url = 'GetCountersByCollateralSubtype.do?marketableSubType='+indexTypeValue;
	sendLoadDropdownReq('stockCode', url);
}

function refreshModel(makeDrowDown) {
	var makeValue = makeDrowDown.options[makeDrowDown.selectedIndex].value;

	if (makeValue == 'ALL') {
		var modelDropDown = document.getElementsByName('model')[0];
		while(modelDropDown.options.length > 0) {
        	modelDropDown.remove(0);
     	}
		modelDropDown.options[0] = new Option('ALL', 'ALL');
	}
	else {
		var url = 'RefreshCommonCodesWithAllOption.do?categoryCode=MODEL&refEntryCode='+makeValue;
		sendLoadDropdownReq('model', url);
	}
}

function getSampleReport(reportType) {
	if (reportType == '<%=WhatIfCondReportConstants.REPORT_TYPE_STATE%>') {
		var url = '<%=request.getContextPath()%>/whatifana/whatifcond_sample_download.jsp?reportType=<%=WhatIfCondReportConstants.REPORT_TYPE_STATE%>' ;
	} else if (reportType == '<%=WhatIfCondReportConstants.REPORT_TYPE_INDEX_TYPE%>') {
		var url = '<%=request.getContextPath()%>/whatifana/whatifcond_sample_download.jsp?reportType=<%=WhatIfCondReportConstants.REPORT_TYPE_INDEX_TYPE%>' ;
	} else if (reportType == '<%=WhatIfCondReportConstants.REPORT_TYPE_MAKE%>') {
		var url = '<%=request.getContextPath()%>/whatifana/whatifcond_sample_download.jsp?reportType=<%=WhatIfCondReportConstants.REPORT_TYPE_MAKE%>' ;
	} else if (reportType == '<%=WhatIfCondReportConstants.REPORT_TYPE_GOLD_GRADE%>') {
		var url = '<%=request.getContextPath()%>/whatifana/whatifcond_sample_download.jsp?reportType=<%=WhatIfCondReportConstants.REPORT_TYPE_GOLD_GRADE%>' ;
	}
	
	MM_openBrWindow(url, 'SampleReport', "left=220,top=10,height=400, width=450, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'no');
}

var w = null;
function MM_openBrWindow(theURL,winName,features) {
    if(w != undefined && isOpen() && w.name == winName){
        w.location.replace(theURL);
    } else {
    	w = window.open(theURL,winName,features);
    }
	w.focus();
}

function isOpen(){
  	try{
    	w.document;
    	return true;
  	} catch(ex){}
  	return false;
}

//-->
</script>

<%
	WhatIfCondReportForm actionForm = (WhatIfCondReportForm) pageContext.findAttribute("whatIfCondReportForm");
			
	String sample = actionForm.getSample();
	if (sample != null && sample.length() > 0) {

	%>
	<script language="JavaScript" type="text/JavaScript">
	<!--
		getSampleReport('<%=sample%>');
	//-->
	</script>
	<% 
	}
	int index = 0;

	// Get Team
	ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
							+ IGlobalConstant.USER_TEAM);

	// Get Country Allow
	String[] countrys = userTeam.getCountryCodes();
	
	// regenerate the options list in case of any fail of form validation
	String state = request.getParameter("state");
	String indexType = request.getParameter("indexType");
	String make = request.getParameter("make");

	if (state != null && state.length() > 0) {
		List districtOptionsList = CommonCodeList.getInstance(null,null,"DISTRICT",false,state).getOptionList();
		districtOptionsList.add(new LabelValueBean("ALL","ALL"));
		pageContext.setAttribute("districtOptionsList", districtOptionsList);

		List mukimOptionsList = CommonCodeList.getInstance(null,null,"MUKIM",false,state).getOptionList();
		mukimOptionsList.add(new LabelValueBean("ALL","ALL"));
		pageContext.setAttribute("mukimOptionsList", mukimOptionsList);
	}

	if (make != null && make.length() > 0) {
		List modelOptionsList = CommonCodeList.getInstance(null,null,"MODEL",false,make).getOptionList();
		modelOptionsList.add(new LabelValueBean("ALL","ALL"));
		pageContext.setAttribute("modelOptionsList", modelOptionsList);
	}

	if (indexType != null && indexType.length() > 0) {
		List counterOptionsList = new ArrayList();
		
		JdbcResultGenerator counterResults = (JdbcResultGenerator) BeanHouse.get("stockNameAndCodeResultGenerator");
		List countersNameAndCode = (List) counterResults.getResult(new Object[] {indexType});
		for (Iterator itr = countersNameAndCode.iterator(); itr.hasNext(); ) {
			String[] labelValue = (String[]) itr.next();
			counterOptionsList.add(new LabelValueBean(labelValue[0], labelValue[1]));
		}
		counterOptionsList.add(new LabelValueBean("ALL","ALL"));
		
		pageContext.setAttribute("counterOptionsList", counterOptionsList);
	}
	
%>
</head>
<body>
<html:form action="WhatIfCond.do">
	<input type="hidden" name="event" value="<%=WhatIfCondReportAction.EVENT_GENERATE%>" />
	<html:hidden property="sample" value="" />

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="100%" valign="top">

							<table width="90%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="tblFormSection" style="margin-top: 10px">
								<thead>
									<tr>
										<td>
										<h3><bean:message key="title.whatifcond" /></h3>
										</td>
										<td align="right" valign="bottom"></td>
									</tr>
									<tr>
										<td colspan="2">
										<hr />
										</td>
									</tr>
									<tr>
										<td colspan="2"><bean:message key="title.whatifcond.instruction" /></td>
									</tr>
									<tr>
										<td colspan="">&nbsp;</td>
									</tr>
									<tr>
										<td>
										<table width="100%" border="0" align="center" cellpadding="0"
											cellspacing="0" class="tblFormSection">
											<tr bgcolor="#CCCCCC">
												<td style="text-align: center" width="15%">
													<b><bean:message key="label.whatifcond.report.name" /></b> <bean:message key="label.mandatory" /> : &nbsp;
												</td>
												<td style="text-align: left">
												<html:text property="reportName" maxlength="255" size="90" />&nbsp;
												<html:errors property="reportName" /></td>
											</tr>
										</table>
										</td>
									</tr>
									<tr>
										<td colspan="1">&nbsp;</td>
									</tr>
								</thead>
								<tbody>
									<tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											class="tblInput">
											<thead>
												<tr>
													<td width="3%"><bean:message key="label.global.sn"/></td>
													<td width="40%"><bean:message key="label.whatifcond.scenario.report"/></td>
													<td width="45%"><bean:message key="label.whatifcond.test.conditions"/></td>
													<td width="15%"><bean:message key="label.select" /></td>
												</tr>
											</thead>
											<tbody>
												<tr class="even">
													<td class="index" valign="top">1</td>
													<td valign="top">In each report, all properties are consolidated by State. Property sub-types are listed and
													aggregated by District, Mukim and Taman/Batu/Kampung for that State. <br>
													<br>
													(Report Short Description: Property by State)<br>
													<br>
													<a href="javascript:getSampleReport('<%=WhatIfCondReportConstants.REPORT_TYPE_STATE %>');"><bean:message key="label.whatifcond.view.sample.report" /></a></td>
													<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" >
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.state" />&nbsp;<bean:message key="label.mandatory" /></td>
															<td><html:select property="state" onchange="refreshDistrictAndMukim(this)">
																	<html:options name="stateValues" labelName="stateLabels" />
																</html:select> 
																<html:errors property="state" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.security.property.district" />&nbsp;<bean:message key="label.mandatory" /></td>
															<td><html:select property="district">
																	<logic:present name="districtOptionsList">
																		<option label="Please Select" value="" />
																		<html:optionsCollection name="districtOptionsList" label="label" value="value" />
																	</logic:present>
																	<logic:notPresent name="districtOptionsList">
																		<option label="Please Select" value="" />
																	</logic:notPresent>
																</html:select> 
																<html:errors property="district" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.mukim" />&nbsp;<bean:message key="label.mandatory" /></td>
															<td><html:select property="mukim">
																	<logic:present name="mukimOptionsList">
																		<option label="Please Select" value="" />
																		<html:optionsCollection name="mukimOptionsList" label="label" value="value" />
																	</logic:present>
																	<logic:notPresent name="mukimOptionsList">
																		<option label="Please Select" value="" />
																	</logic:notPresent>
																</html:select> 
																<html:errors property="mukim" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.direction.of.value" /><bean:message key="label.mandatory" /></td>
															<td>
																<html:select property="directionState">
																	<html:options name="directionValues" labelName="directionLabels" />
																</html:select> 
																<html:errors property="directionState" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.percentage.change" /> <bean:message key="label.mandatory" /></td>
															<td><html:text property="percentageState" size="3" maxlength="3"/>%
																<html:errors property="percentageState" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.report.format" /> <bean:message key="label.mandatory" /></td>
															<td>
															<html:radio property="reportFormatProperty" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_SUMMARY %>">
																<bean:message key="label.whatifcond.report.format.summary" />
															</html:radio>
															<html:radio property="reportFormatProperty" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_PER_BORROWER %>">
																<bean:message key="label.whatifcond.report.format.per.borrower" />
															</html:radio>
															<html:errors property="reportFormatProperty" />
															</td>
														</tr>
													</table>
													</td>
													<td style="text-align: center">
														<html:radio property="reportType" value="<%=WhatIfCondReportConstants.REPORT_TYPE_STATE %>" />
													</td>
												</tr>

												<tr class="even">
													<td class="index">2</td>
													<td valign="top">In each report, stocks held by the bank are consolidated by Index Type (Main Index or Other
													Listed i.e. non-composite stocks). Each record displays the concentration/units held by the bank for each stock
													available in the system. <br>
													<br>
													(Report Short Description: Stocks by Index Type) <br>
													<br>
													<a href="javascript:getSampleReport('<%=WhatIfCondReportConstants.REPORT_TYPE_INDEX_TYPE %>');"><bean:message key="label.whatifcond.view.sample.report" /></a></td>
													<td>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0" class="tblInput" >
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.index.type" /> <bean:message key="label.mandatory" /></td>
															<td><html:select property="indexType" onchange="refreshCounters(this)">
																	<html:options name="indexTypeValues" labelName="indexTypeLabels" />
																</html:select> 
																<html:errors property="indexType" /></td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.counter" /> <bean:message key="label.mandatory" /></td>
															<td><html:select property="stockCode">
																	<logic:present name="counterOptionsList">
																		<option label="Please Select" value="" />
																		<html:optionsCollection name="counterOptionsList" label="label" value="value" />
																	</logic:present>
																	<logic:notPresent name="counterOptionsList">
																		<option label="Please Select" value="" />
																	</logic:notPresent>
																</html:select> 
																<html:errors property="stockCode" /></td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.price.direction" /> <font
																color="#0000FF">*</font></td>
															<td><html:select property="directionIndexType">
																	<html:options name="directionValues" labelName="directionLabels" />
																</html:select> 
																<html:errors property="directionIndexType" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.percentage.change" /> <bean:message key="label.mandatory" /></td>
															<td><html:text property="percentageIndexType" size="3" maxlength="3"/>%
															<html:errors property="percentageIndexType" /></td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.report.format" /> <bean:message key="label.mandatory" /></td>
															<td>
															<html:radio property="reportFormatStockIndex" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_SUMMARY %>">
																<bean:message key="label.whatifcond.report.format.summary" />
															</html:radio>
															<html:radio property="reportFormatStockIndex" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_PER_BORROWER %>">
																<bean:message key="label.whatifcond.report.format.per.borrower" />
															</html:radio>
															<html:errors property="reportFormatStockIndex" />
															</td>
														</tr>
													</table>
													</td>
													<td style="text-align: center">
														<html:radio property="reportType" value="<%=WhatIfCondReportConstants.REPORT_TYPE_INDEX_TYPE %>" />
													</td>
												</tr>
												<tr class="even">
													<td class="index">3</td>
													<td valign="top">In each report, all vehicles are consolidated by Make. Vehicles are aggregated by Model,
													Goods Status and Year of Manufacture for that Make. <br/>
													<br/>(Report Short Description: Vehicle by Make) <br/>
													<br/>
													<a href="javascript:getSampleReport('<%=WhatIfCondReportConstants.REPORT_TYPE_MAKE %>');"><bean:message key="label.whatifcond.view.sample.report" /></a></td>
													<td>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0" class="tblInput" >
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.security.asset.make" /> <bean:message key="label.mandatory" /></td>
															<td>
																<html:select property="make" onchange="refreshModel(this)">
																	<html:options name="makeValues" labelName="makeLabels" />
																</html:select> 
																<html:errors property="make" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.security.asset.model" /> <bean:message key="label.mandatory" /></td>
															<td>
																<html:select property="model" >
																	<logic:present name="modelOptionsList">
																		<option label="Please Select" value="" />
																		<html:optionsCollection name="modelOptionsList" label="label" value="value" />
																	</logic:present>
																	<logic:notPresent name="modelOptionsList">
																		<option label="Please Select" value="" />
																	</logic:notPresent>
																</html:select> 
																<html:errors property="model" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.security.asset.yearofmanufacture" /> <bean:message key="label.mandatory" /></td>
															<td>
																<html:select property="yearOfManufacture" >
																	<integro:common-code categoryCode="MANUFACTURE_YEAR" descWithCode="false" />
																	<html:option value="ALL">ALL</html:option>
																</html:select> 
																<html:errors property="yearOfManufacture" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.direction.of.value" /> <font
																color="#0000FF">*</font></td>
															<td><html:select property="directionMake" >
																	<html:options name="directionValues" labelName="directionLabels" />
																</html:select> 
																<html:errors property="directionMake" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.percentage.change" /> <bean:message key="label.mandatory" /></td>
															<td><html:text property="percentageMake" size="3" maxlength="3"/>%
																<html:errors property="percentageMake" /></td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.report.format" /> <bean:message key="label.mandatory" /></td>
															<td>
															<html:radio property="reportFormatVehicle" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_SUMMARY %>">
																<bean:message key="label.whatifcond.report.format.summary" />
															</html:radio>
															<html:radio property="reportFormatVehicle" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_PER_BORROWER %>">
																<bean:message key="label.whatifcond.report.format.per.borrower" />
															</html:radio>
															<html:errors property="reportFormatVehicle" />
															</td>
														</tr>
													</table>
													</td>
													<td style="text-align: center">
														<html:radio property="reportType" value="<%=WhatIfCondReportConstants.REPORT_TYPE_MAKE %>" />
													</td>
												</tr>


												<tr class="even">
													<td class="index">4</td>
													<td valign="top">In each report, all gold are consolidated by Gold Grade. Gold is further aggregated by
													Weight, Unit Price and Purchase Value for that Grade. <br>
													<br>
													(Report Short Description: Gold by Gold Grade) <br>
													<br>
													<a href="javascript:getSampleReport('<%=WhatIfCondReportConstants.REPORT_TYPE_GOLD_GRADE %>');"><bean:message key="label.whatifcond.view.sample.report" /></a></td>
													<td>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0" class="tblInput" >
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.gold.grade" /> <bean:message key="label.mandatory" /></td>
															<td>
																<html:select property="goldGrade" >
																	<html:options name="goldGradeValues" labelName="goldGradeLabels" />
																</html:select> 
																<html:errors property="goldGrade" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.direction.of.value" /> <font
																color="#0000FF">*</font></td>
															<td>
																<html:select property="directionGoldGrade" >
																	<html:options name="directionValues" labelName="directionLabels" />
																</html:select> 
																<html:errors property="directionGoldGrade" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.percentage.change" /> <bean:message key="label.mandatory" /></td>
															<td>
																<html:text property="percentageGoldGrade" size="3" maxlength="3"/>%
																<html:errors property="percentageGoldGrade" />
															</td>
														</tr>
														<tr class="odd">
															<td class="fieldname"><bean:message key="label.whatifcond.report.format" /> <bean:message key="label.mandatory" /></td>
															<td>
															<html:radio property="reportFormatGold" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_SUMMARY %>">
																<bean:message key="label.whatifcond.report.format.summary" />
															</html:radio>
															<html:radio property="reportFormatGold" value="<%=WhatIfCondReportConstants.REPORT_FORMAT_PER_BORROWER %>">
																<bean:message key="label.whatifcond.report.format.per.borrower" />
															</html:radio>
															<html:errors property="reportFormatGold" />
															</td>
														</tr>
													</table>
													</td>
													<td style="text-align: center">
														<html:radio property="reportType" value="<%=WhatIfCondReportConstants.REPORT_TYPE_GOLD_GRADE %>" />
													</td>
												</tr>

											</tbody>
										</table>
										</td>
									</tr>
								</tbody>
							</table>
				<table width="100%" border="0" align="center" cellpadding="0" 	cellspacing="0">
					<tr>
						<td valign="baseline" align="center"><font size="1" color="#0000FF"><html:errors property="atleastOne"/></font>&nbsp;</td>
					</tr>
					<tr>
						<td valign="baseline" align="center">
							<a href="javascript:submitForm();" onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image3311','','img/generate2.gif',1)">
								<img src="img/generate1.gif" name="Image3311" border="0"
									id="Image331" /></a>
						</td>
					</tr>
					<tr>
						<td valign="baseline" align="center">&nbsp;</td>
					</tr>
				</table>		
			</td>
		</tr>
	</table>
</html:form>
</body>
</html>
