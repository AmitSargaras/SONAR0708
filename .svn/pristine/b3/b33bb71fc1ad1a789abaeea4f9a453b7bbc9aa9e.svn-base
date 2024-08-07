<!--Modified by Pratheepa for CR234 -->
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.cms.app.recurrent.bus.IConvenantSubItem,
                 java.util.Date,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.recurrent.bus.ConvenantComparator,
                 java.util.Calendar" %>
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recreceipt/rec_receipt_list.jsp,v 1.44 2006/10/27 08:19:06 hmbao Exp $
     *
     * Purpose: Recurrent Receipt and Covenant Receipt List
     * Description: Update Recurrent Receipt and Covenant Receipt
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.44 $
     * Date: $Date: 2006/10/27 08:19:06 $
     * Tag: $Name:  $
     */
%>
<%
    try {
        IRecurrentCheckListTrxValue checkListTrxVal = (IRecurrentCheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.checkListTrxVal");
        IRecurrentCheckList recChkLst = (IRecurrentCheckList) session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.recChkLst");
        //List conList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.conList");
        String remarks = "";
        String lastActionBy = "";
        if (recChkLst != null)
            pageContext.setAttribute("recChkLst", recChkLst);
//        if (conList != null)
//            pageContext.setAttribute("conList", conList);


        int row = 0;
        String rowClass = "";
        String status = "";
        int checkboxIndex = 0;
        FrequencyList list = FrequencyList.getInstance();

        if (checkListTrxVal != null) {
            status = checkListTrxVal.getStatus();
            remarks = checkListTrxVal.getRemarks();
            lastActionBy = checkListTrxVal.getUserInfo();
        }
        if (lastActionBy == null) lastActionBy = "";
        if (remarks == null) remarks = "";
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>


<script language="JavaScript" type="text/JavaScript">
<!--
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

function MM_openBrWindow(theURL, winName, features) { //v2.0
    window.open(theURL, winName, features);
}

function setReminder() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check1') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check1[j].value;
                }
                j++;
            }
        }
    }
    else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check1.value;
                }
            }
        }
    }
    if (temp != "") {
        temp = temp.substring(1);
    }
    document.forms[0].reminderIndex.value = temp;
    //alert("reminderIndex: " + temp);
}

function setReminder2() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'check2') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check2') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check1[j].value;
                }
                j++;
            }
        }
    }
    else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check2') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    temp = temp + "," + formObj.check2.value;
                }
            }
        }
    }
    if (temp != "") {
        temp = temp.substring(1);
    }
    document.forms[0].reminderIndex2.value = temp;
    //alert("reminderIndex: " + temp);
}

function submitPage() {
    setReminder();
    setReminder2();
    document.forms[0].event.value = "submit";
    document.forms[0].submit();
}

function savePage() {
    setReminder();
    setReminder2();
    document.forms[0].event.value = "save";
    document.forms[0].submit();
}

function goCovenantProcess(ind, subItemIndex) {
    document.forms[0].index.value = ind;
    document.forms[0].subItemIndex.value = subItemIndex;
    document.forms[0].event.value = "edit_covenant";
    document.forms[0].submit();
}
function goRecurrentProcess(ind, subItemIndex) {
    document.forms[0].index.value = ind;
    document.forms[0].subItemIndex.value = subItemIndex;
    document.forms[0].event.value = "edit_recurrent";
    document.forms[0].submit();
}
function goRecurrentDPProcess(ind, subItemIndex,noOfSubItem) {
	if(noOfSubItem==1){
		document.forms[0].isDPDueDateEditable.value="Y";
	}else{
		document.forms[0].isDPDueDateEditable.value="N";
	}
	
    document.forms[0].index.value = ind;
    document.forms[0].subItemIndex.value = subItemIndex;
    document.forms[0].event.value = "edit_recurrent_dp_recipt";
    document.forms[0].submit();
}

