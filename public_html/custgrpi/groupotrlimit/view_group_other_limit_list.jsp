<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupOtrLimit" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.other.limit" /></h3></td>

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
                                        <td width="15%" align="center"><bean:message key="label.group.other.limit.type" /></td>
                                        <td width="22%" align="center"><bean:message key="label.group.description" /> </td>
                                        <td width="12%" align="center"><bean:message key="label.group.other.limit.amount" /></td>
                                        <td width="18%" align="center"><bean:message key="label.group.other.limit.last.reviewed.date" /></td>
                                        <td width="30%" class="tblinfo"><bean:message key="label.security.remarks" /></td>
                                        <%--<td width="10%" class="tblinfo"><bean:message key="label.global.action"/> </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        IGroupOtrLimit[] grpOtrLimitlist = stagingObj.getGroupOtrLimit();
                                        if (grpOtrLimitlist != null && grpOtrLimitlist.length > 0) {
                                            for (int counter = 0; counter < grpOtrLimitlist.length; counter++) {
                                    %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpOtrLimitlist[counter].getOtrLimitTypeCD(), ICMSUIConstant.OTR_LIMIT_TYPE)%>&nbsp;</td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpOtrLimitlist[counter].getDescription(), ICMSUIConstant.OTR_LIMIT_DESC)%>&nbsp;</td>
                                            <td> <% if (grpOtrLimitlist[counter].getLimitAmt() != null
                                                      && grpOtrLimitlist[counter].getLimitAmt().getCurrencyCode() != null
                                                      && grpOtrLimitlist[counter].getLimitAmt().getAmount() >0){ %>
                                                <integro:empty-if-null value="<%=grpOtrLimitlist[counter].getCurrencyCD()%>"/>
                                                <integro:amount param="amount" amount="<%=grpOtrLimitlist[counter].getLimitAmt()%>"/>
                                                <%} %>
                                                &nbsp;</td>
                                            <td><%  if (grpOtrLimitlist[counter].getLastReviewedDt() != null){  %>
                                                    <integro:date object="<%=grpOtrLimitlist[counter].getLastReviewedDt()%>"/>
                                                <% }%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpOtrLimitlist[counter].getRemarks()%>"/>&nbsp;</td>
                                            <%--<td><a href="GroupOtrLimit.do?from_event=<%=event%>&event=read&indexID=<%=counter%>">View</a></td>--%>
                                        </tr>
                                    <%

                                        }
                                    } else {
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="6"> <bean:message key="label.group.other.limit.norecord" /></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

