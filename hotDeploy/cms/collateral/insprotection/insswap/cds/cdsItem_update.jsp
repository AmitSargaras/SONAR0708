<%@ page import="com.integrosys.cms.ui.collateral.insprotection.insswap.cds.CDSItemForm,
				 com.integrosys.cms.ui.collateral.insprotection.insswap.cds.CDSItemAction,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.insurance.ICDSItem,
                 com.integrosys.cms.app.common.constant.ICMSConstant"
%>

<%
    CDSItemForm aForm = (CDSItemForm)request.getAttribute("CDSItemForm");
    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.insswap.InsSwapAction.serviceColObj");
    String indexID = request.getParameter("indexID");
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function updateSettlementPhysical() {
    document.forms[0].declineMarketValue.value = '';
    document.forms[0].declineMarketValue.disabled = true;
    document.forms[0].parValue.disabled = false;
}

function updateSettlementCash() {
    document.forms[0].parValue.value = '';
    document.forms[0].parValue.disabled = true;
    document.forms[0].declineMarketValue.disabled = false;
}

function submitPage(num) {
	enableAllFormElements();
	
	if (num == 1) {
    	document.forms[0].event.value="<%=CDSItemAction.EVENT_CREATE%>";
    }
	if (num == 2) {
    	document.forms[0].event.value="<%=CDSItemAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value="cancel";
    }
    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="CDSItem.do">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID" value="<%=indexID%>" />

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Credit Default Swaps Details - <% if (indexID.equals("-1")) { %> New <% } else { %> Edit <% } %></h3></td>
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
              <td width="20%" class="fieldname"> Entity</td>               
              <td width="30%">
              <html:textarea property="bankEntity" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.bankEntity, 100, 'SCB Entity');"/>&nbsp;
              <html:errors property="bankEntity"/>
              </td>
              <td width="20%" class="fieldname">Hedge Type</td>
              <td width="30%">
              <html:radio property="hedgeType" value="<%=ICDSItem.HEDGE_TYPE_SPECIFIC%>"/>Specific
              &nbsp;&nbsp;
              <html:radio property="hedgeType" value="<%=ICDSItem.HEDGE_TYPE_GENERAL%>"/>General
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Hedge Reference</td>
              <td>
              <html:textarea property="hedgeRef" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.hedgeRef, 100, 'Hedge Reference');"/>&nbsp;
              <html:errors property="hedgeRef"/>
              </td>
              <td class="fieldname">CDS Reference</td>
              <td >
              <html:textarea property="cdsRef" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.cdsRef, 100, 'CDS Reference');"/>&nbsp;
              <html:errors property="cdsRef"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Trade ID</td>
              <td>
              <html:textarea property="tradeID" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.tradeID, 100, 'Trade ID');"/>&nbsp;
              <html:errors property="tradeID"/>
              </td>
              <td class="fieldname">Trade Date</td>
              <td>
			  <html:text property="tradeDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('tradeDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="tradeDate"/>              
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Deal Date</td>
              <td>
			  <html:text property="dealDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('dealDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="dealDate"/>              
              </td>              
              <td class="fieldname">Start Date</td>
              <td>
			  <html:text property="startDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('startDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="startDate"/>                            
              </td>
            </tr>
            <tr class="even">
            <td class="fieldname">CDS Maturity Date</td>
             <td>
				<html:text property="cdsMaturityDate" readonly="true" size="15" maxlength="11" />
              	<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('cdsMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              	<html:errors property="cdsMaturityDate"/>
              </td>
              <td class="fieldname">Tenor</td>
              <td>
              <html:text property="tenor" size="5" maxlength="4" />&nbsp;
                <html:select property="tenorUnit">
	            <option value="" >Please Select </option>
	            <html:options name="freqID" labelName="freqValue"/>
                </html:select>&nbsp;
                <html:errors property="tenor" />
                <html:errors property="tenorUnit"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Trade Currency</td>
              <td >
               <html:select property="tradeCurrency" >
	            <option value="" >Please Select </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="tradeCurrency"/>
              </td>
              <td class="fieldname">Notional Hedged Amount</td>
              <td> 
              <html:text property="notionalHedgeAmt" maxlength="21" />&nbsp;
              <html:errors property="notionalHedgeAmt"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Reference Entiity</td>
              <td> 
              <html:textarea property="referenceEntity" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.referenceEntity, 100, 'Reference Entiity');"/>&nbsp;
              <html:errors property="referenceEntity"/></td>
              <td class="fieldname">CDS Booking Location</td>
              <td> 
               <html:select property="cdsBookingLoc" >
	            <integro:common-code categoryCode="40"/>
                </html:select>&nbsp;
                <html:errors property="cdsBookingLoc"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Loan/Bond Booking Location</td>
              <td> 
               <html:select property="loanBondBkLoc" >
	            <integro:common-code categoryCode="40"/>
                </html:select>&nbsp;
                <html:errors property="loanBondBkLoc"/>
              </td>
              <td class="fieldname">Reference Asset</td>
              <td> 
              <html:textarea property="referenceAsset" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.referenceAsset, 100, 'Reference Asset');"/>&nbsp;
              <html:errors property="referenceAsset"/>
              </td>              
            </tr>
            <tr class="even">
              <td class="fieldname">Issuer</td>
              <td> 
              <html:textarea property="issuer" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.issuer, 100, 'Issuer');"/>&nbsp;
              <html:errors property="issuer"/>              
              </td>
              <td class="fieldname">Issuer ID</td>
              <td>
				  <html:textarea property="issuerID" rows="4" cols="50" style="width:100%" onkeyup="limitTextInput(this.form.issuerID, 50, 'Issuer ID');"/>&nbsp;            	
    	          <html:errors property="issuerID"/>              
        	  </td>    	
            </tr>
            <tr class="odd">
        		<td class="fieldname">Details of Issuer</td>
        		<td colspan="3">
	              <html:textarea property="detailsIssuer" rows="3" cols="80" style="width:100%" onkeyup="limitTextInput(this.form.detailsIssuer, 250, 'Details of Issuer');"/>&nbsp;
    	          <html:errors property="detailsIssuer"/>              
        		</td>
            </tr>
            <tr class="even">
            	<td class="fieldname">Dealt Price</td>
            	<td>
	              <html:text property="dealtPrice" maxlength="21" />&nbsp;
    	          <html:errors property="dealtPrice"/>
    	        </td>
    	        <td class="fieldname">Residual Maturity</td>
    	        <td>
	              <html:text property="residualMaturityField" maxlength="21" />&nbsp;
    	          <html:errors property="residualMaturityField"/>
    	        </td>    	        
            </tr>
            <tr class="odd">
            	<td class="fieldname">Settlement</td>
            	<td>
              	<html:radio property="settlement" value="<%=ICDSItem.SETTLEMENT_PHYSICAL%>" onclick="updateSettlementPhysical()"/>Physical
              	&nbsp;&nbsp;
              	<html:radio property="settlement" value="<%=ICDSItem.SETTLEMENT_CASH%>" onclick="updateSettlementCash()"/>Cash       	
            	</td>
            	<td class="fieldname">Par Value</td>
            	<td>
	              <html:text property="parValue" maxlength="21" disabled="<%=ICDSItem.SETTLEMENT_CASH.equals(aForm.getSettlement())%>"/>&nbsp;
    	          <html:errors property="parValue"/>
    	        </td>
            </tr>
            <tr class="even">
            	<td class="fieldname">Decline Market Value</td>
            	<td>
	              <html:text property="declineMarketValue" maxlength="21" disabled="<%=ICDSItem.SETTLEMENT_PHYSICAL.equals(aForm.getSettlement())%>"/>&nbsp;
    	          <html:errors property="declineMarketValue"/>
    	        </td>
    	        <td class="fieldname">Event Determination Date</td>
    	        <td>
				<html:text property="eventDeterminationDate" readonly="true" size="15" maxlength="11" />
              	<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('eventDeterminationDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              	<html:errors property="eventDeterminationDate"/>
    	        </td>
    	    </tr>
    	    <tr class="odd">
            	<td class="fieldname">Compliance Certificate (No Insider Information) Obtained</td>
            	<td>
              	<html:radio property="complianceCert" value="true"/><bean:message key="label.common.yes"/>
              	&nbsp;&nbsp;
              	<html:radio property="complianceCert" value="false"/>No       	
				</td>
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
        		<td class="fieldname"> <bean:message key="label.valuation.date" /></td>
        		<td>
				<html:text property="valuationDate" readonly="true" size="15" maxlength="11" />
              	<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('valuationDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              	<html:errors property="valuationDate"/>
				</td> 
				<td class="fieldname"> <bean:message key="label.valuation.currency" /> &nbsp;<font color="#0000FF">* </font></td>
				<td>
               	<html:select property="valuationCurrency" >
	            <option value="" >Please Select </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="valuationCurrency"/>				
				</td>       		
        	</tr>
        	<tr class="even">
        		<td class="fieldname"><bean:message key="label.valuation.haircut" /></td>
        		<td >
	              <html:text property="cdsMargin" maxlength="3" size="5"/>%&nbsp;
    	          <html:errors property="cdsMargin"/>        		
    	        <td class="fieldname">&nbsp;</td>
        		<td >&nbsp;</td>
        		<%--<td class="fieldname">Nominal Value</td>
        		<td>
	              <html:text property="nominalValue" maxlength="21" />&nbsp;
    	          <html:errors property="nominalValue"/>        		
        		</td>  --%>
        	</tr>
        	<tr class="odd">
        		<td class="fieldname"> <bean:message key="label.valuation.omv.amount" />
				&nbsp;<font color="#0000FF">* </font></td>
        		<td>
	              <html:text property="valuationCMV" maxlength="21" />&nbsp;
    	          <html:errors property="valuationCMV"/>        		        			
        		</td>
        		<td class="fieldname"><bean:message key="label.valuation.fsv.amount" /></td>
        		<td><bean:write name="CDSItemForm" property="valuationFSV"/>&nbsp;
    	          <html:hidden property="valuationFSV"/>        		        			
        		</td>
        	</tr>
            <!--commented by jitu for MBB-1306 -->
            <%--<tr class="even">
        		<td class="fieldname">Revaluation Frequency</td>
        		<td>
        			<bean:write name="CDSItemForm" property="revalFreq"/>&nbsp;
        			<html:hidden property="revalFreq"/>
        		</td>
        		<td class="fieldname">Non Standard Revaluation Frequency</td>
        		<td>
              	<html:text property="nonStdFreq" size="3" maxlength="3" />&nbsp;
                <html:select property="nonStdFreqUnit">
	            <option value="" >Please Select </option>
	            <html:options name="freqID" labelName="freqValue"/>
                </html:select>&nbsp;
                <html:errors property="nonStdFreq" />
                <html:errors property="nonStdFreqUnit"/>        		
        		</td>
        	</tr>
        	<tr class="odd">
       			<td class="fieldname">Revaluation date</td>
       			<td>
       				<bean:write name="CDSItemForm" property="revalDate"/>&nbsp;
       				<html:hidden property="revalDate"/>
       			</td>
       			<td class="fieldname">&nbsp;</td>
       			<td>&nbsp;</td>       				
        	</tr>--%>
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
  <% if ("-1".equals(indexID)) { %>
     <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image142" width="60" height="22" border="0" id="Image142" /></a></td>
  <% } else { %>
	<td width="100" valign="baseline" align="center"><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image142" width="60" height="22" border="0" id="Image142" /></a></td>  
  <% } %>
     <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr><td height="70">&nbsp;</td></tr>
</table>
</html:form>

</body>
</html>
