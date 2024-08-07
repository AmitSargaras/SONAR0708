<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupMember"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3>Group Members</h3></td>
        </tr>
        <tr align="right">
            <td>
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
                                        <td width="3%"  align="center">S/N</td>
                                        <td width="15%" align="center">Entity / Group Name </td>
                                        <td width="10%" align="center">LE ID Source </td>
                                        <td width="10"  align="center">LE ID No. / Group ID </td>
                                        <td width="10%" align="center">ID No. </td>
                                        <td width="10%" align="center">Relationship </td>
                                        <td width="10%" align="center">% Owned </td>
                                        <td width="10%" align="center">Related Borrower /<br> Member Name </td>
                                        <td width="10%" align="center">Member Credit Rating </td>
                                        <td width="10%" class="tblinfo">Relationship</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String from_event_for_grpMember = event  ;
                                        IGroupMember[] grpMemberList = stagingObj.getGroupMember();
                                        if (grpMemberList != null && grpMemberList.length > 0) {
                                            //System.out.println("list.length = " + grpMemberList.length);
                                            for (int counter = 0; counter < grpMemberList.length; counter++) { %>
                                        <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getEntity_GroupName()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getlEIDSource()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getLeID_GroupID()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getIdNo()%>"/>&nbsp;</td>
                                            <td>
                                                    <select name="relCD">
                                                        <option value="">Please Select</option>
                                                        <html:options name="relCDValue" labelName="relCDLabel"/>
                                                        </select>
                                                    <html:errors property="typeCD"/>


                                            </td>
                                            <td><input type="textbox"  name="relValue"></td>
                                            <td><input type="textbox"  name="relBorrower"></td>
                                            <td><input type="textbox"  name="membersCreditRating"></td>
                                            <td><a href="GroupMember.do?from_even=<%=from_event_for_grpMember%>&event=read&indexID=<%=counter%>">View</a></td>
                                       </tr>--%>
                                    <%
                                        }
                                    } else {
                                          //  System.out.println("Group Member no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="10"> There is no  Group Member  information. </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>

