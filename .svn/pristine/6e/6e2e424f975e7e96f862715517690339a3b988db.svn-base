<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.*,
				 java.util.*,
				 org.apache.commons.lang.StringUtils,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.util.DateUtil
                " %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
DiscrepencyForm form = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
String customerID=String.valueOf(customer.getCustomerID());
String event=(String)request.getAttribute("event");
String loginId=(String)request.getAttribute("loginId");
String transactionDate=(String)request.getAttribute("transactionDate");
IDiscrepencyTrxValue discrepencyTrxValue= (IDiscrepencyTrxValue)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
IDiscrepency stageDiscrepency=discrepencyTrxValue.getStagingDiscrepency();
IDiscrepency actualDiscrepency=discrepencyTrxValue.getActualDiscrepency();




List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}
List selectedList = (List) request.getAttribute("selectedList");


String docStatus="";

String submitEvent = "checker_approve_discrepency";

String rejectEvent = "checker_reject_discrepency";

IDiscrepency discrepency= null;

if(discrepencyTrxValue.getActualDiscrepency()!=null){
	discrepency=discrepencyTrxValue.getActualDiscrepency();
	}else{
		discrepency=discrepencyTrxValue.getStagingDiscrepency();
	}




String checkDiscrepency = discrepency.getDiscrepencyType();
String append = "";

IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
	if(discrepency.getFacilityList()!=null){
		
	 discrepencyFacilityLists=discrepency.getFacilityList();
}
	
	docStatus=discrepencyTrxValue.getStagingDiscrepency().getStatus();

String cancelEvent="";
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
if("maker_close_view_discrepancy".equals(event) && 
		(ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID) 
		||ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID)
		|| ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID)
		|| ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID) 
		|| ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
		|| ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
		|| ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
		|| ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID))
	){
	cancelEvent="maker_close_search_discrepency";
}
else if( ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID)
|| ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID)
){
	cancelEvent="maker_process_search_discrepency";
}else{
	cancelEvent="checker_list_discrepency";
}


%>

<%
String searchstatus=(String)request.getAttribute("searchstatus");
String discType=(String)request.getAttribute("discType");
if(searchstatus==null){
	searchstatus="Please";
}
if(discType==null){
	discType="Please";
}
String startIndex=(String)request.getAttribute("startIndex");
%>

<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepency"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

      
        
        function cancelPage(){
        	  document.forms[0].action="Discrepency.do?event=<%=cancelEvent%>&customerID=<%=customerID %>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType%>&loginId=<%=loginId %>&transactionDate=<%=transactionDate %>";
              document.forms[0].submit();
        }

       

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/calendarb.gif','img/cancel2.gif')">

<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>


<%
   
    
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
	
		if(aForm.getTotalDeferedDays()==null){
			aForm.setTotalDeferedDays("0");
		}
		if(aForm.getOriginalDeferedDays()==null){
			aForm.setOriginalDeferedDays("0");
		}
		
		DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
		String otdDate="";
		if(discrepencyTrxValue.getActualDiscrepency()!=null){
		if(discrepencyTrxValue.getActualDiscrepency().getOriginalTargetDate()!=null){
		 otdDate=df.format(discrepencyTrxValue.getActualDiscrepency().getOriginalTargetDate());
		}
		}
		String creationDate=df.format(discrepencyTrxValue.getStagingDiscrepency().getCreationDate());
		String nextDueDate="";
		if(discrepencyTrxValue.getStagingDiscrepency().getNextDueDate()!=null){
		nextDueDate=df.format(discrepencyTrxValue.getStagingDiscrepency().getNextDueDate());
		}
	
	
%>
 <script language="JavaScript" type="text/JavaScript">
       
        
        function setDifferenceBetDate() {
           
          
            
         	   var user_date = document.forms[0].nextDueDate.value;
         	
         	//alert("user_date :"+user_date);
         	
         	var today_date = document.forms[0].creationDate.value;
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
      	
      }
        //-->
    </script>
