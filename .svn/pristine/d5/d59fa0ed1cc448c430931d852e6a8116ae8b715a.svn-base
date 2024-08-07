<!--Modified by Pratheepa for CR234-->
<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.ArrayList,
                 java.util.Iterator,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.app.recurrent.bus.IConvenantSubItem,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.cms.app.recurrent.bus.ConvenantComparator,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Arrays,
                 com.integrosys.cms.app.commodity.deal.bus.finance.PeriodUnit,
                 org.apache.commons.lang.StringUtils,
                 org.apache.commons.lang.ArrayUtils,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/locale.jsp" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recurrent/recurrent_list.jsp,v 1.32 2006/10/27 08:19:27 hmbao Exp $
     *
     * Purpose: Read the data of the Collateral
     * Description: Type - Commodity
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.32 $
     * Date: $Date: 2006/10/27 08:19:27 $
     * Tag: $Name:  $
     */
%>
<%
   // System.out.println("Entering jsp");
    IRecurrentCheckListTrxValue checkListTrxVal = (IRecurrentCheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListAction.checkListTrxVal");
    IRecurrentCheckList recChkLst = (IRecurrentCheckList) session.getAttribute("com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListAction.recChkLst");
    //List conList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListAction.conList");


    String remarks = "";
    String lastActionBy = "";
    if (recChkLst != null)
        pageContext.setAttribute("recChkLst", recChkLst);

    int row = 0;
    String status = "";
    if (checkListTrxVal != null) {
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }

    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";
    
    
    //System.out.println("****event:::" + event);
    
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

function gotopage(aLocation) {
    window.location = aLocation;
}

function MM_jumpMenu(targ, selObj, restore) { //v3.0
    eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
    if (restore) selObj.selectedIndex = 0;
}

function addRecurrent() {
    //alert('add recurrent');
    if (checkRecurrent() == true && checkCovenant() == true) {
        document.forms[0].event.value = "prepare_add_recurrent";
        document.forms[0].submit();
    } else {
        alert('Please remove recurrent/ Covenant/Condition items before adding new recurrent item');
    }

}

function removeRecurrent() {
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
                    temp = temp + "," + formObj.check2[j].value;
                }
                j++;
            }
        }
    } else {
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

    if (!checkCovenant()) {
        alert('You may remove document(s) from one section at one time. Please un-check all remove selections from one section to proceed.');
        return false;
    }

    if (temp == "") {
        alert('<bean:message key="label.please.select"/> recurrent items to remove');
        return false;
    }
    temp = temp.substring(1);
    formObj.removeIndex.value = temp;
    //alert('remove index'+temp);
    document.forms[0].removeIndex.value = temp;
    document.forms[0].event.value = "remove_recurrent";
    document.forms[0].submit();
}

function addCovenant() {
    //alert('add covenant');
    if (checkRecurrent() == true && checkCovenant() == true) {
        document.forms[0].event.value = "prepare_add_covenant";
        document.forms[0].submit();
    } else {
        alert('Please remove recurrent/ Covenant/Condition items before adding new Covenant/Condition items');
    }

}

function removeCovenant() {
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
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.check1[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check1.value;
                }
            }
        }
    }
    if (!checkRecurrent()) {
        alert('You may remove document(s) from one section at one time. Please un-check all remove selections from one section to proceed.');
        return false;
    }
    if (temp == "") {
        alert('<bean:message key="label.please.select"/> Covenant/Condition items to remove');
        return false;
    }
    temp = temp.substring(1);
    formObj.removeIndex.value = temp;
    //alert('remove index'+temp);
    document.forms[0].removeIndex.value = temp;
    document.forms[0].event.value = "remove_covenant";
    document.forms[0].submit();
}

