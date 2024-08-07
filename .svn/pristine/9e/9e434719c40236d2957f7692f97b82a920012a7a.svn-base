<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.StockAction,
				 com.integrosys.base.techinfra.util.DateUtil,
				 java.util.Locale,
				 java.util.Arrays,
				 java.util.Collection,
				 java.util.HashMap,				 
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBInsuranceSummary,				 
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
				 com.integrosys.cms.ui.collateral.TimeFreqList,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.StockForm,				 
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.collateral.CollateralConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/stock/stock_update.jsp,v 1.23 2006/10/27 08:24:30 hmbao Exp $
*
* Purpose: Update the data of the Stock Item
* Description: Type - Asset Based: General Charge - Stock
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.23 $
* Date: $Date: 2006/10/27 08:24:30 $
* Tag: $Name:  $
*/
%>
<%@ include file="/collateral/checkIsSSC.jsp"%>

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	IGeneralCharge iCol = (IGeneralCharge)itrxValue.getStagingCollateral();
	
	boolean isOnlyEditInsurance = itrxValue.getCollateral().getCollateralLocation().equals(ICMSUIConstant.COUNTRY_MALAYSIA);
	
	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
	InsurerNameList insurerNameList = InsurerNameList.getInstance();
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);	
	Collection stockSummaryList = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockSummaryList");
	pageContext.setAttribute("stockSummaryList",stockSummaryList);
	StockForm aForm = (StockForm)request.getAttribute("AssetStockForm");
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
function submitPage(num) {
	if (num == 1) {
		document.forms[0].event.value="<%=StockAction.EVENT_REFRESH%>";
	}

    document.forms[0].submit();
}

function editItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=StockAction.EVENT_PREPARE_UPDATE_SUB%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function addItem(type) {
    document.forms[0].event.value = type+"_"+"<%=StockAction.EVENT_PREPARE%>";
    document.forms[0].indexID.value = "-1";

    document.forms[0].submit();
}

function viewItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=StockAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}


function deleteItem(type) {
        var delObj;
        var str;
        if (type == "<%=CollateralConstant.STOCK%>") {
            delObj = document.forms[0].stockItemDelete;
            str = "Stock";
        } else {
            delObj = document.forms[0].insuranceItemDelete;
            str = "Insurance Policy";
        }
        var valid = false;
        if (delObj != null) {
	        if (!delObj.length) {
	            valid = delObj.checked;
	        } else {
	            for (i = 0; i < delObj.length; i++) {
	                if (delObj[i].checked) {
	                    valid = true;
	                }
	            }
	        }
	        if (!valid) {
	            alert('At least one '+str+' must be checked');
	            return false;
	        }
    	} else {
	    	alert('There is no '+str+' to be removed');
	    	return false;
    	}

    document.forms[0].event.value = type+"_"+"<%=StockAction.EVENT_DELETE_ITEM%>";
    document.forms[0].submit();
}

//-->
</script>
</head>

