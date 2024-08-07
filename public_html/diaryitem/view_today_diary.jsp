<%@ page import="com.integrosys.cms.ui.diaryitem.DiaryItemAction,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.cms.app.diary.bus.IDiaryItem,com.integrosys.cms.ui.diaryitem.DiaryItemForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.diaryitem.DiaryItemListMapper,java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
	/**
	 * Copyright Integro Technologies Pte Ltd
	 * $Header: /home/cms2/cvsroot/cms2/public_html/diaryitem/view_today_diary.jsp,v 1.16 2006/10/27 08:43:13 hmbao Exp $
	 * @author $Author: hmbao $
	 * @version $Revision: 1.16 $
	 * @since $Date: 2006/10/27 08:43:13 $
	 * Tag: $Name:  $
	 */
%>


<%
	SearchResult searchResult = (SearchResult) request
			.getAttribute("DiaryItemList");
	if (searchResult == null)
		searchResult = (SearchResult) session
				.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.DiaryItemList");
	int recordsPerPage = 0;
	if (request.getAttribute("recordsPerPage") != null
			&& !request.getAttribute("recordsPerPage").equals(""))
		recordsPerPage = ((Integer) request
				.getAttribute("recordsPerPage")).intValue();
	if (recordsPerPage <= 0)
		recordsPerPage = ((Integer) session
				.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.recordsPerPage"))
				.intValue();
	DiaryItemForm form = (DiaryItemForm) request
			.getAttribute("DiaryItemForm");
	
	Collection diaryList = null;
	if (searchResult != null) {
		diaryList = searchResult.getResultList();
		pageContext.setAttribute("diaryList", diaryList);
	}

	int counter = 0;
	if (form != null)
		counter = form.getStartIndex();
	String startIndex = (String) session
			.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.startIndex");
	if (form == null && startIndex != null && !startIndex.equals(""))
		counter = Integer.parseInt(startIndex);
	int lStartIndex = counter;
	//    String sessSearchCustomerName = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.searchCustomerName");
	//    String sessSearchLeID = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.searchLeID");
	
	 String genericCount = (String) request.getParameter("genericCount");
    String odCount = (String) request.getParameter("odCount");
    String totalCount = (String) request.getParameter("totalCount");
    String segment = (String) request.getParameter("segment");
    String segmentName = (String) request.getParameter("segmentName");
    String overDueCount = (String) request.getParameter("overDueCount");
    
    pageContext.setAttribute("overDueCount", overDueCount);
    pageContext.setAttribute("genericCount", genericCount);
    pageContext.setAttribute("odCount", odCount);
    pageContext.setAttribute("totalCount", totalCount);
    pageContext.setAttribute("segment", segment);
    pageContext.setAttribute("segmentName", segmentName);
    System.out.println("=========================== genericCount : "+genericCount);
%>



<html>
<head>

<script language="JavaScript" type="text/JavaScript">
<!--

function gotopage(aLocation) {
	window.location = aLocation;
}

function goNextPrev(ind) {
    document.forms["DiaryItemForm"].event.value='<%=DiaryItemAction.EVENT_LIST_DUE_ITEMS%>';
    document.forms["DiaryItemForm"].cusName.value='';
    document.forms["DiaryItemForm"].startIndex.value=ind;
}

function goPageIndex(ind) {
    document.forms["DiaryItemForm"].event.value='<%=DiaryItemAction.EVENT_LIST_DUE_ITEMS%>';
    document.forms["DiaryItemForm"].startIndex.value=ind;
    document.forms["DiaryItemForm"].frompage.value='<%=DiaryItemAction.EVENT_LIST_DUE_ITEMS%>';
    document.forms["DiaryItemForm"].submit();
}

function goAlphaIndex(ind) {
	document.forms[0].searchCustomerName.value='';
	document.forms[0].searchLeID.value='';
    document.forms["DiaryItemForm"].event.value='<%=DiaryItemAction.EVENT_LIST_DUE_ITEMS%>';
    document.forms["DiaryItemForm"].customerIndex.value=ind;
    document.forms["DiaryItemForm"].startIndex.value=0;
    document.forms["DiaryItemForm"].frompage.value='<%=DiaryItemAction.EVENT_LIST_DUE_ITEMS%>';
    document.forms["DiaryItemForm"].submit();
}

function goPage(pageNo){
    document.forms["DiaryItemForm"].event.value='<%=DiaryItemAction.EVENT_LIST_DUE_ITEMS%>';
    document.forms["DiaryItemForm"].startIndex.value = pageNo*<%=recordsPerPage%>;
}

function submitPage(idx) {
	if (idx == 1) {
		document.forms[0].searchCustomerName.value = '';
	} else if (idx == 2) {
		document.forms[0].searchLeID.value = '';
	}
    document.forms["DiaryItemForm"].startIndex.value=0;
    document.forms[0].submit();
}

//-->
</script>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="DiaryItem.do">
<html:hidden property="startIndex" />
<html:hidden property="customerIndex"/>
 <html:hidden property="allowedCountry" />
  <html:hidden property="itemExpiryDate" />
   <html:hidden property="itemDueDate" />
   <input type="hidden" name="genericCount" value='<%=genericCount %>'/>
<input type="hidden" name="odCount" value='<%=odCount %>'/>
<input type="hidden" name="totalCount" value='<%=totalCount %>'/>
<input type="hidden" name="segment" value='<%=segment %>'/>
<input type="hidden" name="segmentName" value='<%=segmentName %>'/>

<input type="hidden" name="overDueCount" value='<%=overDueCount %>'/>

<input type="hidden" name="frompage"/>
<!--//CR-120 Search Diary Item-->
<input type="hidden" name="gobutton"/>
<input type="hidden" name="event" value="list_due_items"/>

  <tr >

	<td width="100%" valign="top" >
      <table id="window" border="0" cellpadding="0" cellspacing="0">


		<tr >
		<td>
           <!--//CR-120 Search Diary Item-->
            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
              <tr>
                <td colspan="3" valign="top">
                  <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="100%">
                       <TABLE width="70%" class=tblinfo id=custsearch border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                         <THEAD>
                          <TR>
                            <TD colSpan=3 width="100%">Please enter search criteria</TD></TR></THEAD>
                          <TBODY>
                          
                          <TR class=odd>
                            <TD class=fieldname>Party ID :</TD>
                            <TD><html:text property="searchLeID" maxlength="30" size="50"/> <html:errors property="leIDError"/></TD>
                            <TD><INPUT class=btnNormal id=Search2 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(1) type=button value=Go name=Search2>
                            </TD></TR>
                          <TR class=even>
                            <TD class=fieldname width="20%">Party Name :</TD>
                            <TD><html:text property="searchCustomerName" maxlength="50" size="50"/>  <html:errors property="customerNameError"/> </TD>
                            <TD><INPUT class=btnNormal id=Search3 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(2) type=button value=Go name=Search3>
                            </TD></TR>
                          </TBODY>
                        </TABLE>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <!--//End CR-120 Search Diary Item-->
              <tr>
                <td colspan="3" valign="top" style="height:100%;width:100%;">

                    <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-bottom:15px">
                      <thead>
                      <tr>
                          <td>
                          <h3>Today's Diary List</h3>
                        </td>
                        </tr>
                        <tr>
                          <td> <hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="5%">S/N</td>  
                               <td width="10%">Diary Number</td>                                
                              <td width="10%">Party ID</td>
                              <td width="10%" nowrap="nowrap">Party Name</td>
                              <td width="10%">Segment</td>
                              <td width="10%">Activity</td>
                              <td width="10%">Dropline OD</td>
                               <td width="10%">Maker ID</td>
                                <td width="10%">Target Date</td>
                              <td width="15%">Action</td>
								<!--<td width="12%">AM</td>-->
                          <!--  <td width="10%">Date of Reminder</td>
                              <td width="10%">Item Expiry Date</td> -->
                              
                               <!--<td width="5%">Obsolete</td>-->
                            </tr>
                            </thead>
                         <tbody>
                <logic:present name="diaryList">
                    <logic:iterate id="OB" name="diaryList" type="com.integrosys.cms.app.diary.bus.IDiaryItemUI" scope="page" >
                   <%
                       String rowClass = "";
                       counter++;
                       if ( counter%2 != 0 ) {
                           rowClass = "odd";
                       } else {
                           rowClass = "even";
                       }

                       String itemURL = "DiaryItem.do?frompage=list_due_items&itemId="+OB.getItemID()+"&itemDueDate="+OB.getDueDate().toString();
                       System.out.println("<<<<<<<<<<1>>>>>>>>>"+itemURL);
                  %>
                    <tr class=<%=rowClass%>>
                      <td class="index" width="4%"><%=counter%></td>
                      <% 
                         char ch = '0';
                         String appendZero ="";
                         String diarynum = String.valueOf(OB.getDiaryNumber());
                         int length = diarynum.length( ); 
                         if(length > 7){
                       if(String.valueOf(OB.getDiaryNumber()).charAt(6) == ch && String.valueOf(OB.getDiaryNumber()).charAt(7) == ch && String.valueOf(OB.getDiaryNumber()).charAt(8) != ch){
                    	   appendZero = "0";
               	   } }%>
                      <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=appendZero+String.valueOf(OB.getDiaryNumber())%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <td width="10%"><%=OB.isBold()?"<b>":""%><bean:write name="OB" property="customerReference" /><%=OB.isBold()?"</b>":""%></td>
                      <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=OB.getCustomerName()%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <td width="10%">&nbsp<%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=OB.getCustomerSegment()%>" lineLength="12"/><%=OB.isBold()?"</b>":""%></td>
                      
                      <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=OB.getActivity()%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=OB.getDropLineOD()%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=OB.getMakerId()%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <%System.out.println("##########################"+OB.getDueDate()); %>
                      <%if(OB.getDueDate() != null) {%>
                      <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value="<%=OB.getDueDate().toString()%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <%}else{ %>
                       <td width="10%"><%=OB.isBold()?"<b>":""%><integro:wrapper value=""  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                       <%} %>
                       <% if("N".equals(OB.getDropLineOD())){ %>
                      <td width="15%"><%=OB.isBold()?"<b>":""%><a href ="<%=itemURL%>&event=read">
                      <integro:wrapper value="view" lineLength="40"/> <%=OB.isBold()?"</b>":""%></a>
                       
                      &nbsp;/&nbsp;<%=OB.isBold()?"<b>":""%><a href ="<%=itemURL%>&event=prepare_update">
                      <integro:wrapper value="update" lineLength="40"/> <%=OB.isBold()?"</b>":""%></a>
                      <%} %>
                      <% if("Y".equals(OB.getDropLineOD())){ %>
                       <td width="15%"><%=OB.isBold()?"<b>":""%><a href ="<%=itemURL%>&event=read">
                      <integro:wrapper value="view" lineLength="40"/> <%=OB.isBold()?"</b>":""%></a>
                      <% if("Y".equals(OB.getUploadFileError())){ %>
                      &nbsp;/&nbsp;<%=OB.isBold()?"<b>":""%><a href ="<%=itemURL%>&event=ODFileError">
                      <integro:wrapper value="ODFileError" lineLength="40"/> <%=OB.isBold()?"</b>":""%></a>
                      &nbsp;/&nbsp;<%=OB.isBold()?"<b>":""%><a href ="<%=itemURL%>&event=delete">
                      <integro:wrapper value="delete" lineLength="40"/> <%=OB.isBold()?"</b>":""%></a>
                      <%}else{ %>
                       &nbsp;/&nbsp;<%=OB.isBold()?"<b>":""%><a href ="<%=itemURL%>&event=prepare_update">
                      <integro:wrapper value="update" lineLength="40"/> <%=OB.isBold()?"</b>":""%></a>
                      <%} %>
                      <%} %>
                      </td>
                      
                      <%System.out.println("<<<<<<<<<<2>>>>>>>>>"+itemURL); %>
                      <!-- <td width="14%">&nbsp<%--=OB.isBold()?"<b>":""--%><integro:wrapper value="<%--=OB.getFAM()--%>" lineLength="15"/><%--=OB.isBold()?"</b>":""--%></td>-->
                      
                      <%-- <td width="13%"><%=OB.isBold()?"<b>":""%><integro:date object="<%=OB.getExpiryDate()%>" /><%=OB.isBold()?"</b>":""%></td> --%>
                    <!--<td width="7%"><%--=OB.isBold()?"<b>":""--%><integro:boolean-display value="<%--=OB.getObsoleteInd() --%>" style="yn"/><%--=OB.isBold()?"</b>":""--%></td>-->
                    </tr>
                    </logic:iterate>
                </logic:present>
                <logic:notPresent name="diaryList" >
                <tr class="odd"><td colspan="9">
                    <bean:message key="label.global.not.found"/></td></tr>
                </logic:notPresent>
                            </tbody>
                          </table>
                        </td>
                        </tr>
                       <tr><td colspan="2">&nbsp;</td></tr>
                      <tr align="center"><td colspan="2"><!-- Start of Item Expiry Date  -->&nbsp;<html:hidden property="startExpiryDate" />
                     <!--  <img src="img/calendara.gif"  name="ImageCal1" border="0" id="ImageCal1" onClick="return showCalendar('startExpiryDate', 'dd/mm/y' );" onMouseOver="MM_swapImage('ImageCal1','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />-->
                               <html:errors property="startExpiryDate"/>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--End of Item Expiry Date  -->&nbsp;&nbsp;<html:hidden property="endExpiryDate"  /> 
                               <!--    <img src="img/calendara.gif"  name="ImageCal2" border="0" id="ImageCal2" onClick="return showCalendar('endExpiryDate', 'dd/mm/y' );" onMouseOver="MM_swapImage('ImageCal2','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" /> -->
                               <html:errors property="endExpiryDate"/></td></tr>
                        <tr align="center"><td colspan="2">
                        <br><br>
<!--                <img src="img/print1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/print2.gif',1)" onclick="submitForm()"/%>-->
<!--                <img src="img/refresh1.gif" name="ImageRefresh" width="80" height="20" border="0" id="ImageRefresh" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageRefresh','','img/refresh2.gif',1)" onclick="refreshPage()"/>-->
                </td>
                </tr> 
                      </tbody>
                    </table>
                        </td>
                        </tr>
                      </tbody>
                    </table>
				</td>
              </tr>
              <%
              	String alphaURL = "DiaryItem.do?event=list_due_items&frompage=list_due_items";
              %>
              <tr>
                <td colspan="3">
                   <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
                      <tr>
                        <td width="671" valign="middle">
                        Index: <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/></td>                        
                        <td width="3" valign="middle"><img src="img/icon/seprate_bar.gif" /></td>
                        <%
                        	if (searchResult != null) {
                        %>
                        <td width="94" valign="middle" id="orgpanel">
                           <integro:pageindex pageIndex='<%=new PageIndex(lStartIndex,recordsPerPage,searchResult.getNItems())%>' submitFlag='<%=new Boolean(true)%>' url='<%=alphaURL+"&startIndex="%>' />                        
                        </td>
                        <%
                        	}
                        %>
                       </tr>
                    </table>
                </td>
              </tr>
            </table>
		</td>
		</tr>
      </table>
       </td>
  </tr>
</html:form>
</table>

