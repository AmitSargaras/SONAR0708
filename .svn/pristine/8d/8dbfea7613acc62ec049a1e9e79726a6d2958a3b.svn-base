<%@ page import="com.integrosys.cms.app.documentlocation.trx.ICCDocumentLocationTrxValue,
                 com.integrosys.cms.ui.documentlocation.DocumentLocationForm,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.documentlocation.bus.ICCDocumentLocation,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.bus.OBBookingLocation,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    ICCDocumentLocationTrxValue trxValue = (ICCDocumentLocationTrxValue) session.getAttribute("com.integrosys.cms.ui.documentlocation.DocumentLocationAction.docLocTrxValue");
    ICCDocumentLocation actual = trxValue.getCCDocumentLocation();
    ICCDocumentLocation staging = trxValue.getStagingCCDocumentLocation();
    IBookingLocation actBooking = null;
    if (actual != null) {
        actBooking = actual.getOriginatingLocation();
    }
    IBookingLocation stageBooking = null;

    if (staging != null) {
        stageBooking = staging.getOriginatingLocation();
    }

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
                document.forms[0].event.value = "approve";
            }
            if (num == 2) {
                document.forms[0].event.value = "reject";
            }
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
                    <h3>Process Documentation Originating Location</h3>
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
                            <td class="<%=CompareOBUtil.compOB(stageBooking, actBooking,"countryCode")?"fieldname":"fieldnamediff"%>"
                                width="39%">Documentation Originating Location&nbsp;<font color="#0000FF">*</font></td>
                            <td width="61%">&nbsp;<integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(docForm.getDocOriginateLoc())%>"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="<%=CompareOBUtil.compOB(stageBooking, actBooking,"organisationCode")?"fieldname":"fieldnamediff"%>"
                                width="39%">Organisation Code&nbsp;<font color="#0000FF">* </font></td>
                            <%
                                String orgCode = "-";
                                orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, docForm.getOrgCode());
                            %>
                            <td width="61%">&nbsp;<integro:empty-if-null value="<%=orgCode%>"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td height="25" class="<%=CompareOBUtil.compOB(staging, actual,"remarks")?"fieldname":"fieldnamediff"%>" width="39%">Remarks</td>
                            <td width="61%">&nbsp;<integro:wrapper value="<%=docForm.getDocRemarks()%>"/>
                            </td>
                        </tr>
                    </tbody>
                </table></td>
            </tr>
        </tbody>
    </table>
    <br><br>
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
                <td class="even"><%=trxValue != null ? trxValue.getUserInfo() : ""%>&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><% if (trxValue != null) { %>
                    <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
                    <% } %>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>

    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)">
                <img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8"/></a></td>
            <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)">
                <img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9"/></a></td>
            <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif"  name="Image1" border="0" id="Image1"/></a></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
    <!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>