function goRecurrentViewEdit(selectObj, ind) {
    var selectIndex = selectObj.selectedIndex;
    var sel = selectObj.options[selectIndex].value;
    document.forms[0].index.value = ind;
    if (sel == "0") {
        return false;
    }
    if (sel == "1") {
        document.forms[0].event.value = "view_recurrent_item";
    }
    if (sel == "2") {
        document.forms[0].event.value = "edit_recurrent_item";
    }
    if (checkRecurrent() == true && checkCovenant() == true) {
        document.forms[0].submit();
    } else {
        alert('Please remove recurrent/Condition items before editing/viewing');
    }
}

function goCovenantViewEdit(selectObj, ind) {

    var selectIndex = selectObj.selectedIndex;
    var sel = selectObj.options[selectIndex].value;
    document.forms[0].index.value = ind;
    if (sel == "0") {
        return false;
    }
    if (sel == "1") {
        document.forms[0].event.value = "view_covenant_item";
    }
    if (sel == "2") {
        document.forms[0].event.value = "edit_covenant_item";
    }
    if (checkRecurrent() == true && checkCovenant() == true) {
        document.forms[0].submit();
    } else {
        alert('Please remove recurrent/Condition items before editing/viewing');
    }
}

function checkCovenant() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "$";
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
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.check1[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check1') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check1.value;
                }
            }
        }
    }
    //alert(temp);
    if (temp == "$") {
        return true;
    }
    return false;
}


function checkRecurrent() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "$";
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
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.check2[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'check2') {
                var obj = formObj.elements[i];
                if (obj.checked) {
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.check2.value;
                }
            }
        }
    }
    //alert(temp);
    if (temp == "$") {
        return true;
    }
    return false;
}

function submitPage() {
    var flag = false;
    if (checkRecurrent() == true && checkCovenant() == true) {
        document.forms[0].event.value = "submit";
        document.forms[0].submit();
    } else {
        alert('Please remove recurrent/ Covenant/Condition items before submiting');
    }
}

function savePage() {
    var flag = false;
    if (checkRecurrent() == true && checkCovenant() == true) {
        document.forms[0].event.value = "save";
        document.forms[0].submit();
    } else {
        alert('Please remove recurrent/ Covenant/Condition items before saving');
    }
}




//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="RecurrentCheckList">

<input type="hidden" name="event"/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>
<html:hidden property="limitProfileId"/>
<html:hidden property="subProfileId"/>
<html:hidden property="noCovenant"/>
<html:hidden property="noRecurrent"/>

<!-- InstanceBeginEditable name="Content" -->

<!--Table for Maintain Covenant/ Fee/ Risk Trigger Checklist -->

<%-- <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Maintain Covenant/Condition Checklist</h3></td>
        <td align="right" valign="bottom"><input type="button" value="Add New" class="btnNormal" onclick="addCovenant()"/>
            <input type="button" onclick="removeCovenant()" value="Remove" class="btnNormal"/></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
    <tr>
        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
                <tr>
                    <td width="4%"><bean:message key="title.sequence.number"/></td>
                    <td width="29%"><bean:message key="label.checklist.covenant.condition"/></td>
                    <td width="10%"><bean:message key="label.checklist.one.off"/></td>
                    <td width="10%"><bean:message key="label.checklist.frequency"/></td>
                    <td width="10%"><bean:message key="label.checklist.trigger.end.date"/></td>
                    <td width="8%"><bean:message key="label.checklist.grace.period"/></td>
                    <td width="10%"><bean:message key="label.checklist.last.trigger.entry"/></td>
                    <td width="10%"><bean:message key="label.checklist.due.date"/></td>
                    <td width="10%"><bean:message key="label.checklist.action"/></td>
                    <td width="5%"><bean:message key="label.checklist.delete"/></td>
                </tr>
            </thead>
            <tbody>

To initialize the value. Necessary to find out if there's no covenant / recurrent to be submitted / saved yet. 
This way, an error message will be displayed whenever a user tries to submit / save while there's no recurrent/covenant to be saved            
<script language="JavaScript" type="text/JavaScript">
  document.forms[0].noCovenant.value = 0;
  document.forms[0].noRecurrent.value = 0;
