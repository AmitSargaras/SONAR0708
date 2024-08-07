<%@ page
	import="java.util.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.ui.common.UIUtil,com.integrosys.cms.ui.common.ConvertFloatToString,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.commondata.app.CommonDataSingleton,com.integrosys.cms.app.customer.bus.*,com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.ui.customer.CategoryCodeConstant,com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>

<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>

<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<%
	ManualInputCustomerInfoForm customer = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");
	List partyGrpList = (List) request.getAttribute("partyGrpList");
	int listSize = 0;
	String index = (String) request.getAttribute("index");
	String event = (String) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.event");
	if(index == null || index == "")
	{
		index="0";
	}
	 
	if (partyGrpList != null) {
		listSize = partyGrpList.size();
		pageContext.setAttribute("listSize", Integer
				.toString(partyGrpList.size()));
		pageContext.setAttribute("partyGrpList", partyGrpList);
	}
	else
		partyGrpList = new ArrayList();
	 
	
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
<script language="JavaScript" type="text/JavaScript">

	function MM_swapImgRestore() { //v3.0
    	var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	  }

	function MM_preloadImages() { //v3.0
	    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}

  function MM_findObj(n, d) { //v4.01
    var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
      d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
    if(!x && d.getElementById) x=d.getElementById(n); return x;
  }

  function MM_swapImage() { //v3.0
    var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
     if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
  }

  function returnPage(name) {
	    document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value = name;
	    document.forms[0].submit();
	}
	
