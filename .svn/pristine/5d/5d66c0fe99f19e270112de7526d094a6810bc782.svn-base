<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>

<%
DiscrepencyForm form = (DiscrepencyForm) request.getAttribute("DiscrepencyForm");
	IDiscrepencyTrxValue discrepencyTrx = (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
	String checkDiscrepency = discrepencyTrx.getStagingDiscrepency().getDiscrepencyType();
	
	IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
	if(discrepencyTrx.getActualDiscrepency()!=null){
		if(discrepencyTrx.getActualDiscrepency().getFacilityList()!=null){
			
		 discrepencyFacilityLists=discrepencyTrx.getActualDiscrepency().getFacilityList();
	}
	}else{
		
		if(discrepencyTrx.getStagingDiscrepency()!=null){
			if(discrepencyTrx.getStagingDiscrepency().getFacilityList()!=null){
				
			 discrepencyFacilityLists=discrepencyTrx.getStagingDiscrepency().getFacilityList();
		}
		
	}
	}
	List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
    
    if(allCreditApproverList!=null){
    	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
    }

    DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
    String otdDate="";
	if(discrepencyTrx.getStagingDiscrepency().getOriginalTargetDate()!=null){
	 otdDate=df.format(discrepencyTrx.getStagingDiscrepency().getOriginalTargetDate());
	}
	String creationDate=df.format(discrepencyTrx.getStagingDiscrepency().getCreationDate());
	String nextDueDate="";
	if(discrepencyTrx.getStagingDiscrepency().getNextDueDate()!=null){
	nextDueDate=df.format(discrepencyTrx.getStagingDiscrepency().getNextDueDate());
	}

%>




<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"totrack";
		document.forms[0].submit(); 
	}

</script>
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
<html:form action="Discrepency.do">
<html:hidden property="event"/>
<input type="hidden" id="otd" value="<%=otdDate %>"/>
      <input type="hidden" id="creationDate" value="<%=creationDate %>"/>
       <input type="hidden" id="nextDueDate" value="<%=nextDueDate %>"/>
<%
if(form.getTotalDeferedDays()==null){
	form.setTotalDeferedDays("0");
}
if(form.getOriginalDeferedDays()==null){
	form.setOriginalDeferedDays("0");
}
%>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>
							<%if( discrepencyTrx.getStatus().equals("PENDING_ACTIVATE") ){ %>
								Enable Discrepency
							<%} else if( discrepencyTrx.getStatus().equals("PENDING_DELETE") ){ %>
								Disable Discrepency
							<%} else { %>
								View Discrepency
							<%} %>		
						</h3></td></tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>
								<tr class="even">
                        <td class="fieldname">Discrepency Id</td>
                         <%if(!form.getStatus().equals("PENDING_CREATE")){ %>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="id"/></td>
                        <%}else{ %>
                        <td>-&nbsp;</td>
                        <%} %>
                    </tr>
										 <tr class="odd">
                        <td class="fieldname">Type of Discrepency</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="discrepencyType"/></td>
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
                    <tr class="even">
                        <td class="fieldname">Critical</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="critical"/></td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Discrepency</td>
                        <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=form.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    </tr>
            
					<tr class="even">
                        <td class="fieldname">Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Approved Date</td>
											<%if(discrepencyTrx.getStagingDiscrepency().getAcceptedDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getAcceptedDate() %>" />
								            </td>
								            <%} %>
								            
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<%if(discrepencyTrx.getStagingDiscrepency().getNextDueDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getNextDueDate() %>" />
								            </td><%} %>							

										</tr>
                    <tr class="even">
                        <td class="fieldname">Date Closed&nbsp;</td>
                         <%if(discrepencyTrx.getStagingDiscrepency().getRecDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getRecDate() %>" /></td>
                         <%} %>
                         
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Waived&nbsp;</td>
                        <%if(discrepencyTrx.getStagingDiscrepency().getWaiveDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getWaiveDate() %>" /></td><%} %>
                     
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;</td>
                        <%if(discrepencyTrx.getStagingDiscrepency().getDeferDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getDeferDate() %>" /></td><%} %>
                        
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
											<bean:write property="deferedCounter"  name="DiscrepencyForm" />
								            </td>
											

										</tr>
                      <tr class="even">
                        <td class="fieldname">Document Status&nbsp;</td>
                         <td>
                         <%
                         String status=form.getStatus();
                         System.out.println("******************* status:"+status);
                         if(status.equals("ACTIVE")){
                        	 status="OPEN";
                         }
                         else if(status.equals("PENDING_WAIVE")){
                        	 status="PENDING WAIVE";
                         }else if(status.equals("PENDING_DEFER")){
                        	 status="PENDING DEFER";
                         }else if(status.equals("PENDING_CLOSE")){
                        	 status="PENDING CLOSE";
                         }else if(status.equals("PENDING_UPDATE")){
                        	 status="PENDING UPDATE";
                         }else if(status.equals("PENDING_CREATE")){
                        	 status="PENDING CREATE";
                         }
                         %>
                         <%=status %>
                         </td>
                           <html:hidden property="status" value="<%=status %>"/> 
                    </tr>
                   
 
                  
                    <tr class="even">
                        <td class="fieldname">Credit Approver</td>
                        <td>
                       <%
                      
                       if("PENDING_CREATE".equals(form.getStatus())||"PENDING_UPDATE".equals(form.getStatus())){
											   for(int i=0; i<allCreditApproverList.size();i++){
									            	 
									            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
									            	 if(creditApproval.getValue()!=null){
									            	 if(creditApproval.getValue().trim().equals(form.getApprovedBy())){
									            	%>	 
									            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
									            	<%
									            	 }
									            	
									            	 }
									             }
											
                       }else{
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
                       }
											%>
                        </td>
                    </tr>
                    
                    <tr class="even">
                            <td class="fieldname">Creation Remarks</td>
                            
                             <%
                            if(discrepencyTrx.getStagingDiscrepency().getDiscrepencyRemark()!=null){
                            %>                            
                            <td><textarea readonly="readonly" rows="6" cols="120"><%=discrepencyTrx.getStagingDiscrepency().getDiscrepencyRemark()%></textarea>
                            &nbsp;</td>
                            <%}else{ %>
                            <td ><textarea readonly="readonly" rows="6" cols="120"></textarea></td>
                            <%} %>
                        </tr>
                    
                     <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td>
                            <%
                            if(discrepencyTrx.getStagingDiscrepency().getDocRemarks()!=null){
                            %>  
                            <textarea readonly="readonly" rows="6" cols="120"><%=discrepencyTrx.getStagingDiscrepency().getDocRemarks()%></textarea>
                            <%}else{ %>
                            <textarea readonly="readonly" rows="6" cols="120"></textarea>
                            <%} %>
                            &nbsp;
                            </td>
                           
                           
                        </tr>
										
									</tbody>
							</table>
							
							
						</td>
					</tr>
					
				
					</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr><td width="65">&nbsp;</td>
					<td width="65">&nbsp;</td>
				</tr>
			<tr>

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
			<td colspan="4">
			
				  <a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
							</a>&nbsp;</td>

				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
	</body>
<html:hidden name="DiscrepencyForm" property="id" />
<html:hidden property="customerId" />
</html:form>
						