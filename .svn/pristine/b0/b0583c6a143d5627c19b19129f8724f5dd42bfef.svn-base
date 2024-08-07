<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>

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

<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><script language="JavaScript" type="text/JavaScript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function gotopage(aLocation) {
	window.location.href = aLocation ;
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
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
String fwd_page = (String)request.getParameter("event");
    IGeneralCharge oldCollateral = (IGeneralCharge) itrxValue.getCollateral();
    IGeneralCharge newCollateral = (IGeneralCharge) itrxValue.getStagingCollateral();
    String prefix = "Asset";
    String subtype = "AssetGenCharge";
    String formName = subtype+"Form";
    DecimalFormat dft = new DecimalFormat("#0.00");
    AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
    String formActionName = subtype+"Collateral.do";
    HashMap  docCodeWithStocks = (HashMap) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.docCodeWithStocks");
    
  //  String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.fundedShare");
    
    String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpShare");
    if(fundedShare==null){
    	fundedShare = "0";
    }
    
    String  remarkByMaker = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.remarkByMaker");
    if(null == remarkByMaker){
    	remarkByMaker = "";
    }
    
    
    String  totalLonableAmt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
    if(null == totalLonableAmt){
    	totalLonableAmt ="0";
    }
    totalLonableAmt=UIUtil.removeComma(totalLonableAmt);

    String  migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
    if(null == migrationFlag){
    	migrationFlag ="N";
    }
    
    
    
    List displayList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.displayList");
    List dueDateList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDateList");
    String isEntryFmToDo=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.isEntryFmToDo");
    pageContext.setAttribute("isEntryFmToDo",isEntryFmToDo);
    
    pageContext.setAttribute("dueDateList",dueDateList);
    List filterLocationList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.filterLocationList");
    if(filterLocationList==null)
    	filterLocationList=new ArrayList();
    pageContext.setAttribute("filterLocationList",filterLocationList);
    String calculatedDP=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.calculatedDP"); // (String) request.getAttribute("calculatedDP");
    //Comment below lines to remove log info. from console
  //  System.out.println("*****oldCollateral******* "+oldCollateral);
  //  System.out.println("****newCollateral******** "+newCollateral);
    
    String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate");
	if(dueDate==null){
		dueDate="";
	}
	
	String stockDocMonth=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocMonth");
	if(stockDocMonth==null){
		stockDocMonth="";
	}
	
	String stockDocYear=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocYear");
	if(stockDocYear==null){
		stockDocYear="";
	}
	
    IGeneralChargeDetails oldChargeDetaills=null;
    IGeneralChargeStockDetails[] existingGeneralChargeStockDetails2;
    IGeneralChargeDetails[] existingGeneralChargeDetails2 = oldCollateral.getGeneralChargeDetails();
	IGeneralChargeDetails existingChargeDetails2;
/* 	if(!"".equals(dueDate)){
    if(existingGeneralChargeDetails2!=null){
		for (int i = 0; i < existingGeneralChargeDetails2.length; i++) {
			 existingChargeDetails2 = existingGeneralChargeDetails2[i];		
			if(existingChargeDetails2!=null && existingChargeDetails2.getDocCode().equals(dueDate.split(",")[1])){
			System.out.println("************ "+existingChargeDetails2.getDueDate()+" "+existingChargeDetails2.getDocCode());
			oldChargeDetaills = existingChargeDetails2;
				break;
			}
		}
	}
	} */
    IGeneralChargeDetails newChargeDetaills=null;
    IGeneralChargeStockDetails[] existingGeneralChargeStockDetails1;
    IGeneralChargeDetails[] existingGeneralChargeDetails1 = newCollateral.getGeneralChargeDetails();
	IGeneralChargeDetails existingChargeDetails1;
