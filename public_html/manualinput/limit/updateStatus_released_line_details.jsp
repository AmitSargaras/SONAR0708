<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant,
                 java.util.*"%>
<%@page import="com.integrosys.cms.app.limit.trx.ILimitTrxValue"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitSysXRef"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICustomerSysXRef"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="org.apache.struts.util.LabelValueBean"%><html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

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
   <script type="text/javascript" src="js/jquery.min.js"></script> 
  
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>
<%
String event = request.getParameter("event");

 List fccBranchList= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.fccBranchList");

 pageContext.setAttribute("fccBranchList",fccBranchList);
 
 List branchAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.branchAllowedList1");
 System.out.println("branchAllowedList1:"+branchAllowedList1);
pageContext.setAttribute("branchAllowedList1",branchAllowedList1);
List productAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.productAllowedList1");
pageContext.setAttribute("productAllowedList1",productAllowedList1);
List currencyAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyAllowedList1");
pageContext.setAttribute("currencyAllowedList1",currencyAllowedList1);

String internalRemarks =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.internalRemarks");
String revolvingLine =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.revolvingLine");
String linecurrency =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.linecurrency");
String currencyRestriction =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyRestriction");
String intradayLimit =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.intradayLimit");

String scfStatus=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scfStatus");

String scfErrMsg=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scfErrMsg");

String scfFlag=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scfFlag");

String responseDate=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.responseDate");
String requestDate=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.requestDate");
String radioInterfaceCompleted=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.radioInterfaceCompleted");

System.out.println("internalRemarks:"+internalRemarks+" currencyRestriction:"+currencyRestriction);
System.out.println("revolvingLine:"+revolvingLine+" linecurrency:"+linecurrency+" intradayLimit:"+intradayLimit);

List udfLbValList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList1");
pageContext.setAttribute("udfLbValList1",udfLbValList1);

List udfLbValList1_2= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList1_2");
pageContext.setAttribute("udfLbValList1_2",udfLbValList1_2);
//System.out.println("send To File:"+frm.getSendToFile()+" close flag:"+frm.getCloseFlag());
//System.out.println("frm limit start date:"+formObj.getLimitStartDate()+" "+formObj.getDateOfReset());

//System.out.println("formObj.getCurrencyRestriction():"+formObj.getCurrencyRestriction()+" close Flag:"+formObj.getCloseFlag()+" liab branch:"+formObj.getLiabBranch());

Collection subSecurityList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subSecurityList");

Map subSecurityMap = (Map) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subSecurityMap");
Map fccBranchMap = (Map) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.fccBranchMap");
Map mainLineCodeMap = (Map) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.mainLineCodeMap");
//System.out.println("subSecurityMap:"+subSecurityMap+"fccBranchMap:"+fccBranchMap);


request.setAttribute("subSecurityList", subSecurityList);

List systemIdList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.systemIdList");
pageContext.setAttribute("systemIdList",systemIdList);

Map systemIdMap=new HashMap();
for(int m=0;m <systemIdList.size();m++){
		LabelValueBean lb = (LabelValueBean)systemIdList.get(m);
		systemIdMap.put(lb.getLabel(), lb.getLabel());
}
	
List mainLineCodeList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.mainLineCodeList");
pageContext.setAttribute("mainLineCodeList",mainLineCodeList); 

XRefDetailForm form = (XRefDetailForm) request.getAttribute("XRefDetailForm");
pageContext.setAttribute("XRefDetailForm", form);

List facCoBorrowerList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerList");
pageContext.setAttribute("facCoBorrowerList",facCoBorrowerList);


List restCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerList");
 
String lineCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerIds");


if (!(restCoBorrowerList == null)) {
	//	System.out.println("restCoBorrowerList size="+restCoBorrowerList.size());
		pageContext.setAttribute("restCoBorrowerList", restCoBorrowerList);
	}else {
		restCoBorrowerList = new ArrayList();
	pageContext.setAttribute("restCoBorrowerList", new ArrayList());
	}

   
int vno = 0;

