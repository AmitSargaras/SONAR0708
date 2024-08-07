<%@ page import="com.integrosys.cms.ui.report.ConcReportNewAction,
                 com.integrosys.cms.ui.report.ConcReportNewForm,
                 com.integrosys.cms.ui.report.ConcReportNewConstants,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 org.apache.commons.lang.StringUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html><!-- InstanceBegin template="/Templates/ContentLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Concentration Reports - Adhoc Generation</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="Cssstyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="JavaScript" type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/itgCheckForm.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/calendar.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/calDriver.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/enableFields.js"></script>
    <!-- InstanceEndEditable -->

    <!-- InstanceBeginEditable name="head" -->
    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>


    <script language="JavaScript" type="text/JavaScript">
        <!--

function submitForm() {
    document.forms[0].submit();
}

function getSample(reportType) {
    document.forms[0].sample.value = reportType;
    document.forms[0].event.value = "<%=ConcReportNewAction.EVENT_SAMPLE%>";
    document.forms[0].submit();

}

function show(){
    document.getElementById('span1').innerText=" ";
    document.getElementById('span2').innerText=" ";
    document.getElementById('span3').innerText=" ";
    document.getElementById('span4').innerText=" ";
    document.getElementById('span5').innerText=" ";
    document.getElementById('span6').innerText=" ";
    document.getElementById('span7').innerText=" ";
    document.getElementById('span8').innerText=" ";
    document.getElementById('span9').innerText=" ";
    document.getElementById('span10').innerText=" ";
    document.getElementById('span11').innerText=" ";

    if(document.getElementById('radio1').checked==true){
        document.getElementById('span1').innerText="*";
        document.getElementById('span2').innerText="*";
        document.getElementById('span3').innerText="*";
    }
    if(document.getElementById('radio2').checked==true){
        document.getElementById('span4').innerText="*";
        document.getElementById('span5').innerText="*";
        document.getElementById('span6').innerText="*";
    }
    if(document.getElementById('radio3').checked==true){
        document.getElementById('span7').innerText="*";
        document.getElementById('span8').innerText="*";
    }
    if(document.getElementById('radio4').checked==true){
        document.getElementById('span9').innerText="*";
        document.getElementById('span10').innerText="*";
    }
    if(document.getElementById('radio5').checked==true){
        document.getElementById('span11').innerText="*";
        }
}
-->
    </script>

    <!-- InstanceEndEditable -->

</head>

<body>
<!-- InstanceBeginEditable name="menuScript" --> <!-- InstanceEndEditable -->

<%
    ConcReportNewForm actionForm = (ConcReportNewForm) pageContext.findAttribute("concReportNewForm");
    int index = 0;

    // Get Team
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

    // Get Country Allow
    String[] countrys = userTeam.getCountryCodes();

    //countrys=new String[]{"SG"};
%>

<html:form action="conc_report_new.do">
<input type="hidden" name="event" value="<%=ConcReportNewAction.EVENT_GENERATE_LMS%>"/>
<input type="hidden" name="sample" value=""/>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->


<tr id="envCanvas">

<td width="100%" valign="top" id="envCanvasContent">
<table id="window" border="0" cellpadding="0" cellspacing="0">
<tr id="winCanvas">
<td>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
<!--DWLayoutTable-->
<tr>
<td colspan="3" valign="top" style="height:100%;width:100%;">
<div id="contentCanvas" style="height:100%;width:100%;">
<!-- InstanceBeginEditable name="contentCanvas" -->
<table align="right" width="100%"><tr><td><!-- <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p> --></td></tr></table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="label.report.conc.adhoc" /></h3></td>
        <td align="right" valign="bottom">
            <table width="150" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100" valign="baseline" align="center">
                        <a href="#" target="_parent" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image33111','','img/generate2.gif',1)"></a>
                    </td>
                    <td width="100" valign="baseline" align="center">
                        <a href="javascript:history.go(-1);" onmouseout="MM_swapImgRestore()"
                           onmouseover="MM_swapImage('Image44111','','img/cancel2.gif',1)"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>


<tr>
    <td colspan="2">&nbsp;</td>
</tr>
<tr>
    <td colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
                <tr>
                    <td width="5%"><bean:message key="label.global.sno" /></td>
                    <td width="15%"><bean:message key="label.report.no" /></td>
                    <td><bean:message key="label.report.title" /></td>
                    <td width="15%"><bean:message key="label.report.generation" /> <html:errors property="atleastOne"/></td>
                </tr>
            </thead>
            <tbody>
            
            <%
            String trClass=(index%2)==0?"even":"odd";
             %>
			
            <%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON001.no" /></b></td>
                <td><bean:message key="label.report.LCON001.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON001,MY"/>
                </td>
            </tr>
            <%}%>

			<%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON002.no" /></b></td>
                <td><bean:message key="label.report.LCON002.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON002,MY"/>
                </td>
            </tr>
            <%}%>
			
			<%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON003.no" /></b></td>
                <td><bean:message key="label.report.LCON003.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON003,MY"/>
                </td>
            </tr>
            <%}%>
			
			<%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON004.no" /></b></td>
                <td><bean:message key="label.report.LCON004.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON004,MY"/>
                </td>
            </tr>
            <%}%>
			
			<%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON005.no" /></b></td>
                <td><bean:message key="label.report.LCON005.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON005,MY"/>
                </td>
            </tr>
            <%}%>
			
			<%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON006.no" /></b></td>
                <td><bean:message key="label.report.LCON006.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON006,MY"/>
                </td>
            </tr>
            <%}%>
			
			<%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON007.no" /></b></td>
                <td><bean:message key="label.report.LCON007.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON007,MY"/>
                </td>
            </tr>
            <%}%>
            
            <%if (StringUtils.indexOfAny("MY", countrys) > -1) { %>
            <tr class="<%=rowColor(index)%>">
                <td class="index"><%=++index%></td>
                <td><b><bean:message key="label.report.LCON008.no" /></b></td>
                <td><bean:message key="label.report.LCON008.title" /></td>
                <td rowspan="1">
                    <input type="checkbox" name="checks" value="LCON008,MY"/>
                </td>
            </tr>
            <%}%>	
           
            </tbody>
            </table>
       </td>
</tr>
</tbody>
</table>
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/generate2.gif',1)">
                <img src="img/generate1.gif" name="Image3311" border="0" id="Image331"/></a>
        </td>
        <td width="100" valign="baseline" align="center">&nbsp; </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
<!-- InstanceEndEditable --> </div>
</td>
</tr>

</table>

</td>
</tr>


</table>
</td>
</tr>


</table>

</html:form>

</body>
<!-- InstanceEnd -->
</html>


<%!
private String rowColor(int index){
String trClass=(index%2)==0?"even":"odd";

return trClass;
}
 %>
