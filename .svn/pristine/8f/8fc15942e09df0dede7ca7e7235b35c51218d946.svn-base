<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.ui.common.AgreementTypeList,
                 com.integrosys.cms.app.limit.trx.*,
                 com.integrosys.cms.ui.manualinput.aa.*,
                 com.integrosys.cms.app.limit.bus.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: $
     *
     * Describe this JSP.
     * Purpose: For Checker approve or reject the AA Information that being submit by Maker
     * Description: approve or reject  AA Information by Checker
     *
     * @author $Author: jerlin $<br>
     * @version $Revision:$
     * @since $Date: $
     * Tag: $Name:  $
     */
 %>
<%
  ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
  long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
  long teamTypeID = userTeam.getTeamType().getTeamTypeID();
  boolean isMr = false;
  
  if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
    oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
    isMr = true;
  }    

  String trxID = request.getParameter("TrxId");
  String indexChenge = request.getParameter("indexChange");
  String mainEventIdentifier="";
  String event = request.getParameter("event");
  if(event.equals("remove_agreement")){
    event = request.getParameter("preEvent");
  }
  if(event.equals("checker_return_Other_Covenant_List_to_AA") || event.equals("checker_edit_aadetail"))
  {  
	mainEventIdentifier = "checker_edit_aadetail";
  System.out.println("mainEventIdentifier----------------->>"+mainEventIdentifier);
  }
  
  OBLimitProfileTrxValue obTrxValue = null;
  Object trxObjFromSession = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.limitProfileTrxVal");
  DefaultLogger.debug(this,">>>Debug:::003 ");
  ILimitProfile  parametersArray = null ;
  ILimitProfile  stagingParametersArray = null ;
  DefaultLogger.debug(this,">>>Debug:::004 ");

  if( trxObjFromSession ==null ) {
    out.println("Expected session parameter 'OBLimitProfileTrxValue' is missing.");
    return;
  }
  
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
  
  String regionName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.regionName");
  
  String branchName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.branchName");
  
  Collection riskGradeList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.riskGradeList");
	request.setAttribute("riskGradeList", riskGradeList);
	List creditAprrovalList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.creditAprrovalList");
	pageContext.setAttribute("creditAprrovalList",creditAprrovalList);	
  DefaultLogger.debug(this,">>>Debug:::005 ");
  obTrxValue = (OBLimitProfileTrxValue)trxObjFromSession;

  parametersArray = obTrxValue.getLimitProfile();

  stagingParametersArray = obTrxValue.getStagingLimitProfile();
  
  DefaultLogger.debug(this,">>>Debug:::006 ");

  boolean changed = false;
%>


<script type="text/javascript" src="js/udf.js"></script>
<script language="JavaScript" type="text/JavaScript">    
<!--
function approvePage() {
  document.forms[0].action = "MIAADetail.do?event=checker_approve_edit_aadetail";
  document.forms[0].submit();
}

function rejectPage() {
  document.forms[0].action = "MIAADetail.do?event=checker_reject_edit_aadetail";
  document.forms[0].submit();
}

function viewAgreement() {
  document.forms[0].action = "TradingAgreement.do?event=checker_view_agreement&preEvent=checker_edit_aadetail&indexChange=0&TrxId=<%=trxID%>";
  document.forms[0].submit();
}

function showDetail() {
	document.forms[0].action = "MIAADetail.do?event=check_list_other_covenants&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
}

//-->
</script>
<html:form  action="MIAADetail.do">

<bean:define id="formObj" name="AADetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.aa.AADetailForm"/>

  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
      <tr>
        <td align="right">&nbsp;</td>
      </tr>
      <tr>
        <td align="right"><font color="#FF0000">*</font>Mandatory for Submission</td>
      </tr>
    </tbody>
  </table>

  <%@ include file="/manualinput/aa/view_customer_party_info.jsp"%>

	<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<tr align="left">
<td width="25%" colspan="1"><input onclick="javascript : showDetail()"
							name="AddNew12" type="button" id="AddNew12" value="Other Covenant"
							class="btnNormal" />  
						</td></tr><tr>
						<tr>
						<td>
						<% if(event.equals("check_list_other_covenants")){%>		
						    <jsp:include page="checker_list_other_covenants.jsp"></jsp:include>
						<%}%>
					</td></tr>
