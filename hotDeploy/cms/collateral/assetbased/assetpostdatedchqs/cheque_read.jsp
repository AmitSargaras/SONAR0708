<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeForm,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeTypeList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IPostDatedCheque,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>

<%
	String actionStr = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
    IAssetPostDatedCheque iCol = (IAssetPostDatedCheque) itrxValue.getCollateral();
    CommonCodeList commonCode = CommonCodeList.getInstance(itrxValue.getStagingCollateral().getCollateralLocation(), ICMSConstant.CATEGORY_CODE_BKGLOC, true);
    ChequeForm aForm = (ChequeForm)request.getAttribute("AssetChequeForm");
    String from_event = request.getParameter("from_event");
    boolean isProcess = (from_event.equals("process"));
    IPostDatedCheque stagingOB = (IPostDatedCheque) request.getAttribute("stageCheque");
    IPostDatedCheque originOB = (IPostDatedCheque) request.getAttribute("actualCheque");
 	IPostDatedCheque ChequeOB = stagingOB==null ? originOB : stagingOB;
    Amount oldChqAmt = null;
    Amount newChqAmt = null;
    if (stagingOB != null) {
        newChqAmt = stagingOB.getChequeAmount();
    }
    if (originOB != null) {
        oldChqAmt = originOB.getChequeAmount();
    }
	int rowIdx = 0;
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="Javascript">
	function setVisibility1(elementID){
		var str = '<%=aForm.getExchangeControl()%>';
		if(str=='Y'){
			document.getElementById(elementID).style.visibility = "visible";
		}else{
			document.getElementById(elementID).style.visibility = "hidden";
		}
	} 
</script>

</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.cheque.detail.title.view"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "chequeType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.type.cheque"/></td>
				<td width="30%">
					<%=ChequeTypeList.getInstance().getChequeTypeItem(aForm.getChequeType())%>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>
			
            <%
				boolean unchanged = true;
				if (isProcess) {
					if (newChqAmt != null && oldChqAmt == null) {
						if (newChqAmt.getAmount() != 0) {
							unchanged = false;
						}
					} else if (newChqAmt != null && oldChqAmt != null) {
						unchanged = CompareOBUtil.compOB(newChqAmt,oldChqAmt,"amount");
					}
				}
			%>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "chequeCcyCode")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.cheque.currency"/></td>
				<td width="30%">
					<bean:write name="AssetChequeForm" property="chequeCurrency"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.amount.cheque"/></td>
				<td width="30%">
					<bean:write name="AssetChequeForm" property="chequeAmt"/>&nbsp;</td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "isOwnProceedsOfReceivables")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.proceeds.receivables.control"/></td>
				<td width="30%">
					<integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getIsProceedBankCtrl()).booleanValue()%>"/>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "ownAccNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.proceed.receivable.credit.bank.ac.no"/></td>
				<td width="30%" >
					<bean:write name="AssetChequeForm" property="proceedBankACNo"/>&nbsp;</td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "ownAccNoLocation")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.location.bank"/></td>
				<td width="30%">
					<integro:empty-if-null value="<%=commonCode.getCommonCodeLabel(aForm.getLocationBank())%>"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issuerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.issuer"/></td>
				<td><bean:write name="AssetChequeForm" property="issuer"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "draweeBank")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.drawee.bank"/></td>
				<td><bean:write name="AssetChequeForm" property="draweeBank"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issueDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.cash.deposit.issue.date"/></td>
				<td><bean:write name="AssetChequeForm" property="issueDate"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "expiryDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.limit.expiry.date"/></td>
				<td><bean:write name="AssetChequeForm" property="expiryDate"/>&nbsp;</td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.custodian"/>&nbsp;</td>
				<td width="30%">
					<%
						if (aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) {
					%>
						<bean:message key="label.security.custodian.internal"/> &nbsp;&nbsp;
						<integro:empty-if-null value="<%=commonCode.getCommonCodeLabel(aForm.getSecCustodianInt())%>"/>
					<%
						} else {
					%>
						<bean:message key="label.security.custodian.external"/> &nbsp;&nbsp; <bean:write name="AssetChequeForm" property="secCustodianExt"/>
					<%
						}
					%> </td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%
            	boolean marginChange = false;
                            if (isProcess) {
                            marginChange = CompareOBUtil.compOB(stagingOB,originOB, "margin");
                        }
            %>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "country")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.global.country"/></td>
				<td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getCountry())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(marginChange?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.margin"/></td>
				<td><bean:write name="AssetChequeForm" property="margin"/>&nbsp;%</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"beforeMarginValue")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.value.before.margin"/></td>
				<td><bean:write name="AssetChequeForm" property="befValMargin"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"afterMarginValue")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.value.after.margin"/></td>
				<td><bean:write name="AssetChequeForm" property="aftValMargin"/> &nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exchange.ctr.app" /> </td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EXCHANGE_CONTROL, aForm.getExchangeControl())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"exchangeCtrlDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exchange.ctr.app.date" />&nbsp;<span class="mandatory" id="exchangeControlDateID" >*</span></td>
				<td><bean:write name="AssetChequeForm" property="exchangeControlDate"/>&nbsp;</td>
			</tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"> <a href="AssetCheque.do?event=read_return&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr><td height="70">&nbsp;</td></tr>
</table>

<script language="JavaScript" type="text/JavaScript">
<!--
	setVisibility1('exchangeControlDateID');
-->
</script>

</body>
</html>
