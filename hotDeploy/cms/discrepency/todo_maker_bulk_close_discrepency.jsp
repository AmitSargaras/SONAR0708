<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>

<%
HashMap selectedArrayMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.selectedArrayMap");
if(selectedArrayMap ==null){
	selectedArrayMap =new HashMap();
}

int sessionDiscrepancies=0;
String sessionValues="";
boolean  mapValue=false;
if(selectedArrayMap.size()>0){
	mapValue=true;
	sessionDiscrepancies=selectedArrayMap.size();
	Set set=selectedArrayMap.keySet();
	Iterator itr =set.iterator();
	while(itr.hasNext()){
		sessionValues=sessionValues+(String)itr.next()+"-";
	}
}
String maxDiscrepanciesString= PropertyManager.getValue("discrepancy.maxSubmit.value");
int maxDiscrepancies=0;
if(maxDiscrepanciesString!=null && !maxDiscrepanciesString.trim().equals("")){
	maxDiscrepancies=Integer.parseInt(maxDiscrepanciesString);
}
System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$maxDiscrepancies$$$$$$$$$$$$$$$$$$$$$$$: "+maxDiscrepancies);
int startIndex = 0;
String ind = (String) request.getAttribute("startIndex");
if (ind != null && (!ind.equals("")))
	startIndex = Integer.parseInt(ind);
String event=(String)request.getAttribute("event");
String loginId=(String)request.getAttribute("loginId");
String transactionDate=(String)request.getAttribute("transactionDate");
String searchstatus=(String)request.getAttribute("searchstatus");
String discType=(String)request.getAttribute("discType");
if(searchstatus==null){
	searchstatus="Please";
}
if(discType==null){
	discType="Please";
}
 ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
 String customerID=String.valueOf(customer.getCustomerID());
HashMap resultMap=new HashMap();
if("checker_search_discrepency".equals(event)||"maker_search_session_list_discrepency_close".equals(event)){
	resultMap= (HashMap)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.session.search");
}
else if(!searchstatus.equals("Please")||!discType.equals("Please")){
	if("maker_close_next_bulk_discrepancy".equals(event)||"maker_close_search_discrepency".equals(event)){
	resultMap= (HashMap)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.session.search");
	}
}
else{
 resultMap= (HashMap)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.session.searchResult");
}
String submitEvent = "checker_approve_discrepency";

String rejectEvent = "checker_reject_discrepency";

int listSize = 0;

ArrayList resultList = (ArrayList)resultMap.get("list");
HashMap infoMap=(HashMap)resultMap.get("map");
HashMap trxValueMap=(HashMap)resultMap.get("trxValueMap");
HashMap remarkMap=(HashMap)resultMap.get("remarks_map");
//startInd = searchResult.getStartIndex();
listSize = resultList.size();
pageContext.setAttribute("discrepencySize", Integer
		.toString(listSize));
