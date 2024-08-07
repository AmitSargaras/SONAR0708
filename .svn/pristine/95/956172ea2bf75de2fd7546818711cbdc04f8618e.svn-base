<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/Commodity_read.jsp,v 1.11 2006/10/27 08:30:40 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.11 $
* Date: $Date: 2006/10/27 08:30:40 $
* Tag: $Name:  $
*/
%>

<%
 ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
 int teamMembershipID = 0;

  TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPC_MAKER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_CPC_MAKER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_CMT_MAKER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_CHECKER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_CMT_CHECKER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_FAM_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_FAM_USER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_GAM_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_GAM_USER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_RCO_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_RCO_USER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SCO_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_SCO_USER;
                    break TOP_LOOP;
                } else {
                    teamMembershipID = 0;
                }
            }
        }
  }


    String from_event = CommodityMainAction.EVENT_READ;

    String collateralID = (String)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommoidtyMainAction.collateralID");

%>



<html>
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--


function submitPage(num) {
    if (num == 1) {
  	    document.forms[0].event.value="<%=CommodityMainAction.EVENT_PREPARE_UPDATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value="<%=CommodityMainAction.EVENT_EXPOSURE_SUMMARY%>";
    }
    if (num == 3) {
        document.forms[0].action="CommodityDeal.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST%>";
    }
    document.forms[0].submit();
}

function viewItem(secIndex, index, type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_VIEW%>";
    document.forms[0].secIndexID.value = secIndex;
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityMain.do">
<input type="hidden" name="event" value="<%=CommodityMainAction.EVENT_PREPARE_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="secIndexID"/>
<input type="hidden" name="collateralID" value="<%=collateralID%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td ><h3><bean:message key="label.security.title.view.commodity"/></h3></td>
      <td width="50%" align="right" valign="baseline">
          <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="75">
<%--
            <%    if (isDeleting) {             %>
                    <p class="required"><font color="#FF0000" size="3"><b>
                    DELETED
                    </b></font></p>
            <% } %>
--%>
            </td>
            <td width="75" align="right">
            <% if (teamMembershipID != 0 && (teamMembershipID == ICMSConstant.TEAM_TYPE_CPC_MAKER ||
                    teamMembershipID == ICMSConstant.TEAM_TYPE_CMT_MAKER)) { %>
            <input type="button" name="Button" value="Edit" class="btnNormal" style="width:50" onclick="submitPage(1)"/>
            <% } %>
            </td>
          </tr>
        </table></td>
    </tr>
    <%
        boolean allowCommodityDeal = (teamMembershipID != 0 && teamMembershipID != ICMSConstant.TEAM_TYPE_CPC_MAKER);
    %>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right" valign="baseline">
        <table width="<%=allowCommodityDeal?"370":"165"%>" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="165" valign="bottom" align="right">
                <input type="button" name="button42" id="button4" value="Exposure Summary" class="btnNormal" onclick="submitPage(2)"/>
            </td>
            <%
                if (teamMembershipID != 0 &&
                        teamMembershipID != ICMSConstant.TEAM_TYPE_CPC_MAKER) {
            %>
            <td width="50" valign="bottom" align="center">
                <img src="img/icon/seprate_bar.gif"/>
            </td>
            <td width="155" align="right" valign="bottom">
                <input type="button" name="button3" id="button2" value="Commodities Deal" class="btnNormal" onclick="submitPage(3)"/>
            </td>
            <% } %>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
<%@ include file="Commodity_read_helper.jsp" %>
</table>
 <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
 <%
     OBCMSCustomer obCMSCustomer = (OBCMSCustomer) request.getAttribute("customerOb");
     OBLimitProfile obLimitProfile = (OBLimitProfile) request.getAttribute("limitprofileOb");
     String link="CustomerProcess.do?event=viewsecurities&customerID="+obCMSCustomer.getCustomerID()+"&limitProfileID="+obLimitProfile.getLimitProfileID();
%>

    <td><a href="<%=link%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
</table>

</html:form>
</body>
</html>