function printDoc(objhref) {
    setReminder();
    temp = document.forms[0].reminderIndex.value;
    if (temp.length > 0) {
      objhref.href= "RecurrentReceipt.do?event=print_doc&reminderIndex=" + document.forms[0].reminderIndex.value;
 return true;
    } else {
        alert('Please select the reminders to print!');
        return false;
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="RecurrentReceipt">

    <!--Hidden variable to keep  the track-->
    <input type="hidden" name="isDPDueDateEditable"/>
    <input type="hidden" name="event"/>
    <input type="hidden" name="index"/>
    <input type="hidden" name="subItemIndex"/>
    <input type="hidden" name="reminderIndex"/>
    <input type="hidden" name="reminderIndex2"/>
    <html:hidden property="limitProfileId"/>
    <html:hidden property="subProfileId"/>
	<html:hidden property="noCovenant"/>
	<html:hidden property="noRecurrent"/>

<!--Begin here Update Covenant/ Fee/ Risk Trigger Receipt List-->
<%
	int itemIndex = 0;
%>
<%-- <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3><bean:message key="title.update.cov.checklist"/>&nbsp;</h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
<thead>
    <tr>
        <td width="3%"><bean:message key="title.sequence.number"/></td>
        <td width="25%"><bean:message key="label.checklist.covenant.condition"/></td>
        <td width="5%"><bean:message key="label.checklist.one.off"/></td>
        <td width="7%"><bean:message key="label.checklist.frequency"/></td>
        <td width="8%"><bean:message key="label.checklist.grace.period"/></td>
        <td width="8%"><bean:message key="label.checklist.status"/></td>
        <td width="8%"><bean:message key="label.checklist.covenant.end.date"/></td>
        <td width="8%"><bean:message key="label.checklist.due.date"/></td>
        <td width="5%"><bean:message key="label.checklist.days.overdue"/></td>
        <td width="8%"><bean:message key="label.checklist.deferred.date"/></td>
        <td width="5%"><bean:message key="label.checklist.days.deferred"/></td>
        <td width="5%"><bean:message key="label.checklist.no.times.deferred"/></td>
        <td width="7%"><bean:message key="label.checklist.complied"/></td>
        <td width="8%"><bean:message key="label.checklist.date.received"/></td>
        <td width="10%"><bean:message key="label.checklist.action"/></td>
    </tr>
</thead>
<tbody>


<script language="JavaScript" type="text/JavaScript">
  document.forms[0].noCovenant.value = 0;
  document.forms[0].noRecurrent.value = 0;
</script>

<logic:present name="recChkLst" property="convenantList">
    <logic:empty name="recChkLst" property="convenantList">
        <tr class="odd">
            <td colspan="16"><bean:message key="label.error.no.document"/></td>
        </tr>
    </logic:empty>
    <logic:notEmpty name="recChkLst" property="convenantList">
        <%if (recChkLst.getConvenantList().length > 0) {%>
        <logic:iterate id="OB1" name="recChkLst" property="convenantList" type="com.integrosys.cms.app.recurrent.bus.IConvenant">
<%
            if (OB1 != null) {
                

                IConvenantSubItem[] covenantSubItems = OB1.getConvenantSubItemList();
                
                // sets the rowClass based on the row number
                row++;
                if (row % 2 != 0) {
                    rowClass = "odd";
                } else {
                    rowClass = "even";
                }

                // cr 26 onwards
                // sets the frequency unit
                String freUnit = list.getFrequencyValue(OB1.getFrequencyUnit());
                if (freUnit == null) {
                    freUnit = "";
                }
                // sets the grace period unit
                String gracePeriodUnit = list.getFrequencyValue(OB1.getGracePeriodUnit());
                if (gracePeriodUnit == null) {
                    gracePeriodUnit = "";
                }


                boolean fee1 = OB1.getFee();
                boolean riskTrigger1 = OB1.getRiskTrigger();
                String itemType = null;
                //System.out.println("Fee:" + fee1);
                //System.out.println("riskTrigger:" + riskTrigger1);
                if (fee1)
                    itemType = "Fee";
                else if (riskTrigger1)
                    itemType = "Risk Trigger";
                else
                    itemType = "Covenant";
//    System.out.println("ItemType:" +itemType);
%>
<bean:define id="itemType1" value="<%=itemType%>" />
<% int filteredSubItemIndex = 0;
    int numOfSubItems = 0;
    if (covenantSubItems != null) {
        numOfSubItems = CheckListUtil.filterSubItemListLength(covenantSubItems);
    }
    // the list of sub items is not null then loop thru to display each sub item
    if (covenantSubItems != null && covenantSubItems.length > 0
            && numOfSubItems > 0) {
        // loop thru the list of sub items of a recurrent item
        for (int subItemIndex = 0; subItemIndex < covenantSubItems.length; subItemIndex++) {
            // retrieves the sub item from the list of sub items

            checkboxIndex++; //CMS-1452 - moved to before the 'continue' statement to get incremented everytime
            IConvenantSubItem subItem = covenantSubItems[subItemIndex];
            // filter the subitem which is received or waived
            if (filteredSubItemIndex == 0 && (ICMSConstant.CONVENANT_STATE_CHECKED.equals(subItem.getStatus()) ||
                    ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
                continue;
            }

%>

<tr class="<%=rowClass%>">
    <%   if (filteredSubItemIndex == 0) {  %>
        <td class="index" rowspan="<%=numOfSubItems%>"><%=row%></td>
        <td rowspan="<%=numOfSubItems%>">
			<% if (OB1.getIsParameterizedDesc()) { %>
				<integro:common-code categoryCode="COVENANT_CONDITION" entryCode="<%=OB1.getDescription()%>" display="true" descWithCode="false"/>
			<% } else { %>
				<%=OB1.getDescription()%>
			<% } %>&nbsp;</td>
        <td style="text-align:center" rowspan="<%=numOfSubItems%>">
            <integro:boolean-display value="<%=OB1.getIsOneOffInd()%>" style="yn"/>&nbsp;
        </td>
       <!-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">
                    <integro:boolean-display value="<%=OB1.getRiskTrigger()%>" style="yn"/>&nbsp;
                  </td>
                  <td style="text-align:center" rowspan="<%=numOfSubItems%>">
                <integro:boolean-display value="<%=OB1.getFee()%>" style="yn"/>&nbsp;
                  </td>-->
        <%if (OB1.getFrequency() != Integer.MIN_VALUE) { %>
            <td rowspan="<%=numOfSubItems%>"><%=OB1.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
        <% } else { %>
            <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
        <% } %>

        <%if (OB1.getGracePeriod() != Integer.MIN_VALUE) { %>
            <td rowspan="<%=numOfSubItems%>"><%=OB1.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
        <% } else { %>
            <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
    <%
            }
        }
    %>
    <td><%=subItem.getStatus()%>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDocEndDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDueDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><%=subItem.getDaysOverDue()%>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDeferredDate()%>"/>&nbsp;</td>
    <td style="text-align:center">
        <%
            long daysDeferred = ICMSConstant.LONG_INVALID_VALUE;
            if (subItem.getDeferredDate() != null) {
                Date tempDate = null;
                if (subItem.getDueDate() != null) {
                    tempDate = subItem.getDueDate();
                } else if (subItem.getDocEndDate() != null) {
                    tempDate = subItem.getDocEndDate();
                }
                if (tempDate != null) {
                    daysDeferred = CommonUtil.dateDiff(subItem.getDeferredDate(), tempDate, Calendar.DATE);
                }
            }
            if (daysDeferred != ICMSConstant.LONG_INVALID_VALUE) {
        %> <%=daysDeferred%>&nbsp;
        <% } else { %> - <% } %>
    </td>
    <td style="text-align:center"><%=subItem.getDeferredCount()%> &nbsp;</td>
    <%
        if ((subItem.getStatus().equals(ICMSConstant.CONVENANT_STATE_CHECKED) ||
                subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED) ||
                subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER) ||
                subItem.getStatus().equals(ICMSConstant.CONVENANT_STATE_PENDING_CHECKED)) && status.equals(ICMSConstant.STATE_ACTIVE)) {
    %>
    <td style="text-align:center"><integro:boolean-display value="<%=subItem.getIsVerifiedInd()%>" style="yn"/>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getCheckedDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><a href="#" onclick="goCovenantProcess('<%=itemIndex%>', '<%=subItemIndex%>')">View</a>&nbsp;</td>
    <%
    } else {
    %>
    <td style="text-align:center"><integro:boolean-display value="<%=subItem.getIsVerifiedInd()%>" style="yn"/>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getCheckedDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><a href="#" onclick="goCovenantProcess('<%=itemIndex%>', '<%=subItemIndex%>')">Process</a></td>
    <%
        }
    %>
</tr>
<% filteredSubItemIndex++;
}
} else {
    // the list of sub items is null, display the recurrent item details only
%>
<tr class="<%=rowClass%>">
    <td class="index"><%=row%></td>
    <td><%=OB1.getDescription()%>&nbsp;</td>
    <td style="text-align:center">
        <integro:boolean-display value="<%=OB1.getIsOneOffInd()%>" style="yn"/>&nbsp;
    </td>

   <!-- <td style="text-align:center">
                <integro:boolean-display value="<%=OB1.getRiskTrigger()%>" style="yn"/>&nbsp;
              </td>
              <td style="text-align:center" rowspan="<%=numOfSubItems%>">
	      	<integro:boolean-display value="<%=OB1.getFee()%>" style="yn"/>&nbsp;
	      </td>-->
    <%if (OB1.getFrequency() != Integer.MIN_VALUE) { %>
    <td><%=OB1.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
    <% } else { %>
    <td style="text-align:center">-</td>
    <% } %>
    <%if (OB1.getGracePeriod() != Integer.MIN_VALUE) { %>
    <td><%=OB1.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
    <% } else { %>
    <td style="text-align:center">-</td>
    <% } %>
    <td colspan="9">No Covenant/Condition to be processed for this item.</td>
    <td style="text-align:center"><a href="#" onclick="goCovenantProcess('<%=itemIndex%>', '-1')">View</a>&nbsp;</td>
</tr>
<%
                }
            }
            itemIndex++;
%>
        </logic:iterate>                        
        <%} else {%>
        <tr class="odd">
            <td colspan="16"><bean:message key="label.error.no.document"/></td>
        </tr>
        <%}%>
    </logic:notEmpty>
</logic:present>
<logic:notPresent name="recChkLst" property="convenantList">
	<script language="JavaScript" type="text/JavaScript">
	  document.forms[0].noCovenant.value = 1;
	</script>
    <tr class="odd">
        <td colspan="16"><bean:message key="label.error.no.document"/></td>
    </tr>
</logic:notPresent>
</tbody>
</table></td>
</tr>
</tbody>
</table> --%>

<!--Begin here Update Recurrent Document Receipt List-->

<% row = 0; %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="title.update.rec.receipt"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
<thead>
    <tr>
        <td width="3%"><bean:message key="title.sequence.number"/></td>
        <td width="15%"><bean:message key="label.checklist.doc.description"/></td>
        <%-- <td width="5%"><bean:message key="label.checklist.one.off"/></td> --%>
        <td width="7%"><bean:message key="label.checklist.frequency"/></td>
        <%-- <td width="8%"><bean:message key="label.checklist.grace.period"/></td> --%>
        <td width="8%"><bean:message key="label.checklist.status"/></td>
        <td width="8%"><bean:message key="label.checklist.doc.end.date"/></td>
        <td width="8%"><bean:message key="label.checklist.due.date"/></td>
        <td width="5%"><bean:message key="label.checklist.days.overdue"/></td>
        <td width="8%"><bean:message key="label.checklist.deferred.date"/></td>
        <td width="5%"><bean:message key="label.checklist.days.deferred"/></td>
        <td width="5%"><bean:message key="label.checklist.no.times.deferred"/></td>
        <%-- <td width="5%"><bean:message key="label.checklist.chaser.reminder"/></td> --%>
        <td width="5%"><bean:message key="label.checklist.action"/></td>
        <%-- <td width="5%"><bean:message key="label.checklist.reminder"/></td> --%>
    </tr>
</thead>
<tbody>
<logic:present name="recChkLst" property="checkListItemList" >
<%--		   <logic:iterate id="OB" name="recChkLst"  property="checkListItemList" type="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem"  >--%>
<%
    rowClass = "";
    checkboxIndex = 0;
    IRecurrentCheckListItem[] recCheckListItems = recChkLst.getCheckListItemList();
    // loop thru the list of recurrent items in the check list
    if (recCheckListItems != null  && recCheckListItems.length > 0 ) {
        for (itemIndex = 0; itemIndex < recCheckListItems.length; itemIndex++) {
            // retrieves a recurrent item from the list of recurrent items
            IRecurrentCheckListItem OB = recCheckListItems[itemIndex];
            // retrieves the list of sub items of a recurrent item
            if (OB != null && OB.getDocType()==null) {
                IRecurrentCheckListSubItem[] recCheckListSubItems = OB.getRecurrentCheckListSubItemList();
                // sets the rowClass based on the row number
                row++;
                if (row % 2 != 0) {
                    rowClass = "odd";
                } else {
                    rowClass = "even";
                }

                // sets the frequency unit
                String freUnit = list.getFrequencyValue(OB.getFrequencyUnit());
                if (freUnit == null) {
                    freUnit = "";
                }
                // sets the grace period unit
                String gracePeriodUnit = list.getFrequencyValue(OB.getGracePeriodUnit());
                if (gracePeriodUnit == null) {
                    gracePeriodUnit = "";
                }
                int filteredSubItemIndex = 0;
                int numOfSubItems = 0;
                if (recCheckListSubItems != null) {
                    numOfSubItems = CheckListUtil.filterSubItemListLength(recCheckListSubItems);
                }
                // the list of sub items is not null then loop thru to display each sub item
                if (recCheckListSubItems != null && recCheckListSubItems.length > 0 && numOfSubItems > 0) {
                    // loop thru the list of sub items of a recurrent item
                    for (int subItemIndex = 0; subItemIndex < recCheckListSubItems.length; subItemIndex++) {
                        // retrieves the sub item from the list of sub items

                        checkboxIndex++; //CMS-1452 - moved to before the 'continue' statement to get incremented everytime
                        IRecurrentCheckListSubItem subItem = recCheckListSubItems[subItemIndex];
                        // filter the subitem which is received or waived
                        if (filteredSubItemIndex == 0 && (ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(subItem.getStatus()) ||
                                ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
                            continue;
                        }

%>
<tr class="<%=rowClass%>">
    <% if (filteredSubItemIndex == 0) { %>
        <td class="index" rowspan="<%=numOfSubItems%>"><%=row%></td>
        <td rowspan="<%=numOfSubItems%>"><%=OB.getItemDesc()%>&nbsp;</td>
        <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">
            <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
        </td> --%>

        <%if (OB.getFrequency() != Integer.MIN_VALUE) { %>
        <td rowspan="<%=numOfSubItems%>"><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
        <% } else { %>
            <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
        <% } %>

        <%//if (OB.getGracePeriod() != Integer.MIN_VALUE) { %>
           <%--  <td rowspan="<%=numOfSubItems%>"><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td> --%>
        <% //} else { %>
       <%--  <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td> --%>
    <%
            //}
        }
    %>
    <td><%=subItem.getStatus()%>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDocEndDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDueDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><%=subItem.getDaysOverDue()%>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDeferredDate()%>"/>&nbsp;</td>
    <td style="text-align:center">
        <%
            long daysDeferred = ICMSConstant.LONG_INVALID_VALUE;
            if (subItem.getDeferredDate() != null) {
                Date tempDate = null;
                if (subItem.getDueDate() != null) {
                    tempDate = subItem.getDueDate();
                } else if (subItem.getDocEndDate() != null) {
                    tempDate = subItem.getDocEndDate();
                }
                if (tempDate != null) {
                    daysDeferred = CommonUtil.dateDiff(subItem.getDeferredDate(), tempDate, Calendar.DATE);
                }
            }
            if (daysDeferred != ICMSConstant.LONG_INVALID_VALUE) {
        %> <%=daysDeferred%>&nbsp;
        <% } else { %> - <% } %>
    </td>
    <td style="text-align:center"><%=subItem.getDeferredCount()%> &nbsp;</td>
    <%-- <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td> --%>
    <%
        if ((subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED) ||
                subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED) ||
                subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER) ||
                subItem.getStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED)) && status.equals(ICMSConstant.STATE_ACTIVE)) {
    %>
    <td style="text-align:center"><a href="#" onclick="goRecurrentProcess('<%=itemIndex%>', '<%=subItemIndex%>')">View</a>&nbsp;</td>
    <%
    } else {
    %>
    <td style="text-align:center"><a href="#" onclick="goRecurrentProcess('<%=itemIndex%>', '<%=subItemIndex%>')">Process</a>&nbsp;</td>
    <%
        }
    %>
    <%-- <td style="text-align:center">
        <%
            if ((subItem.getStatus().equals(ICMSConstant.STATE_ITEM_RECEIVED) ||
                    subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED)) || !OB.getChaseReminderInd()) {
        %>
        <input name="check1" type="checkbox" value="<%=checkboxIndex%>" disabled="true"/>
        <%
        } else {
        %>
        <input name="check1" type="checkbox" value="<%=checkboxIndex%>"
                <% if (subItem.getIsPrintReminderInd()) {%> checked="checked" <%}%>/>
                         	<html:checkbox property="isPrintReminderSet"></html:checkbox>

        <%
            }
        %>
    </td> --%>
</tr>
<% filteredSubItemIndex++;
}
} else {
    // the list of sub items is null, display the recurrent item details only
%>
<tr class="<%=rowClass%>">
    <td class="index"><%=row%></td>
    <td><%=OB.getItemDesc()%>&nbsp;</td>
   <%--  <td style="text-align:center">
        <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
    </td> --%>
    <%if (OB.getFrequency() != Integer.MIN_VALUE) { %>
        <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
    <% } else { %>
        <td style="text-align:center">-</td>
    <% } %>

    <%-- <%if (OB.getGracePeriod() != Integer.MIN_VALUE) { %>
        <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
    <% } else { %>
        <td style="text-align:center">-</td>
    <% } %>
 --%>
    <td colspan="7"><bean:message key="label.error.no.recurrent.documents"/></td>
    <%-- <td style="text-align:center">
        <integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;
    </td> --%>

    <td style="text-align:center"><a href="#" onclick="goRecurrentProcess('<%=itemIndex%>', '-1')">View</a>&nbsp;</td>
    <!-- <td style="text-align:center"><input name="dummy" type="checkbox" value="dummy_value" disabled="true"/></td> -->
</tr>
<%
                }
            }else if (OB != null && OB.getDocType()!=null) {
            	//Skip the message contains annexture or DP doc 
            	}else {%>
            
            <tr class="odd">
            <td colspan="15"><bean:message key="label.error.no.document"/></td>
        </tr>

     <% }
        }
    }else{ %>
    <tr class="odd">
        <td colspan="15"><bean:message key="label.error.no.document"/></td>
    </tr>

 <% }%>
