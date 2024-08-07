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
                                    </tr>
                                </thead>
                                <%
                                    if (stagingObj.getGroupOtrLimit() != null || actualObj.getGroupOtrLimit() != null) {
                                        List othLmtCompList = CompareOBUtil.compOBArray(stagingObj.getGroupOtrLimit(), actualObj.getGroupOtrLimit());
                                        pageContext.setAttribute("othLmtCompList", othLmtCompList);
                                    }
                                %>
                                <logic:present name="othLmtCompList">
                                <tbody>
                                    <logic:iterate name="othLmtCompList" id="element" indexId="ind" type="com.integrosys.base.techinfra.diff.CompareResult">
                                    <%
                                        IGroupOtrLimit otrLimit = (IGroupOtrLimit) element.getObj();
                                        String rowClass = (ind.intValue()%2==0?"odd":"even");
                                    %>
                                        <tr class="<%=rowClass%>">
                                            <td class="<%=element.getKey()%>"><%=ind.intValue() + 1%></td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(otrLimit.getOtrLimitTypeCD(), ICMSUIConstant.OTR_LIMIT_TYPE)%>&nbsp;</td>
                                            <td><%=CustGrpIdentifierUIHelper.getCodeDesc(otrLimit.getDescription(), ICMSUIConstant.OTR_LIMIT_DESC)%>&nbsp;</td>
                                            <td> <% if (otrLimit.getLimitAmt() != null
                                                      && otrLimit.getLimitAmt().getCurrencyCode() != null
                                                      && otrLimit.getLimitAmt().getAmount() >0){ %>
                                                <integro:empty-if-null value="<%=otrLimit.getCurrencyCD()%>"/>
                                                <integro:amount param="amount" amount="<%=otrLimit.getLimitAmt()%>"/>
                                                <%} %>
                                                &nbsp;</td>
                                            <td><%  if (otrLimit.getLastReviewedDt() != null){  %>
                                                    <integro:date object="<%=otrLimit.getLastReviewedDt()%>"/>
                                                <% }%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=otrLimit.getRemarks()%>"/>&nbsp;</td>
                                        </tr>
                                    </logic:iterate>
                                    <logic:empty name="othLmtCompList">
                                        <tr class="odd">
                                            <td colspan="6"> <bean:message key="label.group.other.limit.norecord" /></td>
                                        </tr>
                                    </logic:empty>
                                </tbody>
                                </logic:present>
                                <logic:notPresent name="othLmtCompList">
                                    <tr class="odd">
                                        <td colspan="6"> <bean:message key="label.group.other.limit.norecord" /></td>
                                    </tr>
                                </logic:notPresent>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

