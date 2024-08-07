<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceAction,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceForm,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IStock,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBStock,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IFixedAssetOthers,				 
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBFixedAssetOthers,				 
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceObjLinkage,		
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,		 
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.Locale,
                 java.util.HashMap,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.ui.collateral.InsuranceTypeList"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/insurance/chk_view_insurance.jsp,v 1.18 2006/10/27 08:24:22 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:24:22 $
* Tag: $Name:  $
*/
%>

<%
	String indexID = (String)request.getParameter("indexID");
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

	IGeneralCharge actualCol = (IGeneralCharge)itrxValue.getCollateral();
	IGeneralCharge stageCol = (IGeneralCharge)itrxValue.getStagingCollateral();

	InsuranceForm aForm = (InsuranceForm)request.getAttribute("AssetInsuranceForm");

	IInsurancePolicy originOB = (IInsurancePolicy)request.getAttribute("actualInsurance");
	IInsurancePolicy stagingOB = (IInsurancePolicy)request.getAttribute("stageInsurance");

	CurrencyCode ccy = new CurrencyCode(stageCol.getCurrencyCode());
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

	String le_id_bca_ref_num = (String)request.getAttribute("le_id_bca_ref_num");
	System.out.println("le_id_bca_ref_num:" +le_id_bca_ref_num);
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
function returnPage() {
    document.forms[0].event.value = "<%=InsuranceAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="AssetInsurance.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=InsuranceAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="81%" ><h3>View Insurance (<%=CollateralConstant.TAB_STOCK.equals(tab)?"Stock":"Fixed Assets/Others"%>)</h3></td>
      <td width="19%" align="right" valign="bottom" >&nbsp; </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td width="40%" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "policyNo")?"fieldname":"fieldnamediff"%>">Insurance Policy Number&nbsp;<font color="#0000FF">* </font></td>
              <td width="60%">
              	<bean:write name="AssetInsuranceForm" property="insPolicyNum"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "insurerName")?"fieldname":"fieldnamediff"%>">Insurer's Name&nbsp;<font color="#0000FF">* </font></td>
              <td valign="top">
              <integro:empty-if-null value="<%=InsurerNameList.getInstance().getInsurerNameItem(aForm.getInsurerName())%>"/> &nbsp;
              </td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "insuranceType")?"fieldname":"fieldnamediff"%>">Insurance Type&nbsp;<font color="#0000FF">* </font></td>
              <td>
              <integro:empty-if-null value="<%=InsuranceTypeList.getInstance().getInsuranceTypeItem(aForm.getInsuranceType())%>"/> &nbsp;
              </td>
            </tr>
            <tr class="odd">
		  <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "lmtProfileId")?"fieldname":"fieldnamediff"%>">LEID & BCA</td>
		 <td><integro:empty-if-null value="<%=le_id_bca_ref_num%>"/> &nbsp;
		  </td>
	   </tr>
	 <tr class="even">
		  <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "documentNo")?"fieldname":"fieldnamediff"%>">Document No</td>
		  <td><bean:write name="AssetInsuranceForm" property="documentNo"/>&nbsp;
		</td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "expiryDate")?"fieldname":"fieldnamediff"%>">Expiry Date of Insurance&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetInsuranceForm" property="expiryDateIns"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "currencyCode")?"fieldname":"fieldnamediff"%>">Insurance Policy Currency</td>
              <td><bean:write name="AssetInsuranceForm" property="insPolicyCurrency"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
            <%
            	Amount stagingAmt = (stagingOB==null)?null:stagingOB.getInsurableAmount();
            	Amount actualAmt = (originOB==null)?null:originOB.getInsurableAmount();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Insurable Amount</td>
              <td><bean:write name="AssetInsuranceForm" property="insurableAmt"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
            <%
            	stagingAmt = stagingOB==null?null:stagingOB.getInsuredAmount();
            	actualAmt = originOB==null?null:originOB.getInsuredAmount();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Insured Amount&nbsp;<font color="#0000FF">* </font> </td>
              <td><bean:write name="AssetInsuranceForm" property="insuredAmt"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">CMS Security Currency</td>
              <td>
              	<bean:write name="AssetInsuranceForm" property="cmsSecurityCurrency"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Insured Amount (Sec Currency)</td>
              <td>
              	<bean:write name="AssetInsuranceForm" property="insuredAmtCMS"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "effectiveDate")?"fieldname":"fieldnamediff"%>">Effective Date of Insurance&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetInsuranceForm" property="effectiveDateIns"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "insuredAgainst")?"fieldname":"fieldnamediff"%>">Insured Against </td>
              <td><integro:wrapper value="<%=aForm.getInsuredAgainst()%>"/>&nbsp;</td>
              </td>
            </tr>
          </tbody>
        </table>
	  <tr>
		<td colspan="2"><h3>Insured Against <%=CollateralConstant.TAB_STOCK.equals(tab)?"Stock":"Fixed Assets/Others (FAO)"%></h3>
	    <hr> </td>
		</tr>
		<tr>
		<td colspan="2">
		<%
			if (CollateralConstant.TAB_STOCK.equals(tab)) { // display stock information
		%>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
              <tr>
                <td width="5%">S/N</td>
                <td width="20%">Stock ID </td>
                <td width="20%">Stock Type </td>
                <td width="20%">Address</td>
                <td width="17%">Gross Value</td>
                <td width="18%">Net Value (after Margin) </td>
              </tr>
            </thead>
            <tbody>
            <%
            	OBInsuranceObjLinkage[] linkage = AssetGenChargeUtil.compareInsuranceObjLinkage(indexID, tab, itrxValue);
            	if (linkage == null || linkage.length == 0) {
	        %>
	        <tr class="odd"><td colspan="6">There is no stock information</td></tr>
	        <% 
        		} else {
            	HashMap actualMap = (HashMap)actualCol.getStocks();
            	HashMap stageMap = (HashMap)stageCol.getStocks();            
            	for (int i = 0; i < linkage.length; i++) {
	            	IStock stock = null;
	            	if (linkage[i].getStatus().equals(CompareOBUtil.OB_DELETED)) {
		            	stock = (IStock)actualMap.get(linkage[i].getObjID());
	            	} else {
		            	stock = (IStock)stageMap.get(linkage[i].getObjID());
	            	}
            %>
              <tr class="<%=i%2==0?"odd":"even"%>">
                <td class="<%=linkage[i].getStatus()%>" valign="top"><%=i + 1%></td>
                <td valign="top"><integro:empty-if-null value="<%=stock.getStockID()%>"/>&nbsp;</td>
                <td  valign="top">
                <%
                	String[] stockTypeList = stock.getStockType();
                	if (stockTypeList != null) {
	                	for (int j = 0; j < stockTypeList.length; j++) {
                %>
                			<integro:empty-if-null value="<%=stockTypeList[j]%>"/>
                <%
            		} }
                %>
                &nbsp;                
                </td>
                <td valign="top"><integro:wrapper value="<%=stock.getAddress()%>"/>&nbsp;</td>
                <td  valign="top" class="amount">
                <%
                	String strGrossValue = AssetGenChargeUtil.getCMSAmount(((OBStock)stock).getCalculatedGrossValue(), ccy, locale);
                %>
                <integro:empty-if-null value="<%=strGrossValue%>"/>&nbsp;
                </td>
                <td  valign="top" class="amount">
                <%
                	String strNetValue = AssetGenChargeUtil.getCMSAmount(((OBStock)stock).getCalculatedNetValue(), ccy, locale);
                %>
                <integro:empty-if-null value="<%=strNetValue%>"/>&nbsp;
                </td>
              </tr>
            <% } } %>
            </tbody>
          </table>
        <%
    		} else {
        %> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="5%">S/N</td>
              <td width="20%">FAO ID </td>
              <td width="20%">Description</td>
              <td width="20%">Address</td>
              <td width="17%">Gross Value</td>
              <td width="18%">Net Value (after Margin) </td>
            </tr>
          </thead>
          <tbody>
            <%
            	OBInsuranceObjLinkage[] linkage = AssetGenChargeUtil.compareInsuranceObjLinkage(indexID, tab, itrxValue);
            	if (linkage == null || linkage.length == 0) {
	        %>
	        <tr class="odd"><td colspan="6">There is no Fixed Assets /Others (FAO) information</td></tr>
	        <% 
        		} else {
            	HashMap actualMap = (HashMap)actualCol.getFixedAssetOthers();
            	HashMap stageMap = (HashMap)stageCol.getFixedAssetOthers();            
            	for (int i = 0; i < linkage.length; i++) {
	            	IFixedAssetOthers fao = null;
	            	if (linkage[i].getStatus().equals(CompareOBUtil.OB_DELETED)) {
		            	fao = (IFixedAssetOthers)actualMap.get(linkage[i].getObjID());
	            	} else {
		            	fao = (IFixedAssetOthers)stageMap.get(linkage[i].getObjID());
	            	}
            %>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td class="<%=linkage[i].getStatus()%>" valign="top"><%=i + 1%></td>
              <td valign="top"><integro:empty-if-null value="<%=fao.getFAOID()%>"/>&nbsp;</td>
              <td  valign="top"><integro:empty-if-null value="<%=fao.getDescription()%>"/>&nbsp;</td>
              <td valign="top"><integro:wrapper value="<%=fao.getAddress()%>"/>&nbsp;</td>
              <td  valign="top" class="amount">
              <%
              	String strGrossValue = AssetGenChargeUtil.getCMSAmount(((OBFixedAssetOthers)fao).getGrossValue(), ccy, locale);
              %>
              <integro:empty-if-null value="<%=strGrossValue%>"/>&nbsp;
              </td>
              <td  valign="top" class="amount">
              <%
              	String strNetValue = AssetGenChargeUtil.getCMSAmount(((OBFixedAssetOthers)fao).getCalculatedNetValue(), ccy, locale);
              %>
              <integro:empty-if-null value="<%=strNetValue%>"/>&nbsp;
              </td>
            </tr>
            <% } } %>
          </tbody>
        </table>        
        <% } %>
        </td>
		</tr>
		</td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
 
</body>
</html>
