<%@ page import="org.apache.commons.lang.ArrayUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%

    int rowIdx = 0;
    String event = (String) request.getAttribute("event");

    // System.out.println("event = " + event);
    String lastActionBy = "";
    String lastRemarks = "";
    Date lastUpdateDate = null;
    ;

    ICustGrpIdentifier stagingObj = null;
    ICustGrpIdentifier actualObj = null;
    String check = "1";
    ICustGrpIdentifierTrxValue itrxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.service_groupTrxValue);
    //CustGroupUIHelper.printChildMembersAct(itrxValue);
    String popTrxId = "";
    if (itrxValue != null) {
        // Get transaction user and date
        lastActionBy = itrxValue.getUserInfo();
        lastUpdateDate = itrxValue.getTransactionDate();
        lastRemarks = itrxValue.getRemarks();

        popTrxId = itrxValue.getTransactionID();
        stagingObj = itrxValue.getStagingCustGrpIdentifier();
        actualObj = itrxValue.getCustGrpIdentifier();
    } else {
        //System.out.println("itrxValue IS  NULL");
        stagingObj = new OBCustGrpIdentifier();

    }
    if (itrxValue != null) {
        // did in EditCustGrpIdentifierCommand so no need to do here
        //  if ("edit".equals(event)){
        //       stagingObj = itrxValue.getCustGrpIdentifier();
        // }else{
        //       stagingObj = itrxValue.getStagingCustGrpIdentifier();
        //  }
    }
    if (stagingObj == null) {
        stagingObj = new OBCustGrpIdentifier();
    }

    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

    boolean isEditable = false;
    TOP_LOOP:
    for (int i = 0; i < userTeam.getTeamMemberships().length; i++) {
        for (int j = 0; j < userTeam.getTeamMemberships()[i].getTeamMembers().length; j++) {
            if (userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() == user.getUserID()) {
                if (userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_GEMS_AM_MAKER) {
                    isEditable = true;
                    break TOP_LOOP;
                }
            }
        }
    }
    String grpID = "-";
    if (actualObj != null && actualObj.getGrpID() != ICMSConstant.LONG_INVALID_VALUE) {
        grpID = String.valueOf(actualObj.getGrpID());
    }
    String grpNo = "-";
    if (stagingObj != null && stagingObj.getGrpNo() != ICMSConstant.LONG_INVALID_VALUE) {
        grpNo = String.valueOf(stagingObj.getGrpNo());
    }

%>


<html>
<head>
    <!-- InstanceBeginEditable name="CssStyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/dateext.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/validation.js"></script>

<head>
    <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <script type="text/javascript">
        function submitPage(num) {
            // alert(num) ;
            var frm = document.forms[0];
            if (num == 1) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_MAKER2_SAVE%>";
                frm.action = 'CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_MAKER2_SAVE%>';
                frm.submit();
            } else if (num == 2) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_MAKER2_SUBMIT%>";
                frm.action = 'CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_MAKER2_SUBMIT%>';
                frm.submit();
            } else if (num == 3) {
                frm.indexID.value = "-1";
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPCREDITGRADE%>";
                frm.submit();
            } else if (num == 4) {
                frm.event.value = "itemDelete2";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPCREDITGRADE%>";
                frm.submit();
            } else if (num == 5) {
                frm.indexID.value = "-1";
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPSUBLIMIT%>";
                frm.submit();
            } else if (num == 6) {
                frm.event.value = "itemDelete2";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPSUBLIMIT%>";
                frm.submit();
            } else if (num == 7) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPMEMBER%>";
                frm.submit();
            } else if (num == 8) {
                frm.event.value = "itemDelete2";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPMEMBER%>";
                frm.submit();
            } else if (num == 9) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPGROUP%>";
                frm.submit();
            } else if (num == 10) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE2%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPCREDITGRADE%>";
                frm.submit();
            } else if (num == 11) {
                frm.indexID.value = "-1";
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPOTRLIMIT%>";
                frm.submit();
            } else if (num == 12) {
                frm.event.value = "itemDelete2";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPOTRLIMIT%>";
                frm.submit();
            } else {
                alert("Check the submit")
            }
        }

        function fnCance() {
            var frm = document.forms[0];
            frm.action = 'CustGrpIdentifier.do?event=view_return';
            frm.submit();
        }
           
        function fnRefresh() {
            if(document.forms[0].internalLmt.value == '<%=CustGroupUIHelper.INT_LMT_ABSOLUTE%>')
            {
                document.forms[0].groupLmt.readOnly = false;
            } else if(document.forms[0].internalLmt.value!=""
                    && (document.forms[0].internalLmt.value != '<%=CustGroupUIHelper.INT_LMT_ABSOLUTE%>')){
                document.forms[0].action = "CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_PREPARE2_UPDATE%>";
                document.forms[0].submit()
            }
        }
    </script>
