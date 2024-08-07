<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupSubLimit" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.sub.limit"/> </h3></td>
        </tr>
        <tr align="right">
            <td>
                <input class="btnNormal" type="button" name="Submit1" value="Add New" onclick="javascript:submitPage(5)"/>&nbsp;
                <input class="btnNormal" type="button" name="Submit2" value="Remove" onclick="javascript:submitPage(6)"/>
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
                            <html:errors property="groupSubLimitListSelect"/>
                            <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0" width="100%">
                                <thead>
                                    <tr>
                                        <td width="3%"  align="center"><bean:message key="label.global.sn"/> </td>
                                        <td width="15%" align="center"><bean:message key="label.group.sub.limit.type" /></td>
                                        <td width="12%" align="center"><bean:message key="label.group.description" /> </td>
                                        <td width="12%" align="center"><bean:message key="label.group.limit.amount" /> </td>
                                        <td width="18%" align="center"><bean:message key="label.group.limit.last.reviewed.date" /> </td>
                                        <td width="20%" class="tblinfo"><bean:message key="label.security.remarks" /></td>
                                        <td width="10%" class="tblinfo"><bean:message key="label.global.action"/> </td>
                                        <td width="10%"><bean:message key="label.global.delete"/> </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        IGroupSubLimit[] grpSubLimitlist = stagingObj.getGroupSubLimit();
                                        if (grpSubLimitlist != null && grpSubLimitlist.length > 0) {
                                            //System.out.println("grpSubLimitlist.length = " + grpSubLimitlist.length);
                                            for (int counter = 0; counter < grpSubLimitlist.length; counter++) { %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td ><%=CustGrpIdentifierUIHelper.getCodeDesc(grpSubLimitlist[counter].getSubLimitTypeCD(), ICMSUIConstant.SUB_LIMIT_TYPE)%>&nbsp;</td>
                                            <td ><%=CustGrpIdentifierUIHelper.getCodeDesc(grpSubLimitlist[counter].getDescription(), ICMSUIConstant.SUB_LIMIT_DESC)%>&nbsp;</td>
                                            <td>
                                                <% if (grpSubLimitlist[counter].getLimitAmt() != null
                                                      && grpSubLimitlist[counter].getLimitAmt().getCurrencyCode() != null
                                                      && grpSubLimitlist[counter].getLimitAmt().getAmount() >0){ %>
                                                <integro:empty-if-null value="<%=grpSubLimitlist[counter].getCurrencyCD()%>"/>
                                                <integro:amount param="amount" amount="<%=grpSubLimitlist[counter].getLimitAmt()%>"/>
                                                <%} %>
                                                &nbsp;</td>
                                            <td ><%  if (grpSubLimitlist[counter].getLastReviewedDt() != null){  %>
                                                <integro:date object="<%=grpSubLimitlist[counter].getLastReviewedDt()%>"/>
                                                <% }%>&nbsp;</td>
                                            <td ><integro:empty-if-null value="<%=grpSubLimitlist[counter].getRemarks()%>"/>&nbsp;</td>
                                            <td width="10%"><a href="GroupSubLimit.do?from_even=prepare_create&event=prepare_update&indexID=<%=counter%>">Edit</a></td>
                                            <td width="5%">
                                                <input type="checkbox"  name="deleteItem"  value="<%=String.valueOf(counter)%>"/>
                                            </td>
                                        </tr>
                                    <%

                                        }
                                    } else {
                                            //System.out.println("Group Sub Limit -->no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="8"> <bean:message key="label.group.limit.norecord" /></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                </table>
                <html:errors property="hasLimitBookSubErr"/>
            </td>
        </tr>
    </tbody>
</table>

