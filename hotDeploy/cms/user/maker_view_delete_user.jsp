<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%
	boolean isLoginSingleSignOn = PropertyManager.getBoolean("integrosys.login.single.signon.enabled", false);

		List teamTypeMembershipLst = (List) session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.TeamTypeMembershipLst");
		OBSystemBankBranch branchObj = (OBSystemBankBranch)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchObj");
		List cityList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.cityList");
		List stateList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.stateList");
		List countryList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.countryList");
		List regionList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.regionList");
		List branchList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchList");
		List userRegionList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.userRegionList");
		pageContext.setAttribute("countryList",countryList);
		pageContext.setAttribute("regionList",regionList);
		pageContext.setAttribute("stateList",stateList);
		pageContext.setAttribute("cityList",cityList);
		pageContext.setAttribute("branchList",branchList);
    String event = request.getParameter("event");
    String teamName = null;
    DefaultLogger.debug("maker_view_delete_user.jsp","event from getParameter is > "+event);
    boolean isView=false;        //default to delete
    String actionEvent="maker_delete_user";
    String cancelEvent="user.do?event=maker_list_user";//list page
    String headingLable="Delete User";
    if(event.equals("maker_view_user")){
        isView=true;
        actionEvent="";//not integrated with view..
        cancelEvent="user.do?event=maker_list_user";//return when its view to list page..
        headingLable="View User";
    }
    ICommonUser user=null;
    OBUserTrxValue userTrxVal = (OBUserTrxValue)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.CommonUserTrxValue");
    if(event.equals("maker_view_user")||event.equals("maker_delete_user_read")){
        user = userTrxVal.getUser();
    }
    DefaultLogger.debug("maker_view_delete_user.jsp","...........<><><*><*><");
    ///// Logic when control is from rejected events............................................
    boolean isRemarksNedded=false;
    boolean isRejected = false;
    boolean isCncl=false;
    boolean isToTrack=false;
    boolean isRejectSubmit = false;
    if(event.equals("rejected_delete_read")){
        user=userTrxVal.getStagingUser();
        isRejected = true;
        isRejectSubmit = true;
        cancelEvent="ToDo.do";
        String from = request.getParameter("from");
        if(request.getParameter("Cncl")!=null){
            isRejectSubmit = false;
            isCncl=true;
            if("add".equals(from)){
                headingLable="Close - Create User";
                actionEvent="maker_cncl_reject_add";
            }else if("edit".equals(from)){
                headingLable="Close - Edit User";
                actionEvent="maker_cncl_reject_edit";
            }else if("del".equals(from)){
                headingLable="Close - Delete User";
                actionEvent="maker_cncl_reject_delete";
            }
        }
        if(request.getParameter("toTrack")!=null){
            isView=true;
            isRejected = false;
            isToTrack=true;
            cancelEvent="ToDo.do?event=totrack";
            headingLable="View User";
            /*
            headingLable="User";
            headingLable= "";
            String prevState=userTrxVal.getFromState();
            String status = userTrxVal.getStatus();
            String op = userTrxVal.getOpDesc();
            System.out.println("PrevState/Status: "+prevState+"/"+status+"/"+op);
            if(prevState.equals(ICMSConstant.STATE_ND)||prevState.equals(ICMSConstant.STATE_PENDING_CREATE)
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_CREATE))
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && op.equals("MAKER_CANCEL_CREATE"))){
                headingLable="Add User";
            }else if(prevState.equals(ICMSConstant.STATE_PENDING_UPDATE)|| status.equals(ICMSConstant.STATE_PENDING_UPDATE)
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_UPDATE))
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && op.equals("MAKER_CANCEL_UPDATE"))){
                headingLable="Edit User";
            }else if(prevState.equals(ICMSConstant.STATE_PENDING_DELETE)|| status.equals(ICMSConstant.STATE_PENDING_DELETE)
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_DELETE))
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && op.equals("MAKER_CANCEL_DELETE"))){
                headingLable="Delete User";
            }
            */
            isCncl=true;

        }
        if(!isCncl){
            isRemarksNedded=true;
            actionEvent="maker_edit_reject_delete";
            headingLable="Re Edit - Delete User";//todo confirm the label...
        }
    }
    //common for view-delete and reject operations...
    try{
        
        ITeam[] teams =  new CMSTeamProxy().getTeamsByUserID(user.getUserID());
        
        teamName = "";
        if ( (teams != null) && (teams.length >0) )
        {
	        for(int iLoop = 0; iLoop<teams.length; iLoop++) 
	        {
/*             Changed because Description is not mandatory
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
        DefaultLogger.debug("maker_view_delete_user.jsp","...........Exception while getting teamName");
    }
    boolean isTerminatedChecked=false;
    isTerminatedChecked=user.getStatus().equals(ICMSConstant.STATUS_TERMINATE);
    boolean isChecked=false;
    isChecked=user.getStatus().equals(UserConstant.STATUS_INACTIVE)
            || user.getStatus().equals(UserConstant.STATUS_NEW)
            || user.getStatus().equals(UserConstant.STATUS_DORMANT)
            || user.getStatus().equals("NR")
            || user.getStatus().equals(UserConstant.STATUS_EXPIRED);
    boolean isCheckedL=false;
    isCheckedL=user.getStatus().equals(UserConstant.STATUS_LOCKED);        
	
    boolean isCheckedU=false;
    String isUnlock = (String) request.getAttribute("isUnlock");
    System.out.println("<<<<<<<<<<<isUnlock>>>>>>>>>"+isUnlock);
    isCheckedU="Y".equals(isUnlock);
    System.out.println("<<<<<<<<<<<isCheckedU>>>>>>>>>"+isCheckedU);
	
    Locale locale = request.getLocale();
    HashMap disableReason = new HashMap();
    disableReason.put(UserConstant.STATUS_NEW, "New");
    disableReason.put(UserConstant.STATUS_ACTIVE, "-");
    disableReason.put(UserConstant.STATUS_LOCKED, "Locked");
    disableReason.put(UserConstant.STATUS_EXPIRED, "Expired");
    disableReason.put(UserConstant.STATUS_DORMANT, "Dormant");
    disableReason.put("NR", "Dormant");
    disableReason.put(UserConstant.STATUS_INACTIVE, "-");
    disableReason.put(UserConstant.STATUS_DELETED, "-");
    String strValidFromDate = "";
    String strValidToDate = "";
    if (user != null){
        if (user.getValidFromDate() != null)
            strValidFromDate = DateUtil.formatDate(locale, user.getValidFromDate());
        if (user.getValidToDate() != null)
            strValidToDate = DateUtil.formatDate(locale, user.getValidToDate());
    }

    DefaultLogger.debug("maker_view_delete_user.jsp","user is "+user.getUserName());
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
function submitPage() {
    document.forms[0].action="user.do?event=<%=actionEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="<%=cancelEvent%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='user.do?'>
<body>
<!-- InstanceBeginEditable name="Content" -->
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
              <td class="fieldname" width="20%">User ID</td>
              <td width="30%"><%=user.getLoginID()%>&nbsp;</td>
              <td class="fieldname" width="20%">Telephone No</td>
              <td width="30%"><%=user.getPhoneNumber()!=null?user.getPhoneNumber():""%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">User Name</td>
              <td><%=user.getUserName()%>&nbsp;</td>
              <td class="fieldname">Email</td>
              <td><%=user.getEmail()!=null?user.getEmail():""%>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Employee Code</td>
              <td><%=user.getEmployeeID()!=null?user.getEmployeeID():""%>&nbsp;</td>
              <!-- <td class="fieldname">Team Name</td>
                <td><%if (teamName!=null && !("".equals(teamName)) ) {%><%=teamName%>
				<%}else{%><bean:message key='error.los.team.not.assigned'/><%}%>&nbsp;</td> -->
				<td class="fieldname">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
                        
             <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea property="address" disabled="true"  />&nbsp;</br> <html:errors property="systemBankBranchAddressError"/></td>
                <td class="fieldname">System Branch </td>
                  <td><%=branchObj.getSystemBankBranchName() %>-<%=branchObj.getSystemBankBranchCode() %>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>
             
             </tr>
           									
           	<tr class="odd">
           	  <td class="fieldname" width="20%">Country </td>
											<td class="even" width="20%">
											<%=branchObj.getCountry().getCountryName() %>
											<br/><html:errors property="countryOBIdError"/></td>
           	
           									<td class="fieldname" width="20%">Region  </td>
											<td class="even" width="20%">
											<%=branchObj.getRegion().getRegionName()%>
											<br/><html:errors property="regionOBIdError"/></td>
											
			</tr>

            <tr class="even">
												<td class="fieldname" width="20%">State  </td>
											<td class="even" width="20%">
											<%=branchObj.getState().getStateName() %>
											<br/><html:errors property="stateOBIdError"/></td>
			
										<td class="fieldname">City  </td>
              							<td><%=branchObj.getCityTown().getCityName()%>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>

				 </tr>
			<% if (!isLoginSingleSignOn) { %>
            <tr class="odd">
              <td class="fieldname">User Status</td>
              <td> 
              	<%if(!isCheckedU) {%>
              	<input type="radio" name="radiobutton" value="radiobutton" disabled checked/> Enable  
              	<input name="radiobutton" type="radio" value="radiobutton"  <%=isChecked?"checked":""%> disabled/> Disable 
              	<input name="radiobutton" type="radio" value="radiobutton"  <%=isTerminatedChecked?"checked":""%> disabled/> Terminated </br>
              	<input  type="radio" value="radiobutton"  <%=isCheckedL?"checked":""%> disabled/>Locked 
              	<input  type="radio" disabled value="radiobutton" <%=isCheckedU?"checked":""%> /> Unlocked 
              <%}else{ %>	
              	<input type="radio" name="radiobutton" value="radiobutton" disabled checked/> Enable 
              	<input name="radiobutton" type="radio" value="radiobutton" disabled <%=isChecked?"checked":""%>/> Disable 
              	<input name="radiobutton" type="radio" value="radiobutton" disabled <%=isTerminatedChecked?"checked":""%>/> Terminated &nbsp;
              	<input  type="radio" value="radiobutton" disabled/>Locked 
              	<input  type="radio" disabled value="radiobutton" <%=isCheckedU?"checked":""%> /> Unlocked 
              <%} %>
              </td>
                
                <td class="fieldname">Disablement Reason</td>
                <td>
                <%if(user.getStatus().equals(UserConstant.STATUS_LOCKED)){ %>
                <integro:empty-if-null value="<%=disableReason.get(user.getStatus())%>"/>
                <%}else{ %>
                <integro:empty-if-null value="<%=user.getPosition() %>"/> 
                <%} %>
                
                 &nbsp;</td>
            </tr>
			<% } %>
			<tr class="even">
              <td class="fieldname">User Role</td>
              <td><select id ="teamTypeMembership" disabled="disabled">
								 <%				
								 //System.out.println("team membership id:::::::::::::::"+user);
								 	//for(int i=0;i<teamTypeMembershipLst.size();i++){
								 		for (Iterator iterator = teamTypeMembershipLst.iterator(); iterator.hasNext();) {
											ITeamTypeMembership teamTypeMembership = (ITeamTypeMembership) iterator.next();
								if(user!=null){
											if(user.getTeamTypeMembership().getMembershipID()==teamTypeMembership.getMembershipID()){
								%>
								<option value='<%=teamTypeMembership.getMembershipID()%>' selected="selected"><%= teamTypeMembership.getMembershipName() %> </option>
								<%} }%>
								<option value='<%=teamTypeMembership.getMembershipID()%>'><%= teamTypeMembership.getMembershipName() %> </option>
								<% } %>  
               			
								</select>	</td>
				<td class="fieldname">Department</td>
				<td>
                                    	<integro:common-code-single entryCode="<%=user.getDepartment() %>" display="true"
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
               	<integro:common-code-single entryCode="<%=user.getEmployeeGrade()%>" display="true"
               		categoryCode="<%=CategoryCodeConstant.EMPLOYEE_GRADE%>" descWithCode="false"  />
                                   
			  </td>	
            </tr>
            
<!--            <tr class="odd">-->
<!--          			<td width="20%" class="fieldname">Segment </td>-->
<!--         			 <td  class="odd"> -->
         			  <%
         			 ICommonUserSegment[] userSegment= user.getUserSegment();
         			 if(userSegment!=null){
         			  for(int i =0; i< userSegment.length ;i++){
         				
         				 //System.out.println(userSegment[i].getSegmentCode());
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
         			 ICommonUserRegion[] userRegion= user.getUserRegion();
				if(userRegion!=null){
         			  for(int i =0; i< userRegion.length ;i++){
         				
         				 //System.out.println(userRegion[i].getRegionCode());
         				 for (int j=0;j< userRegionList.size();j++){
         			    	LabelValueBean bean= (LabelValueBean)userRegionList.get(j);
         			    	//System.out.println(bean);
         			    	if(bean.getValue().trim().equalsIgnoreCase(userRegion[i].getRegionCode())){
         			    		//System.out.println(bean.getValue());
         			    	
         			    	%>
<!--         			    	<%=bean.getLabel() %>-->
<!--	        											<br>-->
         			    	
         			    	<%
         			    	}
							}
         			  }
				}
										 %>   
<!--										   &nbsp;</td>	-->
<!--            </tr>-->
          </tbody>
        </table> </td>
  </tr>          
  <%if(isRemarksNedded || isRejected){%>
  <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                              <%if(!isRejected||isRejectSubmit){%>
                                <tr>
                                  <td class="fieldname">Remarks</td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                                </tr>
                                <%}%>
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
<%}%>

  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
  <% if(!isView && !isRejected){%>
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
  <%}else if(isRejected && !isRejectSubmit){%>
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
  <%}else if(isRejected && isRejectSubmit){%>
    <td> <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
  <%}else if(isToTrack) {%>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
  <%}else {%>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /></a></td>
  <%}%>
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
