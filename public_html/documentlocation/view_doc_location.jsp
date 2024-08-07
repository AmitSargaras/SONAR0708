<%@ page import="com.integrosys.cms.ui.documentlocation.DocumentLocationForm,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.ui.documentlocation.DocumentLocationAction,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    String event = request.getParameter("event");
    DocumentLocationForm docForm = (DocumentLocationForm) request.getAttribute("DocumentLocationForm");
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->

    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>


    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

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

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

        function gotopage(aLocation) {
            window.location = aLocation;
        }

        function submitPage() {
            document.forms[0].event.value = "close";

            document.forms[0].submit();
        }

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="DocumentLocation.do">
    <input type="hidden" name="event"/>
    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>

            <tr>

                <td width="78%">
                    <%
                        if (event.equals(DocumentLocationAction.EVENT_PREPARE_CLOSE_DOC_LOCATION)) {
                    %>
                    <h3>Close Documentation Originating Location</h3>
                    <% } else if (DocumentLocationAction.EVENT_VIEW.equals(event)) { %>
                    <h3>View Documentation Originating Location</h3>
                    <% } else { %>
                    <h3>To Track Documentation Originating Location</h3>
                    <% } %>
                </td>

                <td width="22%" align="right" valign="baseline">&nbsp; </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2"><hr/></td>
            </tr>
            <tr>
                <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname" width="39%">Customer Category</td>
                            <td width="61%">&nbsp;<bean:write name="DocumentLocationForm" property="customerCategory"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname" width="39%">LE ID</td>
                            <td width="61%">&nbsp;<bean:write name="DocumentLocationForm" property="leId"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname" width="39%">Legal Name</td>
                            <td width="61%">&nbsp;<bean:write name="DocumentLocationForm" property="legalName"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname" width="39%">Customer Type</td>
                            <td width="61%">&nbsp;
                                <%
                                    String custType = docForm.getCustomerType();
                                    custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION, custType);
                                %>
                                <integro:empty-if-null value="<%=custType%>"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname" width="39%">Documentation Originating Location</td>
                            <td width="61%">&nbsp;&nbsp;
                                <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(docForm.getDocOriginateLoc())%>"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname" width="39%">Organisation Code&nbsp;<font color="#0000FF">* </font></td>
                            <%
                                String orgCode = "-";
                                orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, docForm.getOrgCode());
                            %>
                            <td width="61%">&nbsp;<integro:empty-if-null value="<%=orgCode%>"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td height="25" class="fieldname" width="39%">Remarks</td>
                            <td width="61%">&nbsp;<integro:wrapper value="<%=docForm.getDocRemarks()%>"/>
                            </td>
                        </tr>
                    </tbody>
                </table></td>
            </tr>
        </tbody>
    </table>

    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <%  if (event.equals(DocumentLocationAction.EVENT_PREPARE_CLOSE_DOC_LOCATION)) { %>
                <td>
                 <a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)">
                    <img src="img/close1a.gif" name="Image8" border="0" id="Image8"/></a>
                </td>
                <td>
                <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif" name="Image1" border="0" id="Image1"/></a>
               </td>
            <% } else if (DocumentLocationAction.EVENT_VIEW.equals(event)) { %>
                <td colspan="2">
                    <a href="DocumentLocation.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image1" border="0" id="Image2"/></a>
                </td>
            <% } else { %>
                <td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image1" border="0" id="Image3"/></a>
                </td>
            <% } %>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
    <!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>