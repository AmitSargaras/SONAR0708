<%@ page
	import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,
	com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,
	com.integrosys.component.notification.bus.OBNotification,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.app.otherbank.bus.OBOtherBank,
	java.util.Vector,com.integrosys.cms.app.customer.bus.OBSubline,com.integrosys.cms.app.customer.bus.OBIfscMethod,java.util.TreeMap"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%
	int listNewSize = 0;
ArrayList<OBOtherBank> otherBranchList = (ArrayList<OBOtherBank>)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.OtherBankList");

List ifscBranchList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ifscBranchList");
System.out.println("??????????????????????"+ifscBranchList);
TreeMap soretedMap= new TreeMap();

if (!(ifscBranchList == null)) {
	for(int i=0;i<ifscBranchList.size();i++)
	{
		OBIfscMethod ob=(OBIfscMethod)ifscBranchList.get(i);
		if("O".equals(ob.getBankType())){
			soretedMap.put(ob.getIfscCode(),ob);
		}
	}
}
//test local

/*  for(int i=0;i<1;i++){
	 OBOtherBank oBOtherBank = new OBOtherBank();
	 oBOtherBank.setiFSCCode("SANT000013"+i);
	 oBOtherBank.setOtherBankName("SANTY BANK");
	 oBOtherBank.setBranchName("KANJUR MARG BRANCH");
	 oBOtherBank.setBranchNameAddress(", 101 KANJUR MARG");
	 otherBranchList.add(oBOtherBank); 
}  */

//end test local 

String ifscWsResponce=(String)request.getAttribute("ifscWsResponce");
DefaultLogger.debug(this,"ifscWsResponce:"+ifscWsResponce);

//System.out.println("<<<<<<<otherBranchList>>>>>>>>>"+otherBranchList.size());
int no = 0;
 
String bankId = "";
listNewSize=otherBranchList.size();
System.out.println("<<<<<<<listNewSize>>>>>>>>>"+listNewSize);
pageContext.setAttribute("listNewSize", Integer.toString(listNewSize));


/* for(int i = 0; i<otherBranchList.size();i++)
{
	OBOtherBank obj=otherBranchList.get(i);
	System.out.println("OtherBankName() "+obj.getOtherBankName());
	System.out.println("getiFSCCode() "+obj.getiFSCCode());
	System.out.println("getBranchName()() "+obj.getBranchName());
	System.out.println("getBranchNameAddress "+obj.getBranchNameAddress()); 
} */

