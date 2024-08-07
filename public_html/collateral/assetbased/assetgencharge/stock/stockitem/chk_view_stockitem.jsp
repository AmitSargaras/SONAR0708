<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.stockitem.StockItemAction,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.stockitem.StockItemForm,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IStock,
				 com.integrosys.cms.ui.collateral.TimeFreqList,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.UIUtil,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.common.FrequencyList"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	String indexID = (String)request.getParameter("indexID");
	StockItemForm aForm = (StockItemForm)request.getAttribute("AssetStockItemForm");
	TimeFreqList timeFreqList = TimeFreqList.getInstance();
	FrequencyList freqList = FrequencyList.getInstance();
	
	IStock actualStock = (IStock)request.getAttribute("actualStockItem");
	IStock stageStock = (IStock)request.getAttribute("stageStockItem");
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
    document.forms[0].event.value = "<%=StockItemAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<html:form action="AssetStockItem.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=StockItemAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td width="81%" ><h3>View Stock</h3></td>
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
            <tr class="odd"> 
              <td width="20%" class="fieldname">Stock ID</td>
              <td width="30%"><bean:write name="AssetStockItemForm" property="stockID"/>&nbsp;</td>
            </tr>
            <tr class="even"> 
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "address")?"fieldname":"fieldnamediff"%>">Address&nbsp;<font color="#0000FF">* </font></td>
              <td><integro:wrapper value="<%=aForm.getAddress()%>"/>&nbsp;</td>
            </tr>
            <tr class="odd"> 
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "valuerName")?"fieldname":"fieldnamediff"%>">Valuer</td>
              <td><bean:write name="AssetStockItemForm" property="valuer"/>&nbsp;</td>
            </tr>
            <tr class="even"> 
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "valuationDate")?"fieldname":"fieldnamediff"%>">Valuation Date (User Input)</td>
              <td><bean:write name="AssetStockItemForm" property="valuationDate"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Standard Revaluation Frequency</td>
              <td><bean:write name="AssetStockItemForm" property="stdRevalFreq"/>&nbsp;</td>
            </tr>
            <tr class="even">
            <%
            	boolean isSame = CompareOBUtil.compOB(stageStock,actualStock, "revalFreq");
            	if (isSame) {
	            	isSame = CompareOBUtil.compOB(stageStock,actualStock, "revalFreqUnit");
            	}
            %>
              <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Non-Standard Revaluation Frequency</td>
              <td><bean:write name="AssetStockItemForm" property="nonStdRevalFreqNum"/>
              	<integro:empty-if-null value="<%=timeFreqList.getTimeFreqItem(aForm.getNonStdRevalFreqUnit())%>"/>
		      </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Revaluation Date</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="revaluationDate"/>&nbsp;
              </td>
            </tr>
            <tr class="even"> 
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "valuationCurrency")?"fieldname":"fieldnamediff"%>">Valuation Currency&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetStockItemForm" property="valCurrency"/>&nbsp;</td>
            </tr>
            <tr class="odd"> 
              <td class="fieldname">Gross Value Less Creditors (Val Currency)</td>
              <td><bean:write name="AssetStockItemForm" property="grossValueValCurr"/>&nbsp;</td>
            </tr>
            <tr class="even"> 
              <td height="21" class="fieldname">CMS Sec Currency</td>
              <td><bean:write name="AssetStockItemForm" property="cmsSecCurrency"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Gross Value Less Creditors (CMS Currency)</td>
              <td><bean:write name="AssetStockItemForm" property="grossValueCMSCurr"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Margin (%)</td>
              <td><bean:write name="AssetStockItemForm" property="margin"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Net Value (CMS Currency)</td>
              <td><bean:write name="AssetStockItemForm" property="netValue"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
		<td colspan="2"><h3> Stock Type</h3>
		  <hr> </td>
	</tr>
		<tr>
		<td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="even">
              <td class="fieldname">Type</td>
              <td class="fieldname">Amount (Valuation Currency) </td>
              <td class="fieldname">Type</td>
              <td class="fieldname">Amount (Valuation Currency) </td>
            </tr></thead><tbody>
            <tr class="even">
            <%
            	Amount actualAmt = actualStock==null?null:actualStock.getRawMaterialAmt();
            	Amount stagingAmt = stageStock==null?null:stageStock.getRawMaterialAmt();
            %>
              <td width="30%" class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Raw Materials
              <%if(aForm.getRawMaterialsAmt()!=null && !aForm.getRawMaterialsAmt().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td width="20%"><bean:write name="AssetStockItemForm" property="rawMaterialsAmt"/>&nbsp;</td>
            <%
            	actualAmt = actualStock==null?null:actualStock.getGoodsTransitAmt();
            	stagingAmt = stageStock==null?null:stageStock.getGoodsTransitAmt();
            %>
              <td width="30%" class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Goods-in-Transit
                <%if(aForm.getGoodsInTransitAmt()!=null && !aForm.getGoodsInTransitAmt().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td width="20%"><bean:write name="AssetStockItemForm" property="goodsInTransitAmt"/>&nbsp;</td>
            </tr>
            <tr class="odd">
            <%
            	actualAmt = actualStock==null?null:actualStock.getFinishGoodsAmt();
            	stagingAmt = stageStock==null?null:stageStock.getFinishGoodsAmt();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Finished Goods
                <%if(aForm.getFinishedGoodsAmt()!=null && !aForm.getFinishedGoodsAmt().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td valign="top"><bean:write name="AssetStockItemForm" property="finishedGoodsAmt"/>&nbsp;</td>
            <%
            	actualAmt = actualStock==null?null:actualStock.getStoresSparesAmt();
            	stagingAmt = stageStock==null?null:stageStock.getStoresSparesAmt();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Stores &amp; Spares
              <%if(aForm.getStoresSparesAmt()!=null && !aForm.getStoresSparesAmt().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%> </td>
              <td valign="top"><bean:write name="AssetStockItemForm" property="storesSparesAmt"/>&nbsp;</td>
            </tr>
            <tr class="even">
            <%
            	actualAmt = actualStock==null?null:actualStock.getWorkProgressAmt();
            	stagingAmt = stageStock==null?null:stageStock.getWorkProgressAmt();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Work-in-Progress
              <%if(aForm.getWipAmt()!=null && !aForm.getWipAmt().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td><bean:write name="AssetStockItemForm" property="wipAmt"/>&nbsp;</td>
            <%
            	actualAmt = actualStock==null?null:actualStock.getOtherMerchandiseAmt();
            	stagingAmt = stageStock==null?null:stageStock.getOtherMerchandiseAmt();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Other Merchandise
              <%if(aForm.getOthMerchandiseAmt()!=null && !aForm.getOthMerchandiseAmt().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%> </td>
              <td><bean:write name="AssetStockItemForm" property="othMerchandiseAmt"/>&nbsp;</td>
            </tr>
            <tr class="odd">
            	<td class="fieldname">Total</td>
            	<td colspan="3"><bean:write name="AssetStockItemForm" property="totalStockTypeAmt"/>&nbsp;</td>
            </tr>
          	<tr class="even">
            <%
            	actualAmt = actualStock==null?null:actualStock.getCreditorAmt();
            	stagingAmt = stageStock==null?null:stageStock.getCreditorAmt();
            %>
            	<td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Creditor (Valuation Currency) </td>
            	<td><bean:write name="AssetStockItemForm" property="creditor"/>&nbsp;</td>
            	<td  class="fieldname">Creditor (CMS Currency) </td>
            	<td><bean:write name="AssetStockItemForm" property="creditorCMS"/>&nbsp;</td>
          	</tr>
          </tbody>
        </table>
		</td>
    </tr>
    <tr>
		<td colspan="2"><h3> Stock Type (Margin)</h3>
		  <hr> </td>
	</tr>
    <tr>
		<td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="even">
              <td class="fieldname">Type</td>
              <td class="fieldname">Margin (%) </td>
              <td class="fieldname">Type</td>
              <td class="fieldname">Margin (%) </td>
            </tr></thead><tbody>
            <tr class="even">
              <td width="30%" class="<%=CompareOBUtil.compOB(stageStock,actualStock, "rawMaterialMargin")?"fieldname":"fieldnamediff"%>">Raw Materials
              <%if(aForm.getRawMaterialsMargin()!=null && !aForm.getRawMaterialsMargin().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td width="20%"><bean:write name="AssetStockItemForm" property="rawMaterialsMargin"/>&nbsp;</td>
              <td width="30%" class="<%=CompareOBUtil.compOB(stageStock,actualStock, "goodsTransitMargin")?"fieldname":"fieldnamediff"%>">Goods-in-Transit
              <%if(aForm.getGoodsInTransitMargin()!=null && !aForm.getGoodsInTransitMargin().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td width="20%"><bean:write name="AssetStockItemForm" property="goodsInTransitMargin"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "finishGoodsMargin")?"fieldname":"fieldnamediff"%>">Finished Goods
              <%if(aForm.getFinishedGoodsMargin()!=null && !aForm.getFinishedGoodsMargin().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td valign="top"><bean:write name="AssetStockItemForm" property="finishedGoodsMargin"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "storesSparesMargin")?"fieldname":"fieldnamediff"%>">Stores &amp; Spares
              <%if(aForm.getStoresSparesMargin()!=null && !aForm.getStoresSparesMargin().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td valign="top"><bean:write name="AssetStockItemForm" property="storesSparesMargin"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "workProgressMargin")?"fieldname":"fieldnamediff"%>">Work-in-Progress
              <%if(aForm.getWipMargin()!=null && !aForm.getWipMargin().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td><bean:write name="AssetStockItemForm" property="wipMargin"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "otherMerchandiseMargin")?"fieldname":"fieldnamediff"%>">Other Merchandise
              <%if(aForm.getOthMerchandiseMargin()!=null && !aForm.getOthMerchandiseMargin().equals("")){%>
               &nbsp;<font color="#0000FF">* </font>
              <%}%></td>
              <td><bean:write name="AssetStockItemForm" property="othMerchandiseMargin"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Weighted Average</td>
              <td><bean:write name="AssetStockItemForm" property="weightedAverageMargin"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>                        
          </tbody>
        </table>
		</td>
    </tr>        
	<tr>
	<td colspan="2">
	  <table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
        <thead>
          <tr>
            <td>
              <h3>Inspection Details</h3></td>
          </tr>
          <tr>
            <td><hr/></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                          <tr class="odd">
                            <td width="20%" class="<%=CompareOBUtil.compOB(stageStock,actualStock, "physicalInspectionDone")?"fieldname":"fieldnamediff"%>">Physical Inspection </td>
                            <td width="30%"><%=(aForm.getPhysicalInspection() != null && aForm.getPhysicalInspection().equals(ICMSConstant.TRUE_VALUE))?"Yes":"No"%>&nbsp;</td>
				            <%
				            	isSame = CompareOBUtil.compOB(stageStock,actualStock, "physicalInspectionFreq");
				            	if (isSame) {
					            	isSame = CompareOBUtil.compOB(stageStock,actualStock, "physicalInspectionFreqUnit");
				            	}
				            %>
                            <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>">Physical Inspection Frequency</td>
                            <td width="30%"><bean:write name="AssetStockItemForm" property="phyInsFreqNum"/>&nbsp;
                            	<integro:empty-if-null value="<%=freqList.getFrequencyValue(aForm.getPhyInsFreqUnit())%>"/>
                            </td>
                          </tr>
                          <tr class="even">
                            <td class="<%=CompareOBUtil.compOB(stageStock,actualStock, "lastPhysicalInspectDate")?"fieldname":"fieldnamediff"%>">Last Physical Inspection Date</td>
                            <td><bean:write name="AssetStockItemForm" property="lastPhyInsDate"/>&nbsp;</td>
              				</td>
                            <td  class="fieldname">Next Physical Inspection Date</td>
                            <td><bean:write name="AssetStockItemForm" property="nextPhyInsDate"/>&nbsp;</td>
                          </tr>
                        </tbody>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
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
