<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.groupmember.GroupMemberAction"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="Javascript" type="text/javascript">
        <!--
        function submitPage(gobutton) {
            var frm = document.forms[0];
            frm.customerName.value = "";
            frm.leIDType.value = "";
            frm.legalID.value = "";


            document.forms[0].gobutton.value = gobutton;

            if (gobutton == 4) {                            //  for searchGroupID
                frm.searchGroupName.value = "";
                frm.searchType.value = '<%=CustGroupUIHelper.search_ByGroup%>';
            } else if (gobutton == 5) {                     //  for searchGroupName
                frm.searchGroupID.value = "";
                frm.searchType.value = '<%=CustGroupUIHelper.search_ByGroup%>';
            }
            frm.event.value ='<%=GroupMemberAction.EVENT_SEARCH_GROUP%>';
            frm.submit();
        }


        //-->
    </script>
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->

<html:form action="GroupMember.do?event=searchGroup">

    <html:hidden property="customerName" value=""/>
    <html:hidden property="leIDType" value=""/>
    <html:hidden property="grpID" value=""/>
    <html:hidden property="legalID" value=""/>
    
    <html:hidden property="customerSeach" value="false"/>
    <html:hidden property="searchType" value="false"/>
    <html:hidden property="itemType" />

    <input type="hidden" name="event" value="<%=GroupMemberAction.EVENT_SEARCH_GROUP%>">
    <input type="hidden" name="gobutton" value="">

    <%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
    %>
    <input type="hidden" name="source" value="<%= source %>"/>
    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td valign="bottom"><h3><bean:message key="label.group.to.group-search"/></h3></td>

                    </tr>
                    <tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="title.cci.search.label"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname" width="60%"><bean:message key="label.group.id"/></td>
                            <td>
                                <html:text property="searchGroupID" maxlength="40"/>
                                <html:errors property="searchGroupID"/></td>
                            <td width="15%">
                                <input onclick="submitPage(4)" name="AddNew3" type="button" id="AddNew4" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname" width="60%"><bean:message key="label.group.name"/></td>
                            <td>
                                <html:text property="searchGroupName" maxlength="40"/>
                                <html:errors property="searchGroupName"/></td>
                            <td width="15%">
                                <input onclick="submitPage(5)" name="AddNew3" type="button" id="AddNew5" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</html:form>
</body>
</html>

