<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.component.commondata.app.Constants,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeForm,
                 com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeTypeGroup,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeTypeGroup,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant, 
                 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<!-- InstanceEndEditable -->

</head>
<%
	int sno = 0;
   /* 
	
	boolean canEdit = true;	
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long oneTeamMshipID = Long.parseLong(teamTypeMemID);
	
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER) {	
      canEdit = false;
    }
    */
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
%>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="TatDuration.do?">

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Maintain TAT Duration</h3></td>
      <%--
      <td align="right" valign="bottom">&nbsp;
           <input type="button" name="Submit" value="Add New" class="btnNormal" onClick="addNew()"/>
        </td>
        --%>
    </tr>
    <tr>
      <td colspan="2"><hr />
      </td>
    </tr>    
   </thead>
   <tbody>

    <tr>
      <td colspan="2">

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="10%">S/N</td>
              <td width="50%">Application Type</td>
              <td width="20%">Action</td>
            </tr>
          </thead>
              <tbody>

<logic:present name="tatParamList">
   <logic:iterate id="OB" name="tatParamList"  type="com.integrosys.cms.app.tatduration.bus.OBTatParam" >
                                <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.COMMON_CODE_APPLICATION_TYPE, OB.getApplicationType())%>"/>
                          </td>
                          <td align="center">&nbsp;
							<a href="./TatDuration.do?event=read_stage_list&tatParamId=<%=OB.getTatParamId()%>"/>
                            <%
                                if (userRole.equals("SC Maker")) {
                            %>
							View/Edit
                            <% } else { %>
                            View  
                            <% } %>

							</a>

<%--                            <% if(ICMSConstant.STATE_ACTIVE.equals(OB.getTrxStatus())) {%>--%>
<%--                            <input type=button name=Edit value=Edit onclick="editCodeId('<%=OB.getTrxID()%>')">--%>
<%--                             <% }%>--%>
                          </td>
                        </tr>
</logic:iterate>
</logic:present>
              </tbody>
         </table>
        </td>
       </tr>
    </tbody>
  </table>

<br>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
