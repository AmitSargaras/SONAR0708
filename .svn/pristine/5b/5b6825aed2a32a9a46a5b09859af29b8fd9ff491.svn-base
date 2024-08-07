<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.user.MaintainUserForm,
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
                 java.util.HashMap,
                 java.util.Arrays,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.Locale,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.user.MakerAddUserCmd,
                 java.util.Iterator,
                 com.integrosys.component.bizstructure.app.bus.ITeamTypeMembership,"%>
                 
<%
	String context = request.getContextPath() + "/";
%>                 
<%
	boolean isLoginSingleSignOn = PropertyManager.getBoolean("integrosys.login.single.signon.enabled", false);

String[] segmentArray=null;
String[] regionArray=null; 
    MaintainUserForm form = (MaintainUserForm)request.getAttribute("MaintainUserForm");
    if(form.getAppendSegmentList()!=null &&!form.getAppendSegmentList().equals("")){
         segmentArray =  MaintainUserMapper.commaSeparatedStringToStringArray(form.getAppendSegmentList());
        }
    if(form.getAppendUserRegionList()!=null &&!form.getAppendUserRegionList().equals("")){
         regionArray =  MaintainUserMapper.commaSeparatedStringToStringArray(form.getAppendUserRegionList());
        }
   
    //Added by archana start 
    List teamTypeMembershipLst = (List) session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.TeamTypeMembershipLst");
    
    List cityList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.cityList");
	List stateList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.stateList");
	List countryList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.countryList");
	List regionList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.regionList");
	List userRegionList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.userRegionList");
	List departmentList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.departmentList");
	//System.out.println("user region list "+departmentList);
	List branchList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchList");
	pageContext.setAttribute("countryList",countryList);
	pageContext.setAttribute("regionList",regionList);
	pageContext.setAttribute("userRegionList",userRegionList);
	pageContext.setAttribute("stateList",stateList);
	pageContext.setAttribute("cityList",cityList);
	pageContext.setAttribute("branchList",branchList);
	pageContext.setAttribute("departmentList",departmentList);
  //Added by archana End
    
    String event = request.getParameter("event");
    String error_EmpId = (String)request.getAttribute("Error_EmpId");
    DefaultLogger.debug("maker_add_user.jsp","event from getParameter is > "+event);
    OBSystemBankBranch branchObj= new OBSystemBankBranch();
    if(event.equals("maker_edit_user_read")||event.equals("rejected_edit_read")){
     
         branchObj = (OBSystemBankBranch)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchObj");
    }
    
    
    
    String teamName=null;
    long userID=0;
    boolean isAdd=false;
    boolean isCreation = false;
    boolean isEdit=false;
    boolean isError=false;  //if validation error...
   
    boolean isRemarksNedded=false; //remarks needed when maker redo the checker rejected page..
    String actionEvent=null;
    String cancelEvent=null;
    String remarks = null;
    String headingLable="";
    String rejectCncl = request.getParameter("Cncl");
    if(event.equals("maker_prepare_add_user")||event.equals("rejected_add_read")){
        //todo prepare with empty fields..
        isAdd = true;
        if(event.equals("maker_prepare_add_user")){
            actionEvent="maker_add_user";
            cancelEvent="user.do?event=maker_list_user&startIndex=0&name=";
            headingLable="Add New User";
        }else{
            if(rejectCncl!=null && rejectCncl.equals("cncl")){
                actionEvent="maker_cncl_reject_add";
            }else{
                actionEvent="maker_edit_reject_add";
            }
            headingLable="Re Process - Create User";
            isRemarksNedded=true;
            isAdd=false;
            isCreation=true;    //specifically for event "rejected_add_read" 'cos cannot reuse isAdd - R1.5 (Internal Test Cycle 7) Jira CMS-3588
        }
    }else if(event.equals("maker_add_user")||event.equals("maker_edit_reject_add")){
        //todo get add page vals from form..
        isError=true;
        isAdd = true;
        if(event.equals("maker_add_user")){
            actionEvent="maker_add_user";
            cancelEvent="user.do?event=maker_list_user&startIndex=0&name=";
            headingLable="Add New User";
        }else{
            actionEvent="maker_edit_reject_add";
            isRemarksNedded=true;
            headingLable="Re Process - Create User";
        }
    }else if(event.equals("maker_edit_user_read")||event.equals("rejected_edit_read")){
        //todo get edit page vals from ob..
         branchObj = (OBSystemBankBranch)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchObj");
        System.out.println(":::::::::::::::::branch object:::::::::::::::::"+branchObj );
        isEdit=true;
        if(event.equals("maker_edit_user_read")){
            actionEvent="maker_edit_user";
            cancelEvent="user.do?event=maker_list_user&startIndex=0&name=";
            headingLable="Edit User";
        }else{
            if(rejectCncl!=null && rejectCncl.equals("cncl")){
                actionEvent="maker_cncl_reject_edit";
            }else{
                actionEvent="maker_edit_reject_edit";
            }
            headingLable="Re Process - Edit User";
            isRemarksNedded=true;
        }
    }else if(event.equals("maker_edit_user")||event.equals("maker_edit_reject_edit")){
        //todo get edit page vals from form..
          branchObj = (OBSystemBankBranch)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchObj");
        isError=true;
        isEdit=true;
        if(event.equals("maker_edit_user")){
            actionEvent="maker_edit_user";
            cancelEvent="user.do?event=maker_list_user&startIndex=0&name=";
            headingLable="Edit User";
        }else{
            actionEvent="maker_edit_reject_edit";
            isRemarksNedded=true;
            headingLable="Re Process - Edit User";
        }

    }
    ICommonUser user = null;
    OBUserTrxValue userTrxVal = (OBUserTrxValue)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.CommonUserTrxValue");
    if(isEdit ||event.equals("rejected_add_read")||event.equals("rejected_edit_read")
            || event.equals("maker_edit_reject_add")||event.equals("maker_edit_reject_edit")){
        if(event.equals("rejected_add_read")||event.equals("rejected_edit_read")
                || event.equals("maker_edit_reject_add")||event.equals("maker_edit_reject_edit")){
            user = userTrxVal.getStagingUser();
            cancelEvent="ToDo.do";

            // Get UserID to show Team name
            if (userTrxVal != null && userTrxVal.getUser() != null ){
                userID = userTrxVal.getUser().getUserID();
            }

        }else{
            user = userTrxVal.getUser();
            if (user != null)
                userID = user.getUserID();

        }
        if(!isError){
            remarks=userTrxVal.getRemarks();
        }
        if (userID > 0){
            try{
                //CMSTeamProxy proxy = new CMSTeamProxy();
                //teamName = proxy.getTeamByUserID(user.getUserID()).getDescription();

                ITeam[] teams =  new CMSTeamProxy().getTeamsByUserID(userID);

                teamName = "";
                if ( (teams != null) && (teams.length >0) )
                {
        	        for(int iLoop = 0; iLoop<teams.length; iLoop++)
        	        {
/*                   Changed because Description is not mandatory
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
                e.printStackTrace();
            }
        }
    }
    
    /*List ctryLbls;
	List ctryVals;
	ICommonUser currentUser = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	if(MaintainTeamUtil.isSuperUser(currentUser.getLoginID())){
	    ctryVals = (List)CountryList.getInstance().getCountryValues();
		ctryLbls = (List)CountryList.getInstance().getCountryLabels();
	}else{
		ITeam currentUserTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
		ctryVals = Arrays.asList(currentUserTeam.getCountryCodes());
		ctryLbls = MaintainTeamUtil.getCountryNameList(currentUserTeam.getCountryCodes());
	}*/
    
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
	

    //DefaultLogger.debug("maker_add_user.jsp","PropertyManager.getBoolean(CREATE_ACTIVE_USER = " + PropertyManager.getBoolean(MakerAddUserCmd.CREATE_ACTIVE_USER));
    boolean isBlCreateActiveUser =  false;
    if (PropertyManager.getBoolean(MakerAddUserCmd.CREATE_ACTIVE_USER, true)){
        isBlCreateActiveUser = true;
      //  DefaultLogger.debug (this, "isCreateActiveUser Yes");
    }
    boolean isNotDisable=false;
    
    
    if(isError){
    	
    			isNotDisable= form.getStatus().equals(UserConstant.STATUS_INACTIVE)
    	        || form.getStatus().equals(UserConstant.STATUS_NEW)
    	        || form.getStatus().equals(UserConstant.STATUS_DORMANT)
    	         || form.getStatus().equals("NR")
    	        || form.getStatus().equals(UserConstant.STATUS_LOCKED)
    	        || form.getStatus().equals(UserConstant.STATUS_EXPIRED)
    			|| form.getStatus().equals("T");
    			
    }else{
    if(user!=null)
	if(user.getStatus()!=null){
		isNotDisable= user.getStatus().equals(UserConstant.STATUS_INACTIVE)
        || user.getStatus().equals(UserConstant.STATUS_NEW)
        || user.getStatus().equals(UserConstant.STATUS_DORMANT)
         || user.getStatus().equals("NR")
        || user.getStatus().equals(UserConstant.STATUS_LOCKED)
        || user.getStatus().equals(UserConstant.STATUS_EXPIRED)
		|| user.getStatus().equals("T");
		
		
	}
    }
		
	DefaultLogger.debug("maker_add_user.jsp","event from getParameter:::::::::::::::::::::::::::::::::: is > "+event);
    //DefaultLogger.debug("maker_add_user.jsp","isBlCreateActiveUser = " + isBlCreateActiveUser);
    //DefaultLogger.debug("maker_add_user.jsp","user = " + user);
    
      String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMembershipID = Long.parseLong(teamTypeMemID);   
    boolean isHandoverEditAccess = (teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SYS_HANDOVER_MAKER); 
    
    String isUnlock = (String) request.getAttribute("isUnlock");
     
%>




<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.Set"%>
<%@page import="com.integrosys.cms.app.rbicategory.bus.OBIndustryCodeCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUserSegment"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUserRegion"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.user.MaintainUserMapper"%>
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="js/ajaxListCity.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
var isUnlock="";
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
	//selectLists();
	//Added by archana start
	document.getElementById('teamTypeMembershipId').value=document.getElementById('teamTypeMembership').value;
	//Added by archana end
	if (document.forms[0].radiobutton != null){
    if (document.forms[0].radiobutton.checked)
        document.forms[0].status.value='<%=UserConstant.STATUS_ACTIVE%>';
    else
        document.forms[0].status.value='<%=UserConstant.STATUS_INACTIVE%>';
	}
	var radios = document.forms[0].status;
	for (var i=0, iLen=radios.length; i<iLen; i++) {
	  if(radios[i].checked){
		  radios[i].disabled=false;
	  }
	} 
	if(("maker_edit_reject_edit"=='<%=actionEvent%>' && "Y"=='<%=isUnlock%>')||
			("maker_edit_user"=='<%=actionEvent%>' && "Y"=='<%=isUnlock%>')){

		isUnlock="Y";
	} 
   if('maker_edit_user'=='<%=actionEvent%>' || "maker_edit_reject_edit"=='<%=actionEvent%>') {
	   if(isUnlock=="Y") {
       		document.forms[0].action="user.do?event=<%=actionEvent%>&isUnlock=Y";
	   }
	   else {
		  if("O"==document.getElementById('statusLU').value)
			  document.getElementById('status').value="O";
    		
    	  document.forms[0].action="user.do?event=<%=actionEvent%>";	
      }
   }else
	   document.forms[0].action="user.do?event=<%=actionEvent%>";	
   
   document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="<%=cancelEvent%>";
    document.forms[0].submit();
}


function refreshRegionId(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }

 var dep = 'region';
 var url = '/cms/user.do?event=refresh_region_id&countryId='+curSel;
 
 sendLoadDropdownReq(dep, url);
}

function refreshStateId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'state';
 var url = '/cms/user.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}	
function refreshCityId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'cityTown';
 var url = '/cms/user.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}	
function selectLists(){
    ListSegment = document.forms[0].segment;
    
    AppendedSegment = document.forms[0].appendSegmentList;
    for (i=0;i<ListSegment.length;i++){
    	ListSegment.options[i].selected = true;
    	if(AppendedSegment.value.search(ListSegment.options[i].value)==-1)
    	{
        AppendedSegment.value = ListSegment.options[i].value + "-" + AppendedSegment.value;
    	}
       // alert(AppendedSegment.value);
    }

    List = document.forms[0].userRegion;
    AppendedUserRegion = document.forms[0].appendUserRegionList;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
        if(AppendedUserRegion.value.search(List.options[i].value)==-1)
    	{
        AppendedUserRegion.value = List.options[i].value + "-" + AppendedUserRegion.value;
    	}
        //alert(AppendedUserRegion.value);
    }
    
}

function populateEmpID(value){
	
	document.getElementById("empId").value=value;
	document.forms[0].empId.value=value;
}
function showReason()   {
 	document.getElementById("disable").className = "visibleDiv";
}
function unLocked()   {
	isUnlock="Y";
 	document.getElementById("disable").className = "hiddenDiv";
}
function hideReason()   {
document.getElementById("disable").className = "hiddenDiv";
}
function refreshBranchDetail(dropdown) {
    var curSel = "";
    for(i=0; i < dropdown.options.length; i++)   {
        if (dropdown.options[i].selected == true) {
            curSel = dropdown.options[i].value;
        }
    }  
    var dep = 'cityTown';
    var url = '/cms/user.do?event=refresh_branch_detail&branchCode='+curSel;
   
    sendLoadListReqLocation(dep, url);
    }

function setTeamTypeMemberShip(dropdown) {
	 var curSel = "";
	    for(i=0; i < dropdown.options.length; i++)   {
	        if (dropdown.options[i].selected == true) {
	            curSel = dropdown.options[i].value;
	        }
	    }  
    document.forms[0].teamName.value=curSel;
    }
//-->
</script>
<style type="text/css"><!--

.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}
-->
</style>
<script type="text/javascript" src="js/itgDualList.js"></script>
<!-- InstanceEndEditable -->
</head>

<html:form action='user.do?' focus="loginId">
<p class="required"><span class="mandatory">*</span> Mandatory for Submission&nbsp;</p><br>
<body>

<html:hidden property="appendSegmentList"/>
<html:hidden property="appendUserRegionList"/>
<html:hidden property="countryCode" value="IN"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
            <% if(isAdd||event.equals("rejected_add_read")||event.equals("maker_edit_reject_add")){%>
              <td class="fieldname">User ID&nbsp;<font color="red">*</font></td>
              <td><input type="text" name="loginId" id="loginId" style="text-transform: uppercase" tabindex="1" value="<%=(!isError && !isAdd)?user.getLoginID().trim():form.getLoginId().trim()%>"  onblur="populateEmpID(this.value)" maxlength="30"/>
              <html:errors property="loginIdError" /></br> <html:errors property="loginIDDuplicateError" /></td>
            <%}else{%>
              <td class="fieldname">User ID&nbsp;<font color="red">*</font></td>
              <td width="30%"> <%=user.getLoginID()%></br><html:errors property="loginIDDuplicateError" /></td>
              <input type="hidden" name="loginId" id="loginId" value="<%=user.getLoginID()%>">
             <%}%>
             
             <%if(isHandoverEditAccess) {%>
             
                    <td class="fieldname">Telephone No</td>
              <td>
              <integro:empty-if-null value="<%=form.getContactNo()%>"/>
              &nbsp;
               </td>
            </tr>
            <tr class="even">
              <td class="fieldname">User Name&nbsp;<font color="red">*</font></td>
              <td><integro:empty-if-null value="<%=form.getName()%>"  />
               </td>
              <td class="fieldname">Email</td>
              
              <td><integro:empty-if-null value="<%=form.getEmail()%>" />&nbsp;
               </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Employee Code&nbsp;<font color="red">*</font></td>
              <td><integro:empty-if-null value="<%=form.getEmpId()%>" />
              </td>
                      
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
          
           
            </tr>
            
             
            <%}else{ %>
            
            
            
             
              <td class="fieldname">Telephone No</td>
              <td><input type="text" name="contactNo" id="contactNo"  maxlength="15" value="<%=(!isError && !isAdd)?(user.getPhoneNumber()!=null?user.getPhoneNumber():""):form.getContactNo()%>" />&nbsp;
              <html:errors property="contactNoError" /> </td>
            </tr>
            <tr class="even">
              <td class="fieldname">User Name&nbsp;<font color="red">*</font></td>
              <td><input type="text" name="name" id="name" tabindex="2" value="<%=(!isError && !isAdd)?user.getUserName().trim():form.getName().trim()%>" maxlength="50" />
              <html:errors property="nameError" /> </td>
              <td class="fieldname">Email</td>
              
              <td><input type="text" maxlength="50" name="email" id="email" value="<%=(!isError && !isAdd)?(user.getEmail()!=null?user.getEmail().trim():""):form.getEmail()%>" />&nbsp;
              <html:errors property="emailError" /> </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Employee Code&nbsp;<font color="red">*</font></td>
              <td><input id="empId" type="text" name="empId" style="text-transform: uppercase" value="<%=(!isError && !isAdd)?(user.getEmployeeID()!=null?user.getEmployeeID():""):form.getEmpId()%>" readonly="readonly"/>
              <html:errors property="empIdError" />
              </td>
                      
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
          
           
            </tr>
      
            <%} %>
            <% 
            if(isEdit ){
            	if(isHandoverEditAccess){
            %>
              <tr class="even">
              <td class="fieldname">Address </td>
              <td><integro:empty-if-null value="<%=form.getAddress() %>" />&nbsp;</td>
				 <td class="fieldname">Branch Code<font color="red">*</font></td>
                  <td><html:select property="branchCode"  tabindex="3" disabled="true">
										
											<html:options collection="branchList" labelProperty="label" property="value" />
											</html:select>&nbsp;</td>            
              
           	</tr>
           									
           <tr class="even">
           		<td class="fieldname" width="20%">Country 
								<!--              <font color="red">*</font>-->
             										 </td>
											<td class="even" width="20%">
											<%if(branchObj!=null){ %>
											<html:text property="country" styleId="country" disabled="true" value="<%=branchObj.getCountry().getCountryName() %>" />
											<%}else{ %>
											-
											<%} %>
											<br/><html:errors property="countryOBIdError"/></td>
           	
           									<td class="fieldname" width="20%">Region 
<!--           									<font color="red">*</font>-->
           									 </td>
											<td class="even" width="20%">
											<%if(branchObj!=null){ %>
											<html:text property="region" styleId="region" disabled="true"  value="<%=branchObj.getRegion().getRegionName() %>"	/>
											<%}else{ %>
											-
											<%} %>
											<br/><html:errors property="regionOBIdError"/></td>
											
												
			</tr>

            <tr class="even">
            
            <td class="fieldname" width="20%">State 
<!--												<font color="red">*</font>-->
												
												
												 </td>
											<td class="even" width="20%">
											<%if(branchObj!=null){ %>
											<html:text property="state" styleId="state" disabled="true" value="<%=branchObj.getState().getStateName() %>"  />
											<%}else{ %>
											-
											<%} %>
											<br/><html:errors property="stateOBIdError"/></td>
										<td class="fieldname">City 
<!--										<font color="red">*</font>-->
										
										
										 </td>
										 
              							<td>
              							<%if(branchObj!=null){ %>
              							<html:text property="cityTown" styleId="cityTown" disabled="true" value="<%=branchObj.getCityTown().getCityName() %>"  />
              							
              							
              							<%}else{ %>
											-
											<%} %>
											&nbsp;</br>  <html:errors property="cityOBIdError"/></td>
									
				  
             </tr>
            <%}else{ %>
             <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea property="address"  />&nbsp;</br> <html:errors property="addressError"/></td>
              <td class="fieldname">Branch Code<font color="red">*</font></td>
                  <td><html:select property="branchCode" styleId="branchCode" tabindex="3" onchange="javascript:refreshBranchDetail(this)">
											<option value="">Please Select</option>
											<html:options collection="branchList" labelProperty="label" property="value" />
											</html:select>&nbsp;</br>  <html:errors property="branchError"/></td>
           	</tr>
           									
           	<tr class="even">
           		<td class="fieldname" width="20%">Country 
								<!--              <font color="red">*</font>-->
             										 </td>
											<td class="even" width="20%">
											<%if(branchObj!=null){ %>
											<html:text property="country" styleId="country" disabled="true" value="<%=branchObj.getCountry().getCountryName() %>" />
											<%}else{ %>
											-
											<%} %>
											<br/><html:errors property="countryOBIdError"/></td>
           	
           									<td class="fieldname" width="20%">Region 
<!--           									<font color="red">*</font>-->
           									 </td>
											<td class="even" width="20%">
											<%if(branchObj!=null){ %>
											<html:text property="region" styleId="region" disabled="true"  value="<%=branchObj.getRegion().getRegionName() %>"	/>
											<%}else{ %>
											-
											<%} %>
											<br/><html:errors property="regionOBIdError"/></td>
											
												
			</tr>

            <tr class="even">
            
            <td class="fieldname" width="20%">State 
<!--												<font color="red">*</font>-->
												
												
												 </td>
											<td class="even" width="20%">
											<%if(branchObj!=null){ %>
											<html:text property="state" styleId="state" disabled="true" value="<%=branchObj.getState().getStateName() %>"  />
											<%}else{ %>
											-
											<%} %>
											<br/><html:errors property="stateOBIdError"/></td>
										<td class="fieldname">City 
<!--										<font color="red">*</font>-->
										
										
										 </td>
										 
              							<td>
              							<%if(branchObj!=null){ %>
              							<html:text property="cityTown" styleId="cityTown" disabled="true" value="<%=branchObj.getCityTown().getCityName() %>"  />
              							
              							<%}else{ %>
											-
											<%} %>
											&nbsp;</br>  <html:errors property="cityOBIdError"/></td>
									
				  
             </tr><%}} else{ %>
             
              <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea property="address" styleId="address" />&nbsp;</br>  <html:errors property="addressError"/></td>
				 <td class="fieldname">Branch Code<font color="red">*</font></td>
                  <td><html:select property="branchCode" styleId="branchCode" onchange="javascript:refreshBranchDetail(this)" tabindex="3">
											<option value="">Please Select</option>
											<html:options collection="branchList" labelProperty="label" property="value" />
											</html:select>&nbsp;</br>  <html:errors property="branchError"/></td>            
              
           	</tr>
           									
           	<tr class="even">
           	<td class="fieldname" width="20%">Country 
<!--              <font color="red">*</font>-->
              </td>
											<td class="even" width="20%">
											<html:text property="country" styleId="country" readonly="true"  />
											
											<br/><html:errors property="countryOBIdError"/></td>
           	
           									<td class="fieldname" width="20%">Region 
<!--           									<font color="red">*</font>-->
           									 </td>
											<td class="even" width="20%">
											<html:text property="region" styleId="region" readonly="true" 	/>
											
											<br/><html:errors property="regionOBIdError"/></td>
											
												
			</tr>

            <tr class="even">
            <td class="fieldname" width="20%">State 
<!--												<font color="red">*</font>-->
												
												
												 </td>
											<td class="even" width="20%">
											<html:text property="state" styleId="state" readonly="true"  />
											
											<br/><html:errors property="stateOBIdError"/></td>
										<td class="fieldname">City 
<!--										<font color="red">*</font>-->
										
										
										 </td>
              							<td><html:text property="cityTown" styleId="cityTown" readonly="true"  />
											&nbsp;</br>  <html:errors property="cityOBIdError"/></td>

				 
             </tr>
             <%} %>
<!--            <tr class="even">-->
<!---->
<!--              <td class="fieldname">Validity Period From <br/><br/>Validity Period To</td>-->
<!--              <td>-->
<!--                  <input type="text" name="validFromDate" readonly="true" size="12" maxlength="11" value="<%=(!isError && !isAdd)?strValidFromDate:form.getValidFromDate()%>" />-->
<!--                  &nbsp;<img src="img/calendara.gif"  name="Image11" border="0" id="Image11" onclick="return showCalendar('validFromDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />-->
<!--                  <html:errors property="validFromDateError" /><br/>-->
<!--                  <input type="text" name="validToDate" readonly="true" size="12" maxlength="11" value="<%=(!isError && !isAdd)?strValidToDate:form.getValidToDate()%>" />-->
<!--                  &nbsp;<img src="img/calendara.gif"  name="Image12" border="0" id="Image12" onclick="return showCalendar('validToDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />-->
<!--                  <html:errors property="validToDateError" /><br/>-->
<!--              </td>-->
<!-- 			-->
<!--              <td class="fieldname">Base Country ISO Code&nbsp;<span class="mandatory">*</span></td>-->
<!--              <td><select name="countryCode">-->
<!--                <option value="" selected>Please Select</option>-->
<!--                <%-->
<!--                    for(int i=0; i<ctryLbls.size();i++){-->
<!--                        if(!isError && !isAdd){-->
<!--                        %>-->
<!--                         <option value="<%=ctryVals.get(i)%>" <%=user.getCountry().equals(ctryVals.get(i))?"selected":""%>><%=ctryLbls.get(i)%></option>-->
<!--                        <%-->
<!--                        }else{-->
<!--                            %>-->
<!--                        <option value="<%=ctryVals.get(i)%>" <%=form.getCountryCode().equals(ctryVals.get(i))?"selected":""%>><%=ctryLbls.get(i)%></option>-->
<!--                        <%-->
<!--                        }}-->
<!--                        %>-->
<!--                    </select><br/>-->
<!--              <html:errors property="countryCodeError" /> </td>-->
<!--              <%--<td colspan="2">&nbsp;</td>--%>-->
<!--            </tr>-->


			<% if (!isLoginSingleSignOn) { %>
            <tr class="odd">
	                <% if(isAdd||event.equals("rejected_add_read")||event.equals("maker_edit_reject_add")){%>
	                  <td class="fieldname">User Status</td>
	                  <td>
                          <% if (isBlCreateActiveUser) {%>
                          <input type="radio" id="radiobutton" name="radiobutton" value="<%=UserConstant.STATUS_ACTIVE%>"  checked />
	                    Enable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          
	                    </td>
                        <input type="hidden" name="status" id="status" value="<%=UserConstant.STATUS_ACTIVE%>">
                        
                        <%}else{%>
                        <input type="radio" name="radiobutton" id="radiobutton" value="<%=UserConstant.STATUS_ACTIVE%>" disabled />
                      Enable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="radiobutton" id="radiobutton" value="<%=UserConstant.STATUS_INACTIVE%>" checked disabled/>
                      Disable &nbsp;</td>
                        <html:hidden property="status" styleId="status" value="<%=UserConstant.STATUS_INACTIVE%>"/>
                        <%}%>
						<%DefaultLogger.debug("maker_add_user.jsp","Inside if condition ");%>

					<%}else{
	                    boolean isChecked=false;
	                    boolean isCheckedT=false;
	                    boolean isCheckedL=false;
	                    
	                    boolean isCheckedU=false;
	                    System.out.println("<<<<<<<<<<<isUnlock>>>>>>>>>"+isUnlock);
	                    isCheckedU="Y".equals(isUnlock);
	                    System.out.println("<<<<<<<<<<<isCheckedU>>>>>>>>>"+isCheckedU);
	                    
	                    if(isError){
	                        isChecked=(form.getStatus().equals(UserConstant.STATUS_INACTIVE)
                                    || form.getStatus().equals(UserConstant.STATUS_NEW)
                                    || form.getStatus().equals(UserConstant.STATUS_DORMANT)
                                    || form.getStatus().equals("NR")
                                    || form.getStatus().equals(UserConstant.STATUS_EXPIRED)
                                    );
	                        
	                   
		                    		if(form.getStatus().equals("T")){
		                    			isCheckedT=true;
		                    		}
		                    		
		                    		if(form.getStatus().equals("O")){
		                    			isCheckedL=true;
		                    		}
		                    
                        }else{
	                        isChecked= (user.getStatus().equals(UserConstant.STATUS_INACTIVE)
                                    || user.getStatus().equals(UserConstant.STATUS_NEW)
                                    || user.getStatus().equals(UserConstant.STATUS_DORMANT)
                                     || user.getStatus().equals("NR")
                                    || user.getStatus().equals(UserConstant.STATUS_EXPIRED)
                                    );
	                        
	                        if(user!=null){
		                    	if(user.getStatus()!=null){
		                    		if(user.getStatus().equals("T")){
		                    			isCheckedT=true;
		                    		}
		                    	}
		                    }
	                        
	                        if(user!=null){
		                    	if(user.getStatus()!=null){
		                    		if(user.getStatus().equals("O")){
		                    			isCheckedL=true;
		                    		}
		                    	}
		                    }
                        }
	                    System.out.println("<<<<<<<<<<<isCheckedL>>>>>>>>>"+isCheckedL);
					//	DefaultLogger.debug("maker_add_user.jsp","form Status " +form.getStatus());
					//	DefaultLogger.debug("maker_add_user.jsp","user Status " +user.getStatus());

                    %>
	                    <td class="fieldname">User Status</td>
	                    <td>
	                    	<%if(isCheckedL) {%>
	                    		<input type="radio" id="status" name="status" disabled value="<%=UserConstant.STATUS_ACTIVE%>" checked/> Enable
	                    		<input name="status" id="status" type="radio"  value="<%=UserConstant.STATUS_INACTIVE%>" /> Disable
	                    		<input name="status" id="status" type="radio"  value="<%=ICMSConstant.STATUS_TERMINATE%>"  /> Terminate
	                    		<input name="statusLU" id="statusLU" type="radio" disabled checked value="<%=UserConstant.STATUS_LOCKED%>" /> Locked
	                    		<input name="statusLU" id="statusLU" type="radio" value="<%=UserConstant.STATUS_ACTIVE%>" onclick="javascript:unLocked();"/> Unlocked
	                    	<%}else{ 
	                    			if(isCheckedU){
	                    				if("maker_edit_user_read".equals(event)){%>
	                    					<input type="radio" id="status" name="status" value="<%=UserConstant.STATUS_ACTIVE%>" <%=!isChecked?"checked":""%> onclick="javascript:hideReason();"  /> Enable 
	                    					<input name="status" id="status" type="radio" value="<%=UserConstant.STATUS_INACTIVE%>" <%=isChecked?"checked":""%> onclick="javascript:showReason();" /> Disable 
	                    					<input name="status" id="status" type="radio" value="<%=ICMSConstant.STATUS_TERMINATE%>" <%=isCheckedT?"checked":""%> onclick="javascript:showReason();" /> Terminate
	                    					<input name="statusLU" id="statusLU" type="radio" disabled value="<%=UserConstant.STATUS_LOCKED%>" <%=isCheckedL?"checked":""%> /> Locked 
	                    					<input name="statusLU" id="statusLU" type="radio" disabled value="<%=UserConstant.STATUS_ACTIVE%>" <%=isCheckedU?"checked":""%>/> Unlocked
	                    				<%}else{ %>
	                    					<input type="radio" name="status" id="status" value="<%=UserConstant.STATUS_ACTIVE%>" disabled checked/> Enable 
              								<input name="status" id="status" type="radio" value="<%=UserConstant.STATUS_INACTIVE%>" disabled/> Disable
              								<input name="status" id="status" type="radio" value="<%=ICMSConstant.STATUS_TERMINATE%>" disabled/> Terminated
              								<input name="statusLU" id="statusLU" type="radio" value="<%=UserConstant.STATUS_LOCKED%>" disabled/> Locked 
              								<input name="statusLU" id="statusLU" type="radio" value="<%=UserConstant.STATUS_ACTIVE%>" <%=isCheckedU?"checked":""%> /> Unlocked
	                    				<%} %>
	                    			<%}else{ %>
	                    				<input type="radio" id="status" name="status" value="<%=UserConstant.STATUS_ACTIVE%>" <%=!isChecked?"checked":""%> onclick="javascript:hideReason();"  /> Enable 
	                    				<input name="status" id="status" type="radio" value="<%=UserConstant.STATUS_INACTIVE%>" <%=isChecked?"checked":""%> onclick="javascript:showReason();" /> Disable 
	                    				<input name="status" id="status" type="radio" value="<%=ICMSConstant.STATUS_TERMINATE%>" <%=isCheckedT?"checked":""%> onclick="javascript:showReason();" /> Terminate
	                    				<input name="statusLU" id="statusLU" type="radio" disabled value="<%=UserConstant.STATUS_ACTIVE%>" <%=isCheckedL?"checked":""%> /> Locked
	                    				<input name="statusLU" id="statusLU" type="radio" disabled value="<%=UserConstant.STATUS_ACTIVE%>"/> Unlocked
	                    			<%} %>
	                    	<%} %>
	                    </td>
						
						<%DefaultLogger.debug("maker_add_user.jsp","Inside else condition ");%>
	                <%}%>
	                  <td class="fieldname">Disablement Reason</td>
	                  <td><span id="disable" class="<%= isNotDisable? "visibleDiv":"hiddenDiv"%>" >
	                  
	                   <%
	                   
	                   if(user!=null){
	                	  // System.out.println("user.getStatus():"+user.getStatus());
	                	  // System.out.println("form.getStatus():"+form.getStatus());
	                   if(user.getStatus().equals(UserConstant.STATUS_LOCKED)){ 
	                   
	                  // System.out.println("user.getStatus():"+user.getStatus());
	                   %>
                <integro:empty-if-null value="<%=disableReason.get(user.getStatus())%>"/>
                <%}else{ %>
	                  
	                  <html:text property="disableReason" styleId="disableReason" maxlength="40"></html:text> 
	                  <%}}else{ %>
	                  <html:text property="disableReason" styleId="disableReason" maxlength="40"></html:text>
	                  <%} %>
	                  &nbsp;</span></td>
            </tr>
			<% } else { %>
				<input type="hidden" name="status" id="status" value="<%=isBlCreateActiveUser?UserConstant.STATUS_ACTIVE:UserConstant.STATUS_INACTIVE %>"/>	
			<% } %>
			<% if (!isLoginSingleSignOn) { %>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Password&nbsp;<% if (isAdd || isCreation) {%><span class="mandatory">*</span><%}%></td>-->
<!--              <td><html:password  property="password"/><html:errors property="newPasswordError" /> </td>-->
<!--              <td class="fieldname">Confirm Password&nbsp;<% if (isAdd || isCreation) {%><span class="mandatory">*</span><%}%></td>-->
<!--              <td><html:password  property="confirmPassword"/><html:errors property="confirmNewPasswordError" /> </td>-->
<!--            </tr>-->
           				
								
            
            <!-- Added by archana start -->
            <tr class="even">
              <td class="fieldname">User Role(Group Relation)
<!--              <% if (isAdd || isCreation) {%><span class="mandatory">*</span><%}%>-->
              <font color="red">*</font></td>
              <td>
              <%if(isHandoverEditAccess){ %>
              <select id ="teamTypeMembership" disabled="disabled" >
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
               			
								</select>&nbsp;
								<%}else{ %>
								<select id ="teamTypeMembership" onchange="javascript:setTeamTypeMemberShip(this)" tabindex="4">
              						<option value="" >-Please Select-</option>
								 <%				
								 	//for(int i=0;i<teamTypeMembershipLst.size();i++){
								 		for (Iterator iterator = teamTypeMembershipLst.iterator(); iterator.hasNext();) {
											ITeamTypeMembership teamTypeMembership = (ITeamTypeMembership) iterator.next();
								if(user!=null){
											if(user.getTeamTypeMembership().getMembershipID()==teamTypeMembership.getMembershipID()){
								%>
								<option value='<%=teamTypeMembership.getMembershipID()%>' selected="selected"><%= teamTypeMembership.getMembershipName() %> </option>
								<%}else{
									
								
								
								
								%>
									<option value='<%=teamTypeMembership.getMembershipID()%>'><%= teamTypeMembership.getMembershipName() %> </option>
								<% }}else{ %>
								
								<option value='<%=teamTypeMembership.getMembershipID()%>'><%= teamTypeMembership.getMembershipName() %> </option>
								<%}} %>  
               			
								</select> </br><html:errors property="teamTypeMembershipIdError"/>&nbsp;	<%} %></td>
				<td class="fieldname">Department <font color="red">*</font></td>
				<td>
				
				<%if(isHandoverEditAccess){ %>
				<integro:common-code-single entryCode="<%=user.getDepartment() %>" display="true"
                                    		categoryCode="<%=CategoryCodeConstant.HDFC_DEPARTMENT%>" descWithCode="false"  />
				
				
				
                    <%}else{ %>
                    
                    <html:select property="department" styleId="department" tabindex="5">                                   	
                      <option value="">Please Select</option>
					 <html:options collection="departmentList" labelProperty="label" property="value" />													
                    </html:select>
                    
                    
                    
                    <%} %>
												<br/><html:errors property="departmentError"/></td>&nbsp;</td>				
            </tr>
            
            <tr class="odd">
            
            <td class="fieldname">Override Exception for LOA </td>	
            <td>
            	<html:checkbox property="overrideExceptionForLoa" value="Y"/>
            </td>
            
            <td class="fieldname">Employee Grade </td>	
            <td>
            <html:select property="employeeGrade" >
            	<integro:common-code 
            		categoryCode="<%=CategoryCodeConstant.EMPLOYEE_GRADE%>" descWithCode="false" />
            </html:select>
                                    		
            </td>
            
            </tr>
              <!-- Added by archana  End-->
			<%} %>
			<% if(isEdit){%>
			
<!--			<tr class="even">-->
<!--              <td class="fieldname">Segment Access<font color="red">*</font></td>-->
<!--              <td>-->
<!--             <html:select size="10" multiple="multiple" style="width:260" property="allSegment" tabindex="6">-->
              <%
						                ArrayList filterNonPrimary = new ArrayList();
						                
										ICommonUserSegment[] userSegment = user.getUserSegment();
										 if(userSegment!=null){
										for(int i=0; i <userSegment.length;i++){
										
	        											
	        											filterNonPrimary.add(userSegment[i].getSegmentCode());
														
														
												}
										 }
										
										%>
<!--             <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" descWithCode="true" excludeList="<%=filterNonPrimary%>" pleaseSelect="false"/>-->
<!--		                			</html:select> -->
<!--              </td>-->
<!--              <td>-->
<!--		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allSegment,segment, false)" class="btnNormal"/>-->
<!--			                <br/> <br/> -->
<!--							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(segment,allSegment,false)" class="btnNormal"/>-->
<!--		               </td>-->
<!--		             <td>-->
<!--		               -->
<!--									 <html:select size="10" multiple="multiple" style="width:260" property="segment">-->
									<%
									ICommonUserSegment[] userSegment = user.getUserSegment();
									 if(userSegment!=null){
									for(int i=0; i <userSegment.length;i++){
										%>
<!--										<option value='<%=userSegment[i].getSegmentCode()%>'>-->
<!--										<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=userSegment[i].getSegmentCode()%>" display="true" /></option>									-->
<!--										<br>-->
										<%
										}
									 }
										 %>  
<!--		                			</html:select> -->
<!--		                			&nbsp;</br><html:errors property="segmentError"/></td>   -->
<!--				<td class="fieldname"></td>-->
<!--				<td>&nbsp;</td>				-->
<!--            </tr>-->
<!--            		<tr class="even">-->
<!--              <td class="fieldname">Region Access</td>-->
<!--              <td>-->
<!--             <html:select size="10" multiple="multiple" style="width:260" property="allUserRegion">-->
            <%
            String[] listRegion= new String[100] ;
            ICommonUserRegion[] userRegions = user.getUserRegion();
            if(userRegions!=null){
            for(int i=0; i <userRegions.length;i++){
				
				listRegion[i]= userRegions[i].getRegionCode();
			}
            }
            for (int j=0;j< userRegionList.size();j++){
			    	LabelValueBean bean= (LabelValueBean)userRegionList.get(j);
			    // for loop refer discrepency create
				         			    	if(!(bean.getValue().trim().equalsIgnoreCase(listRegion[0]))
				         			    			)
				         			    	{
				         			    	
				         			    	%>
<!--				         			    	<option value='<%=bean.getValue()%>'>-->
<!--				         			    	<%=bean.getLabel() %>-->
<!--					        											<br>-->
				         			    	
				         			    	<%
				         			    		
				         			    		}
											}
            
			
														 %>  
										 
<!--		                			</html:select> -->
<!--              </td>-->
<!--              <td>-->
<!--		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allUserRegion,userRegion, false)" class="btnNormal"/>-->
<!--			                <br/> <br/> -->
<!--							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(userRegion,allUserRegion,false)" class="btnNormal"/>-->
<!--		               </td>-->
<!--		             <td>-->
<!--		               -->
<!--									 <html:select size="10" multiple="multiple" style="width:260" property="userRegion">-->
									 <%
									ICommonUserRegion[] userRegions = user.getUserRegion();
									 if(userRegions!=null){
									for(int i=0; i <userRegions.length;i++){
										
										
				         				 for (int j=0;j< userRegionList.size();j++){
				         			    	LabelValueBean bean= (LabelValueBean)userRegionList.get(j);
				         			    	if(bean.getValue().trim().equalsIgnoreCase(userRegions[i].getRegionCode())){
				         			    	
				         			    	%>
<!--				         			    	<option value='<%=userRegions[i].getRegionCode()%>'>-->
<!--				         			    	<%=bean.getLabel() %>-->
<!--					        											<br>-->
				         			    	
				         			    	<%
				         			    	}
											}
				         			  }
									 }		 %>  
										
