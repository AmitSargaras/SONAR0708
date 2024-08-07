<!--Modified by Pratheepa for CR234 -->
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.cms.app.recurrent.bus.IConvenantSubItem,
                 java.util.Date,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 java.util.Arrays,
                 java.util.ArrayList,
                 java.util.Calendar" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recreceipt/rec_receipt_list_view.jsp,v 1.32 2006/10/27 08:19:07 hmbao Exp $
     *
     * Purpose: Recurrent Receipt and Covenant Receipt List
     * Description: Update Recurrent Receipt and Covenant Receipt
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.32 $
     * Date: $Date: 2006/10/27 08:19:07 $
     * Tag: $Name:  $
     */
%>

<%
    try {
        IRecurrentCheckListTrxValue checkListTrxVal = (IRecurrentCheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.annexure.AnnexureAction.checkListTrxVal");
        IRecurrentCheckList recChkLst = (IRecurrentCheckList) session.getAttribute("com.integrosys.cms.ui.checklist.annexure.AnnexureAction.recChkLst");
        String remarks = "";
        String lastActionBy = "";
        if (recChkLst != null)
            pageContext.setAttribute("recChkLst", recChkLst);

        int row = 0;
        String rowClass = "";
		String status = "";
		int checkboxIndex = 0;
        FrequencyList list = FrequencyList.getInstance();

        if (checkListTrxVal != null) {
            remarks = checkListTrxVal.getRemarks();
            lastActionBy = checkListTrxVal.getUserInfo();
        }
        if (lastActionBy == null) lastActionBy = "";
        if (remarks == null) remarks = "";

        boolean toTrack = false;
        boolean isClose = false;
        String event = request.getParameter("event");

        if ("to_track".equals(event) || "true".equals(request.getParameter("toTrack"))) {
            toTrack = true;
        }
        if ("close_checklist_item".equals(event) || "true".equals(request.getParameter("isClose"))) {
            isClose = true;
        }
        boolean isRead = !toTrack && !isClose;
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

        function viewCovenant(ind, subItemIndex) {
            document.forms[0].index.value = ind;
            document.forms[0].subItemIndex.value = subItemIndex;
            document.forms[0].event.value = "view_covenant_item";
            document.forms[0].submit();
        }

        function viewRecurrent(ind, subItemIndex) {
            document.forms[0].index.value = ind;
            document.forms[0].subItemIndex.value = subItemIndex;
            document.forms[0].event.value = "view_annexure_item";
            document.forms[0].submit();
        }
        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<html:form action="Annexure">
<input type="hidden" name="event"/>
<input type="hidden" name="index"/>
<input type="hidden" name="subItemIndex"/>
<html:hidden property="limitProfileId"/>
<html:hidden property="subProfileId"/>
<input type="hidden" name="toTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isClose" value="<%=isClose%>"/>
<input type="hidden" name="isRead" value="<%=isRead%>"/>

<%
	int itemIndex = 0;
%>


<% row = 0; %>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><%=toTrack || isRead ? "View" : "Close"%> Annexure Checklist</h3></td>
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
        <td width="10%"><bean:message key="label.checklist.due.date"/></td>
        <td width="10%"><bean:message key="label.checklist.status"/></td>
        <td width="8%"><bean:message key="label.checklist.annexure.action.date"/></td>
        <% if (isRead) { %>
        <td width="5%"><bean:message key="label.checklist.action"/></td>
        <% } %>
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
												for (itemIndex = 0; itemIndex < recCheckListItems.length; itemIndex++) {
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
								if (isRead){	
									if ((subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED)
											|| subItem.getStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED)
											|| subItem.getStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL)) 
											&& status.equals(ICMSConstant.STATE_ACTIVE)) {
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
										<option value="Annexure.do?event=edit_annexure_item&index=<%=itemIndex%>&subItemIndex=<%=subItemIndex%>&actionType=RECEIVE" >RECEIVE </option>
										<option value="Annexure.do?event=edit_annexure_item&index=<%=itemIndex%>&subItemIndex=<%=subItemIndex%>&actionType=DEFER" >DEFER </option>
										<% }else{ %>
										<option value="" >View </option>
										<% } %>
									</html:select>								
									</td>
								<%
									}
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
									<%if (isRead){ %>
								<td style="text-align: center"><a href="#"
									onclick="goRecurrentProcess('<%=itemIndex%>', '0')">View</a>&nbsp;</td>
									<%} %>
							</tr>
							<%
							}
						}								
						}
					}
				} else {
				%>
				<tr class="odd">
					<td colspan="15"><bean:message
						key="label.error.no.document" /></td>
				</tr>

				<%
					}
				%>
							<%--</logic:iterate>--%>
						</logic:present>
<logic:notPresent name="recChkLst" property="checkListItemList">
    <tr class="odd">
        <td colspan="<%=isRead?"15":"14"%>"><bean:message key="label.error.no.document"/></td>
    </tr>
</logic:notPresent>
</tbody>
</table></td>
</tr>
</tbody>
</table>
<%if (isClose) {%>
<p/>

<p/>

<p/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
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
    <tr>
        <td width="89">&nbsp;</td>
        <td width="89">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <%if (toTrack) {%>
            <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image441','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image441"/></a>
            <%} else if (isClose) {%>
            <a href="Annexure.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image442','','img/close2a.gif',1)">
                <img src="img/close1a.gif" name="Image4411" border="0" id="Image442"/></a>&nbsp;&nbsp;&nbsp;
            <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image443','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image443"/>
            </a>
            <% } %>
        </td>
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
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>