<!-- InstanceBeginEditable name="Content" -->
<input type="hidden" id="otd" value="<%=otdDate %>"/>
      <input type="hidden" id="creationDate" value="<%=creationDate %>"/>
       <input type="hidden" id="nextDueDate" value="<%=nextDueDate %>"/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3> Discrepancy Doc  </h3></td>
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
                        <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Discrepancy Id</td>
                    <%}else{ %>
                        <td class="fieldname">Discrepancy Id</td>
                        <%} %>
                        <td><%=disId %>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                    <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Type of Discrepency</td>
                    <%}else{ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepencyType")? "fieldname":"fieldnamediff"%>">Type of Discrepency</td>
                        <%} %>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="discrepencyType"/></td>
                    </tr>
                     <% if( checkDiscrepency.equals("Facility") ) { %>
		                        		<tr class="even" id="mutlipleSelect">
		                        		 <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Facility</td>
                    <%}else{ %>
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepencyType")? "fieldname":"fieldnamediff"%>" >Facility</td>
											<%} %>
											<td class="even"  >
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
                    <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Critical</td>
                    <%}else{ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"critical")? "fieldname":"fieldnamediff"%>">Critical</td>
                        <%} %>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="critical"/></td>
                    </tr>
                    <tr class="odd">
                      <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Discrepency</td>
                    <%}else{ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepency")? "fieldname":"fieldnamediff"%>">Discrepency</td>
                        <%} %>
                        <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=form.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    </tr>
            
						<tr class="even">
						<%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Creation Date</td>
                    <%}else{ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"creationDate")? "fieldname":"fieldnamediff"%>">Creation Date</td>
                        <%} %>
                        <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
							<%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Approved Date</td>
                    <%}else{ %>				
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"acceptedDate")? "fieldname":"fieldnamediff"%>" >Approved Date</td>
											<%} %>
											<%if(discrepencyTrxValue.getStagingDiscrepency().getAcceptedDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getAcceptedDate() %>" /><%} %>
								            </td>
										</tr>
										<tr class="even">
										<%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Original Target Date</td>
                    <%}else{ %>	
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"originalTargetDate")? "fieldname":"fieldnamediff"%>" >Original Target Date</td>
											<%} %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
										<%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Next Due Date</td>
                    <%}else{ %>	
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"nextDueDate")? "fieldname":"fieldnamediff"%>" >Next Due Date</td>
											<%} %>
											<%if(discrepencyTrxValue.getStagingDiscrepency().getNextDueDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getNextDueDate() %>" /><%} %>
								            </td>
											

										</tr>
                    <tr class="even">
                    <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Date Closed&nbsp;</td>
                    <%}else{ %>	
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"recDate")? "fieldname":"fieldnamediff"%>">Date Closed&nbsp;</td>
                        <%} %>
                        <%if(discrepencyTrxValue.getStagingDiscrepency().getRecDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getRecDate() %>" /></td><%} %>
                    </tr>
                      <tr class="even">
                      <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Date Waived&nbsp;</td>
                    <%}else{ %>	
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"waiveDate")? "fieldname":"fieldnamediff"%>">Date Waived&nbsp;</td>
                        <%} %>
                        <%if(discrepencyTrxValue.getStagingDiscrepency().getWaiveDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getWaiveDate() %>" /></td><%} %>
                    </tr>
                      <tr class="even">
                      <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Date Defered&nbsp;</td>
                    <%}else{ %>	
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"deferDate")? "fieldname":"fieldnamediff"%>">Date Defered&nbsp;</td>
                        <%} %>
                        <%if(discrepencyTrxValue.getStagingDiscrepency().getDeferDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getDeferDate() %>" /></td><%} %>
                    </tr>
                   <tr class="even">
                   <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Aging of Creation Date - NextDue Date</td>
                    <%}else{ %>
						<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"totalDeferedDays")? "fieldname":"fieldnamediff"%>" >Aging of Creation Date - NextDue Date</td>
						<%} %>
						<td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
						
						
										</tr>
										
						<tr class="even">
						<%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Aging of Original TD-NextDue Date</td>
                    <%}else{ %>
						<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"originalDeferedDays")? "fieldname":"fieldnamediff"%>" >Aging of Original TD-NextDue Date</td>
						<%} %>
					<td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
						
										</tr>
                    
                     <tr class="even">
                     <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Defer Counter</td>
                    <%}else{ %>	
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"deferedCounter")? "fieldname":"fieldnamediff"%>" >Defer Counter</td>
											<%} %>
											<td class="even" >
											&nbsp;
											<bean:write property="deferedCounter"  name="DiscrepencyForm" />
								            </td>
											

										</tr>
                       <tr class="even">
                       <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Document Status&nbsp;</td>
                    <%}else{ %>	
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"status")? "fieldname":"fieldnamediff"%>">Document Status&nbsp;</td>
                        <%} %>
                       <%String status="";		
                       if(docStatus.equals("PENDING_DEFER")){
                    	   	status="PENDING DEFER";
									}else if(docStatus.equals("PENDING_CLOSE")){
										status="PENDING CLOSE";
									}else if(docStatus.equals("PENDING_WAIVE")){
										status="PENDING WAIVE";
									}else if(docStatus.equals("PENDING_CREATE")){
										status="PENDING CREATE";
									}else if(docStatus.equals("PENDING_UPDATE")){
										status="PENDING UPDATE";
									}
								%>
								<td>
								<%=status%>
								</td>
                            
                    </tr>
                 <tr class="even">
                 <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Credit Approver</td>
                    <%}else if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_UPDATE")){ %>	
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"approvedBy")? "fieldname":"fieldnamediff"%>">Credit Approver</td>
                        <%}else{ %>
                         <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"creditApprover")? "fieldname":"fieldnamediff"%>">Credit Approver</td>
                        <%}if(docStatus.equals("PENDING_CREATE")||"PENDING_UPDATE".equals(docStatus)){%>
                        <td><%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(form.getApprovedBy())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%>&nbsp;
                        </td><%}else{ %>
                        <td><%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(form.getCreditApprover())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%>&nbsp;
                        </td>
                        <%} %>
                    </tr>
 
                  <tr class="even">
                  <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Creation Remarks</td>
                    <%}else{ %>	
                            <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepencyRemark")? "fieldname":"fieldnamediff"%>">Creation Remarks</td>
                            <%} %>
                             <%String creationRemark=discrepencyTrxValue.getStagingDiscrepency().getDiscrepencyRemark();
                            if(creationRemark!=null){
                            %> 
                            <td>
                            <textarea readonly="readonly" rows="6" cols="120"><%=creationRemark%></textarea>
                            &nbsp;</td>
                            <%}else{ %>
                            <td ><textarea readonly="readonly" rows="6" cols="120"></textarea></td>
                            <%} %>
                        </tr>
                        
                           <tr class="even">
                           <%if(stageDiscrepency.getStatus().equalsIgnoreCase("PENDING_CREATE")){ %>
                    <td class="indexadd">Remarks</td>
                    <%}else{ %>	
                            <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"docRemarks")? "fieldname":"fieldnamediff"%>">Remarks</td>
                            <%} %>
                            <td>
                            <%if(discrepencyTrxValue.getStagingDiscrepency().getDocRemarks()!=null){ %>
                            <textarea readonly="readonly" rows="6" cols="120"><%=discrepencyTrxValue.getStagingDiscrepency().getDocRemarks()%>
                            </textarea>
                            <%}else{ %>
                            <textarea readonly="readonly" rows="6" cols="120"></textarea>
                            <%} %>&nbsp;</td>
                           
                           
                        </tr>
                         <tr class="even">
                            <td class="fieldname">Last Remarks Made</td>
                            <td>
                            <%if(discrepencyTrxValue.getRemarks()!=null){ %>
                            <textarea readonly="readonly" rows="6" cols="120"><%=discrepencyTrxValue.getRemarks()%></textarea>
                            <%}else{ %>
                           <textarea readonly="readonly" rows="6" cols="120"></textarea> 
                            <%} %>
                            &nbsp;</td>
                           
                           
                        </tr>
<html:hidden property="id"/>
         <html:hidden property="customerId"/>
         <html:hidden property="discrepencyType"/>
         <html:hidden property="discrepencyId"/>
         <html:hidden property="creationDate"/>
         <html:hidden property="acceptedDate"/>
         <html:hidden property="originalTargetDate"/>
         <html:hidden property="nextDueDate"/>
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
                         <html:hidden name="DiscrepencyForm" property="selectedFacilityList" value="<%=append%>"/>  
                </tbody>
            </table>

                
               <table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
			
				<tr>


					 <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
                    <%-- End here for cr-17 --%>
            </td>
        </tr>
    </tbody>
    <input type="hidden" name="searchstatus" value="<%=searchstatus%>"/>
<input type="hidden" name="discType" value="<%=discType%>"/>
<input type="hidden" name="customerID" value="<%=customerID%>"/>
<input type="hidden" name="transactionDate" value="<%=transactionDate%>"/>
<input type="hidden" name="loginId" value="<%=loginId%>"/>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
