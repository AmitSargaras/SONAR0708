<%@ page import="com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.checklist.bus.CCCheckListSummary,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 java.util.Collection,
                 java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/documentlocation/doc_loc_list.jsp,v 1.10 2006/10/27 08:43:21 hmbao Exp $
     *
     * Purpose: List document originating location
     * Description: Update document originating location list
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.10 $
     * Date: $Date: 2006/10/27 08:43:21 $
     * Tag: $Name:  $
     */
%>
<%
    int row = 0;
    CountryList cList = CountryList.getInstance();
    Collection docLocationList = (Collection) session.getAttribute("com.integrosys.cms.ui.documentlocation.DocumentLocationAction.docLocationList");
    pageContext.setAttribute("docLocationList", docLocationList);

    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    boolean isCPCMaker = false;
    TOP_LOOP:
    for (int i = 0; i < userTeam.getTeamMemberships().length; i++) {//parse team membership to validate user first
        for (int j = 0; j < userTeam.getTeamMemberships()[i].getTeamMembers().length; j++) {  //parse team memebers to get the team member first..
            if (userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() == user.getUserID()) {
                if (userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_CPC_MAKER) {
                    isCPCMaker = true;
                    break TOP_LOOP;
                }
            }
        }
    }
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
    var d = document;
    if (d.images) {
        if (!d.MM_p) d.MM_p = new Array();
        var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
        for (i = 0; i < a.length; i++)
            if (a[i].indexOf("#") != 0) {
                d.MM_p[j] = new Image;
                d.MM_p[j++].src = a[i];
            }
    }
}

function gotopage(aLocation) {
    window.location = aLocation;
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td>
                <h3>Update Documentation Originating Location</h3>
            </td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
                <thead>
                    <tr>
                        <td width="3%">S/N</td>
                        <td width="10%">Customer Category</td>
                        <td width="10%">LE ID/Pledgor ID</td>
                        <td width="15%">Legal Name</td>
                        <td width="10%" nowrap>Documentation<br>Originating<br>Location</td>
                        <td width="10%">Organisation Code</td>
                        <td width="8%">Governing Law</td>
                        <td width="8%">Status</td>
                        <td width="8%">Action</td>
                    </tr>
                </thead>
                <tbody>
                    <logic:present name="docLocationList">
                        <logic:iterate id="OB" name="docLocationList" type="com.integrosys.cms.app.documentlocation.bus.CCDocumentLocationSummary">
                            <%
                                String rowClass = "";
                                row++;
                                if (row % 2 == 0) {
                                    rowClass = "odd";
                                } else {
                                    rowClass = "even";
                                }

                                String countryName = cList.getCountryName(OB.getDocumentLocationCountry());
                                String orgCode = OB.getDocumentOrgCode();
                                orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, orgCode);
                                String legalID = (OB.getLegalID().equals("0")) ? null : OB.getLegalID();
                            %>
                            <tr class="<%=rowClass%>">
                                <td valign="top" class="index"><%=row%></td>
                                <td valign="top">&nbsp;<integro:empty-if-null value="<%=OB.getDocumentLocationCategory()%>"/></td>
                                <td valign="top">
                                    <integro:empty-if-null value="<%=legalID%>"/> 
									  <%if (OB.getPledgorReference() != null)
										{%>
									  <br><%= OB.getPledgorReference()%>
									   <%}%>
                                </td>
                                <td valign="top">&nbsp;<integro:empty-if-null value="<%=OB.getLegalName()%>"/></td>
                                <td valign="top">&nbsp;<integro:empty-if-null value="<%=countryName%>"/></td>
                                <td valign="top">&nbsp;<integro:empty-if-null value="<%=orgCode%>"/></td>
                                <td valign="top">&nbsp;<integro:empty-if-null value="<%=OB.getGovernLaw()%>"/></td>
                                <td valign="top">&nbsp;<integro:empty-if-null value="<%=OB.getCheckListStatus()%>"/></td>
                                <td valign="top">
                                    <%
                                        if (OB.getCheckListStatus() != null && isCPCMaker &&
                                                (OB.getCheckListStatus().equals(ICMSConstant.STATE_NEW))) {
                                    %>
                                    <a href="DocumentLocation.do?event=prepare_update&index=<%=row - 1%>">Update</a>
                                    <% } else if (OB.getIsViewable()) { %>
                                    <a href="DocumentLocation.do?event=view&index=<%=row - 1%>">View</a>
                                    <% } %>
                                    &nbsp;
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                    <logic:notPresent name="docLocationList">
                        <tr class="odd">
                            <td colspan="9">There is no document</td>
                        </tr>
                    </logic:notPresent>
                </tbody>
            </table></td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
