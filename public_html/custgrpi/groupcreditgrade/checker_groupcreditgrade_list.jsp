<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.manualinput.aa.RatingList"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBGroupCreditGrade"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


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
                                        IGroupCreditGrade[] grpCreditList_actualObj = actualObj.getGroupCreditGrade();

                                        CompareResult[] resultList_grade = new CompareResult[0];
                                        if (grpCreditList != null || grpCreditList_actualObj != null) {        //required for situations where there is no share checklists
                                            List res = CompareOBUtil.compOBArray(grpCreditList, grpCreditList_actualObj);
                                            resultList_grade = (CompareResult[]) res.toArray(new CompareResult[0]);
                                        }

                                        ArrayList GroupCreditGradeList = new ArrayList(Arrays.asList(resultList_grade));
                                        pageContext.setAttribute("GroupCreditGradeList", GroupCreditGradeList);

                                        %>

                                    <% if (GroupCreditGradeList == null || GroupCreditGradeList.size() == 0){ %>
                                <tr>
                                    <td colspan="6"><bean:message key="label.group.credit.norecord" /> </td>
                                </tr>
                                <% } else {
                                    int index = 0;
                                %>
                                <logic:present name="GroupCreditGradeList">
                                    <logic:iterate id="compResult" name="GroupCreditGradeList" type="com.integrosys.base.techinfra.diff.CompareResult">
                                        <%
                                            OBGroupCreditGrade obj = (OBGroupCreditGrade) compResult.getObj();
                                            String key   =  compResult.getKey() ;
                                           // System.out.println("key  = " + key);

                                        %>
                                        <tr class="<%=index%2==0?"odd":"even"%>">
                                            <td class="<%=key%>"><%=index + 1%></td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(obj.getTypeCD(), ICMSUIConstant.RATING_TYPE)%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=CustGrpIdentifierUIHelper.getCodeDesc(obj.getRatingCD(), ICMSUIConstant.CREDIT_GRADE_RATING)%>" /> &nbsp;</td>
                                            <td><%  if (obj.getRatingDt() != null){  %>
                                                    <integro:date object="<%=obj.getRatingDt()%>"/>
                                                <% }else{%>
                                                -
                                                <%}%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=obj.getExpectedTrendRating()%>"/>&nbsp;</td>

                                            <td>
<%--                                                    <a href="GroupCreditGrade.do?from_event=<%=from_event_for_grpCredit%>&status=<%=key%>&event=read&indexID=<%=index%>">View</a>--%>
                                                <integro:empty-if-null value="<%=obj.getReason()%>"/>&nbsp;                                                
                                            </td>
                                        </tr>
                                        <%index++;%>
                                    </logic:iterate>
                                </logic:present>
                                <% } %>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

