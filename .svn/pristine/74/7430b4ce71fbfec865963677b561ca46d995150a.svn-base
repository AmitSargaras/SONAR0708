<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>

<%
OBDiscrepency view=(OBDiscrepency)request.getAttribute("discrepencyObj");
    /*DiscrepencyForm form = (DiscrepencyForm) request.getAttribute("DiscrepencyForm");
	
	List selectedList = (List) request.getAttribute("selectedList");
	IDiscrepencyTrxValue discrepencyTrx = (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
	String checkDiscrepency = discrepencyTrx.getActualDiscrepency().getDiscrepencyType();
	//for(int i=0;i<selectedList.size();i++)
		IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
		if(discrepencyTrx.getActualDiscrepency()!=null){
			if(discrepencyTrx.getActualDiscrepency().getFacilityList()!=null){
			 discrepencyFacilityLists=discrepencyTrx.getActualDiscrepency().getFacilityList();
	}
		}*/
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

int startIndexInn = 0;
String ind2 = (String) request.getAttribute("startIndexInn");

if (ind2 != null && (!ind2.equals("")))
	startIndexInn = Integer.parseInt(ind2);
String actionStr1 = "com.integrosys.cms.ui.discrepency.DiscrepencyAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<%
String checkDiscrepency = view.getDiscrepencyType();

IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
if(view.getFacilityList()!=null){
	
 discrepencyFacilityLists=view.getFacilityList();
 System.out.println("discrepencyFacilityLists:::::::"+discrepencyFacilityLists);
}
%>
<%
String searchstatus= (String) request.getAttribute("searchstatus");
//String status1= (String) request.getAttribute("searchstatus");
String discType= (String) request.getAttribute("discType");
if(searchstatus==null){
	searchstatus="Please";
}
if(discType==null){
	discType="Please";
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
<%@page import="org.apache.struts.util.LabelValueBean"%><script language="JavaScript" type="text/javascript">
	
	function cancelForm(){
		document.forms["DiscrepencyForm"].action = "Discrepency.do?event=prepare_create_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType %>&startIndex=<%=startIndex%>&startIndexInn=<%=startIndexInn%>";
	    document.forms["DiscrepencyForm"].submit();
	}
	
</script>
<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>
    <html:hidden property="startIndex" />
<input type="hidden" name="startIndexInn" value="<%=startIndexInn %>" />

<%
   
    
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
	if(aForm.getTotalDeferedDays()==null){
		aForm.setTotalDeferedDays("0");
	}
	if(aForm.getOriginalDeferedDays()==null){
		aForm.setOriginalDeferedDays("0");
	}
	
%>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
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
                    <tr class="even">
                        <td class="fieldname">Type of Discrepancy</td>
                        <td><%=view.getDiscrepencyType() %></td>
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
                     
                    <tr class="odd">
                        <td class="fieldname">Critical</td>
                        <td><%=view.getCritical() %></td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname">Discrepancy</td>
                        <td><integro:common-code-single entryCode="<%=view.getDiscrepency()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" descWithCode="false" /></td>
                    </tr>
            
						<tr class="even">
                        <td class="fieldname">Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=view.getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Accepted Date</td>
											<%if(view.getAcceptedDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=view.getAcceptedDate() %>" /><%} %>
								            </td>
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=view.getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<%if(view.getNextDueDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
											<td class="even" >
											&nbsp;<integro:date object="<%=view.getNextDueDate() %>" /><%} %>
								            </td>
											

										</tr>
                    <tr class="even">
                        <td class="fieldname">Date Closed&nbsp;</td>
                        <%if(view.getRecDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=view.getRecDate() %>" /></td><%} %>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Waived&nbsp;</td>
                        <%if(view.getWaiveDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=view.getWaiveDate() %>" /></td><%} %>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;</td>
                        <%if(view.getDeferDate()==null){ %>
											<td class="even">&nbsp;-</td>
											<%}else{ %>
                         <td>&nbsp;<integro:date object="<%=view.getDeferDate() %>" /></td><%} %>
                    </tr>
                    <tr class="even">
                    <td class="fieldname" >Aging of Creation Date - NextDue Date</td>
											<td class="even" >
											&nbsp;
											<bean:write property="totalDeferedDays"  name="DiscrepencyForm" />&nbsp;days
								            </td>
						
						
										</tr>
										
						<tr class="even">
						<td class="fieldname" >Aging of Original TD-NextDue Date</td>
											<td class="even" >
											&nbsp;
											<bean:write property="originalDeferedDays"  name="DiscrepencyForm" />&nbsp;days
								            </td>
						
						
										</tr>
                    
                    <tr class="odd">
											<td class="fieldname" >Defer Counter</td>
											<td class="even" >
											&nbsp;
											<bean:write property="deferedCounter"  name="DiscrepencyForm" />
								            </td>
											

										</tr>
                      <tr class="even">
                        <td class="fieldname">Document Status&nbsp;</td>
                        <%String status=view.getStatus();
									if(status.equals("PENDING_DEFER")){
										status="PENDING DEFER";
									}else if(status.equals("PENDING_CLOSE")){
										status="PENDING CLOSE";
									}else if(status.equals("PENDING_WAIVE")){
										status="PENDING WAIVE";
									}else if(status.equals("PENDING_CREATE")){
										status="PENDING CREATE";
									}else if(status.equals("PENDING_UPDATE")){
										status="PENDING UPDATE";
									}
								%>
                       <td><%=status %></td>
                            
                    </tr>
                   <tr class="odd">
                        <td class="fieldname">Credit Approver</td>
                        <td class="even"><%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(view.getApprovedBy())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%>&nbsp;
                        </td>
                    </tr>

                </tbody>
            </table>

                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                         <tr class="even">
                            <td class="fieldname">Creation Remarks</td>
                             <%String creationRemark=view.getDiscrepencyRemark();
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
                            <td class="fieldname">Remarks</td>
                            <%if(view.getDocRemarks()!=null){ %>
                            <td><textarea readonly="readonly" rows="6" cols="120" ><%=view.getDocRemarks()%></textarea>
                            </td><%}else{ %>
                            <td><textarea readonly="readonly" rows="6" cols="120" ></textarea>
                            </td>
                            <%} %>
                           
                            
                           
                        </tr>
                     
      
         
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
     <input type="hidden" name="searchstatus" value="<%=searchstatus%>"/>
<input type="hidden" name="discType" value="<%=discType%>"/>
</table>
 
<!-- InstanceEndEditable -->
</html:form>
			
			