<%--</logic:iterate>--%>
</logic:present>
<logic:notPresent name="recChkLst" property="checkListItemList">
	<script language="JavaScript" type="text/JavaScript">
	  document.forms[0].noRecurrent.value=1;
	</script>
    <tr class="odd">
        <td colspan="15"><bean:message key="label.error.no.document"/></td>
    </tr>
</logic:notPresent>
</tbody>
</table></td>
</tr>
</tbody>
</table>


<!--Begin here Update DP Checklist Receipt List-->

<% row = 0; %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td>
        	<h3>
        	Update DP Checklist Receipt
        	<%-- <bean:message key="title.update.rec.receipt"/> --%>
        	</h3>
        </td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
<thead>
    <tr>
        <td width="3%"><bean:message key="title.sequence.number"/></td>
        <td width="15%"><bean:message key="label.checklist.doc.description"/></td>
        <%-- <td width="5%"><bean:message key="label.checklist.one.off"/></td> --%>
        <td width="7%"><bean:message key="label.checklist.frequency"/></td>
        <%-- <td width="8%"><bean:message key="label.checklist.grace.period"/></td> --%>
        <td width="8%"><bean:message key="label.checklist.status"/></td>
        <%-- <td width="8%"><bean:message key="label.checklist.doc.end.date"/></td> --%>
        <td width="8%"><bean:message key="label.checklist.due.date"/></td>
        <td width="5%"><bean:message key="label.checklist.days.overdue"/></td>
        <td width="8%"><bean:message key="label.checklist.deferred.date"/></td>
        <td width="5%"><bean:message key="label.checklist.days.deferred"/></td>
        <td width="5%"><bean:message key="label.checklist.no.times.deferred"/></td>
        <%-- <td width="5%"><bean:message key="label.checklist.chaser.reminder"/></td> --%>
        <td width="5%"><bean:message key="label.checklist.action"/></td>
        <%-- <td width="5%"><bean:message key="label.checklist.reminder"/></td> --%>
    </tr>
