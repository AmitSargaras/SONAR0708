<!--Modified by Pratheepa for CR234 -->
<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptForm,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recreceipt/rec_receipt_covenant_view.jsp,v 1.15 2006/11/12 11:41:31 nkumar Exp $
     *
     * Purpose: View recurrent receipt
     * Description: View recurrent/recurrent receipt
     *
     * @author $Author: nkumar $<br>
     * @version $Revision: 1.15 $
     * Date: $Date: 2006/11/12 11:41:31 $
     * Tag: $Name:  $
     */
%>
<%
    int row = 0;
    RecurrentReceiptForm aForm = (RecurrentReceiptForm) request.getAttribute("RecurrentReceiptForm");
    String itemDesc = null;
    String itemType = null;
    if (aForm != null) {
        itemDesc = aForm.getCovenantItemDesc();

        String fee = aForm.getFee();
        String riskTrigger = aForm.getRiskTrigger();
        if (fee.equalsIgnoreCase("Yes"))
            itemType = "Fee";
        else if (riskTrigger.equalsIgnoreCase("Yes"))
            itemType = "Risk Trigger";
        else
            itemType = "Covenant";
    }
    Boolean showSubItemDetail = (Boolean) request.getAttribute("showSubItemDetail");
    boolean toTrack = request.getParameter("toTrack") != null ? request.getParameter("toTrack").equals("true") : false;
    boolean isClose = request.getParameter("isClose") != null ? request.getParameter("isClose").equals("true") : false;
    boolean isRead = request.getParameter("isRead") != null ? request.getParameter("isRead").equals("true") : false;
    FrequencyList freqList = FrequencyList.getInstance();
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

    <script language="JavaScript" src="js/calendar.js"></script>
    <script language="JavaScript" src="js/calDriver.js"></script>


    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }

        +
        -
    </style>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        months = new Array();
        months['Jan'] = 0;
        months['Feb'] = 1;
        months['Mar'] = 2;
        months['Apr'] = 3;
        months['May'] = 4;
        months['Jun'] = 5;
        months['Jul'] = 6;
        months['Aug'] = 7;
        months['Sep'] = 8;
        months['Oct'] = 9;
        months['Nov'] = 10;
        months['Dec'] = 11;
        var isVerified_flag = false;

        function limitText(limitField, limitNum) {
            if (limitField.value.length > limitNum) {
                limitField.value = limitField.value.substring(0, limitNum);
                alert('The remarks field is limited to ' + limitNum + ' characters.');
            }
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

        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
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

        function submitPage() {
            document.forms[0].event.value = "return";
            document.forms[0].submit();
        }

        //-->
    </script>

    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif','img/ok2.gif')">
<html:form action="RecurrentReceipt">

    <input type="hidden" name="event"/>
    <input type="hidden" name="toTrack" value="<%=toTrack%>"/>
    <input type="hidden" name="isClose" value="<%=isClose%>"/>
<% //bernard - added if condition for CMS-1490
    if (showSubItemDetail == null || (showSubItemDetail != null && showSubItemDetail == Boolean.TRUE)) {
%>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3><bean:message key="title.cov.receipt.view"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.checklist.covenant.condition"/></td>
                        <td>&nbsp;<bean:write name="RecurrentReceiptForm" property="covenantItemDesc"/></td>
                    </tr>
                        <%-- cr 26 --%>
                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="oneOff"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.checklist.risk.trigger"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="riskTrigger"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.checklist.fee"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="fee"/>&nbsp;</td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.checklist.frequency"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="frequency"/>&nbsp;<bean:write name="RecurrentReceiptForm"
                                                                                                            property="frequencyUnit"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.checklist.trigger.end.date"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="docEndDate"/>&nbsp;</td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.checklist.grace.period"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="gracePeriod"/>&nbsp;<bean:write name="RecurrentReceiptForm"
                                                                                                              property="gracePeriodUnit"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.checklist.due.date"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="dueDate"/>&nbsp;
                            <html:hidden property="dueDate"/>
                        </td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.checklist.status"/></td>
                        <td><bean:write name="RecurrentReceiptForm" property="recurrentStatus"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.checklist.complied"/></td>
                        <td><%
                            boolean temp = false;
                            temp = aForm.getIsVerified();

                            String isVerified = "No";
                            if (temp) {
                                isVerified = "Yes";
                            }
                        %>
                            <%= isVerified %>
                        </td>
                    </tr>
                </tbody>
            </table></td>
        </tr>
    </tbody>
</table>

<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img
                    src="img/return1.gif" name="Image1" border="0" id="Image1"/></a>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
</table>

<% } //bernard - end of if showSubItemDetail condition (CMS-1490)
// cr 26
%>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3><bean:message key="title.cov.receipt.history"/></h3></td>
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
                    <tr>
                        <td width="7%"><bean:message key="title.sequence.number"/></td>
                        <td width="10%"><bean:message key="label.checklist.covenant.condition"/></td>
                        <td width="10%"><bean:message key="title.item.type"/></td>
                        <td width="10%"><bean:message key="label.checklist.frequency"/></td>
                        <td width="13%"><bean:message key="label.checklist.trigger.end.date"/></td>
                        <td width="10%"><bean:message key="label.checklist.due.date"/></td>
                        <td width="10%"><bean:message key="label.checklist.complied"/></td>
                        <td width="10%"><bean:message key="label.checklist.date.received"/></td>
                        <td width="10%"><bean:message key="label.checklist.date.waived"/></td>
                        <td width="10%"><bean:message key="label.checklist.remarks"/></td>
                    </tr>
                </thead>
                <tbody>
                    <logic:present name="itemhistory" scope="request">
                        <logic:iterate id="OB" name="itemhistory" type="com.integrosys.cms.app.recurrent.bus.IConvenantSubItem" scope="request">
                            <%
                                if (OB.getCheckedDate() != null || OB.getWaivedDate() != null) {
                                    String rowClass = "";
                                    row++;
                                    if (row % 2 != 0) {
                                        rowClass = "odd";
                                    } else {
                                        rowClass = "even";
                                    }
                            %>
                            <tr class="<%=rowClass%>">
                                <td class="index"><%=row%></td>
                                <td style="text-align:center"><%=itemDesc%> &nbsp; </td>
                                <td style="text-align:center"><%=itemType%> &nbsp; </td>
                                <%
                                    if (OB.getFrequencyUnit() == null) {
                                %>
                                <td style="text-align:center">-</td>
                                <%
                                } else {
                                %>
                                <td><%=OB.getFrequency()%>&nbsp;<%=freqList.getFrequencyValue(OB.getFrequencyUnit())%></td>
                                <%} %>
                                <td>
                                    <% //CR-127
                                        if (OB.getDocEndDate() != null) { %>
                                    <integro:date object="<%=OB.getDocEndDate()%>"/>&nbsp;
                                    <% } else { %> - <% } %>
                                </td>
                                <td>
                                    <% if (OB.getDueDate() != null) { %>
                                    <integro:date object="<%=OB.getDueDate()%>"/>&nbsp;
                                    <% } else { %> - <% } %>
                                </td>
                                <td>
                                    <% // CMS-1829
                                        if (OB.getCheckedDate() != null) {
                                            if (OB.getIsVerifiedInd()) { %>
                                    Yes&nbsp;
                                    <% } else { %>
                                    No&nbsp;
                                    <% }
                                    } else { %> - <% } %>
                                </td>
                                <td>
                                    <% if (OB.getCheckedDate() != null) { %>
                                    <integro:date object="<%=OB.getCheckedDate()%>"/>&nbsp;
                                    <% } else { %> - <% }%>
                                </td>
                                <td>
                                    <% if (OB.getWaivedDate() != null) { %>
                                    <integro:date object="<%=OB.getWaivedDate()%>"/>&nbsp;
                                    <% } else { %> - <% } %>
                                </td>
                                <td><integro:htmltext value="<%=OB.getRemarks()%>" lineLength="20"/>&nbsp;</td>
                            </tr>
                            <%
                                }
                            %>
                        </logic:iterate>
                        <%
                            if (row == 0) {
                        %>
                        <tr class="odd">
                            <td colspan="10"><bean:message key="label.error.no.history"/></td>
                        </tr>
                        <%
                            }
                        %>
                    </logic:present>
                    <logic:notPresent name="itemhistory">
                        <tr class="odd">
                            <td colspan="12"><bean:message key="label.error.no.history"/></td>
                        </tr>
                    </logic:notPresent>
                </tbody>
            </table></td>
    </tr>
    <% //bernard - added if block for CMS-1490
        if (showSubItemDetail != null && showSubItemDetail == Boolean.FALSE) {
    %>
    <tr>
        <td colspan="8">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="8" valign="baseline" align="center">
            <a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','img/return2.gif',0)">
                <img src="img/return1.gif" name="Image1" border="0" id="Image11"/>
            </a>
        </td>
    </tr>
    <% }
    %>
    <tr>
        <td colspan="8">&nbsp;</td>
    </tr>
</tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