<!--		                			</html:select> -->
<!--		                			&nbsp;</br><html:errors property="rbiCodeCategorys"/></td>   -->
<!--				<td class="fieldname"></td>-->
<!--				<td>&nbsp;</td>				-->
<!--            </tr>-->
			
			
			
			
			
			
			<%}else{ %>
<!--			<tr class="even">-->
<!--              <td class="fieldname">Segment Access<font color="red">*</font></td>-->
<!--              <td>-->
<!--             <html:select size="10" multiple="multiple" style="width:260" property="allSegment" tabindex="6">-->
             
              <%
						                ArrayList filterNonPrimary = new ArrayList();
            							  if(segmentArray!=null){
										for(int i=0; i <segmentArray.length;i++){
										
	        											
	        											filterNonPrimary.add(segmentArray[i]);
														
														
												}
										 }
										
										%>
             
<!--             <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" descWithCode="true" excludeList="<%=filterNonPrimary%>" pleaseSelect="false"/>-->
<!--		                			</html:select> -->
<!--              </td>-->
<!--              <td>-->
<!--		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allSegment,segment, false)" class="btnNormal"/>-->
<!--			                <br/> <br/> -->
<!--							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(segment,allSegment,false)" class="btnNormal"/>-->
<!--		               </td>-->
<!--		             <td>-->
<!--		               -->
<!--									 <html:select size="10" multiple="multiple" style="width:260" property="segment">-->
									 <%
									
									 if(segmentArray!=null){
									for(int i=0; i <segmentArray.length;i++){
										%>
<!--										<option value='<%=segmentArray[i]%>'>-->
<!--										<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=segmentArray[i]%>" display="true" /></option>									-->
<!--										<br>-->
										<%
										}
									 }
										 %>  
									 
									