int startIndex=0;
String ind= (String) request.getAttribute("startIndex");
if(ind!=null && (!ind.equals("")))
{
	 startIndex = Integer.parseInt(ind);
	
}
String ifscObj="";
if (!(otherBranchList == null)) {
	
	pageContext.setAttribute("otherBranchList", otherBranchList);
	//request.setAttribute("otherBankList", otherBankList);
	//for IFSC 
	 for(int i=0;i<otherBranchList.size();i++){
		OBOtherBank obj=otherBranchList.get(i);
		
		if(null==obj.getOtherBranchId()){
				ifscObj=ifscObj+obj.getiFSCCode()+"|"+obj.getOtherBankName()+"|"+obj.getBranchName()+"|" + obj.getBranchNameAddress() + "~";
			}
		}
	}
	//System.out.println("<<<<<<ifscObj>>>>>>"+ifscObj);
	String event = (String) request.getAttribute("event");
	System.out.println("event:" + event);
	String bankName = (String) request.getAttribute("bankNameValue");
	String branchName = (String) request.getAttribute("bankBranchNameValue");
	String ifscCode = (String) request.getAttribute("ifscCodeValue");
	String checkboxIsNBFC = (String) request.getAttribute("checkboxIsNBFC");
	String exceptionalCase = (String) request.getAttribute("exceptionalCase");

	System.out.println("<<<<<<<bankName>>>>>>>>>" + (String) request.getAttribute("bankNameValue"));
	System.out.println("<<<<<<<branchName>>>>>>>>>" + (String) request.getAttribute("bankBranchNameValue"));
	System.out.println("<<<<<<<exceptionalCase>>>>>>>>>" + (String) request.getAttribute("exceptionalCase"));
	System.out.println("<<<<<<<checkboxIsNBFC>>>>>>>>>" + checkboxIsNBFC);
	//List branchList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchList");
	/* Map map = new HashMap();
	for(int i = 0; i<branchList.size();i++)
	{
	// System.out.println("----"+i);
	 OBBankingMethod branch = (OBBankingMethod)branchList.get(i);
	 if(branch.getBankType()!=null && branch.getBankType().equals("O"))
	 {
	// System.out.println("key value is  ----- "+String.valueOf(branch.getBankId())+String.valueOf(branch.getOtherbranch().getOtherBankCode().getId()));
	map.put(String.valueOf(branch.getBankId())+String.valueOf(branch.getOtherbranch().getOtherBankCode().getId()),null);
	 }
	}
	
	String BankId= (String) request.getAttribute("BankId");
	request.setAttribute("BankId",BankId);
	Collection resultNewList = null;
	if (otherBranchList != null) {
		resultNewList = otherBranchList.getResultList();
		listNewSize = resultNewList.size();
		pageContext
				.setAttribute("listNewSize", Integer.toString(listNewSize));
		pageContext.setAttribute("OtherBranchList", resultNewList);
	}
	
	
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
	{
		 startIndex = Integer.parseInt(ind);
		
	}
	
	
	
		SearchResult notificationList = (SearchResult) session
				.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.OtherBankList");
	
		String bankId = "";
		ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request
		.getAttribute("ManualInputCustomerInfoForm");
		
		
		int sno = 0;
		int no = 0;
		Collection resultList = null;
		int totalCount = 0;
		int listSize = 0;
		if (notificationList != null) {
			resultList = notificationList.getResultList();
			totalCount = notificationList.getNItems();
			listSize = resultList.size();
			pageContext
					.setAttribute("listSize", Integer.toString(listSize));
			pageContext.setAttribute("OtherBankList", resultList);
		}
		String index = (String) request.getAttribute("index");
		String event = (String) request.getAttribute("event");
		if(index == null || index == "")
		{
			index="0";
		}
		
		//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+ (resultNewList==null)?"list is null":resultNewList.size());
		String temp=(resultNewList==null)?"list is null":resultNewList.size()+"";
		//int startIndex=0;
		//	String ind= (String) request.getAttribute("startIndex");
		//if(ind!=null && (!ind.equals("")))
		//	 startIndex = Integer.parseInt(ind);
	
		//System.out.print(" startIndex : "+startIndex); */
		
		ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");
		
		
		String[] revisedArr1 = value.getRevisedEmailIdsArray();
	 String[] revisedArr = value.getRevisedEmailIdsArray();
	 int len = 0;
	 
	 value.setRevisedEmailIdsArray(value.getRevisedEmailIdsArray());
	 
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
				System.out.println("cibil details=>+++++value.getRevisedEmailIdsArray()--=======>"+value.getRevisedEmailIdsArray()[i].toString()+" ** value.getRevisedEmailIdsArray().length=>"+value.getRevisedEmailIdsArray().length);
			}
		}
	}
	
	
	List revisedArr22 = value.getRevisedArrayListN();
	 
	
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			len = revisedArr1.length;
			revisedArr = new String[len];
			for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
				revisedArr[i] = revisedArr1[i];
				System.out.println("I="+i+" ** revisedArr[i]===>"+revisedArr[i]);
			}
		}
	}  
	
	System.out.println("Revised ArrayList create cibil method =>"+value.getRevisedArrayListN());
	/* List arr12 = value.getRevisedArrayListN();
	System.out.println("arr12.size()=>"+arr12.size());
	pageContext.setAttribute("arr12",arr12); */
	pageContext.setAttribute("revisedArr",revisedArr);
	int cnt = 0;
	
