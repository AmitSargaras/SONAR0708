<%@ page import="com.integrosys.cms.ui.creditriskparam.bankentitybranch.BankEntityBranchParamForm" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.creditriskparam.trx.bankentitybranch.IBankEntityBranchTrxValue" %>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.bankentitybranch.IBankEntityBranchParam" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    IBankEntityBranchTrxValue trxVal = (IBankEntityBranchTrxValue) session.getAttribute("com.integrosys.cms.ui.creditriskparam.bankentitybranch.BankEntityBranchParamAction.bankEntityBranchTrxValue");
    BankEntityBranchParamForm actionForm = (BankEntityBranchParamForm) request.getAttribute("BankEntityBranchParamForm");
    int rowIdx = 0;
%>

<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->

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

        function approve(){
            document.forms[0].event.value='checker_approve';
            document.forms[0].submit();
        }

        function reject(){
            document.forms[0].event.value='checker_reject';
            document.forms[0].submit();
        }

        //-->
    </script>
</head>
<body>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
<!-- Content -->

<html:form action="bankEntityBranchParam.do">
<bean:size id="itemSize" name="BankEntityBranchParamForm" property="bankEntityBranchParams"/>
<input type="hidden" name="event"/>


<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:10px">
    <thead>
        <tr>
            <td align="right" colspan="2"><p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/></p></td>
        </tr>
        <tr>
            <td height="34"><h3>Process <bean:message key="title.bank.entity.branch.param.name"/></h3></td>
            <td align="right" valign="bottom">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr/>
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo"
                       style="margin-top:0">
                    <thead>
                        <tr>
                            <td width="10%"><bean:message key="label.global.sno"/></td>
                            <td width="25%"><bean:message key="label.bank.entity"/><font color="#0000FF">*</font></td>
                            <td width="20%"><bean:message key="label.bank.entity.branch.param.branch.code"/><font color="#0000FF">*</font></td>
                            <td width="45%"><bean:message key="label.bank.entity.branch.param.branch.desc"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <logic:iterate id="item" indexId="count" name="BankEntityBranchParamForm"
                                       property="bankEntityBranchParams" scope="request"
                                       type="java.lang.Object">
                            <%
                                String headerClass = "index";
                                IBankEntityBranchParam param = null;
                                if (item instanceof CompareResult) {
                                    param = (IBankEntityBranchParam) ((CompareResult) item).getObj();
                                    headerClass = ((CompareResult) item).getKey();
                                } else {
                                    param = (IBankEntityBranchParam) item;
                                }
                            %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="<%=headerClass%>" valign="top"><%=count.intValue() + 1%>
                                </td>
                                <td>&nbsp;<integro:empty-if-null value= "<%=param.getEntityTypeDesc()%>"/></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=param.getBranchCode()%>"/></td>
                                <td>&nbsp;<integro:empty-if-null
                                        value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_CODE_BKGLOC, param.getBranchCode())%>"/></td>
                            </tr>
                        </logic:iterate>
                        <logic:equal name="itemSize" value="0">
                            <tr class="odd">
                                <td colspan="8"><bean:message key="label.no.records.found"/></td>
                            </tr>
                        </logic:equal>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<br><br>
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr class="odd">
      <td class="fieldname" width="40%"><bean:message key="label.remarks"/></td>
      <td width="60%"><html:textarea property="remarks" rows="4" cols="60"/><br><html:errors property="remarks"/></td>
    </tr>
    <tr class="even">
      <td class="fieldname"><bean:message key="label.last.action.by"/></td>
      <td>&nbsp;<integro:empty-if-null value="<%=actionForm.getLastActionBy()%>"/></td>
    </tr>
    <tr class="odd">
      <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
      <td> <integro:empty-if-null value="<%=actionForm.getLastRemarks()%>"/>&nbsp;</td>
    </tr>
  </tbody>
</table>

<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
</html:form>
</td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->

<tr>
    <td height="25">

    </td>
</tr>

</table>

</body>
</html>