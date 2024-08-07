<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@ page import="com.integrosys.cms.ui.customer.CustomerSearchForm,
                 java.util.Collection, java.util.*,
                 com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingForm,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.AgreementTypeList"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/CustomerList.jsp,v 1.39 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.39 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    System.out.println("Entered CustomerList.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
  // System.out.println("value of records_per_page"+records_per_page);
%>

<%
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);
    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR ) {
      isMR = true;
    } else if (teamTypeID == ICMSConstant.TEAM_TYPE_SSC) {
        isSAC = true;
    }
    
    ValuationAmountAndRatingForm aForm;
    
    aForm = (ValuationAmountAndRatingForm) request.getAttribute("ValuationAmountAndRatingForm");
    System.out.println("aForm ==> "+aForm);
    if (aForm == null) {
    	System.out.println("========...>>>>>>>");
    	aForm = (ValuationAmountAndRatingForm) request.getAttribute("CustodianSearchForm");
    }
    
    
    String rowClass = "";
    String val1="";
    ArrayList arrlist1 = new ArrayList();
    int cnt=0;
    List customerPartyName = (ArrayList)request.getAttribute("customerNameAndIdList");
    if(customerPartyName != null && !customerPartyName.isEmpty()){
    	System.out.println("Party Name "+customerPartyName.get(0));
    	ArrayList arrlist=(ArrayList)customerPartyName.get(0);
    	for(int i=0;i<arrlist.size();i++){
    		val1=(String)arrlist.get(i);
    		System.out.println("arrlist values = "+val1);
    	}
    }else{
    	System.out.println("Party Name and Id is Null === ");
    }
    request.setAttribute("customerNameAndIdList", customerPartyName);
    String event =(String) request.getAttribute("event");
    System.out.println("Event ==>"+event);
    
 %><html>
<head>


<script language="JavaScript">
<!--
    function gotoPage() {
	    parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].cusName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
        document.forms["ReportForm"].startIndex.value=ind;
        document.forms["ReportForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["ReportForm"].customerName.value=ind;
		if (ind == '')
		{
			document.forms["ReportForm"].all.value = 'Y';
		}        
        document.forms[0].indicator.value='*';
        document.forms["ReportForm"].startIndex.value=0;
        document.forms["ReportForm"].submit();
    }
    function goPage(pageNo){
	    document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
    }
    function submitForm(){
		/* var isadded =addItems();
		if(isadded){
			formObj = document.forms["ReportForm"];
	        formObj.event.value = "submit";
	    	formObj.submit();
		}else{
						return false;
		} */
	
    	var url;
    	var partyName;
    	var partyId;
    	var addPartyInfoList1 = new Array();
    	var addPartyInfoList = [];
    	var partyidAdded="";
    	var event1 = '<%=event%>';
    var silength = <%=customerPartyName.size()%>;
   // alert(silength);
    for(var j=0 ; j<silength;j++){
    	if(document.getElementById("selected"+(j+1)).checked){
    		addPartyInfoList1 = [];
    		partyName = document.getElementById("partyKey"+(j+1)).innerHTML;
    		partyName = partyName.replace("</A>","");
    		partyName = partyName.replace("</a>","");
    		var n = partyName.indexOf("<");
    		var m = partyName.indexOf(">");
    		var res = partyName.substring(n, m+1);
    		partyName = partyName.replace(res,"");
    		partyId = document.getElementById("partyKeys"+(j+1)).innerHTML;
    		//addPartyInfoList1.push(partyName);
        	addPartyInfoList1.push(partyId);
        	addPartyInfoList.push(addPartyInfoList1);
        	partyidAdded = partyidAdded + partyId +",";
    	}
    }
   // alert(partyidAdded);
   // console.log(addPartyInfoList);
     
   /*  formObj = document.forms["ValuationAmountAndRatingForm"];
    formObj.event.value = "submitCustomer";
    url = 'valuationAmountAndRating.do?event=submitCustomer&customersIdList='+addPartyInfoList;
    formObj.action = url;
    //formObj.excludePartyId.value = addPartyInfoList;
	formObj.submit(); */
	//alert(formObj.excludePartyId.value);
	//url = 'valuationAmountAndRating.do?event=submitCustomer&customersIdList='+partyidAdded;
	if(event1 == 'listEdit'){
		url = 'valuationAmountAndRating.do?event=submitCustomerEdit&customersIdList='+partyidAdded;
		document.forms["ValuationAmountAndRatingForm"].event.value = "submitCustomerEdit";
    }else if(event1 == 'list'){
    	url = 'valuationAmountAndRating.do?event=submitCustomer&customersIdList='+partyidAdded;
    	document.forms["ValuationAmountAndRatingForm"].event.value = "submitCustomer";
    }else if(event1 == 'listDraft'){
    	url = 'valuationAmountAndRating.do?event=submitCustomerDraft&customersIdList='+partyidAdded;
    	document.forms["ValuationAmountAndRatingForm"].event.value = "submitCustomerDraft";
    }else if(event1 == 'listRejected'){
    	url = 'valuationAmountAndRating.do?event=submitCustomerRejected&customersIdList='+partyidAdded;
    	document.forms["ValuationAmountAndRatingForm"].event.value = "submitCustomerRejected";
    }else{
    	url = 'valuationAmountAndRating.do?event=submitCustomerDeleteRejected&customersIdList='+partyidAdded;
    	document.forms["ValuationAmountAndRatingForm"].event.value = "submitCustomerDeleteRejected";
    }
	//document.forms["ValuationAmountAndRatingForm"].event.value = "submitCustomer";
	document.forms["ValuationAmountAndRatingForm"].action = url;
	//document.forms["ValuationAmountAndRatingForm"].excludePartyId.value = addPartyInfoList;
	document.forms["ValuationAmountAndRatingForm"].submit();
	
	}
    
    
    
    
    function canclePage(){
		
	    /* formObj.event.value = "cancleFilter";
	   	formObj.submit(); */
	   	//formObj = document.forms["ValuationAmountAndRatingForm"];
	   	/* alert(document.forms["ValuationAmountAndRatingForm"].criteria.value);
    	var url="valuationAmountAndRating.do?event=maker_prepare_create_valuation_amount_and_rating";
    	document.forms[0].action=url;
    	    document.forms[0].submit(); */
    	    var event1 = '<%=event%>';
    	    
    	    formObj = document.forms["ValuationAmountAndRatingForm"];
			if(event1 == 'listEdit'){
				formObj.event.value = "cancleEdit";
    	    }else if(event1 == 'list'){
    	    	formObj.event.value = "cancle";
    	    }else if(event1 == 'listDraft'){
    	    	formObj.event.value = "cancleDraft";
    	    }else if(event1 == 'listRejected'){
    	    	formObj.event.value = "cancleRejected";
    	    }else{
    	    	formObj.event.value = "cancleDeleteRejected";
    	    }
    	    //formObj.event.value = "cancle";
    	   	formObj.submit();
	}
    function setCustomer() {
        var custId;
       
        custId=document.getElementById("12").value;
		  alert(custId);
       
    }
    function addItems(){
        var formObj = document.forms[0];
    	var k = 0;
    	var temp = "";
    	for (var i=0; i<formObj.elements.length; i++) {
          var type = formObj.elements[i].type;
          if (type == 'radio') {
    		k++;
    	  }
    	}
        j = 0;
    	if( k > 1) {
    	    for (var i=0; i<formObj.elements.length; i++) {
    		  var type = formObj.elements[i].type;
    	      if (type == 'radio') {
    	        var obj = formObj.elements[i];
    		    if (obj.checked) {
//    				alert(formObj.itemID[j].value);
    				temp = temp + "," + formObj.itemID[j].value;
    			}
    			j++;
    	      }
    		}
    	} else {
    	    for (var i=0; i<formObj.elements.length; i++) {
    		  var type = formObj.elements[i].type;
    	      if (type == 'radio') {
    	        var obj = formObj.elements[i];
    		    if (obj.checked) {
//    				alert(formObj.itemID.value);
    				temp = temp + "," + formObj.itemID.value;
    			}
    	      }
    		}
    	}
//        alert('j'+j);
        if(temp==""){
            alert('Please select atleast one to save.');
            return false;
        }
    	temp=temp.substring(1);
    //	alert(temp);
    	formObj.hiddenItemID.value=temp;
    	return true;
    }