%>



<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBBankingMethod"%><html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<style type="text/css">
.table-scroll{
	height:85%;
	
	overflow-y: scroll;
}
</style>

<script language="JavaScript" type="text/JavaScript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}
	function searchBankBranch()
    {	
	    var BankId = document.getElementById("bankBranchId").value;
	    var event = document.forms[0].event.value;
	   
	    if(event == 'display_bank_list' || event == 'view_other_bank_by_index')
	    {
	  	document.forms[0].action  = "ManualInputCustomer.do?event=view_other_bank_by_index&BankId="+BankId;
	    document.forms[0].submit(); 
	    }
	    else if (event == 'display_bank_list_in_edit' || event == 'view_other_bank_by_index_in_edit')
	    {
	    	document.forms[0].action  = "ManualInputCustomer.do?event=view_other_bank_by_index_in_edit&BankId="+BankId;
	    	  document.forms[0].submit(); 
	    }
	    else if(event == 'display_bank_list_in_resubmit' || event == 'view_other_bank_by_index_in_resubmit')
	    {
	    	document.forms[0].action  = "ManualInputCustomer.do?event=view_other_bank_by_index_in_resubmit&BankId="+BankId; 
	    	  document.forms[0].submit(); 
	    }
	  
    }
	

	function addNew() {
	    document.forms[0].action = "OtherBank.do?event=prepare_create_other_bank";
	    document.forms[0].submit();
	}
	 function returnPage(name) {
		 
		    document.forms[0].action = "ManualInputCustomer.do?event="+name;
		    document.forms[0].submit();
	}
		
	function saveOtherBank(name) 
	{	
		 var arr = new Array();	
    	if( document.forms[0].bank.length == undefined )      
    	{
    	       if(document.forms[0].bank.checked)
    	       {  
    	    	   arr[0] = document.forms[0].bank.value;
    	       }
    	}
    	else
    	{
		for( var i = 0,j = 0 ; i<document.forms[0].bank.length; i++)
		{
			var value=document.forms[0].bank[i].checked;
         if(value)
         {
        	 arr[j] = document.forms[0].bank[i].value;
        	 j++;
         }
		}
    	}
		
		var result = "";
		var first = true;
		
		for( var i = 0 ; i<arr.length; i++)
		
			   {  
			      if(first) 
				     {         result+=arr[i];     
				         first=false;     
				     }
			        else
				     {  
				           result+=","+arr[i];    
			         }
			    } 
		  //event="save_other_bank_in_edit"
		  var e='<%= event%>';
          if(e=='display_bank_list_ifsc_code'
              || e=='display_bank_list_in_edit_ifsc_code'
                || e=='display_bank_list_in_resubmit_ifsc_code'){
        	  
        	  //ifsc issue
        	  var res = result.split(",");
        	  var finalList="";
        	  var ifscStringObj ="<%= ifscObj%>";
        	  var ifscStringArry = ifscStringObj.split("~");
      
        	  for(var j=0;j<ifscStringArry.length;j++){
        		  var ifscObj =ifscStringArry[j].split("|"); 
        		  for(var i=0;i<res.length;i++){
            		  var selected = res[i];
            		  var temp =ifscObj[0];
            		 if(selected==temp){
            			 finalList=finalList+ifscStringArry[j]+"~";
            		 }
            	  }
        	  }
        	  var ifscList="";
        	  ifscList = finalList.substring(0, finalList.length-1);
        	  //end ifsc issue
        	  
              document.forms[0].action = "ManualInputCustomer.do?event="+name+"&BranchId="+result+"&checkboxIsNBFC=false&ifscList="+ifscList;
          }else{
              document.forms[0].action = "ManualInputCustomer.do?event="+name+"&BranchId="+result;
          }
          
          if(result==""){
        	  alert("Please select at least one bank.");
          }else{
        	  document.forms[0].submit();
          }
	    //alert(document.getElementById("customerNameShort").value);
	}
	function getClear(){
		document.getElementById('iFSCCode').value = '';
		document.getElementById('otherBankName').value = '';
		document.getElementById('otherBranchName').value = '';
	}
	
	function getBankList(name)
	{
		var ifscCode=  document.getElementById("iFSCCode").value;
   		var bankName=  document.getElementById("otherBankName").value;
    	var bankBranchName=  document.getElementById("otherBranchName").value;
    	var exceptional='<%= exceptionalCase%>';
    
    	if((null != ifscCode && ""!=ifscCode) ||(null !=bankName && ""!=bankName) || (null !=bankBranchName && ""!=bankBranchName)){
    	
      	  	if ("true"=='<%=checkboxIsNBFC%>'){
    			if ( /[^A-Za-z\s]/.test(bankName)) {
    				alert("Bank name should be characters only");
    		    	return (false);
    			}
    			if ( /[^A-Za-z\s]/.test(bankBranchName)) {
    				alert("Branch name should be characters only");
    		    	return (false);
    			}
      			document.forms[0].action="ManualInputCustomer.do?event="+name + "&bankName="+bankName+"&bankBranchName="+bankBranchName+"&checkboxIsNBFC=true&exceptionalCase="+exceptional;
      	    	document.forms[0].submit();
      	  	} else{
      	  		if(null != ifscCode && ""!=ifscCode){
	  				if ( /[^A-Za-z\d]/.test(ifscCode)) {
						alert("Please enter only alphanumeric characters");
	    				return (false);
					}
	  				if (ifscCode.length<9) {
						alert("Minimum Length of IFSC Code should be 9 characters");
	    				return (false);
					}
	  			}
      	  		if ( /[^A-Za-z\s]/.test(bankName)) {
					alert("Bank name should be characters only");
		    		return (false);
				}
				if ( /[^A-Za-z\s]/.test(bankBranchName)) {
					alert("Branch name should be characters only");
		    		return (false);
				}
      			//var name1="display_bank_list_in_edit_ifsc_code";  
      			document.forms[0].action="ManualInputCustomer.do?event="+name + "&ifscCode="+ifscCode+"&checkboxIsNBFC=false&exceptionalCase="+exceptional+"&bankBranch="+bankBranchName+"&bankName="+bankName;
      	    	document.forms[0].submit();
      	 	}
    	}else{
    		alert("Bank details will be mandatory Please Enter Bank Name or Branch Name Or IFSC Code");
    		return false; 
    	}
	}
	
	window.onload = function() {//    
		if("display_bank_list_ifsc_code"=='<%=event%>' 
			|| "display_bank_list_in_edit_ifsc_code"=='<%=event%>'
			|| "display_bank_list_in_resubmit_ifsc_code"=='<%=event%>')
			
			alert("alert ifscWsResponce : "+'<%=ifscWsResponce%>');
	}
