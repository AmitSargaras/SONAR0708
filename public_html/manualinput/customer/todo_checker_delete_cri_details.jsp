<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>

<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><script type="text/javascript" src="js/calendar.js"></script>
<%

Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
.getAttribute("ManualInputCustomerInfoForm");
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	
	List facList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facList");
	System.out.println("************************************ "+	session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facList"));

	if (!(facList == null)) {
		
		pageContext.setAttribute("facList", facList);
	}
	
	int no = 0;
%>


<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<script language="JavaScript" type="text/JavaScript"><!--
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

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


function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>


	
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">
		<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
		<jsp:include page="udf_hidden_details.jsp"></jsp:include>
		<tr>
			<td valign="top">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				
				<tbody>
					<tr id="customerdetails"><td>
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">        
                <tbody>
                  <tr class="odd">
                    <td class="fieldname" width="20%">Name of the Customer</td>
                    <td width="30%"><integro:empty-if-null value="<%=form.getLegalName()%>"/> </td>
                    <td class="fieldname" width="20%">Constitution</td>
                    <td width="30%">&nbsp; </td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname" width="20%">PAN</td>
                    <td width="30%"><integro:empty-if-null value="<%=form.getPan()%>"></integro:empty-if-null> </td>
                    <td class="fieldname" width="20%">Customer RAM Id</td>
                    <td width="30%"><integro:empty-if-null value="<%=form.getCustomerRamID()%>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname" width="20%">Customer APR Code</td>
                    <td width="30%"><integro:empty-if-null value="<%=form.getCustomerAprCode()%>"></integro:empty-if-null></td>
                    <td class="fieldname" width="20%">Customer External Rating</td>
                    <td width="30%"><integro:empty-if-null value="<%=form.getCustomerExtRating()%>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="odd">
                  <td class="fieldname" width="20%">Customer FY Closure</td>
                    <td width="30%"><integro:empty-if-null value="<%=form.getCustomerFyClouser()%>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">NBFC</td>
                    <%System.out.println(form.getIsNbfs()); %>
                    <td><html:radio property="isNbfs" value="Yes"  disabled="true"/> Yes 
						<html:radio property="isNbfs" value="No" disabled="true"/> No &nbsp;
					</td>
                    <td class="fieldname"><p>a)</p>
                    <p>b)</p></td>
                    <td><p>
                     <integro:empty-if-null value="<%=form.getNbfsA()%>"></integro:empty-if-null>
                    </p>
                    <p>
                      <integro:empty-if-null value="<%=form.getNbfsB()%>"></integro:empty-if-null>
