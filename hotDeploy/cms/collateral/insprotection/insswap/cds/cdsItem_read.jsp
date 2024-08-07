<%@ page import="com.integrosys.cms.ui.collateral.insprotection.insswap.cds.CDSItemForm,
                 com.integrosys.cms.app.collateral.bus.type.insurance.ICDSItem,
                 com.integrosys.cms.ui.collateral.TimeFreqList,
                 com.integrosys.cms.app.common.constant.ICMSConstant"
%>

<%
    CDSItemForm aForm = (CDSItemForm)request.getAttribute("CDSItemForm");
    String from_event = request.getParameter("from_event");
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
              <td width="20%" class="fieldname">SCB Entity</td>
              <td width="30%"><integro:htmltext value="<%=aForm.getBankEntity()%>" lineLength="40"/>&nbsp;</td>
              <td width="20%" class="fieldname">Hedge Type</td>
              <td width="30%">
              <% if (ICDSItem.HEDGE_TYPE_SPECIFIC.equals(aForm.getHedgeType())) { %>
              Specific
              <% } else if (ICDSItem.HEDGE_TYPE_GENERAL.equals(aForm.getHedgeType())) { %>
              General
              <% } else { %> - <% } %>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Hedge Reference</td>
              <td><integro:htmltext value="<%=aForm.getHedgeRef()%>" lineLength="40"/>&nbsp;</td>
              <td class="fieldname">CDS Reference</td>
              <td><integro:htmltext value="<%=aForm.getCdsRef()%>" lineLength="40"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Trade ID</td>
              <td><integro:htmltext value="<%=aForm.getTradeID()%>" lineLength="40"/>&nbsp;</td>
              <td class="fieldname">Trade Date</td>
              <td><bean:write name="CDSItemForm" property="tradeDate"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Deal Date</td>
              <td><bean:write name="CDSItemForm" property="dealDate"/>&nbsp;</td>
              <td class="fieldname">Start Date</td>
              <td><bean:write name="CDSItemForm" property="startDate"/>&nbsp;</td>
            </tr>
            <tr class="even">
            <td class="fieldname">CDS Maturity Date</td>
             <td><bean:write name="CDSItemForm" property="cdsMaturityDate"/>&nbsp;</td>
              <td class="fieldname">Tenor</td>
              <td>
              	<bean:write name="CDSItemForm" property="tenor"/>&nbsp;
              	<integro:empty-if-null value="<%=timeFreq.getTimeFreqItem(aForm.getTenorUnit())%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Trade Currency</td>
              <td ><bean:write name="CDSItemForm" property="tradeCurrency"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.common.no"/>tional Hedged Amount</td>
              <td><bean:write name="CDSItemForm" property="notionalHedgeAmt"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Reference Entiity</td>
              <td><integro:htmltext value="<%=aForm.getReferenceEntity()%>" lineLength="40"/>&nbsp;</td>
              <td class="fieldname">CDS Booking Location</td>
              <td><bean:write name="CDSItemForm" property="cdsBookingLoc"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Loan/Bond Booking Location</td>
              <td><bean:write name="CDSItemForm" property="loanBondBkLoc"/>&nbsp;</td>
              <td class="fieldname">Reference Asset</td>
              <td><integro:htmltext value="<%=aForm.getReferenceAsset()%>" lineLength="40"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Issuer</td>
              <td><integro:htmltext value="<%=aForm.getIssuer()%>" lineLength="40"/>&nbsp;</td>
            	<td class="fieldname">Issuer ID</td>
            	<td><integro:htmltext value="<%=aForm.getIssuerID()%>" lineLength="40"/>&nbsp;</td>
            </tr>
            <tr class="odd">
        		<td class="fieldname">Details of Issuer</td>
        		<td colspan="3"><integro:wrapper value="<%=aForm.getDetailsIssuer()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
            	<td class="fieldname">Dealt Price</td>
            	<td><bean:write name="CDSItemForm" property="dealtPrice"/>&nbsp;</td>
    	        <td class="fieldname">Residual Maturity</td>
    	        <td><bean:write name="CDSItemForm" property="residualMaturityField"/>&nbsp;</td>
            </tr>
            <tr class="odd">
            	<td class="fieldname">Settlement</td>
            	<td>
            	<% if (ICDSItem.SETTLEMENT_PHYSICAL.equals(aForm.getSettlement())) { %>
            	Physical
            	<% } else if (ICDSItem.SETTLEMENT_CASH.equals(aForm.getSettlement())) { %>
            	Cash
            	<% } else { %> - <% } %>
            	</td>
            	<td class="fieldname">Par Value</td>
            	<td><bean:write name="CDSItemForm" property="parValue"/>&nbsp;</td>
            </tr>
            <tr class="even">
            	<td class="fieldname">Decline Market Value</td>
            	<td><bean:write name="CDSItemForm" property="declineMarketValue"/>&nbsp;</td>
    	        <td class="fieldname">Event Determination Date</td>
    	        <td><bean:write name="CDSItemForm" property="eventDeterminationDate"/>&nbsp;</td>
    	    </tr>
    	    <tr class="odd">
            	<td class="fieldname">Compliance Certificate (No Insider Information) Obtained</td>
            	<td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getComplianceCert()).booleanValue()%>"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2"><h3><bean:message key="label.valuation.details" /></h3>
	    <hr>
	    </td>
	</tr>
	<tr>
		<td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        	<tr class="odd">
        		<td width="20%" class="fieldname"> <bean:message key="label.valuation.date" /></td>
        		<td width="30%"><bean:write name="CDSItemForm" property="valuationDate"/>&nbsp;</td>
				<td width="20%" class="fieldname"> <bean:message key="label.valuation.currency" /> &nbsp;<font color="#0000FF">* </font></td>
				<td width="30%"><bean:write name="CDSItemForm" property="valuationCurrency"/>&nbsp;</td>
        	</tr>
        	<tr class="even">
        		<td class="fieldname"><bean:message key="label.valuation.haircut" /></td>
        		<td ><bean:write name="CDSItemForm" property="cdsMargin"/>% &nbsp;</td>
        		<td class="fieldname">&nbsp;</td>
        		<td >&nbsp;</td>
        	</tr>
        	<tr class="odd">
        		<td class="fieldname"> <bean:message key="label.valuation.omv.amount" />
				&nbsp;<font color="#0000FF">* </font></td>
        		<td><bean:write name="CDSItemForm" property="valuationCMV"/>&nbsp;</td>
        		<td class="fieldname"> <bean:message key="label.valuation.fsv.amount" /></td>
        		<td><bean:write name="CDSItemForm" property="valuationFSV"/>&nbsp;</td>
        	</tr>
        	<%--<tr class="even">
        		<td class="fieldname">Revaluation Frequency</td>
        		<td><bean:write name="CDSItemForm" property="revalFreq"/>&nbsp;</td>
        		<td class="fieldname"><bean:message key="label.common.no"/>n Standard Revaluation Frequency</td>
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
    <td width="100" valign="baseline" align="center"> <a href="CDSItem.do?event=read_return&from_event=<%=from_event%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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