<body>
<html:form action="AssetGenChargeStock.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=StockAction.EVENT_EDIT%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="next_page"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td width="79%"><h3>Stock</h3></td>
      <td width="21%" align="right" valign="baseline"> 
      <%
      	if (isSSC || !isOnlyEditInsurance) {
      %>
      <table width="80"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
        <td align="right" valign="bottom" width="8%">
            <input name="stockAddNew" type="button" class="btnNormal" value="Add New" onclick="javascript:addItem('<%=CollateralConstant.STOCK%>')"/>
        </td>
        <td width="8%" valign="baseline" align="right">
            <input name="StockDelete" type="button" class="btnNormal" value="Remove" onclick="javascript:deleteItem('<%=CollateralConstant.STOCK%>')"/>
        </td>
        </tr>
      </table>
      <% } %>
	  </td>
    </tr>
    <tr>
      <td colspan="2"><hr></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
          <thead>
          </thead>
          <tbody>
            <tr> 
              <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                  <thead>
                    <tr> 
                      <td width="3%">S/N</td>
                      <td width="10%">Stock</td>
                      <td width="10%" >Stock Type </td>
                      <td width="10%">Address</td>
                      <td width="10%">Valuer</td>
                      <td width="8%">Valuation Date </td>
                      <td width="9%">Gross Value (CMS Security Currency) </td>
                      <td width="8%">Gross Value Less Creditors</td>
                      <td width="9%">Net Value (After Margin) </td>
                      <td width="9%" >Insurance Policy No </td>
                      <td width="9%" >Insured Amount </td>
                      <td width="8%" >Effective Insured Amount</td>
                      <td width="9%">Recoverable Amount </td>
                      <% if (isSSC || !isOnlyEditInsurance) { %>
                      <td width="6%">Remove</td>
                      <% } %>
                    </tr>
                  </thead>
                  <tbody>
                <%
                	int counter = 0;
                %>
				<logic:present name="stockSummaryList">
		        <logic:iterate id="stockSummary" name="stockSummaryList" type="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBStockSummary" >
                    <tr class="<%=counter%2==0?"odd":"even"%>"> 
                      <td class="index"><%=counter+1%></td>
                      <% if (!isSSC && isOnlyEditInsurance) { %>
                      <td><a href="#" onclick="viewItem('<%=stockSummary.getID()%>', '<%=CollateralConstant.STOCK%>')">
                      	  <integro:empty-if-null value="<%=stockSummary.getID()%>"/></a>
                      </td>                      
                      <% } else { %>                      
                      <td><a href="#" onclick="editItem('<%=stockSummary.getID()%>', '<%=CollateralConstant.STOCK%>')">
                      	  <integro:empty-if-null value="<%=stockSummary.getID()%>"/></a>
                      </td>
                      <% } %>
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
                      <% if (isSSC || !isOnlyEditInsurance) { %>
                      <td style="text-align:center ">
						<html:multibox property="stockItemDelete" value="<%=stockSummary.getID()%>"/>
						<%
							String deleteStockErr = "stockItemDelete" + stockSummary.getID(); 
						%>
						<html:errors property="<%=deleteStockErr%>"/>
                      </td>
                      <% } %>
                    </tr>
                    <%
                    	counter++;
                    %>
		        </logic:iterate>
		        <%
		        	if (counter == 0) {
		        %>
		        <tr class="odd"><td colspan="<%=(!isSSC && isOnlyEditInsurance)?"13":"14"%>">There is no stock information.</td></tr>
		        <% } %>
		        </logic:present>
		        <logic:notPresent name="stockSummaryList" >
		        <tr class="odd">
		        	<td colspan="<%=(!isSSC && isOnlyEditInsurance)?"13":"14"%>">There is no stock information.</td>
		        </tr>
		        </logic:notPresent>
                    
                    <tr class="even">
                      <td colspan="6" class="total">Total</td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalGrossValCMS"/>&nbsp;
                      	<html:hidden property="totalGrossValCMS"/>
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalGrossCreditor"/>&nbsp;
                      	<html:hidden property="totalGrossCreditor"/>
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalNetValue"/>&nbsp;
                      	<html:hidden property="totalNetValue"/>
                      </td>
                      <td class="total">&nbsp;</td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalStockInsuredAmt"/>&nbsp;
                      	<html:hidden property="totalStockInsuredAmt"/>
                      </td>
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalStockEffectiveAmt"/>&nbsp;
                      	<html:hidden property="totalStockEffectiveAmt"/>
                      </td>                      
                      <td class="total" style="text-align:right " nowrap="nowrap">
                      	<bean:write name="AssetStockForm" property="totalInsuranceCover"/>&nbsp;
                      	<html:hidden property="totalInsuranceCover"/>
                      </td>
                      <% if (isSSC || !isOnlyEditInsurance) { %>
                      <td class="total" style="text-align:right ">&nbsp;</td>
                      <% } %>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><strong>Insurance policies which have expired beyond the grace period would be denoted by a (*), thus rendering no insured amount.</strong></td>
    </tr>    
    <tr>
      <td><html:errors property="stockItemDelete"/></td>
    </tr>    
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr> 
      <td width="81%"><h3>Insurance Policies</h3></td>
      <td width="19%" valign="bottom" style="text-align:right ">
      <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>
      <table width="80"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
        <td align="right" valign="bottom" width="8%">
            <input name="insPolicyAddNew" type="button" class="btnNormal" value="Add New" onclick="javascript:addItem('<%=CollateralConstant.INSURANCE_POLICY%>')"/>
        </td>
        <td width="8%" valign="baseline" align="right">
            <input name="insPolicyDelete" type="button" class="btnNormal" value="Remove" onclick="javascript:deleteItem('<%=CollateralConstant.INSURANCE_POLICY%>')"/>
        </td>
        </tr>
      </table>
      <% } %>
	  </td>
    </tr>
    <tr> 
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
        <thead>
          <tr>
            <td width="4%">S/N</td>
            <td width="22%">Insurance Policy No </td>
            <td width="29%">Insurer's Name </td>
            <td width="16%">Insured Amount </td>
            <td width="19%">Expiry Date  </td>
            <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>
            <td width="10%">Remove</td>
            <% } %>
          </tr>
        </thead>
        <tbody>
        <%
        	HashMap insuranceMap = (HashMap)iCol.getInsurance();
        	if (insuranceMap == null || insuranceMap.isEmpty()) {
        %>
        <tr class="odd"><td colspan="<%=(!isSSC || (isSSC && !isOnlyEditInsurance))?"6":"5"%>">There is no insurance policy's information.</td></tr>
        <% 
        	} else { 
	        	Collection insuranceList = insuranceMap.keySet();
	        	String[] insuranceIDList = (String[])insuranceList.toArray(new String[0]);
	        	Arrays.sort(insuranceIDList);
	        	CurrencyCode ccy = new CurrencyCode(iCol.getCurrencyCode());
	        	int count = 0;
	        	for (int i = 0; i < insuranceIDList.length; i++) {
		        	IInsurancePolicy insurance = (IInsurancePolicy)insuranceMap.get(insuranceIDList[i]);
		        	if (insurance.getCategory().equals(IInsurancePolicy.STOCK)) {
	    %>        
          <tr class="<%=(count%2==0)?"odd":"even"%>">
            <td width="4%" class="index"><%=count+1%></td>
            <td width="22%">
            <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>
            	<a href="#" onclick="editItem('<%=insuranceIDList[i]%>', '<%=CollateralConstant.INSURANCE_POLICY%>')">
            	<integro:empty-if-null value="<%=insurance.getPolicyNo()%>"/>
            	</a>
            <% } else { %>
            	<a href="#" onclick="viewItem('<%=insuranceIDList[i]%>', '<%=CollateralConstant.INSURANCE_POLICY%>')">
            	<integro:empty-if-null value="<%=insurance.getPolicyNo()%>"/>
            	</a>            
            <% } %>
            </td>
            <td width="29%">
            	<integro:empty-if-null value="<%=insurerNameList.getInsurerNameItem(insurance.getInsurerName())%>"/>&nbsp;
            </td>
            <td width="16%" style="text-align:right ">
            	<integro:empty-if-null value="<%=AssetGenChargeUtil.getCMSAmount(insurance.getInsuredAmount(), ccy, locale)%>"/>&nbsp;
            </td>
            <td width="19%"><integro:date object="<%=insurance.getExpiryDate()%>"/>&nbsp;</td>
            <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>            
            <td width="10%" style="text-align:center ">
				<html:multibox property="insuranceItemDelete" value="<%=insurance.getRefID()%>"/>
            </td>
            <% } %>
          </tr>
		<% 				count++;
					}
				}
				if (count == 0) {
		%>
		<tr class="odd"><td colspan="<%=(!isSSC || (isSSC && !isOnlyEditInsurance))?"6":"5"%>">There is no insurance policy's information.</td></tr>
		<%
				} else {
		%>
		<input type="hidden" name="hasInsurance" value="<%=ICMSConstant.TRUE_VALUE%>"/>
		<%		}
			} 
		%>          
          <tr class="even">
            <td class="total">&nbsp;</td>
            <td colspan="2" class="total">Total</td>
            <td class="total" style="text-align:right">
            	<bean:write name="AssetStockForm" property="totalInsuredAmt"/>&nbsp;
            	<html:hidden property="totalInsuredAmt"/>
            </td>
            <td class="total">&nbsp;</td>
            <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>
            <td class="total">&nbsp;</td>
            <% } %>
          </tr>
          <tr class="even">
            <td class="total">&nbsp;</td>
            <td colspan="2" class="total">Total Valid Insurance Cover Available &nbsp;<font color="#0000FF">* </font>&nbsp;(inclusive of policies expired up to
            <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>
            <html:text property="insCoverNum" maxlength="3" size="3"/>
            <html:select property="insCoverUnit">
            <option value="" >Please Select </option>
            <html:options name="freqID" labelName="freqValue"/>
            </html:select>&nbsp;
            as at <integro:date object="<%=DateUtil.getDate()%>"/>)
            <html:errors property="insCoverNum" />
            <html:errors property="insCoverUnit" />            
            <% } else { %>
            <bean:write name="AssetStockForm" property="insCoverNum"/>&nbsp;
            <integro:empty-if-null value="<%=TimeFreqList.getInstance().getTimeFreqItem(aForm.getInsCoverUnit())%>"/>&nbsp;
            as at <integro:date object="<%=DateUtil.getDate()%>"/>)
            <html:hidden property="insCoverNum" />
            <html:hidden property="insCoverUnit" />            
            <% } %>
            </td>
            <td class="total" style="text-align:right">
            	<bean:write name="AssetStockForm" property="totalValidCoverInsAmt"/>&nbsp;
            	<html:hidden property="totalValidCoverInsAmt"/>
            </td>
            <td class="total">&nbsp;</td>
            <% if (!isSSC || (isSSC && !isOnlyEditInsurance)) { %>            
            <td class="total">&nbsp;</td>
            <% } %>
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
            	<html:hidden property="cmsSecCurreny"/>
            </td>
            <td width="20%" valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - Stock</td>
            <td width="30%" valign="top" class="amount">
            	<bean:write name="AssetStockForm" property="valuationCMVStock"/>&nbsp;
            	<html:hidden property="valuationCMVStock"/>
            </td>
          </tr>
          <tr class="even">
            <td valign="top" class="fieldname">Average Margin for All Stock IDs (%)</td>
            <td  valign="top">
            	<bean:write name="AssetStockForm" property="margin"/>&nbsp;
            	<html:hidden property="margin"/>
            </td>
            <td valign="top" class="fieldname">Valuation FSV - Stock (CMS Post-haircut)</td>
            <td  valign="top" class="amount">
            	<bean:write name="AssetStockForm" property="valuationFSVStock"/>&nbsp;
            	<html:hidden property="valuationFSVStock"/>            
            </td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr>
	<td><table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      </tr>
        <td width="96">&nbsp;</td>
        <td width="54">&nbsp;</td>
      <tr>
        <td><a href="#" onclick="submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/refresh2.gif',1)"><img src="img/refresh1.gif" name="Image2" width="80" height="20" border="0" id="Image2" /></a></td>      
      <%
      	if (from_page != null && from_page.equals(StockAction.EVENT_PROCESS_UPDATE)) {
      %>
		<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>      
	  <% } else { %>
        <td><a href="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getCollateral().getCollateralID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
      <% } %>
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
