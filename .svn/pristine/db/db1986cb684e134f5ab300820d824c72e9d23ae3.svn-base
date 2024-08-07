<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,org.apache.struts.util.LabelValueBean,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
	java.util.*,java.util.Vector,java.text.*,
	com.integrosys.cms.app.limit.bus.OBOtherCovenant"%>


<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<script type="text/javascript"
	src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>

<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<%

String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = false;       
if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER
	||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I){
	isUserCpcMaker = true;
} else {
	isUserCpcMaker=false;
}
String displayId = request.getParameter("displayId");
System.out.println("displayId>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+displayId);

OBOtherCovenant obothercovenant = new OBOtherCovenant();
OBOtherCovenant obothercovenant1 = new OBOtherCovenant();

List otherCovenantDetailsList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.otherCovenantDetailsList");
if (otherCovenantDetailsList != null) {
for(int i=0;i<otherCovenantDetailsList.size();i++)
{
	
obothercovenant=(OBOtherCovenant)otherCovenantDetailsList.get(i);
if(displayId.equals(obothercovenant.getPreviousStagingId()))
{
	obothercovenant1=obothercovenant;
}
}
System.out.println("otherCovenantDetailsList----------------->>" + otherCovenantDetailsList);
pageContext.setAttribute("otherCovenantDetailsList", otherCovenantDetailsList);

}

String event = request.getParameter("event");
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+event);


String mainEventIdentifier = (String) session
.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.mainEventIdentifier");

System.out.println("mainEventIdentifier1----------------->>" + mainEventIdentifier);
pageContext.setAttribute("mainEventIdentifier", mainEventIdentifier);


