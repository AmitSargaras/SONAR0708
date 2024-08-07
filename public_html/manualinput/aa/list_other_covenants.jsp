<%@ page
	import="java.util.*,java.text.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.common.CountryList,
	org.apache.struts.util.LabelValueBean,com.integrosys.cms.ui.common.CommonCodeList,com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm,
	com.integrosys.cms.app.limit.bus.OBOtherCovenant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>

<%
	String event = (String) request.getAttribute("event");
	System.out.println("event----------------->>" + event);
	pageContext.setAttribute("event", event);
	
/* 
	String covenantCondition = (String) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.covenantCondition");
	System.out.println("covenantCondition----------------->>" + covenantCondition);
	pageContext.setAttribute("covenantCondition", covenantCondition); */

	String preEvent = request.getParameter("preEvent");

	String customerID = (String) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.customerID");
			System.out.println("customerID----------------->>" + customerID);
	pageContext.setAttribute("customerID", customerID);
	
	String mainEventIdentifier = (String) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.mainEventIdentifier");
	
	
	
	 if("view_list_other_covenants".equals(event))
	{
		mainEventIdentifier = "view_list_other_covenants";
	}
	 System.out.println("mainEventIdentifier1----------------->>" + mainEventIdentifier);
	pageContext.setAttribute("mainEventIdentifier", mainEventIdentifier);

	/* String covenantType = (String) request.getAttribute("covenantType");
	System.out.println("covenantType----------------->>" + covenantType);
	pageContext.setAttribute("covenantType", covenantType);
	 *//* List otherCovenantDetailsList1 = (List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.otherCovenantDetailsList");
	
	System.out.println("otherCovenantDetailsList1----------------->>"+otherCovenantDetailsList1);
	pageContext.setAttribute("otherCovenantDetailsList1",otherCovenantDetailsList1); */
	List otherCovenantDetailsList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.otherCovenantDetailsList");
	OBOtherCovenant oboc;
	pageContext.setAttribute("otherCovenantDetailsList", otherCovenantDetailsList);
	/* if (otherCovenantDetailsList != null) {
		//pageContext.setAttribute("otherCovenantDetailsList", otherCovenantDetailsList);
		//System.out.println("otherCovenantDetailsList--------------1----------------->>" + otherCovenantDetailsList);
		for(int i=0;i<otherCovenantDetailsList.size();i++) 
		{
			oboc=(OBOtherCovenant)otherCovenantDetailsList.get(i);
			if(oboc.getStatus() == "INACTIVE")
			{
				
			}
			//otherCovenantDetailsList.remove(oboc);
		}
		//pageContext.setAttribute("otherCovenantDetailsList", otherCovenantDetailsList);
	} */
	/*  else {
		System.out.println("In ELSE");
		otherCovenantDetailsList = new ArrayList();
		pageContext.setAttribute("otherCovenantDetailsList", otherCovenantDetailsList);
	} */
	//System.out.println("otherCovenantDetailsList---------------2----------->>" + otherCovenantDetailsList);
	String teamTypeMemID = (String) session.getAttribute(
			ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);

	System.out.println("teamTypeMemID----------------->>" + teamTypeMemID);

	String relationShipMgrName = (String) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.relationShipMgrName");

	//System.out.println("relationShipMgrName-------------------->" + relationShipMgrName);

	String regionName = (String) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.regionName");

	String branchName = (String) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.branchName");

	//System.out.println("branchName-------------------->" + branchName);

	Collection riskGradeList = (Collection) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.riskGradeList");
	request.setAttribute("riskGradeList", riskGradeList);
	List creditAprrovalList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.creditAprrovalList");
	pageContext.setAttribute("creditAprrovalList", creditAprrovalList);

	boolean isUserCpcMaker = false;
	if (Long.parseLong(teamTypeMemID) == ICMSConstant.TEAM_TYPE_SSC_MAKER
			|| Long.parseLong(teamTypeMemID) == ICMSConstant.TEAM_TYPE_BRANCH_MAKER
			|| Long.parseLong(teamTypeMemID) == ICMSConstant.TEAM_TYPE_PARTY_MAKER
			|| Long.parseLong(teamTypeMemID) == ICMSConstant.TEAM_TYPE_CPU_MAKER_I) {
		isUserCpcMaker = true;
	} else {
		isUserCpcMaker = false;
	}

	System.out.println("isUserCpcMaker----------------->>" + isUserCpcMaker);
	int sno = 1;
	int startIndex = 0;
	String ind = (String) request.getAttribute("startIndex");
	if (ind != null && (!ind.equals(""))) {
		startIndex = Integer.parseInt(ind);

	}
	ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");
	/* List list = (List) request.getAttribute("customerList");
	System.out.println("list----------------->>" + list);
	if(list != null)
	pageContext.setAttribute("customerList", list); */
	//String customerID = (String )request.getAttribute("customerId");  
	//System.out.println("customer     "+  list.getClass());
	//	for(int i=0 ;i<list.size() ;i++){
	//		String[] customer = (String[]) list.get(i);
	//	System.out.println("customer     "+  list.size());
	//	System.out.println("customer     "+  customer[1]);
	//	}
	if (form != null) {
		DefaultLogger.debug(this, "form :" + form.getSource());
		DefaultLogger.debug(this, "getSubProfileId :" + form.getSubProfileId() + "<<<<<<");
	} else {

	}

	int vno = 1;