</thead>
<tbody>
<logic:present name="recChkLst" property="checkListItemList" >
<%--		   <logic:iterate id="OB" name="recChkLst"  property="checkListItemList" type="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem"  >--%>
<%
    rowClass = "";
    checkboxIndex = 0;
    IRecurrentCheckListItem[] recCheckListItems = recChkLst.getCheckListItemList();
    // loop thru the list of recurrent items in the check list
    if (recCheckListItems != null  && recCheckListItems.length > 0) {
        for (itemIndex = 0; itemIndex < recCheckListItems.length; itemIndex++) {
            // retrieves a recurrent item from the list of recurrent items
            IRecurrentCheckListItem OB = recCheckListItems[itemIndex];
            // retrieves the list of sub items of a recurrent item
            if (OB != null && "DP".equals(OB.getDocType())) {
                IRecurrentCheckListSubItem[] recCheckListSubItems = OB.getRecurrentCheckListSubItemList();
                // sets the rowClass based on the row number
                row++;
                if (row % 2 != 0) {
                    rowClass = "odd";
                } else {
                    rowClass = "even";
                }

                // sets the frequency unit
                String freUnit = list.getFrequencyValue(OB.getFrequencyUnit());
                if (freUnit == null) {
                    freUnit = "";
                }
                // sets the grace period unit
                String gracePeriodUnit = list.getFrequencyValue(OB.getGracePeriodUnit());
                if (gracePeriodUnit == null) {
                    gracePeriodUnit = "";
                }
                int filteredSubItemIndex = 0;
                int numOfSubItems = 0;
                if (recCheckListSubItems != null) {
                    numOfSubItems = CheckListUtil.filterSubItemListLength(recCheckListSubItems);
                }
                // the list of sub items is not null then loop thru to display each sub item
                if (recCheckListSubItems != null && recCheckListSubItems.length > 0 && numOfSubItems > 0) {
                    // loop thru the list of sub items of a recurrent item
                    for (int subItemIndex = 0; subItemIndex < recCheckListSubItems.length; subItemIndex++) {
                        // retrieves the sub item from the list of sub items

                        checkboxIndex++; //CMS-1452 - moved to before the 'continue' statement to get incremented everytime
                        IRecurrentCheckListSubItem subItem = recCheckListSubItems[subItemIndex];
                        // filter the subitem which is received or waived
                        if (filteredSubItemIndex == 0 && (ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(subItem.getStatus()) ||
                                ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
                            continue;
                        }

%>
<tr class="<%=rowClass%>">
    <% if (filteredSubItemIndex == 0) { %>
        <td class="index" rowspan="<%=numOfSubItems%>"><%=row%></td>
        <td rowspan="<%=numOfSubItems%>"><%=OB.getItemDesc()%>&nbsp;</td>
        <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">
            <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
        </td> --%>

        <%if (OB.getFrequency() != Integer.MIN_VALUE) { %>
        <td rowspan="<%=numOfSubItems%>"><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
        <% } else { %>
            <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
        <% } %>

        <%//if (OB.getGracePeriod() != Integer.MIN_VALUE) { %>
            <%-- <td rowspan="<%=numOfSubItems%>"><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td> --%>
        <% //} else { %>
        <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td> --%>
    <%
            //}
        }
    %>
    <td><%=subItem.getStatus()%>&nbsp;</td>
    <%-- <td style="text-align:center"><integro:date object="<%=subItem.getDocEndDate()%>"/>&nbsp;</td> --%>
    <td style="text-align:center"><integro:date object="<%=subItem.getDueDate()%>"/>&nbsp;</td>
    <td style="text-align:center"><%=subItem.getDaysOverDue()%>&nbsp;</td>
    <td style="text-align:center"><integro:date object="<%=subItem.getDeferredDate()%>"/>&nbsp;</td>
    <td style="text-align:center">
        <%
            long daysDeferred = ICMSConstant.LONG_INVALID_VALUE;
            if (subItem.getDeferredDate() != null) {
                Date tempDate = null;
                if (subItem.getDueDate() != null) {
                    tempDate = subItem.getDueDate();
                } else if (subItem.getDocEndDate() != null) {
                    tempDate = subItem.getDocEndDate();
                }
                if (tempDate != null) {
                    daysDeferred = CommonUtil.dateDiff(subItem.getDeferredDate(), tempDate, Calendar.DATE);
                }
            }
            if (daysDeferred != ICMSConstant.LONG_INVALID_VALUE) {
        %> <%=daysDeferred%>&nbsp;
        <% } else { %> - <% } %>
    </td>
    <td style="text-align:center"><%=subItem.getDeferredCount()%> &nbsp;</td>
    <%-- <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td> --%>
    <%
        if ((subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED) ||
                subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED) ||
                subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER) ||
                subItem.getStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED)) && status.equals(ICMSConstant.STATE_ACTIVE)) {
        	//goRecurrentDPProcess
    %>
    <td style="text-align:center"><a href="#" onclick="goRecurrentDPProcess('<%=itemIndex%>', '<%=subItemIndex%>','<%=numOfSubItems%>')">View</a>&nbsp;</td>
    <%
    } else {
    %>
    <td style="text-align:center"><a href="#" onclick="goRecurrentDPProcess('<%=itemIndex%>', '<%=subItemIndex%>','<%=numOfSubItems%>')">Process</a>&nbsp;</td>
    <%
        }
    %>
    <%-- <td style="text-align:center">
        <%
            if ((subItem.getStatus().equals(ICMSConstant.STATE_ITEM_RECEIVED) ||
                    subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED)) || !OB.getChaseReminderInd()) {
        %>
        <input name="check1" type="checkbox" value="<%=checkboxIndex%>" disabled="true"/>
        <%
        } else {
        %>
        <input name="check1" type="checkbox" value="<%=checkboxIndex%>"
                <% if (subItem.getIsPrintReminderInd()) {%> checked="checked" <%}%>/>
                         	<html:checkbox property="isPrintReminderSet"></html:checkbox>

        <%
            }
        %>
    </td>
 --%></tr>
<% filteredSubItemIndex++;
}
} else {
    // the list of sub items is null, display the recurrent item details only
%>
<tr class="<%=rowClass%>">
    <td class="index"><%=row%></td>
    <td><%=OB.getItemDesc()%>&nbsp;</td>
    <%-- <td style="text-align:center">
        <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
    </td> --%>
    <%if (OB.getFrequency() != Integer.MIN_VALUE) { %>
        <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
    <% } else { %>
        <td style="text-align:center">-</td>
    <% } %>

    <%-- <%if (OB.getGracePeriod() != Integer.MIN_VALUE) { %>
        <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
    <% } else { %>
        <td style="text-align:center">-</td>
    <% } %> --%>

    <td colspan="6"><bean:message key="label.error.no.recurrent.documents"/></td>
    <%-- <td style="text-align:center">
        <integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;
    </td> --%>

    <td style="text-align:center"><a href="#" onclick="goRecurrentProcess('<%=itemIndex%>', '-1')">View</a>&nbsp;</td>
    <!-- <td style="text-align:center"><input name="dummy" type="checkbox" value="dummy_value" disabled="true"/></td> -->
</tr>
<%
                }
            }else if(OB != null ){
            	//Skip the message contains annexture or recurrent doc  	
            }else{ %>
            <tr class="odd">
                <td colspan="15"><bean:message key="label.error.no.document"/></td>
            </tr>

     <% }
        }
    }else{ %>
    <tr class="odd">
        <td colspan="15"><bean:message key="label.error.no.document"/></td>
    </tr>

 <% }%>
