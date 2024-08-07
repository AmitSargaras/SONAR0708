<%@ page
	import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="java.util.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.ui.common.UIUtil,com.integrosys.cms.ui.common.ConvertFloatToString,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.commondata.app.CommonDataSingleton,com.integrosys.cms.app.customer.bus.*,com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.ui.customer.CategoryCodeConstant,com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>


<%
	List partyList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyList");
pageContext
.setAttribute("listSize", Integer.toString(partyList.size()));
pageContext.setAttribute("partyList", partyList);
	String bankId = "";
	
	int sno = 0;
	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	String index = (String) request.getAttribute("index");
	String event = (String) request.getAttribute("event");
	if(index == null || index == "")
	{
		index="0";
	}
	
	//int startIndex=0;
	//	String ind= (String) request.getAttribute("startIndex");
	//if(ind!=null && (!ind.equals("")))
	//	 startIndex = Integer.parseInt(ind);

	ManualInputCustomerInfoForm customer = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");

String[] revisedArr1 = customer.getRevisedEmailIdsArray();
	String[] revisedArr = customer.getRevisedEmailIdsArray();
	int len = 0;

	customer.setRevisedEmailIdsArray(customer.getRevisedEmailIdsArray());

	if(customer != null){
		if(customer.getRevisedEmailIdsArray() != null){
			for(int i=0; i<customer.getRevisedEmailIdsArray().length;i++){
				System.out.println("cibil details=>+++++customer.getRevisedEmailIdsArray()--=======>"+customer.getRevisedEmailIdsArray()[i].toString()+" ** customer.getRevisedEmailIdsArray().length=>"+customer.getRevisedEmailIdsArray().length);
			}
		}
	}


	List revisedArr22 = customer.getRevisedArrayListN();


	if(customer != null){
		if(customer.getRevisedEmailIdsArray() != null){
			len = revisedArr1.length;
			revisedArr = new String[len];
			for(int i=0; i<customer.getRevisedEmailIdsArray().length;i++){
				revisedArr[i] = revisedArr1[i];
				System.out.println("I="+i+" ** revisedArr[i]===>"+revisedArr[i]);
			}
		}
	}  

	System.out.println("Revised ArrayList create cibil method =>"+customer.getRevisedArrayListN());
	/* List arr12 = value.getRevisedArrayListN();
	System.out.println("arr12.size()=>"+arr12.size());
	pageContext.setAttribute("arr12",arr12); */
	pageContext.setAttribute("revisedArr",revisedArr);
	int cnt = 0;
	
%>



