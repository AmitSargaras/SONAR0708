<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.debtors.DebtorsAction,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.debtors.DebtorPeriodList,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.debtors.DebtorsForm,
				 com.integrosys.cms.ui.collateral.TimeFreqList,
				 com.integrosys.cms.ui.common.UIUtil,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IDebtor,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.base.techinfra.diff.CompareOBUtil"%>
				 
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/debtors/debtor_process.jsp,v 1.15 2006/10/27 08:23:52 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - AssetBased - General Charge - Debtor Tab
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.15 $
* Date: $Date: 2006/10/27 08:23:52 $
* Tag: $Name:  $
*/
%>

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	IGeneralCharge iCol = (IGeneralCharge)itrxValue.getStagingCollateral();
	IGeneralCharge actualCol = (IGeneralCharge)itrxValue.getCollateral();
	
	IDebtor actual = actualCol.getDebtor();
	IDebtor staging = iCol.getDebtor();
		
	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
	
	DebtorsForm aForm = (DebtorsForm)request.getAttribute("AssetDebtorForm");
	String[] debtorsAgeing = aForm.getDebtorsAgeing();
	String[] debtorsAgeingCMS = aForm.getDebtorsAgeingCMS();
	
	DebtorPeriodList periodList = DebtorPeriodList.getInstance();
	TimeFreqList timeFreqList = TimeFreqList.getInstance();	
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
<html:form action="/AssetGenChargeDebtor.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=DebtorsAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>

