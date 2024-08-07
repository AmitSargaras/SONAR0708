<%@ page import="com.integrosys.cms.app.documentlocation.trx.ICCDocumentLocationTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.documentlocation.DocumentLocationForm" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
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

        function submitPage(num) {
            if (num == 1) {
                document.forms[0].event.value = "create";
            }
            if (num == 2) {
                document.forms[0].event.value = "update";
            }
            if (num == 3) {
                document.forms[0].event.value = "refresh";
            }

            document.forms[0].submit();
        }


        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="DocumentLocation.do">
<input type="hidden" name="event"/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="78%">
                <h3>Update Documentation Originating Location</h3>
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
                            <html:hidden name="DocumentLocationForm" property="customerCategory"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname" width="39%">LE ID</td>
                        <td width="61%">&nbsp;<bean:write name="DocumentLocationForm" property="leId"/>
                            <html:hidden name="DocumentLocationForm" property="leId"/>
                        </td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname" width="39%">Legal Name</td>
                        <td width="61%">&nbsp;<bean:write name="DocumentLocationForm" property="legalName"/>
                            <html:hidden name="DocumentLocationForm" property="legalName"/>
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
                            <html:hidden name="DocumentLocationForm" property="customerType"/>
                        </td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname" width="39%">Documentation Originating Location&nbsp;<font color="#0000FF">*</font>&nbsp;</td>
                        <td width="61%">
                            <html:select property="docOriginateLoc" onchange="submitPage(3)">
                                <option value="">Please Select </option>
                                <html:options name="countryValues" labelName="countryLabels"/>
                            </html:select>
                             <html:errors property="docOriginateLoc"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname" width="39%">Organisation Code&nbsp;<font color="#0000FF">* </font></td>
                        <td width="61%">
                            <html:select property="orgCode">
                                <option value="">Please Select </option>
                                <html:options name="orgCodeValues" labelName="orgCodeLabels"/>
                            </html:select>
                            <html:errors property="orgCode"/>
                        </td>
                    </tr>
                    <tr class="even">
                        <td height="25" class="fieldname" width="39%">Remarks</td>
                        <td width="61%">
                            <html:textarea property="docRemarks" rows="3" style="width:90%"/>
                            &nbsp; <html:errors property="docRemarks"/>
                        </td>
                    </tr>
                </tbody>
            </table></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
    </tbody>
</table>
<%
    ICCDocumentLocationTrxValue itrxValue = (ICCDocumentLocationTrxValue) session.getAttribute("com.integrosys.cms.ui.documentlocation.DocumentLocationAction.docLocTrxValue");
%>
<% if (itrxValue != null && itrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
        <tr>
            <td class="fieldname" width="39%">Remarks</td>
            <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
                <html:errors property="remarks"/>
            </td>
        </tr>
        <tr>
            <td class="fieldname">Last Action By</td>
            <td class="even"><%=itrxValue != null ? itrxValue.getUserInfo() : ""%>&nbsp;</td>
        </tr>
        <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td><% if (itrxValue != null) { %>
                <integro:wrapper value="<%=itrxValue.getRemarks()%>"/>
                <% } %>
            </td>
        </tr>
    </tbody>
</table>
<% } %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td width="75" valign="baseline" align="center">
            <%  if (itrxValue == null) {  %>
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','img/submit2.gif',1)">
                <img  src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image31"/></a>
            <% } else { %>
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image32','','img/submit2.gif',1)">
                <img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image32"/></a>
            <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <% if (itrxValue != null && itrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
            <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif"   name="Image51" width="70"   height="20" border="0" id="Image51"/></a>
            <% } else { %>
            <a href="DocumentLocation.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image52"/></a>
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>