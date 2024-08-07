<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 java.util.HashMap,
                 java.util.Iterator,
                 java.util.*,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeAction,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBGeneralChargeDetails,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBGeneralChargeStockDetails,
                 com.integrosys.cms.ui.dataprotection.DataProtectionConstants" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="org.apache.struts.util.LabelValueBean"%>

<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<%
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

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
String parentPageFrom = "ASSET_PROCESS"; 
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
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
<%-- function cancelPageMakerView1(){
	document.forms[0].action="<%=actionNameStr%>?event=read_return&from_event=<%=from_event%>";
	document.forms[0].submit();
}

function cancelPageMakerView(){
	document.forms[0].action="<%=actionNameStr%>?event=read";
	document.forms[0].submit();
} --%>

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

function editStockDetail(dueDate,fromPage,obIndex,assetId,locationId) {
	var event = event;

	var dueDate = dueDate;
	var fromPage = fromPage;
	var obIndex = obIndex;
    
	document.forms[0].action ="AssetGenChargeStockDetails.do?event=edit_prepare_stock_details&dueDate="+dueDate+"&from_page=update&obIndex="+obIndex+"&assetId="+assetId+"&locationId="+locationId;
    document.forms[0].submit();
}	

</script>
</head>

<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm"%>
<script language="JavaScript" type="text/JavaScript">


</script>
<body>

<html:form action="AssetGenChargeCollateral.do">
<input type="hidden" name="subtype" value="AssetGenCharge"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tr>
      <h3>Edit Due Date and Stock Details</h3>
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
	<td class="fieldname">Stock Doc Month&nbsp;&nbsp;&nbsp;</td>
	<td><integro:empty-if-null value="<%=obj.getStockdocMonth()%>" /></td>
    <td class="fieldname">Stock Doc Year &nbsp;&nbsp;&nbsp;</td>
    <td><integro:empty-if-null value="<%=obj.getStockdocYear()%>" /></td>
	</tr>
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
	<td><integro:empty-if-null value="<%=obj.getDpCalculateManually()%>" />
	</td>
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
<%--           					<a href='AssetGenChargeStockDetails.do?event=edit_stock_details&locationId=<%=loc.getLocationId()%>&dueDate=<%=dueDateStr%>&obIndex=<%=1%>&parentPageFrom=<%=parentPageFrom%>&fundedShare=<%=obj.getFundedShare()%>&calculatedDP=<%=obj.getCalculatedDP()%>&trxID=<%=trxID %>&assetId=<%=obj.getGeneralChargeDetailsID() %>'>View/Edit</a> 
 --%>	                        <center> <a href="javascript:editStockDetail('<%=dueDateStr%>','update','<%=1%>','<%=obj.getGeneralChargeDetailsID()%>','<%=loc.getLocationId()%>')">View / Edit</a></center></td>
	                         
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
		
	<%	if(event.equals("edit_each_stock_and_date")){%>		
				<center>
							<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     						<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:cancelPage('update_return')"/></a>
     						<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     						<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('prepare_update')"/></a>	 
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