pageContext.setAttribute("discrepencyList", resultList);


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
<script language="JavaScript" type="text/javascript">
	function submitPage(){

		var currentDiscrepancies='0'; 
		var sessionDiscrepancies =<%=sessionDiscrepancies%>;
		var sessionValues='<%=sessionValues%>';
		var maxDiscrepancies=<%=maxDiscrepancies%>;
			//alert("sessionDiscrepancies"+sessionDiscrepancies);
			//alert("maxDiscrepancies"+maxDiscrepancies);
			
			for (var i=0; i < document.forms[0].selected.length; i++)
			{
			if (document.forms[0].selected[i].checked)
			{
				if(sessionValues.search(document.forms[0].selected[i].value)==-1){
					currentDiscrepancies++;
					}
			}
			
			}
		var totalDiscrepancies = Math.abs(currentDiscrepancies + sessionDiscrepancies);
		//alert("totalDiscrepancies "+totalDiscrepancies );
		//alert(Math.abs(totalDiscrepancies)>Math.abs(maxDiscrepancies) );
		if(!(Math.abs(totalDiscrepancies)>Math.abs(maxDiscrepancies))){
		var mapValue=<%=mapValue%>;
		var s_value="" ;
    	var n_value="" ;
    	
    		for (var i=0; i < document.forms[0].selected.length; i++)
    		   {
    		   if (document.forms[0].selected[i].checked)
    		      {
    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
    		      }
 		      else{
    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
    		      }
    		      
    		   }
  	 
     	if(s_value!=""){

     		document.forms[0].action		=	"Discrepency.do?selectId="+s_value+"&unCheckId="+n_value;
    		document.forms[0].event.value	=	"maker_confirm_close";
    		document.forms[0].submit(); 
  	  }else{
    		
    		if(mapValue){
    			document.forms[0].action		="Discrepency.do?selectId="+s_value+"&unCheckId="+n_value;
      		document.forms[0].event.value	=	"maker_confirm_close";
      		document.forms[0].submit(); 
    		}else{
    			alert("Please Select Atleast One Discrepancy");
    		}
    	  } } else{
				
				alert("Maximum "+Math.abs(maxDiscrepancies)+" Discrepancies can be submitted at a time.");
		}    
		
	}
	
	function rejectCreate(){
			var c_value = "";
    	

		
    	for (var i=0; i < document.forms[0].selected.length; i++)
    	  {
    		 
    	  if (document.forms[0].selected[i].checked)
    	    {
    		 
    	     c_value = c_value + document.forms[0].selected[i].value + "-";
    	     }
    	  }
  	 
     	if(c_value!=""){

     		document.forms[0].action		=	"Discrepency.do?selectId="+c_value;
		document.forms[0].event.value	=	"checker_bulk_reject_discrepency";
		document.forms[0].submit(); 
     	}else{
  			alert("Please Select Atleast One Discrepancy");
  	  	  }      
	}
	function goBack(){
		document.forms[0].action="ToDo.do?event=todo_cancel";
	    document.forms[0].submit();
	}

	function searchDiscrepency(){

		var discStatus = document.getElementById("status").value;
		var discType=document.getElementById("type").value;		
		var s_value="" ;
    	var n_value="" ;
    	if(document.forms[0].selected!=undefined){
    		for (var i=0; i < document.forms[0].selected.length; i++)
    		   {
    		   if (document.forms[0].selected[i].checked)
    		      {
    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
    		      }
 		      else{
    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
    		      }
    		      
    		   }
    	}
			document.forms[0].action      	= "Discrepency.do?searchstatus="+discStatus+"&"+"discType="+discType+"&checkId="+s_value+"&unCheckId="+n_value;
	     	document.forms[0].event.value 	= "maker_search_session_list_discrepency_close";
	     	document.forms[0].submit();
			
		
	}
	 function goPageIndex(targetOffset) {
	    	//alert("targetOffset"+targetOffset);
	    	var s_value="" ;
	    	var n_value="" ;
	    	
	    		for (var i=0; i < document.forms[0].selected.length; i++)
	    		   {
	    		   if (document.forms[0].selected[i].checked)
	    		      {
	    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
	    		      }
	 		      else{
	    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
	    		      }
	    		      
	    		   }
	    	

	    	 //alert("s_value "+s_value);
	    	 //alert("n_value "+n_value);
	    	// alert("targetOffset "+targetOffset);
	    	
	    	document.forms[0].startIndex.value = targetOffset;
	    	document.forms[0].selectedArray.value=s_value;
	    	document.forms[0].unCheckArray.value=n_value;
	    	document.forms[0].event.value = "maker_close_next_bulk_discrepancy";
	    	document.forms[0].action="Discrepency.do?event=maker_close_next_bulk_discrepancy&searchstatus=<%=searchstatus%>&discType=<%=discType%>&checkId="+s_value+"&unCheckId="+n_value+"&startIndex="+targetOffset;
	        document.forms[0].submit();
	    }

	 function goView(viewId) {
	    	//alert("viewId"+viewId);
	    	var s_value="" ;
	    	var n_value="" ;
	    	
	    		for (var i=0; i < document.forms[0].selected.length; i++)
	    		   {
	    		   if (document.forms[0].selected[i].checked)
	    		      {
	    		    	  s_value = s_value + document.forms[0].selected[i].value + "-";
	    		      }
	 		      else{
	    		    	  n_value =n_value + document.forms[0].selected[i].value + "-";
	    		      }
	    		      
	    		   }
	    	

	    	 //alert("s_value "+s_value);
	    	 //alert("n_value "+n_value);
	    	
	    	//document.forms[0].startIndexInn.value = targetOffset;
	    	//document.forms[0].selectedArray.value=s_value;
	    	//document.forms[0].unCheckArray.value=n_value;
	    	//document.forms[0].event.value = "maker_next_create_temp_list_discrepency";
	    	document.forms[0].action="Discrepency.do?event=maker_close_view_discrepancy&TrxId="+viewId+"&searchstatus=<%=searchstatus%>&discType=<%=discType%>&checkId="+s_value+"&unCheckId="+n_value+"&startIndex=<%=startIndex%>";
	        document.forms[0].submit();
	 }

	  function checkedAll(){ 
	    	var a =0;
	    	if(document.getElementById("list11").checked){
	    	for(var s=0;s<document.getElementsByName("selected").length;s++){
	    	   document.getElementsByName("selected")[s].checked=true;
	    	}
	    	}else{
	    		for(var s=0;s<document.getElementsByName("selected").length;s++){
	    		   document.getElementsByName("selected")[s].checked=false;
	    		}
	    	}
	    }
	 
