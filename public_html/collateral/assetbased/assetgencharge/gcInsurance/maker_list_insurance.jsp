<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ICollateralTrxValue itrxValue2 = (ICollateralTrxValue) session
			.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	List insuranceList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceList");
	HashMap actualMap = (HashMap) request.getAttribute("actualMap");

	HashMap stageMap = (HashMap) request.getAttribute("stageMap");
	List componentList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.componentList");
	List companyList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
	String dp1 = (String) request.getAttribute("calculatedDP");
	String event1 = (String) request.getParameter("event");

	if (event1.equalsIgnoreCase("maker_create_insurance")
			|| event1.equalsIgnoreCase("maker_cancle_create_insurance")
			|| event1.equalsIgnoreCase("process_update") || event1.equalsIgnoreCase("prepare_update")
			|| event1.equalsIgnoreCase("update_return") || event1.equalsIgnoreCase("view_stocks")
			|| event1.equalsIgnoreCase("submit") || event1.equalsIgnoreCase("prepare")
			|| event1.equalsIgnoreCase("maker_delete_list_insurance") || event1.equalsIgnoreCase("prepare")
			|| event1.equalsIgnoreCase("maker_edit_list_insurance") || event1.equalsIgnoreCase("read")
			|| event1.equals("prepare_close") || event1.equals("process")
			|| event1.equals("maker_edit_cancle_insurance") || event1.equals("maker_return_view_insurance")

			|| event1.equalsIgnoreCase("maker_submit_insurance_received")
			|| event1.equalsIgnoreCase("maker_submit_insurance_pending")
			|| event1.equalsIgnoreCase("maker_submit_insurance_waived")
			|| event1.equalsIgnoreCase("maker_submit_insurance_deferred")

			|| event1.equalsIgnoreCase("maker_cancle_submit_insurance")
			|| event1.equalsIgnoreCase("maker_edit_insreceived_list")

			|| event1.equalsIgnoreCase("maker_update_insreceived_list")
			|| event1.equalsIgnoreCase("maker_update_inspending_list")
			|| event1.equalsIgnoreCase("maker_update_inswaived_list")
			|| event1.equalsIgnoreCase("maker_update_insdeferred_list")
			|| event1.equalsIgnoreCase("maker_edit_cancle_insstatus")
			|| event1.equalsIgnoreCase("return_from_due_date_and_stock")
			|| event1.equalsIgnoreCase("maker_return_from_submit_insurance")
			|| event1.equalsIgnoreCase("return_from_view_due_date_and_stock")) {
		pageContext.setAttribute("insuranceList", insuranceList);
		pageContext.setAttribute("componentList", componentList);
		pageContext.setAttribute("companyList", companyList);
		pageContext.setAttribute("actualMap", actualMap);

	}

	int lno = 0;
	boolean isMaker = false;
	boolean isChecker = false;
	ICommonUser user1 = (ICommonUser) session
			.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
					+ IGlobalConstant.USER);
	if (user1.getTeamTypeMembership().getMembershipID() == 1006 || user1.getTeamTypeMembership().getMembershipID() == 1013 || user1.getTeamTypeMembership().getMembershipID() == 1001) {
		isMaker = true;
	} else {
		isChecker = true;
	}

	OBInsuranceGC actual = null;
	OBInsuranceGC stage = null;
%>

<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page
	import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>

<input type="hidden" name="referrerEvent" value="${requestScope['AssetGenChargeForm'].event}"/>
<input type="hidden" name="collateralID" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Document</title>

<script language="JavaScript" type="text/JavaScript">

function viewInsuranceHistory(){
    document.forms[0].action="AssetGenChargeCollateral.do?event=update_session_view_insurance_history&parentPageFrom="+parentPageFrom;
    document.forms[0].collateralID.value=<%=itrxValue2.getReferenceID()%>;
    document.forms[0].submit();
}

function createInsurance() {
	
	var typeOfCharge = document.forms[0].typeOfCharge.value;
 	//document.forms[0].action="AssetInsuranceCollateral.do?event=maker_prepare_create_insurance&securityId=<%=itrxValue2.getReferenceID()%>;
 	
 	document.forms[0].action="AssetGenChargeCollateral.do?event=save_cersai_to_session&securityId=<%=itrxValue2.getReferenceID()%>&typeOfCharge="+typeOfCharge;
 	document.forms[0].submit();
 	
 	<%-- document.forms[0].action="AssetInsuranceCollateral.do?event=maker_add_insurance&securityId=<%=itrxValue2.getReferenceID()%>&typeOfCharge="+typeOfCharge;
    document.forms[0].submit(); --%>
}
function selectCheck(){
	alert("selected length is"+document.forms[0].selected.length);
	 var arr = new Array();	
	if(document.forms[0].selected.length==undefined){
		if(document.forms[0].selected.checked)
	       {  
	    	   arr[0] = document.forms[0].selected.value;
	    	  
	       }
	}
	
}

