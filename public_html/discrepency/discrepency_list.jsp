
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.discrepency.DiscrepencyAction,com.integrosys.cms.ui.discrepency.DiscrepencyForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.cms.app.discrepency.bus.OBDiscrepency,com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.Collection,java.util.List,
			com.integrosys.cms.app.customer.bus.OBCMSCustomer,
			com.integrosys.base.techinfra.logger.DefaultLogger,
			com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%
	int startIndex = 0;
	String ind = (String) request.getAttribute("startIndex");
	
	if (ind != null && (!ind.equals("")))
		startIndex = Integer.parseInt(ind);
	
	String id = (String)request.getAttribute("legalCustomerId");
	String event=(String)request.getAttribute("checkerEvent");
	String searchstatus=(String)request.getAttribute("searchstatus");
	String discType=(String)request.getAttribute("discType");
	if(searchstatus==null){
		searchstatus="Please";
	}
	if(discType==null){
		discType="Please";
	}
	
%>

<%
	SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.discrepencyList");

	HashMap stgActualMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.stgActualMap");
	int counter = 0;
	int noofItems = 0;
	int index = 0;
	int sno = 0;
	int startInd = 0;

	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	if (searchResult != null) {
		resultList = searchResult.getResultList();
		
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("discrepencySize", Integer
				.toString(listSize));
		pageContext.setAttribute("discrepencyList", resultList);
	}
	 String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);

	   

	    boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
	    		||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
	    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
	    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
	    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
	    	    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
	    
	    boolean isUserBranchMaker = ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID)
	    		||ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID);
	    
	    //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
	    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	    boolean isActive=true;
	    if(null!=customer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(customer.getStatus())){
	    isActive=false;
	    	}
	    
	    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
	  //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
%>



<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="java.util.Collections"%>

<%@page import="java.util.HashMap"%><script language="JavaScript" type="text/JavaScript">
    function MM_jumpMenu(targ,selObj,restore){ //v3.0
  	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  	  if (restore) selObj.selectedIndex=0;
  	 
  	}
    
    function addDiscrepency(){        
    	document.forms["DiscrepencyForm"].action = "Discrepency.do?event=prepare_create_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType %>&startIndex=<%=startIndex%>";
        document.forms["DiscrepencyForm"].submit();
	}
   
    function removeDiscrepency(id,name)
 	{    
     	var ans = window.confirm("Are You Sure to Delete the Discrepency " + name);
     	if( ans == true )
        {
	 	 	document.forms[0].action      	= "Discrepency.do?discrepencyId="+id;
	     	document.forms[0].event.value 	= "prepare_remove_discrepency";
	     	document.forms[0].submit();
     	}
 	}

	function searchDiscrepency(){

		var discStatus = document.getElementById("status").value;
		var discType=document.getElementById("type").value;		
		
			document.forms[0].action      	= "Discrepency.do?searchstatus="+discStatus+"&"+"discType="+discType;
	     	document.forms[0].event.value 	= "search_discrepency";
	     	document.forms[0].submit();
			
		
	}

 	
</script>