<!--		                			</html:select> -->
<!--		                			&nbsp;</br><html:errors property="segmentError"/></td>   -->
<!--				<td class="fieldname"></td>-->
<!--				<td>&nbsp;</td>				-->
<!--            </tr>-->
<!--            		<tr class="even">-->
<!--              <td class="fieldname">Region Access</td>-->
<!--              <td>-->
<!--             <html:select size="10" multiple="multiple" style="width:260" property="allUserRegion">-->
             
											 <%
											
											 
											
									 if(regionArray!=null){
										 String[] listRegion= new String[100] ;
										 for(int i=0; i <regionArray.length;i++){
												
												listRegion[i]= regionArray[i];
											}	 
								//	for(int i=0; i <regionArray.length;i++){
										
										
				         				 for (int j=0;j< userRegionList.size();j++){
				         			    	LabelValueBean bean= (LabelValueBean)userRegionList.get(j);
				         			    	 if(!(bean.getValue().trim().equalsIgnoreCase(listRegion[0]))
					         			    			)
					         			    	{
				         			    	
				         			    	%>
<!--				         			    	<option value='<%=bean.getValue()%>'>-->
<!--				         			    	<%=bean.getLabel() %>-->
<!--					        											<br>-->
				         			    	
				         			    	<%
				         			    	}
											}
				         			//  }
									 }else{		 %>  
<!--											<html:options collection="userRegionList" labelProperty="label" property="value" />-->
											<%} %>
