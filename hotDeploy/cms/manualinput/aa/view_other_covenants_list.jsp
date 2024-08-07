<%@ page
	import="java.util.*,java.text.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.common.constant.ICompConstant,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.app.limit.bus.ILimitProfile,com.integrosys.cms.app.limit.bus.ITradingAgreement,
	com.integrosys.cms.app.limit.trx.OBLimitProfileTrxValue,com.integrosys.cms.ui.common.AgreementTypeList,com.integrosys.cms.ui.common.CountryList,
	org.apache.struts.util.LabelValueBean,com.integrosys.cms.ui.common.CommonCodeList,java.text.SimpleDateFormat,
	com.integrosys.cms.ui.collateral.CategoryCodeConstant,com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm,
	java.text.DecimalFormat"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
String event= (String) request.getAttribute("event");
System.out.println("event----------------->>" + event);
pageContext.setAttribute("event",event);

Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.limitProfileTrxVal");
pageContext.setAttribute("limitProfileTrxVal",obj);

String preEvent = request.getParameter("preEvent");
System.out.println("preEvent----------------->>" + preEvent);
pageContext.setAttribute("preEvent",preEvent);

String aaID= (String) request.getAttribute("aaID");
System.out.println("aaID----------------->>" + aaID);
pageContext.setAttribute("aaID",aaID);

ILimitProfile obLimitProfile2=(ILimitProfile) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.obLimitProfile");
System.out.println("obLimitProfile2----------------->>" + session.obLimitProfile2);
pageContext.setAttribute("session.obLimitProfile",obLimitProfile2);

String totalSanctionedAmtFac= (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.totalSanctionedAmtFac");
System.out.println("session.totalSanctionedAmtFac----------------->>" + totalSanctionedAmtFac);
pageContext.setAttribute("session.totalSanctionedAmtFac",totalSanctionedAmtFac);


String aaID2= (String) (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.aaID");
System.out.println("session.aaID----------------->>" + aaID2);
pageContext.setAttribute("session.aaID",aaID2);

String migratedFlag= (String) (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.migratedFlag");
System.out.println("migratedFlag----------------->>" + migratedFlag);
pageContext.setAttribute("migratedFlag",migratedFlag);


String customerID=(String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.customerID");
System.out.println("customerID----------------->>" + customerID);
pageContext.setAttribute("customerID",customerID);

List transactionHistoryList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.transactionHistoryList");
System.out.println("transactionHistoryList----------------->>"+transactionHistoryList);
pageContext.setAttribute("transactionHistoryList",transactionHistoryList);


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

System.out.println("relationShipMgrName-------------------->"+relationShipMgrName);

String regionName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.regionName");

String branchName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.branchName");

System.out.println("branchName-------------------->"+branchName);
  
Collection riskGradeList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.riskGradeList");
	request.setAttribute("riskGradeList", riskGradeList);
	List creditAprrovalList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.creditAprrovalList");
	pageContext.setAttribute("creditAprrovalList",creditAprrovalList);




int sno = 0;
int startIndex=0;
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
		DefaultLogger.debug(this, "getSubProfileId :"
				+ form.getSubProfileId() + "<<<<<<");
	} else {

	}
	
	
	int vno = 1;
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
function createOtherCovenantDetails(name){
	alert('createOtherCovenantDetails');
	document.forms[0].action="MIAADetail.do?event="+name;
	document.forms[0].submit();
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
			<%if(event.equals("list_other_covenants") || event.equals("save_other_covenant")){ System.out.println("In if1"); %>
				<td align="right">
					<input type="button" id="AddNew" value="Add New"
					onclick="javascript:createOtherCovenantDetails('prepare_add_other_covenant_details')" class="btnNormal"
					style="width: 100px" /></td>
				<%}%>
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
						
									<tr class="">
												<td class="index"><%=sno++ %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getCovenantCategory()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getCovenantType()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getCovenantCondition()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getTargetDate()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="" />&nbsp;</center>
												</td>
												<%-- <td>
												<center><integro:empty-if-null
													value="<%=ob.getCovenantCondition()%>" />&nbsp;</center>
												</td> --%>
											<td>
												<center><select id="action<%=vno%>">
													<option value="">-Select-</option>
													<option value="View">View</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
												</td>
											</tr>
						
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
    <td><a href="javascript:createOtherCovenantDetails('return_Other_Covenant_List_to_AA')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<html:hidden name="AADetailForm" property="camType"/>
		<html:hidden name="AADetailForm" property="aaNum"/>
		<html:hidden name="AADetailForm" property="aaApprovalDate"/>
		<html:hidden name="AADetailForm" property="camLoginDate"/>
		<html:hidden name="AADetailForm" property="ramRating"/>
		<html:hidden name="AADetailForm" property="ramRatingYear"/>
		<html:hidden name="AADetailForm" property="ramRatingType"/>
		<html:hidden name="AADetailForm" property="ramRatingFinalizationDate"/>
		<html:hidden name="AADetailForm" property="annualReviewDate"/>
		<html:hidden name="AADetailForm" property="extendedNextReviewDate"/>
		<html:hidden name="AADetailForm" property="noOfTimesExtended"/>
		<html:hidden name="AADetailForm" property="totalSactionedAmount"/>
		<html:hidden name="AADetailForm" property="controllingBranch"/>
		<html:hidden name="AADetailForm" property="fullyCashCollateral"/>
		<html:hidden name="AADetailForm" property="totalSanctionedAmountFacLevel"/>
		<html:hidden name="AADetailForm" property="committeApproval"/>
		<html:hidden name="AADetailForm" property="boardApproval"/>
		<html:hidden name="AADetailForm" property="creditApproval1"/>
		<html:hidden name="AADetailForm" property="creditApproval2"/>
		<html:hidden name="AADetailForm" property="creditApproval3"/>
		<html:hidden name="AADetailForm" property="creditApproval4"/>
		<html:hidden name="AADetailForm" property="creditApproval5"/>
		<html:hidden name="AADetailForm" property="rbiAssetClassification"/>
		<html:hidden name="AADetailForm" property="assetClassification"/>
		<html:hidden name="AADetailForm" property="nameOfDirectorsAndCompany"/>
		<html:hidden name="AADetailForm" property="rbiApprovalForSingle"/>
		<html:hidden name="AADetailForm" property="detailsOfRbiApprovalForSingle"/>
		<html:hidden name="AADetailForm" property="rbiApprovalForGroup"/>
		<html:hidden name="AADetailForm" property="detailsOfRbiApprovalForGroup"/>
		<html:hidden name="AADetailForm" property="docRemarks"/>
</html:form>

<!-- InstanceEnd -->
</html>