/*
function editInsuranceDetail(event,insuranceCode,calculatedDP,id) {
	var event = event;

	var fundedShare = document.forms[0].fundedShare.value;
	var calculatedDP = document.forms[0].calculatedDP.value;
	var dueDate = document.forms[0].dueDate.value;
	var insuranceCode = insuranceCode;
	var id = id;
	var calculatedDP = calculatedDP;
	document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_edit_insurance_read&insuranceCode="+insuranceCode;
    document.forms[0].submit();
   return action;
} */

function editInsuranceDetail(obj,insuranceCode,calculatedDP,id) {

	var insuranceCode = insuranceCode;
	var id = id;

	var actionType = obj.value;
	if('UPDATE_RECEIVED' == actionType){
	document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_update_insurance_received&insuranceCode="+insuranceCode;
	document.forms[0].submit(); 
	}else if('VIEW_RECEIVED' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_view_insurance_received&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}else if('DEFER' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_update_insurance_deferred&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}else if('VIEW_DEFERRED' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_view_insurance_deferred&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}else if('WAIVER' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_update_insurance_waived&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}else if('VIEW_WAIVED' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_view_insurance_waived&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}else if('UPDATE' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_update_insurance_pending&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}else if('VIEW_AWAITING' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_view_insurance_pending&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
	}if('RECEIVE' == actionType){
		document.forms[0].action ="AssetInsuranceCollateral.do?event=maker_edit_insurance_received&insuranceCode="+insuranceCode;
		document.forms[0].submit(); 
		}	
   return action;
}	


function toggleSelectAll() {
	
	//alert("srf"+document.forms[0].selectedArray.value);
	
	var c_value = "";
	var toggleSelect = false;
	if(document.forms[0].selected.length==undefined ){
		if(!document.forms[0].selected.checked)
			toggleSelect=true;
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (!document.forms[0].selected[i].checked)
		      {
			   toggleSelect=true;
		      }
		   }
	}
	
	if(toggleSelect){
		document.forms[0].list11.checked=false;
	}else{
		document.forms[0].list11.checked=true;
	}
	
}


function deleteInsurance(){

	var s_value = "";
	var n_value = "";
	
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      s_value = s_value + document.forms[0].selected[i].value + "-";
		      }else{
		    	  n_value = n_value + document.forms[0].selected[i].value + "-";
		      }
		   }
	}
//document.forms[0].action="AssetInsuranceCollateral.do?event=maker_delete_list_insurance&collateralID=<%=itrxValue2.getReferenceID()%>&select="+s_value;
	