</script>

<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>
     <html:hidden property="startIndex" />
    <input type="hidden" name="customerID" value="<%=customerID%>"/>
<input type="hidden" name="transactionDate" value="<%=transactionDate%>"/>
<input type="hidden" name="loginId" value="<%=loginId%>"/>


<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3>Close Discrepancy   </h3></td>
        </tr>
        
        <tr>
            <td><hr/></td>
        </tr>
        <tr>
			<td width="25%"><label>Discrepancy Status</label>
			<select id="status">
			<%if(searchstatus.equals("Please")){ %>
			<option value="Please" selected="selected">Please Select</option>
			<%}else{ %>
			<option value="Please">Please Select</option>
			<%}if(searchstatus.equals("PENDING_CREATE")){%>
			<option value="PENDING_CREATE" selected="selected">Pending Create</option>
			<%}else{ %>
			<option value="PENDING_CREATE">Pending Create</option>
			<%}if(searchstatus.equals("PENDING_UPDATE")){ %>
			<option value="PENDING_UPDATE" selected="selected">Pending Update</option>
			<%}else{ %>
			<option value="PENDING_UPDATE">Pending Update</option>
			<%}if(searchstatus.equals("PENDING_DEFER")){  %>
			<option value="PENDING_DEFER" selected="selected">Pending Defer</option>
			<%}else{ %>
			<option value="PENDING_DEFER">Pending Defer</option>
			<%}if(searchstatus.equals("PENDING_CLOSE")){  %>
			<option value="PENDING_CLOSE" selected="selected">Pending Close</option>
			<%}else{ %>
			<option value="PENDING_CLOSE">Pending Close</option>
			<%}if(searchstatus.equals("PENDING_WAIVE")){  %>
			<option value="PENDING_WAIVE" selected="selected">Pending Waive</option>
			<%}else{ %>
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
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                   <tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td width="4%">S/N</td>
								<td width="15%">Discrepancy Id</td>
							<td width="15%">Discrepancy</td>
							<td width="16%">Creation Remarks</td>
							<td width="16%">Checker Remarks</td>
							<td width="8%">Creation Date</td>
							<td width="8%">Original Due Date</td>
							
							<td width="8%">Next Due Date</td>
							<td width="11%">Status</td>
							<td width="5%">Action</td>
							<td width="5%">Select All
							<%	if (listSize>0) { %>
										<center>	<input type="checkbox" name="list11" id="list11" value="Check All" onClick="checkedAll()" /></center> 
																		<%} %>
							</td>
						</tr>
					</thead>
					<tbody>
					<%
					int indexId=0;
					int counter = 0;
					//int startIndex=0;
					%>
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
											indexId++;
							%>
							<tr class="<%=rowClass%>">
								<td class="index" width="4%"><%=counter + startIndex%></td>
							
								<%
									long i = OB.getId();
								String disId="-";
								IDiscrepencyTrxValue discrepencyTrxValue=(IDiscrepencyTrxValue) trxValueMap.get(infoMap.get(String.valueOf(OB.getId())));
							if(discrepencyTrxValue.getActualDiscrepency()!=null){
								disId=String.valueOf(discrepencyTrxValue.getActualDiscrepency().getId());
							}
								%>
								<td><%=disId %> &nbsp;</td>		
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
								<td>-</td><%} %>
								 <%if(remarkMap!=null){
                                    String remark=(String)remarkMap.get(String.valueOf(OB.getId()));
                                    if(remark!=null){
                                    	if(remark.length()>47){%>
                                    		<td><%=remark.substring(0,47) %>...</td>
                                    <%	}else if(remark.length()<=47){%>
                                    <td><%=remark %></td>
                                    <%}
                                    }else{%>
                                    <td>&nbsp;-</td>
                                    <%}}else{%>
                                    <td>&nbsp;-</td>
                                    <%} %>
								<td><integro:date object="<%=OB.getCreationDate()%>"/></td>
								<td><integro:date object="<%=OB.getOriginalTargetDate()%>"/></td>							
								<%if(OB.getNextDueDate()==null){ %>
								<td>&nbsp;-</td>
								<%}else{ %>
								<td><integro:date object="<%=OB.getNextDueDate()%>"/></td>
								<%} %>
								
								<%String status=OB.getStatus();
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
								<td>
								<center><%=status%></center>
								</td>
								<td>
								<%String viewId=(String)infoMap.get(String.valueOf(OB.getId()));%>
								<center><a
								href="javascript:goView('<%=viewId %>')">View</a>
							</center>
								 </td>
								<td>
								<center>
								<% 	if(selectedArrayMap.containsKey(infoMap.get(String.valueOf(OB.getId())))){ %>
								<input type="checkbox" id="selected" name="selected" value="<%=infoMap.get(String.valueOf(OB.getId()))%>" checked="checked" />
								<%}else{ %>
								<input type="checkbox" id="selected" name="selected" value="<%=infoMap.get(String.valueOf(OB.getId()))%>" />
								<%} %>
								<input type="hidden" name="selected" id="selected">
								</center>
								</td>
							</tr>
						</logic:iterate>
						</logic:greaterThan>
						<%if(listSize==0){ %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                <%} %>
					</tbody>
				</table>
				</td>
			</tr>
			<html:hidden property="selectedArray" />
			<html:hidden property="unCheckArray" />
			<%if(listSize>10){ %>
			<tr>
				<%String url="Discrepency.do?event=maker_close_next_bulk_discrepancy&searchstatus="+searchstatus+"&discType="+discType+"&startIndex=" ;%>
				<td height="10">
				<table id="generalPurposeBar" width="100%" border="0"
					cellspacing="0" cellpadding="5" align="center">
					<tr>
						<td valign="middle"><integro:pageindex
							pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
							url='<%=url %>' submitFlag="true"/></td>
					</tr>
				</table>
				</td>
			</tr>
			<%} %>

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


    <td> <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)" onClick="submitPage()" ><img src="img/close1a.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
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
<!-- InstanceEnd -->
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%></html>
