<%@page import="java.util.Date"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                  java.util.Collection,
				 java.util.Iterator,
				 java.util.List,
				 java.util.*,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant" %>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge;" />

<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->
<%

String event = (String) request.getParameter("event");

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
	String currency = (String) request.getAttribute("currency");
	String releaseDate = (String) request.getAttribute("releaseDate");
	String dateOfReset = (String) request.getAttribute("dateOfReset");

Map systemIdMap=new HashMap();
for(int m=0;m <systemIdList.size();m++){
		LabelValueBean lb = (LabelValueBean)systemIdList.get(m);
		systemIdMap.put(lb.getLabel(), lb.getLabel());
}	

%>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
  <script type="text/javascript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
  <link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
</head>

<body onload="MM_preloadImages('img/return2.gif')">
 <script type="text/javascript">
 
	window.onload = function(){ 
		var status =  document.forms[0].status.value;
		var newLine = true;
		if('PENDING_SUCCESS'==status){
			document.forms[0].serialNo.readOnly=false;
			document.forms[0].coreStpRejectedReason.disabled=true;
			document.forms[0].coreStpRejectedReason.value='';
			newLine  =false;
		}else if(''==status){
			//document.forms[0].serialNo.readOnly=true;
			document.forms[0].coreStpRejectedReason.disabled=true;
			document.forms[0].coreStpRejectedReason.value='';
			newLine  =false;
		}else if('PENDING_REJECTED'==status){
			newLine  =false;
		}
	
		if(document.forms[0].sendToFile.value=='N' && document.forms[0].event.value == '' && (document.forms[0].action.value==undefined || document.forms[0].action.value=='')){
			document.forms[0].serialNo.readOnly=false;
		}
		
		if(('REJECTED'==status || ''==status) && document.forms[0].sendToFile.value=='N'){
				document.forms[0].serialNo.readOnly=false;
		}
		if(('SUCCESS'==status || ''==status || undefined==status) && document.forms[0].sendToFile.value=='N'){
			document.forms[0].serialNo.readOnly=true;
		}
		
			var flag=true;
			if(("" == document.forms[0].lineAction.value && "" ==  document.forms[0].status.value) ||
          			(null== document.forms[0].lineAction.value &&  null ==  document.forms[0].status.value) ||
          			('NEW' == document.forms[0].lineAction.value && 
          			"PENDING_UPDATE" ==  document.forms[0].status.value ) ) {
				flag=false;
			}
			if(flag){
			var  facilitySystemID=document.forms[0].facilitySystemID;
			//	alert("facilitySystemID:"+facilitySystemID+" index:"+facilitySystemID.selectedIndex+" length:"+facilitySystemID.length);
				var systemIdValue=facilitySystemID.options[facilitySystemID.selectedIndex].value;
				var systemIdText=facilitySystemID.options[facilitySystemID.selectedIndex].text;
			
	//		 alert("systemIdValue:"+systemIdValue+" systemIdText:"+systemIdText);
			 
			 	for(var i=facilitySystemID.options.length-1;i>=0;i--)
			 	{
			 		facilitySystemID.remove(i);
			 	}
			 	var opt=document.createElement("option");
			 	opt.text = systemIdText;
			 	opt.value = systemIdValue;
			 	facilitySystemID.add(opt);
		}
		
	}
 
	   function submitAccount()
	   {
 
		   document.getElementById('adhocLineY').disabled = false;
		   document.getElementById('adhocLineN').disabled = false;

		if (document.forms[0].indexID.value == '') {
				document.forms[0].event.value = 'create_ts';
			} else {
				var status =  document.forms[0].status.value;
				if(status == "" && document.forms[0].event.value == 'prepare_updateStatus_ts'){
					document.forms[0].event.value = 'prepare_updateStatus_ts';
				}else if(status == "" && document.forms[0].event.value == 'prepare_update_ts'){
					document.forms[0].event.value = 'prepare_update_ts';
				}else{
					document.forms[0].event.value = 'submit_ts';
				}
			}
		document.forms[0].facilitySystemID.disabled=false;
		document.forms[0].submit();
		}
	
 	  function cancelSubmit() {
			document.forms[0].event.value = 'cancel';
			document.forms[0].submit();
		}

		function enableUtilizedAmount() {
			var releasedAmount = document.forms[0].releasedAmount.value;
			if (releasedAmount == '') {
				document.forms[0].utilizedAmount.disabled = true;
			} else {
				document.forms[0].utilizedAmount.disabled = false;
			}
		}	
		
		function isAlphaNumeric(event) {
			var character = String.fromCharCode(window.event.keyCode);
			return isValid(character);
		}
		
		function isValid(str) {
			return !/[~`!@#$%\^&*()+=_\-\[\]\\ ';,./{}|\\":<>\?]/g.test(str);
		}
		
		function isDisablePipe(e){
			 try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode == 124) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
		}

		function isNumeric(e) {
			try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
		}		
	
		function controlRejectReason(event){
		   if(event=='PENDING_SUCCESS'){ 
				   document.forms[0].coreStpRejectedReason.value='';
				   document.forms[0].coreStpRejectedReason.disabled=true;
				   if(document.forms[0].action.value=='NEW' || document.forms[0].action.value==undefined){
					   if((document.forms[0].serialNo.value).length>4){
					  // document.forms[0].serialNo.value='';
					   }
					   document.forms[0].serialNo.readOnly=false;
				   }
			   }else if (event=='PENDING_REJECTED'){
				   document.forms[0].coreStpRejectedReason.value='Offline Rejection';
				   document.forms[0].coreStpRejectedReason.disabled=false;

				   if(document.forms[0].action.value=='NEW' || document.forms[0].action.value==undefined){
					  document.forms[0].serialNo.value='';
					  document.forms[0].serialNo.readOnly=true;
				   }
			   }else if (event=='PENDING'){
				   document.forms[0].coreStpRejectedReason.value=''; 
				   document.forms[0].coreStpRejectedReason.disabled=true; 

				   if(document.forms[0].action.value=='NEW' || document.forms[0].action.value==undefined){
					   //document.forms[0].serialNo.value='';
					  document.forms[0].serialNo.readOnly=true; 
				   }
			   }  
		}
		
		function onBlurEvent(txtSancAmount){
			var sancAmount=txtSancAmount.value;
			var len="";
			if(sancAmount.length>=1 && sancAmount.length<=38){
				var secondLastChar=sancAmount.charAt(sancAmount.length-1);
				if(secondLastChar==="M"){
					sancAmount=sancAmount.replace("M"," ");
					sancAmount=sancAmount*1000000;
					len=sancAmount.toString().length;
					if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
						txtSancAmount.value=sancAmount;
					}else{
						txtSancAmount.value="0.00";
					}
				}
				else if(secondLastChar==="m"){
					sancAmount=sancAmount.replace("m"," ");
					sancAmount=sancAmount*1000000;
					len=sancAmount.toString().length;
					if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
						txtSancAmount.value=sancAmount;
					}else{
						txtSancAmount.value="0.00";
					}
				}
				else if(secondLastChar==="B"){
					sancAmount=sancAmount.replace("B"," ");
					sancAmount=sancAmount*1000000000;
					len=sancAmount.toString().length;
					if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
						txtSancAmount.value=sancAmount;
					}else{
						txtSancAmount.value="0.00";
					}
				}
				else if(secondLastChar==="b"){
					sancAmount=sancAmount.replace("b"," ");
					sancAmount=sancAmount*1000000000;
					len=sancAmount.toString().length;
					if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
						txtSancAmount.value=sancAmount;
					}else{
						txtSancAmount.value="0.00";
					}
				}
				else if(secondLastChar == 0 || secondLastChar == 1|| secondLastChar == 2|| 
						secondLastChar == 3|| secondLastChar == 4|| secondLastChar == 5|| secondLastChar == 6
						|| secondLastChar == 7 || secondLastChar == 8 || secondLastChar == 9){
					len=sancAmount.toString().length;
					if(len<=38){
						txtSancAmount.value=sancAmount;
					}else{
						txtSancAmount.value="0.00";
					}
				}
				else{
					txtSancAmount.value="0.00";
				}
			}
			else{
				txtSancAmount.value="0.00";
			}
		}
		
		function onKeyUpEvent(txtSancAmount){
			var sancAmount=txtSancAmount.value;
				if(sancAmount.length>1){
				var secondLastChar=sancAmount.charAt(sancAmount.length-2);
				if(secondLastChar==="M"){
					sancAmount=sancAmount.slice(0,-1);
					txtSancAmount.value=sancAmount;
				}
				if(secondLastChar==="m"){
					sancAmount=sancAmount.slice(0,-1);
					txtSancAmount.value=sancAmount;
				}
				if(secondLastChar==="B"){
					sancAmount=sancAmount.slice(0,-1);
					txtSancAmount.value=sancAmount;
				}
				if(secondLastChar==="b"){
					sancAmount=sancAmount.slice(0,-1);
					txtSancAmount.value=sancAmount;
				}
			}
		}

		function checkboxSendToFile() {
		if(document.forms[0].sendToFile.value=='N'){
			if((document.forms[0].indexID.value=='' && (document.forms[0].action.value==undefined || document.forms[0].action.value==''))
				|| (document.forms[0].indexID.value!='' && document.forms[0].action.value=='NEW')){
				if(document.forms[0].serialNo.value==''){
					document.forms[0].serialNo.readOnly=true;
					document.forms[0].sendToFile.value= 'Y';
				}else{
					document.forms[0].serialNo.value='';
					document.forms[0].serialNo.readOnly=true;
					document.forms[0].sendToFile.value= 'Y';
				}
			}else{
					document.forms[0].serialNo.readOnly=true;
					document.forms[0].sendToFile.value= 'Y';
			}
		}else if(document.forms[0].sendToFile.value==''){
			document.forms[0].sendToFile.value= 'N';
			if((document.forms[0].indexID.value=='' && (document.forms[0].action.value==undefined || document.forms[0].action.value==''))
					|| (document.forms[0].indexID.value!='' && document.forms[0].action.value=='NEW')){
			document.forms[0].serialNo.readOnly=false;
			}
		}else if(document.forms[0].sendToFile.value=='Y'){
			document.forms[0].sendToFile.value= 'N';
			if((document.forms[0].indexID.value=='' && (document.forms[0].action.value==undefined || document.forms[0].action.value==''))
				|| (document.forms[0].indexID.value!='' && document.forms[0].action.value=='NEW')){
			document.forms[0].serialNo.readOnly=false;
			}
		}
		
		if('REJECTED'==document.forms[0].status.value){
			if(document.forms[0].sendToFile.value=='N'){
				document.forms[0].sendToFile.value= 'Y';
				document.forms[0].serialNo.readOnly=true;
			}else if(document.forms[0].sendToFile.value==''){
				document.forms[0].sendToFile.value= 'N';
				document.forms[0].serialNo.readOnly=false;
			}else if(document.forms[0].sendToFile.value=='Y'){
				document.forms[0].sendToFile.value= 'N';
				document.forms[0].serialNo.readOnly=false;
			}
		}
		}
	</script>
 <html:form action="MIAcntDetail">
  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="indexID" styleId="indexID"/>
  <html:hidden property="isCreate"/>   
  <html:hidden property="action"/> 
  <html:hidden property="customerID"/>
  <html:hidden property="sourceRefNo"/>
    
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
  
  <input type="hidden" name="adhocFacility"  value="<%=request.getParameter("adhocFacility") %>">

	<table width="98%" height="100%" cellspacing="0" cellpadding="0" align="center"
		border="0" class="tblFormSection">
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
     			<table width="100%" border="0" align=" " cellpadding="0"
				cellspacing="0" class="tblInfo">
<!--       <table width="108%" border="0" cellspacing="0" cellpadding="0" class="tblInfo"> -->
       <thead>
       </thead> 
       <tbody>
								<tr class="even">
									<%if(event.equals("prepare_updateStatus_ts") || event.equals("prepare_update_ts") 
										|| formObj.getFromEvent().equals("updateStatus")
										 || (event.equals("submit_ts") && formObj.getFromEvent().equals("update"))){%>
									<td width="20%" class="fieldname">System ID <font
										color="#FF0000">*</font>
									</td>
									<td width="30%"><html:select property="facilitySystemID" disabled="true">
											<option value="">Please Select</option>
											<html:options collection="systemIdList" property="value"
												labelProperty="label" />
										</html:select>&nbsp;<html:errors property="facilitySystemID" /></td>
									<%}else{ %>									
									<td width="20%" class="fieldname">System ID <font
										color="#FF0000">*</font>
									</td>
									<td width="30%"><html:select property="facilitySystemID">
											<option value="">Please Select</option>
											<html:options collection="systemIdList" property="value"
												labelProperty="label" />
										</html:select>&nbsp;<html:errors property="facilitySystemID" /></td>
									<%}%>
									<td style="width:200px" class="fieldname">System</td>
									<td style="width:600px"><html:text property="facilitySystem"
											readonly="true" /></td>
								</tr>
								<tr class="even">
									<td width="20%" class="fieldname">Line No.</td>
									<td width="30%"><html:text styleId="lineNo" property="lineNo"
											readonly="true" /></td>

									<td width="20%" class="fieldname">Serial No.
									</td>
									<td width="30%">
							         <%if(event.equals("prepare_update_ts")){
											if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && "N".equals(formObj.getSendToFile()) ){ %>
						          		 	<html:text property="serialNo" maxlength="20" readonly="true" styleId="serialNo"/>
									<%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction())){%>
							          		<html:text property="serialNo" maxlength="20" value="" styleId="serialNo" readonly="true"/>
						          			<html:hidden property="hiddenSerialNo" styleId="hiddenSerialNo"/>				
						             <%}else if(ICMSConstant.FCUBS_STATUS_REJECTED.equals(formObj.getStatus()) 
													&& formObj.getSerialNo()!=null && formObj.getSerialNo().length()<20){
													%>
											<html:text property="serialNo" maxlength="20"/>
									<%}	else{ %>
						           			<html:text property="serialNo" maxlength="20" readonly="true"  styleId="serialNo"/>
							         <%}
											
										}else if(event.equals("prepare_updateStatus_ts") || formObj.getFromEvent().equals("updateStatus") || formObj.getFromEvent().equals("update")){
										  if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && ICMSConstant.FCUBS_STATUS_PENDING_SUCCESS.equals(formObj.getStatus())  && "N".equals(formObj.getSendToFile())) {%>
					                    	<html:text property="serialNo" maxlength="20" styleId="serialNo" onkeypress="return isAlphaNumeric(event);"/>
					                    <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && ICMSConstant.FCUBS_STATUS_PENDING_SUCCESS.equals(formObj.getStatus())  && "Y".equals(formObj.getSendToFile())) {%>	
					                    	<html:text property="serialNo" maxlength="20" styleId="serialNo" 
											onkeypress="return isAlphaNumeric(event);"/>
					                    <% }else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction())) {%>
					                    	<html:text property="serialNo" maxlength="20" value="" styleId="serialNo" readonly="true"/>
						          			<html:hidden property="hiddenSerialNo" styleId="hiddenSerialNo"/>
					                   	<%}else{ %>
					                  		<html:text property="serialNo" maxlength="20" styleId="serialNo" readonly="true"/>
					                    <%}
									 }else{
				                		if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction()) && "N".equals(formObj.getSendToFile()) ){ %>
							          		 <html:text property="serialNo" maxlength="20" readonly="true" styleId="serialNo"/>
							          	<%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction())){%>
							          			<html:hidden property="serialNo" styleId="serialNo"/>
							          			 <input type="text" maxlength="20" readonly="true" value=""/>
							          	<%}else{ %>
							          			<html:text property="serialNo" maxlength="20" readonly="true" styleId="serialNo"/>                
							            <%}
				                	} %> 			                    
					       
									    	<html:errors property="serialNo" /></td>
								</tr>

								<tr class="odd">
									<td width="20%" class="fieldname">Currency</td>
									<td width="30%">
									<html:text property="currency" value="<%=currency %>" readonly="true"/>
									</td>
									<td width="20%" class="fieldname">Tenure <font
										color="#FF0000">*</font></td>
											<%if(event.equals("prepare_updateStatus_ts") || formObj.getFromEvent().equals("updateStatus")){%>
											<td width="30%"><html:text property="tenure" maxlength="4" readonly="true" onkeypress="return isNumeric(event);"/>
											<html:errors property="tenure"/></td>
											<%}else{ %>
									<td width="30%"><html:text property="tenure" maxlength="4"  onkeypress="return isNumeric(event);"/><html:errors property="tenure"/></td>
									<%} %>
								</tr>

								<tr class="even">
									<%if(event.equals("prepare_updateStatus_ts") || formObj.getFromEvent().equals("updateStatus")){%>
									<td width="20%" class="fieldname">Released Amount <font
										color="#FF0000">*</font>
									</td>									
									<td  width="30%"><html:text property="releasedAmount" maxlength="23"
											onchange="enableUtilizedAmount()" styleId="releasedAmount" readonly="true"
											onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this);javascript:formatAmountAsCommaSeparated(this);" /> <html:errors
											property="releasedAmount" />
									</td>
									<td  width="20%" class="fieldname">CAM Date<font color="#FF0000">*</font></td>
									<td  width="30%"><html:text property="releaseDate" style="width:90px" readonly="true" value="<%=releaseDate %>" size="15" maxlength="10" />
                     					 <html:errors property="releaseDate"/>
									</td>
									<%}else if(event.equals("prepare_update_ts")){%>
									<td  width="20%" class="fieldname">Released Amount <font
									color="#FF0000">*</font>
								</td>									
								<td  width="30%"><html:text property="releasedAmount" maxlength="23"
										onchange="enableUtilizedAmount()" styleId="releasedAmount"
										onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this);javascript:formatAmountAsCommaSeparated(this);" /> <html:errors
										property="releasedAmount" />
								</td>
								<td width="20%" class="fieldname">CAM Date<font color="#FF0000">*</font></td>
									<td width="30%"><html:text property="releaseDate" style="width:90px" readonly="true" onblur="itg_checkform('frmMain','releaseDate','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
                     					<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('releaseDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; <html:errors property="releaseDate"/>
									</td>
								<%}else{ %>
									<td width="20%" class="fieldname">Released Amount <font
										color="#FF0000">*</font>
									</td>
									<td width="30%"><html:text property="releasedAmount" maxlength="23"
											onchange="enableUtilizedAmount()" styleId="releasedAmount"
											onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this);javascript:formatAmountAsCommaSeparated(this);" /> <html:errors
											property="releasedAmount" />
									</td>									
									<td width="20%" class="fieldname">CAM Date<font color="#FF0000">*</font></td>
									<td width="30%"><html:text property="releaseDate" style="width:90px" readonly="true" value="<%=releaseDate %>" onblur="itg_checkform('frmMain','releaseDate','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
                     					<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('releaseDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; <html:errors property="releaseDate"/>
									</td>
									<%} %>
								</tr>
								<tr class="even">
									<%if(event.equals("prepare_updateStatus_ts") || formObj.getFromEvent().equals("updateStatus")){%>
					<td width="20%" class="fieldname">Utilized Amount</td>
									<td width="30%"><html:text property="utilizedAmount" maxlength="23"
											styleId="utilizedAmount" value="<%=utilizedAmount%>"
											onkeyup="onKeyUpEvent(this);" readonly="true" onblur="onBlurEvent(this);javascript:formatAmountAsCommaSeparated(this);" /> <html:errors
											property="utilizedAmount" /></td>
									<td width="20%" class="fieldname">CAM Expiry Date<font color="#FF0000">*</font></td>
									 <td width="30%"><p>
				                    <html:text property="dateOfReset" style="width:90px" readonly="true" onblur="itg_checkform('frmMain','dateOfReset','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
				        			 <html:errors property="dateOfReset"/></p></td> 
								<%}else if(event.equals("prepare_update_ts")){ %>
									<td width="20%" class="fieldname">Utilized Amount</td>
									<td width="30%"><html:text property="utilizedAmount" maxlength="23"
											styleId="utilizedAmount"
											onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this);javascript:formatAmountAsCommaSeparated(this);" /> <html:errors
											property="utilizedAmount" /></td>
									<td width="20%" class="fieldname">CAM Expiry Date<font color="#FF0000">*</font></td>
									 <td width="30%"><p>
				                    <html:text property="dateOfReset" style="width:90px" readonly="true" onblur="itg_checkform('frmMain','dateOfReset','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
				                    <img src="img/calendara.gif"  name="Image211" border="0" id="Image211" onclick="return showCalendar('dateOfReset', 'dd/mm/y');" onmouseover="MM_swapImage('Image211','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
				                    <html:errors property="dateOfReset"/> </p></td>
								<%}else{ %>									
									<td width="20%" class="fieldname">Utilized Amount</td>
									<td width="30%"><html:text property="utilizedAmount" maxlength="23"
											styleId="utilizedAmount" value="<%=utilizedAmount%>"
											onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this);javascript:formatAmountAsCommaSeparated(this);" /> <html:errors
											property="utilizedAmount" /></td>
									<td width="20%" class="fieldname">CAM Expiry Date<font color="#FF0000">*</font></td>
									 <td width="30%"><p>
				                    <html:text property="dateOfReset" style="width:90px" readonly="true" value="<%=dateOfReset %>" onblur="itg_checkform('frmMain','dateOfReset','Date','5');return document.MM_returnValue" size="15" maxlength="10" />
				                    <img src="img/calendara.gif"  name="Image211" border="0" id="Image211" onclick="return showCalendar('dateOfReset', 'dd/mm/y');" onmouseover="MM_swapImage('Image211','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
				                    <html:errors property="dateOfReset"/> </p></td> 
								<%} %>
								</tr>

								<tr class="odd">
									<%if(event.equals("prepare_updateStatus_ts") || formObj.getFromEvent().equals("updateStatus")){%>
									<td width="20%" class="fieldname">Liability ID
									</td>
									<td width="30%"><html:text property="liabilityId" readonly="true" onkeypress="return isAlphaNumeric(event);"/>
									<html:errors property="liabilityId"/>
										</td>
									<td width="20%" class="fieldname">Sell Down Period</td>
									<td width="30%"><html:text property="sellDownPeriod" readonly="true"  maxlength="4" onkeypress="return isNumeric(event);"/> <html:errors
											property="sellDownPeriod"/></td>
									<%}else{ %>								
									<td width="20%" class="fieldname">Liability ID
									</td>
									<td width="30%"><html:text property="liabilityId" maxlength="9" onkeypress="return isAlphaNumeric(event);"/><html:errors property="liabilityId"/>
										</td>
									<td width="20%" class="fieldname">Sell Down Period</td>
									<td width="30%"><html:text property="sellDownPeriod" maxlength="4" onkeypress="return isNumeric(event);"/> <html:errors
											property="sellDownPeriod" /></td>
										<%} %>
								</tr>

								<tr class="even">

								<%
								
								System.out.println("formObj.getSendToFile() : "+formObj.getSendToFile());
								System.out.println("Event : "+event +" Form event "+formObj.getFromEvent());
								if(event.equals("prepare_updateStatus_ts") || formObj.getFromEvent().equals("updateStatus")){%>
									<td width="20%" class="fieldname">Limit Remarks</td>
									<td width="30%"><html:textarea property="limitRemarks" rows="3" cols="70" onkeypress="return isDisablePipe(event);" readonly="true"/>
										<html:errors property="limitRemarks" /></td>
									<td width="20%" class="fieldname">Send To File</td>
									<td width="30%" disabled=true>
									<%if(formObj.getSendToFile()==null || formObj.getSendToFile().equals("")){%>
								<input type="checkbox" id="limitSendToFile"   checked="true" value="true" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<% }else if(formObj.getSendToFile().equals("Y")){%>
										<input type="checkbox" id="sendToFileChk" checked="true" readonly="true" onclick="javascript:checkboxSendToFile()"/>
										<%} else if(formObj.getSendToFile().equals("N")){%>
										<input type="checkbox" id="sendToFileChk" readonly="false" onclick="javascript:checkboxSendToFile()"/> 
										<%} %>
									</td>
								<%}else if(event.equals("prepare_update_ts")){%>
									<td width="20%" class="fieldname">Limit Remarks</td>
									<td width="30%"><html:textarea property="limitRemarks" rows="3" cols="70" onkeypress="return isDisablePipe(event);"/>
										<html:errors property="limitRemarks" /></td>
									<td width="20%" class="fieldname">Send To File</td>
									<td width="30%">
								<%if(formObj.getSendToFile()==null || formObj.getSendToFile().equals("")){%>
								<input type="checkbox" id="limitSendToFile"   checked="true" value="true" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<% }else if(formObj.getSendToFile().equals("Y")){%>
								<input type="checkbox" id="limitSendToFile"   checked="true" value="true" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<%} else if(formObj.getSendToFile().equals("N")){%>
								<input type="checkbox" id="limitSendToFile"  value="false"  onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<%} %>
								</td>
								<%}else if(formObj.getFromEvent().equals("updateStatus")){%>
									<td width="20%" class="fieldname">Limit Remarks</td>
									<td width="30%"><html:textarea property="limitRemarks" rows="3" cols="70" onkeypress="return isDisablePipe(event);"/>
										<html:errors property="limitRemarks" /></td>
									<td width="20%" class="fieldname">Send To File</td>
									<td width="30%" disabled=true>
									<html:hidden property="sendToFile" styleId="sendToFile"/>
									<%if(formObj.getSendToFile()==null || formObj.getSendToFile().equals("")){%>
								<input type="checkbox" id="limitSendToFile"   checked="true" value="true" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<% }else if(formObj.getSendToFile().equals("Y")){%>
										<input type="checkbox" id="sendToFileChk" checked="true" readonly="true" onclick="javascript:checkboxSendToFile()"/>
										<%} else if(formObj.getSendToFile().equals("N")){%>
										<input type="checkbox" id="sendToFileChk" readonly="false" onclick="javascript:checkboxSendToFile()"/> 
										<%} %>
									</td>									
								<%}else{ %>								
									<td width="20%" class="fieldname">Limit Remarks</td>
									<td width="30%"><html:textarea property="limitRemarks" rows="3" cols="70" onkeypress="return isDisablePipe(event);"/>
										<html:errors property="limitRemarks" /></td>
									<td width="20%" class="fieldname">Send To File</td>
									<td width="30%">
										<%if(formObj.getSendToFile()==null || formObj.getSendToFile().equals("")){%>
										<input type="checkbox" id="sendToFileChk" checked="true" onclick="javascript:checkboxSendToFile()"/>
										<html:hidden property="sendToFile" styleId="sendToFile" />
										 <% }else if(formObj.getSendToFile().equals("Y")){%>
										<input type="checkbox" id="sendToFileChk" checked="true" onclick="javascript:checkboxSendToFile()"/>
										<html:hidden property="sendToFile" styleId="sendToFile" />
										 <%} else if(formObj.getSendToFile().equals("N")){%>
										<input type="checkbox" id="sendToFileChk" onclick="javascript:checkboxSendToFile()"/>
										<html:hidden property="sendToFile" styleId="sendToFile" />
										<%} %>
									</td>
									<%} %>
								</tr>
								
								
								<%if(!event.equals("prepare_updateStatus_ts") && !(formObj.getFromEvent().equals("updateStatus"))){%>
								<tr class="odd">
									<td width="20%" class="fieldname">Core STP Rejected Reason</td>
									<td width="80%" colspan="3"><html:textarea
											property="coreStpRejectedReason" rows="2" cols="200"
											disabled="true" />
											<html:errors property='coreStpRejectedReason'/></td>
											<!--<html:textarea  rows="2" cols="150" property="coreStpRejectedReason"  styleId="coreStpRejectedReason" readonly="true"/>-->
          
								</tr>
								<tr class="even">
									<td width="20%" class="fieldname">Status<font color="#FF0000">*</font></td>
									<td width="30%"><html:select property="status"
											onchange="javascript:controlRejectReason(this.value);"
											disabled="true">
										</html:select><html:errors property="status"/></td>
									 <%if("ET".equals(formObj.getFacilitySystem())){%>
									<td class="fieldname">Banking Arrangement</td>
									<td>                  	
										<html:select property="bankingArrangement" disabled = "true" style="width:250px">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
										</html:select>
										<html:hidden property="bankingArrangement" />
									</td>
									<%}else{%>
										<td width="20%"></td>
									<td width="30%"></td>
									<%}%>										
								</tr>
						<%-- 	<tr class="odd">
									<td width="20%" class="fieldname"></td>
									<td width="30%"></td>
			 <td class="fieldname"><bean:message key="label.lineRelease.adhocLine"/><font color="#FF0000">*</font></td>
                        <%  
                  if(null != request.getParameter("adhocFacility")){  
                  
                   if("Y".equalsIgnoreCase(request.getParameter("adhocFacility") )){%> 
                     <td>
                    <input type="radio" id="adhocLineY" name="adhocLine" value="Y" checked="checked" disabled="true" >Yes
                   <input type="radio" id="adhocLineN" name="adhocLine" value="N" disabled="true"  >No 
                   </td>
  					  <%}else{
                if("N".equalsIgnoreCase(request.getParameter("adhocFacility") )  || null==formObj.getAdhocLine() || "N".equals(formObj.getAdhocLine())){%> 
                 <td><input type="radio" id="adhocLineY" name="adhocLine"  value="Y"  disabled="true"  /> Yes
 					  <input type="radio" id="adhocLineN" name="adhocLine" value="N" checked="checked"  disabled="true" /> No  
 				  </td>
 				  <html:hidden property="adhocLine" />
 				  <%}else if("Y".equals(formObj.getAdhocLine())){  %>
 				  <td><input type="radio" id="adhocLineY" name="adhocLine"  value="Y"  checked="checked"  disabled="true" /> Yes
 					  <input type="radio" id="adhocLineN" name="adhocLine" value="N"  disabled="true" /> No  
 				  </td>
 				  <html:hidden property="adhocLine" />
 				  <%}
                  } } %>
                  <html:hidden property="adhocLine" />
                  
		  
								</tr> --%>
								<%}else if(formObj.getFromEvent().equals("updateStatus")){%>
								<tr class="odd">
									<td width="20%" class="fieldname">Core STP Rejected Reason</td>
									<td width="80%" colspan="3"><html:textarea
											property="coreStpRejectedReason" rows="2" cols="200"
											value="<%=formObj.getCoreStpRejectedReason() %>" />
											<html:errors property='coreStpRejectedReason'/></td>
								</tr>
								<tr class="even">
									<td width="20%" class="fieldname">Status<font color="#FF0000">*</font></td>
									<td width="30%">
									<html:select property="status"
											onchange="javascript:controlRejectReason(this.value);">											
											<html:option value="">Please Select</html:option>
											<html:option value="PENDING_SUCCESS">SUCCESS</html:option>
											<html:option value="PENDING_REJECTED">REJECTED</html:option>
										</html:select><html:errors property="status"/></td>
									 <%if("ET".equals(formObj.getFacilitySystem())){%>
									<td class="fieldname">Banking Arrangement</td>
									<td>                  	
										<html:select property="bankingArrangement" disabled = "true" style="width:250px">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
										</html:select>
										<html:hidden property="bankingArrangement" />
									</td>
									<%}else{%>
										<td width="20%"></td>
									<td width="30%"></td>
									<%}%>
								</tr>
								<%}else{ %>
								<tr class="odd">
									<td width="20%" class="fieldname">Core STP Rejected Reason</td>
									<td width="80%" colspan="3"><html:textarea
											property="coreStpRejectedReason" rows="2" cols="200"
											value="<%=formObj.getCoreStpRejectedReason() %>" />
											<html:errors property='coreStpRejectedReason'/></td>
								</tr>
								<tr class="even">
									<td width="20%" class="fieldname">Status<font color="#FF0000">*</font></td>
									<td width="30%">
									<html:select property="status"
											value="<%formObj.getStatus(); %>"
											onchange="javascript:controlRejectReason(this.value);">											
											<html:option value="">Please Select</html:option>
											<html:option value="PENDING_SUCCESS">SUCCESS</html:option>
											<html:option value="PENDING_REJECTED">REJECTED</html:option>
										</html:select><html:errors property="status"/></td>
									 <%if("ET".equals(formObj.getFacilitySystem())){%>
									<td class="fieldname">Banking Arrangement</td>
									<td>                  	
										<html:select property="bankingArrangement" disabled = "true" style="width:250px">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
										</html:select>
										<html:hidden property="bankingArrangement" />
									</td>
									<%}else{%>
										<td width="20%"></td>
									<td width="30%"></td>
									<%}%>
								</tr>
								<%} %>
								
									<tr class="odd">
									
			 <td class="fieldname"><bean:message key="label.lineRelease.adhocLine"/><font color="#FF0000">*</font></td>
                        <%  
                  if(null != request.getParameter("adhocFacility")){  
                  
                   if("Y".equalsIgnoreCase(request.getParameter("adhocFacility") )){%> 
                     <td>
                    <input type="radio" id="adhocLineY" name="adhocLine" value="Y" checked="checked" disabled="true" >Yes
                   <input type="radio" id="adhocLineN" name="adhocLine" value="N" disabled="true"  >No 
                   </td>
  					  <%}else{
                if("N".equalsIgnoreCase(request.getParameter("adhocFacility") )  || null==formObj.getAdhocLine() || "N".equals(formObj.getAdhocLine())){%> 
                 <td><input type="radio" id="adhocLineY" name="adhocLine"  value="Y"  disabled="true"  /> Yes
 					  <input type="radio" id="adhocLineN" name="adhocLine" value="N" checked="checked"  disabled="true" /> No  
 				  </td>
 				  <html:hidden property="adhocLine" />
 				  <%}else if("Y".equals(formObj.getAdhocLine())){  %>
 				  <td><input type="radio" id="adhocLineY" name="adhocLine"  value="Y"  checked="checked"  disabled="true" /> Yes
 					  <input type="radio" id="adhocLineN" name="adhocLine" value="N"  disabled="true" /> No  
 				  </td>
 				  <html:hidden property="adhocLine" />
 				  <%}
                  } } %>
                  
                  <td width="20%" class="fieldname"></td><td width="30%"></td>
                  <html:hidden property="adhocLine" />
                  
		  
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
      <td>&nbsp;</td>
    </tr>
  
    
   </tbody>
  </table>
     <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
     <tr> 
     <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
  <tr class="odd">
                  <td width="20%" class="fieldname">Created/Edited By</td>
                  <td width="30%">
               
                 <integro:empty-if-null value="<%=formObj.getCreatedBy()%>"/>
                  </td>
                  <td width="20%" class="fieldname">Approved By</td>
                  <td width="30%">  
                   
                     <integro:empty-if-null value="<%=formObj.getUpdatedBy()%>"/>
                    </td>
                  </tr>
      <tr class="odd">
                  <td width="20%" class="fieldname">Created/Edited On</td>
                  <td width="30%">
                  <integro:empty-if-null value="<%=formObj.getCreatedOn()%>"/>
               
                  </td>
                  <td width="20%" class="fieldname">Approved On</td>
                  <td width="30%">   

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
 </html:form>  
</body>	
 </html>