<%@page import="java.util.Collections"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.collateral.InsuranceHistoryForm,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.base.uiinfra.tag.PageIndex" %>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>				

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<% 
InsuranceHistoryForm form = (InsuranceHistoryForm) request.getAttribute("InsuranceHistoryForm");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String dueDate=(String)request.getAttribute("dueDate");
String dp=(String)request.getAttribute("calculatedDP");
pageContext.setAttribute("InsuranceHistoryForm", form);
String parentPageFrom = (String) session.getAttribute(AssetBasedAction.class.getName()+".parentPageFrom");
ICollateralTrxValue serviceColObj = (ICollateralTrxValue) session.getAttribute(AssetBasedAction.class.getName()+".serviceColObj");
String trxID = (String) serviceColObj.getTransactionID();
String collateralID = (String) serviceColObj.getReferenceID();
Map companyNameMap = (Map) session.getAttribute(AssetBasedAction.class.getName()+ ".insuranceCompanyNameMap");
if (companyNameMap ==null){
	companyNameMap = Collections.emptyMap();
}
boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if((user1.getTeamTypeMembership().getMembershipID()==1006 || user1.getTeamTypeMembership().getMembershipID()==1013) && !parentPageFrom.equalsIgnoreCase("ASSET_PROCESS")){
	isMaker=true;
}else {
	isChecker=true;
}

System.out.println("isMaker=>"+isMaker+"**isChecker=>"+isChecker);
System.out.println("parentPageFrom=>"+parentPageFrom);
String event=form.getEvent();
System.out.println("**************event=>"+form.getEvent());
%>	 

<script type="text/javascript">

var parentPageFrom = '<%=parentPageFrom%>';

function downloadInsuranceHistory(){
	var action = "assetInsuranceHistory.do?event=download_insurance_history_report";
	window.location.href = action;
}

function search(){
    document.forms[0].action="assetInsuranceHistory.do?event=search_insurance_history";
    document.forms[0].submit();
}

function goBack(){
	if(parentPageFrom === "ASSET_READ")
    	document.forms[0].action="AssetGenChargeCollateral.do?event=read";
    else if(parentPageFrom === "ASSET_UPDATE")	
    	document.forms[0].action="AssetGenChargeCollateral.do?event=prepare_update";
    else if(parentPageFrom === "ASSET_PROCESS")
       	document.forms[0].action="AssetGenChargeCollateral.do?event=process_update";
    else if(parentPageFrom === "ASSET_CLOSE")
       	document.forms[0].action="AssetGenChargeCollateral.do?event=prepare_close";
    //console.log("on go Back Action : "+document.forms[0].action);
    document.forms[0].submit();
}

function cancelPage1(){
	//alert("cancel");
		document.forms[0].action="CollateralRedirect.do?event=process&trxID=<%=trxID%>";
	    document.forms[0].submit();
 }

function cancelPage4(){
	document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID=<%=serviceColObj.getReferenceID()%>&trxID=<%=trxID%>";
	document.forms[0].submit();
	}
	
</script>

