<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceAction,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceForm,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IStock,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBStock,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IFixedAssetOthers,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBFixedAssetOthers,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGenChargeMapEntry,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.GenChargeMapEntryComparator,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,
                 com.integrosys.cms.ui.collateral.InsuranceTypeList,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.Arrays,
                 java.util.Collection,
                 java.util.HashMap,
                 java.util.Locale"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/insurance/view_insurance.jsp,v 1.15 2006/10/27 08:24:22 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.15 $
* Date: $Date: 2006/10/27 08:24:22 $
* Tag: $Name:  $
*/
%>

<%
	String indexID = (String)request.getParameter("indexID");

	InsuranceForm aForm = (InsuranceForm)request.getAttribute("AssetInsuranceForm");

	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
	IGeneralCharge col = (IGeneralCharge)itrxValue.getStagingCollateral();
	if (from_page.equals(InsuranceAction.EVENT_READ)) {
		col = (IGeneralCharge)itrxValue.getCollateral();
	}
	CurrencyCode ccy = new CurrencyCode(col.getCurrencyCode());
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
              <td width="40%" class="fieldname">Insurance Policy Number&nbsp;<font color="#0000FF">* </font></td>
              <td width="60%">
              	<bean:write name="AssetInsuranceForm" property="insPolicyNum"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Insurer's Name&nbsp;<font color="#0000FF">* </font></td>
              <td valign="top">
              <integro:empty-if-null value="<%=InsurerNameList.getInstance().getInsurerNameItem(aForm.getInsurerName())%>"/> &nbsp;
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Insurance Type&nbsp;<font color="#0000FF">* </font></td>
              <td>
              <integro:empty-if-null value="<%=InsuranceTypeList.getInstance().getInsuranceTypeItem(aForm.getInsuranceType())%>"/> &nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Expiry Date of Insurance&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetInsuranceForm" property="expiryDateIns"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
		  <td class="fieldname">LEID & BCA</td>
		  <td><integro:empty-if-null value="<%=le_id_bca_ref_num%>"/> &nbsp;
		  </td>
	   </tr>
	   <tr class="odd">
		  <td class="fieldname">Document No</td>
		  <td><bean:write name="AssetInsuranceForm" property="documentNo"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Insurance Policy Currency</td>
              <td><bean:write name="AssetInsuranceForm" property="insPolicyCurrency"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Insurable Amount</td>
              <td><bean:write name="AssetInsuranceForm" property="insurableAmt"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Insured Amount&nbsp;<font color="#0000FF">* </font> </td>
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
              <td height="21" class="fieldname">Effective Date of Insurance&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetInsuranceForm" property="effectiveDateIns"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Insured Against </td>
              <td><integro:wrapper value="<%=aForm.getInsuredAgainst()%>"/>&nbsp;
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
                <td width="28%">Net Value (after Margin) </td>
              </tr>
            </thead>
            <tbody>
			<%				
				HashMap insStockMap = (HashMap)col.get_Insurance_Stock_Map();
				Collection stockList = (insStockMap != null)?(Collection)insStockMap.get(indexID):null;
				if (stockList == null || stockList.size() == 0) {
			%>
			<tr class="odd"><td colspan="6">There is no stock information.</td>
			<% 
				} else {
					HashMap stockMap = (HashMap)col.getStocks();
					IGenChargeMapEntry[] objList = (IGenChargeMapEntry[])stockList.toArray(new IGenChargeMapEntry[0]);
					Arrays.sort(objList, new GenChargeMapEntryComparator(GenChargeMapEntryComparator.COMPARE_BY_ENTRY_ID));
					for (int i = 0; i < objList.length; i++) {
						IStock stock = (IStock)stockMap.get(objList[i].getEntryValueID());
			%>
              <tr class="<%=i%2==0?"odd":"even"%>">
                <td class="index" valign="top"><%=i + 1%></td>
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
				HashMap insFAOMap = (HashMap)col.get_Insurance_FixedAssetOthers_Map();
				Collection faoList = (insFAOMap != null)?(Collection)insFAOMap.get(indexID):null;
				if (faoList == null || faoList.size() == 0) {
			%>
			<tr class="odd"><td colspan="6">There is no fixed asset/ others information.</td>
			<% 
				} else {
					HashMap faoMap = (HashMap)col.getFixedAssetOthers();
					IGenChargeMapEntry[] objList = (IGenChargeMapEntry[])faoList.toArray(new IGenChargeMapEntry[0]);
					Arrays.sort(objList, new GenChargeMapEntryComparator(GenChargeMapEntryComparator.COMPARE_BY_ENTRY_ID));
					for (int i = 0; i < objList.length; i++) {
						IFixedAssetOthers fao = (IFixedAssetOthers)faoMap.get(objList[i].getEntryValueID());
			%>
              <tr class="<%=i%2==0?"odd":"even"%>">
                <td class="index" valign="top"><%=i + 1%></td>
              <td valign="top"><integro:empty-if-null value="<%=fao.getFAOID()%>"/>&nbsp;</td>
              <td  valign="top"><integro:wrapper value="<%=fao.getDescription()%>"/>&nbsp;</td>
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
