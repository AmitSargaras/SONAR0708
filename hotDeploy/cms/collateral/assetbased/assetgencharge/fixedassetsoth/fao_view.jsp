<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.fixedassetsoth.FAOAction,
				 com.integrosys.base.techinfra.util.DateUtil,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.fixedassetsoth.FAOForm,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
				 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,				 
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.ui.collateral.CollateralConstant,
				 com.integrosys.cms.ui.collateral.TimeFreqList,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,
				 java.util.Locale,
				 java.util.HashMap,
				 java.util.Collection,
				 java.util.Arrays,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBInsuranceSummary,
				 com.integrosys.cms.app.limit.bus.OBLimitProfile"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/fixedassetsoth/fao_view.jsp,v 1.18 2006/10/27 08:24:08 hmbao Exp $
*
* Purpose: FAO Tab
* Description: Type - Asset Based: General charge
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:24:08 $
* Tag: $Name:  $
*/
%>

<%
	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();

	if (from_page.equals(FAOAction.EVENT_READ)) {
		iCol = (IGeneralCharge)itrxValue.getCollateral();
	}
	
	FAOForm aForm = (FAOForm)request.getAttribute("AssetFAOForm");
	
	InsurerNameList insurerNameList = InsurerNameList.getInstance();
	TimeFreqList freqList = TimeFreqList.getInstance();	
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);	
	Collection faoSummaryList = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.faoSummaryList");
	pageContext.setAttribute("faoSummaryList",faoSummaryList);		
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

    document.forms[0].submit();
}

function viewItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=FAOAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}
//-->
</script>
</head>

