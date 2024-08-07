<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.custgrpi.CustGroupUIHelper,
                 com.integrosys.cms.ui.limitbooking.LimitBookingForm,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction"%>
<%@ page import="java.util.List" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* @author priya
*
*/
%>

<%
	String fromEvent = request.getParameter(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT);
	String cancelEvent = "";
	
	if (fromEvent != null && fromEvent.equals(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_ADD)) {
		cancelEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_ADD_BOOKING;
	}
	else if (fromEvent != null && fromEvent.equals(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_EDIT)) {
		cancelEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_EDIT_BOOKING;
	}
	
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }

    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    
    LimitBookingForm aForm = (LimitBookingForm) request.getAttribute("LimitBookingForm");

    if (aForm ==null){
       aForm = new  LimitBookingForm();
    }
    
    List v = null;
    if (aForm != null) {
        v = (List) aForm.getSearchResult();
    }

    SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction."+LimitBookingAction.SESSION_SEARCH_RESULT);
    if (sr != null)
    {
        v = (List) sr.getResultList();
    }
    if (v != null) {
        pageContext.setAttribute("groupMemberSearchList", v);
    }

    int rowIdx = 0;
    int sno = 0;
    int startIndex = 0;

    String strstartIndex = (String)request.getAttribute("startIndex");
    if (strstartIndex != null){
        sno = Integer.parseInt(strstartIndex);
        startIndex = Integer.parseInt(strstartIndex);
    }
    int prev = startIndex - aForm.getNumItems();
    if (prev < 0 ) { prev = startIndex - records_per_page;}
    int numItem = aForm.getNumItems();

    String alphaURL="LimitBooking.do?event=" + LimitBookingAction.EVENT_SEARCH_GROUP;
    alphaURL = alphaURL + "&fromEvent=" + fromEvent;
    
    if (sr != null) {
    System.out.println("priya " + sr.getNItems());
    }
%>

