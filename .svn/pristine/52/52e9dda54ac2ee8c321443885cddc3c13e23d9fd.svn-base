<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.manualinput.aa.RatingList"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.credit.grades"/></h3>
            <td style="text-align:right" valign="baseline">
                <input class="btnNormal" type="button" name="Submit1" value="Add New Grade" onclick="javascript:submitPage(3)"/>&nbsp;
                <%--<input class="btnNormal" type="button" name="Submit2" value="Remove" onclick="javascript:submitPage(4)"/>--%>
            </td>
        </tr>
       <tr>
          <td colspan="2"><hr /> </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                    <tbody>
                        <tr>
                            <td>
                             <html:errors property="groupGroupCreditGradeListSelect"/>
                            <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0" width="100%">
                                <thead>
                                    <tr>
                                        <td width="3%"  align="center"><bean:message key="label.global.sn"/> </td>
                                        <td width="25%"  align="center"><bean:message key="label.group.credit.type" /></td>
                                        <td width="15%" align="center"><bean:message key="label.group.credit.rating" /><span class="mandatory"> * </span> </td>
                                        <td width="15%" align="center"><bean:message key="label.group.credit.ratingdate" /><span class="mandatory"> * </span></td>
                                        <td width="10%" align="center"><bean:message key="label.group.credit.exp.trend" /></td>
                                        <td width="15%" class="tblinfo"><bean:message key="label.global.action"/> </td>
                                        <%--<td width="10%"><bean:message key="label.remove"/> </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        IGroupCreditGrade[] grpCreditlist = stagingObj.getGroupCreditGrade();
                                        if (grpCreditlist != null && grpCreditlist.length > 0) {
                                        //Andy Wong, 2 July 2008: hide add grade button when item exists
                                    %>
                                        <script>document.forms[0].Submit1.disabled=true</script>
                                    <%
                                            for (int counter = 0; counter < grpCreditlist.length; counter++) {
                                                IGroupCreditGrade disGradeObj= grpCreditlist[counter] ;

                                    %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(disGradeObj.getTypeCD(), ICMSUIConstant.RATING_TYPE)%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=CustGrpIdentifierUIHelper.getCodeDesc(disGradeObj.getRatingCD(), ICMSUIConstant.CREDIT_GRADE_RATING)%>" />&nbsp;</td>
                                            <td ><%  if (disGradeObj.getRatingDt() != null ){%>
                                                <integro:date object="<%=disGradeObj.getRatingDt()%>"/>
                                                <% }else{%>
                                                -
                                                <%}%>&nbsp;</td>
                                            <td ><integro:empty-if-null value="<%=disGradeObj.getExpectedTrendRating()%>"/>&nbsp;</td>
                                            <td width="10%"><a href="GroupCreditGrade.do?from_even=prepare_create&event=prepare_update&indexID=<%=counter%>">Edit</a></td>
                                            <%--<td width="5%">--%>
                                                <%--<input type="checkbox"  name="deleteItem"  value="<%=String.valueOf(counter)%>"/>--%>
                                            <%--</td>--%>
                                        </tr>
                                    <%

                                        }
                                    } else {
                                           // System.out.println("GroupCreditGrade --> no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="7"> <bean:message key="label.group.credit.norecord" /></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