<%--</logic:iterate>--%>
</logic:present>
<logic:notPresent name="recChkLst" property="checkListItemList">
	<script language="JavaScript" type="text/JavaScript">
	  document.forms[0].noRecurrent.value=1;
	</script>
    <tr class="odd">
        <td colspan="15"><bean:message key="label.error.no.document"/></td>
    </tr>
</logic:notPresent>
</tbody>
</table></td>
</tr>
</tbody>
</table>
<%if (ICMSConstant.STATE_REJECTED.equals(status)) { %>
<p/><p/><p/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
        <tr>
            <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
            <td class="odd"><textarea name="remarks" rows="4" cols="100"></textarea></td>
        </tr>
        <tr>
            <td class="fieldname"><bean:message key="label.checklist.last.action.by"/></td>
            <td class="even">&nbsp;<%=lastActionBy%></td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.checklist.last.remarks.made"/></td>
            <td><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
        </tr>
    </tbody>
</table>
<% } %>

<table border="0" align="center" cellpadding="0" cellspacing="0">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align="center"><html:errors property="noCovenantRecurrent"/></td>
	</tr>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="89">&nbsp;</td>
        <td width="75">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)" onclick="submitPage()">
            <img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1"/></a>
        </td>
        <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)" onClick="savePage()">
            <img src="img/save1.gif" name="Image2"  border="0"  id="Image2"/></a>
        </td>
     <td><a href="#" 
        target="_blank" rel="noopener noreferrer" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/print2.gif',1)" onclick="return printDoc(this)" >
            <img src="img/print1.gif" name="Image11" width="75" height="22" border="0" id="Image3"/></a>
        </td>
        
        <%
        	if(ICMSConstant.STATE_REJECTED.equals(status) ||ICMSConstant.STATE_DRAFT.equals(status)){
        %>
                    
        <td width="100" valign="baseline" align="center">
			<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    	</td>
    	<%}%>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>