<% try {  %>


<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
    <html:form action="LimitBooking.do?event=search_group">

        <html:hidden property="startIndex" />
        <html:hidden property="numItems"  />

        <html:hidden property="searchGroupNo" />
        <html:hidden property="searchGroupID" />
        <html:hidden property="searchGroupName" />
        
        <input type="hidden" name="fromEvent" value="<%=fromEvent%>"/>

<%--        <html:hidden property="grpID" />--%>
<%--        <html:hidden property="groupName" />--%>
        <html:hidden property="searchType"/>

        <input type="hidden" name="indicator" >
        <input type="hidden" name="all">


             <table width="70%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">

              <tr>
               <td>
                 <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td valign="bottom"><h3>Search Result</h3></td>
                    </tr>
                </table>
                <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                 <thead>
                  <tr>
                        <td width="3%"><bean:message key="label.global.sn"/></td>
                        <td width="10%"><bean:message key="label.group.id" /></td>
                        <td width="25%"><bean:message key="label.group.name" /></td>
                        <td width="15%"><bean:message key="label.group.link.group"/></td>
                  </tr>

                 </thead>
                 <tbody>
                   <% if(v!=null)  { %>
                          <logic:present name="groupMemberSearchList">
                           <logic:iterate id="OB" name="groupMemberSearchList"  type="com.integrosys.cms.app.custgrpi.bus.OBGroupSearchResult" scope="page">
                      <%
                            String grpID = OB.getGrpID() +"";
                            String duplicateGroupEntryError = "duplicateGroupEntryError"+OB.getGrpID();
                            sno++;

                        %>
                   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td style="text-align:center" class="index"><%=sno%></td>
                      <td><integro:empty-if-null value="<%=OB.getGrpNo()%>"/>&nbsp; </td>
                      <td><integro:empty-if-null value="<%=OB.getGroupName()%>"/>
                        &nbsp; </td>
                      <td style="text-align:center">
                           <html:checkbox property="entityCheckBoxID" value="<%=grpID%>" />
                            <html:errors property="<%=duplicateGroupEntryError %>" />
                        </td>
                     </tr>
                    </logic:iterate>
                   </logic:present>
                   <%
                       } else {%>
                   <td colspan="10" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                   <%}%>
                  </tbody>
                </table>
                <tr height="40">
                    <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                              onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                        <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                        <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()"
                        onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
                        <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                        <br>
                        <html:errors property="errDuplicate"/>
                    </td>
                    </tr>
                   </td>
              </tr>
             </table>
    </html:form>
  </td>
</tr>
<tr>
<td height="25">
     <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="580" valign="middle">
                <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                </td>
                <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                <td valign="middle" >
				<%
				String pageIndexUrl="LimitBooking.do?event=" + LimitBookingAction.EVENT_SEARCH_GROUP + "&pageIndex=true";
				pageIndexUrl = pageIndexUrl + "&fromEvent=" + fromEvent;
                pageIndexUrl = pageIndexUrl + "&startIndex=";                       //aForm.getNumItems()
				if (sr != null){
                %>
                 <integro:pageindex pageIndex='<%=new PageIndex(startIndex,records_per_page,sr.getNItems())%>' url='<%=pageIndexUrl%>' submitFlag='<%=new Boolean(false)%>'/>
                <%}%>
                </td>
              </tr>
       </table>
</td>
</tr>

</table>

<script language="JavaScript">

    function submitForm(){
             var cstId  = <%=rowIdx%>;
              if (cstId ==0){
                   alert("Please select one record");
               } else{
                     var checkResult = false;
                     var field = document.forms["LimitBookingForm"].entityCheckBoxID;
                     var len =field.length ;
                     if (len > 1){
                         for (i = 0; i < field.length; i++){
                              if(field[i].checked){
                                 checkResult=true;
                                 break;
                               }
                         }
                     }else {
                        if (document.forms["LimitBookingForm"].entityCheckBoxID.checked){
                                checkResult=true;
                            }
                      }
                     if(!checkResult){
                            alert("Please select one record");
                     }else{
                          document.forms[0].action ="LimitBooking.do?event=<%=LimitBookingAction.EVENT_ADD_GROUP%>";
                          document.forms[0].submit();
                     }
                }
           }

        function cancelForm(){
            document.forms[0].action = "<%=cancelEvent%>";
            document.forms[0].submit();
        }

    function goNextPrev(ind) {
        // alert("goNextPrev(ind) = "+ ind);
        //document.forms["LimitBookingForm"].cusName.value='';
        document.forms["LimitBookingForm"].startIndex.value=ind;
        document.forms["LimitBookingForm"].numItems.value=<%=numItem%>;
    }

    function goPageIndex(ind) {
        /// alert("goPageIndex(ind) ="+ ind);
        document.forms["LimitBookingForm"].startIndex.value=ind;
        document.forms["LimitBookingForm"].numItems.value=<%=numItem%>;
        document.forms["LimitBookingForm"].submit();
    }

    function goAlphaIndex(ind) {
       // alert("goAlphaIndex(ind) = "+ ind);
       //document.forms["LimitBookingForm"].searchGroupName.value=ind;
        //document.forms["LimitBookingForm"].customerName.value=ind;
        document.forms["LimitBookingForm"].searchGroupName.value=ind;
		if (ind == ''){
			document.forms["LimitBookingForm"].all.value = 'Y';
            document.forms["LimitBookingForm"].searchGroupName.value="";
            document.forms["LimitBookingForm"].searchGroupNo.value="";
        }
        document.forms[0].indicator.value='*';
        document.forms["LimitBookingForm"].startIndex.value=0;
        document.forms[0].action ="<%=alphaURL%>";
        document.forms["LimitBookingForm"].submit();
    }
    function goPage(pageNo){
       //  alert("goPage(pageNo)= "+ ind);
        document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
    }


</script>


</body>
</html>

<%} catch(Exception e)
        { e.printStackTrace();
 }%>