</script>
</head>
<body>
<div class="table-scroll">
<table width="100%" height="100%" border="0" cellpadding="0"cellspacing="0">
	<html:form action="OtherBank.do">
		<input type="hidden" name="BankId" />
		<input type="hidden" name="startIndex" />
		<tr>
			<td width="100%" height="100%" valign="bottom">
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tblFormSection"
				id="contentWindow">
				<tr height="50%">
					<td valign="top" >

					<table width="96%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<tr>
							<td width="70%">
							<h3>Other Bank List</h3>
						</tr>
						
						<tr>
							<td colspan="6"  align="center"><hr/></td>
						</tr>
							
						<tr class="even">
							<td>
								<table id="111" border="0" cellpadding="0" cellspacing="0"
									width="100%" class="tblInfo">
									<tr>
										<td class="fieldname" width="10%">IFSC Code</td>
										<td width="20%"> 
										<%if("true".equals(checkboxIsNBFC)){ %>
											<html:text property="iFSCCode" styleId="iFSCCode"  maxlength="11" value="<%=ifscCode%>" disabled="true"></html:text>  
										<%}else{ %>
											<html:text property="iFSCCode" styleId="iFSCCode"  maxlength="11" value="<%=ifscCode%>" ></html:text>
										<%} %>
										</td>
										<td class="fieldname" width="10%" >Bank Name </td>
										<td  width="25%"><html:text property="otherBankName" styleId="otherBankName"  maxlength="25" value="<%=bankName%>"></html:text>   </td> 
										<td class="fieldname" width="15%">Bank Branch Name </td>
										<td width="20%"><html:text property="otherBranchName" styleId="otherBranchName"	 maxlength="15" value="<%=branchName%>" ></html:text>  </td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr class="even">
							<td>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td align="right">
								<input type="button" onclick="javascript:getClear()"
										name="clear" id="clear" value="  Clear  " class="btnNormal">
									
								<input type="button" onclick="getBankList('<%=event%>')"
										name="button2" id="button2" value="  Go  " class="btnNormal" >
							</td>
						</tr>
						<tr class="even">
							<td>&nbsp;</td>
						</tr>
									<tr>
										<td>
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<%if("true".equals(checkboxIsNBFC)){ %>
													<td width="10%">Bank Code</td>	
													<%}else{ %>
													<td width="10%">IFSC Code</td>	
													<%} %>
													<td width="10%">Bank Name</td>
													<td width="15%">Branch Name</td>
													<td width="15%">Address</td>
													<!-- <td width="10%">City</td>
													<td width="10%">State</td>
													<td width="10%">Region</td>
													<td width="10%">Country</td> -->
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>

												<logic:greaterThan name="listNewSize" value="0">
												
 	                                                     

										
										<logic:iterate id="OB" name="otherBranchList" type="com.integrosys.cms.app.otherbank.bus.OBOtherBank" scope="page"> 
										
										
										
														<%
														
														String key = String.valueOf(OB.getId());
													
															String rowClass = "";
																		no++;
																		if (no % 2 != 0) {
																			rowClass = "odd";
																		} else {
																			rowClass = "even";
																		}
														%>
														<tr class="<%=rowClass%>">
															<%
																bankId = Long.toString(OB.getId());
															%>
															<td class="index"><%=no+startIndex%></td>
															<%if("true".equals(checkboxIsNBFC)){ %>
															<td><%=OB.getOtherBankCode()  == null ? "&nbsp;" :OB.getOtherBankCode() %></td>
															<%}else{ %>
															<td><%=OB.getiFSCCode()  == null ? "&nbsp;" :OB.getiFSCCode() %></td>
															<%} %>
															<td><%=OB.getOtherBankName()  == null ? "&nbsp;" :OB.getOtherBankName()%></td>
															<%if("true".equals(checkboxIsNBFC)){ %>
																<td>-</td>	
															<%}else{ %>
																<td><%=OB.getBranchName()  == null ? "&nbsp;" :OB.getBranchName()%></td>
															<%} %>
															<td><%=OB.getBranchNameAddress()  == null ? "&nbsp;" :OB.getBranchNameAddress()%></td>
															<td>
															<center>
															<%if("true".equals(checkboxIsNBFC)){ %>
															<input type="checkbox" id="bank"
																value="<%=OB.getOtherBranchId()%>"></input>
															<%}else{ %>	
																	<%if(soretedMap != null && soretedMap.containsKey(OB.getiFSCCode())){%>
																		<input type="checkbox" id="bank" value="<%=OB.getiFSCCode()%>" disabled="disabled"></input>
																	<%}else{ %>
																		<input type="checkbox" id="bank" value="<%=OB.getiFSCCode()%>"></input>
																	<%} %>
															<%} %>
															</center>
															</td>

															<%-- <td><%=OB.getCity() == null ? "&nbsp;" : OB
								.getCity().getCityName()%></td>

															<td><%=OB.getState() == null ? "&nbsp;" : OB
								.getState().getStateName()%></td>

															<td><%=OB.getRegion() == null ? "&nbsp;" : OB
								.getRegion().getRegionName()%></td>

															<td><%=OB.getCountry() == null ? "&nbsp;" : OB
								.getCountry().getCountryName()%></td>
 --%>
														<%-- 	<td>
																<%if(map != null && map.containsKey(key))
														{%>
															<center><input type="checkbox" id="bank"
																value="<%=OB.getId()%>" disabled="disabled"></input></center>
															<%}else { %>
															<center><input type="checkbox" id="bank"
																value="<%=OB.getId()%>"></input></center>
															<%} %> --%>
															<!-- </td> -->

														</tr>
														
													</logic:iterate>
												</logic:greaterThan>
												<logic:equal name="listNewSize" value="0">
													<tr>
														<td colspan="13">Sorry,No Records Found</td>
													</tr>
												</logic:equal>
												
												
												
												
												
												<logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str);
										%>
										
											<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str%>"/>
										
										<%cnt++;
										%>
									</logic:iterate>
								</logic:present>
												
												
												
											</tbody>
										</table>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<%if(event.equals("display_bank_list") || event.equals("display_bank_list_ifsc_code")){ %>
										<td align="center"><a href="#"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
										<img src="img/save1.gif" name="ImageSave" width="70" height="20"
										border="0" id="ImageSave" onclick="javascript:saveOtherBank('save_other_bank')" /></a>
										<a href="#" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
										<img src="img/cancel1.gif" name="ImageCancel" width="70"
											height="20" border="0" id="ImageCancel" onclick="returnPage('display_banking_method_details')" /></a>
										</td><!-- display_financial_details -->
										<%}else if(event.equals("display_bank_list_in_edit") || event.equals("display_bank_list_in_edit_ifsc_code")){ %>
										<td align="center"><a href="#" onmouseout="MM_swapImgRestore()"
												onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
											<img src="img/save1.gif" name="ImageSave" width="70" height="20"
											border="0" id="ImageSave" onclick="javascript:saveOtherBank('save_other_bank_in_edit')" /></a>
											<a href="#" onmouseout="MM_swapImgRestore()"
												onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
											<img src="img/cancel1.gif" name="ImageCancel" width="70"
												height="20" border="0" id="ImageCancel" onclick="returnPage('edit_banking_method_details')" /></a>
										</td>
										<%}else if(event.equals("display_bank_list_in_resubmit") || event.equals("display_bank_list_in_resubmit_ifsc_code")){ %>
										<td align="center"><a href="#" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
											<img src="img/save1.gif" name="ImageSave" width="70" height="20"
											border="0" id="ImageSave" onclick="javascript:saveOtherBank('save_other_bank_in_resubmit')" /></a>
											<a href="#" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
											<img src="img/cancel1.gif" name="ImageCancel" width="70"
											height="20" border="0" id="ImageCancel" onclick="returnPage('process_banking_method_details')" /></a>
										</td>
										<%}else if(event.equals("view_other_bank_by_index")){ %>
										<td align="center"><a href="#"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
									<img src="img/save1.gif" name="ImageSave" width="70" height="20"
										border="0" id="ImageSave" onclick="javascript:saveOtherBank('save_other_bank')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
									<img src="img/cancel1.gif" name="ImageCancel" width="70"
										height="20" border="0" id="ImageCancel" onclick="returnPage('display_banking_method_details')" /></a>
									</td>
									<%}else if(event.equals("view_other_bank_by_index_in_edit")){ %>
									<td align="center"><a href="#"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
									<img src="img/save1.gif" name="ImageSave" width="70" height="20"
										border="0" id="ImageSave" onclick="javascript:saveOtherBank('save_other_bank_in_edit')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
									<img src="img/cancel1.gif" name="ImageCancel" width="70"
										height="20" border="0" id="ImageCancel" onclick="returnPage('edit_banking_method_details')" /></a>
									</td>
									<%}else if(event.equals("view_other_bank_by_index_in_resubmit")){ %>
									<td align="center"><a href="#"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
									<img src="img/save1.gif" name="ImageSave" width="70" height="20"
										border="0" id="ImageSave" onclick="javascript:saveOtherBank('save_other_bank_in_resubmit')" /></a>
									<a href="#" onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
									<img src="img/cancel1.gif" name="ImageCancel" width="70"
										height="20" border="0" id="ImageCancel" onclick="returnPage('process_banking_method_details')" /></a>
									</td>
									<%}%>
									</tr>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>
						
				

	</table>
	</td></tr>
						
					</table>

					</td>
				</tr>
		<tr id="generalPurposeBarTR">
