<%@ include file="/template/charset_template.jsp" %>

<%@ page import = "com.integrosys.base.techinfra.propertyfile.PropertyManager,
                   com.integrosys.component.bizstructure.app.bus.ITeam,
                   com.integrosys.base.techinfra.logger.DefaultLogger,
                   com.integrosys.base.uiinfra.common.Constants,
                   com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                   com.integrosys.base.uiinfra.exception.AccessDeniedException,
				   com.integrosys.component.user.app.bus.ICommonUser,
				   com.integrosys.cms.ui.common.constant.IGlobalConstant,
				   com.integrosys.cms.app.common.constant.ICMSConstant,
				   java.util.*,
				   java.text.*,
                   com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%-- Session check --%>
 
<%
	HttpSession ses = request.getSession(false);

	if(null == ses || ses.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID) == null) {  //session has expired
		DefaultLogger.warn(this, "Http Session has expired!");
		AccessDeniedException e = new AccessDeniedException("Http Session has expired!");
		request.setAttribute("losException", e);
		String webAppName = request.getContextPath();
		response.sendRedirect(webAppName + "/system/invalid_session_error.jsp");
		return;
	}
%>

<%-- end of session check --%> 

    
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamGroup"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamDao"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamEntry"%><table width="100%" border="0" cellspacing="0" cellpadding="0" height="48">
		<tr>
			<%@ include file="/template/image_logo_template.jsp" %>

<%
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    String teamTypeMemID =(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
    OBSystemBankBranch branchObj = (OBSystemBankBranch)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+".branchObj");
    String multiLogin = (String) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.MULTI_LOGIN);

    String userName = "";
    if (user != null) {
		userName = user.getUserName();
    }
   
    boolean isLoginSingleSignOn = PropertyManager.getBoolean("integrosys.login.single.signon.enabled", false);

    String userRole = "";
	String membershipID = null;
    for (int i=0;i<userTeam.getTeamMemberships().length;i++) { //parse team membership to validate user first
        for (int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++) { 
			//parse team memebers to get the team member first..
        	if (String.valueOf(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()).equals(teamTypeMemID)) {
	            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()) {
	                userRole= userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipName();
	                membershipID = String.valueOf(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipType().getMembershipTypeID());
	            }
        	}
        }
    }

%>

			<span class="role" id="topUserRole"><%= user.getLoginID()%> / <%= userRole %></span>
			<% if(branchObj!=null){ %>
			<span class="role" id="topBuildNumber">
				&nbsp;|&nbsp; Branch <%= branchObj.getSystemBankBranchName() %>-<%= branchObj.getSystemBankBranchCode() %>
			</span>
			<%} %>
			
			<%--
			<span class="role" id="topBuildNumber">
				&nbsp;|&nbsp; Build <%= PropertyManager.getValue("build.number", "-") %>
			</span>
			 --%>
			<span class="role" id="liveclock">
				&nbsp;|&nbsp; 
				
<%
IGeneralParamDao generalParamDao =(IGeneralParamDao)BeanHouse.get("generalParamDao");
IGeneralParamGroup generalParamGroup  =generalParamDao.getGeneralParamGroupByGroupType("actualGeneralParamGroup", "GENERAL_PARAM");
IGeneralParamEntry[]generalParamEntries= generalParamGroup.getFeedEntries();
Date dateApplication=new Date();
long ladGenIndicator=0l;
for(int i=0;i<generalParamEntries.length;i++){
	if(generalParamEntries[i].getParamCode().equals("APPLICATION_DATE")){
		dateApplication=new Date(generalParamEntries[i].getParamValue());
	}
}


%>
<integro:date object="<%=dateApplication %>"></integro:date>
<script src="js/liveclock.js" type="text/javascript"></script>
				<script>if (show_live_clock) show_live_clock();</script>
			</span>
			<img src="img/spacer_clear.gif" width="8" height="8" border="0" />
			<br><br>

<!--			<% if (!isLoginSingleSignOn) { %>-->
<!--				<% if (!PropertyManager.getBoolean("integrosys.login.top.most.layer", true)) { %>-->
<!--					<a href="javascript:changeSettings();" class="menu1" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageS1','','img/tab_setting2.gif',1)"><img src="img/tab_setting1.gif" name="ImageS1" border="0" id="ImageS1" />Settings<img src="img/spacer_clear.gif" width="8" height="8" border="0" /></a>-->
<!--				<% } %>-->
<!--				<a href="./PasswordChange.do" class="menu1" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageS2','','img/tab_keys2.gif',1)"><img src="img/tab_keys1.gif" name="ImageS2" border="0" id="Image" />Password<img src="img/spacer_clear.gif" width="8" height="8" border="0" /></a>-->
<!--			<% } %>-->

			<% if (multiLogin != null) { %>	
				<a href="./ChangeRole.do?event=changeRole&customerID=-999999999&limitProfileID=-999999999" onclick="if (changeRole(<%= membershipID %>)) return true;return false;" class="menu1" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImgChngRole','','img/tab_role2.gif',1)"><img src="img/tab_role1.gif" name="ImgChngRole" border="0" id="ImgChngRole" />&nbsp;Change Role<img src="img/spacer_clear.gif" width="8" height="8" border="0" /></a>
			<% } %>

			<a href="./Logout.do?event=losuser" class="menu1" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageS3','','img/tab_logout2.gif',1)"><img src="img/tab_logout1.gif" name="ImageS3" width="16" height="16" border="0" id="ImageS3" />Logout<img src="img/spacer_clear.gif" width="8" height="8" border="0" /></a>

        </tr>
	</table>