</table>

  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td><h3>CAM Details</h3></td>
      </tr>
      <tr>
        <td colspan="2"><hr/></td>
      </tr>
    </thead>
    		<%
              int rowIdx = 0;
            %>
    <tbody>
      <tr>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <tbody>
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
               <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"camType")? "fieldname":"fieldnamediff"%>" width="20%">CAM Type&nbsp;<font color="#FF0000">* </font></td>             	
                <td width="30%"><bean:write name="AADetailForm" property="camType"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"bCAReference")? "fieldname":"fieldnamediff"%>" width="20%">CAM No.<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="aaNum"/>&nbsp;</td>
              </tr>    

              <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"approvalDate")? "fieldname":"fieldnamediff"%>" width="20%">CAM Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="aaApprovalDate"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"camLoginDate")? "fieldname":"fieldnamediff"%>" width="20%">CAM Login Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="camLoginDate"/>&nbsp;</td>
              </tr>
<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"ramRating")? "fieldname":"fieldnamediff"%>" width="20%">RAM Rating<font color="#FF0000">*</font></td>
                <%String strGrade = stagingParametersArray.getRamRating(); %>
                <td width="30%"><html:select property="ramRating"	value="<%=strGrade %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="riskGradeList" labelProperty ="label" property ="value"/>
							</html:select></td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"ramRatingYear")? "fieldname":"fieldnamediff"%>">RAM Rating Year<font color="#FF0000">*</font></td>
                 <%String strYear = stagingParametersArray.getRamRatingYear(); 
                 %>
                <td width="30%"><%=strYear %></td>
              </tr>    
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"ramRatingType")? "fieldname":"fieldnamediff"%>" width="20%">Rating Type<font color="#FF0000">*</font></td>
                 <%String strType = stagingParametersArray.getRamRatingType();
                 %>
               <%if(strType!=null && !strType.equals("")){ %>
            <td colspan="1"><integro:common-code-single entryCode="<%=strType%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.CommonCode_SEC_RATING_TYPE%>" descWithCode="false" /></td>
            <%}else{ %>
             <td>-</td>
            <%} %>
            
           <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"ramRatingFinalizationDate")? "fieldname":"fieldnamediff"%>" width="20%">RAM Rating Finalization Date<font color="#FF0000">*</font></td>
           <td width="30%"><bean:write name="AADetailForm" property="ramRatingFinalizationDate"/>&nbsp;</td>
            
		</tr>
		
