<%@ page
	import="java.util.*,java.text.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.common.constant.ICompConstant,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.app.limit.bus.ILimitProfile,com.integrosys.cms.app.limit.bus.ITradingAgreement,
	com.integrosys.cms.app.limit.trx.OBLimitProfileTrxValue,com.integrosys.cms.ui.common.AgreementTypeList,com.integrosys.cms.ui.common.CountryList,
	org.apache.struts.util.LabelValueBean,com.integrosys.cms.ui.common.CommonCodeList,java.text.SimpleDateFormat,
	com.integrosys.cms.ui.limit.CategoryCodeConstant,com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm,
	java.text.DecimalFormat"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
String event= (String) request.getAttribute("event");

String mainEventIdentifier = (String) session
.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.mainEventIdentifier");

System.out.println("mainEventIdentifier----------------->>" + mainEventIdentifier);
pageContext.setAttribute("mainEventIdentifier", mainEventIdentifier);

//System.out.println("event----------------->>" + event);
pageContext.setAttribute("event",event);
int vno=0;
int sno=0;
List otherCovenantDetailsList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.otherCovenantDetailsList");
	if(otherCovenantDetailsList != null){
	System.out.println("otherCovenantDetailsList----------------->>"+otherCovenantDetailsList);
	pageContext.setAttribute("otherCovenantDetailsList",otherCovenantDetailsList);
	}
	else
	{
		System.out.println("In ELSE");
		otherCovenantDetailsList = new ArrayList();
		pageContext.setAttribute("otherCovenantDetailsList",otherCovenantDetailsList);
	}

	String relationShipMgrName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.relationShipMgrName");

	//System.out.println("relationShipMgrName-------------------->"+relationShipMgrName);

	String regionName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.regionName");

	String branchName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.branchName");

	//System.out.println("branchName-------------------->"+branchName);
	  
	Collection riskGradeList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.riskGradeList");
		request.setAttribute("riskGradeList", riskGradeList);
	List creditAprrovalList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.creditAprrovalList");
		pageContext.setAttribute("creditAprrovalList",creditAprrovalList);
%>



<%@page import="com.integrosys.cms.ui.common.CountryList"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%><html>
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
function returnPage(){
	
	document.forms[0].action = "MIAADetail.do?event=checker_return_Other_Covenant_List_to_AA&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
}

function returnPage2(){
	
	document.forms[0].action = "MIAADetail.do?event=return_Other_Covenant_List_to_view_AA&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
}

function selectActionOtherCovenant(selectObj,displayId,mainEventIdentifier) {
	var curInd = selectObj.selectedIndex;
	if(curInd==1)
	{
	//alert(displayId);
	document.forms[0].action = "MIAADetail.do?event=view_other_covenant_details_checker&displayId="+displayId+"&mainEventIdentifier=" +mainEventIdentifier;
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
	  <input type="hidden" name="indicator" >
	   <input type="hidden" name="startIndex" >
	  
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
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		

		
			<tr>
				<td colspan="2">
				<table width="100%" class="tblinfo" style="margin-top: 0" border="0"
					cellspacing="0" cellpadding="0">
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
												<td class="index"><%=sno++ %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getCovenantCategory()%>" />&nbsp;</center>
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
												<center><integro:empty-if-null
													value="<%=ob.getTargetDate()%>" />&nbsp;</center>
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
														System.out.println("length"+displayMR.length());
														System.out.println("displayMR"+displayMR);
													}
													displayMR=displayMR.substring(1);
													}
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
												<center>
												<select name="select2" onchange="javascript:selectActionOtherCovenant(this,'<%=ob.getPreviousStagingId()%>','<%=mainEventIdentifier%>')">
													<option value="">-Select-</option>
													<option value="View">View</option>
												</select></center>
												</td>
											</tr>
						<% } %>
						</logic:iterate></logic:present>
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
		
	</table>
	</td></tr>
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
 <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  	<%if(mainEventIdentifier.equals("viewChecker")) {%>
  	<td><a href="javascript:returnPage2()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  	<%}else{ %>
    <td><a href="javascript:returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
    <%} %>
    
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

<!-- InstanceEnd -->
</html>