</script>
            <logic:present name="recChkLst" property="convenantList">
                <logic:empty name="recChkLst" property="convenantList">
					<script language="JavaScript" type="text/JavaScript">
						document.forms[0].noCovenant.value = 1;
					</script>
                    <tr class="odd">
                        <td colspan="11"><bean:message key="label.error.no.document"/></td>
                    </tr>
                </logic:empty>
                <logic:notEmpty name="recChkLst" property="convenantList">
                    <%if (recChkLst.getConvenantList().length > 0) {%>
                    <logic:iterate id="OB1" name="recChkLst" property="convenantList" type="com.integrosys.cms.app.recurrent.bus.IConvenant">
                        <%
                            String rowClass = "";
                            row++;
                            if (row % 2 != 0) {
                                rowClass = "odd";
                            } else {
                                rowClass = "even";
                            }
                            // cr26
                            String freUnit1 = "";
                            boolean fee1 = OB1.getFee();
                            boolean riskTrigger1 = OB1.getRiskTrigger();
                            String itemType = null;
                            if (fee1)
                                itemType = "Fee";
                            else if (riskTrigger1)
                                itemType = "Risk Trigger";
                            else
                                itemType = "Covenant";
                                
                            freUnit1 = OB1.getFrequencyUnit();
                            FrequencyList list1 = FrequencyList.getInstance();
                            freUnit1 = list1.getFrequencyValue(freUnit1);

                            if (freUnit1 == null) {
                                freUnit1 = "";
                            }
                            String gracePeriodUnit1 = list1.getFrequencyValue(OB1.getGracePeriodUnit());
                            if (gracePeriodUnit1 == null) {
                                gracePeriodUnit1 = "";
                            }
                            // cr26

                        %>
                        <bean:define id="itemType1" value="<%=itemType%>"/>
                        <tr class="<%=rowClass%>">
                            <td class="index"><%=row%></td>
                            <td>&nbsp;
								<% if (!OB1.getIsParameterizedDesc()) { %>
									<%=OB1.getDescription()%>
								<% } else { %>
									<integro:common-code categoryCode="COVENANT_CONDITION" entryCode="<%=OB1.getDescription()%>" display="true" descWithCode="false"/>
								<% } %>
								</td>
                                cr 26
                            <td><integro:boolean-display value="<%=OB1.getIsOneOffInd()%>" style="yn"/>&nbsp;</td>
                            <% if (!OB1.getIsOneOffInd() && OB1.getFrequency() != Integer.MIN_VALUE) { %>
                            <td><%=OB1.getFrequency()%>&nbsp;<%=freUnit1%>&nbsp;</td>
                            <% } else { %>
                            <td style="text-align:center">-</td>
                            <% } %>
                            <td style="text-align:center"><integro:date object="<%=OB1.getInitialDocEndDate()%>"/>&nbsp;</td>
                            <% if (OB1.getGracePeriod() != Integer.MIN_VALUE) { %>
                            <td><%=OB1.getGracePeriod()%>&nbsp;<%=gracePeriodUnit1%>&nbsp;</td>
                            <% } else {
                            %>
                            <td style="text-align:center">-</td>
                            <% } %>
                            <td style="text-align:center"><integro:date object="<%=OB1.getLastDocEntryDate()%>"/>&nbsp;</td>
                            <td style="text-align:center"><integro:date object="<%=OB1.getInitialDueDate()%>"/>&nbsp;</td>
                            <td style="text-align:center"><select name="select1" onchange="goCovenantViewEdit(this,'<%=row-1%>')">
                                <option value="0" selected="selected"><bean:message key="label.please.select"/></option>
                                <option value="1"><bean:message key="label.view"/></option>
                                <%
									if ((OB1.getConvenantID()<=0 || OB1.getSubItemsByCondition(ICMSConstant.RECCOV_SUB_ITEM_COND_PENDING).length>0)
										&& ArrayUtils.indexOf(StringUtils.split(PropertyManager.getValue("filter.edit.covenant.item.source.id", ""), ","), 
													OB1.getSourceId()) == ArrayUtils.INDEX_NOT_FOUND) {
                                %>
                                <option value="2"><bean:message key="label.edit"/></option>
                                <%}%>
                            </select></td>
                            <td style="text-align:center">
                            <%
                            	if (ArrayUtils.indexOf(StringUtils.split(PropertyManager.getValue("filter.edit.covenant.item.source.id", ""), ","), 
													OB1.getSourceId()) == ArrayUtils.INDEX_NOT_FOUND) {
                            %>
                           		<input type="checkbox" name="check1" value="<%=row-1%>"/>
                            <%
                            	}
                            %>&nbsp;
                            </td>
                        </tr>
                            </logic:iterate>                        
                            <%} else {%>
							<script language="JavaScript" type="text/JavaScript">
							  document.forms[0].noCovenant.value = 1;
							</script>
                            <tr class="odd">
                                <td colspan="11"><bean:message key="label.error.no.document"/></td>
                            </tr>
                            <%}%>
                        </logic:notEmpty>
                    </logic:present>
                    <logic:notPresent name="recChkLst" property="convenantList">
						<script language="JavaScript" type="text/JavaScript">
						  document.forms[0].noCovenant.value = 1;
						</script>
                        <tr class="odd">
                            <td colspan="11"><bean:message key="label.error.no.document"/></td>
                        </tr>
                    </logic:notPresent>
            </tbody>
        </table></td>
    </tr>
