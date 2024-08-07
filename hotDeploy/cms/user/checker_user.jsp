<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.trx.ICommonUserTrxValue,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.Locale,
                 java.util.HashMap"%>
<%
	boolean isLoginSingleSignOn = PropertyManager.getBoolean("integrosys.login.single.signon.enabled", false);

    String event = request.getParameter("event");
    DefaultLogger.debug("checker_user.jsp","event from getParameter is > "+event);

    List teamTypeMembershipLst = (List) session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.TeamTypeMembershipLst");
    OBSystemBankBranch branchObj = (OBSystemBankBranch)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchObj");
    List cityList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.cityList");
    List stateList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.stateList");
    List countryList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.countryList");
    List regionList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.regionList");
    List branchList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchList");
    List userRegionList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.userRegionList");
    if(cityList !=null){
    	 pageContext.setAttribute("cityList",cityList);
    }
    if(stateList !=null){
    	pageContext.setAttribute("stateList",stateList);
    }
    if(countryList!=null ){
    	   pageContext.setAttribute("countryList",countryList);
    }
    if(regionList!=null){
    	  pageContext.setAttribute("regionList",regionList);
    }
    if(branchList!=null){
    	pageContext.setAttribute("branchList",branchList);
    }
    if(userRegionList!=null){
    	 pageContext.setAttribute("userRegionList",userRegionList);
    }
   
    DefaultLogger.debug("checker_user.jsp","after list ");

  
    
   
    
    String approveEvent=null;
    String rejectEvent=null;
    String cancelEvent=null;
    String headingLable="Maintain User";
    boolean highlightStatusNotRequired=true;
    if(event.equals("checker_add_read")||event.equals("checker_add_read_error")||event.equals("checker_approve_add")||event.equals("checker_reject_add")){
        approveEvent="checker_approve_add";
        rejectEvent="checker_reject_add";
    }else if(event.equals("checker_edit_read")||event.equals("checker_approve_edit")||event.equals("checker_reject_edit")){
        approveEvent="checker_approve_edit";
        rejectEvent="checker_reject_edit";
        highlightStatusNotRequired=false;
    }else if(event.equals("checker_delete_read")||event.equals("checker_reject_delete")){
        approveEvent="checker_approve_delete";
        rejectEvent="checker_reject_delete";
    }
    OBUserTrxValue userTrxVal = (OBUserTrxValue)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.CommonUserTrxValue");
    String teamName = "";
    ICommonUser user = userTrxVal.getUser();
    try{
        //CMSTeamProxy proxy = new CMSTeamProxy();
        //teamName = proxy.getTeamByUserID(user.getUserID()).getDescription();

        ITeam[] teams =  new CMSTeamProxy().getTeamsByUserID(user.getUserID());
        
        teamName = "";
        if ( (teams != null) && (teams.length >0) )
        {
	        for(int iLoop = 0; iLoop<teams.length; iLoop++) 
	        {
/*
	        	if (teams[iLoop].getDescription()!= null)
	        		teamName += "; "  + teams[iLoop].getDescription();
*/
                if (teams[iLoop].getAbbreviation()!= null)
	        		teamName += "; "  + teams[iLoop].getAbbreviation();

	        }
	        
	        if (teamName.length()>1)
	        	teamName = teamName.substring(2);
        }
   
    }catch(Exception e){
        DefaultLogger.debug("maker_add_edit_user.jsp","...........Exception while getting teamName");
    }
    ICommonUser stageUser = userTrxVal.getStagingUser();
    boolean isTerminatedChecked=false;
    isTerminatedChecked=stageUser.getStatus().equals(ICMSConstant.STATUS_TERMINATE);
    boolean isChecked=false;
    isChecked=stageUser.getStatus().equals(UserConstant.STATUS_INACTIVE)
            //GCMS
            || stageUser.getStatus().equals(UserConstant.STATUS_NEW)
            || stageUser.getStatus().equals(UserConstant.STATUS_DORMANT)
            || stageUser.getStatus().equals(UserConstant.STATUS_EXPIRED);
    boolean isCheckedL=false;
    isCheckedL=stageUser.getStatus().equals(UserConstant.STATUS_LOCKED);
    
    boolean isCheckedU=false;
    String isUnlock = (String) request.getAttribute("isUnlock");
    System.out.println("<<<<<<<<<<<isUnlock>>>>>>>>>"+isUnlock);
    isCheckedU="Y".equals(isUnlock);
    System.out.println("<<<<<<<<<<<isCheckedU>>>>>>>>>"+isCheckedU);
    List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
    List ctryVals = (List)CountryList.getInstance().getCountryValues();

    HashMap disableReason = new HashMap();
    disableReason.put(UserConstant.STATUS_NEW, "New");
    disableReason.put(UserConstant.STATUS_ACTIVE, "-");
    disableReason.put(UserConstant.STATUS_LOCKED, "Locked");
    disableReason.put(UserConstant.STATUS_EXPIRED, "Expired");
    disableReason.put(UserConstant.STATUS_DORMANT, "Dormant");
    disableReason.put(UserConstant.STATUS_INACTIVE, "Disabled");
    disableReason.put(UserConstant.STATUS_DELETED, "-");
    Locale locale = request.getLocale();
    String strValidFromDate = "";
    String strValidToDate = "";
    if (stageUser != null){
        if (stageUser.getValidFromDate() != null)
            strValidFromDate = DateUtil.formatDate(locale, stageUser.getValidFromDate());
        if (stageUser.getValidToDate() != null)
            strValidToDate = DateUtil.formatDate(locale, stageUser.getValidToDate());
    }
    DefaultLogger.debug("maker_view_delete_user.jsp","user is "+stageUser.getUserName());