-->
</script>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="valuationAmountAndRating">

<input type="hidden" name="customerName" >
<input type="hidden" name="legalName" >
<input type="hidden" name="hiddenItemID" />
<input type="hidden" name="indicator" >
<input type="hidden" name="all">
<input type="hidden" name="event">

         <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

<thead>
								<tr>
									<td>
									<h3>customer search</h3>
													</td>
								</tr>
								<tr>
									<td>
									<hr />
									</td>
								</tr>
								<tr></tr>
							</thead>
							<tbody>
<tr>
						<td>

						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
						<thead>
               			 </thead>
							<tbody>
								<tr>


									<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="tblInfo">
										<thead>
											<tr>
												<td width="15%">S/N</td>
												<td width="35%" nowrap="nowrap">Party Name</td>
												
												<td width="20%">Party Id</td>
												
												<td width="15%">Select </td>
												
											</tr>
										</thead>
										<tbody>
											<%int counter1 = 0; 
											//int cnt=0;
											if(customerPartyName.size()>0){
											%>
											
												<logic:iterate id="obValuationAmountAndRating" name="customerNameAndIdList" scope="request" 
												>
													<%
																					counter1++;
																					if (counter1 % 2 != 0) {
																						rowClass = "odd";
																					} else {
																						rowClass = "even";
																					}
																					arrlist1 = (ArrayList)customerPartyName.get(counter1-1);
																					
																	%>
													<tr class=<%=rowClass%>>
														<td class="index" width="5%"><%=counter1%></td>
														<td width="35%" id="partyKey<%=counter1%>" value="<%=arrlist1.get(cnt)%>"><%=arrlist1.get(cnt)%></td>
														<td width="20%" id="partyKeys<%=counter1%>" value="<%=arrlist1.get(cnt+1)%>"><%=arrlist1.get(cnt+1)%>
														</td>
												 <td width="15%"><input type="checkbox" id="selected<%=counter1%>" name="selected"
											<%-- <td width="15%"><input type="radio" id="selected<%=counter1%>" name="selected"   --%>
															value="<%=(counter1)%>"
															 />
												</td>
														</tr>
														</logic:iterate>
														<%}else{ %>
														
												<tr>
													<td colspan="4">No Record Found</td>
												</tr>
											<%} %>
														</tbody>
														

									</table>
									</td>
									<td></td>

								</tr>
								
								
							</tbody>
		 </table>
		 <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image12" width="75" height="22" border="0" id="Image12" /></a></td>
	
    <td>
	    <a href="javascript:canclePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
			<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
		</a>
    </td>
	

  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
 </td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->
        

</table>

</body>
</html>
