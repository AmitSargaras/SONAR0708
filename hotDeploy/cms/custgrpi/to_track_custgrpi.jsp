<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierForm" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="com.integrosys.cms.ui.common.CountryList" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%

    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

    boolean isEditable = false;
    TOP_LOOP:
    for (int i = 0; i < userTeam.getTeamMemberships().length; i++) {
        for (int j = 0; j < userTeam.getTeamMemberships()[i].getTeamMembers().length; j++) {
            if (userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() == user.getUserID()) {
                if (userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_GEMS_AM_MAKER)
                {
                    isEditable = true;
                    break TOP_LOOP;
                }
            }
        }
    }

%>


<%
    int rowIdx = 0;
    String event = (String) request.getAttribute("event");
    CustGrpIdentifierForm aForm = (CustGrpIdentifierForm) request.getAttribute("CustGrpIdentifierForm");

    //System.out.println("event = " + event);


    ICustGrpIdentifier stagingObj = null;
    ICustGrpIdentifier actualObj = null;
    ICustGrpIdentifierTrxValue itrxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.service_groupTrxValue);
    CustGroupUIHelper.printChildMembers(itrxValue);
     String popTrxId = "";
    String lastActionBy = "";
    String lastRemarksMade = "";

    if (itrxValue != null) {
        lastActionBy = itrxValue.getUserInfo();
        lastRemarksMade = itrxValue.getRemarks();

        popTrxId = itrxValue.getTransactionID();
         actualObj = itrxValue.getCustGrpIdentifier();
        if ("read".equals(event)) {
            stagingObj = itrxValue.getCustGrpIdentifier();
        } else {
            stagingObj = itrxValue.getStagingCustGrpIdentifier();
        }

    } else {
       // System.out.println("itrxValue IS  NULL");
        stagingObj = new OBCustGrpIdentifier();

    }

    String grpID ="-";
    if (actualObj != null && actualObj.getGrpID() != ICMSConstant.LONG_INVALID_VALUE){
        grpID = String.valueOf(actualObj.getGrpID());
    }

    String grpNo ="-";
    if (stagingObj != null && stagingObj.getGrpNo() != ICMSConstant.LONG_INVALID_VALUE){
        grpNo = String.valueOf(stagingObj.getGrpNo());
    }

%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript">
        <!--
        function fnEdit(){
            var frm = document.forms[0];
               frm.event.value='edit';
               frm.action='CustGrpIdentifier.do?event=edit';
               frm.submit();
        }
         function fnCance(){
               var frm = document.forms[0];
               frm.action ="ToDo.do?event=totrack" ;
               frm.submit();
        }
        -->
    </script>
</head>

<body>

<html:form action="CustGrpIdentifier.do?event=read">
<input type="hidden" name="event"/>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
</thead>
    <tr>
    <td>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="73%"><h3><bean:message key="title.custgrpi.custgrp"/> - View </h3></td>
            <td width="27%" align="right" valign="bottom">
                <%--<input type="button" name="Submit" value="Edit" class="btnNormal" onClick="fnEdit()"/>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </table>

   <%@ include file="view_group_fields.jsp" %>

    <%@include file="view_group_mgel_fields.jsp"%>

    <!-- Group Sub Limit -->
    <%@ include file="groupsublimit/view_group_sub_limit_list.jsp" %>

    <!-- For Other Limit -->
    <%@ include file="groupotrlimit/view_group_other_limit_list.jsp" %>

    <!-- Group Credit Grades -->
    <%@ include file="groupcreditgrade/view_groupcreditgrade_list.jsp" %>

    <!-- Group Member -->
    <%@ include file="groupmember/view_group_member_list.jsp" %>
    </td>
    </tr>

    <tr>
    <td colspan="2">&nbsp;</td>
</tr>

<%--
<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">Last Action By</td>
                    <td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Last Remarks Made</td>
                    <td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
                </tr>
            </tbody>
        </table>

    </td>
</tr>
--%>

</table>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">&nbsp;</td>
    </tr>
    <tr align="center">
        <td>
            <a href="#" onclick="fnCance();"
               onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image42" width="70" height="20" border="0" id="Image42" />
            </a>
        </td>
    </tr>
</table>

</html:form>
</body>
</html>
