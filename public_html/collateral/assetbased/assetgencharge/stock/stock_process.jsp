<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.StockAction,
				 com.integrosys.base.techinfra.util.DateUtil,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.app.collateral.bus.type.asset.InsuranceInfoComparator,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBInsuranceSummary,				 
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.StockForm,
				 com.integrosys.cms.ui.collateral.TimeFreqList,
                 com.integrosys.cms.ui.collateral.InsurerNameList,                 
				 java.util.List,
				 java.util.Arrays,
				 java.util.HashMap,
				 java.util.Collection,
				 java.util.Locale,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,				 
				 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/stock/stock_process.jsp,v 1.23 2006/10/27 08:24:30 hmbao Exp $
*
* Purpose: Checker page for stock tab
* Description: Security Type - Aseet Based General Charge
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.23 $
* Date: $Date: 2006/10/27 08:24:30 $
* Tag: $Name:  $
*/
%>

<%
	TimeFreqList freqList = TimeFreqList.getInstance();
	
	StockForm aForm = (StockForm)request.getAttribute("AssetStockForm");
	
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	IGeneralCharge staging = (IGeneralCharge)itrxValue.getStagingCollateral();
	IGeneralCharge actual = (IGeneralCharge)itrxValue.getCollateral();
	
	InsurerNameList insurerNameList = InsurerNameList.getInstance();
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);		
	Collection stockSummaryList = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockSummaryList");
	
	pageContext.setAttribute("stockSummaryList",stockSummaryList);	
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
<script language="JavaScript" type="text/JavaScript">
<!--

function viewItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=StockAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

//-->
</script>
</head>