%>



<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.component.bizstructure.app.bus.ITeamTypeMembership"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUserSegment"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUserRegion"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
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

function approvePage() {
	if('Y'=='<%=isUnlock%>')
    	document.forms[0].action="user.do?event=<%=approveEvent%>&isUnlock=Y";
    else
    	document.forms[0].action="user.do?event=<%=approveEvent%>";	
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="user.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='user.do?'>
<body>
<!-- InstanceBeginEditable name="Content" -->
<%@ include file="/common/mandatory_for_submission_note.jsp" %>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><%=headingLable%></h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class='fieldname' width="20%">User ID&nbsp;</td>
              <td width="30%"><%=stageUser.getLoginID()%>&nbsp;<br/><html:errors property="loginIDDuplicateError" /></td>
              <td class='fieldname' width="20%">Telephone No</td>

              <td width="30%"><%=stageUser.getPhoneNumber()!=null?stageUser.getPhoneNumber():""%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class='fieldname'>User Name&nbsp;</td>
              <td><integro:empty-if-null value="<%=stageUser.getUserName()%>"/>&nbsp;</td>
              <td class='fieldname'>Email</td>
              <td><%=stageUser.getEmail()!=null?stageUser.getEmail():""%>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class='fieldname'>Employee Code&nbsp;</font></td>
              <td><%=stageUser.getEmployeeID()!=null?stageUser.getEmployeeID():""%>&nbsp;</td>
             <!--  <td class="fieldname">Team Name</td>
              <td><%if (teamName!=null && !("".equals(teamName)) ) {%><%=teamName%>
				<%}else{%><bean:message key='error.los.team.not.assigned'/><%}%>&nbsp;</td> -->
				<td class="fieldname"></td>
              <td>&nbsp;</td>
            </tr>
                      <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea property="address" disabled="true"  />&nbsp;</br> <html:errors property="systemBankBranchAddressError"/></td>
              <td class="fieldname" width="20%">Country </td>
											<td class="even" width="20%">
											<%=branchObj.getCountry().getCountryName() %>
											<br/><html:errors property="countryOBIdError"/></td>
           	</tr>
           									
           	<tr class="odd">
           	
           									<td class="fieldname" width="20%">Region  </td>
											<td class="even" width="20%">
											<%=branchObj.getRegion().getRegionName()%>
											<br/><html:errors property="regionOBIdError"/></td>
											
												<td class="fieldname" width="20%">State  </td>
											<td class="even" width="20%">
											<%=branchObj.getState().getStateName() %>
											<br/><html:errors property="stateOBIdError"/></td>
			</tr>

            <tr class="even">
										<td class="fieldname">City  </td>
              							<td><%=branchObj.getCityTown().getCityName()%>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>

				  <td class="fieldname">System Branch </td>
                  <td><%=branchObj.getSystemBankBranchName() %>-<%=branchObj.getSystemBankBranchCode() %>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>
             </tr>
<!--            <tr class="even">-->
<!---->
<!--                <td class='<%=CompareOBUtil.compOB(stageUser,user,"validFromDate")?"fieldname":"fieldnamediff"%>'>Validity Period From <br/><br/>Validity Period To</td>-->
<!--                <td>-->
<!--                <integro:empty-if-null value="<%=strValidFromDate%>"/>&nbsp;  <br/>-->
<!--                <integro:empty-if-null value="<%=strValidToDate%>"/>&nbsp;-->
<!--                </td>-->
<!--                -->
<!--              <td class='<%=CompareOBUtil.compOB(stageUser,user,"country")?"fieldname":"fieldnamediff"%>'>Base Country ISO Code&nbsp;<span class="mandatory">* </span></td>-->
<!--              <% for(int i=0; i<ctryLbls.size();i++){
                   if(ctryVals.get(i).equals(stageUser.getCountry())){
              %>-->
<!--              <td><%=ctryLbls.get(i)%>&nbsp;</td>-->
<!--              <%}}%>-->
<!--			  <%--<td colspan="2">&nbsp;</td>--%>-->
<!--            </tr>-->
			<% if (!isLoginSingleSignOn) { %>
            <tr class="odd">
              <td class='<%=(highlightStatusNotRequired || CompareOBUtil.compOB(stageUser,user,"status"))?"fieldname":"fieldnamediff"%>'>User Status</td>
              <td> 
              <%if(!isCheckedU) {%>
              	<input type="radio" name="radiobutton" value="radiobutton" disabled checked/> Enable 
              	<input name="radiobutton" type="radio" value="radiobutton"  <%=isChecked?"checked":""%> disabled/> Disable
              	<input name="radiobutton" type="radio" value="radiobutton"  <%=isTerminatedChecked?"checked":""%> disabled/> Terminated
              	<input name="radiobuttonLU" type="radio" value="radiobutton"  <%=isCheckedL?"checked":""%> disabled/> Locked
              	<input name="radiobuttonLU" type="radio" value="radiobutton" disabled <%=isCheckedU?"checked":""%> /> Unlocked
              <%}else{ %>	
              	<input type="radio" name="radiobutton" value="radiobutton" disabled checked/> Enable 
              	<input name="radiobutton" type="radio" value="radiobutton" disabled <%=isChecked?"checked":""%>/> Disable
              	<input name="radiobutton" type="radio" value="radiobutton" disabled <%=isTerminatedChecked?"checked":""%>/> Terminated
              	<input name="radiobuttonLU" type="radio" value="radiobutton" disabled <%=isCheckedL?"checked":""%>/> Locked
              	<input name="radiobuttonLU" type="radio" value="radiobutton" disabled <%=isCheckedU?"checked":""%> /> Unlocked
              <%} %>
              </td>
             <td class='<%=(highlightStatusNotRequired || CompareOBUtil.compOB(stageUser,user,"status"))?"fieldname":"fieldnamediff"%>'>Disablement Reason</td>
             <td><integro:empty-if-null value="<%=stageUser.getPosition() %>"/> &nbsp;</td>
            </tr>
			<% } %>
			<tr class="odd">
              <td class="fieldname">User Role</td>
              <td><select id ="teamTypeMembership" disabled="disabled">
								 <%				
								 	//for(int i=0;i<teamTypeMembershipLst.size();i++){
								 		for (Iterator iterator = teamTypeMembershipLst.iterator(); iterator.hasNext();) {
											ITeamTypeMembership teamTypeMembership = (ITeamTypeMembership) iterator.next();
								if(stageUser!=null){
											if(stageUser.getTeamTypeMembership().getMembershipID()==teamTypeMembership.getMembershipID()){
								%>
								<option value='<%=teamTypeMembership.getMembershipID()%>' selected="selected"><%= teamTypeMembership.getMembershipName() %> </option>
								<%} }%>
								<option value='<%=teamTypeMembership.getMembershipID()%>'><%= teamTypeMembership.getMembershipName() %> </option>
								<% } %>  
               			
								</select>	</td>
				<td class="fieldname">Department</td>
				<td>
                                    	<integro:common-code-single entryCode="<%=stageUser.getDepartment() %>" display="true"
                                    		categoryCode="<%=CategoryCodeConstant.HDFC_DEPARTMENT%>" descWithCode="false"  />
                                   
												<br/><html:errors property="departmentError"/></td>&nbsp;</td>					
            </tr>
            
            <tr class="even">
              <td class="fieldname">Override Exception for LOA</td>
              <td>
            	 <html:checkbox property="overrideExceptionForLoa" value="Y" disabled="true"/>
              </td>
			  <td class="fieldname">Employee Grade</td>
			  <td>
               	<integro:common-code-single entryCode="<%=stageUser.getEmployeeGrade()%>" display="true"
               		categoryCode="<%=CategoryCodeConstant.EMPLOYEE_GRADE%>" descWithCode="false"  />
                                   
			  </td>	
            </tr>
            
<!--          <tr class="even">-->
<!--          			<td width="20%" class="fieldname">Segment </td>-->
<!--         			 <td  class="odd"> -->
         			  <%
         			 ICommonUserSegment[] userSegment= stageUser.getUserSegment();
         			  if(userSegment!=null){
         			  for(int i =0; i< userSegment.length ;i++){
         				
         			    	%>
<!--         			    	<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=userSegment[i].getSegmentCode()%>" display="true" descWithCode="true"/>-->
<!--	        											<br>-->
         			    	
         			    	<%
										}
         			  }
										 %>            
         			 &nbsp;
<!--         			 </td>-->
<!--         			 <td class="fieldname"> Region </td>-->
<!--				<td> -->
				<%
         			 ICommonUserRegion[] userRegion= stageUser.getUserRegion();
				if(userRegion!=null){
         			  for(int i =0; i< userRegion.length ;i++){
         				
         				 for (int j=0;j< userRegionList.size();j++){
         			    	LabelValueBean bean= (LabelValueBean)userRegionList.get(j);
         			    	if(bean.getValue().trim().equalsIgnoreCase(userRegion[i].getRegionCode())){
         			    	
         			    	%>
<!--         			    	<%=bean.getLabel() %>-->
<!--	        											<br>-->
         			    	
         			    	<%
         			    	}
							}
         			  }
				}
										 %>   
<!--										   &nbsp;</td>		-->
<!--            </tr>-->
          </tbody>
        </table> </td>
  </tr>

  <tr>
 <td align="center"><b><html:errors property="updateError" /></b></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td class="fieldname">Remarks</td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea>
                                  </br><html:errors property="remarksError"/>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even"><%=userTrxVal.getUserInfo()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><%=userTrxVal.getRemarks()!=null?userTrxVal.getRemarks():""%>&nbsp;</td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>


  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
