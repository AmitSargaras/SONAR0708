<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>

<%
DiscrepencyForm form = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
IDiscrepencyTrxValue discrepencyTrxValue= (IDiscrepencyTrxValue)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}
String submitEvent = "checker_approve_discrepency";

String rejectEvent = "checker_reject_discrepency";

List selectedList = (List) request.getAttribute("selectedList");
String checkDiscrepency = discrepencyTrxValue.getStagingDiscrepency().getDiscrepencyType();
String append = "";

IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
if(discrepencyTrxValue.getStagingDiscrepency()!=null){
	if(discrepencyTrxValue.getStagingDiscrepency().getFacilityList()!=null){
	 discrepencyFacilityLists=discrepencyTrxValue.getStagingDiscrepency().getFacilityList();
}
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
	function approveCreate(){
		document.forms[0].action		=	"Discrepency.do";
		document.forms[0].event.value	=	"checker_approve_discrepency";
		document.forms[0].submit(); 
	}
	
	function rejectCreate(){
		document.forms[0].action		=	"Discrepency.do";
		document.forms[0].event.value	=	"checker_reject_discrepency";
		document.forms[0].submit(); 
	}
	function goBack(){
		document.forms[0].action="ToDo.do?event=prepare";
	    document.forms[0].submit();
	}

</script>

<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>


<%
   
    
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
	

	
	
	
%>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
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
                    <tr class="odd">
                        <td class="fieldname">Type of Discrepancy</td>
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
                        <td class="fieldname">Discrepancy</td>
                        <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=form.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    </tr>
            
					<tr class="even">
                        <td class="fieldname">Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Approved Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getAcceptedDate() %>" />
								            </td>
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getNextDueDate() %>" />
								            </td>
											

										</tr>
                    <tr class="even">
                        <td class="fieldname">Date Closed&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getRecDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Waived&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getWaiveDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getDeferDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Document Status&nbsp;</td>
                         <td>
                         <%
                         String statusDoc="";
                         if(form.getStatus()!=null){
                         if(form.getStatus().equals("PENDING_CLOSE")){
                        	 statusDoc="CLOSED";
                         %>
                         
                         
                        	 <html:hidden property="status" value="CLOSE"/>
                      <%   }else if(form.getStatus().equals("PENDING_WAIVE")){
                        	 statusDoc="WAIVED";
                         %>
                        
                         
                    	 <html:hidden property="status" value="WAIVED"/>
                  <%   }else if(form.getStatus().equals("PENDING_DEFER")){
                        	 statusDoc="DEFERED";
                         %>
                       
                         
                    	 <html:hidden property="status" value="DEFERED"/>
                  <%   }else{
                         %>
                          <html:hidden property="status"/>  
                         <%} %>
                         <%=statusDoc %>
                         <%} %>
                         &nbsp;</td>
                            
                    </tr>
                   <tr class="odd">
                        <td class="fieldname">Approved By</td>
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
                        </td>
                    </tr>
 
                  
                    <tr class="odd">
                        <td class="fieldname">Credit Approver</td>
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
                    </tr>

                </tbody>
            </table>

                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td><integro:empty-if-null value="<%=discrepencyTrxValue.getStagingDiscrepency().getDiscrepencyRemark()%>"/>&nbsp;</td>
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
                <tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></br><html:errors property="discrepencyRemarksError"/></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=discrepencyTrxValue.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=discrepencyTrxValue.getRemarks() != null
						? discrepencyTrxValue.getRemarks()
						: ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
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


					 <td><a href="javascript:approveCreate();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectCreate();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:goBack();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>

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
</body>
<!-- InstanceEnd --></html>