<!--		                			</html:select> -->
<!--              </td>-->
<!--              <td>-->
<!--		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allUserRegion,userRegion, false)" class="btnNormal"/>-->
<!--			                <br/> <br/> -->
<!--							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(userRegion,allUserRegion,false)" class="btnNormal"/>-->
<!--		               </td>-->
<!--		             <td>-->
		               
<!--									 <html:select size="10" multiple="multiple" style="width:260" property="userRegion">-->
									 <%
									 if(regionArray!=null){
									for(int i=0; i <regionArray.length;i++){
										
										
				         				 for (int j=0;j< userRegionList.size();j++){
				         			    	LabelValueBean bean= (LabelValueBean)userRegionList.get(j);
				         			    	if(bean.getValue().trim().equalsIgnoreCase(regionArray[i])){
				         			    	
				         			    	%>
<!--				         			    	<option value='<%=regionArray[i]%>'>-->
<!--				         			    	<%=bean.getLabel() %>-->
<!--					        											<br>-->
				         			    	
				         			    	<%
				         			    	}
											}
				         			  }
									 }		 %>  
<!--		                			</html:select> -->
<!--		                			&nbsp;</br><html:errors property="rbiCodeCategorys"/></td>   -->
<!--				<td class="fieldname"></td>-->
<!--				<td>&nbsp;</td>				-->
<!--            </tr>-->
            <%} %>
            <input type="hidden" name="creation" value="<%=(isAdd || isCreation)%>">
          </tbody>
        </table> </td>
  </tr>
  <%if(isRemarksNedded){%>
  <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td class="fieldname">Remarks</td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
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
<%}else{%>

<%}%>
 <!-- Added by archana start -->
<input type="hidden" id ="teamTypeMembershipId" name="teamTypeMembershipId"></input>
<html:hidden property="empId"/>
 <!-- Added by archana End -->

<html:hidden property="contactNo"/>
<html:hidden property="name"/>
<html:hidden property="email"/>
<html:hidden property="empId"/>
<html:hidden property="address"/>
<html:hidden property="branchCode"/>
<html:hidden property="department"/>
<html:hidden property="teamName"/>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="85">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
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
