<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="java.util.Date" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%

    int rowIdx = 0;
    String event = (String) request.getAttribute("event");
    String eventName = "Create";

    //System.out.println("event = " + event);
    String lastActionBy = "";
    String lastRemarks = "";
    Date lastUpdateDate = null;
    ;
    ICustGrpIdentifier stagingObj = null;
    ICustGrpIdentifier actualObj = null;
    String check = "1";
    ICustGrpIdentifierTrxValue itrxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.service_groupTrxValue);
    //CustGroupUIHelper.printChildMembersAct(itrxValue);
    if (itrxValue != null) {
        actualObj = itrxValue.getCustGrpIdentifier();
        stagingObj = itrxValue.getStagingCustGrpIdentifier();
        // Get transaction user and date
        lastActionBy = itrxValue.getUserInfo();
        lastUpdateDate = itrxValue.getTransactionDate();
        lastRemarks = itrxValue.getRemarks();

        DefaultLogger.debug(this, "userId = " + lastActionBy);
        DefaultLogger.debug(this, "lastUpdateDate = " + lastUpdateDate);
    } else {
        //   System.out.println("itrxValue IS  NULL");
        stagingObj = new OBCustGrpIdentifier();

    }

    if (stagingObj == null) {
        stagingObj = new OBCustGrpIdentifier();
    }

    CustGrpIdentifierForm aForm = (CustGrpIdentifierForm) request.getAttribute("CustGrpIdentifierForm");

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

    if (ICMSConstant.LONG_INVALID_VALUE != stagingObj.getGrpID()) {
        if ("update_return".equals(event) || "edit".equals(event)
                || "maker_edit_cgid_reject".equals(event)) {
            eventName = "Update";
        }
    }
    if (!"-".equals(grpID)) {
        eventName = "Update";
    }
    String cancel_event = "";
    if ("process_update".equals(event)) {
        cancel_event = "ToDo.do";
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
    <script type="text/javascript">

        function submitPage(num) {
            // alert(num) ;
            var frm = document.forms[0];
            if (num == 1) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_SAVE%>";
                //frm.action = 'CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_SAVE%>';
                frm.submit();
            } else if (num == 2) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_SUBMIT%>";
                //frm.action = 'CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_SUBMIT%>';
                frm.submit();
            } else if (num == 3) {
                frm.indexID.value = "-1";
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPCREDITGRADE%>";
                frm.submit();
            } else if (num == 4) {
                frm.event.value = "itemDelete";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPCREDITGRADE%>";
                frm.submit();
            } else if (num == 5) {
                frm.indexID.value = "-1";
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPSUBLIMIT%>";
                frm.submit();
            } else if (num == 6) {
                frm.event.value = "itemDelete";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPSUBLIMIT%>";
                frm.submit();
            } else if (num == 7) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPMEMBER%>";
                frm.submit();
            } else if (num == 8) {
                frm.event.value = "itemDelete";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPMEMBER%>";
                frm.submit();
            } else if (num == 9) {
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPGROUP%>";
                frm.submit();
            } else if (num == 11) {
                frm.indexID.value = "-1";
                frm.event.value = "<%=CustGrpIdentifierAction.EVENT_PREPARE%>";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPOTRLIMIT%>";
                frm.submit();
            } else if (num == 12) {
                frm.event.value = "itemDelete";
                frm.itemType.value = "<%=CustGroupUIHelper.GROUPOTRLIMIT%>";
                frm.submit();
            } else {
                alert("Check the submit")
            }
        }

        function fnCance() {
            var frm = document.forms[0];
            frm.action = 'CustGrpIdentifier.do?event=view_return';
            //frm.action = "ToDo.do?isMenu=Y&startIndex=0";
            frm.submit();
        }

        function removeOptionNonSelected(option)
        {
            var elSel = document.getElementById(option);
            var i;
            for (i = elSel.length - 1; i >= 0; i--) {
                if (!elSel.options[i].selected) {
                    elSel.remove(i);
                }
            }
        }
    </script>
</head>

<body>

<%@include file="/common/mandatory_for_submission_note.jsp" %>


<html:form action="CustGrpIdentifier.do">

<html:hidden property="grpNo"/>
<html:hidden property="masterGroupEntityID"/>
<html:hidden property="event"/>
<html:hidden property="itemType"/>
<input type="hidden" name="indexID"/>

<table width="100%" id="window" border="0" cellpadding="0" cellspacing="0">
<tr>
<td>
<table width="98%" align="center">
    <tr>
        <td><h3><bean:message key="title.custgrpi.custgrp"/> - <%out.write(eventName);%></h3></td>
    </tr>

    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>

<%@ include file="edit_group_fields.jsp" %>

<%@ include file="edit_group_mgel_fields.jsp" %>

<!-- For Group Sub Limit -->
<%@ include file="groupsublimit/view_group_sub_limit_list.jsp" %>

<!-- For Other Limit -->
<%@ include file="groupotrlimit/view_group_other_limit_list.jsp" %>

<!--For Group Credit Grades -->
<%@ include file="groupcreditgrade/edit_groupcreditgrade_list.jsp" %>

<% try { %>
<!-- For Group Member -->
<%@ include file="groupmember/edit_group_members_list.jsp" %>
<%
    } catch (Exception e) {
        System.out.println("Error in edit_custgrpi.jsp (edit_group_members_list.jsp) = " + e);
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
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.security.remarks"/></td>
        <td><html:textarea property="description" rows="3" cols="120"/>&nbsp;
            <html:errors property="remarks"/></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
        <td>&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
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
<p align="center"><html:errors property="errorGrpNameExist"/></p>
<table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr align="center">
        <td><a href="javascript:submitPage('2')"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)">
            <img src="img/submit1.gif" name="Image142" border="0" id="Image142"/></a>
        </td>
        <td><a href="javascript:submitPage('1')"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)">
            <img src="img/save1.gif" name="Image41" border="0" id="Image4"/></a>
        </td>
        <td>        
            <% if (ICMSConstant.STATE_DRAFT.equals(checkStatus) || ICMSConstant.STATE_REJECTED.equals(checkStatus)) { %>
            <a href="ToDo.do"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image51" border="0" id="Image52"/></a>
            <% } else if("".equals(checkStatus) || ICMSConstant.STATE_ND.equals(checkStatus)){ %>
            <a href="Welcome.do?event=prepare"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image51" border="0" id="Image54"/></a>
            <% } else {%>
                <a href="#"
               onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0" id="Image42"
                     onclick="fnCance();"/>
                <%--<a href="CustGrpIdentifier.do?event=read&grpID=<%=grpID%>"--%>
                <%--onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">--%>
                <%--<img src="img/cancel1.gif" name="Image51" border="0" id="Image53" /></a>--%>
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
</body>
</html>

<script type="text/javascript">
    var frm = document.forms[0];
    <%
    if(isEditable)
    {
    %>
        if(frm.isBGELInd[0].checked)
            frm.isBGELInd[1].disabled = true;
        else
            frm.isBGELInd[0].disabled = true;

        if(frm.currencyCD.value=="")
            frm.currencyCD.disabled = true;
        else
            removeOptionNonSelected("currencyCD");

        if(frm.internalLmt.value=="")
            frm.internalLmt.disabled = true;
        else
            removeOptionNonSelected("internalLmt");

        frm.Image723.style.display = "none";
        frm.groupLmt.readOnly = true;
        frm.groupRemarks.readOnly = true;
    <%
    }
    %>
</script>


