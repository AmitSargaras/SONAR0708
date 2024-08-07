<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.manualinput.aa.RatingList"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICommonUser user1 = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam1 = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    boolean isGEMSMAKER1 = CustGrpIdentifierUIHelper.isGEMSMAKER(userTeam1, user1)  ;

%>

<script type="text/javascript">
<!--
    function fnViewGroupCreditGrade(from_event,event, counter) {
        var frm = document.forms[0];
        frm.itemType.value = "<%=CustGroupUIHelper.GROUPCREDITGRADE%>";
        frm.action="CustGrpIdentifier.do?from_event="+from_event+"&event=<%=CustGrpIdentifierAction.EVENT_PREPARE2%>&indexID="+counter;
        frm.submit();
    }
-->
</script>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.credit.grades"/></h3></td>
        </tr>
        <tr>
            <td>
                <hr/>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                    <tbody>
                        <tr>
                            <td>
                            <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0" width="100%">
                                <thead>
                                    <tr>
                                        <td width="3%"  align="center"><bean:message key="label.global.sn"/> </td>
                                        <td width="15%" align="center"><bean:message key="label.group.credit.type" /></td>
                                        <td width="15%" align="center"><bean:message key="label.group.credit.rating" /><span class="mandatory"> * </span></td>
                                        <td width="18%" align="center"><bean:message key="label.group.credit.ratingdate" /><span class="mandatory"> * </span></td>
                                        <td width="15%" align="center"><bean:message key="label.group.credit.exp.trend" /></td>
                                        <td width="36%" class="tblinfo"><bean:message key="label.group.credit.reason"/> </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String from_event_for_grpCredit = event  ;
                                        IGroupCreditGrade[] grpCreditList = stagingObj.getGroupCreditGrade();
                                        if (grpCreditList != null && grpCreditList.length > 0) {
                                            for (int counter = 0; counter < grpCreditList.length; counter++) { %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpCreditList[counter].getTypeCD(), ICMSUIConstant.RATING_TYPE)%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=CustGrpIdentifierUIHelper.getCodeDesc(grpCreditList[counter].getRatingCD(), ICMSUIConstant.CREDIT_GRADE_RATING)%>" />&nbsp;</td>
                                            <td><%  if (grpCreditList[counter].getRatingDt() != null){  %>
                                                    <integro:date object="<%=grpCreditList[counter].getRatingDt()%>"/>
                                               <% }else{%>
                                                -
                                                <%}%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpCreditList[counter].getExpectedTrendRating()%>"/>&nbsp;</td>
                                            <td>
                                                <integro:empty-if-null value="<%=grpCreditList[counter].getReason()%>"/>&nbsp;

<%--                                                <%--%>
<%--                                                    if (isGEMSMAKER1 && (--%>
<%--                                                          "maker2_edit".equals(event) ||--%>
<%--                                                          "maker2_edit_return".equals(event) ||--%>
<%--                                                          "process2_update".equals(event) ||--%>
<%--                                                          "process2_update_return".equals(event) ||--%>
<%--                                                          "prepare2_update".equals(event)--%>
<%--                                                        )--%>
<%--                                                        ){ %>--%>
<%--                                                    <a href="javascript:fnViewGroupCreditGrade('<%=from_event_for_grpCredit%>','read','<%=counter%>')">View</a>--%>
<%--                                                 <%}else{%>--%>
<%--                                                    <a href="GroupCreditGrade.do?from_event=<%=from_event_for_grpCredit%>&event=read&indexID=<%=counter%>">View</a>--%>
<%--                                                  <%}%>--%>
                                                </td>
                                       </tr>
                                    <%
                                        }
                                    } else {
                                           // System.out.println("groupcreditgrade no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="6"><bean:message key="label.group.credit.norecord" /> </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