String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);
 %>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">

 function submitAccount()
 {

 document.forms[0].event.value = 'updateStatus_ubs';
 document.forms[0].submit();
 	  	
 }
 
 function cancelSubmit()
 {
	document.forms[0].event.value = 'cancel';
	document.forms[0].submit();
 }
	
   function refreshHostSystem(dropdown)
   {
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
        }	
        var dep = 'hostSystemName';
        var url = '/cms/MIAcntDetail.do?event=refresh_hostsyscountry&hostSystemCountry='+curSel;
        sendLoadDropdownReq(dep, url);
   }	



   function JumpOnSelect(selectObj)
   {
     		var selectIndex = selectObj.selectedIndex;
   		
   		//Process Customer
   		if (selectObj.options[selectIndex].value == 1)
   		window.location.href('../customer/CustDetails(mode=view,cpcMaker).htm');
   		
   		//View Limits
   		else if (selectObj.options[selectIndex].value == 2)
   		window.location.href('searchLimit(SACmaker,result).htm');
   		
   		/*View Sec Coverage
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Collateral/ViewSecurityCoverageContainer.htm');*/
   		
   		//View Securities
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Deal/Dealframe(GMRA,MRmaker).htm');
   		
   		//View Valuation
   		else if(selectObj.options[selectIndex].value == 4)
   		parent.window.location.href('../Valuation/Valuationframe(MRmaker).htm');
   		
   		//Maintain Security Checklist
   		else if(selectObj.options[selectIndex].value == 5)
   		window.location.href('#');
   		
   		//Update C/C Doc Receipt
   		else if(selectObj.options[selectIndex].value == 6)
   		parent.window.location.href('../Documentation/UpCCDocReceiptContainer(cpcdocmaker).htm');
   		else if(selectObj.options[selectIndex].value == 9)
   		window.location.href('../Collateral/ViewLimitsContainer(SACmaker).htm');
   		
   }
   function shwhd(selfObj){
   	if(selfObj.value == 'fixed'){
   		document.getElementById('fixed').style.display = ''; 
   		document.getElementById('margin').style.display = 'none';
   	}else if (selfObj.value == 'floating'){
   		document.getElementById('fixed').style.display = 'none';
   		document.getElementById('margin').style.display = '';
   	}
   	
   }

   function disableCoreStpReject(){
	   var stat=document.getElementById('status').value;
	  // alert("stat:"+stat);
	   if(stat=='PENDING_SUCCESS'){ 
		   document.getElementById('coreStpRejectedReason').value='';
		   document.getElementById('coreStpRejectedReason').disabled=true;
		   if(document.forms[0].lineAction.value=='NEW'){
			   if((document.getElementById("serialNo").value).length>2){
			   document.getElementById("serialNo").value='';
			   }
			   document.getElementById("serialNo").readOnly=false;
		   }
	   }else if (stat=='PENDING_REJECTED'){
		   document.getElementById('coreStpRejectedReason').value='Offline Rejection';
		   document.getElementById('coreStpRejectedReason').disabled=false;

		   if(document.forms[0].lineAction.value=='NEW'){
			   document.getElementById("serialNo").value='';
			  document.getElementById("serialNo").readOnly=true;
		   }
	   }else if (stat=='PENDING'){
		   document.getElementById('coreStpRejectedReason').value=''; 
		   document.getElementById('coreStpRejectedReason').disabled=true; 

		   if(document.forms[0].lineAction.value=='NEW'){
			   document.getElementById("serialNo").value='';
			  document.getElementById("serialNo").readOnly=true; 
		   }
	   }  

   }

   window.onload = function(){

	   disableCoreStpReject();

	//   alert("serial No:"+document.getElementById("serialNo").value+" indexId:"+document.forms[0].indexID.value+" status:"+document.getElementById("status").value
	//		   +" action:"+document.forms[0].lineAction.value);
		//	alert("length:"+(document.getElementById("serialNo").value).length);
			
		}
   
   
   function	 checkboxDayLightLimitApproved(){
		 if(document.forms[0].dayLightLimitApproved[0].checked){
		 document.forms[0].intradayLimitExpiryDate.value = document.forms[0].dateOfReset.value;
		 //document.forms[0].dayLightLimitApproved.value = "Yes";
		 document.getElementById('dayLightLimitApproved').value = "Yes";
	 }else{
		 document.getElementById('dayLightLimitApproved').value = "No";
		 document.forms[0].intradayLimitExpiryDate.value = "";
		// alert(document.forms[0].dayLightLimitApproved.value);
	 }
	 }
   
		

   
   function viewConvenantScreen(name)
   {
   	document.forms[0].action="MIAcntDetail.do?event="+name;
       document.forms[0].submit();
   }
      
 </script>
<html:hidden name="XRefDetailForm" property="lineCoBorrowerLiabIds" styleId="lineCoBorrowerIds" value="<%=form.getLineCoBorrowerLiabIds()%>"/>
<html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
<input type="hidden" name="fromEventForLineCov" value="<%=request.getAttribute("fromEventForLineCov") %>"/>

  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="createdBy"/>
  <html:hidden property="createdOn"/>
  <html:hidden property="updatedBy"/>
  <html:hidden property="updatedOn"/>