</tbody>
</table>
 --%>
<!--Table for Maintain Recurrent Document Checklist-->

<% row = 0; %>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td height="34">
                <h3><bean:message key="title.maintain.rec.doc.checklist"/></h3></td>
            <td align="right" valign="bottom"><input type="button" value="Add New" class="btnNormal" onclick="addRecurrent()"/>
                <input type="button" value="Remove" class="btnNormal" onclick="removeRecurrent()"/></td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                    <tr>
                        <td width="4%"><bean:message key="title.sequence.number"/></td>
                        <td width="20%"><bean:message key="label.checklist.doc.description"/></td>
                        <%-- <td width="5%"><bean:message key="label.checklist.one.off"/></td> --%>
                        <td width="10%"><bean:message key="label.checklist.frequency"/></td>
                        <td width="10%"><bean:message key="label.checklist.doc.end.date"/></td>
                        <%-- <td width="8%"><bean:message key="label.checklist.grace.period"/></td> --%>
                        <td width="10%"><bean:message key="label.checklist.doc.due.date"/></td>
                        <td width="15%"><bean:message key="label.checklist.last.doc.entry.date"/></td>
                        <%-- <td width="8%"><bean:message key="label.checklist.chaser.reminder"/></td> --%>
                        <td width="5%"><bean:message key="label.checklist.action"/></td>
                        <td width="5%"><bean:message key="label.checklist.delete"/></td>
                    </tr>
                </thead>
                <tbody>
                    <logic:present name="recChkLst" property="checkListItemList">
                        <logic:empty name="recChkLst" property="checkListItemList">
						<script language="JavaScript" type="text/JavaScript">
							  document.forms[0].noRecurrent.value=1;
						</script>
                            <tr class="odd">
                                <td colspan="11"><bean:message key="label.error.no.document"/></td>
                            </tr>
                        </logic:empty>
                        <logic:notEmpty name="recChkLst" property="checkListItemList">
                            <%--<%System.out.println("length is:" + recChkLst.getCheckListItemList().length);%>--%><!-- -->
                            <%if (recChkLst.getCheckListItemList().length > 0) {%>
                            <logic:iterate id="OB" name="recChkLst" property="checkListItemList" type="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem">
                                <%
                                	if(OB.getDocType()==null){
//                                    System.out.println("inside");
                                    String rowClass = "";
                                    row++;
                                    if (row % 2 != 0) {
                                        rowClass = "odd";
                                    } else {
                                        rowClass = "even";
                                    }
                                    String freUnit = "";
                                    freUnit = OB.getFrequencyUnit();
                                    FrequencyList list = FrequencyList.getInstance();
                                    freUnit = list.getFrequencyValue(freUnit);
                                    if (freUnit == null) {
                                        freUnit = "";
                                    }
                                    String gracePeriodUnit = list.getFrequencyValue(OB.getGracePeriodUnit());
                                    if (gracePeriodUnit == null) {
                                        gracePeriodUnit = "";
                                    }
                                %>
                                <tr class="<%=rowClass%>">
                                    <td class="index"><%=row%></td>
                                    <td><bean:write name="OB" property="item.itemDesc"/>&nbsp;</td>
                                    <%-- <td><integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;</td> --%>
                                    <% if (!OB.getIsOneOffInd() && OB.getFrequency() != Integer.MIN_VALUE) { %>
                                    <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
                                    <% } else { %>
                                    <td style="text-align:center">-</td>
                                    <% } %>
                                    <td style="text-align:center"><integro:date object="<%=OB.getInitialDocEndDate()%>"/>&nbsp;</td>
                                    <%-- <% if (OB.getGracePeriod() != Integer.MIN_VALUE) { %>
                                    <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
                                    <% } else {
                                    %>
                                    <td style="text-align:center">-</td>
                                    <% } %> --%>
                                    <td style="text-align:center"><integro:date object="<%=OB.getInitialDueDate()%>"/>&nbsp;</td>
                                    <td style="text-align:center"><integro:date object="<%=OB.getLastDocEntryDate()%>"/>&nbsp;</td>
                                    <%-- <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td> --%>
                                    <td style="text-align:center">
                                        <select name="select1" onchange="goRecurrentViewEdit(this,'<%=row-1%>')">
                                            <option value="0" selected="selected"><bean:message key="label.please.select"/></option>
                                            <option value="1"><bean:message key="label.view"/></option>
                                            <%
												if (OB.getCheckListItemID()<=0 || OB.getSubItemsByCondition(ICMSConstant.RECCOV_SUB_ITEM_COND_PENDING).length>0) { 
                                            %>
                                            <option value="2"><bean:message key="label.edit"/></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td style="text-align:center"><input type="checkbox" name="check2" value='<%=row-1%>'/></td>
                                </tr>
                                <%} %>
                            </logic:iterate>
                            <%} else {%>
							<script language="JavaScript" type="text/JavaScript">
							  document.forms[0].noRecurrent.value=1;
							</script>
                            <tr class="odd">
                                <td colspan="11"><bean:message key="label.error.no.document"/></td>
                            </tr>
                            <%}%>
                        </logic:notEmpty>
                    </logic:present>
                    <logic:notPresent name="recChkLst" property="checkListItemList">
						<script language="JavaScript" type="text/JavaScript">
						  document.forms[0].noRecurrent.value=1;
						</script>
                        <tr class="odd">
                            <td colspan="11"><bean:message key="label.error.no.document"/></td>
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

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        
        <td width="75" valign="baseline" align="center">
        	<% if (PropertyManager.getBoolean("recurrent.maintain.suppress.checker.approval")) { %>
            <a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/confirm2.gif',1)">
                <img src="img/confirm1.gif" name="Image3" border="0"  id="Image3"/>
            </a>
            <% } else { %>
           	<a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)">
                <img src="img/submit1.gif" name="Image3" border="0"  id="Image3"/>
            </a>
            <% } %>
         </td>
         <td>
            <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)" onClick="savePage()">
                <img src="img/save1.gif"  name="Image2"  border="0" id="Image2"/>
            </a>
        </td>
        
        <%if(ICMSConstant.STATE_REJECTED.equals(status) ||ICMSConstant.STATE_DRAFT.equals(status)){
        
        %>
        
        
         <td width="100" valign="baseline" align="center">
			<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    	</td>
    	<%}%>
    	
    	  	
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>