<html:form method="post" action="assetInsuranceHistory.do">
<input type="hidden" name="event"/>
<input type="hidden" name="collateralID" value="<%=collateralID%>"/>
<input type="hidden" name="trxID" value="<%=trxID%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
		<tr>
			<td><h3>View Insurance History</h3></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<table width="50%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<thead>
						<tr><td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td></tr>
					</thead>
					<tbody>
						<tr>
							<td width="20%" class="fieldname">Insurance Company Name</td>
							<td width="20%" class="even">
								<input type="text" name="insuranceCompanyName" value="<%=form.getInsuranceCompanyName() %>" />
								<html:errors property="insuranceCompanyNameError" />
							</td>
							<td width="10%" class="even">&nbsp;</td>
						</tr>
						<tr>	
							<td width="20%" class="fieldname">Received Date From</td>
							<td width="20%" class="odd">
								<input type="text" name="receivedDateFrom" value="<%=form.getReceivedDateFrom() %>" readOnly="true"/>
								<img src="img/calendara.gif" name="img_receivedDateFrom" border="0"
									onclick="return showCalendar('receivedDateFrom', 'dd/mm/y');" 
									onMouseOver="MM_swapImage('img_receivedDateFrom','','img/calendarb.gif',1)" 
									onMouseOut="MM_swapImgRestore()" />
								<html:errors property="receivedDateFromError" />
							</td>
							<td width="10%" class="odd">
								<center>
										<a href="javascript:search();" onmouseout="MM_swapImgRestore()" 
												onmouseover="MM_swapImage('img_go','','img/go1b.gif',1)">
												<img src="img/go1.gif" name="img_go" border="0" /> </a>	
								</center>
							</td>
						</tr>
						<tr>	
							<td width="20%" class="fieldname">Received Date To</td>
							<td width="10%" class="even">
								<input type="text" name="receivedDateTo" value="<%=form.getReceivedDateTo() %>" readOnly="true"/>
								<img src="img/calendara.gif" name="img_receivedDateTo" border="0" 
									onclick="return showCalendar('receivedDateTo', 'dd/mm/y');" 
									onMouseOver="MM_swapImage('img_receivedDateTo','','img/calendarb.gif',1)" 
									onMouseOut="MM_swapImgRestore()" />
								<html:errors property="receivedDateToError" />
							</td>
							<td width="10%" class="even">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr><br><br>
		<tr>
			<td width="100%" align="right">
				<input type="button" name="Submit" value="Download" class="btnNormal" 
					onclick="downloadInsuranceHistory()" />	
			</td>
		</tr>
		<tr>
			<td width="100%"><hr /></td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<thead>
						<tr>
							<td width="5%"><bean:message key="label.global.sn"/></td>
							<td width="10%">Status</td>
							<td width="10%">Due Date</td>
							<td width="17%">Insurance Policy No.</td>
							<td width="20%">Insurance Company Name</td>
							<td width="18%">Insured Amount</td>
							<td width="10%">Expiry Date</td>
							<td width="10%">Received Date</td>
						</tr>
					</thead>
					<tbody>
						<logic:present name="InsuranceHistoryForm" property="insuranceHistoryItem">
							<logic:iterate id="itemForm" indexId="lnbStockIndex" name="InsuranceHistoryForm" property="insuranceHistoryItem"
								type="com.integrosys.cms.ui.collateral.InsuranceHistoryItemForm">
								<tr class=<%=itemForm.getIndex()%2 == 0 ? "even" : "odd" %> >
									<td class="index"><%=itemForm.getIndex() %></td>
									<td align="center"><%=itemForm.getStatus() %></td>
									<td align="center"><%=itemForm.getDueDate() %></td>
									<td align="center"><%=itemForm.getInsurancePolicyNo() %></td>
									<td align="center"><%=itemForm.getInsuranceCompanyName() %></td>
									<td align="center"><%=itemForm.getInsuredAmount() %></td>
									<td align="center"><%=itemForm.getExpiryDate() %></td>
									<td align="center"><%=itemForm.getReceivedDate() %></td>
								</tr>
							</logic:iterate>
						</logic:present>
						<logic:notPresent name="InsuranceHistoryForm" property="insuranceHistoryItem">
							<tr>
								<td colspan="8">&nbsp;<bean:message key="message.record.notfound" /></td>
							</tr>
						</logic:notPresent>
					</tbody>
				</table>
			</td>
		</tr>	
	</tbody>
</table>

<br><br>

<table width="20%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr align="center">
	
		<td>	
		<% if(isMaker){%>
			<a href="javascript:goBack();" onmouseout="MM_swapImgRestore()" 
				onmouseover="MM_swapImage('img_cancel','','img/cancel2.gif',1)">
				<img src="img/cancel1.gif" name="img_cancel" border="0" /> </a>
		
		<%}else{ %>
		<%if((event.equals("view_insurance_history") || "search_insurance_history".equals(event)) && "ASSET_READ".equals(parentPageFrom)){ %>
		<center><a href="javascript:cancelPage4();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
		<%}else if((event.equals("view_insurance_history") || "search_insurance_history".equals(event)) && "ASSET_PROCESS".equals(parentPageFrom)){ %>
		<center><a href="javascript:cancelPage1();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
		<%}} %>
		</td>
	</tr>
</table>

</html:form>
