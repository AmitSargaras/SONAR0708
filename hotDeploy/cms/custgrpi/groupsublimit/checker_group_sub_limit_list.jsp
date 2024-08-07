<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupSubLimit"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>


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
                                <%
                                    if (stagingObj.getGroupSubLimit() != null || actualObj.getGroupSubLimit() != null) {
                                        List subLmtCompList = CompareOBUtil.compOBArray(stagingObj.getGroupSubLimit(), actualObj.getGroupSubLimit());
                                        pageContext.setAttribute("subLmtCompList", subLmtCompList);
                                    }
                                %>
                                <logic:present name="subLmtCompList">
                                    <tbody>
                                        <logic:iterate name="subLmtCompList" id="element" indexId="ind" type="com.integrosys.base.techinfra.diff.CompareResult">
                                            <%
                                                IGroupSubLimit subLimit = (IGroupSubLimit) element.getObj();
                                                String rowClass = (ind.intValue()%2==0?"odd":"even");
                                            %>
                                            <tr class="<%=rowClass%>">
                                                <td class="<%=element.getKey()%>"><%=ind.intValue() + 1%></td>
                                                <td><integro:empty-if-null value="<%=CustGrpIdentifierUIHelper.getCodeDesc(subLimit.getSubLimitTypeCD(), ICMSUIConstant.SUB_LIMIT_TYPE) %>"/>&nbsp;</td>
                                                <td><integro:empty-if-null value="<%=CustGrpIdentifierUIHelper.getCodeDesc(subLimit.getDescription(), ICMSUIConstant.SUB_LIMIT_DESC) %>"/>&nbsp;</td>
                                                <td> <% if (subLimit.getLimitAmt() != null
                                                          && subLimit.getLimitAmt().getCurrencyCode() != null
                                                          && subLimit.getLimitAmt().getAmount() >0){ %>
                                                    <integro:empty-if-null value="<%=subLimit.getCurrencyCD()%>"/>
                                                    <integro:amount param="amount" amount="<%=subLimit.getLimitAmt()%>"/>
                                                    <%} %>
                                                    &nbsp;</td>
                                                <td><%  if (subLimit.getLastReviewedDt() != null){  %>
                                                        <integro:date object="<%=subLimit.getLastReviewedDt()%>"/>
                                                    <% }%>&nbsp;</td>
                                                <td><integro:empty-if-null value="<%=subLimit.getRemarks()%>"/>&nbsp;</td>
                                            </tr>
                                        </logic:iterate>
                                        <logic:empty name="subLmtCompList">
                                            <tr class="odd">
                                                <td colspan="6"> <bean:message key="label.group.limit.norecord" /></td>
                                            </tr>
                                        </logic:empty>
                                    </tbody>
                                </logic:present>
                                <logic:notPresent name="subLmtCompList">
                                    <tr class="odd">
                                        <td colspan="6"> <bean:message key="label.group.limit.norecord" /></td>
                                    </tr>
                                </logic:notPresent>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

