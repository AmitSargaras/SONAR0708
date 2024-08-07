<%@ page import="com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.common.Constants,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Collection,
                 java.util.Locale,
                 com.integrosys.cms.ui.limitbooking.LimitBookingUIHelper,
                 com.integrosys.cms.app.limitbooking.bus.LimitBookingSearchCriteria,
                 com.integrosys.cms.ui.limitbooking.LimitBookingForm,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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

	String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
    
    Collection coll  = null;
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);
    SearchResult result  =(SearchResult) session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction." +LimitBookingAction.SESSION_BOOKING_SEARCH_RESULT) ;

	LimitBookingForm aForm = (LimitBookingForm) request.getAttribute("LimitBookingForm");
	
	if (aForm ==null){
       aForm = new  LimitBookingForm();
    }

   if (result != null){
       coll = result.getResultList() ;
   }
 
    if (coll != null)
     pageContext.setAttribute("search_result",coll);
     
    CountryList countryList = CountryList.getInstance();
    
    LimitBookingSearchCriteria search = (LimitBookingSearchCriteria)session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction."+LimitBookingAction.SESSION_BOOKING_SEARCH_CRITERIA);
    
    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
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
    
    String alphaURL="LimitBooking.do?event=" + LimitBookingAction.EVENT_SEARCH_BOOKING;
    

%>
<html>
<head>
    <title>search result limitbooking</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
     <script language="JavaScript">
  <!--
     function JumpOnSelectactive(selectObj, limitBookingID){
            var selectIndex = selectObj.selectedIndex;
            if (selectObj.options[selectIndex].value == "EDIT"){
                location.href = "LimitBooking.do?event=<%=LimitBookingAction.EVENT_PREPARE_EDIT_BOOKING%>&limitBookingID=" +limitBookingID;
            }
            if (selectObj.options[selectIndex].value == "DELETE"){
                location.href = "LimitBooking.do?event=<%=LimitBookingAction.EVENT_PREPARE_DELETE_BOOKING%>&limitBookingID=" +limitBookingID;
            }
             if (selectObj.options[selectIndex].value == "SUCCESSFUL"){
                location.href = "LimitBooking.do?event=<%=LimitBookingAction.EVENT_PREPARE_SUCCESSFUL_BOOKING%>&limitBookingID=" +limitBookingID;
            }
        }
        
     function returnPage() {
    	document.forms[0].action = "LimitBooking.do?event=<%=LimitBookingAction.EVENT_PREPARE_SEARCH_BOOKING%>";
    	document.forms[0].submit();
   }

   -->
   </script>