<body>
<html:form action="AssetGenChargeStock.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=StockAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="indexID"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td><h3>Stock</h3></td>
    </tr>
    <tr>
      <td><hr></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <tbody>
    <tr> 
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
          <thead>
          </thead>
          <tbody>
            <tr> 
              <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                  <thead>
                    <tr> 
                      <td width="4%">S/N</td>
                      <td width="11%">Stock</td>
                      <td width="10%">Stock Type </td>
                      <td width="11%">Address</td>
                      <td width="10%">Valuer</td>
                      <td width="8%">Valuation Date </td>
                      <td width="8%">Gross Value (CMS Security Currency) </td>
                      <td width="8%">Gross Value Less Creditors</td>
                      <td width="8%">Net Value (After Margin) </td>
                      <td width="8%">Insurance Policy No </td>
                      <td width="8%" >Insured Amount </td>
                      <td width="8%" >Effective Insured Amount</td>
                      <td width="8%">Recoverable Amount</td>
                    </tr>
                  </thead>
                  <tbody>
                <%
                	int counter = 0;
                %>
				<logic:present name="stockSummaryList">
		        <logic:iterate id="stockSummary" name="stockSummaryList" type="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBStockSummary" >
                    <tr class="<%=counter%2==0?"odd":"even"%>"> 
                      <td class="<bean:write name="stockSummary" property="compareResultKey"/>"><%=counter+1%></td>
                      <td><a href="#" onclick="viewItem('<%=stockSummary.getID()%>', '<%=CollateralConstant.STOCK%>')">
                      	  <integro:empty-if-null value="<%=stockSummary.getID()%>"/></a>
                      </td>
                      <td nowrap="nowrap">
                      <%
                      	if (stockSummary.getStockTypes() != null) {
	                      	for (int i = 0; i < stockSummary.getStockTypes().length; i++) {
                      %>
                      <integro:empty-if-null value="<%=stockSummary.getStockTypes()[i]%>"/><br>
                      <% } } else { %> - <% } %>
                      </td>
                      <td><integro:wrapper value="<%=stockSummary.getAddress()%>"/>&nbsp;</td>
                      <td><integro:empty-if-null value="<%=stockSummary.getValuerName()%>"/>&nbsp;</td>
                      <td><integro:date object="<%=stockSummary.getValuationDate()%>"/>&nbsp;</td>
                      <td class="amount" nowrap="nowrap">
	                      <integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(stockSummary.getGrossValue(), locale)%>"/>&nbsp;
                      </td>
                      <td class="amount" nowrap="nowrap">
                      	<integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(stockSummary.getGrossValueLessCreditorAmt(), locale)%>"/>&nbsp;
                      </td>
                      <td class="amount" nowrap="nowrap">
                      	<integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(stockSummary.getNetValue(), locale)%>"/>&nbsp;
                      </td>
                      <td nowrap="nowrap">
                      <%
                      	OBInsuranceSummary[] insuranceSummary = stockSummary.getInsuranceSummary();                      	
                      	if (insuranceSummary != null && insuranceSummary.length > 0) {
	                      	for (int i = 0; i < insuranceSummary.length; i++) {
                      %>
                      <integro:empty-if-null value="<%=insuranceSummary[i].getPolicyNumber()%>"/>                      
                      <br>
                      <% } } else { %> - <% } %>
                      </td>
                      <td style="text-align:right " nowrap="nowrap">
                      <%
                      	if (insuranceSummary != null && insuranceSummary.length > 0) {
	                      	for (int i = 0; i < insuranceSummary.length; i++) {		                      	
		                      	Amount amt = insuranceSummary[i].getInsuredAmount();
					  %>
					  <% if (insuranceSummary[i].isExpired()) { %> * <% } else { %> 
					  <integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(amt, locale)%>"/>&nbsp;
					  <% } %>
					  <br>
                      <% } } else { %> -  <% } %>
                      </td>
                      <td style="text-align:right " nowrap="nowrap">
                      <%
                      	if (insuranceSummary != null && insuranceSummary.length > 0) {
	                      	for (int i = 0; i < insuranceSummary.length; i++) {		                      	
		                      	Amount amt = insuranceSummary[i].getCoverageAmount();
					  %>							
					  <% if (insuranceSummary[i].isExpired()) { %> * <% } else { %> 
					  <integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(amt, locale)%>"/>&nbsp;
					  <% } %>
					  <br>
                      <% } } else { %> -  <% } %>
                      </td>
                      <td style="text-align:right ">
                      	<integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(stockSummary.getRecoverableAmount(), locale)%>"/>&nbsp;
                      </td>
                    </tr>
                    <%
                    	counter++;
                    %>
		        </logic:iterate>
		        <%
		        	if (counter == 0) {
		        %>
		        <tr class="odd"><td colspan="13">There is no stock information.</td></tr>
		        <% } %>
		        </logic:present>
		        <logic:notPresent name="stockSummaryList" >
		        <tr class="odd">
		        	<td colspan="14">There is no stock information.</td>
		        </tr>
		        </logic:notPresent>
                    
                    <tr class="even">
                      <td colspan="6" class="total">Total</td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalGrossValCMS"/>&nbsp;
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalGrossCreditor"/>&nbsp;
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalNetValue"/>&nbsp;
                      </td>
                      <td class="total">&nbsp;</td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalStockInsuredAmt"/>&nbsp;
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalStockEffectiveAmt"/>&nbsp;
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalInsuranceCover"/>&nbsp;
                      </td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><strong>Insurance policies which have expired beyond the grace period would be denoted by a (*), thus rendering no insured amount.</strong></td>
    </tr>        
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr> 
      <td><h3>Insurance Policies</h3></td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
        <thead>
          <tr>
            <td width="5%">S/N</td>
            <td width="22%">Insurance Policy No </td>
            <td width="30%">Insurer's Name </td>
            <td width="22%">Insured Amount </td>
            <td width="21%">Expiry Date  </td>
          </tr>
        </thead>
        <tbody>
        <%
        	HashMap actualMap = (HashMap)actual.getInsurance();        	
        	HashMap stageMap = (HashMap)staging.getInsurance();
        	        	
        	
        	IInsurancePolicy[] actualList = null;
        	IInsurancePolicy[] stageList = null;
        	
        	if (actualMap != null) {
	        	actualList = AssetGenChargeUtil.getInsuranceListByCategory(actualMap, IInsurancePolicy.STOCK);
        	}
        	
        	if (stageMap != null) {
	        	stageList = AssetGenChargeUtil.getInsuranceListByCategory(stageMap, IInsurancePolicy.STOCK);
        	}
        	
        	List res = null;
        	if (stageList != null || actualList != null) {
        		res = CompareOBUtil.compOBArray(stageList,actualList);        
    		}
    	    
        	if (res == null || res.size() == 0) {
        %>
        <tr class="odd"><td colspan="5">There is no insurance policy's information.</td></tr>
        <% 
        	} else { 
	        	CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);	        
	        	Arrays.sort(resultList, new InsuranceInfoComparator());
	        	CurrencyCode ccy = new CurrencyCode(staging.getCurrencyCode());
	        	for (int i = 0; i < resultList.length; i++) {
		        	String key = resultList[i].getKey();
		        	IInsurancePolicy insurance = (IInsurancePolicy)resultList[i].getObj();
		        	if (key.equals(CompareOBUtil.OB_UNMODIFIED)) {
			        	key = AssetGenChargeUtil.getInsuranceObjLinkageStatus (insurance.getRefID(), actual, staging, CollateralConstant.TAB_STOCK);
		        	}
	    %>        
          <tr class="<%=i%2==0?"odd":"even"%>">
            <td class="<%=key%>"><%=i+1%></td>
            <td >
            	<a href="#" onclick="viewItem('<%=insurance.getRefID()%>', '<%=CollateralConstant.INSURANCE_POLICY%>')">
            	<integro:empty-if-null value="<%=insurance.getPolicyNo()%>"/>
            	</a>
            </td>
            <td >
            	<integro:empty-if-null value="<%=insurerNameList.getInsurerNameItem(insurance.getInsurerName())%>"/>&nbsp;
            </td>
            <td  style="text-align:right ">
            	<integro:empty-if-null value="<%=AssetGenChargeUtil.getCMSAmount(insurance.getInsuredAmount(), ccy, locale)%>"/>&nbsp;
            </td>
            <td ><integro:date object="<%=insurance.getExpiryDate()%>"/>&nbsp;</td>
          </tr>
		<% 
				}
			} 
		%>                    
          <tr class="even">
            <td class="total">&nbsp;</td>
            <td colspan="2" class="total">Total</td>
            <td class="total" style="text-align:right">
            	<bean:write name="AssetStockForm" property="totalInsuredAmt"/>&nbsp;
            </td>
            <td class="total">&nbsp;</td>
         </tr>
          <tr class="even">
            <td class="total">&nbsp;</td>
            <%
            	boolean isSame = CompareOBUtil.compOB(staging,actual, "stockInsrGracePeriod");
            	if (isSame) {
	            	isSame = CompareOBUtil.compOB(staging,actual, "stockInsrGracePeriodFreq");
            	}
            %>            
            <td colspan="2" class="<%=isSame?"total":"fieldnamediff"%>">Total Valid Insurance Cover Available &nbsp;<font color="#0000FF">* </font>&nbsp;(inclusive of policies expired up to<span class="amount">
            	<bean:write name="AssetStockForm" property="insCoverNum"/>&nbsp;
            	<integro:empty-if-null value="<%=freqList.getTimeFreqItem(aForm.getInsCoverUnit())%>"/>              	
            </span> as at <integro:date object="<%=DateUtil.getDate()%>"/>)</td>
            <td class="total" style="text-align:right">
            	<bean:write name="AssetStockForm" property="totalValidCoverInsAmt"/>&nbsp;
            </td>
            <td class="total">&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td width="100%"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" style="margin-top:15px ">
        <tbody>
          <tr class="odd">
            <td width="20%" valign="top" class="fieldname">CMS Sec Currency</td>
            <td width="30%" valign="top">
            	<bean:write name="AssetStockForm" property="cmsSecCurreny"/>&nbsp;
            </td>
            <td width="20%" valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - Stock</td>
            <td width="30%" valign="top" class="amount">
            	<bean:write name="AssetStockForm" property="valuationCMVStock"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
            <td valign="top" class="fieldname">Average Margin for All Stock IDs (%)</td>
            <td  valign="top">
            	<bean:write name="AssetStockForm" property="margin"/>&nbsp;
            </td>
            <td valign="top" class="fieldname">Valuation FSV - Stock (CMS Post-haircut)</td>
            <td  valign="top" class="amount">
            	<bean:write name="AssetStockForm" property="valuationFSVStock"/>&nbsp;
            </td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr>
	<td><table width="246" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      </tr>
      	<td>&nbsp;</td>
      <tr>
        <td align="center"><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
	</tr>
  </thead>
  <tbody>
  </tbody>
</table>

</html:form>
 
</body>
</html>
