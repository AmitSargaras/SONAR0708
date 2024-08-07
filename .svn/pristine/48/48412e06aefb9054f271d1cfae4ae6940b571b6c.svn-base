<!--Modified by Pratheepa for CR234 -->
<%@ page
	import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,java.util.List,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.cms.ui.common.FrequencyList,com.integrosys.cms.ui.checklist.CheckListUtil,com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,com.integrosys.cms.app.recurrent.bus.IConvenant,com.integrosys.cms.app.recurrent.bus.IConvenantSubItem,java.util.Date,com.integrosys.cms.app.common.util.CommonUtil,com.integrosys.cms.app.recurrent.bus.ConvenantComparator,java.util.Calendar"%>
<%@ page
	import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
			com.integrosys.cms.app.customer.bus.OBCMSCustomer,
			com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
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
		IRecurrentCheckListTrxValue checkListTrxVal = (IRecurrentCheckListTrxValue) session
				.getAttribute("com.integrosys.cms.ui.checklist.annexure.AnnexureAction.checkListTrxVal");
		IRecurrentCheckList recChkLst = (IRecurrentCheckList) session
				.getAttribute("com.integrosys.cms.ui.checklist.annexure.AnnexureAction.recChkLst");
		//List conList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.conList");
		String bankingMethod = (String)session.getAttribute("com.integrosys.cms.ui.checklist.annexure.AnnexureAction.bankingMethod");
		boolean isBranchUser=false;
	    boolean isCputUser=false;
		ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
	    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
	    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
	    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
	    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
	    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
	    		){
	    	isCputUser=true;
	    }
		String remarks = "";
		String lastActionBy = "";
		if (recChkLst != null)
			pageContext.setAttribute("recChkLst", recChkLst);
		//        if (conList != null)
		//            pageContext.setAttribute("conList", conList);
		String custTypeTrxID = (String) request.getAttribute("custTypeTrxID");
		String event = (String) request.getAttribute("event");
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
		if (lastActionBy == null)
			lastActionBy = "";
		if (remarks == null)
			remarks = "";
		
		  //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
	    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	    boolean isActive=true;
	    if(null!=customer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(customer.getStatus())){
	    isActive=false;
	    	}
	    
	    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
	  //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
%>




<%@page import="com.integrosys.base.techinfra.dbsupport.SequenceManager"%>
<%@page import="com.integrosys.cms.ui.checklist.annexure.AnnexureAction"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>


<script language="JavaScript" type="text/JavaScript">

function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
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
	document.forms[0].actionType.value = "VIEW";
    document.forms[0].index.value = ind;
    document.forms[0].subItemIndex.value = subItemIndex;
    document.forms[0].event.value = "view_annexure_item";
    document.forms[0].submit();
}

function printDoc(objhref) {
    setReminder();
    temp = document.forms[0].reminderIndex.value;
    if (temp.length > 0) {
      objhref.href= "Annexure.do?event=print_doc&reminderIndex=" + document.forms[0].reminderIndex.value;
 return true;
    } else {
        alert('Please select the reminders to print!');
        return false;
    }
}

