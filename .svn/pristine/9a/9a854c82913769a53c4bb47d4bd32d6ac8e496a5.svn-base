<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
				 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.component.user.app.bus.ICommonUser,
				 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String lastLogin = (String)request.getAttribute("lastLogin");

    //Integer todayDiaryItemCount = (Integer) request.getAttribute("todayDiaryItemCount");
    
    //int numOfDiaryExpiredToday = 0;    
    //if (todayDiaryItemCount != null) {
	//    numOfDiaryExpiredToday = todayDiaryItemCount.intValue();
    //}
    
    if ("null".equals(lastLogin))
    	lastLogin = null;

    String userRole = "";
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	
    TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
		if (String.valueOf(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()).equals(teamTypeMemID)) {    
	        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
	            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
	                userRole= userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipName();
	            }
	        }
    	}
    }
    
    //String cdate = DateUtil.formatCurrentTime("dd MMM yyyy | hh:mm:ss aa");
    
%>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<!--	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="background-image:url(img/welcome.jpg); background-repeat:no-repeat; background-color:white; background-position:left;">-->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="background-repeat:no-repeat; background-color:white; background-position:left;">
	  <thead>
	  </thead>
	  <tbody>
	      <tr>
	        <td align="left">
	          <table border="0" width="500" align="left" >
	          <tbody>
	            <tr>
	            	<td align="right" class="header">Welcome <span class="welcome"><%=user.getUserName()%></span></td>
	            </tr>
	            <tr>
	            	<td height="7" align="right"><img src="img/bar.jpg"/></td>
	            </tr>
	            <tr>
	            	<td valign="bottom" class="time" align="right">&nbsp;</td>
	       		</tr>
	       		<tr>
	       			<td valign="bottom" class="note" align="right">
	       			<%
	       				if (userTeam.getTeamType().getTeamTypeID() == (long) ICMSConstant.TEAM_TYPE_SSC ||
	       					userTeam.getTeamType().getTeamTypeID() == (long) ICMSConstant.TEAM_TYPE_FAM ||
	       					userTeam.getTeamType().getTeamTypeID() == (long) ICMSConstant.TEAM_TYPE_GAM) {
	       			%>
						<br>
	       				<a style="text-decoration:none; font-size:13px; font-weight:bold;" href="DiaryItem.do?event=list_due_items">
	       				<div id="aj_diarylist"></div>
	       				</a>
	       			<%
       					}
	       			%>
	       			</td>
	       		</tr>
	       		<tr>
	            	<td height="350" class="time" valign="bottom"><b>Last Login:&nbsp;</b><integro:empty-if-null value="<%=lastLogin%>"/>&nbsp;</td>
	       		</tr>
	      </tbody>
	    </table>
	    </td>
	  </tr>
	</tbody>
	</table>
	

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>