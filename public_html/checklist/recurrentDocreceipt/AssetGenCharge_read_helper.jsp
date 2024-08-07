<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 java.util.Arrays,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Comparator, java.text.SimpleDateFormat,
				 com.integrosys.cms.ui.common.CommonCodeList" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/AssetGenCharge_read_helper.jsp,v 1.53 2006/09/15 08:23:52 hshii Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Asset Based
*
* @author $Author: hshii $<br>
* @version $Revision: 1.53 $
* Date: $Date: 2006/09/15 08:23:52 $
* Tag: $Name:  $
*/
%>

<%
System.out.println("@@@@@@@@@@@###########222222222################");
String fwd_page = (String)request.getParameter("event");
    IGeneralCharge oldCollateral = (IGeneralCharge) itrxValue.getCollateral();
    IGeneralCharge newCollateral = (IGeneralCharge) itrxValue.getStagingCollateral();
    String prefix = "Asset";
    String subtype = "AssetGenCharge";
    String formName = subtype+"Form";
 
    AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
    String formActionName = subtype+"Collateral.do";
    HashMap  docCodeWithStocks = (HashMap) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.docCodeWithStocks");
 /*   String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.fundedShare");
    if(fundedShare==null){
    	fundedShare = "0";
    }
    */
    String dpShare = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dpShare");
    if(dpShare==null){
    	dpShare = "0";
    }
    
    List displayList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.displayList");
    List dueDateList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dueDateList");
    pageContext.setAttribute("dueDateList",dueDateList);
    List filterLocationList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.filterLocationList");
    if(filterLocationList==null)
    	filterLocationList=new ArrayList();
    pageContext.setAttribute("filterLocationList",filterLocationList);
    String calculatedDP=  (String) request.getAttribute("calculatedDP");
    
    if(calculatedDP==null){
    	calculatedDP = "0";
    }
    System.out.println("@@@@@@@@@@@###########3333333333333################");
%>

<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm"%><script language="JavaScript" type="text/JavaScript">
function refreshLocation(dropdown)
{
	
var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }	
   //var dep = 'stockLocation';
   //var url = '/cms/AssetGenChargeStockDetails.do?event=get_filter_locations&dueDate='+curSel;

   document.forms[0].action="AssetGenChargeStockDetails.do?event=filter_locations&collateralID=<%=oldCollateral.getCollateralID()%>&parentPageFrom=<%=parentPageFrom%>&dueDate="+curSel;
   document.forms[0].submit();
}

function viewStocks(num, index) {
    if (num == 11) {
         document.forms[0].event.value="view_stocks";
         document.forms[0].indexID.value="-1";
        
     }
    if (num == 12) {
        document.forms[0].event.value="view_stocks_track";
        document.forms[0].indexID.value="-1";
        
    }
    document.forms[0].submit();

}

</script>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
          <%@ include file="/checklist/recurrentDocreceipt/view_basic_security_fields.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>

<!-- ============================================================================================ -->
<%if(
		//!("REJECTED".equals(itrxValue.getStatus()) && "ASSET_CLOSE_TRACK".equals(parentPageFrom))
		//||"PENDING_UPDATE".equals(itrxValue.getStatus())
		//||
		"ACTIVE".equals(itrxValue.getStatus()) 
				
				){
%>
<tr class="even">
	<td class="fieldname">
		Due Date
	</td>
	<td>
	<%String  dueDate = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dueDate");
		if(dueDate==null)
			dueDate="";
	%>
	<html:select property="dueDate"  onchange="javascript:refreshLocation(this)" value="<%=dueDate%>" disabled="true" >
      		<option value="" style=>Please Select </option>	
      <!-- 	<logic:iterate id="ob" name="dueDateList" type="org.apache.struts.util.LabelValueBean" scope="page" >
	           	<html:option value="<%=ob.getValue()%>"><%=ob.getLabel()%></html:option>
           	</logic:iterate>  -->     
           	<%
           	for(int i=0;i<dueDateList.size();i++){
           		LabelValueBean bean= (LabelValueBean)dueDateList.get(i);           		
           		String withCode=bean.getValue();
           		String[] split=withCode.split(",");
           		String docCode=split[1];
           		if(docCodeWithStocks.containsKey(docCode)){  %>
           			<html:option  value="<%=bean.getValue()%>"  ><%=bean.getLabel()%></html:option>
           	<%	}else{   %>
           		<html:option value="<%=bean.getValue()%>"><%=bean.getLabel()%></html:option>
           		<%}
           	}
           	%>
    </html:select>
    <html:errors property="dueDateError"/>
	</td>
	<td class="fieldname">Location</td>
	<td>
	
      		<%
      		for(int i=0;i<filterLocationList.size();i++){
      		LabelValueBean bean=(LabelValueBean)filterLocationList.get(i);
      		%>
      		
      		<%=bean.getLabel() %>
      		<%} %>
    &nbsp;
    
</td>
</tr>
<%//}
}else{
	%>
<tr class="even">
	<td class="fieldname">
		Due Date  
	</td>
	<td colspan="3">
	<%String  dueDate = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dueDate");
		if(dueDate==null)
			dueDate="";
	%>
	<%=dueDate.split(",")[0] %>
    <html:errors property="dueDateError"/>
    <html:hidden property="dueDate" value="<%=dueDate %>"/> 
	</td>
</tr>
<%} %>

<!-- ============================================================================================ -->
<tr>
	<td class="fieldname">
		Statement Name
	</td>
	<td colspan="3">
	<%String  statementName = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.statementName"); %>
	<integro:empty-if-null value="<%=statementName %>"/>
	</td>