<td height="25">
	<table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">

	<%--<tr>
   
 <%
                            String pageIndexUrl=null;
 if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker")){
                                pageIndexUrl = "ManualInputCustomer.do?event=list_customer_checker&startIndex=";
 }else{
	 pageIndexUrl = "ManualInputCustomer.do?event=view_other_bank_by_index&BankId="+BankId+"&startIndex=";
 }
                           
                        %>
<% if (resultNewList!=null) { %>

 
              <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
	<td valign="middle">  
	 <integro:pageindex pageIndex='<%=new PageIndex(startIndex,10, resultNewList.size())%>'
	 					url='<%=pageIndexUrl%>'/>             
	</td>
<% } %>
	 </tr>
			--%></table>

			</td>
		</tr>


<html:hidden name="ManualInputCustomerInfoForm" property="iFSCCode" />
<html:hidden name="ManualInputCustomerInfoForm" property="bankBranchName" />
<html:hidden name="ManualInputCustomerInfoForm" property="branchNameAddress" />
<html:hidden name="ManualInputCustomerInfoForm" property="finalBankMethodList" />
		<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="domicileCountry" value="IN" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="customerNameShort" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
		<html:hidden name="ManualInputCustomerInfoForm" property="email" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="customerBranch" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="customerSegment" />
		<html:hidden name="ManualInputCustomerInfoForm" property="status" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="partyGroupName" />
			<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
 		<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />				
		<html:hidden name="ManualInputCustomerInfoForm"
			property="relationshipMgr" />
		<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
		<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
		<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="rbiIndustryCode" />
		<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
		<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	    <html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	    <html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />	
	    <html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" /> 	
		<html:hidden name="ManualInputCustomerInfoForm"
			property="industryName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
		<html:hidden name="ManualInputCustomerInfoForm" property="region" />
		<html:hidden name="ManualInputCustomerInfoForm" property="country" />
		<html:hidden name="ManualInputCustomerInfoForm" property="state" />
		<html:hidden name="ManualInputCustomerInfoForm" property="city" />
		<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
		<html:hidden name="ManualInputCustomerInfoForm" property="telex" />


		<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="bankingMethod" />
		<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />	
		<html:hidden name="ManualInputCustomerInfoForm"
			property="totalFundedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="totalNonFundedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="fundedSharePercent" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="nonFundedSharePercent" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="memoExposure" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="totalSanctionedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="fundedShareLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
			property="nonFundedShareLimit" />
			<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />

		<!--End Santosh LEI CR  -->	
		<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
			<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeState" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeState" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="borrowerDUNSNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity1" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity2" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity3" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="willfulDefaultStatus" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitFilledStatus" />

	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfSuit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="suitAmount" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="branchCode" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="bankBranchId" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="event" />
		
		
		<html:hidden name="ManualInputCustomerInfoForm" property="directorName" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="isRBIWilfulDefaultersList" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="nameOfBank" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isDirectorMoreThanOne" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="nameOfDirectorsAndCompany" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfDefault" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="extOfCompromiseAndWriteoff" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isCibilStatusClean" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfCleanCibil" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isBorrDefaulterWithBank" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="leadValue" />
		<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
		<jsp:include page="cri_hidden_details.jsp"></jsp:include>
		<jsp:include page="udf_hidden_details.jsp"></jsp:include>
	</html:form>
</table>
</div>
</body>
</html>