<html:form action="Discrepency.do">
<html:hidden property="startIndex" />
<html:hidden property="numItems" />
<html:hidden property="customerId" />
<html:hidden property="event" />
<table width="100%" height="100%" border="0" align="center"
	cellpadding="0" cellspacing="0" class="tblFormSection"
	id="contentWindow">
	<tr height="95%">
		<td valign="top">		
		<table width="96%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tr>
				<td width="70%">
				<h3>Discrepancy List</h3>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr />
				</td>
			</tr>

			<tr>
			<td width="25%"><label>Discrepancy Status</label>
			<select id="status" >
			<%if(searchstatus.equals("Please")){ %>
			<option value="Please" selected="selected">Please Select</option>
			<%}else{ %>
			<option value="Please">Please Select</option>
			<%}if(searchstatus.equals("ACTIVE")){ %>
			<option value="ACTIVE" selected="selected">Open</option>
			<%}else{ %>
				<option value="ACTIVE" >Open</option>
			<%}if(searchstatus.equals("DEFERED")){ %>
			<option value="DEFERED" selected="selected">Defer</option>
			<%}else{ %>
			<option value="DEFERED" >Defer</option>
			<%}if(searchstatus.equals("CLOSED")){ %>
			<option value="CLOSED" selected="selected">Close</option>
			<%}else{ %>
			<option value="CLOSED" >Close</option>
			<%}if(searchstatus.equals("WAIVED")){%>
			<option value="WAIVED" selected="selected">Waive</option>
			<%}else{ %>
			<option value="WAIVED">Waive</option>
			<%}if(searchstatus.equals("PENDING_UPDATE")){ %>
			<option value="PENDING_UPDATE" selected="selected">Pending Update</option>
			<%}else{ %>
			<option value="PENDING_UPDATE">Pending Update</option>
			<%}if(searchstatus.equals("PENDING_DEFER")){ %>
			<option value="PENDING_DEFER" selected="selected">Pending Defer</option>
			<%}else{ %>
			<option value="PENDING_DEFER">Pending Defer</option>
			<%}if(searchstatus.equals("PENDING_CLOSE")){ %>
			<option value="PENDING_CLOSE" selected="selected">Pending Close</option>
			<%}else{ %>
			<option value="PENDING_CLOSE">Pending Close</option>
			<%}if(searchstatus.equals("PENDING_WAIVE")){ %>
			<option value="PENDING_WAIVE" selected="selected">Pending Waive</option>
			<%}else {%>
			<option value="PENDING_WAIVE">Pending Waive</option>
			<%} %>
			</select>&nbsp;&nbsp;			
			<lable>Discrepancy Type</lable>
			<select id="type">
			<%if(discType.equals("Please")){ %>
			<option value="Please" selected="selected">Please Select</option>
			<%}else{ %>
			<option value="Please">Please Select</option>
			<%}if(discType.equals("General")){ %>
			<option value="General" selected="selected">General</option>
			<%}else{ %>
			<option value="General">General</option>
			<%}if(discType.equals("Facility")){ %>
			<option value="Facility" selected="selected">Facility</option>
			<%}else{ %>
			<option value="Facility">Facility</option>
			<%} %>
			</select>			
			
                            <a onclick="searchDiscrepency()" href="#">
                                <img align="middle" src="img/search1a.gif" name="Image1" border="0" id="Image1"/></a>
                        
			</td>
			
				<td valign="bottom" align="right"> &nbsp;
				<%
									if(isUserCpcMaker && isActive){
									%>
				<input type="button"
					name="add" value="Add" class="btnNormal"
					onclick="javascript:addDiscrepency()" />
					<%
					
					}%>
					</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td width="4%">S/N</td>
							<td width="15%">Discrepancy Id</td>
							<td width="15%">Discrepancy</td>
							<td width="23%">Creation Remarks</td>
							<td width="12%">Creation Date</td>
							<td width="12%">Original Due Date</td>							
							<td width="12%">Next Due Date</td>
							<td width="12%">Status</td>
							<td width="10%">Action</td>
						</tr>
					</thead>
					<tbody>
						<logic:greaterThan name="discrepencySize" value="0">
						<logic:iterate id="OB" name="discrepencyList"
							type="com.integrosys.cms.app.discrepency.bus.OBDiscrepency"
							scope="page" length="10" 
							offset="<%=String.valueOf(startIndex) %>">
							<%
								String rowClass = "";
											counter++;
											if (counter % 2 != 0)
												rowClass = "odd";
											else
												rowClass = "even";
							%>
							<tr class="<%=rowClass%>">
								<td class="index" width="4%"><%=counter + startIndex%></td>
															
								<%
									String i = (String) stgActualMap.get(String.valueOf(OB.getId()));
								%>
								
								
								<td><%=i %> &nbsp;</td>
								<td>								
								<integro:common-code-single entryCode="<%=OB.getDiscrepency()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" descWithCode="false" /></td>
                                  	<%	
								if(OB.getDiscrepencyRemark()!=null){
								if(OB.getDiscrepencyRemark().length()>47){%>
									
									<td><%=OB.getDiscrepencyRemark().substring(0,47) %>...</td>
									<%}else if(OB.getDiscrepencyRemark().length()<=47){ %>
								<td><%=OB.getDiscrepencyRemark() %></td>
								<%}}else{%>
								<td>&nbsp;-</td><%} %>
								<td><integro:date object="<%=OB.getCreationDate()%>"/></td>
								<td><integro:date object="<%=OB.getOriginalTargetDate()%>"/></td>
								<%if(OB.getNextDueDate()==null){ %>
								<td>&nbsp;-</td>
								<%}else{ %>
								<td><integro:date object="<%=OB.getNextDueDate()%>"/></td>								
								<%}
								System.out.println("OB.getTransactionStatus():"+OB.getTransactionStatus());
								
								System.out.println("OB.getStatus():"+OB.getStatus());
								
								
								if(OB.getTransactionStatus().equalsIgnoreCase("ACTIVE")) {
								String status="";
								if(OB.getStatus().equals("ACTIVE")){
									status="OPEN";
								}else{
									status=OB.getStatus();
								}%>
								<td> 
								<center><%=status%></center>
								</td>
								<%}else if(!OB.getTransactionStatus().equalsIgnoreCase("ACTIVE")){ 
								String transactionStatus=OB.getTransactionStatus();
								
								if(transactionStatus.equals("PENDING_DEFER")){
									transactionStatus="PENDING DEFER";
								}else if(transactionStatus.equals("PENDING_CLOSE")){
									transactionStatus="PENDING CLOSE";
								}else if(transactionStatus.equals("PENDING_WAIVE")){
									transactionStatus="PENDING WAIVE";
								}else if(transactionStatus.equals("PENDING_UPDATE")){
									transactionStatus="PENDING UPDATE";
								}%>
								<td> 
								<center><%=transactionStatus%></center>
								</td>
								<%}	%>
								<td><select name="chooseAction"
									onchange="MM_jumpMenu('self',this,0)">
									<option value="#" selected="selected">Please Select</option>
									<%
									if(isUserCpcMaker && isActive){										
										if(OB.getStatus()!=null && OB.getTransactionStatus()!=null){
										if(OB.getStatus().equalsIgnoreCase("CLOSED")||OB.getTransactionStatus().equalsIgnoreCase("PENDING_DEFER")
												||OB.getTransactionStatus().equalsIgnoreCase("PENDING_WAIVE")||OB.getTransactionStatus().equalsIgnoreCase("PENDING_CLOSE")
												||OB.getStatus().equalsIgnoreCase("WAIVED")
												||OB.getTransactionStatus().equalsIgnoreCase("PENDING_UPDATE")){
									%>
									<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
									<%}else{ %>
									<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
										
									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">Update</option>
										
									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency_waive&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">Waive</option>

									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency_defer&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>"">Defer</option>
									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency_close&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>"">Close</option>
									<%}}else{%>
										<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
									<%}
									}
									else if(isUserBranchMaker && isActive){										
										if(OB.getStatus()!=null && OB.getTransactionStatus()!=null){
										if(OB.getStatus().equalsIgnoreCase("CLOSED")||OB.getTransactionStatus().equalsIgnoreCase("PENDING_DEFER")
												||OB.getTransactionStatus().equalsIgnoreCase("PENDING_WAIVE")||OB.getTransactionStatus().equalsIgnoreCase("PENDING_CLOSE")
												||OB.getStatus().equalsIgnoreCase("WAIVED")
												||OB.getTransactionStatus().equalsIgnoreCase("PENDING_UPDATE")){
									%>
									<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
									<%}else{ %>
									<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
										
									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">Update</option>
										
									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency_waive&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">Waive</option>

									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency_defer&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>"">Defer</option>
									<option
										value="Discrepency.do?event=prepare_maker_edit_discrepency_close&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>"">Close</option>
									<%}}else{%>
										<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
									<%}
									}
									
									else{ %>
									<option
										value="Discrepency.do?event=view_discrepency&discrepencyId=<%=i%>&startIndex=<%=startIndex%>&searchstatus=<%=searchstatus%>&discType=<%=discType %>">View</option>
									
									<%} %>
								</select></td>
							</tr>
						</logic:iterate>
						</logic:greaterThan>
						<%if(listSize==0){ %>
                                <tr class="odd">
                                	<td colspan="9">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                <%} %>
					</tbody>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
			<!-- General Purpose Bar -->
			<%
				if (searchResult != null && searchResult.getNItems() != 0) {
			%>
			<%String url="Discrepency.do?event=next_list_discrepency&searchstatus="+searchstatus+"&discType="+discType+"&startIndex=" ;%>
		<%if(listSize>10){ %>
			<tr>
				<td height="10">
				<table id="generalPurposeBar" width="100%" border="0"
					cellspacing="0" cellpadding="5" align="center">
					<tr>
						<td valign="middle"><integro:pageindex
							pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
							url='<%=url %>'/></td>
					</tr>
				</table>
				</td>
			</tr>
			<%
		}}
			%>
<input type="hidden" name="searchstatus" value="<%=searchstatus%>"/>
<input type="hidden" name="discType" value="<%=discType%>"/>
</table>
</html:form>