<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%

    String countryCode =null;
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    String[] countryCodes = userTeam.getCountryCodes() ;
    if (countryCodes !=  null && countryCodes.length > 0) {
        countryCode = countryCodes[0] ;
    }

     String countryCode1 = (String) request.getAttribute("countryCode");
    String searchDate = (String) request.getAttribute("searchDate");
    String countryName = (String) request.getAttribute("countryName");
    int counter = 0;
    int rowIdx = 0;

    if (countryCode1!=null && !countryCode1.equals("")){
        countryCode = countryCode1;
    }

%>


<html>
<head>
    <script language="javascript">
    <!--
        function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
        }

        function goView(folderPath, name, reportID, fileName) {
            var strURL = 'ReportServlet?flag=view&scope=MIS&country=<%=countryCode%>&save='+fileName+'&reportId='+reportID+'&path='+folderPath+'&name='+name;
            displayReportFrame.location=strURL;

            /*
            document.forms[0].action = 'ReportServlet';
            document.forms[0].name.value=name;
            document.forms[0].path.value=folderPath;
            document.forms[0].reportId.value=reportID;
            document.forms[0].save.value=fileName;
            document.forms[0].submit();
            */
        }
   -->
    </script>
</head>

<body>

<form action="MISReportSearch.do">

    <input type="hidden" name="name"/>
    <input type="hidden" name="path"/>
    <input type="hidden" name="flag" value="view"/>
    <input type="hidden" name="scope" value="MIS"/>
    <input type="hidden" name="reportId"/>
    <input type="hidden" name="save"/>
    <input type="hidden" name="country" value="<%=request.getParameter("countryCode")%>"/>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3>Reports - <%=countryName%> <%=searchDate%></h3></td>
            </tr>
            <tr>
                <td><hr/></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                        <thead>
                            <tr height="20">
                                <td width="4%">S/N</td>
                                <td width="8%">Report No</td>
                                <td width="66%">Title</td>
                                <td width="22%">Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            <logic:present name="OBReportList">
                                <logic:iterate id="OB" name="OBReportList" type="com.integrosys.cms.batch.reports.OBReport">
                                     <% counter++; %>
                                   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                        <td class="index"><%=counter%></td>
                                        <td>&nbsp;<bean:write name="OB" property="MISReportNumber"/></td>
                                        <td><bean:write name="OB" property="title"/></td>
                                        <td style="text-align:center">
                                            <% if (OB.getHasWord()) { %>
                                                <input type="button" name="Button" value="View Word" class="btnNormal" style="width:80"
                                                       onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getWordName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".doc"%>') "/>
                                            <% } else {
                                                    if (OB.getHasPDF()) {
                                                    %>
                                                        <input type="button" name="Button" value="View PDF" class="btnNormal" style="width:80"
                                                               onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getPdfName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".pdf"%>') "/>
                                                    <% }
                                                    if (OB.getHasXLS()) {
                                                    %>
                                                        <input type="button" name="Button3" value="View Excel" class="btnNormal" style="width:80"
                                                               onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getXlsName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".xls"%>') "/>
                                                    <% } %>
                                            <%}%>
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </logic:present>
                             <% if (counter ==0) {  %>
                                    <tr class="even"><td colspan="4"> <bean:message key="label.global.not.found" /></td></tr>
                             <% } %>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </tbody>
    </table>
</form>

<iframe name='displayReportFrame' src='refresh.gif' width='0' height='0' frameborder='0' scrolling='no'></iframe>
</body>
</html>