</head>
<body >
<html:form action="LimitBooking.do?event=search_booking">
    <input type="hidden" name="event"/>
	<html:hidden property="startIndex" />
	<html:hidden property="numItems"  />
	<html:hidden property="searchCustomerName" />
	<html:hidden property="gobuttonBooking" />
	<input type="hidden" name="indicator" >
    <input type="hidden" name="all">
    <table class="tblFormSection" width="98%" align="center" border="0" cellpadding="0" cellspacing="0" height="95%">
      <thead>
        <tr>
          <td height="50"><h3>View Booking </h3><hr></td>
        </tr>
      </thead>
      <tbody>
                <tr>
                  <td valign="top">
                  <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                      <thead>
                        <tr>
                          <td><bean:message key="label.global.sno" /></td>
                          <td><bean:message key="label.ticket.number" /></td>
                          <td><bean:message key="label.customer.name"/> </td>
                          <td><bean:message key="label.predeal.source.sys" /></td>

                          <td><bean:message key="label.aa.number" /></td>
                          <td><bean:message key="label.country.risk"/> </td>
                          <td><bean:message key="label.group.business.unit"/></td>
                          <td><bean:message key="label.group.name"/></td>

                          <td nowrap="true"><bean:message key="label.booked.amount"/> </td>
                          <td><bean:message key="label.overall.booked.result"/> </td>
                          <td><bean:message key="label.date.limit.booked"/> </td>
                          <td><bean:message key="label.last.updated.by"/> </td>

                          <td><bean:message key="label.predeal.status"/> </td>
                          <td><bean:message key="label.limit.expiry.date"/> </td>
                          <td><bean:message key="label.global.action"/> </td>
                        </tr>
                      </thead>
                      <tbody>
                          <% if(coll != null && coll.size() >0)  {%>
                          <logic:present name="search_result">
                           <logic:iterate id="OB" name="search_result"  type="com.integrosys.cms.app.limitbooking.bus.LimitBookingSearchResult" scope="page">
                               <%
                                String limitBookingID  =  OB.getLimitBookingID()+"";
                                sno++;
                               %>

                               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                  <td style="text-align:center" class="index"><%=sno%>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=OB.getTicketNo()%>"/>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=OB.getCustomerName()%>"/>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AA_SOURCE, OB.getSourceSystem())%>"/>&nbsp;</td>

                                  <td><integro:empty-if-null value="<%=OB.getAaNumber()%>"/>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=countryList.getCountryName(OB.getCountry())%>"/>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT, OB.getBusinessUnit())%>"/>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=OB.getGroupName()%>"/>&nbsp;</td>

                                   <td >
                                      <% if (OB.getBookedAmt() != null ){%>
                                        <integro:amount amount="<%=OB.getBookedAmt()%>" locale="<%=locale%>" decimal="2"/>
                                      <%}else{ %>
                                        -
                                      <% }%> </td>
                                   <td><integro:empty-if-null value="<%=OB.getOverallBkgResult()%>"/>&nbsp;</td>
                                   <td> <% String dateLimitBooked = UIUtil.mapOBDate_FormString(locale, OB.getDateLimitBooked()); %>
                                        <integro:empty-if-null value="<%=dateLimitBooked%>"/> &nbsp; </td>
                                   <td><integro:empty-if-null value="<%=LimitBookingUIHelper.getUserNameByUserID(OB.getLastUpdatedBy())%>"/>&nbsp;</td>
                                  
                                   <td><integro:empty-if-null value="<%=LimitBookingUIHelper.getBookingDescription(OB.getBkgStatus())%>"/>&nbsp;</td>
                                   
                                   <td>
                                     <% String expiryDate = UIUtil.mapOBDate_FormString(locale, OB.getExpiryDate()); %>
                                     <integro:empty-if-null value="<%=expiryDate%>"/> &nbsp; </td>
                                   <td style="text-align:center">
                                    <% if (ICMSConstant.STATUS_LIMIT_BOOKING_BOOKED.equals(OB.getBkgStatus())){ %>
                                           <select name="actionPerformed"
                                                  onchange="javascript:JumpOnSelectactive(this, '<%=limitBookingID%>')">
                                              <option selected="selected" >Please Select</option>
                                              <option value="EDIT">Edit</option>
                                              <option value="DELETE">Delete</option>
                                              <option value="SUCCESSFUL">Successful</option>
                                          </select>  
                                     <% } else { %>
                                     		-
                                     <% } %>
                                   </td>
                             </tr>
                           </logic:iterate>
                       </logic:present>
                   <%} else {%>
                       <td colspan="15" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                   <%}%>
                  </tbody>
                  </table>
                 </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td valign="top" align="center"><a href="javascript:returnPage()"
                   onMouseOut="MM_swapImgRestore()"
                   onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image1" E border="0" id="Image1" /></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          
             <!-- General Purpose Bar -->
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
				String pageIndexUrl="LimitBooking.do?event=" + LimitBookingAction.EVENT_SEARCH_BOOKING + "&pageIndex=true";
                pageIndexUrl = pageIndexUrl + "&startIndex=";                       //aForm.getNumItems()
                
                %>
				<integro:pageindex pageIndex='<%=new PageIndex(startIndex,records_per_page,aForm.getNumItems())%>' url='<%=pageIndexUrl%>' submitFlag='<%=new Boolean(false)%>'/>
             
                </td>
              </tr>
       </table>
</td>
</tr>

      </tbody>
    </table>
    
    
    <script language="JavaScript">

    function goNextPrev(ind) {
        document.forms["LimitBookingForm"].startIndex.value=ind;
        document.forms["LimitBookingForm"].numItems.value=<%=numItem%>;
    }

    function goPageIndex(ind) {
        document.forms["LimitBookingForm"].startIndex.value=ind;
        document.forms["LimitBookingForm"].numItems.value=<%=numItem%>;
        document.forms["LimitBookingForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["LimitBookingForm"].searchCustomerName.value=ind;
        document.forms["LimitBookingForm"].gobuttonBooking.value="6";
        if (ind == ''){
			document.forms["LimitBookingForm"].all.value = 'Y';
        }
        document.forms[0].indicator.value='*';
        document.forms["LimitBookingForm"].startIndex.value=0;
        document.forms[0].action ="<%=alphaURL%>";
        document.forms["LimitBookingForm"].submit();
    }
    function goPage(pageNo){
        document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
    }


</script>

</html:form>
</body>
</html>
