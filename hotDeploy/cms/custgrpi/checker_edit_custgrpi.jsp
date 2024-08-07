<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);


    int rowIdx = 0;
    String event = (String) request.getAttribute("event");
    //System.out.println("event = " + event);

    event = "checker_edit_cgid";
    ICustGrpIdentifier actualObj = null;
    ICustGrpIdentifier stagingObj = null;
    ICustGrpIdentifierTrxValue trxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.service_groupTrxValue);

    if (trxValue == null) {
        trxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("global.SP_ICustGrpIdentifierTrxValue");
    }

    String popTrxId = "";
    if (trxValue != null) {
        System.out.println("trxValue is null");
        popTrxId = trxValue.getTransactionID();
        actualObj = trxValue.getCustGrpIdentifier();
        stagingObj = trxValue.getStagingCustGrpIdentifier();
    } else {

        stagingObj = new OBCustGrpIdentifier();
    }

    if (actualObj == null) {
        System.out.println("actualObj is null");
        actualObj = new OBCustGrpIdentifier();
    }


    String grpID = "-";
    if (actualObj != null && actualObj.getGrpID() != ICMSConstant.LONG_INVALID_VALUE) {
        grpID = String.valueOf(actualObj.getGrpID());
    }
    String grpNo = "-";
    if (stagingObj != null && stagingObj.getGrpNo() != ICMSConstant.LONG_INVALID_VALUE) {
        grpNo = String.valueOf(stagingObj.getGrpNo());
    }
//    CustGroupUIHelper.printDependantsRecords(stagingObj);

%>
<html>
<head>
     <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript">
        <!--
        function approvePage() {
            var frm = document.forms[0];
//            var chLegth =document.forms[0].description.value.length;
//            if (chLegth > 256){
//                alert("Remarks length should be between 0 and 255 characters.");
//            }else{
                frm.event.value ='checker_approve_edit_cgid';
                frm.action='CustGrpIdentifier.do';
                frm.submit();
//            }
        }

        function rejectPage() {
            var frm = document.forms[0];
//            var chLegth =document.forms[0].description.value.length;
//            if (chLegth > 256){
//                alert("Remarks length should be between 0 and 255 characters.");
//            }else{
                frm.event.value ='checker_reject_edit_cgid';
                frm.action='CustGrpIdentifier.do';
                frm.submit();
//             }
          
        }

        -->
    </script>
</head>

<body>
<%@include file="/common/mandatory_for_submission_note.jsp" %>


<html:form action="CustGrpIdentifier.do?event=checker_edit_cgid">

<input type="hidden" name="event" value="checker_approve_edit_cgid"/>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    </thead>
    <tr>
        <td>
            <table height="50" width="98%" align="center">
                <tr>
                    <td><h3><bean:message key="title.custgrpi.custgrp"/> - Process </h3></td>
                </tr>
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
            </table>

            <!--For View Group  by checker -->
            <%@ include file="checker_view_group_fields.jsp" %>

            <!--For View Group  by checker-->
            <%@ include file="checker2_group_mgel_fields.jsp" %>

            <!-- Group Sub Limit -->
            <%@ include file="groupsublimit/view_group_sub_limit_list.jsp" %>

            <!-- For Other Limit -->
            <%@ include file="groupotrlimit/view_group_other_limit_list.jsp" %>

            <!-- Group Credit Grades -->
            <%@ include file="groupcreditgrade/checker_groupcreditgrade_list.jsp" %>

            <!-- Group Member -->
            <%@ include file="groupmember/checker_group_member_list.jsp" %>

        </td>
    </tr>

    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>
                    <tr>
                        <td class="fieldname"><bean:message key="label.security.remarks"/></td>
                        <td class="odd"><html:textarea property="description" rows="3" cols="120"/><br>
                            <html:errors property="remarks"/></td>

                    </tr>
                    <tr>
                        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                        <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                        <td><integro:wrapper value="<%=trxValue.getRemarks()%>"/>&nbsp;</td>
                    </tr>

                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"><br>
            <p align="center"><html:errors property="errorGroupNameExist"/></p>
            <p align="center"><html:errors property="masterGroupErr"/></p>
            <%--
                String errorGroupNameExist = (String) request.getAttribute("errorGroupNameExist");
                if (errorGroupNameExist != null) {
                    out.print(CustGroupUIHelper.GROUP_NAME_EXIST);
                }
            --%>
        </td>
    </tr>

</table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
                src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8"/></a></td>
        <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
                src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9"/></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
                src="img/cancel1.gif" name="Image1" border="0" id="Image1"/></a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>
