<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.drawingpower.DrawingPowerAction,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,				 
				 com.integrosys.cms.app.collateral.bus.ICollateral,
				 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
				 com.integrosys.cms.app.collateral.bus.IValuation,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.limit.bus.ILimit,
				 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
				 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,				 
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.limit.bus.OBLimitProfile,	
				 com.integrosys.base.techinfra.diff.CompareOBUtil,	
				 java.util.HashMap,
				 java.util.Collection,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.drawingpower.DrawingPowerForm"%>
<%@ page import="com.integrosys.cms.app.limit.proxy.ILimitProxy"%>
<%@ page import="com.integrosys.cms.app.limit.proxy.LimitProxyFactory"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ICoBorrowerLimit"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/drawingpower/drawingpower_process.jsp,v 1.24 2006/10/27 08:24:00 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* : Type - Asset Based General Charge: Drawing Power
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.24 $
* Date: $Date: 2006/10/27 08:24:00 $
* Tag: $Name:  $
*/
%>

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	IGeneralCharge staging = (IGeneralCharge)itrxValue.getStagingCollateral();
	IGeneralCharge actual = (IGeneralCharge)itrxValue.getCollateral();

	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");

	DrawingPowerForm aForm = (DrawingPowerForm)request.getAttribute("AssetDrawingPowerForm");
	String[] appliedActivatedLimitBase = aForm.getAppliedActivatedLimitBase();
	String[] appliedActivatedLimitCMS = aForm.getAppliedActivatedLimitCMS();
	String[] releasedLimitBase = aForm.getReleasedLimitBase();
	String[] releasedLimitCMS = aForm.getReleasedLimitCMS();
%>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
</head>

