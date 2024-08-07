<%@page import="java.util.Date"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                  java.util.Collection,
				 java.util.Iterator,
				 java.util.List,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant" %>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->
<%

Collection subSecurityList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subSecurityList");
request.setAttribute("subSecurityList", subSecurityList);

List systemIdList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.systemIdList");
pageContext.setAttribute("systemIdList",systemIdList);

String BASE_INT_RATE =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.BASE_INT_RATE");

String BPLR_INT_RATE =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.BPLR_INT_RATE");

String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String segment = (String) request.getAttribute("segment");
	String utilizedAmount = (String) request.getAttribute("utilizedAmount");
%>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
   function submitAccount()
   {
 
	if (document.forms[0].indexID.value == '')
	{
	    document.forms[0].event.value = 'create';
        }
        else
	{
	    document.forms[0].event.value = 'submit';	
	} 

	
	document.forms[0].submit();	
   }
   
   function cancelSubmit()
   {
	   var event = document.forms[0].fromEvent.value;
	 
	   if(event == 'process'){
		   var trxId = '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=process"+ "&trxID="+trxId;
		   document.forms[0].submit();
	   }
	   if(event == 'update'){
		   var trxId = '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=track"+ "&trxID="+ trxId;
		    document.forms[0].submit();
	   }
	   if(event == 'view'){
			document.forms[0].event.value = 'cancel';
			document.forms[0].submit();
	   }

	   if(event == 'custread'){
		   var limitId = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=show_lmt_cust_detail&limitId="+limitId;
		   document.forms[0].submit();
	   }

	   if(event == 'prepare_cust_update'){
		   var limitId = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimit.do?event=prepare_cust_update&limitId="+limitId;
		   document.forms[0].submit();
	   }
	   
	   if(event == 'read'){
 		   var limitId = '<%= request.getAttribute("lmtId")%>'; 
		   document.forms[0].action="MILimitList.do?event=show_lmt_detail&limitId="+limitId;
		   document.forms[0].submit();
	   }
	   
	   if(event == 'prepare_close'){
		   var trxId = '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=prepare_close"+ "&trxID="+trxId;
		    document.forms[0].submit();
		}

	   if(event == 'prepare_delete'){
		   var limitId = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=del_limit&limitId="+limitId;
		    document.forms[0].submit();
		}
		
	   if(event == 'track'){
		   var trxId = '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=track"+ "&trxID="+ trxId ;
		    document.forms[0].submit();
	   }
	   
   }

		
		function enableUtilizedAmount()
		{
			var releasedAmount=document.forms[0].releasedAmount.value;
			if(releasedAmount=='')
			{
				document.forms[0].utilizedAmount.disabled=true;
			}
			else
			{
				document.forms[0].utilizedAmount.disabled=false;
			}
		}

		
		function controlRejectReason(event){
			var rejectReason = document.forms[0].coreStpRejectedReason.value;
			if((rejectReason==null || rejectReason.trim() =='') && event == 'REJECTED'){
				document.forms[0].coreStpRejectedReason.value = 'Offline Rejection';
			}
		}


 </script>
 <html:form action="MIAcntDetail">
  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  <html:hidden property="customerID"/>
  
  <input type="hidden" name="inrValue"/>
  <input type="hidden" name="facilityType" value="<%=request.getParameter("facilityType") %>">
 <input type="hidden" name="facCat" value="<%=request.getParameter("facCat") %>"/>
 
 <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
  <%System.out.println("+++++++memoExposer+++++"+request.getAttribute("memoExposer")); %>
   <bean:define id="formObj" name="XRefDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.XRefDetailForm"/>
   
  <input type="hidden" name="createdBy"	value="<%=formObj.getCreatedBy()%>" />
 
  <input type="hidden" name="createdOn"	value="<%=(formObj.getCreatedOn()==null)?"":formObj.getCreatedOn()%>" />
  
   <input type="hidden" name="hiddenSerialNo"	value="<%=(formObj.getHiddenSerialNo()==null)?"":formObj.getHiddenSerialNo()%>" />
    <input type="hidden" name="edited"	value="<%=(formObj.getEdited()==null)?"":formObj.getEdited()%>" />
  
  <input type="hidden" name="updatedBy"	value="<%= formObj.getUpdatedBy()%>" />
  <input type="hidden" name="updatedOn"	value="<%=(formObj.getUpdatedOn()==null)?"":formObj.getUpdatedOn()%>" />
  
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td><h3>Released Line Details </h3></td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
   </thead>
   <tbody>
    <tr> 
     <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
       <thead>
       </thead> 
       <tbody>
								<tr class="even">
									<%-- <td width="20%" class="fieldname">Serial No.  <%=formObj.getUpdatedBy() %>  <font color="#FF0000">*</font> </td> --%>
									<td width="20%" class="fieldname">System ID <font
										color="#FF0000">*</font>
									</td>
									<td width="30%"><bean:write name="XRefDetailForm" property="facilitySystemID"/>
									</td>

									<td width="20%" class="fieldname">System</td>
									<td width="30%"><bean:write name="XRefDetailForm" property="facilitySystem"/>
										</td>
								</tr>
								<tr class="even">
									<td width="20%" class="fieldname">Line No.</td>
									<td width="30%"><bean:write name="XRefDetailForm" property="lineNo"/></td>

									<td width="20%" class="fieldname">Serial No.<font
										color="#FF0000">*</font>
									</td>
									<html:hidden name="XRefDetailForm" property="serialNo" />
										<% if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && ICMSConstant.FCUBS_STATUS_PENDING_SUCCESS.equals(formObj.getStatus()) ){ %>
                							  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                  						 <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && "N".equals(formObj.getSendToFile()) ){ %>
							                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
								        <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction())) {%>
							                  <td width="30%"></td>
							          	<%}else{ %>
							                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
							             <%} %>
								</tr>

								<tr class="odd">
									<td width="20%" class="fieldname">Currency</td>
									<td width="30%">
										<bean:write name="XRefDetailForm" property="currency"/>
									</td>
									<td width="20%" class="fieldname">Tenure <font
										color="#FF0000">*</font></td>
									<td width="30%"><bean:write name="XRefDetailForm" property="tenure"/></td>
								</tr>

								<tr class="even">
									<td class="fieldname">Released Amount <font
										color="#FF0000">*</font>
									</td>
									<td><bean:write name="XRefDetailForm" property="releasedAmount"/></td>
									<td class="fieldname">CAM Date<font
										color="#FF0000">*</font></td>
									<td><bean:write name="XRefDetailForm" property="releaseDate" /></td>
								</tr>

								<tr class="even">
									<td class="fieldname">Utilized Amount</td>
									<td><bean:write name="XRefDetailForm" property="utilizedAmount" /></td>									
									<td class="fieldname">CAM Expiry Date<font
										color="#FF0000">*</font></td>
									<td><bean:write name="XRefDetailForm" property="dateOfReset" />
									</td>
								</tr>

								<tr class="odd">
									<td class="fieldname">Liability ID
									</td>
									<td><bean:write name="XRefDetailForm" property="liabilityId"/>
								<%-- 	<td class="fieldname">Segment<font color="#FF0000">*</font></td>
									<td><bean:write name="XRefDetailForm" property="segment" /></td> --%>
									<td class="fieldname">Sell Down Period<font
										color="#FF0000">*</font></td>
									<td><bean:write name="XRefDetailForm" property="sellDownPeriod" /></td>
								</tr>
							
								<tr class="odd">

									<td class="fieldname">Limit Remarks</td>
									<td style='word-wrap: break-word; max-width: 50px'><bean:write name="XRefDetailForm" property="limitRemarks" /></td>
									<td class="fieldname">Send To File</td>
									<td>
										<%
											if ("N".equals(formObj.getSendToFile())) {
										%> <input type="checkbox"
										id="sendToFile" disabled="true" /> <%
 	} else {	
 %> <input
										type="checkbox" id="sendToFile" checked="checked"
										disabled="true" /> <%
 	}
 %>
									</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">Core STP Rejected Reason</td>
									<td colspan="3"><bean:write name="XRefDetailForm" property="coreStpRejectedReason" /></td>
								</tr>
								<tr class="even">
									<td class="fieldname">Status<font color="#FF0000">*</font></td>
									<td><bean:write name="XRefDetailForm" property="status"/></td>	
								 <%if("ET".equals(formObj.getFacilitySystem())){%>
								<td class="fieldname">Banking Arrangement</td>
								<td>                  	
									<html:select property="bankingArrangement" disabled = "true" style="width:250px">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
									</html:select>
									<html:hidden property="bankingArrangement" />
								</td>
								<%}else{%>
									<td class="fieldname">&nbsp;</td><td>&nbsp;</td>
								<%}%>									
								</tr>
							
								<tr class="odd">
								
							    <td class="fieldname"><bean:message key="label.lineRelease.adhocLine"/></td>
				                      <td>
				                       <% if("Y".equals(formObj.getAdhocLine())){%>
				  					    Yes
				  					   <%}else if ("N".equals(formObj.getAdhocLine())){ %>
				  					    No 
				  					  <%}%>
				  					
				  					  <html:hidden property="adhocLine"/>
				  			   </td>
							   
							   	<td class="fieldname"></td>
								<td></td>	
								 
								</tr>	
								<script language="javascript">
									
								</script>
	             
           
       </tbody>
      </table>
     </td>
    </tr>
    <tr>
     <td>
      &nbsp;
     </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  
    
   </tbody>
  </table>
     <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
     <tr> 
     <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
  <tr class="odd">
                  <td class="fieldname">Created/Edited By</td>
                  <td>
	               <bean:write name="XRefDetailForm" property="createdBy"/>
                  </td>
                  <td class="fieldname">Approved By</td>
                  <td>  
                       <bean:write name="XRefDetailForm" property="updatedBy"/>
                    </td>
                  </tr>
      <tr class="odd">
                  <td class="fieldname">Created/Edited On</td>
                  <td>
               			<bean:write name="XRefDetailForm" property="createdOn"/>
                </td>
                  <td class="fieldname">Approved On</td>
                  <td>   

                <bean:write name="XRefDetailForm" property="updatedOn"/>
</td>
                  </tr>
              </table>
               </td>
                  </tr></table>
  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>
 </html:form>
</body>