<input type="hidden" name="facilityType" value="<%=request.getParameter("facilityType") %>">
  <html:hidden property="edited"/>
  
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  <html:hidden property="customerID"/>
  <input type="hidden" name="limitId" value="<%=request.getParameter("lmtId") %>"/>
  <input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
    <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />

   <bean:define id="formObj" name="XRefDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.XRefDetailForm"/>
   
     
    <input type="hidden" name="hiddenSerialNo"	value="<%=(formObj.getHiddenSerialNo()==null)?"":formObj.getHiddenSerialNo()%>" />
   <html:hidden property="lineAction" styleId="lineAction"/>
   <html:hidden property="sourceRefNo"/> 
   
    <jsp:include page="udf_hidden_limit.jsp"></jsp:include>	
    
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td><h3>Released Line Details</h3></td>
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
                  
                  <td width="20%" class="fieldname">System ID <font color="#FF0000">*</font> </td>
                  <td width="30%"><integro:empty-if-null value="<%=systemIdMap.get(formObj.getFacilitySystemID())%>"/></td>
                  
                  <td width="20%" class="fieldname">System</td>
                  <td width="30%"><html:text property="facilitySystem" readonly="true"/></td>
                  
           </tr>
          <tr class="even">
           			<td width="20%" class="fieldname">Liab Branch<font color="#FF0000">*</font> </td>
                  	<td width="30%"> <integro:empty-if-null value="<%=fccBranchMap.get(formObj.getLiabBranch())%>"/></td>
          			<td class="fieldname"><p>Currency Restriction</p></td>
                   	<td width="30%">
                   	<%  if(null!=form.getCurrencyRestriction() && form.getCurrencyRestriction().equalsIgnoreCase("Y")){%> 
                   	<input type="checkbox" id="currencyRestriction" checked="checked" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="currencyRestriction"  disabled="true" />
                   	<%} %>
                   	</td>
          </tr>
           <tr class="even">
          
          		<td width="20%" class="fieldname">Line No.</td>
                  <td width="30%"><html:text property="lineNo" readonly="true"/></td>  
		 		  
                   <td width="20%" class="fieldname">Serial No.<font color="#FF0000">*</font> </td>
                   <% if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && ICMSConstant.FCUBS_STATUS_PENDING_SUCCESS.equals(formObj.getStatus())) {%>
                    <td width="30%"><html:text property="serialNo" maxlength="2" styleId="serialNo"/>
                   <% }else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction())) {%>
                    <td width="30%"><html:text property="serialNo" maxlength="2" value="" styleId="serialNo"/>
                   <%}else{ %>
                  <td width="30%"><html:text property="serialNo" maxlength="2" styleId="serialNo" readonly="true"/>
                  <%} %>
                 <html:errors property="serialNo"/> 
                   <html:errors property="accountNo"/></td>	 
          </tr>
            <tr class="even">
		 		  <td width="20%" class="fieldname">Main Line Code</td>
                  <td width="30%"><%System.out.println("mainLineCode:"+formObj.getMainLineCode()+" liabBranch:"+formObj.getLiabBranch()); if(null==formObj.getMainLineCode() || "".equals(formObj.getMainLineCode()) ){%>
                  <integro:empty-if-null value="<%=formObj.getMainLineCode()%>"/>
                  <%}else{ %>
                  <integro:empty-if-null value="<%=mainLineCodeMap.get(formObj.getMainLineCode())%>"/><%} %>
                   </td>
                    
                  <td width="20%" class="fieldname">Currency</td>
                  <%if(null!=linecurrency) {%>
		 		  <td><%=linecurrency%></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                  
          </tr>
          
          <tr class="even">
          
           		  <td class="fieldname">Released&nbsp; Amount <font color="#FF0000">*</font> </td>
                  <td><html:text property="releasedAmount" maxlength="23" styleId="releasedAmount" readonly="true"/></td>
          
          		  <td class="fieldname">Utilized Amount </td>
                  <td><html:text property="utilizedAmount" maxlength="23" styleId="utilizedAmount"  readonly="true"/></td>	
                   
          </tr>
            <tr class="even">
                  <td class="fieldname">Released date</td>
                   <td><html:text property="releaseDate" style="width:90px" readonly="true" size="15" maxlength="10" />
                  <td class="fieldname">Send To File</td>
                 <td> <%if("N".equals(formObj.getSendToFile())){%>
                   	<input type="checkbox" id="sendToFile" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="sendToFile" checked="checked" disabled="true" />
                   	<%} %></td>
            </tr>
                
            <tr class="even">
		 		 <td width="20%" class="fieldname">Limit Start Date<font color="#FF0000">*</font> </td>
		 		  <td><html:text property="limitStartDate" style="width:90px" readonly="true" size="15" maxlength="10" /></td>
		 		 <td width="20%" class="fieldname">Limit Expiry Date<font color="#FF0000">*</font> </td>
		 		  <td><html:text property="dateOfReset" style="width:90px" readonly="true" size="15" maxlength="10" /></td> 
          </tr>
          
          <tr class="even">
                  <td class="fieldname">Day Light Limit Expiry Date</td>
                   <td><html:text property="intradayLimitExpiryDate" style="width:90px" readonly="true" size="15" maxlength="10" /></td>
                  <td class="fieldname">Day Light Limit </td>
                  <td><html:text property="dayLightLimit" maxlength="23" styleId="dayLightLimit" readonly="true"/></td>
            </tr>
            
            <tr class="even">
          			<td class="fieldname">Available<font color="#FF0000">*</font> </td>
		 		 <td>   <% if(null==formObj.getAvailable() || "Yes".equals(formObj.getAvailable())){%> 
                  		Yes
                 
  					  <%}else{ %>
  					   No 
  					  <%} %><html:hidden property="available"/></td>
                  <td class="fieldname">Freeze<font color="#FF0000">*</font></td>
          		  <td><% if(null==formObj.getFreeze() || "No".equals(formObj.getFreeze())){%> 
                  		No 
  					  <%}else{ %>
  					    Yes
                   
  					  <%} %><html:hidden property="freeze"/></td>
                 </td>	
          </tr>
          
          <%if("UBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem())){%>
          <tr class="even">
		 		 <td width="20%" class="fieldname">IDL Effective From Date</td>
		 		  <td><html:text property="idlEffectiveFromDate" style="width:90px" readonly="true" size="15" maxlength="10" /></td>
		 		 <td width="20%" class="fieldname">IDL Expiry Date</td>
		 		  <td><html:text property="idlExpiryDate" style="width:90px" readonly="true" size="15" maxlength="10" /></td> 
          </tr>
          
           <tr class="even">
           		  <td class="fieldname">IDL Amount</td>
                  <td><html:text property="idlAmount" maxlength="23" styleId="idlAmount" readonly="true"/></td>
          
          		  <td class="fieldname"></td>
                  <td></td>	
          </tr>
          
          <%} %>
          
          <tr class="even">
          
          		  <td class="fieldname">Revolving Line<font color="#FF0000">*</font> </td>
          		  <td><% if(null==formObj.getRevolvingLine() || "Yes".equals(formObj.getRevolvingLine())){%> 
                 			Yes
                   
  					  <%}else{ %>
  					      No 
  					  <%} %><html:hidden property="revolvingLine"/></td>
          		<%--   <%if(null!=revolvingLine) {%>
		 		  <td><%=revolvingLine%></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %> --%>
		 		  
		 		   <td class="fieldname">SCM Flag<font color="#FF0000">*</font> </td>
          		  <td><% if("Yes".equals(formObj.getScmFlag())){%> 
                 			Yes
                   
  					  <%}else{ %>
  					      No 
  					  <%} %><html:hidden property="scmFlag"/></td>
                  
          </tr>
          
          <tr class="even">
				<td class="fieldname">SCF Interface Status</td>
				<td><html:text property="scfStatus" disabled="true" value="<%=scfStatus%>"></html:text>&nbsp;<br></td>
				<td class="fieldname">SCF Interface Failed Reason</td>
				<%if(scfErrMsg.isEmpty()) {%>
					<td><html:text property="scfFailedReason" size="30"
								disabled="true" value="<%=scfErrMsg%>"></html:text><br/></td>
				<%}else{ %>
					<td><html:textarea property="scfFailedReason" rows="4"
								cols="50" disabled="true" value="<%=scfErrMsg%>"></html:textarea><br/></td>
				<%}%>
		  </tr>
			
						<tr class="even">

				<td class="fieldname">ECBF Interface Completed</td>

				<td>
					<%
						if (radioInterfaceCompleted.equalsIgnoreCase("Checked")) {
					%> 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" checked="checked" value="Yes">Yes 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" value="No">No 
					<% 	} else { %> 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" value="Yes">Yes
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" checked="checked" value="No">No 
					<% } %>
				</td>

				<td class="fieldname">Last Updated by ECBF Date</td>
					<%
						if (radioInterfaceCompleted.equalsIgnoreCase("Checked")) {
							if (responseDate != null) {
					%>
							<td><html:text property="responserequestDate" disabled="true" value="<%=responseDate%>"></html:text><br></td>
							<%
								} else {
							%>
							<td><html:text property="responserequestDate" disabled="true" value="<%=requestDate%>"></html:text><br></td>
							<%
								}
							%>
					<%
						} else {
					%>
							<td><html:text property="responserequestDate" disabled="true" value=""></html:text><br></td>
					<% } %>
			</tr>
          
          <tr class="even">
          
          		  <td class="fieldname">Last Available Date</td>
          		   <td><html:text property="lastavailableDate" style="width:90px" readonly="true" size="15" maxlength="10" /></td>
                 <td class="fieldname">Upload Date </td>
		 		  <td><html:text property="uploadDate" style="width:90px" readonly="true" size="15" maxlength="10" /></td>
          </tr>
          
           <tr class="even">
          
          		  <td class="fieldname">Segment1<font color="#FF0000">*</font></td>
          		  <td><p>
               		<integro:common-code-single  entryCode="<%=formObj.getSegment()%>"
	                                    categoryCode="<%=CategoryCodeConstant.SEGMENT_1 %>" display="true" descWithCode="false" />               
					</p><html:hidden property="segment"/></td>
		 		 <td class="fieldname">Rule ID<font color="#FF0000">*</font> </td>
		 		   <td><p>
		 		   <integro:common-code-single  entryCode="<%=formObj.getRuleId()%>" categoryCode="<%=CategoryCodeConstant.NPA_RULE_ID %>" display="true" descWithCode="false" />   
					</p><html:hidden property="ruleId"/></td>
          </tr>
          
              
          <tr class="even">
          
          		 <td class="fieldname">Capital market  exposure <font color="#FF0000">*</font></td>
          		 <% System.out.println("formObj.getIsCapitalMarketExposer():"+formObj.getIsCapitalMarketExposer()); %>
                  <td>
  					   <% if("Yes".equals(formObj.getIsCapitalMarketExposer())){%>
  					    Yes
  					   <%}else if ("No".equals(formObj.getIsCapitalMarketExposer())){ %>
  					    No 
  					  <%}%>
  					  
  					  <html:hidden property="isCapitalMarketExposer"/>
  				 </td>	
                   
                 <td class="fieldname">PSL FLG <%if(request.getParameter("facilityType").equalsIgnoreCase("Funded")) { %> <font color="#FF0000">*</font>  <%} %> </td>
                 <%System.out.println("PSL Flag:"+formObj.getIsPrioritySector()+" :"+formObj.getPrioritySector()); %>
                  <td>
                  <%if("No".equals(formObj.getIsPrioritySector())){ %>
                  <integro:common-code-single  entryCode="<%=formObj.getPrioritySector()%>" categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" display="true" descWithCode="false" />  
                 <!--  <html:select property="prioritySector" styleId="prioritySector_no" >
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" descWithCode="false" />   
					</html:select> -->
					<%}else{ %>
					 <integro:common-code-single  entryCode="<%=formObj.getPrioritySector()%>" categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" display="true" descWithCode="false" />  
				<!--<html:select property="prioritySector" styleId="prioritySector_yes">
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" descWithCode="false" />   
					</html:select> -->
					<%} %> <html:hidden property="prioritySector"/>
					<html:hidden property="isPrioritySector"/>
				</td>
                   
          </tr>
           
           
    <tr class="even">
                  <td class="fieldname">Real Estate Exposure <font color="#FF0000">*</font> </td>
                  <td>
  					   <% if("Yes".equals(formObj.getIsRealEstateExposer())){%>
  					    Yes
  					   <%}else if ("No".equals(formObj.getIsRealEstateExposer())){ %>
  					    No 
  					  <%}%>
  					  
  					  <html:hidden property="isRealEstateExposer"/>
  				  </td>
                  <td class="fieldname">UNCONDI CANCL COMMITMENT<font color="#FF0000">*</font></td>
                 	<td>	  <integro:common-code-single  entryCode="<%=formObj.getUncondiCancl()%>" categoryCode="<%=CategoryCodeConstant.UNCONDI_CANCL_COMMITMENT %>" display="true" descWithCode="false"/>   
                 <html:hidden property="uncondiCancl" /></td>
                </tr>
                
                
		 	 <td class="fieldname">Interest rate <font color="#FF0000">*</font></td>
             <td>
             <%System.out.println("formObj.getInterestRateType():"+formObj.getInterestRateType() +"formObj comm:"+formObj.getEstateType());if(formObj.getInterestRateType().equalsIgnoreCase("fixed")){ %>
             		fixed rate: &nbsp; <integro:empty-if-null value="<%=formObj.getIntRateFix() %>" /> 
             <%}else if(formObj.getInterestRateType().equalsIgnoreCase("floating")){ %>
              <% if(formObj.getIntRateFloatingMarginFlag().equals("-")){%>
                  floating rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(formObj.getIntRateFloatingRange()) - Double.parseDouble(formObj.getIntRateFloatingMargin())) %>"/>
                   <%}else { %>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(formObj.getIntRateFloatingMargin()) + Double.parseDouble(formObj.getIntRateFloatingRange()))%>"/>
                  <%} %>
             <%} %>
             </td>
        	 <td class="fieldname">Commercial Real estate/ Residential real Estate  / Indirect real estate</td>
              <td>
              <%if("Commercial Real estate".equals(formObj.getEstateType())){ %>
             <integro:empty-if-null value="<%=formObj.getEstateType()%>"/>
        			<html:select property="commRealEstateType" disabled = "true" style="width:250px">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>" descWithCode="false" />
					</html:select>
					<html:hidden property="commRealEstateType" /> 
              <%}else if("Residential real Estate".equals(formObj.getEstateType())){ %>
               <integro:empty-if-null value="<%=formObj.getEstateType()%>"/>
              <%} else if("Indirect real estate".equals(formObj.getEstateType())){ %>
               <integro:empty-if-null value="<%=formObj.getEstateType()%>"/>
              <%} %><html:hidden  property="estateType" />
              </td> 		
           </tr> 
           <tr class="even">
                 <%if("UBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem()) || "FCUBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem())) %>
                 <%System.out.println("intradayLimit.............."+intradayLimit); %>
                 <% if("Yes".equalsIgnoreCase(intradayLimit)){%> 
                  <td class="fieldname">Day Light Limit Available  </td>
                   <%System.out.println("formObj.getIsDayLightLimitAvailable().............."+formObj.getIsDayLightLimitAvailable()); %>
                   <% if(null==formObj.getIsDayLightLimitAvailable() || "No".equals(formObj.getIsDayLightLimitAvailable())){%> 
                  <td><input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable"  value="Yes" disabled="true"  /> Yes
  					  <input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable" value="No" disabled="true" checked="checked" /> No  
  				  </td>
  				  <html:hidden property="isDayLightLimitAvailable" />
  				  <%}else{ %>
  				  <td><input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable"  value="Yes" disabled="true" checked="checked" /> Yes
  					  <input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable" value="No" disabled="true" /> No  
  				  </td>
  				  <html:hidden property="isDayLightLimitAvailable" />
  				  <%} %>
  				  <%}else{%>
  				  <td class="fieldname">Day Light Limit Available  </td>
  				  <td><input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable"  value="Yes" disabled="true"/> Yes
  					  <input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable" value="No"  disabled="true"/> No  
  				  </td>
  				   <html:hidden property="isDayLightLimitAvailable" />
  				  <%} %>
  				   <td class="fieldname">Day Light Limit Approved</td>
  				    <%System.out.println("formObj.getDayLightLimitApproved().............."+formObj.getDayLightLimitApproved()); %>
  				     <% if(null!=formObj.getDayLightLimitApproved() && (formObj.getDayLightLimitApproved().equalsIgnoreCase("Yes") || formObj.getDayLightLimitApproved().equalsIgnoreCase("on"))){%> 
                 	<td>	 <input type="checkbox" name="dayLightLimitApproved" property="dayLightLimitApproved" disabled="true"  checked="true" onclick="javascript:checkboxDayLightLimitApproved()"></input>
                 	</td>
					 <html:hidden property="dayLightLimitApproved" styleId="dayLightLimitApproved"/>
					<% }else {%> 
					<td><input type="checkbox"  name="dayLightLimitApproved" property="dayLightLimitApproved" disabled="true" onclick="javascript:checkboxDayLightLimitApproved()"></input></td>
								<html:hidden property="dayLightLimitApproved" styleId="dayLightLimitApproved"/>
								<%} %>
                </tr>
                	
           
           
           
 	  <tr class="odd">
          
		  			<td class="fieldname">Limit (Tenor Days)</td>
		  			<td width="30%"><html:text property="limitTenorDays"  maxlength="14"  readonly="true"/>
		  			</td>
                    <td class="fieldname">Closed Flag<font color="#FF0000">*</font></td>
          		  	<td width="30%">
                   	<%if(null!=formObj.getCloseFlag() && "Y".equals(formObj.getCloseFlag())){%>
                   	<input type="checkbox" id="closeFlag" checked="checked" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="closeFlag"  disabled="true" />
                   	<%} %>
                   	<html:hidden property="closeFlag"/></td>
	</tr>
	<tr class="even">
		  			 <%if("UBS-LIMITS".equals(formObj.getFacilitySystem())){%>
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
                   <tr class="even">
		  			<td class="fieldname">Vendor Details</td>
		  			 <%if(null!=formObj.getVendorDtls()){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="vendorDtls" />
                	<html:hidden property="vendorDtls"/></td></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
		   <td class="fieldname"><bean:message key="label.lineRelease.adhocLine"/></td>
                  <td>
  					   <% if("Y".equals(formObj.getAdhocLine())){%>
  					    Yes
  					   <%}else if ("N".equals(formObj.getAdhocLine())){ %>
  					    No 
  					  <%}%>
  					  
  					  <html:hidden property="adhocLine"/>
  				 </td>	
                </tr>  
            <tr class="even">
            <td class="fieldname">Limit Restriction/Customer Restriction</td>
             <td colspan="3"><html:textarea rows="2" cols="150" property="limitRestriction"  styleId="limitRestriction"  readonly="true"/>
             </td>
            </tr>
            
           
        
            
           <tr id="addCoBorrowerDetails">
            <td class="fieldname" >Co-borrower Details </td>

							<td colspan="6">
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="restCoBorrowerListError"/></tr>
									<tr>
										<td> Sr No</td>
										<td> Co-Borrower Liab Id </td>
										<td> Co-Borrower Name </td>
									
									</tr>
								</thead>
								 <tbody>
								
								 
									<logic:present name="restCoBorrowerList">
										<logic:iterate id="ob" name="restCoBorrowerList"
											type="com.integrosys.cms.app.customer.bus.OBLimitXRefCoBorrower"
											 scope="page">
											<%
												String rowClass = "";
														vno++;
														rowClass = "even";
														
											%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerId()%>&nbsp;</center>
												</td>
												<td>
													<center><%=ob.getCoBorrowerName()%>&nbsp;</center>
												<%-- <html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/> --%>
												</td>
											</tr> 
										
										</logic:iterate>
									</logic:present>
										<%if(restCoBorrowerList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody> 
							</table>
							</td>
						</tr>
         <tr class="even">
         
            <tr class="even">
             <td class="fieldname" width="20%">Branch Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="aliasBranchCodes" >
						               <html:options collection="branchAllowedList1" property="value" labelProperty="label" />
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
             <tr class="even">
             <td class="fieldname" width="20%">Product Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="productCodes">
						               <html:options collection="productAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
             <tr class="even">
             <td class="fieldname" width="20%">Currency Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="currencyCodes" >
						               <html:options collection="currencyAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
                         <tr class="even">
             <td class="fieldname" width="20%">UDF Allowed</td><%System.out.println("udf allowed "+formObj.getUdfAllowed()); %>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="udfList" >
						               <html:options collection="udfLbValList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
                    <html:hidden property="udfAllowed"/>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr>
              <tr class="even">
             <td class="fieldname" width="20%">UDF Allowed -2 </td><%System.out.println("udf allowed-2:: "+formObj.getUdfAllowed_2()); %>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="udfList_2" >
						               <html:options collection="udfLbValList1_2" property="value" labelProperty="label"/>
						        
                    </html:select></td>
                    <html:hidden property="udfAllowed_2"/>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr>
                <tr class="even">
                  <td class="fieldname">Security 1</td>
                  <td><%if(null==formObj.getSecurity1() || "".equals(formObj.getSecurity1())) {%>
                  <integro:empty-if-null value="<%=formObj.getSecurity1()%>"/>
                  <%}else{ %>
                    <integro:empty-if-null value="<%=subSecurityMap.get(formObj.getSecurity1())%>"/>
                 <%} %>
                  </td>
                  <td class="fieldname">Security 2</td>
                  <td><%if(null==formObj.getSecurity2() || "".equals(formObj.getSecurity2())) {%>
                  <integro:empty-if-null value="<%=formObj.getSecurity2()%>"/>
                  <%}else{ %><p>
                    <integro:empty-if-null value="<%=subSecurityMap.get(formObj.getSecurity2())%>"/><%} %>
                  </p></td>
                </tr>
               <tr class="odd">
                  <td class="fieldname">Security 3</td>
                  <td><%if(null==formObj.getSecurity3() || "".equals(formObj.getSecurity3())) {%>
                  <integro:empty-if-null value="<%=formObj.getSecurity3()%>"/>
                  <%}else{ %>
                 <integro:empty-if-null value="<%=subSecurityMap.get(formObj.getSecurity3())%>"/><%} %>
                  </td>
                  <td class="fieldname">Security 4</td>
                  <td><%if(null==formObj.getSecurity4() || "".equals(formObj.getSecurity4())) {%>
                  <integro:empty-if-null value="<%=formObj.getSecurity4()%>"/>
                  <%}else{ %><p>
                   <integro:empty-if-null value="<%=subSecurityMap.get(formObj.getSecurity4())%>"/><%} %>
                  </p></td>
                  </tr>
                  <tr class="odd">
                  <td class="fieldname">Security 5</td>
                  <td><%if(null==formObj.getSecurity5() || "".equals(formObj.getSecurity5())) {%>
                  <integro:empty-if-null value="<%=formObj.getSecurity5()%>"/>
                  <%}else{ %>
                  <integro:empty-if-null value="<%=subSecurityMap.get(formObj.getSecurity5())%>"/><%} %>
                  </td>
                  <td class="fieldname">Security 6</td>
                  <td><%if(null==formObj.getSecurity6() || "".equals(formObj.getSecurity6())) {%>
                  <integro:empty-if-null value="<%=formObj.getSecurity6()%>"/>
                  <%}else{ %><p>
                    <integro:empty-if-null value="<%=subSecurityMap.get(formObj.getSecurity6())%>"/><%} %>
                  </p></td>
                  </tr>

<html:hidden  property="facilitySystemID" /> 
<html:hidden  property="liabBranch" />  
<html:hidden  property="mainLineCode" /> 

<html:hidden property="security1" />
<html:hidden  property="security2" />
<html:hidden  property="security3" />
<html:hidden  property="security4" />
<html:hidden  property="security5" />
<html:hidden  property="security6" />
<html:hidden  property="interestRateType" /> 

<html:hidden  property="intRateFix" />
<html:hidden  property="intRateFloatingType" />
<html:hidden  property="intRateFloatingRange" />
<html:hidden  property="intRateFloatingMarginFlag" />
<html:hidden  property="intRateFloatingMargin" />                
                  
                  <tr class="odd">
                  <td class="fieldname">Internal Remarks</td>
                  <td colspan="3">
                 <!-- 	<html:text property="internalRemarks" maxlength="250" /> -->
                 	<html:textarea  rows="2" cols="150" property="internalRemarks"  styleId="internalRemarks" readonly="true" />
                 	 
                  </td>
                  
                  </tr>
                  
                <tr class="even">
                  <td class="fieldname">Core STP Rejected Reason</td>
                   <td colspan="3"><html:textarea property="coreStpRejectedReason" styleId="coreStpRejectedReason" rows="2" cols="125"/><html:errors property="coreStpRejectedReason" />  </td> 	
                 </tr>
                 
                <tr class="odd">
                 <td class="fieldname">Status <font color="#FF0000">*</font></td>
                   <td colspan="3"><html:select  property="status" styleId="status" onchange="javascript:disableCoreStpReject()">
                   <html:option value="PENDING">Please Select</html:option>
                   <html:option value="PENDING_SUCCESS">SUCCESS</html:option>
                   <html:option value="PENDING_REJECTED">REJECTED</html:option>
                   </html:select><html:errors property="status" />  </td> 	
                 </tr>
                  
                
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
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
 <thead>
        <tr>
            <td><h3>CAM Covenant:</h3></td>
        </tr>
    </thead>
    <tbody>
    <tr>
            <td>
                <input class="btnNormal" type="button" name="btnedit_view" id="btnedit_view" value="View" onclick="javascript : viewConvenantScreen('view_covenant_detail_line')">				
            </td>
        </tr>
    </tbody>
</table>
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
            
            <integro:empty-if-null value="<%=formObj.getCreatedBy()%>"/>
                  </td>
                  <td class="fieldname">Approved By</td>
                     <td>
              
                 <integro:empty-if-null value="<%=formObj.getUpdatedBy()%>"/>
                  </td>
                  </tr>
      <tr class="odd">
                  <td class="fieldname">Created/Edited On</td>
                  <td>
             
             <integro:empty-if-null value="<%=formObj.getCreatedOn()%>"/>
                  </td>
                  <td class="fieldname">Approved On</td>
                  <td> 
                   
                       <integro:empty-if-null value="<%=formObj.getUpdatedOn()%>"/>
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
    <td><a href="javascript:submitAccount()"><img src="img/ok1.gif" border="0" /></a></td>
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>

</body>