/* 	if(!"".equals(dueDate)){
    if(existingGeneralChargeDetails1!=null){
		for (int i = 0; i < existingGeneralChargeDetails1.length; i++) {
			 existingChargeDetails1 = existingGeneralChargeDetails1[i];		
			if(existingChargeDetails1!=null && existingChargeDetails1.getDocCode().equals(dueDate.split(",")[1])){
			System.out.println("************ "+existingChargeDetails1.getDueDate()+" "+existingChargeDetails1.getDocCode());
			newChargeDetaills = existingChargeDetails1;
				break;
			}
		}
	}
	} */
	 System.out.println("<<<<calculatedDP before>>>"+calculatedDP);
    if(calculatedDP==null || calculatedDP.equals("null")){
    	calculatedDP = "0";
    }
    System.out.println("<<<<calculatedDP after>>>"+calculatedDP);
  //Santosh
   // String dpCalculateManually=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
    
    String insuranceCheck=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");
    
    List finalMonthList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.finalMonthList");
	List finalYearList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.finalYearList");
	System.out.println("finalMonthList=>"+finalMonthList+" finalYearList=>"+finalYearList);
	if(finalMonthList==null)
		finalMonthList=new ArrayList();
	pageContext.setAttribute("finalMonthList",finalMonthList);
	
	if(finalYearList==null)
		finalYearList=new ArrayList();
	pageContext.setAttribute("finalYearList",finalYearList);
	
	System.out.println("colForm.getStockDocMonth=>"+colForm.getStockdocMonth()+"  colForm.getStockDocYear=>"+colForm.getStockdocYear());
	System.out.println("StockDocMonth=>"+stockDocMonth+"  StockDocYear=>"+stockDocYear);
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
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
<%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>
 <html:errors property="loaMasterError"/><html:errors property="notAllowedError"/>
<%if("ASSET_PROCESS".equals(parentPageFrom)){ %>
 	<jsp:include page="checker_due_date_and_stock_listing.jsp" >
 		<jsp:param name="parentPageFrom" value="<%=parentPageFrom %>"/>
 	</jsp:include>
<%}else{ %>
	<jsp:include page="view_due_date_and_stock_listing.jsp" >
		<jsp:param name="parentPageFrom" value="<%=parentPageFrom %>"/>
	</jsp:include>	
<%} %>

<br>
<% 
if(!("no".equals(insuranceCheck))){%>
	<%@ include file="/collateral/assetbased/assetgencharge/gcInsurance/checker_list_insurancegc.jsp" %>
<% }
%>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td colspan="2">&nbsp;</td>
</tr>
    <tr>
        <td><h3>Term Loan Asset Cover <%-- <bean:message key="label.security.general"/> --%></h3></td>
       
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
	   <td colspan="2">
		<table width="50%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<tbody>
				  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						    <td width="20%" class="fieldname">Term Loan Outstanding Amount<%-- <bean:message key="label.cms.host.security.id"/>  --%></td>
							
						<% 	if( null == iCol.getTermLoanOutstdAmt()  || "".equals(iCol.getTermLoanOutstdAmt())){%>
							<td width="30%">  <%=0.00%>
							 <input type="hidden" name="termLoanOutstdAmt" id="termLoanOutstdAmt" value="0.00"/>
							
							<% }else{%>

							<td width="30%">  <%=iCol.getTermLoanOutstdAmt()%>
						 <input type="hidden" name="termLoanOutstdAmt" id="termLoanOutstdAmt" value="<%=iCol.getTermLoanOutstdAmt()%>"/>
							<% } %>
							</td>
				   </tr>

					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							 <td width="20%" class="fieldname">Margin/ Asset Cover (%)<%-- <bean:message key="label.security.type"/> --%>     </td>
							<% 	if( null == iCol.getMarginAssetCover()  || "".equals(iCol.getMarginAssetCover())){%>
							<td width="30%">  <%=0.00%>
						  <input type="hidden" name="marginAssetCover" id="marginAssetCover" value="0.00"/>
							
							<% }else{%>

							<td width="30%">  <%=iCol.getMarginAssetCover()%>
						 <input type="hidden" name="marginAssetCover" id="marginAssetCover" value="<%=iCol.getMarginAssetCover()%>"/>
							
							<% } %>
							
					     	</td>
					</tr>     
        
					 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							 <td width="20%" class="fieldname">	 Receivables given by Client	 <%-- <bean:message key="label.security.type"/> --%>	 </td>
							
							<% 	if( null == iCol.getRecvGivenByClient()  || "".equals(iCol.getRecvGivenByClient())  ){%>
							<td width="30%">  <%=0.00%>
						  <input type="hidden" name="recvGivenByClient" id="recvGivenByClient" value="0.00"/>
							
							<% }else{%>

							<td width="30%">  <%=iCol.getRecvGivenByClient()%>
						 <input type="hidden" name="recvGivenByClient" id="recvGivenByClient" value="<%=iCol.getRecvGivenByClient()%>"/>
							
							<% } %>
								</td>
					  </tr>                  
            </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>	
				
				
					
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
</table>
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

