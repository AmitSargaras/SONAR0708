<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.CountryList" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.*" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.OBCustGrpIdentifierTrxValue" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<%

    System.out.println("Loading popview_custgrpi.jsp");
    String context = request.getContextPath() + "/";

    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    int rowIdx = 0;
    String event = (String) request.getParameter("event");
    String subGrpID = (String) request.getParameter("subGrpID");
    System.out.println("subGrpID = " + subGrpID);

    ICustGrpIdentifier stagingObj = null;

    if (subGrpID != null){

    }
    ICustGrpIdentifierTrxValue itrxValue = new OBCustGrpIdentifierTrxValue();   // (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.popup_service_groupTrxValue);

    if (subGrpID != null){
        itrxValue = CustGroupUIHelper.getTransValueByGroupId(subGrpID);
    }
    CustGroupUIHelper.printChildMembers(itrxValue);
    if (itrxValue != null){
         stagingObj = itrxValue.getCustGrpIdentifier();
    }
    String grpNo = "-";
    if (stagingObj != null && stagingObj.getGrpNo() != ICMSConstant.LONG_INVALID_VALUE){
        grpNo = String.valueOf(stagingObj.getGrpNo());
    }
    if (stagingObj == null){
        stagingObj = new OBCustGrpIdentifier();
    }

%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="<%=context%>calendar-blue.css" />

    <script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>


</head>

<body>
<%@include file="/common/mandatory_for_submission_note.jsp" %>

<DIV style="overflow: auto;width:750;height:600;scrollbar:true;">
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
                    <!--For View Group  -->
                    <%@ include file="../view_group_fields.jsp" %>

                    <!--For View  mgel  -->
                    <%@ include file="popupview_bgel.jsp" %>

                    <!-- Group Sub Limit -->
                    <%@ include file="../groupsublimit/view_group_sub_limit_list.jsp" %>

                    <!-- For Other Limit -->
                    <%@ include file="../groupotrlimit/view_group_other_limit_list.jsp" %>

                    <!-- Group Credit Grades -->
                    <%@ include file="popview_groupcreditgrade_list.jsp" %>

                    <!-- Group Member -->
                    <%@ include file="popview_group_member_list.jsp" %>
                </td>
            </tr>
        </table>


        <p align="center">
            <a href="#">
                <img src="<%=context%>img/closeb.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="window.close();"/>
            </a>
        </p>

    </html:form>
</DIV>
</body>
</html>
