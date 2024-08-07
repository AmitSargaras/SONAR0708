<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockForm" %>

<%@page import="org.apache.struts.util.LabelValueBean"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="org.apache.struts.util.LabelValueBean"%>

<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<%
DueDateAndStockForm form = (DueDateAndStockForm) request.getAttribute("DueDateAndStockForm");
List<AssetGenChargeStockDetailsHelperForm> stockSummaryForm = form.getStockSummaryForm();
pageContext.setAttribute("stockSummaryForm", stockSummaryForm);
%>

boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006){
	isMaker=true;
}else {
	isChecker=true;
}




List stocksAndDueDateDetails = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stocksAndDueDateDetails");
List viewLocationList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.viewLocationList");
pageContext.setAttribute("stocksAndDueDateDetails", stocksAndDueDateDetails);
pageContext.setAttribute("viewLocationList",viewLocationList);
OBGeneralChargeDetails obj =  null;
OBGeneralChargeStockDetails loc = null;
System.out.println("stocksAndDueDateDetails:"+stocksAndDueDateDetails);
obj = (OBGeneralChargeDetails) stocksAndDueDateDetails.get(0);
loc = (OBGeneralChargeStockDetails) viewLocationList.get(0);

String event=(String)request.getAttribute("event");
String stockdocMonth=(String)request.getAttribute("stockdocMonth");
String stockdocYear = (String)request.getAttribute("stockdocYear"); 
String dpCalculateManually = (String)request.getAttribute("dpCalculateManually"); 
System.out.println("event:"+event);
System.out.println("obj.getDueDate()"+obj.getDueDate());
System.out.println("loc.getDueDate()"+loc.getLocationId());
System.out.println("loc.getlonable()"+loc.getLonable());


List stockDisplayList  = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockDisplayList");
if(stockDisplayList == null){
	 stockDisplayList = new ArrayList();
}else{
	System.out.println("stockDisplayList.size in else"+stockDisplayList.size());
	pageContext.setAttribute("stockDisplayList", stockDisplayList);

}
int dno=0;
String parentPageFrom = null;
if(isChecker){
	 parentPageFrom = "ASSET_PROCESS"; 
} else {
	parentPageFrom = "ASSET_READ";
}
String trxID=(String)request.getAttribute("trxID");

%>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
	<script type="text/javascript" src="js/ajaxDropdown.js"></script>
	<script type="text/javascript" src="js/emulation.js"></script>
	<script type="JavaScript" src="js/itgPrjConfigSetup.js"></script>
	<script type="JavaScript" src="js/itgCheckForm.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	<script type="text/javascript" src="js/dateext.js"></script>
	<script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/imageNavigation.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script>
<script language="JavaScript" type="text/JavaScript">

function cancelPage(event){
	document.forms[0].action ="AssetGenChargeCollateral.do?event="+event;
    document.forms[0].submit();
 }

function viewStocks(assetId) {
	alert(assetId);
	document.forms[0].action = "AssetGenChargeCollateral.do?event=view_each_stocks&locationId=999&assetId="+assetId;
	document.forms[0].submit();
}

function addParty(rowcnt){
	if(rowcnt == 1){
		document.getElementById('displaystockdetails').style.display = '';
		document.getElementById('displaystockdetails1').style.display = 'none';
	}
}

</script>

<html:form action="dueDateAndStock.do">

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
	<tr>
		<td><h3>View Due Date and Stock Details</h3></td>
 	</tr>
 	<tr>
   		<td><hr/></td>
 	</tr>
