<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupSubLimit"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.sub.limit" /></h3></td>

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
                                        <td width="15%" align="center"><bean:message key="label.group.sub.limit.type" /></td>
                                        <td width="22%" align="center"><bean:message key="label.group.description" /> </td>
                                        <td width="12%" align="center"><bean:message key="label.group.limit.amount" /></td>
                                        <td width="18%" align="center"><bean:message key="label.group.limit.last.reviewed.date" /></td>
                                        <td width="30%" class="tblinfo"><bean:message key="label.security.remarks" /></td>
                                        <%--<td width="10%" class="tblinfo"><bean:message key="label.global.action"/> </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        IGroupSubLimit[] grpSubLimitlist = stagingObj.getGroupSubLimit();
                                        if (grpSubLimitlist != null && grpSubLimitlist.length > 0) {
                                            for (int counter = 0; counter < grpSubLimitlist.length; counter++) {
                                                //System.out.println("grpSubLimit GroupSubLimitIDRef = " + grpSubLimitlist[counter].getGroupSubLimitIDRef());
                                    %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpSubLimitlist[counter].getSubLimitTypeCD(), ICMSUIConstant.SUB_LIMIT_TYPE)%>&nbsp;</td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(grpSubLimitlist[counter].getDescription(), ICMSUIConstant.SUB_LIMIT_DESC)%>&nbsp;</td>
                                            <td> <% if (grpSubLimitlist[counter].getLimitAmt() != null
                                                      && grpSubLimitlist[counter].getLimitAmt().getCurrencyCode() != null
                                                      && grpSubLimitlist[counter].getLimitAmt().getAmount() >0){ %>
                                                <integro:empty-if-null value="<%=grpSubLimitlist[counter].getCurrencyCD()%>"/>
                                                <integro:amount param="amount" amount="<%=grpSubLimitlist[counter].getLimitAmt()%>"/>
                                                <%} %>
                                                &nbsp;</td>
                                            <td><%  if (grpSubLimitlist[counter].getLastReviewedDt() != null){  %>
                                                    <integro:date object="<%=grpSubLimitlist[counter].getLastReviewedDt()%>"/>
                                                <% }%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpSubLimitlist[counter].getRemarks()%>"/>&nbsp;</td>
                                            <%--<td><a href="GroupSubLimit.do?from_event=<%=event%>&event=read&indexID=<%=counter%>">View</a></td>--%>
                                            <%--<td><a href="GroupSubLimit.do?from_even=process_return&event=read&indexID=<%=counter%>">View</a></td>--%>
                                        </tr>
                                    <%

                                        }
                                    } else {
                                         //   System.out.println("Group Sub Limit -->no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="6"> <bean:message key="label.group.limit.norecord" /></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