<!--End by Pramod Katkar-->
              <tr class="even">
                <td class="fieldname">Expiry Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="annualReviewDate"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"extendedNextReviewDate")? "fieldname":"fieldnamediff"%>" width="20%">Extension Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="extendedNextReviewDate"/>&nbsp;</td>
              </tr>
              
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"noOfTimesExtended")? "fieldname":"fieldnamediff"%>" width="20%">Number of times extended</td>
                <td width="30%"><bean:write name="AADetailForm" property="noOfTimesExtended"/>&nbsp;</td>
                <td class="fieldname" width="20%">Total CAM Sanctioned Amount (INR)</td>
                <td width="30%"><bean:write name="AADetailForm" property="totalSactionedAmount"/>&nbsp;</td>
              </tr>    

              <tr class="even">
                <td class="fieldname" width="20%">Relationship Manager</td>
               	<td width="30%"><integro:empty-if-null value="<%= relationShipMgrName %>"/></td>
                <td class="fieldname" width="20%">Controlling Branch</td>
                <td width="30%"><integro:empty-if-null value="<%= branchName %>"/>
				<html:hidden property="controllingBranch" value="<%= branchName %>"/>&nbsp;</td>
              </tr>
                            <tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"fullyCashCollateral")? "fieldname":"fieldnamediff"%>" width="20%">Fully Cash Collateral<font color="#FF0000">*</font></td>
                <%if(stagingParametersArray.getFullyCashCollateral() != null && stagingParametersArray.getFullyCashCollateral().equals("Y")) { %>
                <td class="odd"><input type="checkbox" name="fullyCashCollateral" checked="checked" disabled="disabled"/></td>
                <%}else{ %>
                <td class="odd"><input type="checkbox" name="fullyCashCollateral" value="" disabled="disabled"/></td>
                <%} %>
							<td class="fieldname" width="20%">Total Release Amount Facility Level(INR)</td>
							<td width="30%">
									<bean:write name="AADetailForm" property="totalSanctionedAmountFacLevel"/>
							</td>
			</tr>
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"committeApproval")? "fieldname":"fieldnamediff"%>" width="20%">Committee Approval<font color="#FF0000">*</font></td>
                <%if(stagingParametersArray.getCommitteApproval().equals("Y")) { %>
                <td class="odd"><input type="checkbox" name="committeApproval" checked="checked" disabled="disabled"/></td>
                <%}else{ %>
                <td class="odd"><input type="checkbox" name="committeApproval" value="" disabled="disabled"/></td>
                <%} %>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"boardApproval")? "fieldname":"fieldnamediff"%>" width="20%">Board Approval<font color="#FF0000">*</font></td>
                <%if(stagingParametersArray.getBoardApproval().equals("Y")) { %>
                <td class="odd"><input type="checkbox" name="boardApproval" checked="checked" disabled="disabled"/></td>
                <%}else{ %>
                <td class="odd"><input type="checkbox" name="boardApproval" value="" disabled="disabled"/></td>
                <%} %>
              </tr>    
              
               <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"approverEmployeeName1")? "fieldname":"fieldnamediff"%>" width="20%">Credit Approvers 1</td>
                <td width="30%">
                <%String strCreditApproval1 = stagingParametersArray.getApproverEmployeeName1(); %>
                <html:select property="creditApproval1"	value="<%=strCreditApproval1 %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select>&nbsp;</td>
				 <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"approverEmployeeName4")? "fieldname":"fieldnamediff"%>" width="20%">Credit Approvers 4</td>
                <%String strCreditApproval4 = stagingParametersArray.getApproverEmployeeName4(); %>
                <td width="30%"><html:select property="creditApproval4"	value="<%=strCreditApproval4 %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select>&nbsp;</td>			
							
                
              </tr>
              
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"approverEmployeeName2")? "fieldname":"fieldnamediff"%>" width="20%">Credit Approvers 2</td>
                <%String strCreditApproval2 = stagingParametersArray.getApproverEmployeeName2(); %>
                <td width="30%"><html:select property="creditApproval2"	value="<%=strCreditApproval2 %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select>&nbsp;</td>
                
              
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"approverEmployeeName5")? "fieldname":"fieldnamediff"%>" width="20%">Credit Approvers 5 </td>
                <%String strCreditApproval5 = stagingParametersArray.getApproverEmployeeName5(); %>
                <td width="30%"><html:select property="creditApproval5"	value="<%=strCreditApproval5 %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select>&nbsp;</td>
              </tr>    
              
               <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"approverEmployeeName3")? "fieldname":"fieldnamediff"%>" width="20%">Credit Approvers 3</td>
                 <%String strCreditApproval3 = stagingParametersArray.getApproverEmployeeName3(); %>
                <td width="30%" colspan="3"><html:select property="creditApproval3"	value="<%=strCreditApproval3 %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select>&nbsp;</td>
            
              </tr>
              
               <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"rbiAssetClassification")? "fieldname":"fieldnamediff"%>" width="20%">RBI Asset  Classification<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="rbiAssetClassification"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"assetClassification")? "fieldname":"fieldnamediff"%>" width="20%">Asset Classification<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="assetClassification"/>&nbsp;</td>
               
              </tr>
              
              <!--  Start:Uma Khot:CRI Field addition enhancement  -->
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Whether Special Approval Grid Requirement Applicable For Customer Rated Below HDB8</td>
                <td>
					<%if(formObj.getIsSpecialApprGridForCustBelowHDB8() != null && formObj.getIsSpecialApprGridForCustBelowHDB8().equals("Yes")){ %>
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsSpecialApprGridForCustBelowHDB8() == null || formObj.getIsSpecialApprGridForCustBelowHDB8().equals("No")){ %>
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
				<td class="fieldname" width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr> 
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%" rowspan="2">Non Cooperative Borrowers</td>
                <td rowspan="2">
					<%if(formObj.getIsNonCooperativeBorrowers() != null && formObj.getIsNonCooperativeBorrowers().equals("Yes")){ %>
					<input type="radio" name="isNonCooperativeBorrowers" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isNonCooperativeBorrowers" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsNonCooperativeBorrowers() == null || formObj.getIsNonCooperativeBorrowers().equals("No")){ %>
					<input type="radio" name="isNonCooperativeBorrowers" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isNonCooperativeBorrowers" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
				<td class="fieldname" width="20%">1) Is any Director (other than Nominee Director) declared As Non Cooperative for any other company</td>
				<td>
					<%if(formObj.getIsDirectorAsNonCooperativeForOther() != null && formObj.getIsDirectorAsNonCooperativeForOther().equals("Yes")){ %>
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsDirectorAsNonCooperativeForOther() == null || formObj.getIsDirectorAsNonCooperativeForOther().equals("No")){ %>
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
				</tr>
                <tr class="even">
               <!-- <td class="fieldname" width="20%">&nbsp;</td><td >&nbsp;</td>-->
                <td class="fieldname" width="20%">2) Name of Directors and Company</td>
                <td><html:textarea name="AADetailForm" rows="4" cols="55" property="nameOfDirectorsAndCompany" readonly="TRUE"/>
				</td>
              </tr> 
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Within Single Borrower Prudential Ceiling</td>
                <td>
					<%if(formObj.getIsSingleBorrowerPrudCeiling() == null || formObj.getIsSingleBorrowerPrudCeiling().equals("Yes")){ %>
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsSingleBorrowerPrudCeiling() != null && formObj.getIsSingleBorrowerPrudCeiling().equals("No")){ %>
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
                <td class="fieldname" width="20%">Provide details of RBI/Board approval Obtained/ or in the course of being obtained</td>
                
                 <td width="30%"><html:select property="rbiApprovalForSingle" style="width:225"
												styleId="rbiApprovalForSingle" disabled="true" value="<%=formObj.getRbiApprovalForSingle()%>">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL %>" descWithCode="false" />
									</html:select>
                <br><br>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForSingle" readonly="TRUE"/>&nbsp;
                </td>
              </tr> 
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Within Group Borrower Prudential Ceiling</td>
                <td>
					<%if(formObj.getIsGroupBorrowerPrudCeiling() == null || formObj.getIsGroupBorrowerPrudCeiling().equals("Yes")){ %>
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsGroupBorrowerPrudCeiling() != null && formObj.getIsGroupBorrowerPrudCeiling().equals("No")){ %>
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
                <td class="fieldname" width="20%">Provide details of RBI/Board approval Obtained/ or in the course of being obtained</td>
                
                 <td width="30%"><html:select property="rbiApprovalForGroup" style="width:225"
												styleId="rbiApprovalForGroup" disabled="true" value="<%=formObj.getRbiApprovalForGroup()%>">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL %>" descWithCode="false" />
							</html:select>
                <br><br>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForGroup" readonly="TRUE" />&nbsp;
                </td>
              </tr> 
  			 <!--  End:Uma Khot:CRI Field addition enhancement  -->
              <tr>
              <td colspan="4">
               <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                <tr class="odd">
                    <td class="fieldname">Remarks</td>
                    <td><html:textarea name="AADetailForm" rows="5" cols="80" property="docRemarks" readonly="true" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="remarks" /></td>
                </tr>
                </tbody>
            </table>
            </td>
            </tr>
            
            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
		  <td colspan="4"><udf:udfDisplay module="cam" action="view"/></td>
	 </tr>
	  <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </tbody>
  </table>

  <% 
    if(isMr){
  %>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td><h3>Trading Agreement Details</h3></td>
      </tr>
      <tr>
        <td colspan="2"><hr/></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
              <tr class="tblInfo">
                <td class="fieldname" width="3%">S/N</td>
                <td class="fieldname" width="37%">Agreement Type</td>
                <td class="fieldname" width="20%">Minimum Transfer Amount</td>
                <td class="fieldname" width="15%">Base Currency</td>
                <td class="fieldname" width="20%">Counterparty Threshold Amount</td>
                <td class="fieldname" width="5%">Action</td>
              </tr>
            </thead>
            <tbody>

            <%
               String classtype = "odd";
               ITradingAgreement[] stagingAgreementParameters = new ITradingAgreement[1];
               if(stagingParametersArray.getTradingAgreement() != null){
                 stagingAgreementParameters[0] = stagingParametersArray.getTradingAgreement();
               }else{
                 stagingAgreementParameters[0] = new OBTradingAgreement();
               }
               ITradingAgreement[] agreementParameters = new ITradingAgreement[1];
               if(parametersArray != null){
                 agreementParameters[0] = parametersArray.getTradingAgreement();
               }else{
                 agreementParameters[0] = new OBTradingAgreement();
               }

               List res = null;
               ArrayList list = null;
               res = CompareOBUtil.compOBArray(stagingAgreementParameters,agreementParameters);
               list = new ArrayList(res);
               pageContext.setAttribute("agreementList",list);

               if (list == null || list.size() == 0) {%>
              <tr class="odd">
                <td colspan="6">There is no Trading Agreement information.</td>
              </tr>
            <% } else { int counter = 0; %>
              <logic:present name="agreementList" >
                <logic:iterate id="compResult" name="agreementList" type="com.integrosys.base.techinfra.diff.CompareResult"  >
                  <%ITradingAgreement agreementParameter = (ITradingAgreement) compResult.getObj();
                    classtype = "odd";
                  %>
                  <tr class="<%=classtype%>">
                    <td class="<bean:write name="compResult" property="key" />"><%=counter + 1%>&nbsp;</font></td>
                    <td>
                    <%String agreementType = null;
                      if(! ( agreementParameter.getAgreementType().equals(null) || agreementParameter.getAgreementType().equals("") ) ){
                        agreementType = AgreementTypeList.getInstance().getAgreementTypeName(agreementParameter.getAgreementType());
                      }%>
                      <integro:empty-if-null value="<%=agreementType%>"/>&nbsp;</td> 
                    <td><integro:amount param="all" amount="<%=agreementParameter.getMinTransferAmount()%>" decimal="4"/>&nbsp;</td>
                    <td><integro:empty-if-null value="<%=agreementParameter.getBaseCurrency()%>"/>&nbsp;</td>
                    <td><integro:amount param="all" amount="<%=agreementParameter.getCounterPartyThresholdAmount()%>" decimal="4"/>&nbsp;</td>
                    <td><a href="javascript:viewAgreement(<%=String.valueOf(counter)%>)">View</a></td>
                  </tr>    
                  <%if (classtype.equals("odd")) { 
                      classtype = "even";
                    } else {
                      classtype = "odd";
                    }
                    counter++;
                  %>
                </logic:iterate>
              </logic:present>
              <%}%>
            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>

    </tbody>
  </table>
  <%
    }
  %>

  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
      <tr>
        <td>
          <%
          String paramUID = obTrxValue.getUserInfo();
          String paramRemarks = obTrxValue.getRemarks();
          if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
            paramRemarks=" ";
          }%>
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
              <tr>
                <td width="43%" class="fieldname">Remarks</td>
                <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea>
                </br> <html:errors property="remarksError" />
                </td>
              </tr>
              <tr>
                <td class="fieldname">Last Action By</td>
                <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
              </tr>
              <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>

      <tr>
        <td>&nbsp;</td>
      </tr>
  <tr>
        <td> <jsp:include page="cam_images_list.jsp"></jsp:include></td>
      </tr>
    </tbody>
  </table>
<html:hidden property="camType"/>
<html:hidden property="aaNum"/>
<html:hidden property="aaApprovalDate"/>
<html:hidden property="camLoginDate"/>
<html:hidden property="annualReviewDate"/>
<html:hidden property="extendedNextReviewDate"/>
<html:hidden property="noOfTimesExtended"/>
<html:hidden property="totalSactionedAmount"/>
<html:hidden property="assetClassification"/>
<html:hidden property="rbiAssetClassification"/>
<jsp:include page="udf_cam_hidden.jsp"></jsp:include>
  <table width="30%" border="0" align="center" cellpadding="0" cellspacing="0">
  &nbsp;&nbsp;&nbsp;
    <tr>
      <td align="right"><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
      <td align="center"><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
      <td align="left"><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    </tr>
    
  </table>

</html:form>