List facilityNamesList =  (List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.facilityNamesList");
if(facilityNamesList != null)
{
System.out.println("facilityNamesList ====>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+facilityNamesList);
pageContext.setAttribute("facilityNamesList",facilityNamesList);
}
else
{
	facilityNamesList= new ArrayList();
	pageContext.setAttribute("facilityNamesList",facilityNamesList);
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
pageContext.setAttribute("monitoringResponsibilityList2",monitoringResponsibilityList2);
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

String monitoringresponsibiltyfromOb = obothercovenant1.getMonitoringResponsibilityList1();
List actualMRList=new ArrayList();
if(null!=monitoringresponsibiltyfromOb && null!=monitoringResponsibilityList1) {
	List<String> items = Arrays.asList(monitoringresponsibiltyfromOb.split(","));
 	for(int i=0;i<monitoringResponsibilityList1.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)monitoringResponsibilityList1.get(i);
 		if(items.contains(lvBean.getValue())) {
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			actualMRList.add(lvBean1);
 
 		}
 	}
}

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

if(null!=monitoringresponsibiltyfromOb && null!=monitoringResponsibilityList1) {
	List<String> items = Arrays.asList(monitoringresponsibiltyfromOb.split(","));
	
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
System.out.println("monitoringResponsibilityList1=>"+monitoringResponsibilityList1.size());

if(null!=monitoringResponsibilityList1 && null!=newArrMonitoringResponsibility) {
	for(int i=0;i<newArrMonitoringResponsibility.size();i++) {
		LabelValueBean lvBean=(LabelValueBean)newArrMonitoringResponsibility.get(i);
			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
			//monitoringResponsibilityList1.add(lvBean1);
			monitoringResponsibilityList1.remove(lvBean1);
	}
}
System.out.println("After monitoringResponsibilityList1=>"+monitoringResponsibilityList1.size());
pageContext.setAttribute("monitoringResponsibilityList1",monitoringResponsibilityList1);
pageContext.setAttribute("monitoringResponsibilityList2",monitoringResponsibilityList2);

System.out.println("++monitoringResponsibilityList1--=======>"+monitoringResponsibilityList1);
System.out.println("++monitoringResponsibilityList2--=======>"+monitoringResponsibilityList2);


List facilityNamesList2 =  (List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.facilityNamesList2");
if(facilityNamesList2 != null)
{
System.out.println("facilityNamesList2=============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+facilityNamesList2);
pageContext.setAttribute("facilityNamesList2",facilityNamesList2);
}
else
{
	facilityNamesList2= new ArrayList();
	pageContext.setAttribute("facilityNamesList2",monitoringResponsibilityList2);
}
String facilityNamefromOb = obothercovenant1.getFinalfaciltyName();

System.out.println("---------------------------facilityNamefromOb--------------------------------------"+facilityNamefromOb);

if(null!=facilityNamesList && null!=facilityNamesList2) {
 	for(int i=0;i<facilityNamesList2.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)facilityNamesList2.get(i);
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			facilityNamesList.add(lvBean1);
 			facilityNamesList2.remove(lvBean1);
 	}
}

int cnt2 = facilityNamesList.size();
System.out.println("---------------------------CNT2--------------------------------------"+cnt2);
System.out.println("---------------------------BEFORE newArrFacilityName--------------------------------------");
ArrayList newArrFacilityName = new ArrayList();
System.out.println("---------------------------AFTER newArrFacilityName--------------------------------------");

if(null!=facilityNamefromOb && null!=facilityNamesList) {
	List<String> items = Arrays.asList(facilityNamefromOb.split(","));
	
 	for(int i=0;i<cnt2;i++) {
 		LabelValueBean lvBean=(LabelValueBean)facilityNamesList.get(i);
 	//	System.out.println("lvBean.getValue()="+lvBean.getValue()+"**lvBean.getLabel()="+lvBean.getLabel()+"**items="+items);
 		//if(items.contains(lvBean.getValue())) {
 			if(items.contains(lvBean.getLabel())) {
 			System.out.println("i="+i+" **true=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			System.out.println("lvBean1===>"+lvBean1);
 			//System.out.println("true lvBean1===>"+lvBean1);
 			facilityNamesList2.add(lvBean1);
 			//facilityNamesList.remove(lvBean1);
 			newArrFacilityName.add(lvBean1);
 		}else{
 			System.out.println("i="+i+" **false=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
 		}
 	}
}
System.out.println("newArrFacilityName=>"+newArrFacilityName.size());
System.out.println("facilityNamesList=>"+facilityNamesList.size());

if(null!=facilityNamesList && null!=newArrFacilityName) {
 	for(int i=0;i<newArrFacilityName.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)newArrFacilityName.get(i);
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			//facilityNamesList.add(lvBean1);
 			facilityNamesList.remove(lvBean1);
 	}
}
System.out.println("After facilityNamesList=>"+facilityNamesList.size());
pageContext.setAttribute("facilityNamesList",facilityNamesList);
pageContext.setAttribute("facilityNamesList2",facilityNamesList2);

System.out.println("++facilityNamesList--=======>"+facilityNamesList);
System.out.println("++facilityNamesList2--=======>"+facilityNamesList2);

/* 
if(null!=monitoringResponsibilityList1 && null!=monitoringResponsibilityList2) {
 	for(int i=0;i<monitoringResponsibilityList2.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)monitoringResponsibilityList2.get(i);
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			bankMethodListNew1.add(lvBean1);
 			bankMethodListNew2.remove(lvBean1);
 	}
}

int cnt = monitoringResponsibilityList1.size();
ArrayList newArrMonitoringResponsibility = new ArrayList();

if(null!=bankMethodListNew1) {
	List<String> items = Arrays.asList(bankMethodAllowed.split(","));
	
	for(int i=0;i<cnt;i++) {
		LabelValueBean lvBean=(LabelValueBean)bankMethodListNew1.get(i);
	//	System.out.println("lvBean.getValue()="+lvBean.getValue()+"**lvBean.getLabel()="+lvBean.getLabel()+"**items="+items);
		//if(items.contains(lvBean.getValue())) {
			if(items.contains(lvBean.getLabel())) {
			System.out.println("i="+i+" **true=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
			System.out.println("lvBean1===>"+lvBean1);
			//System.out.println("true lvBean1===>"+lvBean1);
			bankMethodListNew2.add(lvBean1);
			//bankMethodListNew1.remove(lvBean1);
			newArrBankMethod.add(lvBean1);
		}else{
			System.out.println("i="+i+" **false=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
		}
	}
}
System.out.println("newArrBankMethod=>"+newArrBankMethod.size());
System.out.println("bankMethodListNew1=>"+bankMethodListNew1.size());

if(null!=bankMethodListNew1 && null!=newArrBankMethod) {
	for(int i=0;i<newArrBankMethod.size();i++) {
		LabelValueBean lvBean=(LabelValueBean)newArrBankMethod.get(i);
			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
			//bankMethodListNew1.add(lvBean1);
			bankMethodListNew1.remove(lvBean1);
	}
} */
	  
%>

<html:form action="MIAADetail.do?">
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<bean:define id="formObj" name="AADetailForm" scope="request"
			type="com.integrosys.cms.ui.manualinput.aa.AADetailForm" />


		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<thead>
				<tr>
					<td>
						<h3>VIEW OTHER COVENANT</h3>

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
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
										<tbody>
											<tr class="even">
												<td class="fieldname" width="20%">Covenant Category<font color="#FF0000">*</font></td>

									<%
										if(obothercovenant1.getCovenantCategory()!=null && !"".equals(obothercovenant1.getCovenantCategory())) {
									%>
									<td width="30%"><%=obothercovenant1.getCovenantCategory()%>&nbsp;</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
											</tr>
											
											<tr class="even" id="FaciltyNameList" style="display: none;">
											<td class="fieldname" width="20%">Facility</td>
									<td width="15%">
         			<html:select name="AADetailForm"  multiple="multiple" size="10" style="width:150" property="faciltyNameList2" disabled="true">
						<html:options collection="facilityNamesList2" property="label" labelProperty="value"/>
					</html:select>
         		</td>
         		<td class="">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
									
											</tr>
								
											<tr class="even">
												<td class="fieldname">Covenant Type*</font></td>
									<%
										if (obothercovenant1.getCovenantType() != null
													&& !"".equals(obothercovenant1.getCovenantType())) {
									%>
									<td width="30%">
									<integro:common-code-single categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_TYPE %>" entryCode="<%=obothercovenant1.getCovenantType()%>" display="true" descWithCode="false"/>&nbsp;
									&nbsp;
									</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
												<td class="fieldname">Covenant Condition</td>
												<%
										if (obothercovenant1.getCovenantCondition() != null
													&& !"".equals(obothercovenant1.getCovenantCondition())) {
									%>
									<td width="30%">
									<integro:common-code-single categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_CONDITIONS %>" entryCode="<%=obothercovenant1.getCovenantCondition()%>" display="true" descWithCode="false"/>&nbsp;
									&nbsp;</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
											</tr>
											<tr class="even">
												<td class="fieldname" width="20%">Compiled /
													Non-Compiled</td>
										<%
										if (obothercovenant1.getCompiled() != null
													&& !"".equals(obothercovenant1.getCompiled())) {
									%>
									<td width="30%"><%=obothercovenant1.getCompiled()%>&nbsp;</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
										
												<td class="fieldname" width="20%">Advised / Non-Advised
												</td>
									<%
										if (obothercovenant1.getAdvised() != null
													&& !"".equals(obothercovenant1.getAdvised())) {
									%>
									<td width="30%"><%=obothercovenant1.getAdvised()%>&nbsp;</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
											</tr>
											<tr class="even">
												<td class="fieldname" width="20%">Target Date<font
													color="#FF0000">*</font></td>
												<td width="30%"><%=obothercovenant1.getTargetDate()%>&nbsp;</td>

											</tr>
											<%-- <tr class="even">
												<td class="fieldname" width="20%">Monitoring
													Responsibility</td>
												<td width="30%"><html:select name="AADetailForm"
														size="10" multiple="multiple" style="width:260"
														property="monitoringResponsibilityList1">
														<html:options collection="monitoringResponsibilityList1"
															property="value" labelProperty="label" />

													</html:select></td>
												<td><input type="button" name="Button"
													value="Add&gt;&gt;" style="width: 80" class="btnNormal"
													onclick="moveDualList(monitoringResponsibilityList1,monitoringResponsibilityList2, false,'Add')" />
													<br /> <br /> <input type="button" name="Button"
													value="&lt;&lt;Remove" style="width: 80" class="btnNormal"
													onclick="moveDualList(monitoringResponsibilityList2,monitoringResponsibilityList1, false,'Delete')" />
												</td>

												<td><html:select name="AADetailForm" size="10"
														multiple="multiple" style="width:260"
														property="monitoringResponsibilityList2">
														<html:options collection="monitoringResponsibilityList2"
															property="value" labelProperty="label" />
													</html:select></td>
											</tr> --%>
											<tr class="even">
         		<td class="fieldname" width="20%">Monitoring
													Responsibility</td>
         		<td width="15%">
         			<html:select name="AADetailForm"  multiple="multiple" size="10" style="width:150" property="monitoringResponsibilityProp" disabled="true">
						<html:options collection="monitoringResponsibilityList2" property="label" labelProperty="value"/>
					</html:select>
         		</td>
         		<%-- <%if(null!=form.getBranchAllowed() && !frm.getBranchAllowed().equals(obj.getBranchAllowed())){ %>
            	<td width="15%"> 
            		<html:select name="XRefDetailForm"  multiple="multiple" size="10" style="width:150" property="branchAllowed" disabled="true">
						<html:options collection="branchAllowedList1" property="value" labelProperty="label"/>
					</html:select>
				</td>
				<%}else{ %>	
                	<td width="15%">-</td>
                <%} %> --%>
                
             	<td class="">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
       	</tr> 
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tblInput">
									<tbody>
											<tr class="even">
												<td class="fieldname">Remarks</td>
												<%
										if (obothercovenant1.getRemarks() != null
													&& !"".equals(obothercovenant1.getRemarks())) {
									%>
									<td width="30%"><%=obothercovenant1.getRemarks()%>&nbsp;</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
											</tr>
											<tr class="even">
												<td class="fieldname">Covenant Description</td>
												<%
										if (obothercovenant1.getCovenantDescription() != null
													&& !"".equals(obothercovenant1.getCovenantDescription())) {
									%>
									<td width="30%"><%=obothercovenant1.getCovenantDescription()%>&nbsp;</td>
									<%
										} else {
									%>
									<td width="30%">-&nbsp;</td>
									<%
										}
									%>
											</tr>
										</tbody>
									</table>
							
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
			<%--  <html:hidden name="AADetailForm" property="monitoringResponsibility" styleId="monitoringResponsibility"/> 
 --%>


		</table>

	</body>
	
	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<% if(event.equals("view_other_covenant_details_checker") && mainEventIdentifier.equals("checker_edit_aadetail") ){%>
			<td><a
				href="javascript:eventToActionHandler(1)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
					<%} %>
					<%if(event.equals("view_other_covenant_details_checker") && mainEventIdentifier.equals("viewChecker")) { %>
					<td><a
				href="javascript:eventToActionHandler(3)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
					<%}if(event.equals("view_other_covenant_details")) {%>
					<td><a
				href="javascript:eventToActionHandler(2)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
					
					<% }%>
				
					
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	
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
</html:form>

<script language="JavaScript" type="text/JavaScript">
function eventToActionHandler(num) {
	if(num == 1)
	{
	document.forms[0].action = "MIAADetail.do?event=view_return_to_Other_Covenant_List_checker&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
	}
	else if(num == 2)
	{
	document.forms[0].action = "MIAADetail.do?event=view_return_to_Other_Covenant_List&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
	}
	else if(num == 3)
	{
	document.forms[0].action = "MIAADetail.do?event=view_return_to_Other_Covenant_List&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
	}
}

	
	
	window.onload = function(){
		var covenant_category = '<%=obothercovenant1.getCovenantCategory()%>';
		if(covenant_category == 'Facility')
		document.getElementById('FaciltyNameList').style.display = '';
		else
			document.getElementById('FaciltyNameList').style.display = 'none';
	}
</script>