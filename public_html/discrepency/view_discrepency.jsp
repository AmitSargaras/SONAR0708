<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>

<%
OBDiscrepency discObj=null;
    DiscrepencyForm form = (DiscrepencyForm) request.getAttribute("DiscrepencyForm");
	List selectedList = (List) request.getAttribute("selectedList");
	
	String searchstatus= (String) request.getAttribute("searchstatus");
	String discType= (String) request.getAttribute("discType");
	
	if(searchstatus==null){
		searchstatus="Please";
	}
	if(discType==null){
		discType="Please";
	}
	
	IDiscrepencyTrxValue discrepencyTrx = (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
	String checkDiscrepency = discrepencyTrx.getActualDiscrepency().getDiscrepencyType();
	IDiscrepency stageDiscrepency=discrepencyTrx.getStagingDiscrepency();
	IDiscrepency actualDiscrepency=discrepencyTrx.getActualDiscrepency();
	//for(int i=0;i<selectedList.size();i++)
		IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
		if(discrepencyTrx.getActualDiscrepency()!=null){
			if(discrepencyTrx.getActualDiscrepency().getFacilityList()!=null){
			 discrepencyFacilityLists=discrepencyTrx.getActualDiscrepency().getFacilityList();
	}
		}
List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
	    
	    if(allCreditApproverList!=null){
	    	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
	    }
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
	 
%>
<%
String discrepency = discrepencyTrx.getActualDiscrepency().getTransactionStatus();
if(!discrepency.equals("ACTIVE")){
	discObj=(OBDiscrepency)discrepencyTrx.getStagingDiscrepency();
}
else{
	discObj=(OBDiscrepency)discrepencyTrx.getActualDiscrepency();
}
%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepency"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.OBDiscrepency"%>
<%@page import="java.util.Date"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%><script language="JavaScript" type="text/javascript">
	
	function cancelForm(){
		document.forms["DiscrepencyForm"].action = "Discrepency.do?event=return_list_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType %>&startIndex=<%=startIndex%>";
        document.forms["DiscrepencyForm"].submit();
	}

</script>
<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>
    <html:hidden property="startIndex" />


<%
   
DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
		if(aForm.getTotalDeferedDays()==null){
			aForm.setTotalDeferedDays("0");
		}
		if(aForm.getOriginalDeferedDays()==null){
			aForm.setOriginalDeferedDays("0");
		}

		 String otdDate="";
			if(discObj.getOriginalTargetDate()!=null){
			 otdDate=df.format(discObj.getOriginalTargetDate());
			}
		String creationDate=df.format(discObj.getCreationDate());
		String nextDueDate="";
		if(discObj.getNextDueDate()!=null){
		nextDueDate=df.format(discObj.getNextDueDate());
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
                 <html:hidden property="startIndex" value="<%=ind%>"/>
                </thead>
                <tbody>
                <tr class="odd">
                        <td class="fieldname">Discrepency Id</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="id"/></td>
                    </tr>
                    <tr class="even">
                    <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepencyType")? "fieldname":"fieldnamediff"%>">
                        <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Type of Discrepency</td>
                        <td>&nbsp;<%=discObj.getDiscrepencyType() %></td>
                    </tr>
                     <% if( checkDiscrepency.equals("Facility") ) { %>
		                        		<tr class="even" id="mutlipleSelect">
											<td class="fieldname" >Facility</td>
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
                    <tr class="odd">
                    <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"critical")? "fieldname":"fieldnamediff"%>">
                        <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Critical</td>
                        <td>&nbsp;<%=discObj.getCritical() %></td>
                    </tr>
                    <tr class="even">
                    <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepency")? "fieldname":"fieldnamediff"%>">
                        <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Discrepency</td>
                         <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=discObj.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    </tr>
            
						<tr class="even">
						 <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"creationDate")? "fieldname":"fieldnamediff"%>">
                        <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=discObj.getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											 <%if(!"ACTIVE".equals(discrepency)){ %>
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"acceptedDate")? "fieldname":"fieldnamediff"%>" >
											  <%}else{ %>
                        <td class="fieldname">
                        <%} %>
											
											Approved Date</td>
											<%if(discObj.getAcceptedDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discObj.getAcceptedDate() %>" />
								            </td>
								            <%} %>
										</tr>
										<tr class="even">
										 <%if(!"ACTIVE".equals(discrepency)){ %>
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"originalTargetDate")? "fieldname":"fieldnamediff"%>" >
											  <%}else{ %>
                        <td class="fieldname">
                        <%} %>
											Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discObj.getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
										 <%if(!"ACTIVE".equals(discrepency)){ %>
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"nextDueDate")? "fieldname":"fieldnamediff"%>" >
											  <%}else{ %>
                        <td class="fieldname">
                        <%} %>
											Next Due Date</td>
											<%if(discObj.getNextDueDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discObj.getNextDueDate() %>" />
								            </td>
								            <%} %>
											

										</tr>
                    <tr class="even">
                     <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"recDate")? "fieldname":"fieldnamediff"%>">
                          <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Date Closed&nbsp;</td>
                        <%if(discObj.getRecDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discObj.getRecDate() %>" /></td>
                         <%} %>
                    </tr>
                      <tr class="even">
                       <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"waiveDate")? "fieldname":"fieldnamediff"%>">
                          <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Date Waived&nbsp;</td>
                        <%if(discObj.getWaiveDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discObj.getWaiveDate() %>" /></td><%} %>
                    </tr>
                      <tr class="even">
                       <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"deferDate")? "fieldname":"fieldnamediff"%>">
                          <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Date Defered&nbsp;</td>
                        <%if(discObj.getDeferDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discObj.getDeferDate() %>" /></td><%} %>
                    </tr>
                    <tr class="even">
                    <%if(stageDiscrepency.getStatus().equalsIgnoreCase("")){ %>
                    <td class="fieldname" >Aging of Creation Date - NextDue Date</td>
                    <%}else{ %>
                     <%if(!"ACTIVE".equals(discrepency)){ %>
						<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"totalDeferedDays")? "fieldname":"fieldnamediff"%>" >
						 <%}else{ %>
                        <td class="fieldname">
                        <%} %>
						Aging of Creation Date - NextDue Date</td>
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
						  <%if(stageDiscrepency.getStatus().equalsIgnoreCase("")){ %>
                    <td class="fieldname" >Aging of Original TD-NextDue Date</td>
                    <%}else{ %>
                     <%if(!"ACTIVE".equals(discrepency)){ %>
						<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"originalDeferedDays")? "fieldname":"fieldnamediff"%>" >
						  <%}else{ %>
                        <td class="fieldname">
                        <%} %>
						
						Aging of Original TD-NextDue Date</td>
						<%} %>
					<td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
						
										</tr>
                    
                    
                    <tr class="odd">
                     <%if(!"ACTIVE".equals(discrepency)){ %>
											<td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"deferedCounter")? "fieldname":"fieldnamediff"%>" >
											  <%}else{ %>
                        <td class="fieldname">
                        <%} %>
											Defer Counter</td>
											<td class="even" >
											&nbsp;
											<%=discObj.getDeferedCounter() %>
								            </td>
											

										</tr>
                      <tr class="even">
                       <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"status")? "fieldname":"fieldnamediff"%>">
                          <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Document Status&nbsp;</td>
                         <td>
                       <%String docStatus=discObj.getStatus();
                       if(docStatus.equals("ACTIVE")){
                       docStatus="OPEN";
                       }else if(docStatus.equals("PENDING_DEFER")){
                       docStatus="PENDING DEFER";
                       }else if(docStatus.equals("PENDING_WAIVE")){
                       docStatus="PENDING WAIVE";
                       }else if(docStatus.equals("PENDING_UPDATE")){
                       docStatus="PENDING UPDATE";
                       }else if(docStatus.equals("PENDING_CLOSE")){
                       docStatus="PENDING CLOSE";
                       }%>
                       <%=docStatus %>  &nbsp;</td>
                          
                    </tr>
                   <tr class="even">
                   <%System.out.println("***************** ACTUAL "+actualDiscrepency.getApprovedBy()); 
                   System.out.println("***************** STAGE "+stageDiscrepency.getApprovedBy());%>
                    <%if(docStatus.equals("PENDING UPDATE") ){ %>
                      <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"approvedBy")? "fieldname":"fieldnamediff"%>">
                         <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Credit Approver</td>
                        <%}else{ %>
                          <%if(!"ACTIVE".equals(discrepency)){ %>
                        <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"creditApprover")? "fieldname":"fieldnamediff"%>">
                         <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                        Credit Approver</td>
                        <%} %>
                        <%if(!docStatus.equals("OPEN")&& !docStatus.equals("PENDING UPDATE") ){ %>
                        <td><%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(discObj.getCreditApprover())){
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
            	 if(creditApproval.getValue().trim().equals(discObj.getApprovedBy())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%>&nbsp;
                        </td>
                        <%} %>
                    </tr>
 
                  
                    

                </tbody>
            </table>

                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                           <%if(!"ACTIVE".equals(discrepency)){ %>
                            <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"discrepencyRemark")? "fieldname":"fieldnamediff"%>">
                            <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                            Creation Remarks</td>
                            <%String creationRemark=discObj.getDiscrepencyRemark();
                            if(creationRemark!=null){
                            %>                            
                            <td><textarea readonly="readonly" rows="6" cols="120"><%=creationRemark%></textarea>
                            &nbsp;</td>
                            <%}else{ %>
                            <td ><textarea readonly="readonly" rows="6" cols="120"></textarea></td>
                            <%} %>
                        </tr>
                        <tr class="even">
                           <%if(!"ACTIVE".equals(discrepency)){ %>
                            <td class="<%=CompareOBUtil.compOB(stageDiscrepency,actualDiscrepency,"docRemarks")? "fieldname":"fieldnamediff"%>">
                            <%}else{ %>
                        <td class="fieldname">
                        <%} %>
                            
                            Remarks</td>
                            <td>
                            <%
                            if(discObj.getDocRemarks()!=null){
                            %>  
                            <textarea readonly="readonly" rows="6" cols="120"><%=discObj.getDocRemarks()%></textarea>
                            <%}else{ %>
                            <textarea readonly="readonly" rows="6" cols="120"></textarea>
                            <%} %>
                            &nbsp;
                            </td>
                           
                           
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
         
                    </tbody>
                    
                </table>
                <table width="100%">
                <tr>
				<td>
				<br></br>
 <jsp:include page="view_audit_details.jsp"></jsp:include>
				</td>
				
			</tr>
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


    <td>
    <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4" border="0" id="Image4"/></a>&nbsp;
    </td>

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
</table>
<!-- InstanceEndEditable -->
</html:form>
		