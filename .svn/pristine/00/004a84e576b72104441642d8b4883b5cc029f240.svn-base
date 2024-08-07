<%@ page import="com.integrosys.cms.ui.reassignment.ReassignmentConstant,
                 com.integrosys.cms.ui.reassignment.ReassignmentAction"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/reassignment/reassignment_search.jsp,v 1.2 2006/10/27 08:47:01 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.2 $
     * @since $Date: 2006/10/27 08:47:01 $
     * Tag: $Name:  $
     */
 %>


<!-- InstanceBeginEditable name="head" -->
<script>
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage(num) {
    if (num == 0) {
        document.forms[0].reassignmentType.value='<%=ReassignmentConstant.TASK_TYPE_DEAL%>';
        document.forms[0].searchType.value='<%=ReassignmentConstant.TASK_SEARCH_TRXID%>';
        document.forms[0].cccTrxID.value="";
        document.forms[0].sccTrxID.value="";
        document.forms[0].dealNo.value="";
        document.forms[0].ccChecklistID.value="";
        document.forms[0].scChecklistID.value="";
    } else if (num == 1) {
        document.forms[0].reassignmentType.value='<%=ReassignmentConstant.TASK_TYPE_DEAL%>';
        document.forms[0].searchType.value='<%=ReassignmentConstant.TASK_SEARCH_KEY%>';
        document.forms[0].dealTrxID.value="";
        document.forms[0].cccTrxID.value="";
        document.forms[0].sccTrxID.value="";
        document.forms[0].ccChecklistID.value="";
        document.forms[0].scChecklistID.value="";
    } else if (num == 2) {
        document.forms[0].reassignmentType.value='<%=ReassignmentConstant.TASK_TYPE_CCC%>';
        document.forms[0].searchType.value='<%=ReassignmentConstant.TASK_SEARCH_TRXID%>';
        document.forms[0].dealTrxID.value="";
        document.forms[0].dealNo.value="";
        document.forms[0].sccTrxID.value="";
        document.forms[0].ccChecklistID.value="";
        document.forms[0].scChecklistID.value="";
    } else if (num == 3) {
        document.forms[0].reassignmentType.value='<%=ReassignmentConstant.TASK_TYPE_CCC%>';
        document.forms[0].searchType.value='<%=ReassignmentConstant.TASK_SEARCH_KEY%>';
        document.forms[0].dealTrxID.value="";
        document.forms[0].dealNo.value="";
        document.forms[0].sccTrxID.value="";
        document.forms[0].cccTrxID.value="";
        document.forms[0].scChecklistID.value="";
    } else if (num == 4) {
        document.forms[0].reassignmentType.value='<%=ReassignmentConstant.TASK_TYPE_SCC%>';
        document.forms[0].searchType.value='<%=ReassignmentConstant.TASK_SEARCH_TRXID%>';
        document.forms[0].dealTrxID.value="";
        document.forms[0].dealNo.value="";
        document.forms[0].ccChecklistID.value="";
        document.forms[0].cccTrxID.value="";
        document.forms[0].scChecklistID.value="";
    } else if (num == 5) {
        document.forms[0].reassignmentType.value='<%=ReassignmentConstant.TASK_TYPE_SCC%>';
        document.forms[0].searchType.value='<%=ReassignmentConstant.TASK_SEARCH_KEY%>';
        document.forms[0].dealTrxID.value="";
        document.forms[0].dealNo.value="";
        document.forms[0].ccChecklistID.value="";
        document.forms[0].cccTrxID.value="";
        document.forms[0].sccTrxID.value="";
    }
    document.forms[0].submit()
}
-->
</script>


<!-- InstanceEndEditable -->
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="Reassignment.do">
<input type="hidden" name="event" value="<%=ReassignmentAction.EVENT_SEARCH%>"/>
<input type="hidden" name="reassignmentType"/>
<input type="hidden" name="searchType"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
    <tr>
        <td>
            <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <td colspan="3">Search for Pending Multi-level Approval Deal</td>
                </tr>
            </thead>
            <tbody>
                <tr class="odd">
                    <td width="37%" class="fieldname">Transaction ID:</td>
                    <td width="48%">
                        <html:text property="dealTrxID" maxlength="40" />&nbsp;
                        <html:errors property="dealTrxID" />
                    </td>
                    <td width="15%">
                        <input onclick="submitPage(0)" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                    </td>
                </tr>
                <tr class="even">
                    <td width="37%" class="fieldname">Deal No:</td>
                    <td width="48%">
                        <html:text property="dealNo" maxlength="40" />&nbsp;
                        <html:errors property="dealNo" />
                    </td>
                    <td width="15%">
                        <input onclick="submitPage(1)" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
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

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
    <tr>
        <td>
            <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <td colspan="3">Search for Pending Multi-level Approval C/C Checklist</td>
                </tr>
            </thead>
            <tbody>
                <tr class="odd">
                    <td width="37%" class="fieldname">Transaction ID:</td>
                    <td width="48%">
                        <html:text property="cccTrxID" maxlength="40" />&nbsp;
                        <html:errors property="cccTrxID" />
                    </td>
                    <td width="15%">
                        <input onclick="submitPage(2)" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                    </td>
                </tr>
                <tr class="even">
                    <td width="37%" class="fieldname">C/C Checklist ID:</td>
                    <td width="48%">
                        <html:text property="ccChecklistID" maxlength="40" />&nbsp;
                        <html:errors property="ccChecklistID" />
                    </td>
                    <td width="15%">
                        <input onclick="submitPage(3)" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
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

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
    <tr>
        <td>
            <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <td colspan="3">Search for Pending Multi-level Approval Security Checklist</td>
                </tr>
            </thead>
            <tbody>
                <tr class="odd">
                    <td width="37%" class="fieldname">Transaction ID:</td>
                    <td width="48%">
                        <html:text property="sccTrxID" maxlength="40" />&nbsp;
                        <html:errors property="sccTrxID" />
                    </td>
                    <td width="15%">
                        <input onclick="submitPage(4)" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                    </td>
                </tr>
                <tr class="even">
                    <td width="37%" class="fieldname">Security Checklist ID:</td>
                    <td width="48%">
                        <html:text property="scChecklistID" maxlength="40" />&nbsp;
                        <html:errors property="scChecklistID" />
                    </td>
                    <td width="15%">
                        <input onclick="submitPage(5)" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
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
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->