<body>
<html:form action="/AssetDrawingPower.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=DrawingPowerAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.asset.stock.summary"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="propertyInsuranceInput">
        <tbody>
          <tr class="odd">
            <td width="20%" class="fieldname"><bean:message key="label.security.asset.gross.stock.value"/></td>
            <td width="30%" ><bean:write name="AssetDrawingPowerForm" property="grossStockVal"/>&nbsp;</td>
            <td width="20%" class="fieldname" ><bean:message key="label.security.asset.total.creditors"/></td>
            <td width="30%" ><bean:write name="AssetDrawingPowerForm" property="totalCreditors"/>&nbsp;</td>
          </tr>
          <tr class="even">
            <td class="fieldname">Gross Stock Value less Creditors</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="grossStockValLessCreditors"/>&nbsp;</td>
            <td  class="fieldname">Net Value of Stocks (after applying margin)</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="netValStocksMargin"/>&nbsp;</td>
          </tr>
          <tr class="odd">
            <td class="fieldname">Total Valid Insurance on Stocks</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="totalValidInsrStocks"/>&nbsp;</td>
            <td  class="fieldname">Total Recoverable Amount</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="totalRecoverInsrAmt"/>&nbsp;</td>
          </tr>
          <tr class="even">
            <td class="fieldname">Insurance Shortfall Vs Stocks</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="insrShortfallVsStocks"/>&nbsp;</td>
            <td  class="fieldname">&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
        </tbody>
      </table> </td>
    </tr>
	<tr>
	<td><h3>Debtor Summary</h3>
	  <hr></td>
	</tr>
	<tr>
	  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="propertyInsuranceInput">
        <tbody>
          <tr class="odd">
            <td width="20%" class="fieldname">Gross Debtors</td>
            <td width="30%" ><bean:write name="AssetDrawingPowerForm" property="grossDebtors"/>&nbsp;</td>
            <td width="20%" class="fieldname" >Overdue </td>
            <td width="30%" ><bean:write name="AssetDrawingPowerForm" property="overdue"/>&nbsp;</td>
          </tr>
          <tr class="even">
          <td class="fieldname">Gross Debtors Less Overdue</td>
          <td><bean:write name="AssetDrawingPowerForm" property="grossDebtorsLessOverdue"/>&nbsp;</td>
          <td class="fieldname">Negative Stock Value (if any)</td>
          <td><bean:write name="AssetDrawingPowerForm" property="negativeStockValue"/>&nbsp;</td>
          </tr>
          <tr class="odd">
            <td  class="fieldname">Applicable Debtors</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="applicableDebtors"/>&nbsp;</td>
            <td class="fieldname">Net Debtors</td>
            <td ><bean:write name="AssetDrawingPowerForm" property="netDebtors"/>&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr>
	  <td><h3>FAO Summary</h3><hr></td>
    </tr>
	<tr>
	  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="propertyInsuranceInput">
        <tbody>
          <tr class="even">
            <td width="20%" class="fieldname">Gross FAO </td>
            <td width="30%" ><bean:write name="AssetDrawingPowerForm" property="grossFAO"/>&nbsp;</td>
            <td width="20%"  class="fieldname">Net FAO (after margin)</td>
            <td width="30%" ><bean:write name="AssetDrawingPowerForm" property="netFAOMargin"/>&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr>
	  <td><h3>Calculation for FSV, DP and DP (without netting insurance)</h3><hr></td>
    </tr>
	<tr>
	  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="propertyInsuranceInput">
	  	<thead>
	  	<tr>
	  	<td colspan="2" >FSV Calculation</td>
	  	<td colspan="2" >DP Calculation</td>
	  	<td colspan="2" >DP Calculation (w/o netting insurance)</td>
	  	</tr>
	  	</thead>
        <tbody>
          <tr class="odd">
            <td  class="fieldname">Total Stock, Debtors &amp; FAO (after margin)</td>
            <td width="13%" ><bean:write name="AssetDrawingPowerForm" property="totalStockDebtorsFAO"/>&nbsp;</td>
            <td  class="fieldname">Gross Amount for Drawing Power</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="grossAmtDrawingPower"/>&nbsp;</td>
            <td  class="fieldname">Gross Amount for Drawing Power (w/o netting insurance)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="grossAmtDrawingPowerWOIns"/>&nbsp;</td>
          </tr>
          <tr class="even">
            <td  class="<%=CompareOBUtil.compOB(staging,actual, "bankShare")?"fieldname":"fieldnamediff"%>" >Bank's Participating Share (%)&nbsp;<font color="#0000FF">* </font></td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="bankParticipatingShare"/>&nbsp;</td>
            <td  class="fieldname">Bank's Participating Share (%)</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="bankParticipatingShare"/>&nbsp;</td>
            <td  class="fieldname">Bank's Participating Share (%)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="bankParticipatingShare"/>&nbsp;</td>
          </tr>
          <tr class="odd">
            <td  class="fieldname">Bank's Total Stock, Debtors &amp; FAO</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="bankTotalStockDebtorsFAO"/>&nbsp;</td>
            <td  class="fieldname">Bank's Gross Amount for Drawing Power</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="bankGrossAmtDrawingPower"/>&nbsp;</td>
            <td  class="fieldname">Bank's Gross Amount for Drawing Power (w/o netting insurance)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="bankGrossAmtDrawingPowerWOIns"/>&nbsp;</td>
          </tr>
          <tr class="even">
            <td  class="<%=CompareOBUtil.compOB(staging,actual, "margin")?"fieldname":"fieldnamediff"%>">CRP Margin (%)&nbsp;<font color="#0000FF">* </font></td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="crpMargin"/>&nbsp;</td>
            <td  class="fieldname">CRP Margin (%)</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="crpMargin"/>&nbsp;</td>
            <td  class="fieldname">CRP Margin (%)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="crpMargin"/>&nbsp;</td>
          </tr>
          <tr class="odd">
          	<td  class="fieldname">Total Net FSV</td>
          	<td width="13%"><bean:write name="AssetDrawingPowerForm" property="totalNetFSV"/>&nbsp;</td>
            <td  class="fieldname">Net Amount for Drawing Power</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="netAmtDrawingPower"/>&nbsp;</td>
            <td  class="fieldname">Net Amount for Drawing Power (w/o netting insurance)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="netAmtDrawingPowerWOIns"/>&nbsp;</td>
          </tr>
          <tr class="even">
          	<td  class="fieldname">&nbsp;</td>
          	<td width="13%">&nbsp;</td>
            <td  class="fieldname">Total Maximum Applied Approved Limit</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="totalMaxApplApprLimit"/>&nbsp;</td>
            <td  class="fieldname">Total Maximum Applied Approved Limit</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="totalMaxApplApprLimit"/>&nbsp;</td>
         </tr>
         <tr class="odd">
         	<td  class="fieldname">&nbsp;</td>
         	<td width="13%">&nbsp;</td>
            <td  class="fieldname">Amount to be Released (Drawing Power)</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="amtToReleased"/>&nbsp;</td>
            <td  class="fieldname">Amount to be Released (Drawing Power w/o netting insurance)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="amtToReleasedWOIns"/>&nbsp;</td>
          </tr>
          <tr class="even">
          	<td  class="fieldname">&nbsp;</td>
          	<td width="13%">&nbsp;</td>
            <td  class="fieldname">Total Existing Released Limit</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="totalExistReleasedLimit"/>&nbsp;</td>
            <td  class="fieldname">Total Existing Released Limit</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="totalExistReleasedLimit"/>&nbsp;</td>
          </tr>
          <tr class="odd">
          	<td  class="fieldname">&nbsp;</td>
          	<td width="13%">&nbsp;</td>
            <td  class="fieldname">Deficit</td>
            <td width="13%"><bean:write name="AssetDrawingPowerForm" property="deficit"/>&nbsp;</td>
            <td  class="fieldname">Deficit (w/o netting insurance)</td>
            <td width="14%"><bean:write name="AssetDrawingPowerForm" property="deficitWOIns"/>&nbsp;</td>
          </tr>
          <tr class="even">
            <td  class="<%=CompareOBUtil.compOB(staging,actual, "otherRemarks")?"fieldname":"fieldnamediff"%>">Other Remarks</td>
            <td colspan="5" ><integro:wrapper value="<%=aForm.getOtherRemarks()%>"/>&nbsp;</td>
         </tr>
          <tr class="odd">
          <%
          	IValuation actualVal = actual.getValuation();
          	IValuation stageVal = staging.getValuation();
          %>
          	<td class="<%=CompareOBUtil.compOB(stageVal,actualVal, "currencyCode")?"fieldname":"fieldnamediff"%>">Valuation Currency&nbsp;<font color="#FF0000">* </font></td>
          	<td><bean:write name="AssetDrawingPowerForm" property="valuationCurrency"/>&nbsp;</td>
          	<td  class="fieldname">Evaluation Date of FSV</td>
          	<td colspan="3"><bean:write name="AssetDrawingPowerForm" property="evalDateFSV"/>&nbsp;</td>
          	</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr>
      <td>
        <h3>Security to Limit Details</h3></td>
    </tr>
	<tr>
      <td><hr/></td>
    </tr>
	<tr>
	  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
          <tr>
            <td width="3%">S/N</td>
            <td width="7%">Limit ID </td>
            <td width="10%">Outer Limit ID</td>
            <td width="15%">Product Description</td>
            <td width="10%">Other Security IDs Tagged to Limit</td>
            <td width="10%">Limit-Security Linkage</td>
            <td width="11%">Limit Currency</td>
            <td width="11%">Approved Limit</td>
            <td width="11%">Applied Approved Limit (Base Currency)&nbsp;<font color="#00AAFF">* </font></td>
            <td width="11%">Applied Approved Limit (CMS Sec Currency)</td>
            <td width="11%">Released Limit for this Security (Base Currency)&nbsp;<font color="#00AAFF">* </font></td>
            <td width="11%">Released Limit for this Security (CMS Sec Currency)</td>
            </tr>
        </thead>
        <tbody>
        <%
        	HashMap limitMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.limitMap");
        	Collection colLimitMap = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.colLimitMap");
        	if (colLimitMap == null || colLimitMap.size() == 0) {
 		%>
 		<tr class="odd"><td colspan="10">There is no limit details information.</td></tr>
 		<%
			} else {
        		pageContext.setAttribute("colLimitMap",colLimitMap);
        		int count = 0;
        %>
		<logic:present name="colLimitMap">
        <logic:iterate id="compareObj" name="colLimitMap" type="com.integrosys.base.techinfra.diff.CompareResult" >
        <%
        	ICollateralLimitMap limitMapObj = (ICollateralLimitMap)compareObj.getObj();

       	    ILimit limit =null;
                ICoBorrowerLimit coLimit = null;
                ILimitProxy proxy = LimitProxyFactory.getProxy();
                if(limitMapObj.getCustomerCategory().equals("MB"))
                   limit = (ILimit)limitMap.get(String.valueOf(limitMapObj.getLimitID()));
                else{
                   coLimit = proxy.getCoBorrowerLimit(limitMapObj.getCoBorrowerLimitID());
                   limit = (ILimit)limitMap.get(String.valueOf(coLimit.getOuterLimitID()));
                }
       	    boolean isInnerLimit = (limit.getOuterLimitID() != ICMSConstant.LONG_INVALID_VALUE && limit.getOuterLimitID() != 0)?true:false;
        %>
          <tr class="<%=count%2==0?"odd":"even"%>">
            <td class="<bean:write name="compareObj" property="key"/>" valign="top"><%=count + 1 %></td>
            <td valign="top"><integro:empty-if-null value="<%=String.valueOf(limitMapObj.getSCILimitID())%>"/>&nbsp;
            <%
            	if (ICMSConstant.HOST_STATUS_DELETE.equals(limitMapObj.getSCIStatus())) {
            %>
            <font color="#FF0000"><b>LINKAGE DELETED</b></font>&nbsp;
            <% } %>
            <% if (ICMSConstant.HOST_STATUS_DELETE.equals(limit.getHostStatus())) { %>
            <font color="#FF0000"><b>DELETED</b></font>&nbsp;
            <% } %>
            </td>
            <td valign="top">
            <% if (isInnerLimit) { %>
            <integro:empty-if-null value="<%=limit.getOuterLimitRef()%>"/>&nbsp;
            <% } else { %>-<% } %>
            </td>                        
            <td valign="top" style="text-align:left" valign="top"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, limitMapObj.getLimitType())%>"/>&nbsp;</td>
            <td valign="top">
            <%
            	ICollateralAllocation[] colAllocation = limit.getCollateralAllocations();
            	if (colAllocation != null)  {
	            	for (int i = 0; i < colAllocation.length; i++) {
	            		ICollateral limitCol = colAllocation[i].getCollateral();
	            		if (limitCol.getSCISecurityID() != staging.getSCISecurityID()) {		            		
            %>
            <integro:empty-if-null value="<%=String.valueOf(limitCol.getSCISecurityID())%>"/><br>
            <% } } } %>&nbsp;
            </td>
            <td valign="top">
            <%
            	//ICollateralAllocation[] colAllocation = limit.getCollateralAllocations();
            	if (colAllocation != null)  {
	            	for (int i = 0; i < colAllocation.length; i++) {
	            		ICollateral limitCol = colAllocation[i].getCollateral();
	            		if (limitCol.getSCISecurityID() != staging.getSCISecurityID()) {		            		
            %>
            <%=colAllocation[i].getHostStatus().equals(ICMSConstant.HOST_STATUS_DELETE)?"Deleted":"Active"%><br>
            <% } } } %>&nbsp;
            </td>            
            <%
            Amount approvedAmt = limit.getApprovedLimitAmount();
            %>
            <td style="text-align:center" valign="top">
            <integro:empty-if-null value="<%=approvedAmt==null?null:approvedAmt.getCurrencyCode()%>"/>&nbsp;
            </td>
            <td valign="top" >
            <% 
            	String approvedStrAmt = "";
            	if (approvedAmt != null && approvedAmt.getCurrencyCode() != null) {	            
	            	approvedStrAmt = String.valueOf(approvedAmt.getAmount());
	        %>
	        <% if (isInnerLimit) { %>(<% } %>	        
            <integro:currency amount="<%=approvedAmt%>" param="amount"/>
	        <% if (isInnerLimit) { %>)<% } %>            
            <% } %>
            </td>
            <td valign="top" >
            	<%
            		if (appliedActivatedLimitBase[count] == null) {
	            		appliedActivatedLimitBase[count] = "";
            		}
            		if (appliedActivatedLimitCMS[count] == null) {
	            		appliedActivatedLimitCMS[count] = "";
            		}
            	%>
            	<integro:empty-if-null value="<%=appliedActivatedLimitBase[count]%>"/>            	
            </td>
            <td valign="top" >
            	<integro:empty-if-null value="<%=appliedActivatedLimitCMS[count]%>"/>
            </td>
            <td valign="top" >
            	<%
            		if (releasedLimitBase[count] == null) {
	            		releasedLimitBase[count] = "";
            		}
            		if (releasedLimitCMS[count] == null) {
	            		releasedLimitCMS[count] = "";
            		}
            	%>
            	<integro:empty-if-null value="<%=releasedLimitBase[count]%>"/>&nbsp;
            </td>
            <td valign="top" >
            	<integro:empty-if-null value="<%=releasedLimitCMS[count]%>"/>&nbsp;
            </td>
            </tr>
            <%
            	    count++;
            %>
            </logic:iterate>
            </logic:present>
          <% 
          	} 
          %>
          <tr>
            <td colspan="9" valign="top"  class="total">Total Limits (CMS Security Currency)</td>
            <td valign="top" class="total" style="text-align:right ">
            	<bean:write name="AssetDrawingPowerForm" property="totalAppliedActLimit"/>&nbsp;
            	<html:hidden property="totalAppliedActLimit"/>
            </td>
            <td class="total">&nbsp;</td>
            <td valign="top" class="total" style="text-align:right ">
            	<bean:write name="AssetDrawingPowerForm" property="totalReleasedLimit"/>&nbsp;
            	<html:hidden property="totalReleasedLimit"/>
            </td>
          </tr>
          <tr>
          <td colspan="9" class="total">Total Approved Limit in CMS Currency</td>
          <td class="total" style="text-align:right ">
          	<bean:write name="AssetDrawingPowerForm" property="totalApprovedLimit"/>&nbsp;
          </td>
          <td class="total" colspan="2">&nbsp;</td>
          </tr>                    
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      </tr>
      	<td>&nbsp;</td>
      <tr>
        <td align="center"><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
</table>
</html:form>
 
</body>
</html>