</thead>
<tbody>	
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>
				<tr class="even">
					<td class="fieldname">Due Date</td>
					<td> <input type="text" name="dueDate" value="<%=form.getDueDate()%>" /> </td>				
					<td class="fieldname">Location</td>
					<td>
						<select name="locationList" id="locationList">
							<option value=''>Please Select</option>
				            <%-- <option value='<%=loc.getLocationDetail()%>'><%=loc.getLocationDetail()%></option> --%>
				        </select>
				        <input onclick="javascript:addParty(1)" name="viewStockDetailSubmit1" type="button" value="View stocks" class="btnNormal" />
				    </td> 
				</tr>
				<tr class="odd">
					<td class="fieldname">Statement Name</td>
					<td> <%=form.getStatementName()%> </td>
					<td class="fieldname">DP to be calculated manually</td>
					<td> <input type="radio" name="dpCalcManually" value="<%=form.getDpCalcManually()%>" /> </td>
				</tr>
				<tr class="even">
					<td class="fieldname">DP Share</td>
					<td> <input type="text" name="dpShare" value="<%=form.getDpShare()%>" /> </td>
					<td class="fieldname" width="25%">Drawing Power (as per stock statement)</td>
					<td> <input type="text" name="dpAsPerStockStatement" value="<%=form.getDpAsPerStockStatement()%>" /> </td>
				</tr>
				<tr class="odd">
					<td class="fieldname"></td>
					<td> </td>
					<%-- <td class="fieldname" width="25%">DP for Cash Flow / Cash Budget</td>
					<td> <input type="text" name="dpForCashFlowOrBudget" value="<%=form.getDpForCashFlowOrBudget()%>" /> </td> --%>
				</tr>
			</tbody>
			</table>
		</td>
	</tr>			
	<tr>
		<td>
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
				    <td><h3>Stock Details </h3></td>
				</tr>
				<tr>
				    <td><hr/></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
				        <thead>
				          	<tr>
				          		<td width="5%"><bean:message key="label.global.sn"/></td>
				          		<td width="30%">Location</td>
				          		<td width="30%">Deficit/Loanable</td>
				          		<td width="30%">Action</td>
				          	</tr>
				        </thead> 
				        <tbody>
				        	<% int stockIndex = 0; %>
							<logic:present name="stockSummaryForm">
							<logic:iterate id="stockSummaryForm" name="stockSummaryForm" indexId="counter"
								type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm">
				        		<tr class="<%=(stockIndex++)%2==0?"even":"odd"%>">
						        	<td> <%=stockIndex%></td>
					          		<td width="30%" style="text-align: center;"><%=stockSummaryForm.getLocationName()%></td>
					          		<td width="30%" style="text-align: center;"><%=stockSummaryForm.getTotalLonable()%></td>
					          		<td width="30%"> <a href=''>View</a> </td>
				          		</tr> 
				        	<% if(stockIndex) { %>   
						        <tr>
						        	<td colspan="4">&nbsp;<bean:message key="message.record.notfound" /></td>
					          	</tr>
				          	<%}%>
				        </tbody>
				        </table>
				    </td>
				</tr>
			</tbody>
			</table>
		</td>
  <tr>
      <h3>View Due Date and Stock Details</h3>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
<tbody>
<tr>
     <td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<thead></thead>
<tbody>
<tr class="even">
	<td class="fieldname">Due Date </td>
	 <%SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");
     String strDate= formatter.format(obj.getDueDate()); %>
	<td> <integro:empty-if-null value="<%=strDate%>" /></td>
	
	<td class="fieldname">Location</td>
	<td><select name="locationList" id="locationList">
		          <option value=''>Select</option>
                  <option value='<%=loc.getLocationDetail()%>'><%=loc.getLocationDetail()%></option>
                </select>
                <input onclick="javascript : addParty(1)" name="viewStockDetailSubmit1" type="button" id="viewStockDetailSubmit1" value="View stocks" class="btnNormal" />
                </td> 
	</tr>
	<tr class="odd">
		<td>
			<jsp:include page="lead_bank_stock_listing.jsp"/>
		</td>
	</tr>
			<tr>
				<td>
					<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="65">&nbsp;</td>
							<td width="65">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4">
								<center>
									<a href="javascript:cancelPage('read_return');"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0"
										id="Image4411" /> </a>
								</center>
								<center>
									<a href="javascript:cancelPageMakerView1();"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0"
										id="Image4411" /> </a>
								</center>
								<center>
									<a href="javascript:cancelPageMakerView1();"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0"
										id="Image4411" /> </a>
								</center>
							</td>
							<td colspan="4">
								<center>
									<a href="javascript:cancelPage4();"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0"
										id="Image4411" /></a>
								</center>
								<center>
									<a href="javascript:cancelPage1();"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0"
										id="Image4411" /></a>
								</center>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</tbody>