</tr>
<tr>
<tr class="even">
<%-- <td class="fieldname" width="25%">
		HDFC Bank Share 
	</td>
	<td width="25%">
	 <html:hidden property="fundedShare" value="<%=fundedShare %>"/> 
<%=fundedShare %>
	 
	</td> --%>	
	<td class="fieldname" width="25%"><bean:message key="label.col.dpShare" /></td>
	<td width="25%">
	 <html:hidden property="dpShare" value="<%=dpShare %>"/> <%=dpShare %>
	 </td>
	
	<td class="fieldname" width="25%">
		Drawing Power
	</td>
	<td width="25%">
		 <html:hidden property="calculatedDP" value="<%=calculatedDP %>"/> 
        <%=calculatedDP %>
	</td>
</tr>
<tr>
	<td colspan="4" align="left">
	<!-- <html:errors property="fundedShareError"/> -->	
		<html:errors property="dpShareError"/>
	</td>
</tr>
</tbody>
</table>
<!-- ###################################################################################################################################<br> -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td><h3>Stock Details </h3></td>
        <td width="50%" align="right">
			<!-- <input class="btnNormal" type="button" name="stockDetailSubmit1" value="Add New" onclick="javascript:submitPage(10, -1)"/> -->
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
     <td colspan="2">
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
          <%
           		int rowIdx1 = 0;
          
          
          if(displayList!=null && displayList.size()>0){
        	  AssetGenChargeStockDetailsHelperForm helperForm; 
        	  for (int cnt = 0; cnt < displayList.size(); cnt++) {
        		  helperForm=(AssetGenChargeStockDetailsHelperForm)displayList.get(cnt);
        	%>
        	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	        	<td> <%=cnt+1%></td>
          		<td width="30%" style="text-align: center;"><%=helperForm.getLocationName()%></td>
          		<td width="30%" style="text-align: center;"><%=helperForm.getTotalLonable()%></td>
          		<td width="30%">
          		<%
          		System.out.println("helperForm.getLocationID()################################## "+helperForm.getLocationID());
          		System.out.println("helperForm.getDueDate()################################## "+helperForm.getDueDate());
          		System.out.println("cnt################################## "+cnt);
          		System.out.println("parentPageFrom################################## "+parentPageFrom);
          	//	System.out.println("fundedShare################################## "+fundedShare);
          		System.out.println("dpShare################################## "+dpShare);
          		System.out.println("calculatedDP################################## "+calculatedDP);
          		System.out.println("trxID################################## "+trxID);
          		
          		%>
          		<%--<a href='RecurrentDocReceipt.do?event=view_stock_details&locationId=<%=helperForm.getLocationID()%>&dueDate=<%=helperForm.getDueDate()%>&obIndex=<%=cnt%>&parentPageFrom=<%=parentPageFrom%>&fundedShare=<%=fundedShare%>&calculatedDP=<%=calculatedDP%>&trxID=<%=trxID %>'>View</a>  --%>
          		
          		<a href='RecurrentDocReceipt.do?event=view_stock_details&locationId=<%=helperForm.getLocationID()%>&dueDate=<%=helperForm.getDueDate()%>&obIndex=<%=cnt%>&parentPageFrom=<%=parentPageFrom%>&dpShare=<%=dpShare%>&calculatedDP=<%=calculatedDP%>&trxID=<%=trxID %>'>View</a>
          	
          		<%-- <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <option value='AssetGenChargeStockDetails.do?event=view_stock_details&locationId=<%=helperForm.getLocationID()%>&dueDate=<%=helperForm.getDueDate()%>&obIndex=<%=cnt%>'>View</option>
                      <option value='AssetGenChargeStockDetails.do?event=edit_prepare_stock_details&locationId=<%=helperForm.getLocationID()%>&dueDate=<%=helperForm.getDueDate()%>&from_page=update&obIndex=<%=cnt%>'>Edit</option>
                 </select>
          		 --%></td>
          	</tr> 
        		  
        <%}	  
          }	else{
            %>   
	        <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	        	<td colspan="4"> No records Found.</td>
          		<%-- <td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="30%">Location</td>
          		<td width="30%">Deficit/Loanable</td>
          		<td width="30%">Action</td> --%>
          	</tr>
          	<%} %>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<br>
<%@ include file="/checklist/recurrentDocreceipt/checker_list_insurancegc.jsp"%>

<!-- ###################################################################################################################################<br> -->
<%-- <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3>Valuation Details Input into CLIMS<bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
            <%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp" %>
            <%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
            <%@ include file="/collateral/common/common_fields_read.jsp" %>
			<%@ include file="/collateral/common/common_physical_inspection_read.jsp" %>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td> This table will contain the "Valuation Details Input into CLIMS" details.</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.maturity.date" />&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
            </tr>



         <!--added by Jitendra for MBB-474  -->

           <!--end by Jitendra for MBB-474  -->

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
				<td colspan="3"><integro:wrapper value="<%=iCol.getEnvRiskyRemarks()%>" />&nbsp;</td>
            </tr>
			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.asset.description"/></span></td>
				<td colspan="3"><integro:wrapper value="<%=iCol.getRemarks()%>" />&nbsp;</td>
            </tr>
          <%@ include file="/collateral/common/view_security_instrument.jsp" %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table> --%>

<%-- <%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>

<%@ include file="/collateral/assetbased/view_charge_summary.jsp" %> --%>

<!--View two valuation details-->
<%-- <%@ include file="/collateral/common/view_valuation_from_los.jsp"%> --%>
<%-- <%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>


<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %> --%>

