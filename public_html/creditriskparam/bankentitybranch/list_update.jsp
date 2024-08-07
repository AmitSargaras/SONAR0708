<%@ page import="com.integrosys.cms.ui.creditriskparam.bankentitybranch.BankEntityBranchParamForm" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.creditriskparam.trx.bankentitybranch.IBankEntityBranchTrxValue" %>
<%@ page import="com.integrosys.base.techinfra.validation.Validator" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


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

        function gotopage(aLocation) {
            window.location = aLocation;
        }

        function addNew() {
            document.forms[0].event.value = "maker_prepare_item";
            document.forms[0].submit();
        }
        function remove() {
            document.forms[0].event.value = "maker_delete_item"
            document.forms[0].submit();
        }
        function submitForm() {
            document.forms[0].event.value = "maker_submit"
            document.forms[0].submit();
        }

        function updateItem(ind){
            document.forms[0].indexID.value = ind;
            document.forms[0].event.value = 'maker_prepare_item';
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


<%

    //BankEntityBranchParamForm actionForm = (BankEntityBranchParamForm) pageContext.findAttribute("bankEntityBranchParamForm");
    BankEntityBranchParamForm actionForm = (BankEntityBranchParamForm) request.getAttribute("BankEntityBranchParamForm");
    IBankEntityBranchTrxValue trxVal = (IBankEntityBranchTrxValue) session.getAttribute("com.integrosys.cms.ui.creditriskparam.bankentitybranch.BankEntityBranchParamAction.bankEntityBranchTrxValue");
    //String event = actionForm.getEvent();
    int rowIdx = 0;
    
    String regex = "[0-9]*";
%>

<html:form action="bankEntityBranchParam.do">
<bean:size id="itemSize" name="BankEntityBranchParamForm" property="bankEntityBranchParams"/>
<input type="hidden" name="event"/>
<input type="hidden" name="indexID"/>


<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:10px">
    <thead>
        <tr>
            <td align="right" colspan="2"><p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/></p></td>
        </tr>
        <tr>
            <td height="34"><h3><bean:message key="title.bank.entity.branch.param.name"/></h3></td>
            <td align="right" valign="bottom">
                <table width="50" border="0" align="right" cellpadding="2" cellspacing="">
                    <tr>
                        <td width="100" valign="bottom" align="center">
                            <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
                        </td>
                        <td width="100" valign="bottom" align="center">
                            <logic:greaterThan name="itemSize" value="0">
                            &nbsp;
                            <input type="button" name="remove1" value="Remove" class="btnNormal" onclick="remove()"/>
                            </logic:greaterThan>
                        </td>
                    </tr>
                </table>
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
            <td colspan="2"><html:errors property="delItem"/>
                <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo"
                       style="margin-top:0">
                    <thead>
                        <tr>
                            <td width="5%"><bean:message key="label.global.sno"/></td>
                            <td width="20%"><bean:message key="label.bank.entity"/><font color="#0000FF">*</font></td>
                            <td width="15%"><bean:message key="label.bank.entity.branch.param.branch.code"/><font color="#0000FF">*</font></td>
                            <td width="40%"><bean:message key="label.bank.entity.branch.param.branch.desc"/></td>
                            <td width="10%"><bean:message key="label.global.action"/></td>
                            <td width="10%"><bean:message key="label.todo.pending.select"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <logic:iterate id="item" indexId="count" name="BankEntityBranchParamForm"
                                       property="bankEntityBranchParams" scope="request"
                                       type="com.integrosys.cms.app.creditriskparam.bus.bankentitybranch.OBBankEntityBranchParam">
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="index" valign="top"><%=count.intValue() + 1%>
                                </td>
                                <td>&nbsp;<integro:empty-if-null value= "<%=item.getEntityTypeDesc()%>"/></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=item.getBranchCode()%>"/></td>
                                <td>&nbsp;<integro:empty-if-null
                                        value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_CODE_BKGLOC, item.getBranchCode())%>"/></td>
                                
                               <% if (Validator.checkPattern(item.getBranchCode(), regex)) {%>
                                
                                 <td>&nbsp</td>
                                 <td>&nbsp</td>
                                
                                <% } else { %> 
                                
                                <td style="text-align:center">
                                      <a href="javascript:updateItem('<%= count.intValue() %>')">Edit</a>
                                </td>
                                <td style="text-align:center">
                                    <html:multibox property="deleteItems" value="<%=count.toString()%>"/>
                                </td>
                                
                                <% } %> 
                                
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
        <tr><td colspan="2"><html:errors property="errorMsg"/></td></tr>
    </tbody>
</table>
<br><br>
<%
    if (trxVal != null && trxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
%>
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
            <td>&nbsp;<integro:wrapper value="<%=actionForm.getLastRemarks()%>"/></td>
        </tr>
    </tbody>
</table>
<% } %>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="75" valign="baseline" align="center"><a href="javascript:submitForm();"
                                                           onmouseout="MM_swapImgRestore()"
                                                           onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img
                src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1"/></a></td>
        <td width="75" valign="baseline" align="center"><a href="Welcome.do?event=prepare"
                                                           onmouseout="MM_swapImgRestore()"
                                                           onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
                src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2"/></a></td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
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