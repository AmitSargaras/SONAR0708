<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.*,
				 java.util.*,
				 org.apache.commons.lang.StringUtils,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.util.DateUtil
                " %>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
OBDiscrepency objDisc=(OBDiscrepency)request.getAttribute("discrepencyObj");
if(objDisc==null){
	objDisc = (OBDiscrepency)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.discrepencyObj");
}
DiscrepencyForm form = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");

List deferCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.deferCreditApproverList");

ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
String customerID=String.valueOf(customer.getCustomerID());
String searchstatus= (String) request.getAttribute("searchstatus");
	String discType= (String) request.getAttribute("discType");
	
	
	if(searchstatus==null){
		searchstatus="Please";
	}
	if(discType==null){
		discType="Please";
	}
	


if(deferCreditApproverList!=null){
	pageContext.setAttribute("deferCreditApproverList",deferCreditApproverList);
}
IDiscrepencyTrxValue discrepencyTrxValue= (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
String checkDiscrepency = objDisc.getDiscrepencyType();
//for(int i=0;i<selectedList.size();i++)
	IDiscrepencyFacilityList[] discrepencyFacilityLists=objDisc.getFacilityList();
	
%>
<%
int startIndex = 0;
String ind = (String) request.getAttribute("startIndex");
if (ind != null && (!ind.equals("")))
	startIndex = Integer.parseInt(ind);


String actionStr1 = "com.integrosys.cms.ui.discrepency.DiscrepencyAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
	 
	 
	 DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	 String otdDate="";
		if(objDisc.getOriginalTargetDate()!=null){
		 otdDate=df.format(objDisc.getOriginalTargetDate());
		}
		String creationDate=df.format(objDisc.getCreationDate());
%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.OBDiscrepency"%>
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
    <script language="JavaScript" src="js/validation.js"></script>

    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
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
        
        function saveForm() {
            
        	document.forms["DiscrepencyForm"].action = "Discrepency.do?event=maker_submit_defer_discrepancy&searchstatus=<%=searchstatus%>&discType=<%=discType %>&customerID=<%=customerID %>&startIndex=<%=startIndex%>";
            document.forms["DiscrepencyForm"].submit();
        }

        function cancelForm() {
        	document.forms[0].action="Discrepency.do?event=maker_return_process_list_discrepency&customerID=<%=customerID %>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType%>";
            document.forms[0].submit();
        }

        function verifyDocEffDateChanged() {
            if (document.forms["DiscrepencyForm"].isPolicy.value == "true") {
                if (document.forms["DiscrepencyForm"].docEffDate.value != document.forms["DiscrepencyForm"].docOldEffDate.value) {
                    document.forms["DiscrepencyForm"].isEffDateChanged.value = "true";
                }
            }
        }
        function setDifferenceBetDate() {
            
            
            
      	   var user_date = document.forms[0].nextDueDate.value;
      	
      	//alert("user_date 1 :"+user_date);
      	
      	var today_date = document.forms[0].creationDateHidden.value;
      	//alert("today_date 1 :"+today_date);
      	
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
         
     	
         
   	   var user_date = document.forms[0].nextDueDate.value;
   	
   	//alert("user_date :"+user_date);
   	
   	var today_date = document.forms[0].otd.value;
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

   	setDifferenceBetDate();
   	
   }
        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/calendarb.gif','img/cancel2.gif')">

<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>
    <html:hidden property="startIndex" />


<%
   
    
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
	

	
	
	
%>
<p class="required"><font color="red">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<%System.out.println("otdDate :"+otdDate ); %>
     <input type="hidden" id="otd" value="<%=otdDate %>"/>
      <input type="hidden" id="creationDateHidden" value="<%=creationDate %>"/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
        <%if(objDisc.getStatus().equals("DEFERED")) {%>
        <td><h3>Defer Deferred Discrepancy Doc  </h3></td>
        <%}else{ %>
        <td><h3>Defer Discrepancy Doc  </h3></td>
        <%} %>
            
        </tr>
        <tr>
            <td><h3> Doc Description </h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                <%
                String disId="-";
			if(discrepencyTrxValue.getActualDiscrepency()!=null){
				disId=String.valueOf(discrepencyTrxValue.getActualDiscrepency().getId());
			}
                
                %>
                <tr class="even">
                        <td class="fieldname">Discrepancy Id</td>
                        <td><%=disId %>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Type of Discrepancy</td>
                        <td>&nbsp;<%=objDisc.getDiscrepencyType() %></td>
                    </tr>
                      <% if( checkDiscrepency.equals("Facility") ) { %>
		                        		<tr class="even" >
											<td class="fieldname" >Facility</td>
											<td class="even" >
											<%
											if(discrepencyFacilityLists!=null){
											for(int i=0;i<discrepencyFacilityLists.length;i++){
											%>
											<%=discrepencyFacilityLists[i].getFacilityName() %></br>
											<%}
											}%>
			                            	</td>
		                        		</tr>
		                        		<%}%>
                    <tr class="even">
                        <td class="fieldname">Critical</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="critical"/></td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Discrepancy</td>
                        <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=objDisc.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    </tr>
						<tr class="even">
                        <td class="fieldname">Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=objDisc.getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Approved Date</td>
											<%if(objDisc.getAcceptedDate()!=null){ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=objDisc.getAcceptedDate() %>" />
								            </td>
								            <%}else{ %>
								            <td class="even" >&nbsp;-</td>
								            <%} %>
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=objDisc.getOriginalTargetDate() %>" />
											<html:errors property="originalTargetDateError" />
								            </td>
											
										</tr>
										
										<!-- <tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=objDisc.getNextDueDate() %>" />
								            </td>
											

										</tr> -->
                    
                    <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;<font color="RED">*</font></td>
                        <td><html:text property="deferDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('deferDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                                 <html:errors property="deferDateError"/>
                        </td>
                    </tr>
                    	<tr class="even">
											<td class="fieldname" width="20%">Next Due Date&nbsp;<font color="RED">*</font></td>
											<td class="even" >
											
											<html:text property="nextDueDate" size="12" maxlength="12" name="DiscrepencyForm" readonly="true" onchange="originalDeferedDaysCal();" />
								            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('nextDueDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; 
											<br/><html:errors property="nextDueDateError"/></td>
											

										</tr>
					<tr class="even">
						<td class="fieldname" >Aging of Creation Date - NextDue Date</td>
											<td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
						
						
										</tr>
										
						<tr class="even">
						<td class="fieldname" >Aging of Original TD-NextDue Date</td>
											<td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
						
						
										</tr>
                   <tr class="even">
											<td class="fieldname" >Defer Counter</td>
											<td class="even" >
											&nbsp;
											<%=objDisc.getDeferedCounter() %>
								            </td>
											

										</tr>
 
                  
                    <tr class="odd">
                        <td class="fieldname">Credit Approver <font color="RED">*</font></td>
                        <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="deferCreditApproverList" labelProperty="label" property="value" />
											</html:select>  <html:errors property="creditApprover"/>
                        </td>
                    </tr>

                </tbody>
            </table>

                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                    <tr>
										<td class="fieldname">Creation Remarks<font color="red">*</font></td>
										<td class="even" colspan="3">
										<html:textarea property="discrepencyRemark" rows="6" cols="120"/>
										<br/><html:errors property="discrepencyRemarkError"/></td>
									</tr>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td><html:textarea name="DiscrepencyForm" rows="6" cols="120" property="docRemarks"
                                               onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks"/></td>
                        </tr>
                     
         <html:hidden property="id"/>
         <html:hidden property="customerId"/>
         <html:hidden property="discrepencyType"/>
         <html:hidden property="facilityList"/>
         <html:hidden property="discrepencyId"/>
         <html:hidden property="selectedFacilityList"/>
         <html:hidden property="hiddenList"/>
         <html:hidden property="creationDate"/>
         <html:hidden property="acceptedDate"/>
         <html:hidden property="originalTargetDate"/>
         <html:hidden property="critical"/>
         <html:hidden property="approvedBy"/>
         <html:hidden property="counter"/>
         <html:hidden property="discrepency"/>
         <html:hidden property="discrepencyRemark"/>  
         <html:hidden property="docRemarks"/>   
         <html:hidden property="recDate"/>   
         <html:hidden property="deferDate"/>   
         <html:hidden property="waiveDate"/>
         <html:hidden property="creditApprover"/>  
         <html:hidden property="status" value="PENDING_DEFER"/>                   
                    </tbody>
                </table>
                 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>     
 
</td>
                    </tr>
                     </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveForm()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                            <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4" border="0" id="Image4"/></a></td>
                    </tr>
                </table>
                    <%-- End here for cr-17 --%>
            </td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