function savePartyGroup(name) 
{	
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value = name;
    document.forms[0].submit();
    
    //alert(document.getElementById("customerNameShort").value);
}
function getPartyList(name)
{    
	 var subLineName = document.forms[0].subLineName.value;
	 if(subLineName == '')
	 {
alert('Please Enter party name.!!');
	 }
	 else
	 {
	document.forms[0].action="ManualInputCustomer.do?event="+name+"&partyName="+subLineName;
    document.forms[0].submit();
	 }
}
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ManualInputCustomer.do">
	<body>
	<html:hidden property="event"></html:hidden>

	<!-- InstanceBeginEditable name="Content" -->
	<table width="65%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="100%" valign="bottom">
				<table width="100%" border="0" align="right" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="100%">
						<h3>Add SubLine Details</h3>
						<hr />

						<table class="tblFormSection" id="backEdit1" width="100%"
							border="0" align="center" cellpadding="0" cellspacing="0"
							style="margin-top: 0">
							<tbody>
								<tr>
									<!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
									<td><br />

									<table class="tblInput" id="backEdit2" width="100%" border="0"
										align="center" cellpadding="0" cellspacing="0"
										style="margin-top: 0">
										<tbody>
											<tr class="even">
												<td width="20%" class="fieldname">Party Name<font color="red">*</font></td>
												<td width="20%" class="even">
												<%if(partyGrpList.size() !=0) {%>
												<logic:present
													name="partyGrpList">
													<logic:iterate id="OB" name="partyGrpList"
														type="com.integrosys.cms.app.customer.bus.OBCMSCustomer"
														scope="page" length="10">


                                                           
														<input type="text" value="<%=OB.getCustomerName()%>" readonly="readonly"></input>
														<input type="hidden" name="partyId"  value="<%=OB.getCustomerID()%>">
														
														
														
														<input type="button"
															onclick="javascript:getPartyList('display_party_list')"
															name="button2" id="button2" value="Go" class="btnNormal">
													</logic:iterate>
												</logic:present> 
												
												<%}else{ %>
												<html:text property="subLineName" size="30" maxlength="20"></html:text>&nbsp;
													<%if(event.equals("add_sub_line")) {%>
												<input type="button"
															onclick="javascript:getPartyList('display_party_list')"
															name="button2" id="button2" value="Go" class="btnNormal">
												<%}else if(event.equals("add_sub_line_in_edit")){ %>
												<input type="button"
															onclick="javascript:getPartyList('display_party_list_in_edit')"
															name="button2" id="button2" value="Go" class="btnNormal">
												<%}else if(event.equals("add_sub_line_in_resubmit")){ %>
												<input type="button"
															onclick="javascript:getPartyList('display_party_list_in_resubmit')"
															name="button2" id="button2" value="Go" class="btnNormal">
												<%} %>
												<%} %>
												<br><html:errors property="partyIdError"/>
												</td>

												<td width="20%" class="fieldname">Guaranteed Amount
												(INR)<span class="style11"></span></td>
												<td width="20%"><html:text property="amount"
													size="30" maxlength="23"></html:text>&nbsp;</td>
											</tr>
											
											
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
									</table>
									</td>
								</tr>
							</tbody>
						</table>


						<%--@ include file="/customer/view_credit_rating.jsp"--%>

						<table width="150" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
							<%if(event.equals("add_sub_line")) {%>
								<td align="center"><a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								<img src="img/save1.gif" name="ImageSave" width="70" height="20"
									border="0" id="ImageSave"
									onclick="javascript:savePartyGroup('save_party_group')" /></a> <a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="ImageCancel" width="70"
									height="20" border="0" id="ImageCancel" onclick="returnPage('display_financial_details')" /></a>
								</td>
								<%}else if(event.equals("add_sub_line_in_edit")){ %>
								<td align="center"><a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								<img src="img/save1.gif" name="ImageSave" width="70" height="20"
									border="0" id="ImageSave"
									onclick="javascript:savePartyGroup('save_party_group_in_edit')" /></a> <a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="ImageCancel" width="70"
									height="20" border="0" id="ImageCancel" onclick="returnPage('edit_financial_details')" /></a>
								</td>
								<%}else if(event.equals("add_sub_line_in_resubmit")){ %>
								<td align="center"><a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								<img src="img/save1.gif" name="ImageSave" width="70" height="20"
									border="0" id="ImageSave"
									onclick="javascript:savePartyGroup('save_party_group_in_resubmit')" /></a> <a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="ImageCancel" width="70"
									height="20" border="0" id="ImageCancel" onclick="returnPage('process_financial_details')" /></a>
								</td>
								
								<%} else if(event.equals("add_party_group")){ %>
								<td align="center"><a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								<img src="img/save1.gif" name="ImageSave" width="70" height="20"
									border="0" id="ImageSave"
									onclick="javascript:savePartyGroup('save_party_group')" /></a> <a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="ImageCancel" width="70"
									height="20" border="0" id="ImageCancel" onclick="returnPage('display_financial_details')" /></a>
								</td>
								
								<%} else if(event.equals("add_party_group_in_edit")){ %>
								<td align="center"><a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								<img src="img/save1.gif" name="ImageSave" width="70" height="20"
									border="0" id="ImageSave"
									onclick="javascript:savePartyGroup('save_party_group_in_edit')" /></a> <a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="ImageCancel" width="70"
									height="20" border="0" id="ImageCancel" onclick="returnPage('edit_financial_details')" /></a>
								</td>
								<%} else if(event.equals("add_party_group_in_resubmit")){ %>
								<td align="center"><a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
								<img src="img/save1.gif" name="ImageSave" width="70" height="20"
									border="0" id="ImageSave"
									onclick="javascript:savePartyGroup('save_party_group_in_resubmit')" /></a> <a href="#"
									onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="ImageCancel" width="70"
									height="20" border="0" id="ImageCancel" onclick="returnPage('process_financial_details')" /></a>
								</td>
								
								<%} %>
							</tr>

						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</thead>
	</table>
	<!-- InstanceEndEditable -->
	</body>
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
		<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="partyGroupName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />			
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
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
	<html:hidden name="ManualInputCustomerInfoForm" property="industryName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />


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
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedShareLimit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="system" />
	<html:hidden name="ManualInputCustomerInfoForm" property="amount" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="systemCustomerId" />
<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI"  styleId="deferLEI"/>

		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
		<!--End Santosh LEI CR  -->
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
		<html:hidden name="ManualInputCustomerInfoForm" property="vendorName" />
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

<!-- InstanceEnd -->
</html>