<%-- this is for the top strip --%>
<script type="text/javascript">
	var cookie = read_Cookie("cms_style");
	var styletitle = cookie ? cookie : get_PreferredStyleSheet();

	var stripImgName = "<%=request.getContextPath()%>/themes/" + styletitle + "/img/strip.jpg";
	document.write('<table width="100%" border="0" style="background-image:url(' + stripImgName + ')" height="27" cellpadding="0" cellspacing="0">');
</script>

        <tr>
			<td width="5%" valign="middle" align="left"><img src="img/spacer_clear.gif" width="5" height="8" border="0">
				<a href="./Welcome.do?event=prepare" class="menu"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/tab_home2.gif',1)"><img src="img/tab_home1.gif" name="Image4" width="16" height="16" border="0" id="Image4" />Home</a>
			</td>
			<td width="1%"></td>
			<td width="79%" valign="top" style="padding-top:7px">
				<script language=JavaScript src="menu/chrome.js" type=text/javascript></script>	

				<div class="horizontalmenu" id="topmenu" >
                 
				<integro:horizontal-menu roleID="<%=Integer.parseInt(teamTypeMemID)%>"/>

				<script type="text/javascript">cssdropdown.startchrome("topmenu")</script>
			</td>
		</tr>
    </table>

<jsp:include page="/template/common_info_template.jsp" >
	<jsp:param name="userRole" value="<%=userRole%>"/>
</jsp:include>

<script language="JavaScript" type="text/JavaScript">
<!--
function changeRole(role) {
	if (role == "<%=ICMSConstant.MEMBERSHIP_TYPE_MAKER%>") {
		return window.confirm("Are you sure to switch to <%=userTeam.getTeamType().getDescription()%> Checker ?");
	} else if (role == "<%=ICMSConstant.MEMBERSHIP_TYPE_CHECKER%>") {
		return window.confirm("Are you sure to switch to <%=userTeam.getTeamType().getDescription()%> Maker ?");
	}
	return false;
}

var prefTime;
var lastStyleTitle = '';
var lastLayoutTitle = '';

<%-- this is called when the Setting button is clicked --%>
function changeSettings() {

	cookie = read_Cookie("cms_style");
	lastStyleTitle = cookie ? cookie : get_PreferredStyleSheet();

	cookie = read_Cookie("cms_layout");
	lastLayoutTitle = cookie ? cookie : "flat";

	if (parent.show_preferences) {
		parent.show_preferences();

		checkPreferenceClosed();
	}
}

<%-- this is a callback function that is trigger when the Setting button is clicked --%>
function checkPreferenceClosed() {

	if (parent.win_preferences == null) {
		clearTimeout(prefTime);
	
		cookie = read_Cookie("cms_style");
		var styletitle = cookie ? cookie : get_PreferredStyleSheet();
		if (lastStyleTitle != styletitle) {
			load_DynamicStyleSheet(true);
		}

		cookie = read_Cookie("cms_layout");
		var layouttitle = cookie ? cookie : "flat";		
		if (lastLayoutTitle != layouttitle) {
			if (layouttitle == "tabbed") {
				if (typeof makeTabForCollateral == 'function') {
					makeTabForCollateral(true, true);

					if (BrowserDetect.browser == 'Explorer' && BrowserDetect.version == '6') {
						if (typeof disableGoButtons == 'function')
							disableGoButtons(false);
					}
				}
			} else if (layouttitle == "flat") {
				if (g_tagUL != null) {
					g_tagUL.innerHTML = '';
					if (typeof showValidCollateralTags == 'function') {
						showValidCollateralTags();

						if (BrowserDetect.browser == 'Explorer' && BrowserDetect.version == '6') {
							if (typeof disableGoButtons == 'function')
								disableGoButtons(false);

							hidingButton = setTimeout("disableAddNewRemoveButton()", 300);
						}
					}
				}
			}
		}

	}
	else {
		prefTime = setTimeout("checkPreferenceClosed()", 1000);
	}
}

//-->
</script>


<%-- Broadcast check --%>

<jsp:include page="/template/check_broadcast.jsp" >
	<jsp:param name="showBroadcastStatus" value="false"/>
</jsp:include>

<%-- end of Broadcast check --%> 


<%-- this is to check if user opened a new browser tab --%>

<%
	String multipleTabPath = "'" + request.getContextPath() + "/system/inproper_session.jsp?logout=yes'";

	if (!PropertyManager.getBoolean("integrosys.login.top.most.layer", true))
	{
%>
	<script type="text/javascript">
		if (sessvars.sessionName == undefined || sessvars.sessionName == 'undefined' || sessvars.sessionName == null || sessvars.sessionName == 'null')
		{
			//alert("new tab found");
			top.window.location = <%= multipleTabPath %>;
		}
	</script>
<%
	}
%>


<div class="fullscreensilk" id="fullscreensilk">
	<table width="100%" height="100%" bgcolor="#F5F5F5" border="0" cellspacing="0" cellpadding="0">
	<tr><td align="center" valign="middle"><div class="fullscreensilk" id="fullscreensilkimage"><img src="<%=request.getContextPath()%>/img/loading.gif" border="0" id="spinLoading"></div>&nbsp;</td></tr>
	</table>
</div>