<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td width="81%" colspan="2"><h3>Debtors</h3> <hr> </td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
          <tr>
            <td colspan="3" class="topheader" style="text-align:left; font-weight: bold;"> Debtors - Debtors Ageing Table </td>
          </tr>
          <tr>
            <td>&nbsp;</td>            
            <td class="<%=CompareOBUtil.compOB(staging,actual, "debtAmountCurrency")?"":"fieldnamediff"%>">Base Currency &nbsp;<font color="#0000FF">* </font>(<bean:write name="AssetDebtorForm" property="valCurrency"/>) </td>
            <td>CMS Security Currency &nbsp;(<bean:write name="AssetDebtorForm" property="cmsCurrency"/>)
          <tr>
            <td width="34%" style="text-align:left ">Months</td>
            <td width="33%">Amount </td>
            <td width="33%">Amount </td>
          </tr>
        </thead>
        <tbody>
          <tr class="odd">
          <%
          	Amount actualAmt = actual==null?null:actual.getMonth1DebtAmount();
          	Amount stagingAmt = staging==null?null:staging.getMonth1DebtAmount();
          %>
            <td  class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">1</td>
            <td  style="text-align:center">
	            <integro:empty-if-null value="<%=debtorsAgeing[0]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
	            <integro:empty-if-null value="<%=debtorsAgeingCMS[0]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
          <%
          	actualAmt = actual==null?null:actual.getMonth2DebtAmount(); 
          	stagingAmt = staging==null?null:staging.getMonth2DebtAmount();
          %>
            <td  class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">2</td>
            <td  style="text-align:center">
            	<integro:empty-if-null value="<%=debtorsAgeing[1]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
            	<integro:empty-if-null value="<%=debtorsAgeingCMS[1]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
          <%
          	actualAmt = actual==null?null:actual.getMonth3DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth3DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">3</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[2]%>"/>&nbsp;            
			</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[2]%>"/>&nbsp;            
			</td>
          </tr>
          <tr class="even">
          <%
          	actualAmt = actual==null?null:actual.getMonth4DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth4DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>"style="text-align:center ">4</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[3]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[3]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
          <%
          	actualAmt = actual==null?null:actual.getMonth5DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth5DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">5</td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[4]%>"/>&nbsp;
            </td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[4]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
          <%
          	actualAmt = actual==null?null:actual.getMonth6DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth6DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>"style="text-align:center ">6</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[5]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[5]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
          <%
          	actualAmt = actual==null?null:actual.getMonth7DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth7DebtAmount();
          %>
            <td  class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">7</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[6]%>"/>&nbsp;
            </td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[6]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
          <%
          	actualAmt = actual==null?null:actual.getMonth8DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth8DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>"style="text-align:center ">8</td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[7]%>"/>&nbsp;
            </td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[7]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
          <%
          	actualAmt = actual==null?null:actual.getMonth9DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth9DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">9</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[8]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[8]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
          <%
          	actualAmt = actual==null?null:actual.getMonth10DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth10DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>"style="text-align:center ">10</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[9]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[9]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
          <%
          	actualAmt = actual==null?null:actual.getMonth11DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth11DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">11</td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[10]%>"/>&nbsp;
            </td>
            <td style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[10]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
          <%
          	actualAmt = actual==null?null:actual.getMonth12DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonth12DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>"style="text-align:center ">12</td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[11]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[11]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
          <%
          	actualAmt = actual==null?null:actual.getMonthMoreThan12DebtAmount();
          	stagingAmt = staging==null?null:staging.getMonthMoreThan12DebtAmount();
          %>
            <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>" style="text-align:center ">&gt; 12 </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeing[12]%>"/>&nbsp;
            </td>
            <td  style="text-align:center">
				<integro:empty-if-null value="<%=debtorsAgeingCMS[12]%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
            <td class="total"style="text-align:center ">Total</td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="total"/>&nbsp;
            </td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="totalCMS"/>&nbsp;
            </td>
          </tr>
          <tr class="odd">
            <td class="<%=CompareOBUtil.compOB(staging,actual, "applicablePeriod")?"total":"fieldnamediff"%>" style="text-align:center ">Period Applicable (months)</td>
            <td colspan="2" class="total" style="text-align:center">
            	<integro:empty-if-null value="<%=periodList.getDebtorPeriodItem(aForm.getPeriodApplicable())%>"/>&nbsp;
            </td>
          </tr>
          <tr class="even">
            <td class="total"style="text-align:center ">Debtors Less Overdue</td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="totalDebtors"/>&nbsp;
            </td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="totalDebtorsCMS"/>&nbsp;
            </td>
          </tr>
        </tbody>
      </table>    		
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" style="margin-top:15px ">
          <tbody>
            <tr class="odd">
              <td width="20%" class="<%=CompareOBUtil.compOB(staging,actual, "valuationDate")?"fieldname":"fieldnamediff"%>">Valuation Date</td>
              <td width="30%"  valign="top">
              <bean:write name="AssetDebtorForm" property="valuationDate"/>&nbsp;
              </td>
              <td width="20%" valign="top" class="fieldname">Standard Revaluation Frequency</td>
              <td width="30%"  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="stdRevalFreq"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
            <%
            	boolean isSame = CompareOBUtil.compOB(staging,actual, "revalFreq");
            	if (isSame) {
	            	isSame = CompareOBUtil.compOB(staging,actual, "revalFreqUnit");
            	}
            %>
              <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Non-Standard Revaluation Frequency</td>
              <td><bean:write name="AssetDebtorForm" property="nonStdRevalFreqNum"/>
              	<integro:empty-if-null value="<%=timeFreqList.getTimeFreqItem(aForm.getNonStdRevalFreqUnit())%>"/>
		      </td>
              <td valign="top" class="fieldname">Revaluation Date</td>
              <td valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="revaluationDate"/>&nbsp;
              </td>
            </tr>
          </tbody>
        </table>       		      
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" style="margin-top:15px ">
          <tbody>
            <tr class="odd">
              <td width="20%" valign="top" class="fieldname">CMS Security Currency </td>
              <td width="30%"  valign="top">
              	<bean:write name="AssetDebtorForm" property="cmsCurrency"/>&nbsp;
              </td>
              <td width="20%" valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - Debtors</td>
              <td width="30%"  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="totalCMS"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - Debtors Less Overdue</td>
              <td  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="totalDebtorsCMS"/>&nbsp;
              </td>
              <td valign="top" class="fieldname">Negative Stock Value (if any)</td>
              <td valign="top" class="amount"><bean:write name="AssetDebtorForm" property="negativeStockValue"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td valign="top" class="fieldname">Applicable Debtors</td>
              <td valign="top" class="amount"><bean:write name="AssetDebtorForm" property="applicableDebtors"/>&nbsp;</td>
              <td valign="top" class="<%=CompareOBUtil.compOB(iCol,actualCol, "debtorMargin")?"fieldname":"fieldnamediff"%>">Margin (%)</td>
              <td  valign="top">
              	<bean:write name="AssetDebtorForm" property="margin"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td valign="top" class="fieldname">Valuation FSV - Debtors (CMS Post-haircut)</td>
              <td  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="valuationFSV"/>&nbsp;
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table>      
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
