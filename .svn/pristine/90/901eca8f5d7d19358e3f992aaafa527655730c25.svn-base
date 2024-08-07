
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%
	DiscrepencyForm form = (DiscrepencyForm) request.getAttribute("DiscrepencyForm");
	IDiscrepencyTrxValue discrepencyTrx = (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
	String checkDiscrepency = discrepencyTrx.getStagingDiscrepency().getDiscrepencyType();
	List selectedList = (List) request.getAttribute("selectedList");
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
%>

<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function cancelPage(){
	
    document.forms[0].action="ToDo.do?event=todo_cancel";
    
    document.forms[0].submit();
}

function submitPage() {
	document.forms[0].action="Discrepency.do?event=maker_confirm_close";
    document.forms[0].submit();
}

//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action="Discrepency.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>
							<%if( discrepencyTrx.getStatus().equals("PENDING_ACTIVATE") ){ %>
								Enable Discrepancy
							<%} else if( discrepencyTrx.getStatus().equals("PENDING_DELETE") ){ %>
								Disable Discrepancy
							<%} else { %>
								View Discrepancy
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
                        <td class="fieldname">Discrepancy Id</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="id"/></td>
                    </tr>
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
                        <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Approved Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getAcceptedDate() %>" />
								            </td>
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getNextDueDate() %>" />
								            </td>
											

										</tr>
                    <tr class="even">
                        <td class="fieldname">Date Closed&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getRecDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Waived&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getWaiveDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getDeferDate() %>" /></td>
                    </tr>
 <tr class="even">
											<td class="fieldname" >Defer Counter</td>
											<td class="even" >
											&nbsp;
											<bean:write property="counter"  name="DiscrepencyForm" />
								            </td>
											

										</tr>
                      <tr class="even">
                        <td class="fieldname">Document Status&nbsp;</td>
                         <td>
                         <%
                         String statusDoc="";
                      //   System.out.println("::::::::form.getStatus()::::::::"+form.getStatus());
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
                         <%} 
                      }
                         %>
                         <%=statusDoc %>
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
										
										<tr>
										<td class="fieldname">Remarks</td>
										<td class="even" colspan="3">
										<bean:write name="DiscrepencyForm" property="discrepencyRemark"/>
										<br/><html:errors property="disrepencyRemarkError"/></td>
									</tr>
										
									</tbody>
							</table>
							
							<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblInfo">
				<tbody>
					<tr>
						<td class="fieldname">Last Action By</td>
						<td class="even"><%=discrepencyTrx.getUserInfo()%>&nbsp;</td>
					</tr>
					<tr class="odd">
						<td class="fieldname">Last Remarks Made</td>
						<td><%=discrepencyTrx.getRemarks() != null ? discrepencyTrx.getRemarks(): ""%>&nbsp;</td>
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
			
				  <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)" onClick="submitPage()" ><img src="img/close1a.gif" name="Image3311"  border="0" id="Image3311" /></a>&nbsp;&nbsp;
          <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a>
						&nbsp;</td>

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


	<!-- InstanceEnd -->
</html>