function maintainChecklist(){
	document.forms[0].event.value = "maintain_annexure_list";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="Annexure">

	<!--Hidden variable to keep  the track-->
	<input type="hidden" name="event" />
	<input type="hidden" name="index" />
	<input type="hidden" name="subItemIndex" />
	<input type="hidden" name="reminderIndex" />
	<input type="hidden" name="reminderIndex2" />
	<html:hidden property="limitProfileId" />
	<html:hidden property="subProfileId" />
	<input type="hidden" name="actionType" />
	<input type="hidden" name="custTypeTrxID" value="<%=custTypeTrxID %>"/>


	<!--Begin here Update Recurrent Document Receipt List-->

	<%
		row = 0;
	%>
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection" style="margin-top: 10px">
		<thead>
			<tr>
				<%if(!event.equals(AnnexureAction.EVENT_CHECKER_ANNEXURE_LIST)){
					if(isCputUser && isActive){
					%>
				<td>
				<h3><bean:message key="label.checklist.annexure.title" /></h3>
				</td>
				<%}else{%>
					<td>
				<h3>View Exchange of Information</h3>
				</td> 
				<%}}else{ %>
				<td>
				<h3>View Exchange of Information</h3>
				</td> 
				<% } %>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
			
			<%if(bankingMethod!=null && bankingMethod.equalsIgnoreCase("SOLE")){ %>
				<tr class="odd">
					<td colspan="15"><b>Banking Method is Sole.</b></td>
				</tr>
			<% }else{ %>
			
			<%
				if(!event.equals(AnnexureAction.EVENT_CHECKER_ANNEXURE_LIST)){
				
					if(isCputUser && isActive){
					if ((bankingMethod!=null && !bankingMethod.equals("SOLE")) && recChkLst == null) {
			%>
			<tr>
				<td valign="bottom" align="right"><input type="button"
					name="Submit" value="Prepare" class="btnNormal"
					onclick="maintainChecklist()" /></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td valign="bottom" align="right"><input type="button"
					name="Submit" value="Prepare" class="btnNormal" disabled="disabled" />
				</td>
			</tr>
			<%
				}}}
			%>
		</thead>
		
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInfo">
					<thead>
						<tr>
							<td width="3%"><bean:message key="title.sequence.number" /></td>
							<td width="15%"><bean:message
								key="label.checklist.doc.description" /></td>
							<td width="8%"><bean:message key="label.checklist.due.date" /></td>
							<td width="8%"><bean:message key="label.checklist.status" /></td>
							<td width="8%"><bean:message
								key="label.checklist.annexure.action.date" /></td>
							<td width="5%"><bean:message key="label.checklist.action" /></td>
						</tr>
					</thead>
					<tbody>
						<logic:present name="recChkLst" property="checkListItemList">
							<%--		   <logic:iterate id="OB" name="recChkLst"  property="checkListItemList" type="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem"  >--%>
							<%
								rowClass = "";
											checkboxIndex = 0;
											IRecurrentCheckListItem[] recCheckListItems = recChkLst.getCheckListItemList();
											
											// loop thru the list of recurrent items in the check list
											if (recCheckListItems != null && recCheckListItems.length > 0) {
												for (int itemIndex = 0; itemIndex < recCheckListItems.length; itemIndex++) {
													// retrieves a recurrent item from the list of recurrent items
													IRecurrentCheckListItem OB = recCheckListItems[itemIndex];
													// retrieves the list of sub items of a recurrent item
													if (OB != null) {
														IRecurrentCheckListSubItem[] recCheckListSubItems = OB.getRecurrentCheckListSubItemList();

														// sets the rowClass based on the row number
														row++;
														if (row % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}

														// sets the frequency unit
														String freUnit = list.getFrequencyValue(OB
																.getFrequencyUnit());
														if (freUnit == null) {
															freUnit = "";
														}
														// sets the grace period unit
														String gracePeriodUnit = list
																.getFrequencyValue(OB
																		.getGracePeriodUnit());
														if (gracePeriodUnit == null) {
															gracePeriodUnit = "";
														}
														int filteredSubItemIndex = 0;
														int numOfSubItems = 0;
														if (recCheckListSubItems != null) {
															numOfSubItems = CheckListUtil
																	.filterSubItemListLength(recCheckListSubItems);
														}
														if(OB.getDocType().equalsIgnoreCase("Annexure")){
														// the list of sub items is not null then loop thru to display each sub item
														if (recCheckListSubItems != null && recCheckListSubItems.length > 0 && numOfSubItems > 0) {
															// loop thru the list of sub items of a recurrent item
															for (int subItemIndex = 0; subItemIndex < recCheckListSubItems.length; subItemIndex++) {
																// retrieves the sub item from the list of sub items

																checkboxIndex++; //CMS-1452 - moved to before the 'continue' statement to get incremented everytime
																IRecurrentCheckListSubItem subItem = recCheckListSubItems[subItemIndex];
																// filter the subitem which is received or waived
																if (filteredSubItemIndex == 0
																		&& (ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(subItem.getStatus()) 
																		|| ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
																	continue;
																}
							%>									
							<tr class="<%=rowClass%>">
								<%
									if (filteredSubItemIndex == 0) {
								%>
								<td class="index" rowspan="<%=numOfSubItems%>"><%=row%></td>
								<td rowspan="<%=numOfSubItems%>"><%=OB.getItemDesc()%>&nbsp;</td>
								<%
									}
								%>
								<td style="text-align: center"><integro:date
									object="<%=subItem.getDueDate()%>" />&nbsp;</td>
								<td><%=subItem.getStatus()%>&nbsp;</td>
								<td style="text-align: center">
								<integro:date object="<%=subItem.getDeferredDate()%>" />&nbsp;</td>
								<%
									if ((subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED)
											|| subItem.getStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED)
											|| subItem.getStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL)) 
											&& status.equals(ICMSConstant.STATE_ACTIVE) ||event.equals(AnnexureAction.EVENT_CHECKER_ANNEXURE_LIST)) {
								%>
								<td style="text-align: center"><a href="#"
									onclick="goRecurrentProcess('<%=itemIndex%>', '<%=subItemIndex%>')">View</a>&nbsp;</td>
								<%
									} else {
								%>
								<td style="text-align: center">
									<html:select property="actionParty" onchange="MM_jumpMenu('self',this,0)" >
										<option value="" >Please Select </option>
										<% if(!subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED)) {%>
										<option value="Annexure.do?event=edit_annexure_item&index=<%=itemIndex%>&subItemIndex=<%=subItemIndex%>&actionType=RECEIVE&custTypeTrxID=<%=custTypeTrxID%>" >RECEIVE </option>
										<option value="Annexure.do?event=edit_annexure_item&index=<%=itemIndex%>&subItemIndex=<%=subItemIndex%>&actionType=DEFER&custTypeTrxID=<%=custTypeTrxID%>" >DEFER </option>
										<% }else{ %>
										<option value="" >View </option>
										<% } %>
									</html:select>								
									</td>
								<%
									}
								%>
							</tr>
							<%
								filteredSubItemIndex++;
								}
							} else {
								// the list of sub items is null, display the recurrent item details only
								
							%>
							<tr class="<%=rowClass%>">
								<td class="index"><%=row%></td>
								<td><%=OB.getItemDesc()%>&nbsp;</td>
								<td style="text-align: center"><integro:date
									object="<%=OB.getInitialDueDate()%>" />&nbsp;</td>
								<td><%=OB.getRecurrentCheckListSubItemList()[0].getStatus()%>&nbsp;</td>
								<td style="text-align: center"><integro:date
									object="<%=OB.getLastDocEntryDate()%>" />&nbsp;</td>
								<td style="text-align: center"><a href="#"
									onclick="goRecurrentProcess('<%=itemIndex%>', '0')">View</a>&nbsp;</td>
							</tr>
							<%
							}
						}								
						}
					}
				} 
				%>
				</logic:present>
				
				<logic:notPresent name="recChkLst" property="checkListItemList">
					<script language="JavaScript" type="text/JavaScript">
	  					document.forms[0].noRecurrent.value=1;
					</script>
					<tr class="odd">
						<td colspan="15"><bean:message
							key="label.error.no.document" /></td>
					</tr>
				</logic:notPresent>
				</tbody>
			</table>
		</td>
	</tr>
	</tbody>
	<% } %>
