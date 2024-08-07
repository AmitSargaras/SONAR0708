<%@ page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedForm"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.cms.ui.collateral.TimeFreqList" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.*" %>
<%@ page import="com.integrosys.cms.app.collateral.proxy.CollateralProxyFactory" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.valuation.support.ValuationUtil" %>
<%@ page import="java.math.BigDecimal" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%   
    String calval=dft.format(x);
    rowIdx = 0; //reset even-odd row highlighting
    IValuation iValIntoCMS = null;
	iValIntoCMS = iCol.getValuationIntoCMS();

    boolean allowRemoveManualVal=true;
    String orgValuer = "";
    String orgValDate = "";
    String orgValCurrency = "";
    String orgValCMV = "";
	String orgValFSV = "";
    String orgHaircut = "";
    String collValCurrency = "";

    if(itrxValue!=null) {
        ICollateral actualCol = itrxValue.getCollateral();

        if(itrxValue.getCollateral()!=null && itrxValue.getCollateral().getCurrencyCode()!= null)
        	collValCurrency = itrxValue.getCollateral().getCurrencyCode().trim();
        
        if(actualCol!=null) {
            IValuation manualVal = actualCol.getValuationIntoCMS();
            if ((manualVal != null)) {
                allowRemoveManualVal = false;
                Locale valLocale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
                orgValuer = manualVal.getValuerName();
                orgValDate = DateUtil.formatDate(valLocale, manualVal.getValuationDate());
                orgValCurrency = manualVal.getCurrencyCode();
                orgValCMV = (manualVal.getCMV() != null) ? String.valueOf(manualVal.getCMV().getAmount()) : "";
				orgValFSV = (manualVal.getFSV() != null) ? String.valueOf(manualVal.getFSV().getAmount()) : "";
                if (actualCol.getMargin() != ICMSConstant.DOUBLE_INVALID_VALUE) {
                    orgHaircut = String.valueOf(ValuationUtil.determineMargin((actualCol.getMargin() * 100)));
                }

            } else {
                allowRemoveManualVal = true;
            }

        }
    }

    ICollateralSubType secSubType = iCol.getCollateralSubType();
    String secType = secSubType.getTypeCode();

    boolean includeRvJsp = true;
    if (secType.equals(ICMSConstant.SECURITY_TYPE_DOCUMENT)) {
        includeRvJsp = false;
    }
    String actionPackName = "";
    if(prefix.equals("Other"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.others.OthersAction.exchangeRate";
    }else if(prefix.equals("Asset"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.exchangeRate"; 
    }else if(prefix.equals("Ins"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.exchangeRate"; 
    }else if(prefix.equals("Mark"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.exchangeRate"; 
    }
    else if(prefix.equals("Property"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.property.PropertyAction.exchangeRate"; 
    }
    String exchangeRate = (String)session.getAttribute(actionPackName);
    
    if(collValCurrency==null)
    {
    collValCurrency = "";
    }
%>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript">
	function exchangeRateINRCal() {
		var exchangeRateINR = document.getElementById('exchangeRateINR').value;
		var amountCMV = document.getElementById('amountCMV').value;
		if(amountCMV != null){
			amountCMV = amountCMV.replace(/,/g,'');

			//Phase 3 CR:comma separated
			exchangeRateINR=exchangeRateINR.replace(/,/g,'');
			
			var valExchangeRateCal = exchangeRateINR * amountCMV;
			if(isNaN(valExchangeRateCal))
			{
				document.getElementById('valExchangeRateINRCal').innerHTML = "-";
			}
			else{
				//Phase 3 CR:comma separated
				valExchangeRateCal=formatAmountAsCommaSeparated1(valExchangeRateCal.toFixed(2));
			    
				document.getElementById('valExchangeRateINRCal').innerHTML = valExchangeRateCal;
			}
		}	
	}
	
	function calculateLoanableAmount(){
		var amountCMV = document.forms[0].amountCMV.value;
		var margin = document.forms[0].margin.value;
		if(margin > 100){
			alert("Please enter value between 1 to 100.");
		}
		else{
			if(amountCMV != null && margin != null){
				var exchangeRateINR = 0;
				var loanableAmt = 0; 
				amountCMV = amountCMV.replace(/,/g,'');
				
				<%if(collValCurrency!=null && !collValCurrency.equals("")  && !collValCurrency.equalsIgnoreCase("INR")) {%>
					exchangeRateINR = document.getElementById('exchangeRateINR').value;

					//Phase 3 CR:comma separated
					exchangeRateINR=exchangeRateINR.replace(/,/g,'');
					
					loanableAmt = (amountCMV * exchangeRateINR) - ((amountCMV * margin * exchangeRateINR) / 100);				
				<%}else{%>
					loanableAmt = amountCMV - (amountCMV * margin)/100;
				<%}%>
				if(isNaN(loanableAmt)){
					document.getElementById('valLoanableAmount').innerHTML = "-";
				}else{
					//Phase 3 CR:comma separated
					loanableAmt=formatAmountAsCommaSeparated1(loanableAmt.toFixed(2));
				    
					document.getElementById('valLoanableAmount').innerHTML = loanableAmt;
					document.forms[0].loanableAmount.value = loanableAmt;
				}
			}else{
				document.getElementById('valLoanableAmount').innerHTML = "-";
			}
		}		
	}
</script>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">

  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <%if(collValCurrency!=null && !collValCurrency.equalsIgnoreCase("INR")) {%>        

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

             		
             		<td class="fieldname" width="20%"><bean:message key="label.security.backend.exchange.rate.inr"/>&nbsp;
                  		<font color="#0000FF"><span id="span_amountCMV">&nbsp;</span></font></td>
             		<td colspan="3">
                 		<input type="text" id="exchangeRateINR" name="exchangeRateINR" value="<%=exchangeRate%>" onkeyup="javascript:exchangeRateINRCal();" onchange="javascript:calculateLoanableAmount();" />
             		</td>

             </tr>
             
             <%}%>  
              <%if(collValCurrency!=null){ %>
           <input type="hidden" name="collateralCurrency" value="<%=collValCurrency%>">
            <tr class="<%=(rowIdx++)%2==0?"even":"even"%>">
               <td class="fieldname"><bean:message key="label.security.backend.security.omv.value"/>&nbsp;
             	</td>
               <td <%=collValCurrency.equalsIgnoreCase("INR")?"colspan=\"4\"":"width=\"30%\"" %>>
                <% if(colForm != null && colForm.getAmountCMV()!= null && !colForm.getAmountCMV().equals("")){%>
                 <html:text property="amountCMV" maxlength="25" onkeyup="javascript:exchangeRateINRCal();" onchange="javascript:calculateLoanableAmount();" size="33" styleId="amountCMV" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                <%}else{ %>
                  		<%if(iCol.getCMV() !=null){ %>
                 			<html:text property="amountCMV" styleId="amountCMV" maxlength="25"  value="<%=((iCol.getCMV().getAmount() > 0) ? 
                 					(String.valueOf(iCol.getCMV().getAmountAsBigDecimal())) : Integer.toString(0) )%>" 
                 					onkeyup="javascript:exchangeRateINRCal();" onkeyup="javascript:calculateLoanableAmount();"  size="33" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  		<%}else{ %>
                  			<html:text property="amountCMV" maxlength="25" onkeyup="javascript:exchangeRateINRCal();" onchange="javascript:calculateLoanableAmount();"  size="33" styleId="amountCMV" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                  		<%} %>
                  <%} %>

                  <html:errors property="amountCMV"/></td> 
              <%if(!collValCurrency.equalsIgnoreCase("INR")) {%>         
              <td class="fieldname"><bean:message key="label.security.backend.security.omv.inr"/>&nbsp;</td>
               <td>
                <b id='valExchangeRateINRCal'>
               		<script language="javascript">
               			exchangeRateINRCal();
               		</script>
               	</b>
             &nbsp;</td>
             <%}}%>

           </tr>
           
           <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
             		<td class="fieldname" width="20%">Margin <span class="mandatoryPerfection"> * </span></td>
             		<td colspan="1" width="30%">
             		<% if(colForm != null && colForm.getMargin()!= null && !colForm.getMargin().equals("")){%>
                 		<html:text property="margin" maxlength="05"  onkeyup="javascript:calculateLoanableAmount();"/>&nbsp;
                 	<%}else{ %>
                 		<html:text property="margin" maxlength="05" value="<%= iCol.getMargin() > 0.0 ? Double.toString(iCol.getMargin()):Integer.toString(0) %>" onkeyup="exchangeRateINRCal();"   onchange="javascript:calculateLoanableAmount();"/>&nbsp;
                 	<%} %>
                 		<html:errors property="haircut"/>
             		</td>
             		
             		<td class="fieldname" width="20%">Loanable Amount</td>
             		<td width="30%">
                 		<b id='valLoanableAmount'>
                 			<script language="javascript">
                 				calculateLoanableAmount();
			               </script>
			            </b>
			            <html:hidden property="loanableAmount" />
             		</td>
             </tr>
             
          </tbody>
        </table>
       </td>
    </tr>
	<tr><td>&nbsp;</td></tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>	
				<%@ include file="/collateral/common/view_audit_details.jsp"%> 		
					
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
</table>
<script type="text/javascript">

 function selectDropdownValue(dropdownObj, selectedValue) {

     for (i = 0; i < dropdownObj.options.length; i++) {
         if (selectedValue == dropdownObj.options[i].value) {
             dropdownObj.options[i].selected = true;
         } else {
             dropdownObj.options[i].selected = false;
         }
     }
 }

</script>

