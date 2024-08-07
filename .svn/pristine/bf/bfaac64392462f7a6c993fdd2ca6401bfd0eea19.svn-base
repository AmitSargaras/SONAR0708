<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
				 com.integrosys.cms.app.common.util.*,
                 java.util.*"
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.allCreditApproverList");
FacilityReceiptForm form = (FacilityReceiptForm)request.getAttribute("FacilityReceiptForm");
    String lableDocDate = "Doc Expiry Date";
	
	
%>
<%
String nextDate="";
String deferDate="";
String otdDate="";
if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().equals("")){
	nextDate=form.getExpectedReturnDate();
}
if(form.getDeferDate()!=null && !form.getDeferDate().equals("")){
	deferDate=form.getDeferDate();	
}
if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().equals("")){
	otdDate=form.getOriginalTargetDate();
}

%>


<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptForm"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
<script>

function saveForm() {
	document.forms["FacilityReceiptForm"].event.value="view_ok";
	document.forms["FacilityReceiptForm"].submit();
}
</script>
</script>
<script language="JavaScript" type="text/JavaScript">
function setDifferenceBetDate() {
    
	
    
	   var user_date ="<%=deferDate%>";
	
		//alert("user_date :"+user_date);
	
	var today_date ="<%=otdDate%>";
	//alert("today_date :"+today_date);
	
	 if((isNaN(user_date))&&(isNaN(today_date)))
  {
	 
	  var udate_month = user_date.substring(3,6);
	  var tdate_month = today_date.substring(3,6);
	 switch(udate_month)
	 {
	 case 'Jan':
		 udate_month='00';
         break;
	 case 'Feb':
		 udate_month='01';
		 break;
	 case 'Mar':
		 udate_month='02';
		 break;
	 case 'Apr':
		 udate_month='03';
		 break;
	 case 'May':
		 udate_month='04';
		 break;
	 case 'Jun':
		 udate_month='05';
		 break;
	 case 'Jul':
		 udate_month='06';
		 break;
	 case 'Aug':
		 udate_month='07';
		 break;
	 case 'Sep':
		 udate_month='08';
		 break;
	 case 'Oct':
		 udate_month='09';
		 break;
	 case 'Nov':
		 udate_month='10';
		 break;
	 case 'Dec':
		 udate_month='11';
		 break;
		
		
		 }
	
	  var toDate = new Date(user_date.substring(7,11),
			  udate_month,
			  user_date.substring(0,2));
	  //alert("fromDate"+toDate);

	  switch(tdate_month)
		 {
		 case 'Jan':
			 tdate_month='00';
             break;
		 case 'Feb':
			 tdate_month='01';
			 break;
		 case 'Mar':
			 tdate_month='02';
			 break;
		 case 'Apr':
			 tdate_month='03';
			 break;
		 case 'May':
			 tdate_month='04';
			 break;
		 case 'Jun':
			 tdate_month='05';
			 break;
		 case 'Jul':
			 tdate_month='06';
			 break;
		 case 'Aug':
			 tdate_month='07';
			 break;
		 case 'Sep':
			 tdate_month='08';
			 break;
		 case 'Oct':
			 tdate_month='09';
			 break;
		 case 'Nov':
			 tdate_month='10';
			 break;
		 case 'Dec':
			 tdate_month='11';
			 break;
			
			
			 }
	  var fromDate   = new Date(today_date.substring(7,11),
			  tdate_month,
			  today_date.substring(0,2));
	  
	//  alert("toDate"+fromDate);
	  if(fromDate <= toDate)
	  {
	//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
	//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
		  var difference_ms = Math.abs(toDate - fromDate);
		   

		  document.getElementById('valTotalDeferedDays').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
          

			  }
	  else if(toDate<fromDate){
		  var difference_ms = Math.abs(toDate - fromDate);
		   

		  document.getElementById('valTotalDeferedDays').innerHTML ="-"+(Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
	  }
	  else{
		  document.getElementById('valTotalDeferedDays').innerHTML = "-";
		  }
 


  }
  else
  {
  document.getElementById('valTotalDeferedDays').innerHTML = "-";
  }
	
}


function originalDeferedDaysCal() {
    
    
    
	   var user_date ="<%=nextDate%>";
	
	//alert("user_date :"+user_date);
	
	var today_date = "<%=otdDate%>";
	//alert("today_date :"+today_date);
	
	 if((isNaN(user_date))&&(isNaN(today_date)))
	  {
		 
		  var udate_month = user_date.substring(3,6);
		  var tdate_month = today_date.substring(3,6);
		 switch(udate_month)
		 {
		 case 'Jan':
			 udate_month='00';
          break;
		 case 'Feb':
			 udate_month='01';
			 break;
		 case 'Mar':
			 udate_month='02';
			 break;
		 case 'Apr':
			 udate_month='03';
			 break;
		 case 'May':
			 udate_month='04';
			 break;
		 case 'Jun':
			 udate_month='05';
			 break;
		 case 'Jul':
			 udate_month='06';
			 break;
		 case 'Aug':
			 udate_month='07';
			 break;
		 case 'Sep':
			 udate_month='08';
			 break;
		 case 'Oct':
			 udate_month='09';
			 break;
		 case 'Nov':
			 udate_month='10';
			 break;
		 case 'Dec':
			 udate_month='11';
			 break;
			
			
			 }
		
		  var toDate = new Date(user_date.substring(7,11),
				  udate_month,
				  user_date.substring(0,2));
		  //alert("fromDate"+toDate);

		  switch(tdate_month)
			 {
			 case 'Jan':
				 tdate_month='00';
	             break;
			 case 'Feb':
				 tdate_month='01';
				 break;
			 case 'Mar':
				 tdate_month='02';
				 break;
			 case 'Apr':
				 tdate_month='03';
				 break;
			 case 'May':
				 tdate_month='04';
				 break;
			 case 'Jun':
				 tdate_month='05';
				 break;
			 case 'Jul':
				 tdate_month='06';
				 break;
			 case 'Aug':
				 tdate_month='07';
				 break;
			 case 'Sep':
				 tdate_month='08';
				 break;
			 case 'Oct':
				 tdate_month='09';
				 break;
			 case 'Nov':
				 tdate_month='10';
				 break;
			 case 'Dec':
				 tdate_month='11';
				 break;
				
				
				 }
		  var fromDate   = new Date(today_date.substring(7,11),
				  tdate_month,
				  today_date.substring(0,2));
		  
		//  alert("toDate"+fromDate);
		  if(fromDate <= toDate)
		  {
		//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
		//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
			  var difference_ms = Math.abs(toDate - fromDate);
			   

			  document.getElementById('valOriginalDeferedDays').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
           

				  }
		  else{
			  
			  document.getElementById('valOriginalDeferedDays').innerHTML = "-";
			  }
	 
	
	
	  }
	  else
	  {
		  
	  document.getElementById('valOriginalDeferedDays').innerHTML = "-";
	  }
	
}




</script>
<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
<!-- InstanceEndEditable --></head>
<body onload="MM_preloadImages('img/return2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="FacilityReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />

<!--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>-->
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Facility Doc Receipt </h3></td>
    </tr>
    <tr>
      <td>
      <h3> View Doc Description - Deferred</h3>
    </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="even">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docCode" /></td>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Doc No</td>-->
<!--              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docNo" /></td>-->
<!--            </tr>-->
            <tr class="even">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docDesc" /></td>
            </tr>
               <tr class="even">
              <td class="fieldname">Doc Amount</td>
              <%if(form.getDocAmt()!=null){ %>
              <td>&nbsp;<%=form.getDocAmt() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">HDFC Amount</td>
              <%if(form.getHdfcAmt()!=null){ %>
              <td>&nbsp;<%=form.getHdfcAmt() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Currency</td>
               <%if(form.getCurrency()!=null){ %>
              <td>&nbsp;<%=form.getCurrency() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Document Type</td>-->
<!--              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>-->
<!--              <td>-</td>-->
<!--              <%}else{ %>-->
<!--              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>-->
<!--            	<%} %>-->
<!--            </tr>  -->
<!--            <tr class="even">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="formNo" /></td>-->
<!--            </tr>-->
            <tr class="even">
              <td class="fieldname">Doc Date</td>
               <%if(form.getDocDate()!=null && !form.getDocDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getDocDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="identifyDate" /></td>
            </tr>
--%>
		<tr class="even">
              <td class="fieldname">Original Target Date</td>
              <%if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getOriginalTargetDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
        	<tr class="even">
              <td class="fieldname"><%=lableDocDate%></td>
              <%if(form.getDocExpDate()!=null && !form.getDocExpDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getDocExpDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Next Due Date </td>
              <%if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Date Deferred&nbsp;</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="deferDate" /></td>
            </tr>
            <%-- // cr 36 --%>
            <<tr class="even">
              <td class="fieldname">Date Waived&nbsp;</td>
             <%if(form.getWaivedDate()!=null && !form.getWaivedDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getWaivedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Doc Received Date&nbsp;</td>
              <%if(form.getReceivedDate()!=null && !form.getReceivedDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getReceivedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Defer Counter</td>
              <td><bean:write name="FacilityReceiptForm" property="deferCount"/>&nbsp; 
               
              </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Aging of Deferred date from Original Target date</td>
              <td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Aging of Next Due date from Original Target date</td>
              <td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
            </tr>
<%--            <tr class="even">
              <td class="fieldname" >DDN valid for </td>
              <td >
            	  <% if (bcaApprovedDate == null) { %>
	                 &nbsp;
	              <% } else {
		               Date d1 = null;
	                   if (item.getDeferExtendedDate() != null) {
	                     d1 = item.getDeferExtendedDate();
                       } else {
 	                     d1 = item.getDeferExpiryDate();
                       }
 	                   Date d2 = cal.getTime();
 	                   if (d1.before(d2)) {
		          %>
		             &nbsp;         
	              <%   } else { %>
		              <%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%> days
	              <%
                       }
                     }
                  %>
              </td>
            </tr>
--%>
           <tr class="even">
              <td class="fieldname">Credit Approver </td>
              <td>&nbsp;<%
              for(int i=0; i<allCreditApproverList.size();i++){
             	 
             	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
             	 if(creditApproval.getValue()!=null){
             	 if(creditApproval.getValue().trim().equals(form.getCreditApprover())){
             	%>	 
             		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
             	<% 
             	
             	 }
             	
             	 }
              }
              
              %></td>
            </tr>
<%-- start here for cr-17
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                   <html:radio property="shared" disabled="true" value="true" />Yes
                   <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>
--%>
            </tbody>
        </table>
<%--
        <jsp:include page="/checklist/secreceipt/ViewShareCheckList.jsp" />
--%>
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
            <tbody>
            <tr class="even">
            <td class="fieldname">Remarks</td>
                <td>
                 <% FacilityReceiptForm aForm = (FacilityReceiptForm)request.getAttribute("FacilityReceiptForm"); %>
                <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;
                </td>
            </tr>
            </tbody>
            </table>
             <table width="100%">
                <tr>
				<td>
				<br></br>
 <jsp:include page="view_audit_details_individual.jsp"></jsp:include>
				</td>
				
			</tr>
			</table>
           <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                    <a href="#" onClick="saveForm()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                </td>
              </tr>
            </table>
<%-- End here for cr-17 --%>
        </td>
    </tr>
  </tbody>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
