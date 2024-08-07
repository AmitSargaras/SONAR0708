<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm,
				com.integrosys.cms.ui.manualinput.customer.CoBorrowerDetailsForm,
				org.springframework.util.CollectionUtils,
				java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
List<CoBorrowerDetailsForm> coBorrowerList = form.getCoBorrowerDetails();
pageContext.setAttribute("coBorrowerList", coBorrowerList);
String event = form.getEvent();
String coBorrowerDetailsInd = form.getCoBorrowerDetailsInd();
String isCoBorrowerListEmpty = CollectionUtils.isEmpty(coBorrowerList) ? "Y" : "N" ;
%>

<script type="text/javascript">

var coBorrowerDetailsInd = '<%=coBorrowerDetailsInd%>';
var isCoBorrowerListEmpty = '<%=isCoBorrowerListEmpty%>';

window.onload = function() {
	refreshCoBorrowerDetailsCheckbox();
}

function refreshCoBorrowerDetailsCheckbox(){
	//console.log("coBorrowerDetailsInd: "+coBorrowerDetailsInd);
	if(coBorrowerDetailsInd === 'Y'){
		document.getElementById("check_coBorrower").checked = true;
	}else{
		document.getElementById("check_coBorrower").checked = false;
	}
	if(isCoBorrowerListEmpty === 'Y'){
		document.getElementById("check_coBorrower").disabled = false;
	}else{
		document.getElementById("check_coBorrower").checked = true;
		document.getElementById("check_coBorrower").disabled = true;
	}
}
function setCoBorrowerDetailsCheckbox(){
	
	if(document.getElementById("check_coBorrower").checked){
		document.getElementById("check_coBorrower").checked = true;
		document.getElementById("check_coBorrower").value = "Y";
		document.getElementById("coBorrowerDetailsInd").value = "Y";
	}else{
		document.getElementById("check_coBorrower").checked = false;
		document.getElementById("check_coBorrower").value = "N";
		document.getElementById("coBorrowerDetailsInd").value = "N";
	}
	//console.log("coBorrowerDetailsInd after set: "+document.getElementById("check_coBorrower").value+", "+document.getElementById("coBorrowerDetailsInd").value)
}

function addCoBorrowerDetails() {
	if(coBorrowerValidator()){
	    document.forms[0].action="ManualInputCustomer.do?event=update_session_add_co_borrower_details";
	    document.forms[0].submit();
	}	
}

function coBorrowerDeatilsAction(selectedObj, index) {
	var action = selectedObj.options[selectedObj.selectedIndex].value;
	//console.log("action: "+action+", index: "+index+", event: "+event);
	document.forms[0].fromPage.action=event;
	if(action === "VIEW") {
		document.forms[0].action="ManualInputCustomer.do?event=update_session_view_co_borrower_details&index="+index;
		document.forms[0].submit();
	}else if(action === "EDIT") {
		document.forms[0].action="ManualInputCustomer.do?event=update_session_edit_co_borrower_details&index="+index;
		document.forms[0].submit();
	}else if(action === "DELETE") {
		document.forms[0].action="ManualInputCustomer.do?event=update_session_remove_co_borrower_details&index="+index;
		document.forms[0].submit();
	}
}
	
function coBorrowerValidator(){
	var coBorrowerDetailsRows = document.getElementsByName("coBorrower_body");
	var check_coBorrower = document.getElementById("check_coBorrower").checked;
	
	if(!check_coBorrower){
		document.getElementById("coBorrowerError")
		.innerHTML = "<font color=red>Please Select Co-Borrower Details checkbox to add new</font>";
		return false;
	}
	
	if (coBorrowerDetailsRows.length === 5) {
		document.getElementById("coBorrowerError")
		.innerHTML = "<font color=red>Maximum 5 Co-Borrowers are allowed</font>";
		return false;
	}
	return true;
}
</script>

<input type="hidden" name="fromPage" value="<%=event%>"/>

		<tr id="coBorrowerDetailsBlockHeader" style="display: none;">
			
			<td align="right">
				<h3 align="left">Co-Borrower Details
				<input type="checkbox" id="check_coBorrower" name="coBorrowerDetailsInd" value="<%=form.getCoBorrowerDetailsInd()%>" onclick="setCoBorrowerDetailsCheckbox()" /></h3>
				<html:errors property="coBorrowerDetailsIndError" />
				<html:errors property="coBorrowerDetailsDeleteError" />
				<input onclick="addCoBorrowerDetails()" type="button" name="Submit" value="Add Co-Borrower Details" class="btnNormal" />
			</td>
			
			<tr id="coBorrowerDetailsBlock" style="display: none;">
				<td><span id="coBorrowerError"></span>
					<table id="coBorrowerDetailsId" border="0" cellpadding="0" cellspacing="0"
						class="tblinfo" style="margin-top: 0" width="100%"
						align="center">
						<thead>
							<tr>
								<td>S/N</td>
								<td>Co-Borrower Liab Id</td>
								<td>Co-Borrower Name</td>
								<td>Action</td>
							</tr>
						</thead>
						<tbody >
							<logic:present name="coBorrowerList">
								<logic:iterate id="coBorrower" name="coBorrowerList" indexId="coBorrowerIndex"
									type="com.integrosys.cms.ui.manualinput.customer.CoBorrowerDetailsForm"
									scope="page">
	
									<tr name="coBorrower_body" class="<%=(coBorrowerIndex++)%2 == 0 ? "even" : "odd" %>">
										<td class="index"><%=coBorrowerIndex%></td>
										<td>
											<center>
												<bean:write name="coBorrower" property="coBorrowerLiabId" />
											</center>
										</td>
										<td>
											<center>
												<bean:write name="coBorrower" property="coBorrowerName" />
											</center>
										</td>
										<td>
											<center>  
												<select name="menu1" onchange="coBorrowerDeatilsAction(this,'<%=coBorrowerIndex%>')">
				                                      <option value="#" selected>Please Select</option>
				                                      <option value="VIEW">View</option>
				                                    <!--   <option value="EDIT">Edit</option> -->
				                                      <option value="DELETE">Delete</option>
	                               				</select> 
	                               			</center> 
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
							<logic:notPresent name="coBorrowerList">
								<tr class="odd">
									<td colspan="8"><bean:message key="label.global.not.found" /></td>
								</tr>
							</logic:notPresent>
						</tbody>
					</table>
				</td>
			</tr>
		</tr>	