</table>	
</html:form>
	<tr class="even">
	<td class="fieldname">Statement Name</td>
	<% 
	String docCode = null;
	if(obj.getDocCode()!=null){
	String[] split = obj.getDocCode().split(",");
	docCode=split[1];
	} %>
	<td><integro:empty-if-null value="<%=docCode%>" /></td>
	<td class="fieldname">DP to be calculated manually</td>
	<td><integro:empty-if-null value="<%=obj.getDpCalculateManually()%>" /></td>
</tr>
<tr class="odd">
	<td class="fieldname">DP Share</td>
	<td><integro:empty-if-null value="<%=obj.getDpShare()%>" /></td>
	<td class="fieldname" width="25%">Drawing Power (as per stock statement)</td>
	<td><integro:empty-if-null value="<%=obj.getCalculatedDP()%>" /></td>
</tr>
<tr class="even">
	<td class="fieldname"></td>
	<td></td>
	<%-- <td class="fieldname" width="25%">DP for Cash Flow / Cash Budget</td>
	<td><integro:empty-if-null value="<%=obj.getCashFlowBudgetDP()%>" /></td> --%>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <thead>
    <tr>
       <h3>Stock Details </h3>
    </tr>
</thead>

<tbody>
<tr >

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <thead>
    <tr>
       <td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="30%">Location</td>
          		<td width="30%">Deficit/Loanable</td>
          		<td width="30%">Action</td>
    </tr>
</thead>
<tbody>    
                        <tr class="odd" id="displaystockdetails" style="display: none;"  >
						<td class="index"><%=dno%></td>
                          <td>
                             <center><integro:empty-if-null value="<%=loc.getLocationDetail()%>" /></center>
                          </td>  
                          <td>
                             <center><integro:empty-if-null value="<%=loc.getLonable() %>"/></center>
                          </td>
                            <td>
                            <%
                            String dueDateStr = null;
                            System.out.println("duedateStr "+dueDateStr);
                        	if(obj.getDocCode()!=null){
                        	String[] split = obj.getDocCode().split(",");
                        	dueDateStr=obj.getDueDate()+","+split[0];
                            System.out.println("duedateStr "+dueDateStr);
                        	}
                            %>
                             <center>
          					<a href='AssetGenChargeStockDetails.do?event=view_stock_details&locationId=<%=loc.getLocationId()%>&dueDate=<%=dueDateStr%>&obIndex=<%=1%>&parentPageFrom=<%=parentPageFrom%>&fundedShare=<%=obj.getFundedShare()%>&calculatedDP=<%=obj.getCalculatedDP()%>&trxID=<%=trxID %>&assetId=<%=obj.getGeneralChargeDetailsID() %>'>View</a> 
	                         </center>
	                         </td>     
                         </tr>   
						
                                <tr class="odd" id="displaystockdetails1" style="display: '';">
                                	 <% if (dno == 0 ) { %>
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                	 <% } %>
                                </tr>
</tbody>

</tbody>

 </table>
</tr>
</table>
<!-- ###################################################################################################################################<br> -->

</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
<tr>

</tr>


</table>
<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
 <% if(isMaker){%>
 <td colspan="4">
		
	<%	if(event.equals("view_each_stock_and_date")||event.equals("view_each_stocks")){%>		
				<center>
							<a href="javascript:cancelPage('read_return');"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
							<%	}else if(event.equals("checker_view_insurance_received")){%>		
							<center>
							<a href="javascript:cancelPageMakerView1();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						 
						<%}else if(event.equals("checker_view_insurance_received")){%>		
						<center>
						<a href="javascript:cancelPageMakerView1();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
								src="img/return1.gif" name="Image4411" border="0"
								id="Image4411" />
						</a>
					</center>
					 
					<%} %>
						&nbsp;
					</td>
					<%} %>
					
	<% if(isChecker){%>
 <td colspan="4">
				<%if(event.equals("checker_view_insurance_received")){ %>
				<center><a href="javascript:cancelPage4();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
				</center>
				<%}else if(event.equals("checker_view_insurance_received")){ %>
					<center><a href="javascript:cancelPage1();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</center>
					<%}} %>
						&nbsp;
					</td>
					
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
</body>
</html>
