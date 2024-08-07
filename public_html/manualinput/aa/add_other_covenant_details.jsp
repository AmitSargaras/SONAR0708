<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%@ page
	import="java.util.*,java.text.*,com.integrosys.cms.app.common.constant.ICMSConstant,org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<script type="text/javascript"
	src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<%

com.integrosys.cms.ui.manualinput.aa.AADetailForm aForm = (com.integrosys.cms.ui.manualinput.aa.AADetailForm) request
.getAttribute("AADetailForm");
if(aForm.getTargetDate()!=null)
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+aForm.getTargetDate().length());
String finalmonitoringResponsibility = "";
if(aForm.getFinalmonitoringResponsibility() != null)
{
System.out.println("aForm.getFinalmonitoringResponsibility()>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+aForm.getFinalmonitoringResponsibility());
 finalmonitoringResponsibility =  aForm.getFinalmonitoringResponsibility();
}
String CovenantCategory1 = request.getParameter("CovenantCategory");
System.out.println("CovenantCategory1>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+CovenantCategory1);

String Compiled = request.getParameter("Compiled");
System.out.println("Compiled>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+Compiled);


String Advised = request.getParameter("Advised");
System.out.println("Advised>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+Advised);

String event = request.getParameter("event");
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+event);

String mainEventIdentifier = (String) session
.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.mainEventIdentifier");

System.out.println("mainEventIdentifier----------------->>" + mainEventIdentifier);
pageContext.setAttribute("mainEventIdentifier", mainEventIdentifier);

List facilityNamesList =  (List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.facilityNamesList");
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+facilityNamesList);
if(facilityNamesList != null)
{
	pageContext.setAttribute("facilityNamesList",facilityNamesList);
}
else
{
	facilityNamesList = new  ArrayList();
	pageContext.setAttribute("facilityNamesList",facilityNamesList);
}

List facilityNamesList1 =  (ArrayList)request.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.facilityNamesList");
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+facilityNamesList1);
if(facilityNamesList1 != null)
{
	pageContext.setAttribute("facilityNamesList1",facilityNamesList1);
}
else
{
	facilityNamesList1 = new  ArrayList();
	pageContext.setAttribute("facilityNamesList1",facilityNamesList1);
}
List monitoringResponsibilityList1 =  (List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.monitoringResponsibilityList1");
if(monitoringResponsibilityList1 != null)
{
System.out.println("monitoringResponsibilityList1 ====>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+monitoringResponsibilityList1);
pageContext.setAttribute("monitoringResponsibilityList1",monitoringResponsibilityList1);
}
else
{
	monitoringResponsibilityList1= new ArrayList();
	pageContext.setAttribute("monitoringResponsibilityList1",monitoringResponsibilityList1);
}
List monitoringResponsibilityList2 =  (List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.monitoringResponsibilityList2");
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+monitoringResponsibilityList2);

if(monitoringResponsibilityList2 != null)
{
System.out.println("monitoringResponsibilityList2=============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+monitoringResponsibilityList2);
pageContext.setAttribute("monitoringResponsibilityList2",monitoringResponsibilityList2);
}
else
{
	monitoringResponsibilityList2= new ArrayList();
	pageContext.setAttribute("monitoringResponsibilityList2",monitoringResponsibilityList2);
}
String customerID=(String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.customerID");
System.out.println("customerID----------------->>" + customerID);
pageContext.setAttribute("customerID",customerID);


if(null!=monitoringResponsibilityList1 && null!=monitoringResponsibilityList2) {
 	for(int i=0;i<monitoringResponsibilityList2.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)monitoringResponsibilityList2.get(i);
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			monitoringResponsibilityList1.add(lvBean1);
 			monitoringResponsibilityList2.remove(lvBean1);
 	}
}

int cnt = monitoringResponsibilityList1.size();
ArrayList newArrMonitoringResponsibility = new ArrayList();

if(null!=finalmonitoringResponsibility && null!=monitoringResponsibilityList1) {
	List<String> items = Arrays.asList(finalmonitoringResponsibility.split(","));
	
 	for(int i=0;i<cnt;i++) {
 		LabelValueBean lvBean=(LabelValueBean)monitoringResponsibilityList1.get(i);
 	//	System.out.println("lvBean.getValue()="+lvBean.getValue()+"**lvBean.getLabel()="+lvBean.getLabel()+"**items="+items);
 		//if(items.contains(lvBean.getValue())) {
 			if(items.contains(lvBean.getLabel())) {
 			System.out.println("i="+i+" **true=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			System.out.println("lvBean1===>"+lvBean1);
 			//System.out.println("true lvBean1===>"+lvBean1);
 			monitoringResponsibilityList2.add(lvBean1);
 			//monitoringResponsibilityList1.remove(lvBean1);
 			newArrMonitoringResponsibility.add(lvBean1);
 		}else{
 			System.out.println("i="+i+" **false=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
 		}
 	}
}
System.out.println("newArrMonitoringResponsibility=>"+newArrMonitoringResponsibility.size());
//System.out.println("monitoringResponsibilityList1=>"+monitoringResponsibilityList1.size());

if(null!=monitoringResponsibilityList1 && null!=newArrMonitoringResponsibility) {
 	for(int i=0;i<newArrMonitoringResponsibility.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)newArrMonitoringResponsibility.get(i);
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			//monitoringResponsibilityList1.add(lvBean1);
 			monitoringResponsibilityList1.remove(lvBean1);
 	}
}
pageContext.setAttribute("monitoringResponsibilityList1",monitoringResponsibilityList1);
pageContext.setAttribute("monitoringResponsibilityList2",monitoringResponsibilityList2);
%>
</head>
<html:form action="MIAADetail.do?">
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<bean:define id="formObj" name="AADetailForm" scope="request"
			type="com.integrosys.cms.ui.manualinput.aa.AADetailForm" />


		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<thead>
				<tr>
					<td>
						<h3>Add New Other Covenant</h3>

					</td>
				</tr>
				<tr>
					<td>
						<hr />
					</td>
				</tr>
			</thead>
			<tbody>
				<tr id="otherCovenantDetails">
					<td colspan="2">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblInfo">
							<tbody>

								<tr class="even">
								
									<td class="fieldname" width="20%">Covenant Category<font
										color="#FF0000">*</font></td>
										<%if(CovenantCategory1 == null){ %>
									<td><input type="radio"  name="CovenantCategory"
										value="General" checked="checked" id="General"
										onclick="show1();" /> General <input type="radio"
										name="CovenantCategory" value="Facility" id="Facility"
										onclick="show2();" /> Facility
										
										<html:errors property="FacilityCCerror"/>
										</td>
										<%} else if(CovenantCategory1.equalsIgnoreCase("Facility")){%>
										<td>
												<input type="radio" name="CovenantCategory"
													value="General"  id="General"
													onclick="show1();" /> General 
													
												<input type="radio"
													name="CovenantCategory" value="Facility"  checked="checked" id="Facility"
													onclick="show2();" /> Facility</td>
									<%} else if(CovenantCategory1.equalsIgnoreCase("General")){%>
									<td>
												<input type="radio" name="CovenantCategory"
													value="General" checked="checked" id="General"
													onclick="show1();" /> General 
													
												<input type="radio"
													name="CovenantCategory" value="Facility" id="Facility"
													onclick="show2();" /> Facility</td>
									<%} %>
								</tr>
								
								<tr class="even" id="FaciltyNameList" style="display: none;">
									<td class="fieldname" width="20%">Facility</td>
									<td width="30%"><html:select name="AADetailForm" size="10"
											multiple="multiple" style="width:260"
											property="faciltyNameList1">
											<html:options collection="facilityNamesList" property="label"
												labelProperty="value" />

										</html:select>
										<html:errors property="FacilityCCerror"/></td>
									<td><input type="button" name="Button" value="Add&gt;&gt;"
										style="padding: 2px; width: 80px;" class="btnNormal"
										onclick="moveDualList2(faciltyNameList1,faciltyNameList2, false,'Add')" />
										<br /> <br /> <input type="button" name="Button"
										value="&lt;&lt;Remove" style="padding: 2px; width: 80px;" class="btnNormal"
										onclick="moveDualList2(faciltyNameList2,faciltyNameList1, false,'Delete')" />
									</td>

									<td><html:select name="AADetailForm" size="10"
											multiple="multiple" style="width:260"
											property="faciltyNameList2">
											<html:options collection="facilityNamesList1"
												property="value" labelProperty="label" />
										</html:select></td>
								</tr>
								<tr class="odd">
									<%if(aForm.getCovenantType() == null){ %>
									<td class="fieldname" width="20%">Covenant Type</td>
									<td class="even" width="30%">
									<html:select
											property="covenantType" value="">
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_TYPE%>"
												descWithCode="false" />
									</html:select> <html:errors property="covenantType"/></td>
									<%}else{%>
									<td class="fieldname" width="20%">Covenant Type</td>
									<td class="even" width="30%">
									<html:select
											property="covenantType" value="<%=aForm.getCovenantType() %>">
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_TYPE%>"
												descWithCode="false" />
									</html:select> <html:errors property="covenantType"/></td>
									<%}%>
									<%if(aForm.getCovenantType() == null){ %>
									<td class="fieldname" width="20%">Covenant Condtion</td>
									<td class="even" width="30%"><html:select
											property="covenant_Condition" value="">
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_CONDITIONS%>"
												descWithCode="false" />
										</html:select> <html:errors property="covenant_Condition" /></td>
									<%}else{%>
									<td class="fieldname" width="20%">Covenant Condtion</td>
									<td class="even" width="30%"><html:select
											property="covenant_Condition" value="<%=aForm.getCovenant_Condition()%>">
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_CONDITIONS%>"
												descWithCode="false" />
										</html:select> <html:errors property="covenant_Condition" /></td>
									<%}%>
									</tr>
								<tr class="even">
									<td class="fieldname" width="20%">Compiled / Non-Compiled</td>
									<td>
									<%if(Compiled == null){ %>
									<input type="radio" name="Compiled" value="Compiled"
										id="Compiled" /> Compiled 
									<input type="radio" name="Compiled"
										value="Non-Compiled" id="Non-Compiled" /> Non-Compiled</td>
									<%}else if(Compiled != null &&"Compiled".equalsIgnoreCase(Compiled)){%>
									<input type="radio" name="Compiled"
													checked="checked" value="Compiled" id="Compiled" />
													Compiled 
													<input type="radio" name="Compiled"
													value="Non-Compiled" id="Non-Compiled" /> Non-Compiled
									<%}else if(Compiled != null &&"Non-Compiled".equalsIgnoreCase(Compiled)){%>
									<input type="radio" name="Compiled"
													 value="Compiled" id="Compiled" />
													Compiled 
													<input type="radio" name="Compiled" checked="checked"
													value="Non-Compiled" id="Non-Compiled" /> Non-Compiled
													<%} %>
									<td class="fieldname" width="20%">Advised / Non-Advised</td>
									<td>
									<%if(Compiled == null){ %>
									<input type="radio" name="Advised" value="Advised"
										id="Advised" /> Advised 
									<input type="radio" name="Advised"
										value="Non-Advised" id="Non-Advised" /> Non-Advised</td>
									<%}else if(Advised != null &&"Advised".equalsIgnoreCase(Advised)){%>
									<input type="radio" name="Advised"
													checked="checked" value="Advised" id="Advised" /> Advised <input
													type="radio" name="Advised" value="Non-Advised"
													id="Non-Advised" /> Non-Advised
									<%}else if(Advised != null &&"Non-Advised".equalsIgnoreCase(Advised)){%>
									<input type="radio" name="Advised"
													checked="checked" value="Advised" id="Advised" /> Advised <input
													type="radio" name="Advised" value="Non-Advised"
													id="Non-Advised" /> Non-Advised
									<%} %>			
								</tr>
								<tr class="odd">
									<td class="fieldname" width="20%">Target Date<font
										color="#FF0000">*</font></td>
									<td class="even"><html:text property="targetDate"
											styleId="targetDate" readonly="true" /> <img
										src="img/calendara.gif" name="Image724" border="0"
										id="Image724"
										onclick="return showCalendar('targetDate', 'dd/mm/y');"
										onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)"
										onmouseout="MM_swapImgRestore()" /> 
										<html:errors
											property="targetDate" /></td>
									<td class="fieldname">&nbsp;</td>
									<td class="odd">&nbsp;</td>
								</tr>
								<tr class="even">
									<td class="fieldname" width="20%">Monitoring
										Responsibility</td>
									<td width="30%"><html:select name="AADetailForm" size="10"
											multiple="multiple" style="width:260"
											property="monitoringResponsibility">
											<html:options collection="monitoringResponsibilityList1"
												property="label" labelProperty="value" />

										</html:select></td>
									<td><input type="button" name="Button" value="Add&gt;&gt;"
										style="padding: 2px; width: 80px;" class="btnNormal"
										onclick="moveDualList(monitoringResponsibility,monitoringResponsibilityProp, false,'Add')" />
										<br /> <br /> <input type="button" name="Button"
										value="&lt;&lt;Remove" style="padding: 2px; width: 80px;" class="btnNormal"
										onclick="moveDualList(monitoringResponsibilityProp,monitoringResponsibility, false,'Delete')" />
									</td>

									<td><html:select name="AADetailForm" size="10"
											multiple="multiple" style="width:260" property="monitoringResponsibilityProp">
											<html:options collection="monitoringResponsibilityList2"
												property="label" labelProperty="value" />
										</html:select></td>
								</tr>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tblInput">
									<tbody>

										<tr class="odd">
											<td class="fieldname">Covenant Description</td>
											<td><html:textarea name="AADetailForm" rows="2"
														cols="120"
													property="covenantDescription" /> <html:errors
													property="covenantDescription" /></td>
										</tr>
										<tr class="odd">
											<td class="fieldname">Remarks</td>
											<td><html:textarea name="AADetailForm" rows="2"
														cols="120"
													property="covenantremarks" /> <html:errors
													property="covenantremarks" /></td>
										</tr>
										

									</tbody>
								</table>


								<%-- 

									<tr class="odd">
												<td class="fieldname">Remarks</td>
												<td><html:textarea name="AADetailForm" rows="5"
														cols="120" property="covenantremarks" />
													<html:errors property="covenantremarks" /></td>
											</tr>


											<tr class="even">
												<td class="fieldname">Covenant Description</td>
												<td><html:textarea name="AADetailForm" rows="5"
														cols="120" property="covenantDescription" />
													<html:errors property="covenantDescription" /></td>
											</tr>
 --%>


							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		</table>
		<table width="150" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<%if(event.equals("prepare_add_other_covenant_details") || event.equals("save_other_covenant") || event.equals("save_other_covenant_edit") && mainEventIdentifier.equals("maker_add_aadetail") ){ %>
				<td align="center"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)"> <img
				src="img/submit1.gif" name="Image142" width="70" height="20"
				border="0" id="Image142"
						onclick="javascript:showDetail()" /></a> <a
					href="#" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
						<img src="img/cancel1.gif" name="ImageCancel" width="70"
						height="20" border="0" id="ImageCancel"
						onclick="returnPage()" />
				</a></td>
				

			<td>
				
				<%}%>
				<%if(event.equals("prepare_edit_other_covenant_details") || (event.equals("save_other_covenant_edit") && mainEventIdentifier.equals("maker_edit_aadetail"))){ %>
				<td align="center"><a href="#" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)"> <img
						src="img/submit1.gif" name="Image142" width="70" height="20"
						border="0" id="Image142"
						onclick="javascript:showDetail2()" /></a> <a
					href="#" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
						<img src="img/cancel1.gif" name="ImageCancel" width="70"
						height="20" border="0" id="ImageCancel"
						onclick="returnPage2()" />
				</a></td>
				<%}%>
			</tr>
			<%--  <html:hidden name="AADetailForm" property="monitoringResponsibility" styleId="monitoringResponsibility"/> 
 --%>


		</table>


	</body>
	<html:hidden name="AADetailForm" property="camType" />
	<html:hidden name="AADetailForm" property="aaNum" />
	<html:hidden name="AADetailForm" property="aaApprovalDate" />
	<html:hidden name="AADetailForm" property="camLoginDate" />
	<html:hidden name="AADetailForm" property="ramRating" />
	<html:hidden name="AADetailForm" property="ramRatingYear" />
	<html:hidden name="AADetailForm" property="ramRatingType" />
	<html:hidden name="AADetailForm" property="ramRatingFinalizationDate" />
	<html:hidden name="AADetailForm" property="annualReviewDate" />
	<html:hidden name="AADetailForm" property="extendedNextReviewDate" />
	<html:hidden name="AADetailForm" property="noOfTimesExtended" />
	<html:hidden name="AADetailForm" property="totalSactionedAmount" />
	<html:hidden name="AADetailForm" property="controllingBranch" />
	<html:hidden name="AADetailForm" property="fullyCashCollateral" />
	<html:hidden name="AADetailForm"
		property="totalSanctionedAmountFacLevel" />
	<html:hidden name="AADetailForm" property="committeApproval" />
	<html:hidden name="AADetailForm" property="boardApproval" />
	<html:hidden name="AADetailForm" property="creditApproval1" />
	<html:hidden name="AADetailForm" property="creditApproval2" />
	<html:hidden name="AADetailForm" property="creditApproval3" />
	<html:hidden name="AADetailForm" property="creditApproval4" />
	<html:hidden name="AADetailForm" property="creditApproval5" />
	<html:hidden name="AADetailForm" property="rbiAssetClassification" />
	<html:hidden name="AADetailForm" property="assetClassification" />
	<html:hidden name="AADetailForm" property="nameOfDirectorsAndCompany" />
	<html:hidden name="AADetailForm" property="rbiApprovalForSingle" />
	<html:hidden name="AADetailForm"
		property="detailsOfRbiApprovalForSingle" />
	<html:hidden name="AADetailForm" property="rbiApprovalForGroup" />
	<html:hidden name="AADetailForm"
		property="detailsOfRbiApprovalForGroup" />
	<html:hidden name="AADetailForm" property="docRemarks" />
	<html:hidden name="AADetailForm"
		property="finalmonitoringResponsibility"
		styleId="finalmonitoringResponsibility" />
	<html:hidden name="AADetailForm" property="finalFaciltyName"
		styleId="finalFaciltyName" />
		<html:hidden name="AADetailForm" property="covenantType" />
		<html:hidden name="AADetailForm" property="covenant_Condition" />
		<html:hidden name="AADetailForm" property="covenantDescription" />
		<html:hidden name="AADetailForm" property="advised"  styleId="advised" />
		<html:hidden name="AADetailForm" property="compiled" styleId="compiled"/>
	
</html:form>
<script type="text/javascript">
	function show1() {
		document.getElementById('FaciltyNameList').style.display = 'none';
		document.getElementById('FaciltyNameList').value = ''
	}

	function show2() {
		document.getElementById('FaciltyNameList').style.display = '';
	}

	function showDetail() {
		document.forms[0].action = "MIAADetail.do?event=save_other_covenant&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
	}
	
	function showDetail2() {
		document.forms[0].action = "MIAADetail.do?event=save_other_covenant_edit&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
	}
	
	

	function saveOtherCovenant(name) {
		document.forms[0].action = "MIAADetail.do?event=" + name;
		document.forms[0].submit();
	}
	function returnPage(name) {
		document.forms[0].action = "MIAADetail.do?event=list_other_covenants&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
	}
	
	function returnPage2(name) {
		document.forms[0].action = "MIAADetail.do?event=list_other_covenants_edit&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
	}

	function hasOptions(obj) {
		//alert(obj);
		if (obj != null && obj.options != null && obj.options.length > 0) {
			return true;
		}
		return false;
	}

	function moveDualList(srcList, destList, moveAll, operation) {
		//alert(srcList.length);
		//alert(destList.length);
		// Do nothing if source is empty
		/* if (!hasOptions(srcList) || ((srcList.selectedIndex == -1) && (moveAll == false))) {
			return;
		}  */// or nothing is selected 

		var SelID = '';
		var SelText = '';
		// Move rows from srcList to destList from bottom to top
		//alert("After hasoptions");
		for (i = srcList.options.length - 1; i >= 0; i--) {
			//alert("In for loop");
			if (srcList.options[i].selected == true || moveAll) {
				//alert("In if "+srcList.options[i].selected);
				SelID = srcList.options[i].value;
				SelText = srcList.options[i].text;

				var newRow = new Option(SelText, SelID);
				destList.options[destList.length] = newRow;
				srcList.options[i] = null;
			}
		}
		sortSelect(destList);

		var temp = "";
		if (operation == "Add") {
			for (var i = 0; i < destList.length - 1; i++) {
				temp += destList[i].value + ",";
			}
			temp += destList[destList.length - 1].value
			document.getElementById('finalmonitoringResponsibility').value = temp;
		}
		if (operation == "Delete") {
			if (srcList.length == 0)
				document.getElementById('finalmonitoringResponsibility').value = "";

			for (var i = 0; i < srcList.length - 1; i++) {
				temp += srcList[i].value + ",";
			}
			temp += srcList[srcList.length - 1].value
			document.getElementById('finalmonitoringResponsibility').value = temp;
		}
	}
	
	
	function moveDualList2(srcList, destList, moveAll, operation) {
		//alert(srcList.length);
		//alert(destList.length);
		// Do nothing if source is empty
		/* if (!hasOptions(srcList) || ((srcList.selectedIndex == -1) && (moveAll == false))) {
			return;
		}  */// or nothing is selected 

		var SelID = '';
		var SelText = '';
		// Move rows from srcList to destList from bottom to top
		//alert("After hasoptions");
		for (i = srcList.options.length - 1; i >= 0; i--) {
			//alert("In for loop");
			if (srcList.options[i].selected == true || moveAll) {
				//alert("In if "+srcList.options[i].selected);
				SelID = srcList.options[i].value;
				SelText = srcList.options[i].text;

				var newRow = new Option(SelText, SelID);
				destList.options[destList.length] = newRow;
				srcList.options[i] = null;
			}
		}
		sortSelect(destList);

		var temp = "";
		if (operation == "Add") {
			for (var i = 0; i < destList.length - 1; i++) {
				temp += destList[i].value + ",";
			}
			temp += destList[destList.length - 1].value
			document.getElementById('finalFaciltyName').value = temp;
		}
		if (operation == "Delete") {
			if (srcList.length == 0)
				document.getElementById('finalFaciltyName').value = "";

			for (var i = 0; i < srcList.length - 1; i++) {
				temp += srcList[i].value + ",";
			}
			temp += srcList[srcList.length - 1].value
			document.getElementById('finalFaciltyName').value = temp;
		}
	}

	window.onload = function(){
		var covenant_category = '<%=CovenantCategory1%>';
		if(covenant_category == 'Facility')
		document.getElementById('FaciltyNameList').style.display = '';
		
		
		var finalmonitoringResponsibility = '<%=finalmonitoringResponsibility%>';
		if(finalmonitoringResponsibility != null && finalmonitoringResponsibility != ''){
			document.getElementById("finalmonitoringResponsibility").value = finalmonitoringResponsibility;
			
		}
		
	}
	
</script>
<!-- 	<script language="javascript"> Commented By Dayananda for IE 11 Compatibility changes
	//A Shiv 230811 -->

