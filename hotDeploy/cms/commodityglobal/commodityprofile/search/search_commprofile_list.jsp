<%@ page import="com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfConstants,
				com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 org.apache.struts.action.Action,
                 org.apache.struts.action.ActionErrors"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isCMTMaker = false;
  	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
	            if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    isCMTMaker = true;
                    break TOP_LOOP;
                }
            }
        }
  	}   
  	
	String event = CMDTProfConstants.EN_READ;
	if(isCMTMaker){
		event = CMDTProfConstants.EN_SEARCH;
	}

%>
<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage() {
    document.forms[0].submit();
}

//-->
</script>

<html:form action="CommProfileSearch.do">
<input type="hidden" name="event" value="<%=event%>"/>
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
  <tr>
    <td>
        <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
            <thead>
              <tr>
                <td colspan="2">Please enter search criteria&nbsp;
                <logic:present name="<%=Action.ERROR_KEY%>">
					<html:errors property="<%=ActionErrors.GLOBAL_ERROR%>"/>
				</logic:present>
				</td>
              </tr>
            </thead>
            <tbody>
              <tr class="odd">
                <td width="37%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.sub.type"/> : </td>
                <td width="48%">
	                <html:select property="<%=CMDTProfConstants.FN_CMDT_CATEGORY_ID%>">
			            <option value="" >Please Select </option>
			            <html:options name="<%=CMDTProfConstants.AN_CATEGORY_ID_COLL%>" labelName="<%=CMDTProfConstants.AN_CATEGORY_VAL_COLL%>"/>
	                </html:select>&nbsp;
	                <html:errors property="<%=CMDTProfConstants.FN_CMDT_CATEGORY_ID%>"/>
                </td>
             </tr>
             <tr class="even">
                <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.pri.type"/> : </td>
                <td>
	                <html:select property="<%=CMDTProfConstants.FN_PRICE_TYPE%>">
			            <option value="" >Please Select </option>
			            <html:options name="<%=CMDTProfConstants.AN_PRICE_TYPE_ID_COLL%>" labelName="<%=CMDTProfConstants.AN_PRICE_TYPE_VAL_COLL%>"/>
	                </html:select>&nbsp;
	                <html:errors property="<%=CMDTProfConstants.FN_PRICE_TYPE%>"/>
                </td>
             </tr>
             <tr class="odd">
                <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.ric.code"/> : </td>
                <td>
                	<html:text property="<%=CMDTProfConstants.FN_NON_RIC_CODE%>" maxlength="10" /> 
                	<html:errors property="<%=CMDTProfConstants.FN_NON_RIC_CODE%>" />
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/> :</td>
                <td>
                	<html:text property="<%=CMDTProfConstants.FN_CMDT_SUB_TYPE%>" maxlength="40" /> 
                	<html:errors property="<%=CMDTProfConstants.FN_CMDT_SUB_TYPE%>" />
                </td>
              </tr>
              <tr class="odd">
              	<td colspan="2" class="fieldname">
              		<center>
              		<input onclick="submitPage()" name="go" value="Go"  type="button"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
              		</center>
              	</td>
              </tr>
            </tbody>
          </table>
         </td>
       </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
  </table>
</html:form>
