<%@ page import="com.integrosys.cms.batch.reports.OBReport,
                 com.integrosys.cms.batch.reports.ReportConstants,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%

    String searchDate = (String) request.getAttribute("searchDate");
    int counter = 0;
     int rowIdx =0;

    String reportServer = PropertyManager.getValue(ReportConstants.ENTERPRISE_SERVER);
    String path = "http://" + reportServer + ":8080/cmsreport/GetReport.image";

%>


<html><!-- InstanceBegin template="../Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->

    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script language="JavaScript" type="text/JavaScript">
        <!--

        function MM_preloadImages() { //v3.0
          var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
            var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
            if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
        }

        function MM_openBrWindow(theURL,winName,features) { //v2.0
          window.open(theURL,winName,features);
        }

        function goView(folderPath, name, reportID, fileName) {
            var strURL = 'ReportServlet?flag=view&scope=CON&save='+fileName+'&reportId='+reportID+'&path='+folderPath+'&name='+name;
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

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<form action="ConcentrationReportSearch.do">
    <input type="hidden" name="name"/>
    <input type="hidden" name="path"/>
    <input type="hidden" name="flag" value="view"/>
    <input type="hidden" name="scope" value="CON"/>
    <input type="hidden" name="save"/>
    <input type="hidden" name="reportId"/>

    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3>Concentration Reports - <%=searchDate%></h3></td>
            </tr>
            <tr>
                <td><hr/></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <thead>
                            <tr>
                                <td width="9%">S/N</td>
                                <td width="53%">Title</td>
                                <td width="16%">Scope</td>
                                <td width="22%">Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            <logic:present name="OBReportList">
                                <logic:iterate id="OB" name="OBReportList" type="com.integrosys.cms.batch.reports.OBReport">
                                     <% counter++; %>
                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                        <td class="index"><%=counter%></td>
                                        <td><bean:write name="OB" property="title"/>&nbsp;</td>
                                        <td><bean:write name="OB" property="scope"/>&nbsp;</td>
                                        <td style="text-align:center">
                                            <%--<input type="button" name="Button" value="View PDF" class="btnNormal" style="width:80"--%>
                                                   <%--onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getPdfName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".pdf"%>') "/>--%>
                                            <input type="button" name="Button3" value="View Excel" class="btnNormal" style="width:80"
                                                   onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getXlsName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".xls"%>') "/>
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
        </tbody>
    </table>
</form>
<iframe name='displayReportFrame' src='refresh.gif' width='0' height='0' frameborder='0' scrolling='no'></iframe>
</body>
</html>
