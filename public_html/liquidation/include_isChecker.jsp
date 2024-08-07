<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%
  ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+ IGlobalConstant.USER);
  //ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
  boolean isSACMaker = false;
  boolean isSACChecker = false;
  
  String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
  long teamTypeMembershipID = Long.parseLong(teamTypeMemID);

  int role = 0 ;
  	if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_CHECKER||teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH){
  		isSACChecker = true;
  	    
  	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER 
  			||teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
  			||teamTypeMembershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
  			||teamTypeMembershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
  			){
  		isSACMaker = true;
  	}

%>