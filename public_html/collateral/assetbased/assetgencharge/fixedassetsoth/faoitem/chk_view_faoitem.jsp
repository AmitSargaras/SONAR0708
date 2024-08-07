<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.fixedassetsoth.faoitem.FAOItemAction,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.fixedassetsoth.faoitem.FAOItemForm,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IFixedAssetOthers,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.ui.common.UIUtil,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.collateral.TimeFreqList"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	String indexID = (String)request.getParameter("indexID");
	FAOItemForm aForm = (FAOItemForm)request.getAttribute("AssetFAOItemForm");
	TimeFreqList freqList = TimeFreqList.getInstance();
	
	IFixedAssetOthers actualFao = (IFixedAssetOthers)request.getAttribute("actualFAOItem");
	IFixedAssetOthers stageFao = (IFixedAssetOthers)request.getAttribute("stageFAOItem");
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
    document.forms[0].event.value = "<%=FAOItemAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<html:form action="AssetFAOItem.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=FAOItemAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="81%" ><h3>View Fixed Assets/Others (FAO)</h3></td>
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
              <td width="20%" class="fieldname">FAO ID</td>
              <td width="30%"><bean:write name="AssetFAOItemForm" property="faoID"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageFao,actualFao, "description")?"fieldname":"fieldnamediff"%>">Description&nbsp;<font color="#0000FF">* </font></td>
			  <td><integro:wrapper value="<%=aForm.getDescription()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageFao,actualFao, "address")?"fieldname":"fieldnamediff"%>">Address&nbsp;<font color="#0000FF">* </font></td>
			  <td><integro:wrapper value="<%=aForm.getAddress()%>"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageFao,actualFao, "valuerName")?"fieldname":"fieldnamediff"%>">Valuer</td>
              <td><bean:write name="AssetFAOItemForm" property="valuer"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageFao,actualFao, "valuationDate")?"fieldname":"fieldnamediff"%>">Valuation Date (User Input)</td>
              <td><bean:write name="AssetFAOItemForm" property="valuationDate"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Standard Revaluation Frequency</td>
              <td><bean:write name="AssetFAOItemForm" property="stdRevalFreq"/>&nbsp;</td>
            </tr>
            <tr class="even">
            <%
            	boolean isSame = CompareOBUtil.compOB(stageFao,actualFao, "revalFreq");
            	if (isSame) {
	            	isSame = CompareOBUtil.compOB(stageFao,actualFao, "revalFreqUnit");
            	}
            %>
              <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Non-Standard Revaluation Frequency</td>
              <td><bean:write name="AssetFAOItemForm" property="nonStdRevalFreqNum"/>
              	<integro:empty-if-null value="<%=freqList.getTimeFreqItem(aForm.getNonStdRevalFreqUnit())%>"/>
		      </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Revaluation Date</td>
              <td><bean:write name="AssetFAOItemForm" property="revaluationDate"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageFao,actualFao, "valuationCurrency")?"fieldname":"fieldnamediff"%>">Valuation Currency&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetFAOItemForm" property="valCurrency"/>&nbsp;</td>
            </tr>
            <tr class="odd">
            <%
            	Amount actualAmt = actualFao==null?null:actualFao.getGrossValue();
            	Amount stagingAmt = stageFao==null?null:stageFao.getGrossValue();
            %>
              <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">Gross Value (Val Currency)&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetFAOItemForm" property="grossValueValCurr"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">CMS Sec Currency</td>
              <td><bean:write name="AssetFAOItemForm" property="cmsSecCurrency"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Gross Value (CMS Currency)</td>
              <td><bean:write name="AssetFAOItemForm" property="grossValueCMSCurr"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td height="21" class="<%=CompareOBUtil.compOB(stageFao,actualFao, "margin")?"fieldname":"fieldnamediff"%>">Margin (%)&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="AssetFAOItemForm" property="margin"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Net Value (CMS Currency)</td>
              <td><bean:write name="AssetFAOItemForm" property="netValue"/>&nbsp;</td>
            </tr>
          </tbody>
        </table>
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