document.forms[0].action="AssetInsuranceCollateral.do?event=maker_delete_list_insurance&collateralID=<%=itrxValue2.getReferenceID()%>&select="+s_value;
document.forms[0].submit();

	
}
function checkedAllInsurance(){ 
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

</head>
<body>


	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="82%"><h3>Insurance Details</h3></td>
				<td width="18%" align="right" valign="bottom"></td>
				<%
					if ((isMaker) && !event1.equals("prepare_close")) {
				%>
				
				<tr>
				<td colspan="2"></td>
				<td valign="baseline"><input type="button"
					name="Submit" value="Add New" class="btnNormal"
					onclick="createInsurance()" /></td>
				<td valign="baseline"><input type="button" name="Submit" value="Remove"
					class="btnNormal" onclick="deleteInsurance()" style="margin-left: 10px;" /></td>
				</tr>
				
				<%
					} else {
				%>
				<%
					}
				%>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4">
					<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
							<tr>
								<td width="5%">S/N</td>
								<td width="15%">Status</td>
								<td width="10%">Due Date</td>
								<td width="15%">Insurance Policy No.</td>
								<td width="15%">Insurance Company Name</td>
								<td width="10%">Insured Amount</td>
								<!-- <td width="15%">Component Name</td>
                                  <td width="15%">Insurance Company</td>  
                                   <td width="10%">Policy Number</td>
                                   <td width="10%">Policy Amount</td>
                                   <td width="10%">Insured Amount</td>
                                   <td width="10%">Effective Date</td> -->
								<td width="10%">Expiry Date</td>
								<td width="10%">Action</td>
								<td width="10%">Delete <%
									if (insuranceList != null && insuranceList.size() > 0) {
								%> <input type="checkbox" name="list11" id="list11"
									value="Check All" onClick="checkedAllInsurance()" /> <%
 	}
 %>
								</td>

							</tr>
						</thead>
						<tbody>
							<logic:present name="insuranceList">
								<logic:iterate id="ob" name="insuranceList" indexId="counter"
									type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC"
									scope="page">
									<%
										String rowClass = "";
												lno++;
												if (lno % 2 != 0) {
													rowClass = "odd";
												} else {
													rowClass = "even";
												}
												// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());

												actual = (OBInsuranceGC) actualMap.get(String.valueOf(ob.getInsuranceCode()));
												stage = (OBInsuranceGC) stageMap.get(String.valueOf(ob.getId()));
									%>
									<tr class="<%=rowClass%>">

										<td
											class="
                               <%if (ob.getIsProcessed().equals("Y") && ob.getDeprecated().equals("N")) {%>index<%}

					if ((ob.getIsProcessed().equals("N") || ob.getIsProcessed().equals("DD")
							|| ob.getIsProcessed().equals("DE")) && ob.getDeprecated().equals("Y")) {%>indexdel<%}
					if ((ob.getIsProcessed().equals("N") || ob.getIsProcessed().equals("DA"))
							&& ob.getDeprecated().equals("N")) {%>indexadd<%}
					if (ob.getIsProcessed().equals("YR") && ob.getDeprecated().equals("Y")) {%>indexdel<%}
					if ((ob.getIsProcessed().equals("NM") || ob.getIsProcessed().equals("DE"))
							&& ob.getDeprecated().equals("N")) {%>indexdiff<%}
					if (ob.getIsProcessed().equals("YR") && ob.getDeprecated().equals("N")) {
						if ((stage != null && actual != null)
								&& stage.getInsuranceCode().equals(actual.getInsuranceCode())) {%>indexdiff<%} else {%>indexadd<%}
					}%>">



											<%=counter.intValue() + 1%></td>
										<%--  <%  
                               	if (ob.getInsuranceRequired().equals("All")){ 
                               %>
                               <td>All</td>
                               <%
                               	} else if (ob.getInsuranceRequired().equals("Component_wise")
                               					&& componentList.size() > 0) {
                               				LabelValueBean lvb1 = new LabelValueBean();
                               				String valueCode = "";
                               				
                               				String[] abc = ob.getSelectComponent().split("-");
                               				List selectList = Arrays.asList(abc);
                               				StringBuffer result = new StringBuffer();
                               				for (int i = 0; i < componentList.size(); i++) {
                               					for (int j = 0; j < selectList.size(); j++) {
                               						LabelValueBean lvb = (LabelValueBean) componentList.get(i);
                               						String selctVal = (String) selectList.get(j);
                               						String lable = lvb.getLabel();
                               						String value = lvb.getValue();
                               						if (selctVal.equals(value)) {
														if(valueCode.equals("")){
															valueCode=valueCode+lable;
														}else{
															valueCode= valueCode+",";
															valueCode=valueCode+lable;
														}
                               							
                               						}
                               						//lvb1.setLabel(result.toString());
                               					}
                               				}
                               %>
                               <td><%=valueCode.toString()%></td> --%>
										<%
											//    	}   
													LabelValueBean company = new LabelValueBean();
													for (int k = 0; k < companyList.size(); k++) {
														LabelValueBean lvb = (LabelValueBean) companyList.get(k);
														if (lvb.getValue().equals(ob.getInsuranceCompany())) {
															company.setLabel(lvb.getLabel());
														}
													}
										%>

										<td>
											<center>
												<%
													if ("UPDATE_RECEIVED".equals(ob.getInsuranceStatus())) {
												%>
												<integro:empty-if-null value="PENDING_RECEIVED" />
												<%
													} else if ("AWAITING".equals(ob.getInsuranceStatus())) {
												%>
												<integro:empty-if-null value="PENDING" />
												<%
													} else {
												%>
												<integro:empty-if-null value="<%=ob.getInsuranceStatus()%>" />
												<%
													}
												%>
											</center>
										</td>
										<%
											DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
													String dueDate1 = "";

													if (null != ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("DEFER")) {
														if (null != ob.getNextDueDate()) {
															dueDate1 = df1.format(ob.getNextDueDate());
														}
													} else if (null != ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("WAIVE")) {

													} else if (null != ob.getOriginalTargetDate()) {
														dueDate1 = df1.format(ob.getOriginalTargetDate());
													}
										%>
										<td>
											<center>
												<integro:empty-if-null value="<%=dueDate1%>" />
											</center>
										</td>
										<td>
											<center>
												<integro:empty-if-null
													value="<%=ob.getInsurancePolicyNo()%>" />
											</center>
										</td>

										<td>
											<center>
												<integro:empty-if-null value="<%=company.getLabel()%>" />
											</center>
										</td>

										<!--  <td>
                               <center><integro:empty-if-null
												value="<%=UIUtil.formatWithCommaAndDecimal(ob.getInsurancePolicyAmt())%>" /></center>
                               </td>  -->
										<td>
											<center>
												<integro:empty-if-null
													value="<%=UIUtil.formatWithCommaAndDecimalNew(ob.getInsuredAmount())%>" />
											</center>
										</td>
										<%
											DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
														String effectiveDate = "";
														String expiryDate = "";
														if (ob.getEffectiveDate() != null) {
															effectiveDate = df.format(ob.getEffectiveDate());
														}
														if (ob.getExpiryDate() != null) {
															expiryDate = df.format(ob.getExpiryDate());
														}
										%>
										<!--   <td>
                                <center><integro:empty-if-null
												value="<%=effectiveDate%>" /></center>
                               </td>  -->
										<td>
											<center>
												<integro:empty-if-null value="<%=expiryDate%>" />
											</center>
										</td>
										<td>
											<%--<select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                          <option
										value='AssetInsuranceCollateral.do?event=maker_view_ins_edit&insuranceCode=<%=ob.getInsuranceCode()%>&calculatedDP=<%=dp1%>'>View</option>
									<%
										if (!ob.getDeprecated().equals("Y")) {
									%>
                                      <option value='AssetInsuranceCollateral.do?event=maker_edit_insurance_read&insuranceCode=<%=ob.getInsuranceCode()%>&calculatedDP=<%=dp1%>'>Edit</option>
                           <%}%>
                               </select> --%> <%
 	if (!ob.getDeprecated().equals("Y")) {
 						String insurancecode = ob.getInsuranceCode();
 						String id = String.valueOf(ob.getId());

 						String tempStr = "editInsuranceDetail(this,'" + insurancecode + "','" + dp1 + "','" + id
 								+ "')";
 %> <!--  <center> <a href="javascript:editInsuranceDetail('maker_edit_insurance_read','<%=ob.getInsuranceCode()%>','<%=dp1%>','<%=String.valueOf(ob.getId())%>')">View / Edit</a></center> -->
											<html:select property="actionType" onchange='<%=tempStr%>'>
												<option value="">Please Select</option>
												<%
													if ("AWAITING".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_AWAITING">VIEW</option>
												<option value="RECEIVE">RECEIVED</option>
												<option value="UPDATE">UPDATE</option>
												<option value="DEFER">DEFERRED</option>
												<option value="WAIVER">WAIVED</option>
												<%
													}
																			if ("RECEIVED".equalsIgnoreCase(ob.getInsuranceStatus())
																					|| "UPDATE_RECEIVED".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_RECEIVED">VIEW</option>
												<option value="UPDATE_RECEIVED">UPDATE</option>
												<%
													}
																			if ("DEFERRED".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_DEFERRED">VIEW</option>
												<option value="RECEIVE">RECEIVED</option>
												<option value="DEFER">DEFERRED</option>
												<option value="WAIVER">WAIVED</option>

												<%
													}
																			if ("WAIVED".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_WAIVED">VIEW</option>
												<%
													}
																			if ("PENDING_UPDATE".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_AWAITING">VIEW</option>
												<option value="UPDATE">UPDATE</option>

												<%
													}
																			if ("PENDING_RECEIVED".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_RECEIVED">VIEW</option>
												<option value="RECEIVE">UPDATE</option>

												<%
													}
																			if ("PENDING_DEFER".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_DEFERRED">VIEW</option>
												<option value="DEFER">UPDATE</option>

												<%
													}
																			if ("PENDING_WAIVER".equalsIgnoreCase(ob.getInsuranceStatus())) {
												%>
												<option value="VIEW_WAIVED">VIEW</option>
												<option value="WAIVER">UPDATE</option>
												<%
													}
												%>
											</html:select> <%
 	}
 %> &nbsp;
										</td>
										<%
											if (ob.getDeprecated().equals("Y")) {
										%><td><center>
												<input type="checkbox" disabled="disabled" />
												<center></td>
										<%
											} else {
										%>

										<td>
											<center>
												<input type="checkbox" id="selected" name="selected"
													value="<%=ob.getInsuranceCode()%>"
													onClick="toggleSelectAll()" />
											</center> <%
 	}
 %>
										</td>
									</tr>
								</logic:iterate>
								<%
									if (lno == 0) {
								%>
								<tr class="odd">
									<td colspan="10"><bean:message
											key="label.global.not.found" /></td>
								</tr>
								<%
									}
								%>
							</logic:present>


						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>

	</td>
	</tr>



</body>
</html>