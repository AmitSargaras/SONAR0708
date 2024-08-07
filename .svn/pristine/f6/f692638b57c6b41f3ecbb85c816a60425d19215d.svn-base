<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*, 
				com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckListItem" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
ICheckListItem viewObj=(ICheckListItem)request.getAttribute("viewObj");
System.out.println(">>>>>>>>>>>>>>>>>>>>>>> getItemDesc "+viewObj.getItemDesc());
String event=(String)request.getAttribute("event");
String index=(String)request.getAttribute("index");
String status = (String) request.getAttribute("status");
String description = (String) request.getAttribute("description");
String category = (String) request.getAttribute("category");

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> status "+status);
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> description "+description);
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> category "+category);
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    
    String lableDocDate = "Doc Expiry Date";
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.allCreditApproverList");
    List waiverCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.waiverCreditApproverList");
    //System.out.println("::::waiverCreditApproverList:::::::"+waiverCreditApproverList);
    if(waiverCreditApproverList!=null){
    	pageContext.setAttribute("waiverCreditApproverList",waiverCreditApproverList);
    }
    System.out.println(">>>>>>>>>>>>>>>>>>>>>>> 2222222222222");
    //Get this to display the title correctly (according to item status)
    String titleStatusDisplay = "";
    if(viewObj.getDocumentStatus().equals("ACTIVE")){
    	if(viewObj.getItemStatus().equals("AWAITING")){
    		titleStatusDisplay="Pending";
    	}else if(viewObj.getItemStatus().equals("RECEIVED")){
    		titleStatusDisplay="Receive";
    	}else if(viewObj.getItemStatus().equals("WAIVED")){
    		titleStatusDisplay="Waive";
    	}else if(viewObj.getItemStatus().equals("DEFERRED")){
    		titleStatusDisplay="Defer";
    	}
    }else{
    	titleStatusDisplay="Inactive";
    }
    
    System.out.println(">>>>>>>>>>>>>>>>>>>>>>> 33333333333333 ");

    /*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0)
	{
		
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if(monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))
	{
				lableDocDate = "Due Date to Receive Premium Receipt";
	}*/


%>
<%
String nextDate="";
String deferDate="";
String otdDate="";


%>



<%@page import="java.util.List"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function refreshDoc(){
	//alert("in method refresh");	
	document.forms[0].action      	= "DocumentCheckList.do?event=return_view";
 //	document.forms[0].event.value 	= "list";
 	document.forms[0].submit();
}

function submitInactive() {
	var index=<%=index%>;
	//alert("index "+index);
	document.forms["FacilityReceiptForm"].event.value="conform_inactive";
	document.forms["FacilityReceiptForm"].submit();
}
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
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="DocumentCheckList.do" >
<input type="hidden" name="status" value="<%=status %>" />
<input type="hidden" name="description" value="<%=description %>" />
<input type="hidden" name="category" value="<%=category %>" />




<!--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>-->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>View Complete CheckList Doc </h3></td>
    </tr>
    <tr>
      <td>
      <h3> View Doc Description - <%=titleStatusDisplay%></h3>
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
              <%if(null!=viewObj.getItemCode()){ %>
              <td><%=viewObj.getItemCode() %>&nbsp;</td>
              <%}else{ %>
              <td>-&nbsp;</td>
              <%} %>              
            </tr>
            <tr class="even">
              <td class="fieldname">Description</td>
             <%if(null!=viewObj.getItemDesc()){ %>
              <td><%=viewObj.getItemDesc() %>&nbsp;</td>
              <%}else{ %>
              <td>-&nbsp;</td>
              <%} %> 
            </tr>
            <tr class="even">
              <td class="fieldname">Doc Amount</td>
              <%if(viewObj.getDocAmt()!=null && !viewObj.getDocAmt().equals("")){ %>
              <td>&nbsp;<integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(viewObj.getDocAmt()))%>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">HDFC Amount</td>
              <%if(viewObj.getHdfcAmt()!=null && !viewObj.getHdfcAmt().equals("")){ %>
              <td>&nbsp;<integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(viewObj.getHdfcAmt()))%>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Currency</td>
               <%if(viewObj.getCurrency()!=null && !viewObj.getCurrency().equals("")){ %>
              <td>&nbsp;<%=viewObj.getCurrency() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Doc Date</td>
              <%if(viewObj.getDocDate()!=null ){  %>
              <td>&nbsp;<integro:date object="<%=viewObj.getDocDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Original Target Date</td>
              <%if(viewObj.getOriginalTargetDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getOriginalTargetDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname"><%=lableDocDate%></td>
              <%if(viewObj.getExpiryDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getExpiryDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <%if(viewObj.getItemStatus().equals("DEFERRED")){ %>
             <tr class="even">
              <td class="fieldname">Last Due Date </td>
              <%if(viewObj.getExpectedReturnDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getExpectedReturnDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Next Due Date </td>
              <%if(viewObj.getDeferExtendedDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getDeferExtendedDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <%}else{ %>
            <tr class="even">
              <td class="fieldname">Next Due Date </td>
              <%if(viewObj.getExpectedReturnDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getExpectedReturnDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <%} %>
             <tr class="even">
              <td class="fieldname">Date Deferred&nbsp;</td>
              <%if(viewObj.getDeferExtendedDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getDeferExtendedDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Date Waived&nbsp;</td>
             <%if(viewObj.getWaivedDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getWaivedDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Doc Received Date&nbsp;</td>
              <%if(viewObj.getReceivedDate()!=null ){ %>
              <td>&nbsp;<integro:date object="<%=viewObj.getReceivedDate() %>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
               <td class="fieldname">Defer Counter</td>
             <%if(viewObj.getDeferCount()!=null && !viewObj.getDeferCount().equals("") && !viewObj.getDeferCount().equals("0")){ %>
             <td>&nbsp;<%=viewObj.getDeferCount() %></td>
             <%}else{ %>
              <td>&nbsp;-</td>
             <%} %>
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
              <td class="fieldname" >DDN valid for </td><td ><input type="text" name="ddnDays" size="5" readonly="true"> &nbsp;&nbsp;<a href="#" onclick="calculateDaysDiff()">Days</a></td>
            </tr>
--%>            
           <tr class="even" >
            <td class="fieldname">Credit Approver</td>
            <%if(viewObj.getCreditApprover()!=null){ %>
            <td>&nbsp;       
           <%
           if(allCreditApproverList!=null){
        	for(int a=0; a<allCreditApproverList.size();a++){   
           LabelValueBean bean=(LabelValueBean) allCreditApproverList.get(a);
           if(bean.getValue()!=null){
          	 if(bean.getValue().trim().equals(viewObj.getCreditApprover())){
          		
          	%>	 
          		 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          	<% 
          	 }
          	 }          
        	}
        	} %> 
            </td>
          <%}else{ %>
          <td>&nbsp;-</td>
          <%} %>
        </tr>
            </tbody>
        </table>
<%--
        <jsp:include page="/checklist/secreceipt/ViewShareCheckList.jsp" />
--%>
      
         <table width="100%">
                <tr>
				<td>
				<br></br>
 </td>
				
			</tr>
			</table>
           <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
              
                <td align="center">
                    <a href="#" onClick="refreshDoc()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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
