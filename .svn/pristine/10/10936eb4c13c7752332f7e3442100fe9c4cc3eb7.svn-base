<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
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
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>
<%
Map lbValMap=(Map)request.getAttribute("viewSecurityMap");
XRefDetailForm frm=(XRefDetailForm)request.getAttribute("XRefDetailForm");
String sec1=(String)lbValMap.get(frm.getSecurity1());
String sec2=(String)lbValMap.get(frm.getSecurity2());
String sec3=(String)lbValMap.get(frm.getSecurity3());
String sec4=(String)lbValMap.get(frm.getSecurity4());
String sec5=(String)lbValMap.get(frm.getSecurity5());
String sec6=(String)lbValMap.get(frm.getSecurity6()); 

 ILimitTrxValue lmtTrxObj = (ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
 
 String internalRemarks =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.internalRemarks");
 String revolvingLine =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.revolvingLine");
 String linecurrency =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currency");
 String currencyRestriction =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyRestriction");
 String intradayLimit =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.intradayLimit");
 System.out.println("internalRemarks:"+internalRemarks+" currencyRestriction:"+currencyRestriction);
 System.out.println("revolvingLine:"+revolvingLine+" linecurrency:"+linecurrency+" intradayLimit:"+intradayLimit);
 
 //SimpleDateFormat sdf = new SimpleDateFormat("dd-Mon-yy"); 
 if(lmtTrxObj!= null && lmtTrxObj.getLimit()!= null){
 System.out.println("111");
 boolean flag = false;
ILimitSysXRef[] refArr = lmtTrxObj.getLimit().getLimitSysXRefs();
 String indexID = (String)request.getAttribute("indexID");

}

 List fccBranchList= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.fccBranchList");

 pageContext.setAttribute("fccBranchList",fccBranchList);
 
List branchAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.branchAllowedList1");
pageContext.setAttribute("branchAllowedList1",branchAllowedList1);
List productAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.productAllowedList1");
pageContext.setAttribute("productAllowedList1",productAllowedList1);
List currencyAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyAllowedList1");
pageContext.setAttribute("currencyAllowedList1",currencyAllowedList1);

List udfLbValList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList1");
pageContext.setAttribute("udfLbValList1",udfLbValList1);

List restCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerList");

if (!(restCoBorrowerList == null)) {
		//System.out.println("restCoBorrowerList size="+restCoBorrowerList.size());
		pageContext.setAttribute("restCoBorrowerList", restCoBorrowerList);
	}else {
		restCoBorrowerList = new ArrayList();
	pageContext.setAttribute("restCoBorrowerList", new ArrayList());
	}

//System.out.println("restCoBorrowerList==========="+restCoBorrowerList); 

   
int vno = 0;

//System.out.println("frm limit start date:"+formObj.getLimitStartDate()+" "+formObj.getDateOfReset());

//System.out.println("formObj.getCurrencyRestriction():"+formObj.getCurrencyRestriction()+" close Flag:"+formObj.getCloseFlag()+" liab branch:"+formObj.getLiabBranch());
 %>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">

 function submitAccount()
 {

 var releasedAmount= document.forms[0].releasedAmount.value;
 var utilizedAmount= document.forms[0].utilizedAmount.value;

 document.forms[0].event.value = 'reopen_ubs';
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
   
   function enableUtilizedAmount()
	{
		var relAmt="";
		var releasedAmount=document.forms[0].releasedAmount.value;
		if(releasedAmount=='')
		{
			document.forms[0].utilizedAmount.disabled=true;
		}
		else
		{
			document.forms[0].utilizedAmount.disabled=false;
		}
		for(var i=0;i<releasedAmount.length;i++){
			if(releasedAmount[i]!=="m" && releasedAmount[i]!=="M" && releasedAmount[i]!=="b" && releasedAmount[i]!=="B"){
				relAmt=relAmt+releasedAmount.charAt(i);			
			}
			
       if(releasedAmount[i]==="m"|| releasedAmount[i]==="M"){	        	
       	releasedAmount=releasedAmount.toLowerCase().replace('M'," ");	        
       	releasedAmount=relAmt*1000000;	    	        
       }
       
       if(releasedAmount[i]==="B"|| releasedAmount[i]==="b"){
       	releasedAmount=releasedAmount.replace('B'," ");
       	releasedAmount=relAmt*1000000000;		       
	        }
       }
	}
	

	function onBlurEvent(txtReleaseAmount){
		var releasedAmount=txtReleaseAmount.value;
		var len="";
		if(releasedAmount.length>=1 && releasedAmount.length<=38){
			var secondLastChar=releasedAmount.charAt(releasedAmount.length-1);
			if(secondLastChar==="M"){
				releasedAmount=releasedAmount.replace("M"," ");
				releasedAmount=releasedAmount*1000000;
				len=releasedAmount.toString().length;
				if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
					txtReleaseAmount.value=releasedAmount;
				}else{
					txtReleaseAmount.value="0.00";
				}
			}
			else if(secondLastChar==="m"){
				releasedAmount=releasedAmount.replace("m"," ");
				releasedAmount=releasedAmount*1000000;
				len=releasedAmount.toString().length;
				if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
					txtReleaseAmount.value=releasedAmount;
				}else{
					txtReleaseAmount.value="0.00";
				}
			}
			else if(secondLastChar==="B"){
				releasedAmount=releasedAmount.replace("B"," ");
				releasedAmount=releasedAmount*1000000000;
				len=releasedAmount.toString().length;
				if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
					txtReleaseAmount.value=releasedAmount;
				}else{
					txtReleaseAmount.value="0.00";
				}
			}
			else if(secondLastChar==="b"){
				releasedAmount=releasedAmount.replace("b"," ");
				releasedAmount=releasedAmount*1000000000;
				len=releasedAmount.toString().length;
				if(len<=38 && releasedAmount.toString().charAt(1)!=="e"){
					txtReleaseAmount.value=releasedAmount;
				}else{
					txtReleaseAmount.value="0.00";
				}
			}
			else if(secondLastChar == 0 || secondLastChar == 1|| secondLastChar == 2|| 
					secondLastChar == 3|| secondLastChar == 4|| secondLastChar == 5|| secondLastChar == 6
					|| secondLastChar == 7 || secondLastChar == 8 || secondLastChar == 9){
				len=releasedAmount.toString().length;
				if(len<=38){
					txtReleaseAmount.value=releasedAmount;
				}else{
					txtReleaseAmount.value="0.00";
				}
			}
			else{
				txtReleaseAmount.value="0.00";
			}
		}
		else{
			txtReleaseAmount.value="0.00";
		}
	}

	function onKeyUpEvent(txtReleaseAmount){
		var releasedAmount=txtReleaseAmount.value;
		if(releasedAmount.length>1){
			var secondLastChar=releasedAmount.charAt(releasedAmount.length-2);
			if(secondLastChar==="M"){
				releasedAmount=releasedAmount.slice(0,-1);
				txtReleaseAmount.value=releasedAmount;
			}
			if(secondLastChar==="m"){
				releasedAmount=releasedAmount.slice(0,-1);
				txtReleaseAmount.value=releasedAmount;
				
			}
			if(secondLastChar==="B"){
				releasedAmount=releasedAmount.slice(0,-1);
				txtReleaseAmount.value=releasedAmount;
			}
			if(secondLastChar==="b"){
				releasedAmount=releasedAmount.slice(0,-1);
				txtReleaseAmount.value=releasedAmount;
			}
		}
	}   

	function checkboxSendToFile(){

		if(document.getElementById("sendToFile").value=='N'){
			document.getElementById("sendToFile").value= "Y";
		}else if(document.getElementById("sendToFile").value==''){
			document.getElementById("sendToFile").value= "N";
		}else if(document.getElementById("sendToFile").value=='Y'){
			document.getElementById("sendToFile").value= "N";
		}
		
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

  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="createdBy"/>
  <html:hidden property="createdOn"/>
  <html:hidden property="updatedBy"/>
  <html:hidden property="updatedOn"/>
  
  <html:hidden property="hiddenSerialNo"/>
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
    <jsp:include page="udf_hidden_limit.jsp"></jsp:include>	
    <jsp:include page="hidden_release_line_detail_close.jsp"></jsp:include>
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
         			<td width="20%" class="fieldname">System ID</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="facilitySystemID" /></td>
		 
                  <td width="20%" class="fieldname">System</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="facilitySystem" /></td>
                </tr>
          <tr class="even">
           			<td width="20%" class="fieldname">Liab Branch<font color="#FF0000">*</font> </td>
                  	<td width="30%"><html:select property="liabBranch" disabled="true">
		      		<option value="">Please Select </option>	
                      <html:options collection="fccBranchList" property="value" labelProperty="label"/>
                    </html:select></td>
          			<td class="fieldname"><p>Currency Restriction</p></td>
                   	<td width="30%">
                   	<%System.out.println("+++++++getCurrencyRestriction+++++"+frm.getCurrencyRestriction()); %>
                   	<% if(null!=frm.getCurrencyRestriction() && frm.getCurrencyRestriction().equalsIgnoreCase("Y")){%>  
                   	<input type="checkbox" id="currencyRestriction" checked="checked" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="currencyRestriction"  disabled="true" />
                   	<%} %>
                   	</td>
          </tr>
          <tr class="even">
		 		  <td width="20%" class="fieldname">Line No.</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="lineNo" /></td>
                   <td width="20%" class="fieldname">Serial No.<font color="#FF0000">*</font> </td>
                   <% if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(formObj.getAction())) {%>
                   <td width="30%"></td>
                   <%}else{ %>
                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                  <%} %>
                 
          </tr>
               <tr class="even">
		 		  <td width="20%" class="fieldname">Main Line Code</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="mainLineCode" /></td>
                    
                  <td width="20%" class="fieldname">Currency</td>
                   <%System.out.println("+++++++getCurrency+++++"+frm.getCurrency()); %>
                  <%if(null!=frm.getCurrency()) {%>
		 		  <td><bean:write name="XRefDetailForm" property="currency" /></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                  
          </tr>
            <tr class="even">
          
           		   <td class="fieldname">Released&nbsp; Amount <font color="#FF0000">*</font> </td>
             		  <td><html:text property="releasedAmount" maxlength="41" styleId="releasedAmount" onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this); enableUtilizedAmount(); javascript:formatAmountAsCommaSeparated(this);"/>
                  <html:errors property="releasedAmount"/></td>
             		 <td class="fieldname">Utilized Amount </td>
             		<td><html:text property="utilizedAmount" maxlength="23" styleId="utilizedAmount" 
                  onblur="javascript:formatAmountAsCommaSeparated(this)" readonly="true"/></td>
           </tr>
            <tr class="even">
                  <td class="fieldname">Released date</td>
                  <td><bean:write name="XRefDetailForm" property="releaseDate" /></td>
                  <td class="fieldname">Send To File</td>
                  <td> <%if(formObj.getSendToFile()==null || formObj.getSendToFile().equals("")){%>
                  <input type="checkbox" id="limitSendToFile"  checked="checked" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<% }else if(formObj.getSendToFile().equals("Y")){%>
								<input type="checkbox" id="limitSendToFile" checked="checked" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<%} else if(formObj.getSendToFile().equals("N")){%>
								<input type="checkbox" id="limitSendToFile" onclick="javascript:checkboxSendToFile()"></input>
								<html:hidden property="sendToFile" styleId="sendToFile"/>
								<%} %>
								</td>
            </tr>
                
           <tr class="even">
		 		 <td width="20%" class="fieldname">Limit Start Date<font color="#FF0000">*</font> </td>
		 		  <td><bean:write name="XRefDetailForm" property="limitStartDate" /></td>
		 		 <td width="20%" class="fieldname">Limit Expiry Date<font color="#FF0000">*</font> </td>
		 		  <td><bean:write name="XRefDetailForm" property="dateOfReset" /></td> 
          </tr>
          
           <tr class="even">
                  <td class="fieldname">Day Light Limit Expiry Date</td>
                  <%if(null!=frm.getIntradayLimitExpiryDate()){%>
                  <td><bean:write name="XRefDetailForm" property="intradayLimitExpiryDate" /></td>
                  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                  <td width="20%" class="fieldname">Day Light Limit</td>
                  <%if(null!=frm.getDayLightLimit()){%>
                  <td width="30%"><bean:write name="XRefDetailForm" property="dayLightLimit" />
                   <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
		 		  </td>
           </tr>
           
            <tr class="even">
          			<td class="fieldname">Available<font color="#FF0000">*</font> </td>
		 		 <td><input type="radio" id="available" name="available" value="Yes" checked="checked" disabled="true">Yes
                   <input type="radio" id="available" name="available" value="No" disabled="true">No </td>
                  <td class="fieldname">Freeze<font color="#FF0000">*</font></td>
          		  <td><bean:write name="XRefDetailForm" property="freeze" /></td>
                 </td>	
          </tr>
          
           <%if("UBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem())){%>
          <tr class="even">
		 		 <td width="20%" class="fieldname">IDL Effective From Date</td>
		 		  <td><bean:write name="XRefDetailForm" property="idlEffectiveFromDate" /></td>
		 		 <td width="20%" class="fieldname">IDL Expiry Date</td>
		 		  <td><bean:write name="XRefDetailForm" property="idlExpiryDate" /></td> 
          </tr>
          
          
          <tr class="even">
          
           		   <td class="fieldname">IDL Amount</td>
             		  <td><html:text property="idlAmount" maxlength="41" styleId="idlAmount" onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this); enableUtilizedAmount(); javascript:formatAmountAsCommaSeparated(this);"/>
                  <html:errors property="idlAmount"/></td>
             		 <td class="fieldname"></td>
             		<td></td>
           </tr>
          
          <%} %>
          
          <tr class="even">
      
                 <td class="fieldname">Revolving Line<font color="#FF0000">*</font> </td>
          		  <%if(null!=frm.getRevolvingLine()) {%>
		 		  <td><bean:write name="XRefDetailForm" property="revolvingLine" /></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
		 		   <td class="fieldname">SCM Flag<font color="#FF0000">*</font> </td>
          		  <%if(null!=frm.getScmFlag()) {%>
		 		  <td><bean:write name="XRefDetailForm" property="scmFlag" /></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                 
          </tr>
           <tr class="even">
          
          		  <td class="fieldname">Last Available Date</td>
          		   <td><bean:write name="XRefDetailForm" property="lastavailableDate" /></td>
                 <td class="fieldname">Upload Date </td>
		 		  <td><bean:write name="XRefDetailForm" property="uploadDate" /></td>
          </tr>
          
           <tr class="even">
          
          		  <td class="fieldname">Segment1<font color="#FF0000">*</font></td>
          		  <td><p>
               		<integro:common-code-single  entryCode="<%=formObj.getSegment()%>"
	                                    categoryCode="<%=CategoryCodeConstant.SEGMENT_1 %>" display="true" descWithCode="false" />               
					</p></td>
		 		 <td class="fieldname">Rule ID<font color="#FF0000">*</font> </td>
		 		   <td><p>
		 		   <integro:common-code-single  entryCode="<%=formObj.getRuleId()%>" categoryCode="<%=CategoryCodeConstant.NPA_RULE_ID %>" display="true" descWithCode="false" />   
					</p></td>
          </tr>
          
                
          <tr class="even">
          
          		 <td class="fieldname">Capital market  exposure <font color="#FF0000">*</font></td>
          		  <td><bean:write name="XRefDetailForm" property="isCapitalMarketExposer" /></td>	
				<%--   <td class="fieldname">PSL FLG <%if("Funded".equalsIgnoreCase(request.getParameter("facilityType"))) { %> <font color="#FF0000">*</font>  <%} %> </td> --%>
                       <td class="fieldname">PSL FLG  <font color="#FF0000">*</font> </td>
                  <td><p>
	                  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="No">
						<integro:common-code-single  entryCode="<%=formObj.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" display="true" descWithCode="false" />               
	                  </logic:equal>
	                  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="Yes">
						<integro:common-code-single  entryCode="<%=formObj.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" display="true" descWithCode="false" />               
	                  </logic:equal>
					</p>
				</td>
                  
          </tr>
           
           
           <tr class="even">
                  <td class="fieldname">Real Estate Exposure <font color="#FF0000">*</font> </td>
                   <td><bean:write name="XRefDetailForm" property="isRealEstateExposer" /></td>
                  
                  <td class="fieldname">UNCONDI CANCL COMMITMENT<font color="#FF0000">*</font></td>
                  <td>
                 <p><integro:common-code-single  entryCode="<%=formObj.getUncondiCancl()%>" categoryCode="<%=CategoryCodeConstant.UNCONDI_CANCL_COMMITMENT %>" display="true" descWithCode="false" />   
					</p></td>
                </tr> 
           <tr>
		 	 <td class="fieldname">Interest rate <font color="#FF0000">*</font></td>
             <td>
             <bean:write name="XRefDetailForm" property="interestRateType"   />
             <%System.out.println("formObj.getInterestRateType():"+formObj.getInterestRateType());if(formObj.getInterestRateType().equalsIgnoreCase("fixed")){ %>
             		rate: &nbsp; <integro:empty-if-null value="<%=formObj.getIntRateFix() %>" /> 
             <%}else if(formObj.getInterestRateType().equalsIgnoreCase("floating")){ %>
              <% if(formObj.getIntRateFloatingMarginFlag().equals("-")){%>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(formObj.getIntRateFloatingRange()) - Double.parseDouble(formObj.getIntRateFloatingMargin())) %>"/>
                   <%}else { %>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(formObj.getIntRateFloatingMargin()) + Double.parseDouble(formObj.getIntRateFloatingRange()))%>"/>
                  <%} %>
             <%} %>
             </td>
              <%System.out.println("frm.getEstateType.............."+frm.getEstateType()); %>
        	 <td class="fieldname">Commercial Real estate/ Residential real Estate  / Indirect real estate</td>
              <td><bean:write name="XRefDetailForm" property="estateType"/>
                    <%if("Commercial Real estate".equals(frm.getEstateType())){ %>
						<html:select property="commRealEstateType" disabled = "true" style="width:250px">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>" descWithCode="false" />
						</html:select>
						<html:hidden property="commRealEstateType" />  
                	<%} %>
              </td> 		
           </tr>
           
          <tr class="even">
                 <%if("UBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem()) || "FCUBS-LIMITS".equalsIgnoreCase(formObj.getFacilitySystem())) %>
                 <%System.out.println("intradayLimit.............."+intradayLimit); %>
                 <% if("Yes".equalsIgnoreCase(intradayLimit)){%> 
                  <td class="fieldname">Day Light Limit Available</td>
                   <%System.out.println("formObj.getIsDayLightLimitAvailable().............."+formObj.getIsDayLightLimitAvailable()); %>
                   <% if(null==formObj.getIsDayLightLimitAvailable() || "No".equals(formObj.getIsDayLightLimitAvailable())){%> 
                  <td><input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable"  value="Yes"   /> Yes
  					  <input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable" value="No" checked="checked" /> No  
  				  </td>
  				  <html:hidden property="isDayLightLimitAvailable" />
  				  <%}else{ %>
  				  <td><input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable"  value="Yes"  checked="checked" /> Yes
  					  <input type="radio" id="isDayLightLimitAvailable" name="isDayLightLimitAvailable" value="No"  /> No  
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
                 	<td>	 <input type="checkbox" name="dayLightLimitApproved" property="dayLightLimitApproved"   checked="true" onclick="javascript:checkboxDayLightLimitApproved()"></input>
                 	</td>
					 <html:hidden property="dayLightLimitApproved" styleId="dayLightLimitApproved"/>
					<% }else {%> 
					<td><input type="checkbox"  name="dayLightLimitApproved" property="dayLightLimitApproved" onclick="javascript:checkboxDayLightLimitApproved()"></input></td>
								<html:hidden property="dayLightLimitApproved" styleId="dayLightLimitApproved"/>
								<%} %>
                </tr>
                	
           
 		 <tr class="even">
          
		  			<td class="fieldname">Limit (Tenor Days)</td>
		  			<td><bean:write name="XRefDetailForm" property="limitTenorDays"/>  </td> 	
		  			 <td class="fieldname">Closed Flag<font color="#FF0000">*</font></td>
          		  	<td width="30%">
                   <input type="checkbox" id="limitCloseFlag"  disabled="true"></input>
					<html:hidden property="closeFlag"/>
                   	</td>
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
		  			 <%if(null!=frm.getVendorDtls()){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="vendorDtls" /></td>
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
                
                
            <%-- <tr class="even">
             

              <td class="fieldname" width="20%">Limit Restriction/Customer Restriction<font color="#ff0000">*</font></td>
              <td width="30%">
									 <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="facilityTypeList" >
						               <html:options collection="facilityTypeList" property="value" labelProperty="label"/>
						               <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>" excludeList="<%=filterActualRbiCodeCatIds %>"  pleaseSelect="false" />
		                			</html:select> 
             		   <td>
		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allListrbiCodeCategory,rbiCodeCategorys, false)" class="btnNormal"/>
			                <br/> <br/> 
							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(rbiCodeCategorys,allListrbiCodeCategory,false)" class="btnNormal"/>
		               </td>
		               
		               <td>
		               
									 <html:select name="RbiCategoryForm" size="10" multiple="multiple" style="width:260" property="rbiCodeCategorys" >
		                			</html:select> 
		                			&nbsp;</br><html:errors property="rbiCodeCategorys"/>
		                		</td>
              
            </tr>  --%>
             <tr class="even">
            <td class="fieldname">Limit Restriction/Customer Restriction</td>
             <td colspan="3"><bean:write property="limitRestriction"  name="XRefDetailForm"/>
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
										<td>Sr No</td>
										<td>Co-Borrower Liab Id </td>
										<td>Co-Borrower Name</td>
									
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
														if (vno % 2 != 0) {
															rowClass = "odd";
									 					} else {
															rowClass = "even";
														}
											%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerId()%>&nbsp;</center>
												</td>
												<td>
												<html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/>
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
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="branchAllowed" disabled="true">
						               <html:options collection="branchAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
             <tr class="even">
             <td class="fieldname" width="20%">Product Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="productAllowed" disabled="true">
						               <html:options collection="productAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
             <tr class="even">
             <td class="fieldname" width="20%">Currency Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="currencyAllowed" disabled="true">
						               <html:options collection="currencyAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
                         <tr class="even">
             <td class="fieldname" width="20%">UDF Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="udfAllowed" disabled="true">
						               <html:options collection="udfLbValList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr>
             <tr class="even">
                  <td class="fieldname">Security 1</td>
                  <td>
                  <integro:empty-if-null value="<%=sec1%>"/>

                  </td>
                  <td class="fieldname">Security 2</td>
                  <td><p>
                   <integro:empty-if-null value="<%=sec2%>"/> 
                  </p></td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Security 3</td>
                  <td>
                  <p>
                   <integro:empty-if-null value="<%=sec3%>"/>
                 </p>
                  </td>
                  <td class="fieldname">Security 4</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec4%>"/> 
                  </p>
                  </td>
                </tr>	
                 <tr class="even">
                  <td class="fieldname">Security 5</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec5%>"/>  
                 </p>
                  </td>
                  <td class="fieldname">Security 6</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec6%>"/> 
                  </p>
                  </td>
                </tr>	
                
                 <tr class="odd">
                  <td class="fieldname">Internal Remarks</td>
                   <td colspan="3"><html:textarea  rows="2" cols="150" property="internalRemarks" disabled="true" />  </td> 	
                </tr>
                  
                <tr class="even">
                  <td class="fieldname">Core STP Rejected Reason</td>
                   <td colspan="3"><bean:write name="XRefDetailForm" property="coreStpRejectedReason"/>  </td> 	
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