</head>

<body>

<html:form action="CustGrpIdentifier.do">

<html:hidden property="masterGroupEntityID"/>
<html:hidden property="event"/>
<html:hidden property="itemType"/>
<input type="hidden" name="indexID"/>

<table width="100%" id="window" border="0" cellpadding="0" cellspacing="0">
<tr>
<td>
<table width="98%" align="center">
    <tr>
        <td><h3><bean:message key="title.custgrpi.custgrp"/> - Edit </h3></td>
    </tr>

    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>

<!--For View Group  -->
<%@ include file="view_group_fields.jsp" %>

<!--For View  mgel  -->
<%@ include file="edit_group_mgel_fields.jsp" %>

<!-- For Group Sub Limit -->
<%@ include file="groupsublimit/edit_group_sub_limit_list.jsp" %>

<!-- For Group Other Limit -->
<%@ include file="groupotrlimit/edit_group_other_limit_list.jsp" %>

<!--For Group Credit Grades -->
<%@ include file="groupcreditgrade/view_groupcreditgrade_list.jsp" %>

<% try { %>
<!-- For Group Member -->
<%@ include file="groupmember/view_group_member_list.jsp" %>

<%
    } catch (Exception e) {
        System.out.println("Error in maker2_edit_custgrpi.jsp (edit_group_members_list.jsp) = " + e);
    }
%>

<%
    String checkStatus = "";
    boolean isRemarksNedded = false;
    if (itrxValue != null && itrxValue.getStatus() != null) {
        checkStatus = itrxValue.getStatus();
        System.out.println("itrxValue.getTransactionID() = " + itrxValue.getTransactionID() + ", Status=" + itrxValue.getStatus());
        if (ICMSConstant.STATE_REJECTED.equals(itrxValue.getStatus())) {
            isRemarksNedded = true;
        }
    }

%>

<% if (isRemarksNedded) { %>
<br><br>
<table id="tblExchange" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblinfo"
       style="margin-top:0">
    <tr>
        <td class="fieldname"><bean:message key="label.security.remarks"/></td>
        <td class="even"><html:textarea property="description" rows="3" cols="120"/>&nbsp;
            <html:errors property="remarks"/></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
        <td class="odd">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
    </tr>
        <%--<tr class="odd">
          <td class="fieldname">Last Updated Date</td>
          <td>&nbsp;<integro:date object="<%=lastUpdateDate%>"/></td>
        </tr>--%>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
        <td><%=lastRemarks%>&nbsp;</td>
    </tr>
</table>
<br><br>
<%}%>

<table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr align="center">
        <td><a href="javascript:submitPage('2')" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)">
            <img src="img/submit1.gif" name="Image142" width="75" height="22" border="0" id="Image142"/></a>
        </td>
        <td><a href="javascript:submitPage('1')" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image41','','img/save2.gif',1)">
            <img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4"/></a>
        </td>
        <td>
            <% if (ICMSConstant.STATE_DRAFT.equals(checkStatus) || ICMSConstant.STATE_REJECTED.equals(checkStatus)) { %>
            <a href="ToDo.do"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image51" border="0" id="Image52"/></a>
            <% } else { %>
            <a href="#"
               onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0" id="Image42"
                     onclick="fnCance();"/>
                    <%--<a href="CustGrpIdentifier.do?event=read&grpID=<%=grpID%>"--%>
                    <%--onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">--%>
                    <%--<img src="img/cancel1.gif" name="Image51" border="0" id="Image51" /></a>--%>
                    <% } %>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</td>
</tr>
</table>
</html:form>
<script type="text/javascript">
    document.forms[0].isBGELInd[0].disabled = false;

    <%
        //Andy Wong, 4 July 2008: we dont allow user to switch BGEL indicator when sub limit exists
        //educate user to remove all sub limit
        if(!ArrayUtils.isEmpty(stagingObj.getGroupSubLimit())) {
    %>
        document.forms[0].isBGELInd[1].disabled = true;
        document.forms[0].isBGELInd[0].checked = true;
    <%  } %>

    if(document.forms[0].isBGELInd[0].checked)
    {
        switchBGEL(false);
        if(document.forms[0].internalLmt.value == '<%=CustGroupUIHelper.INT_LMT_ABSOLUTE%>')
            document.forms[0].groupLmt.readOnly = false;
    }
    else
        switchBGEL(true);
</script>
</body>
</html>


