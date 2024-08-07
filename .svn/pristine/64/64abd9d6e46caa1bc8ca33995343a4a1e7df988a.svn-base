<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>
<%
    CommonCodeList commonCode = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
        Collection leTypeValues = commonCode.getCommonCodeValues();
        Collection leTypeLabels = commonCode.getCommonCodeLabels();
        if (leTypeValues == null) {
            leTypeValues = new ArrayList();
        }
        if (leTypeLabels == null) {
            leTypeLabels = new ArrayList();
        }
        pageContext.setAttribute("leTypeValues", leTypeValues);
        pageContext.setAttribute("leTypeLabels", leTypeLabels);
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="Javascript" type="text/javascript">
    <!--

    var submitCustGrpiSearch = function submitPage(params) {
        var gobutton = params[0];

        var frm = document.forms[0];
        document.forms[0].gobutton.value = gobutton;

        if (gobutton == 1) {          //  for customerName
            frm.leIDType.value = "";
            frm.legalID.value = "";
            frm.idNO.value = "";
            frm.grpNo.value = "";
            frm.groupName.value = "";
        } else if (gobutton == 2) {      // for legalID
            frm.customerName.value = "";
            frm.idNO.value = "";
            frm.grpNo.value = "";
            frm.groupName.value = "";
            var legalIDstr = frm.legalID.value;
            frm.legalID.value = legalIDstr.toUpperCase();
        } else if (gobutton == 3) {       //  for idNO
            frm.customerName.value = "";
            frm.leIDType.value = "";
            frm.legalID.value = "";
            frm.grpNo.value = "";
            frm.groupName.value = "";
        } else if (gobutton == 4) {         //  for groupid
            frm.customerName.value = "";
            frm.leIDType.value = "";
            frm.legalID.value = "";
            frm.idNO.value = "";
            frm.groupName.value = "";
            frm.searchType.value = '<%=CustGroupUIHelper.search_ByGroup%>';
            frm.groupName.value = "";
        } else if (gobutton == 5) {         //  for groupName
            frm.customerName.value = "";
            frm.leIDType.value = "";
            frm.legalID.value = "";
            frm.idNO.value = "";
            frm.grpNo.value = "";
            frm.searchType.value = '<%=CustGroupUIHelper.search_ByGroup%>';
        }
        frm.submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params[0] = gobutton;

        submitEnter(event, submitCustGrpiSearch, params);
    }


    //-->
</script>
</head>
<body>
<!-- InstanceBeginEditable name="Content" -->

<html:form action="CustGrpIdentifier.do?event=list">

    <html:hidden property="customerSeach"/>
    <html:hidden property="searchType"/>

    <input type="hidden" name="event" value="prepare">
    <input type="hidden" value="" name="gobutton">
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
                        <td valign="bottom"><h3><bean:message key="label.group.by.groupid"/> </h3></td>

                    </tr>
                    <tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="title.cci.search.label" /></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname" width="60%" ><bean:message key="label.group.id" /></td>
                            <td>
                                        <html:text property="grpNo" maxlength="40" onkeypress="submitEnterWrapper(event, 4);"/>
                                        <html:errors property="grpNo"/></td>
                            <td width="15%">
                                <input onclick="submitPage(4)" name="AddNew3" type="button" id="AddNew4" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                         <tr class="even">
                            <td class="fieldname" width="60%" ><bean:message key="label.group.name" /></td>
                            <td>
                                        <html:text property="groupName" maxlength="40" onkeypress="submitEnterWrapper(event, 5);"/>
                                        <html:errors property="groupName"/></td>
                            <td width="15%">
                                <input onclick="submitPage(5)" name="AddNew3" type="button" id="AddNew5" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td valign="bottom"><h3><bean:message key="label.group.by.member"/></h3></td>
                    </tr>
                </table>
                 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
                    <tr>
                        <td>
                            <table class="tblInput" id="custsearch1" width="100%" border="0" cellspacing="0" cellpadding="0">
                                <thead>
                                    <tr>
                                        <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                                    </tr>
                                </thead>
                                <tbody>

                                <tr class="odd">
                                    <td class="fieldname"><bean:message key="label.customer.name"/></td>
                                    <td><html:text property="customerName" maxlength="40" onkeypress="submitEnterWrapper(event, 1);"/>
                                        <html:errors property="customerName"/></td>
                                    <td><input onclick="submitPage(1)" name="AddNew3" type="button" id="AddNew1" value="Go"
                                               class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                                    </td>
                                </tr>

                                <tr class="even">
                                    <td class="fieldname"><bean:message key="label.customer.id.source"/></td>
                                    <td>
                                        <html:select property="leIDType">
                                            <option value="">Please Select</option>
                                            <html:options name="leTypeValues" labelName="leTypeLabels"/>
                                        </html:select>
                                        <html:errors property="leIDType"/>
                                    </td>
                                    <td rowspan="2">
                                        <input onclick="submitPage(2)" name="AddNew2" type="button" id="AddNew2" value="Go"
                                               class="btnNormal"   style="margin-right:5px;margin-left:10;width:50px"/>
                                    </td>
                                </tr>

                                <tr class="even">
                                    <td class="fieldname"><bean:message key="label.customer.id"/></td>
                                    <td>
                                        <html:text property="legalID" maxlength="20" onkeypress="submitEnterWrapper(event, 2);"/>
                                        <html:errors property="legalID"/>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                                    <td>
                                        <html:text property="idNO" maxlength="20" onkeypress="submitEnterWrapper(event, 3);"/> <html:errors property="idNO"/>
                                    </td>
                                    <td><input onclick="submitPage(3)" name="AddNew4" type="button" id="AddNew3" value="Go"
                                               class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                                    </td>
                                </tr>
                                    <tr class="">
                                        <td class="" colspan="3"><html:errors property="searchError"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
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