<body>
<html:form action="AssetGenChargeFAO.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=FAOAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="next_page"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td width="79%"><h3>Fixed Assets/Others (FAO)</h3></td>
      <td width="21%" align="right" valign="baseline"> 
	  </td>
    </tr>
    <tr>
      <td colspan="2"><hr></td>
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
                      <td width="10%">FAO ID </td>
                      <td width="11%">Description</td>
                      <td width="13%">Valuer</td>
                      <td width="8%">Valuation Date</td>
                      <td width="9%">Gross Value(CMS Security Currency)</td>
                      <td width="9%">Net Value (After Margin)</td>
                      <td width="9%">Insurance Policy No</td>
                      <td width="9%">Insured Amount</td>
                      <td width="9%">Effective Insured Amount</td>
                      <td width="9%">Recoverable Amount</td>
                    </tr>
                  </thead>
                  <tbody>
                <%
                	int counter = 0;
                %>
				<logic:present name="faoSummaryList" >
		        <logic:iterate id="faoSummary" name="faoSummaryList" type="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBFixedAssetOthersSummary" >
                    <tr class="<%=counter%2==0?"odd":"even"%>"> 
                      <td class="index"><%=counter+1%></td>
                      <td><a href="#" onclick="viewItem('<%=faoSummary.getID()%>', '<%=CollateralConstant.FAO%>')">
                      	  <integro:empty-if-null value="<%=faoSummary.getID()%>"/></a>
                      </td>
                      <td>
                      	<integro:empty-if-null value="<%=faoSummary.getDescription()%>"/>&nbsp;
                      </td>
                      <td><integro:empty-if-null value="<%=faoSummary.getValuerName()%>"/>&nbsp;</td>
                      <td><integro:date object="<%=faoSummary.getValuationDate()%>"/>&nbsp;</td>
                      <td class="amount" nowrap="nowrap">
                      	<integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(faoSummary.getGrossValue(), locale)%>"/>&nbsp;
                      </td>
                      <td class="amount" nowrap="nowrap">
                      	<integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(faoSummary.getNetValue(), locale)%>"/>&nbsp;
                      </td>
                      <td nowrap="nowrap">
                      <%
                      	OBInsuranceSummary[] insuranceSummary = faoSummary.getInsuranceSummary();
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
                      	<integro:empty-if-null value="<%=AssetGenChargeUtil.convertAmtToStringWForex(faoSummary.getRecoverableAmount(), locale)%>"/>&nbsp;
                      </td>
                    </tr>
                    <%
                    	counter++;
                    %>
		        </logic:iterate>
		        <%
		        	if (counter == 0) {
		        %>
		        <tr class="odd"><td colspan="13">There is no Fixed Assets/Others (FAO) information.</td></tr>
		        <% } %>
		        </logic:present>
		        <logic:notPresent name="faoSummaryList" >
		        <tr class="odd">
		        	<td colspan="13">There is no Fixed Assets/Others (FAO) information.</td>
		        </tr>
		        </logic:notPresent>                    
                    <tr class="even">
                      <td colspan="5" class="total">Total</td>
                      <td class="total" style="text-align:right "><bean:write name="AssetFAOForm" property="totalGrossValCMS"/>&nbsp;</td>
                      <td class="total" style="text-align:right "><bean:write name="AssetFAOForm" property="totalNetValue"/>&nbsp;</td>
                      <td class="total">&nbsp;</td>
                      <td class="total" style="text-align:right "><bean:write name="AssetFAOForm" property="totalFAOInsuredAmt"/>&nbsp;</td>
                      <td class="total" style="text-align:right "><bean:write name="AssetFAOForm" property="totalFAOEffectiveAmt"/>&nbsp;</td>
                      <td class="total" style="text-align:right "><bean:write name="AssetFAOForm" property="totalInsuranceCover"/>&nbsp;</td>
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
      <td width="81%"><h3>Insurance Policies</h3></td>
      <td width="19%" valign="bottom" style="text-align:right ">
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
            <td width="5%">S/N</td>
            <td width="22%">Insurance Policy No </td>
            <td width="30%">Insurer's Name </td>
            <td width="22%">Insured Amount </td>
            <td width="21%">Expiry Date  </td>
          </tr>
        </thead>
        <tbody>
        <%
        	HashMap insuranceMap = (HashMap)iCol.getInsurance();
        	if (insuranceMap == null || insuranceMap.isEmpty()) {
        %>
        <tr class="odd"><td colspan="5">There is no insurance policy's information.</td></tr>
        <% 
        	} else { 
	        	Collection insuranceList = insuranceMap.keySet();
	        	String[] insuranceIDList = (String[])insuranceList.toArray(new String[0]);
	        	Arrays.sort(insuranceIDList);
	        	CurrencyCode ccy = new CurrencyCode(iCol.getCurrencyCode());
	        	int count = 0;
	        	for (int i = 0; i < insuranceIDList.length; i++) {
		        	IInsurancePolicy insurance = (IInsurancePolicy)insuranceMap.get(insuranceIDList[i]);
		        	if (insurance.getCategory().equals(IInsurancePolicy.FAO)) {
	    %>        
          <tr class="<%=(count%2==0)?"odd":"even"%>">
            <td class="index"><%=count+1%></td>
            <td >
            	<a href="#" onclick="viewItem('<%=insuranceIDList[i]%>', '<%=CollateralConstant.INSURANCE_POLICY%>')">
            	<integro:empty-if-null value="<%=insurance.getPolicyNo()%>"/>
            	</a>
            </td>
            <td >
            	<integro:empty-if-null value="<%=insurerNameList.getInsurerNameItem(insurance.getInsurerName())%>"/>&nbsp;
            </td>
            <td style="text-align:right ">
            	<integro:empty-if-null value="<%=AssetGenChargeUtil.getCMSAmount(insurance.getInsuredAmount(), ccy, locale)%>"/>&nbsp;
            </td>
            <td ><integro:date object="<%=insurance.getExpiryDate()%>"/>&nbsp;</td>
          </tr>
		<% 				count++;
					}
				}
				if (count == 0) {
		%>
		<tr class="odd"><td colspan="5">There is no insurance policy's information.</td></tr>
		<%
				}
			} 
		%>                    
          <tr class="even">
            <td class="total">&nbsp;</td>
            <td colspan="2" class="total">Total</td>
            <td class="total" style="text-align:right">
            	<bean:write name="AssetFAOForm" property="totalInsuredAmt"/>&nbsp;
            </td>
            <td class="total">&nbsp;</td>
         </tr>
          <tr class="even">
            <td class="total">&nbsp;</td>
            <td colspan="2" class="total">Total Valid Insurance Cover Available &nbsp;<font color="#0000FF">* </font>&nbsp;(inclusive of policies expired up to<span class="amount">
            	<bean:write name="AssetFAOForm" property="insCoverNum"/>&nbsp;
            	<integro:empty-if-null value="<%=freqList.getTimeFreqItem(aForm.getInsCoverUnit())%>"/>              	
            </span> as at <integro:date object="<%=DateUtil.getDate()%>"/>)</td>
            <td class="total" style="text-align:right">
            	<bean:write name="AssetFAOForm" property="totalValidCoverInsAmt"/>&nbsp;
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
            <td width="30%" valign="top"><bean:write name="AssetFAOForm" property="cmsSecCurreny"/>&nbsp;</td>
            <td width="20%" valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - FAO</td>
            <td width="30%" valign="top" class="amount"><bean:write name="AssetFAOForm" property="valuationCMVFAO"/>&nbsp;</td>
          </tr>
          <tr class="even">
            <td valign="top" class="fieldname">Average Margin for All FAO IDs (%)</td>
            <td valign="top"><bean:write name="AssetFAOForm" property="margin"/>&nbsp;</td>
            <td valign="top" class="fieldname">Valuation FSV - FAO (CMS Post-haircut)</td>
            <td valign="top" class="amount"><bean:write name="AssetFAOForm" property="valuationFSVFAO"/>&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr>
	<td><table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      </tr>
      	<td>&nbsp;</td>
      <tr align="center">
      <%
      	if (from_page != null && from_page.equals(FAOAction.EVENT_TRACK)) {
      %>
		<td align="center"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>      
	  <% 
	  	} else if (from_page != null & from_page.equals(FAOAction.EVENT_PREPARE_CLOSE)) { 
	  %>
        <td align="center"><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
	  <% } else { %>	  
  <%
      OBCMSCustomer obCMSCustomer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
      OBLimitProfile obLimitProfile = (OBLimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
      String flag1 = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.flag1");
      String link="";
             if (flag1!=null){
                  if(flag1.equals("1")){

                  link ="CollateralSearch.do?event=list1&collateralId="+iCol.getSCISecurityID();
                  }else {

                  link="CustomerProcess.do?event=viewsecurities&customerID="+obCMSCustomer.getCustomerID()+"&limitProfileID="+obLimitProfile.getLimitProfileID();
                  }
              }else {
                  link="CustomerProcess.do?event=viewsecurities&customerID="+obCMSCustomer.getCustomerID()+"&limitProfileID="+obLimitProfile.getLimitProfileID();
              }
                %>
    	<td><a href="<%=link%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
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