<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%><html>
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

	function searchOtherBank()
    {	
        var bankCode = document.getElementById("bankCode").value;
        var bankName = document.getElementById("bankName").value;
        document.forms[0].action = "OtherBank.do?event=view_other_bank&BankCode="+bankCode+"&BankName="+bankName;
        document.forms[0].submit();
    }

	function addNew() {
	    document.forms[0].action = "OtherBank.do?event=prepare_create_other_bank";
	    document.forms[0].submit();
	}
	 function returnPage(name) {

		
		    document.forms[0].action = "ManualInputCustomer.do?event="+name;
		    document.forms[0].submit();
		}
		
	function addPartyGroup(event) 
	{	
		
		 document.forms[0].action = "ManualInputCustomer.do?event="+event;
		
	    document.forms[0].submit();
	    
	    //alert(document.getElementById("customerNameShort").value);
	}
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="OtherBank.do">
		<input type="hidden" name="BankId" />
		<html:hidden property="event" />
		<input type="hidden" name="startIndex" />
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
							<td width="70%">
							<h3>Party Group List</h3>
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tr>
									<td colspan="2">
									<hr />
									</td>
								</tr>
								<tbody>



									<tr>
										<td colspan="2"><br />
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="10%">Party Code</td>
													<td width="15%">Party Name</td>
													
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>

												<logic:greaterThan name="listSize" value="0">
													<logic:iterate id="OB" name="partyList"
														type="com.integrosys.cms.app.customer.bus.OBCMSCustomer"
														scope="page" >
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
																bankId = Long.toString(OB.getCustomerID());
															%>
															<td class="index"><%=sno%></td>

															<td><%=OB.getCifId() %></td>

															<td><%=OB.getCustomerName() %></td>

															
															<td>
															<center><input type="radio" id="bank" name="partyId"
																value="<%=OB.getCustomerID()%>"></input></center>
															</td>

														</tr>
													</logic:iterate>
												</logic:greaterThan>
												<logic:equal name="listSize" value="0">
													<tr>
														<td colspan="13">Sorry,No Records Found</td>
													</tr>
												</logic:equal>
												
												<logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str1 = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str1);
										%>
										<tr>
											<td><html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str1%>"/></td>
										</tr>
										<%cnt++;
										%>
									</logic:iterate>
								</logic:present>
												
											</tbody>
										</table>
									</tr>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							
							<%if(event.equals("display_party_list")){ %>
						<td align="center">
							<a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								
							<img src="img/save1.gif" name="ImageSave" width="70" height="20"
								border="0" id="ImageSave" onclick="javascript:addPartyGroup('add_party_group')" /></a>
								<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="ImageCancel" width="70"
								height="20" border="0" id="ImageCancel" onclick="returnPage('add_sub_line')" /></a>
								</td>
								<%}else if(event.equals("edit_display_party_list")){ %>
										<td align="center">
									<a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								
							<img src="img/save1.gif" name="ImageSave" width="70" height="20"
								border="0" id="ImageSave" onclick="javascript:addPartyGroup('edited_party_group')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="ImageCancel" width="70"
								height="20" border="0" id="ImageCancel" onclick="returnPage('edit_sub_line')" /></a>
									</td>
									<%}else if(event.equals("edit_display_party_list_in_edit")){  %>
							<td align="center">
									<a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								
							<img src="img/save1.gif" name="ImageSave" width="70" height="20"
								border="0" id="ImageSave" onclick="javascript:addPartyGroup('edited_party_group_in_edit')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="ImageCancel" width="70"
								height="20" border="0" id="ImageCancel" onclick="returnPage('add_sub_line_in_edit')" /></a>
									</td>
									<%}else if(event.equals("edit_display_party_list_in_resubmit")){  %>
							<td align="center">
									<a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								
							<img src="img/save1.gif" name="ImageSave" width="70" height="20"
								border="0" id="ImageSave" onclick="javascript:addPartyGroup('edited_party_group_in_resubmit')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="ImageCancel" width="70"
								height="20" border="0" id="ImageCancel" onclick="returnPage('add_sub_line_in_resubmit')" /></a>
									</td>
							<%} else if(event.equals("display_party_list_in_edit")){  %>
							<td align="center">
									<a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								
							<img src="img/save1.gif" name="ImageSave" width="70" height="20"
								border="0" id="ImageSave" onclick="javascript:addPartyGroup('add_party_group_in_edit')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="ImageCancel" width="70"
								height="20" border="0" id="ImageCancel" onclick="returnPage('add_sub_line_in_edit')" /></a>
									</td>
									<%} else if(event.equals("display_party_list_in_resubmit")){  %>
							<td align="center">
									<a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								
							<img src="img/save1.gif" name="ImageSave" width="70" height="20"
								border="0" id="ImageSave" onclick="javascript:addPartyGroup('add_party_group_in_resubmit')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="ImageCancel" width="70"
								height="20" border="0" id="ImageCancel" onclick="returnPage('add_sub_line_in_resubmit')" /></a>
									</td>
							<%} %>
						</tr>
					</table>

					</td>
				</tr>

			</table>

			</td>
		</tr>

		<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="domicileCountry" value="IN" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="customerNameShort" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
		<html:hidden name="ManualInputCustomerInfoForm" property="email" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="customerBranch" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="customerSegment" />
		<html:hidden name="ManualInputCustomerInfoForm" property="status" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="partyGroupName" />
			<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="relationshipMgr" />
		<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
		<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />		
		<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
		<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="rbiIndustryCode" />
		<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
		<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	    <html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	    <html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />	
	    <html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" /> 	
			<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="industryName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
		<html:hidden name="ManualInputCustomerInfoForm" property="region" />
		<html:hidden name="ManualInputCustomerInfoForm" property="country" />
		<html:hidden name="ManualInputCustomerInfoForm" property="state" />
		<html:hidden name="ManualInputCustomerInfoForm" property="city" />
		<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
		<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />

		<!--End Santosh LEI CR  -->	
		<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="bankingMethod" />
		<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />	
		<html:hidden name="ManualInputCustomerInfoForm"
			property="totalFundedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="totalNonFundedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="fundedSharePercent" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="nonFundedSharePercent" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="memoExposure" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="totalSanctionedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="fundedShareLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="nonFundedShareLimit" />
			
			<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="index" value="<%=index%>"/>
		<html:hidden name="ManualInputCustomerInfoForm" property="partyId" />
			<html:hidden name="ManualInputCustomerInfoForm" property="amount" />
			<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeState" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeState" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="borrowerDUNSNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity1" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity2" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity3" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="willfulDefaultStatus" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitFilledStatus" />

	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfSuit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="suitAmount" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="branchCode" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="directorName" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="isRBIWilfulDefaultersList" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="nameOfBank" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isDirectorMoreThanOne" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="nameOfDirectorsAndCompany" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfDefault" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="extOfCompromiseAndWriteoff" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isCibilStatusClean" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfCleanCibil" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isBorrDefaulterWithBank" />
		<html:hidden name="ManualInputCustomerInfoForm" property="finalBankMethodList" />
<html:hidden name="ManualInputCustomerInfoForm" property="leadValue" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" />
		
		
		<jsp:include page="cri_hidden_details.jsp"></jsp:include>
		<jsp:include page="udf_hidden_details.jsp"></jsp:include>
	</html:form>
</table>
</body>
</html>