</table>
	<%
		if (ICMSConstant.STATE_REJECTED.equals(status)) {
	%>
	<p />
	<p />
	<p />
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblInfo">
		<tbody>
			<tr>
				<td class="fieldname"><bean:message
					key="label.checklist.remarks" /></td>
				<td class="odd"><textarea name="remarks" rows="4" cols="100"></textarea></td>
			</tr>
			<tr>
				<td class="fieldname"><bean:message
					key="label.checklist.last.action.by" /></td>
				<td class="even">&nbsp;<%=lastActionBy%></td>
			</tr>
			<tr class="odd">
				<td class="fieldname"><bean:message
					key="label.checklist.last.remarks.made" /></td>
				<td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
			</tr>
		</tbody>
	</table>
	<%
		}
	%>

	<table border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="89">&nbsp;</td>
			<td width="75">&nbsp;</td>
		</tr>
		<tr>
			<% if(!event.equals(AnnexureAction.EVENT_CHECKER_ANNEXURE_LIST) && recChkLst != null){ %>	
			<td><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"
				onclick="submitPage()"> <img src="img/submit1.gif" name="Image1"
				width="75" height="22" border="0" id="Image1" /></a></td>
			
			<%
				if (ICMSConstant.STATE_REJECTED.equals(status)
								|| ICMSConstant.STATE_DRAFT.equals(status)) {
			%>

			<td width="100" valign="baseline" align="center"><a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
			</td>
			<%
				}
			}
			%>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd -->
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>