<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupOtrLimit" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierForm" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="java.util.Date" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.other.limit"/></h3></td>
        </tr>
        <tr align="right">
            <td>
                <input class="btnNormal" type="button" name="Submit1" value="Add New"
                       onclick="javascript:submitPage(11)"/>&nbsp;
                <input class="btnNormal" type="button" name="Submit2" value="Remove"
                       onclick="javascript:submitPage(12)"/>
            </td>
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
                                <html:errors property="groupOtherLimitListSelect"/>
                                <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0"
                                       width="100%">
                                    <thead>
                                        <tr>
                                            <td width="3%" align="center"><bean:message key="label.global.sn"/></td>
                                            <td width="15%" align="center"><bean:message key="label.group.other.limit.type"/></td>
                                            <td width="12%" align="center"><bean:message key="label.group.description"/></td>
                                            <td width="12%" align="center"><bean:message key="label.group.other.limit.amount"/></td>
                                            <td width="18%" align="center"><bean:message key="label.group.other.limit.last.reviewed.date"/></td>
                                            <td width="20%" class="tblinfo"><bean:message key="label.security.remarks"/></td>
                                            <td width="10%" class="tblinfo"><bean:message key="label.global.action"/></td>
                                            <td width="10%"><bean:message key="label.global.delete"/></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            IGroupOtrLimit[] grpOtrLimitlist = stagingObj.getGroupOtrLimit();
                                            if (grpOtrLimitlist != null && grpOtrLimitlist.length > 0) {
                                                for (int counter = 0; counter < grpOtrLimitlist.length; counter++) { %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%>
                                            </td>
                                            <td ><%=CustGrpIdentifierUIHelper.getCodeDesc(grpOtrLimitlist[counter].getOtrLimitTypeCD(), ICMSUIConstant.OTR_LIMIT_TYPE)%>&nbsp;</td>
                                            <td ><%=CustGrpIdentifierUIHelper.getCodeDesc(grpOtrLimitlist[counter].getDescription(), ICMSUIConstant.OTR_LIMIT_DESC)%>&nbsp;</td>
                                            <td>
                                                <% if (grpOtrLimitlist[counter].getLimitAmt() != null
                                                        && grpOtrLimitlist[counter].getLimitAmt().getCurrencyCode() != null
                                                        && grpOtrLimitlist[counter].getLimitAmt().getAmount() > 0) { %>
                                                <integro:empty-if-null value="<%=grpOtrLimitlist[counter].getCurrencyCD()%>"/>
                                                <integro:amount param="amount" amount="<%=grpOtrLimitlist[counter].getLimitAmt()%>"/>
                                                <%} %>
                                                &nbsp;</td>
                                            <td><% if (grpOtrLimitlist[counter].getLastReviewedDt() != null) { %>
                                                <integro:date
                                                        object="<%=grpOtrLimitlist[counter].getLastReviewedDt()%>"/>
                                                <% }%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpOtrLimitlist[counter].getRemarks()%>"/>&nbsp;</td>
                                            <td width="10%"><a
                                                    href="GroupOtrLimit.do?from_even=prepare_create&event=prepare_update&indexID=<%=counter%>">Edit</a>
                                            </td>
                                            <td width="5%">
                                                <input type="checkbox" name="deleteItem"
                                                       value="<%=String.valueOf(counter)%>"/>
                                            </td>
                                        </tr>
                                        <%

                                            }
                                        } else {
                                            //System.out.println("Group Other Limit -->no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="8"><bean:message key="label.group.other.limit.norecord"/></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                </table>
                <html:errors property="hasLimitBookOthErr"/>
            </td>
        </tr>
    </tbody>
</table>