%>


<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>

<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
	
function eventToActionHandler(num) {
		if(num == 1)
		{
		document.forms[0].action = "MIAADetail.do?event=prepare_add_other_covenant_details&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
		}
		else if(num == 2)
		{
		document.forms[0].action = "MIAADetail.do?event=prepare_edit_other_covenant_details&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
		}
		else if(num == 3)
		{
		document.forms[0].action = "MIAADetail.do?event=return_Other_Covenant_List_to_AA&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
		}
		else if(num == 4)
		{
		document.forms[0].action = "MIAADetail.do?event=return_edit_Other_Covenant_List_to_AA&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
		}
		else if(num == 5)
		{
		document.forms[0].action = "MIAADetail.do?event=view&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
		}
		else if(num == 6)
		{
		document.forms[0].action = "MIAADetail.do?event=maker_close_aadetail&mainEventIdentifier=<%=mainEventIdentifier%>";
		document.forms[0].submit();
		}
	}
	
	
function selectActionOtherCovenant(selectObj,displayId,mainEventIdentifier) {
	var curInd = selectObj.selectedIndex;
	if(curInd==1)
	{
	//alert(displayId);
	document.forms[0].action = "MIAADetail.do?event=view_other_covenant_details&displayId="+displayId+"&mainEventIdentifier=" +mainEventIdentifier;
	document.forms[0].submit();
	}
	if(curInd==2)
	{
	//alert(displayId);
	document.forms[0].action = "MIAADetail.do?event=edit_other_covenant_details&displayId="+displayId+"&mainEventIdentifier=" +mainEventIdentifier;
	document.forms[0].submit();
	}
	if(curInd==3)
	{
	//alert(displayId);
	document.forms[0].action = "MIAADetail.do?event=delete_other_covenant_details&displayId="+displayId+"&mainEventIdentifier=" +mainEventIdentifier;
	document.forms[0].submit();
	}
}
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ManualInputCustomer.do">
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<input type="hidden" name="event">
		<input type="hidden" name="indicator">
		<input type="hidden" name="startIndex">
		<input type="hidden" name="OtherCovenantId" id="OtherCovenantId" value=""/>
		<input type="hidden" name="all">
		<!-- InstanceBeginEditable name="Content" -->
		<table width="100%" height="100%" cellspacing="0" cellpadding="0"
			border="0">
			<tr>
				<td valign="top">
					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">


						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><h3>Other Covenant</h3></td>
							<%
								if (event.equals("list_other_covenants") || (event.equals("view_return_to_Other_Covenant_List") && !(mainEventIdentifier.equals("maker_close_aadetail") || "view_list_other_covenants".equals(mainEventIdentifier))) 
											|| event.equals("save_other_covenant")) {
							%>
							<td align="right">

								
								<a href="javascript:eventToActionHandler(1)">
								<input type="button" id="AddNew" 
								value="Add New"
								class="btnNormal" style="width: 100px" />
								</a>
								
								</td>
							<%
								}
							%>
							<%
								if (event.equals("list_other_covenants_edit") || event.equals("save_other_covenant_edit") || event.equals("save_edited_other_covenant") || event.equals("other_covenant_deleted")) {
							%>
							<td align="right">
								<a href="javascript:eventToActionHandler(2)">
								<input type="button" id="AddNew" 
								value="Add New"
								class="btnNormal" style="width: 100px" />
								</a>
								</td>
							<%
								}
							%>
							
						</tr>
						


						<tr>
							<td colspan="2">
								<table width="100%" class="tblinfo" style="margin-top: 0"
									border="0" cellspacing="0" cellpadding="0">
									<thead>
										<tr>
											<td width="5%">S/N</td>
											<td width="17%">Covenant Category</td>
											<td width="17">Covenant Type</td>
											<td width="17%">Covenant Condition</td>
											<td width="17%">Target Date</td>
											<td width="17%">Monitoring Responsibility</td>
											<td width="10%">Action</td>
										</tr>
									</thead>
									<tbody>
										<logic:present name="otherCovenantDetailsList">
											<logic:iterate id="ob" name="otherCovenantDetailsList"
												type="com.integrosys.cms.app.limit.bus.OBOtherCovenant"
												scope="page">
												<%-- <%
										
											String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
							
														%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=sno+startIndex%></td>
											<td><center><integro:empty-if-null value="<%=ob.getCovenantType()%>"/>&nbsp;</center></td>
											<td><center><%=ob.getCifId()%>&nbsp;</center></td>
											
											<td><center><%=ob.getStatus()%>&nbsp;</center></td>
											<%if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker") || event.equals("brchecker_list_party_detail") || event.equals("list_customer_brchecker")){ %>
											<td><center><select id="actionType<%=sno+startIndex%>" onchange="getAction('<%=ob.getCustomerID() %>','<%=ob.getCifId() %>','<%=sno+startIndex%>')">
              		<option value="">Please Select</option>
              		<option value="checkerView">View</option>
              	
              		<!--<option value="Delete">InActive</option>              	
              	--></select></center></td>
              	<%}else{ %>
              	<td><center><select id="actionType<%=sno+startIndex%>" onchange="getAction('<%=ob.getCustomerID() %>','<%=ob.getCifId() %>','<%=sno+startIndex%>')">
              		<option value="">Please Select</option>
              		<option value="View">View</option>
              		 <%if(isUserCpcMaker) { %>
              			<option value="Edit">Edit</option>
              			<%} %>
              		<option value="Delete">InActive</option>              	
              	</select></center></td>
              	<%} %>
						</tr> --%>
													<% if(ob.getStatus() != null && (ob.getStatus().equalsIgnoreCase("ACTIVE") || ob.getStatus().isEmpty())) { %>
												<tr class="">
													<td class="index"><%=sno++%></td>
													<td>
														<center>
															<integro:empty-if-null
																value="<%=ob.getCovenantCategory()%>" />
															&nbsp;
														</center>
													</td>
													<td>
														<center>
															<integro:common-code-single categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_TYPE %>" entryCode="<%=ob.getCovenantType()%>" display="true" descWithCode="false"/>&nbsp;
														</center>
													</td>
													<td>
														<center>
															<integro:common-code-single categoryCode="<%=CategoryCodeConstant.OTHER_COVENANT_CONDITIONS %>" entryCode="<%=ob.getCovenantCondition()%>" display="true" descWithCode="false"/>&nbsp;
														</center>
													</td>
													<td>
														<center>
															<integro:empty-if-null value="<%=ob.getTargetDate()%>" />
															&nbsp;
														</center>
													</td>
													<td>
													<%
													String displayMR="";
													if(ob.getMonitoringResponsibilityList1() != null){
													String monResp=ob.getMonitoringResponsibilityList1();
													String[] MRArr = monResp.split(",");
													for(int m=0; m<MRArr.length;m++) {
														String[] MRArr1 =MRArr[m].split("-");
														displayMR=displayMR+", "+(MRArr1[0]);
														/* System.out.println("length"+displayMR.length());
														System.out.println("displayMR"+displayMR); */
													}
													displayMR=displayMR.substring(1);
													}
													//System.out.println("MONITORING RESPONSIBILTY----------------------------------------------------------->");
													%>
														<center>
															<integro:empty-if-null value="<%=displayMR%>" />
															&nbsp;
														</center>
													</td>
													<%-- <td>
												<center><integro:empty-if-null
													value="<%=ob.getCovenantCondition()%>" />&nbsp;</center>
												</td> --%>
													<td>
													 <% if(!(event.equals("view_list_other_covenants") || ("view_return_to_Other_Covenant_List".equals(event)) && ("maker_close_aadetail".equals(mainEventIdentifier) || "view_list_other_covenants".equals(mainEventIdentifier) ))){%>
														<center>
															 <select name="select2" onchange="javascript:selectActionOtherCovenant(this,'<%=ob.getPreviousStagingId()%>','<%=mainEventIdentifier%>')">
                      <option value="">Please Select</option>
                      <option value="view">View </option>
                     <% if(isUserCpcMaker){%>
                      <option value="edit">Edit </option>
                      <option value="delete">Delete </option>
                      <% }%>
                    </select>
														</center>
														<% }else{%>
														<center>
															 <select name="select2" onchange="javascript:selectActionOtherCovenant(this,'<%=ob.getPreviousStagingId()%>','<%=mainEventIdentifier%>')">
                      <option value="">Please Select</option>
                      <option value="view">View </option>
                    </select>
														</center>
														<% } %>
													</td>
												</tr>
												<% } %>
											</logic:iterate>
										</logic:present>
										<logic:notPresent name="otherCovenantDetailsList">
											<tr class="odd">
												<td colspan="8"><bean:message
														key="label.global.not.found" /></td>
											</tr>
										</logic:notPresent>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
						<% if((event.equals("list_other_covenants")||  event.equals("list_other_covenants_edit") || event.equals("save_other_covenant") || "save_edited_other_covenant".equals(event) || event.equals("view_return_to_Other_Covenant_List") || "save_other_covenant_edit".equals(event) || event.equals("other_covenant_deleted") || event.equals("save_edited_other_covenant")) && mainEventIdentifier.equals("maker_add_aadetail")){%>
	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a
				href="javascript:eventToActionHandler(3)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<% }%>
	<% if(( event.equals("list_other_covenants_edit")|| event.equals("list_other_covenants") || "edit_other_covenant_details".equals(event) || event.equals("save_other_covenant_edit") || event.equals("save_edited_other_covenant") || event.equals("other_covenant_deleted") || event.equals("view_return_to_Other_Covenant_List")) && mainEventIdentifier.equals("maker_edit_aadetail")){%>
	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a
				href="javascript:eventToActionHandler(4)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<% }%>
	
	<%if(  (event.equals("view_list_other_covenants") || event.equals("view_return_to_Other_Covenant_List")) && (mainEventIdentifier.equals("viewMaker") || "view_list_other_covenants".equals(mainEventIdentifier)) ){%>
	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a
				href="javascript:eventToActionHandler(5)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<% }%>
	
	<%if((event.equals("view_return_to_Other_Covenant_List") || event.equals("check_list_other_covenants_view")) && mainEventIdentifier.equals("viewChecker")){%>
	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a
				href="javascript:eventToActionHandler(5)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<% }%>
	
	<%if(mainEventIdentifier.equals("maker_close_aadetail")){%>
	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a
				href="javascript:eventToActionHandler(6)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img
					src="img/return1.gif" name="Image1" width="70" height="22"
					border="0" id="Image1" /></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<% }%>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="generalPurposeBarTR">
				<td height="25">
					<%-- <table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">

	<tr>
   
 <%
                            String pageIndexUrl=null;
 if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker")){
                                pageIndexUrl = "ManualInputCustomer.do?event=list_customer_checker&customerNameShort="+customerNameShort+"&startIndex=";
 }
 else if(event.equals("brchecker_list_party_detail") || event.equals("list_customer_brchecker")){
                                pageIndexUrl = "ManualInputCustomer.do?event=list_customer_brchecker&customerNameShort="+customerNameShort+"&startIndex=";
 }
 else if(event.equals("list_customers_brmaker"))
 {
	 pageIndexUrl = "ManualInputCustomer.do?event=list_customers_brmaker&customerNameShort="+customerNameShort+"&startIndex=";
 }
 else{
	 pageIndexUrl = "ManualInputCustomer.do?event=list_customers&customerNameShort="+customerNameShort+"&startIndex=";
 }
                           
                        %>
<% if (list!=null) { %>

 
 <% if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker")){%>
   <td width="580" valign="middle">
                <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customer_checker"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
                  <%}else if(event.equals("list_customers_brmaker")){ %>
                   <td width="580" valign="middle">
                 <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customers_brmaker"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
                    <%}else if(event.equals("list_customers_brchecker") || event.equals("brchecker_list_party_detail") ){ %>
                   <td width="580" valign="middle">
                 <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customers_brchecker"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
               <%  }else{ %>
               <td width="580" valign="middle">
                 <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customers"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
                <%} %>
             
              <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
	<td valign="middle">  
	 <integro:pageindex pageIndex='<%=new PageIndex(startIndex,10, list.size())%>'
	 					url='<%=pageIndexUrl%>'/>             
	</td>
<% } %>
	 </tr>

	</table>
	</td></tr>
	</table>
	

	<!-- InstanceEndEditable -->
	<!--<html:hidden property="legalConstitution"/>
<html:hidden property="CIFId"/>
<html:hidden property="legalName"/>
<html:hidden property="cifId"/>
-->
	<html:hidden property="subProfileId" />
	<!--<html:hidden property="customerNameShort"/>
<html:hidden property="domicileCountry"/>
<html:hidden property="blacklisted"/>
<html:hidden property="source"/>
<html:hidden property="cifId"/>
<html:hidden property="address1"/>
<html:hidden property="address2"/>
<html:hidden property="officeAddress1"/>
<html:hidden property="officeAddress2"/>
<html:hidden property="state"/>
<html:hidden property="city"/>
<html:hidden property="officeState"/>
<html:hidden property="officeCity"/>
<html:hidden property="officeEmail"/>
<html:hidden property="officeTelephoneNo"/>
<html:hidden property="email"/>
<html:hidden property="telephoneNo"/>
<html:hidden property="country"/>
<html:hidden property="officeCountry"/>

<html:hidden property="postcode"/>
-->
	<%-- <html:hidden property="legalId" value="<%=form.getCifId() %>" />
	<html:hidden property="customerNameShort" value="<%=customerNameShort%>" /> --%>
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
</html:form>

<!-- InstanceEnd -->
</html>
