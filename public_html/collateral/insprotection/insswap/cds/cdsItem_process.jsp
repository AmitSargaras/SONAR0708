<%@ page import="com.integrosys.cms.ui.collateral.insprotection.insswap.cds.CDSItemForm,
				 com.integrosys.cms.ui.collateral.insprotection.insswap.cds.CDSItemAction,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.insurance.ICDSItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.collateral.TimeFreqList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.constant.ICMSConstant"
%>

<%
    CDSItemForm aForm = (CDSItemForm)request.getAttribute("CDSItemForm");
    String from_event = request.getParameter("from_event");
    ICDSItem stagingOB = (ICDSItem) request.getAttribute("stageCDS");
    ICDSItem originOB = (ICDSItem) request.getAttribute("actualCDS");   
    TimeFreqList timeFreq = TimeFreqList.getInstance(); 
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
</head>

<body>
<html:form action="CDSItem.do">
<input type="hidden" name="event"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Credit Default Swaps Details - View</h3></td>
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
              <td width="20%" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "bankEntity")?"fieldname":"fieldnamediff"%>">SCB Entity</td>
              <td width="30%"><integro:htmltext value="<%=aForm.getBankEntity()%>" lineLength="40"/>&nbsp;</td>
              <td width="20%" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "hedgeType")?"fieldname":"fieldnamediff"%>">Hedge Type</td>
              <td width="30%">
              <% if (ICDSItem.HEDGE_TYPE_SPECIFIC.equals(aForm.getHedgeType())) { %>
              Specific
              <% } else if (ICDSItem.HEDGE_TYPE_GENERAL.equals(aForm.getHedgeType())) { %>
              General
              <% } else { %> - <% } %>
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "hedgeRef")?"fieldname":"fieldnamediff"%>">Hedge Reference</td>
              <td><integro:htmltext value="<%=aForm.getHedgeRef()%>" lineLength="40"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "cdsRef")?"fieldname":"fieldnamediff"%>">CDS Reference</td>
              <td><integro:htmltext value="<%=aForm.getCdsRef()%>" lineLength="40"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "tradeID")?"fieldname":"fieldnamediff"%>">Trade ID</td>
              <td><integro:htmltext value="<%=aForm.getTradeID()%>" lineLength="40"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "tradeDate")?"fieldname":"fieldnamediff"%>">Trade Date</td>
              <td><bean:write name="CDSItemForm" property="tradeDate"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "dealDate")?"fieldname":"fieldnamediff"%>">Deal Date</td>
              <td><bean:write name="CDSItemForm" property="dealDate"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "startDate")?"fieldname":"fieldnamediff"%>">Start Date</td>
              <td><bean:write name="CDSItemForm" property="startDate"/>&nbsp;</td>
            </tr>
            <tr class="even">
            <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "cdsMaturityDate")?"fieldname":"fieldnamediff"%>">CDS Maturity Date</td>
             <td><bean:write name="CDSItemForm" property="cdsMaturityDate"/>&nbsp;</td>
             <%
             	boolean noChanged = CompareOBUtil.compOB(stagingOB,originOB, "tenor")||
             	(originOB==null&&stagingOB!=null&&(stagingOB.getTenor()<0));
             	noChanged = noChanged && CompareOBUtil.compOB(stagingOB,originOB, "tenorUnit");
             %>
              <td class="<%=noChanged?"fieldname":"fieldnamediff"%>">Tenor</td>
              <td>
              	<bean:write name="CDSItemForm" property="tenor"/>&nbsp;
              	<integro:empty-if-null value="<%=timeFreq.getTimeFreqItem(aForm.getTenorUnit())%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "tradeCurrency")?"fieldname":"fieldnamediff"%>">Trade Currency</td>
              <td ><bean:write name="CDSItemForm" property="tradeCurrency"/>&nbsp;</td>
              <%
              	Amount stageAmount = (stagingOB != null)?stagingOB.getNotionalHedgeAmt():null;
              	Amount actualAmount = (originOB != null)?originOB.getNotionalHedgeAmt():null;              	
              %>
              <td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">Notional Hedged Amount</td>
              <td><bean:write name="CDSItemForm" property="notionalHedgeAmt"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "referenceEntity")?"fieldname":"fieldnamediff"%>">Reference Entiity</td>
              <td><integro:htmltext value="<%=aForm.getReferenceEntity()%>" lineLength="40"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "cdsBookingLoc")?"fieldname":"fieldnamediff"%>">CDS Booking Location</td>
              <td><bean:write name="CDSItemForm" property="cdsBookingLoc"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "loanBondBkLoc")?"fieldname":"fieldnamediff"%>">Loan/Bond Booking Location</td>
              <td><bean:write name="CDSItemForm" property="loanBondBkLoc"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "referenceAsset")?"fieldname":"fieldnamediff"%>">Reference Asset</td>
              <td><integro:htmltext value="<%=aForm.getReferenceAsset()%>" lineLength="40"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "issuer")?"fieldname":"fieldnamediff"%>">Issuer</td>
              <td><integro:htmltext value="<%=aForm.getIssuer()%>" lineLength="40"/>&nbsp;</td>
            	<td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "issuerID")?"fieldname":"fieldnamediff"%>">Issuer ID</td>
            	<td><integro:htmltext value="<%=aForm.getIssuerID()%>" lineLength="40"/>&nbsp;</td>
            </tr>
            <tr class="odd">
        		<td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "detailsIssuer")?"fieldname":"fieldnamediff"%>">Details of Issuer</td>
        		<td colspan="3"><integro:wrapper value="<%=aForm.getDetailsIssuer()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <%
              	stageAmount = (stagingOB != null)?stagingOB.getDealtPrice():null;
              	actualAmount = (originOB != null)?originOB.getDealtPrice():null;              	
              %>            
            	<td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">Dealt Price</td>
            	<td><bean:write name="CDSItemForm" property="dealtPrice"/>&nbsp;</td>
              <%
              	stageAmount = (stagingOB != null)?stagingOB.getResidualMaturityField():null;
              	actualAmount = (originOB != null)?originOB.getResidualMaturityField():null;              	
              %>            
    	        <td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">Residual Maturity</td>
    	        <td><bean:write name="CDSItemForm" property="residualMaturityField"/>&nbsp;</td>
            </tr>
            <tr class="odd">
            	<td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "settlement")?"fieldname":"fieldnamediff"%>">Settlement</td>
            	<td>
            	<% if (ICDSItem.SETTLEMENT_PHYSICAL.equals(aForm.getSettlement())) { %>
            	Physical
            	<% } else if (ICDSItem.SETTLEMENT_CASH.equals(aForm.getSettlement())) { %>
            	Cash
            	<% } else { %> - <% } %>
            	</td>
              <%
              	stageAmount = (stagingOB != null)?stagingOB.getParValue():null;
              	actualAmount = (originOB != null)?originOB.getParValue():null;              	
              %>                        	
            	<td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">Par Value</td>
            	<td><bean:write name="CDSItemForm" property="parValue"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <%
              	stageAmount = (stagingOB != null)?stagingOB.getDeclineMarketValue():null;
              	actualAmount = (originOB != null)?originOB.getDeclineMarketValue():null;              	
              %>                        	
            	<td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">Decline Market Value</td>
            	<td><bean:write name="CDSItemForm" property="declineMarketValue"/>&nbsp;</td>
    	        <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "eventDeterminationDate")?"fieldname":"fieldnamediff"%>">Event Determination Date</td>
    	        <td><bean:write name="CDSItemForm" property="eventDeterminationDate"/>&nbsp;</td>
    	    </tr>
    	    <tr class="odd">
            	<td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "complianceCert")?"fieldname":"fieldnamediff"%>">Compliance Certificate (No Insider Information) Obtained</td>
            	<td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getComplianceCert()).booleanValue()%>"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <%
    	IValuation stageVal = (stagingOB != null)?stagingOB.getValuation():null;
    	IValuation actualVal = (originOB != null)?originOB.getValuation():null;
    %>
	<tr>
		<td colspan="2"><h3><bean:message key="label.valuation.details" /></h3>
	    <hr>
	    </td>
	</tr>
	<tr>
		<td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        	<tr class="odd">
        		<td width="20%" class="<%=CompareOBUtil.compOB(stageVal,actualVal, "valuationDate")?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.valuation.date" /> </td>
        		<td width="30%"><bean:write name="CDSItemForm" property="valuationDate"/>&nbsp;</td>
				<td width="20%" class="<%=CompareOBUtil.compOB(stageVal,actualVal, "currencyCode")?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.valuation.currency" /> &nbsp;<font color="#0000FF">* </font></td>
				<td width="30%"><bean:write name="CDSItemForm" property="valuationCurrency"/>&nbsp;</td>
        	</tr>
        	<tr class="even">
        		<td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "margin")?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.valuation.haircut" /></td>
        		<td ><bean:write name="CDSItemForm" property="cdsMargin"/>%&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
              <%--<%
              	stageAmount = (stagingOB != null)?stagingOB.getNominalValue():null;
              	actualAmount = (originOB != null)?originOB.getNominalValue():null;              	
              %>                        	
        		<td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">Nominal Value</td>
        		<td><bean:write name="CDSItemForm" property="nominalValue"/>&nbsp;</td>
        	</tr>--%>
        	<tr class="odd">
              <%
              	stageAmount = (stageVal != null)?stageVal.getCMV():null;
              	actualAmount = (actualVal != null)?actualVal.getCMV():null;              	
              %>                        	
        		<td class="<%=CompareOBUtil.compOB(stageAmount,actualAmount, "amount")?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.valuation.omv.amount" />&nbsp;<font color="#0000FF">* </font></td>
        		<td><bean:write name="CDSItemForm" property="valuationCMV"/>&nbsp;</td>
        		<td class="fieldname"><bean:message key="label.valuation.fsv.amount" /></td>
        		<td><bean:write name="CDSItemForm" property="valuationFSV"/>&nbsp;</td>
        	</tr>
        	<%--<tr class="even">
        		<td class="fieldname">Revaluation Frequency</td>
        		<td><bean:write name="CDSItemForm" property="revalFreq"/>&nbsp;</td>
        		<%
        			noChanged = CompareOBUtil.compOB(stageVal,actualVal, "nonRevaluationFreq");
        			noChanged = noChanged && CompareOBUtil.compOB(stageVal,actualVal, "nonRevaluationFreqUnit");
        		%>
        		<td class="<%=noChanged?"fieldname":"fieldnamediff"%>">Non Standard Revaluation Frequency</td>
        		<td><bean:write name="CDSItemForm" property="nonStdFreq"/>&nbsp;
				<integro:empty-if-null value="<%=timeFreq.getTimeFreqItem(aForm.getNonStdFreqUnit())%>"/>        		
        		</td>
        	</tr>
        	<tr class="odd">
       			<td class="fieldname">Revaluation date</td>
       			<td>
       				<bean:write name="CDSItemForm" property="revalDate"/>&nbsp;
       			</td>
       			<td class="fieldname">&nbsp;</td>
       			<td>&nbsp;</td>       				
        	</tr>--%>
        </table>
        </td>
    </tr>        
  </tbody>
</table>
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">
        <a href="CDSItem.do?event=read_return&from_event=<%=from_event%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" />
        </a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr><td height="70">&nbsp;</td></tr>
</table>

</html:form>

</body>
</html>