</p></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Priority/Non priority Sector</td>
                    <td><integro:empty-if-null value="<%=form.getIsPrioritySector()%>"></integro:empty-if-null></td>
                    <td class="fieldname">MSME Classification</td>
                    <td><integro:empty-if-null value="<%=form.getMsmeClassification()%>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname"><p>Weaker Section </p>                    </td>
                    <td><p>
                        <html:radio property="isWeakerSection" value="Yes"  disabled="true"/> Yes 
						<html:radio property="isWeakerSection" value="No" disabled="true"/> No &nbsp;</p>
                      <p>&nbsp;</p>                    </td>
                    <td class="fieldname">Type</td>
                    <td><p>
                     <integro:empty-if-null value="<%=form.getWeakerSection() %>"></integro:empty-if-null>
                    </p>
                      <p><html:text property="govtSchemeType"  /><html:errors property="govtSchemeType"/></p></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Permanent SSI Certificate </td>
                    <td><html:radio property="isPermenentSsiCert" value="Yes"   disabled="true"/> Yes 
						<html:radio property="isPermenentSsiCert" value="No"   disabled="true"/> No  &nbsp;</td>
                    <td class="fieldname">&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Minority Community</td>
                    <td><p>
                     <html:radio property="isMinorityCommunity" value="Yes"   disabled="true"/> Yes 
					 <html:radio property="isMinorityCommunity" value="No"    disabled="true"/> No</p>
                    <p>
                       <integro:empty-if-null value="<%=form.getMinorityCommunity() %>"></integro:empty-if-null>
                    </p></td>
                    <td class="fieldname">Capital Market Exposure
                    </td>
                    <td>
                    <integro:empty-if-null value="<%=form.getIsCapitalMarketExpos() %>"></integro:empty-if-null></td></tr>
                  <tr class="even">
                    <td class="fieldname">Real Estate Exposure</td>
                    <td> <integro:empty-if-null value="<%=form.getIsRealEstateExpos() %>"></integro:empty-if-null></td>
                    <td class="fieldname">Commodities Exposure</td>
                    <td> <html:radio property="isCommoditiesExposer" value="Yes"   disabled="true"/> Yes 
								<html:radio property="isCommoditiesExposer" value="No"   disabled="true"/> No
								</td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Sensitive</td>
                    <td> <html:radio property="isSensitive" value="Yes"   disabled="true"/> Yes 
								<html:radio property="isSensitive" value="No"   disabled="true" /> No</td>
                    <td class="fieldname">Commodity Name</td>
                    <td><integro:empty-if-null value="<%=form.getCommoditiesName() %>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Gross Investment (In plant and machinery) (INR)</td>
                    <td>Rs.<integro:empty-if-null value="<%=form.getGrossInvsInPM()%>">&nbsp; millions</integro:empty-if-null></td>
                    <td class="fieldname">Gross Investment (In equipment) (INR)</td>
                    <td>Rs.<integro:empty-if-null value="<%=form.getGrossInvsInEquip() %>"></integro:empty-if-null>&nbsp; millions</td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">PSU</td>
                    <td><p>
                      <html:radio property="psu" value="State"   disabled="true"/> State 
								<html:radio property="psu" value="Central"   disabled="true"/> Central 
								<html:radio property="psu" value="No"   disabled="true"/> No </p>                    </td>
                    <td class="fieldname">Percentage of Shareholding</td>
                    <td><p>
                      <integro:empty-if-null value="<%=form.getPsuPercentage() %>"></integro:empty-if-null>
                    </p>
                    <p>&nbsp;</p></td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Govt. Undertaking</td>
                    <td><html:radio property="govtUnderTaking" value="State"   disabled="true"/> State 
								<html:radio property="govtUnderTaking" value="Central"   disabled="true"/> Central 
								<html:radio property="govtUnderTaking" value="No"   disabled="true"/> No </td>
                    <td class="fieldname">Banking Method</td>
                    <td><integro:empty-if-null value="<%=form.getBankingMethod() %>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Infrastructure Finance</td>
                    <td ><integro:empty-if-null value="<%=form.getIsInfrastructureFinanace() %>"></integro:empty-if-null></td>
                    <td class="fieldname">Type</td>
                    <td><integro:empty-if-null value="<%=form.getInfrastructureFinanaceType() %>"></integro:empty-if-null></td>
                  </tr>
                  
                  <tr class="odd">
                    <td class="fieldname">SEMS Guidelines Applicable</td>
                    <td><html:radio property="isSemsGuideApplicable" value="Yes"   disabled="true"/> Yes 
						<html:radio property="isSemsGuideApplicable" value="No"   disabled="true"/> No </td>
                    <td class="fieldname">Whether fails under IFC&rsquo;s Exclusion List</td>
                    <td><html:radio property="isFailIfcExcluList" value="Yes"   disabled="true"/> Yes 
								<html:radio property="isFailIfcExcluList" value="No"   disabled="true"/> No </td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">TUFS</td>
                    <td>
                    <html:radio property="isTufs" value="Yes"   disabled="true"/> Yes 
					<html:radio property="isTufs" value="No"   disabled="true"/> No 
					</td>
                    <td class="fieldname">RBI Defaulter&rsquo;s list / Caution List</td>
                    <td><p>
                      <html:radio property="isRbiDefaulter" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isRbiDefaulter" value="No"   disabled="true" /> No </p>
                    <p>
                      <html:radio property="rbiDefaulter" value="Company"   disabled="true"/> Company 
								<html:radio property="rbiDefaulter" value="Directors"   disabled="true"/> Directors 
								<html:radio property="rbiDefaulter" value="Group Companies"   disabled="true"/> Group Companies </p></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Litigations Pending / contemplated by Banks /  Financiers</td>
                    <td>
                      <html:radio property="isLitigation" value="Yes"   disabled="true"/> Yes 
								<html:radio property="isLitigation" value="No"   disabled="true"/> No 
                   
                      <integro:empty-if-null value="<%=form.getLitigationBy() %>"></integro:empty-if-null>                   </td>
                    <td class="fieldname">Interest of Directors / Senior officers /  (Credit approvers) of the bank</td>
                    <td>
                      <html:radio property="isInterestOfBank" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isInterestOfBank" value="No"   disabled="true" /> No 
                     
                        <integro:empty-if-null value="<%=form.getInterestOfBank() %>"></integro:empty-if-null>                    </td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Adverse Remark (if Any)</td>
                    <td>
                     <html:radio property="isAdverseRemark" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isAdverseRemark" value="No"   disabled="true" /> No   
								<integro:empty-if-null value="<%=form.getAdverseRemark() %>"></integro:empty-if-null>                </td>
                    <td class="fieldname">Audit</td>
                    <td>
                    <html:radio property="auditType" value="Internal Audit"   disabled="true"/> Internal Audit 
								<html:radio property="auditType" value="External Audit"   disabled="true"/> External Audit
								<html:radio property="auditType" value="RBI Audit"   disabled="true"/> RBI Audit </td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Average Annual turnover (In Million INR)</td>
                    <td><integro:empty-if-null value="<%=form.getAvgAnnualTurnover() %>"></integro:empty-if-null> </td>
                    <td class="fieldname">RBI Industry Code</td>
                    <td><integro:empty-if-null value="<%=form.getRbiIndustryCode() %>"></integro:empty-if-null> </td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Industry</td>
                    <td><integro:empty-if-null value="<%=form.getIndustryName() %>"></integro:empty-if-null> </td>
                    <td class="fieldname">Industry Exposure %</td>
                    <td><integro:empty-if-null value="<%=form.getIndustryExposer() %>"></integro:empty-if-null> </td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Is the borrower a director (including the  chairman/ Managing Director) of other banks</td>
                    <td>
                      <html:radio property="isDirecOtherBank" value="Yes"   disabled="true" /> Yes 
						<html:radio property="isDirecOtherBank" value="No"   disabled="true" /> No  
						<integro:empty-if-null value="<%=form.getDirecOtherBank() %>"></integro:empty-if-null> </td>
                    <td class="fieldname">Is the partner / guarantor of the borrowing firm  a director of other banks</td>
                    <td>
                      <html:radio property="isPartnerOtherBank" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isPartnerOtherBank" value="No"   disabled="true" /> No 
								<integro:empty-if-null value="<%=form.getPartnerOtherBank() %>"></integro:empty-if-null>            </td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Is the &ldquo;substantial&rdquo; shareholder / director /  guarantor of the borrowing company a director of other banks</td>
                    <td>
                      <html:radio property="isSubstantialOtherBank" value="Yes"  disabled="true" /> Yes 
								<html:radio property="isSubstantialOtherBank" value="No"   disabled="true" /> No 
								<integro:empty-if-null value="<%=form.getSubstantialOtherBank() %>"></integro:empty-if-null>                       </td>
                    <td class="fieldname">Is the borrower a relative of HDFC Bank&rsquo;s  Chairman / Managing directors or other directors</td>
                    <td>
                      <html:radio property="isHdfcDirecRltv" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isHdfcDirecRltv" value="No"   disabled="true" /> No 
					   <integro:empty-if-null value="<%=form.getHdfcDirecRltv() %>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Is the borrower a relative of the Chairman /  Managing Directors / or other directors of other banks </td>
                    <td>
                      <html:radio property="isObkDirecRltv" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isObkDirecRltv" value="No"   disabled="true" /> No 
					<integro:empty-if-null value="<%=form.getObkDirecRltv() %>"></integro:empty-if-null></td>
                    <td class="fieldname">Is the partner/ guarantor / of the borrowing  firm a relative of the Chairman / Managing Director or other directors of HDFC  Bank or other Banks</td>
                    <td>
                      <html:radio property="isPartnerDirecRltv" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isPartnerDirecRltv" value="No"   disabled="true" /> No 
					 <integro:empty-if-null value="<%=form.getPartnerDirecRltv() %>"></integro:empty-if-null></td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Is the &ldquo;substantial&rdquo; shareholder / director /  guarantor of the borrowing company a relative of the Chairman / Managing  directors or other directors of HDFC Bank or other Banks</td>
                    <td>
                      <html:radio property="isSubstantialRltvHdfcOther" value="Yes"   disabled="true" /> Yes 
								<html:radio property="isSubstantialRltvHdfcOther" value="No"   disabled="true" /> No 
								 <integro:empty-if-null value="<%=form.getSubstantialRltvHdfcOther() %>"></integro:empty-if-null></td>
                    <td class="fieldname">Director</td>
                    <td><integro:empty-if-null value="<%=form.getDirectorName() %>"></integro:empty-if-null></td>
                  </tr>
                </tbody>
              </table>
              <table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
						style="margin-top: 0" width="100%" align="center">
						<thead>
							<tr>
								<td>S/N</td>
								<td>Facility For</td>
								<td>Facility Name</td>
								<td>Facility Amount</td>
							</tr>
						</thead>
						<tbody>
						<logic:present name="facList">
													<logic:iterate id="ob" name="facList"
														type="com.integrosys.cms.app.customer.bus.OBCriFac"
														scope="page">
											<%
												String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getFacilityFor()%>" />&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getFacilityName()%>&nbsp;</center>
												</td>
												<td>
												<!--  <center><%=ob.getFacilityAmount() %>&nbsp;</center>-->
												<center><integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),ob.getFacilityAmount())%>"/>&nbsp;</center>
												</td>
											</tr>
										</logic:iterate>
													<%
														if (no == 0) {
													%>
													<tr class="odd">
														<td colspan="10">
															<bean:message key="label.global.not.found" />
														</td>
													</tr>
													<%	} %>
								</logic:present>
									
						</tbody>
					</table>
			</td>
		</tr>
		</tbody>
	</table>
			</td>
			
			<html:hidden name="ManualInputCustomerInfoForm" property="pName"  />

	<html:hidden name="ManualInputCustomerInfoForm" property="cityName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="stateName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="regionName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="criCountryName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="cityRegName"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="stateRegName" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regionRegName" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="countryRegName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegionName" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="relManagerName" />
			
			<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />	
		</tr>
</table>
	

<!-- InstanceEnd -->

