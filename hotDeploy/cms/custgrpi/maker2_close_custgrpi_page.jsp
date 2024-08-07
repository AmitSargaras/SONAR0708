<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    int rowIdx = 0;
    String event = (String) request.getAttribute("event");
    //System.out.println("event = " + event);
    //event="read";

    event = "maker2_close_cgid";

    ICustGrpIdentifier actualObj = null;
    ICustGrpIdentifier stagingObj = null;
    ICustGrpIdentifierTrxValue itrxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.service_groupTrxValue);
    CustGroupUIHelper.printChildMembers(itrxValue);
    String popTrxId = "";
    if (itrxValue != null) {
        popTrxId = itrxValue.getTransactionID();
        actualObj = itrxValue.getCustGrpIdentifier();
        stagingObj = itrxValue.getStagingCustGrpIdentifier();
    } else {
        //  System.out.println("itrxValue IS  NULL");
        stagingObj = new OBCustGrpIdentifier();

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
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript">
        <!--
         function fnCance(){
               var frm = document.forms[0];
               frm.action ="ToDo.do" ;
               frm.submit();
        }

        function closeEditRejected() {
            var frm = document.forms[0];
            frm.event.value = "close"
            frm.action ="CustGrpIdentifier.do?event=maker2_close_cgid_confirm";
            frm.submit();
        }
        -->
    </script>
</head>

<body>

<html:form action="CustGrpIdentifier.do?event=maker_close_cgid">
    <input type="hidden" name="event"/>

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
        </thead>
        <tr>
            <td>
                <table height="50" width="98%" align="center">
                    <tr>
                        <td><h3><bean:message key="title.custgrpi.custgrp"/> - Close </h3></td>
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
                <%@ include file="view_group_mgel_fields.jsp" %>

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
    </table>


    <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" colspan="4">&nbsp;</td>
            <td align="center" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <a href="#" onclick="closeEditRejected()" onmouseout="MM_swapImgRestore()"
                   onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)">
                    <img src="img/close1a.gif" name="Image8" border="0" id="Image8"/></a>
            </td>
            <td><a href="#"
                   onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image42" border="0" id="Image42"
                     onclick="fnCance();"/>
            </a>
            </td>

        </tr>
    </table>

</html:form>
</body>
</html>
