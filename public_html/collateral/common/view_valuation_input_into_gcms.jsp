<%@page import="com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.CollateralDetailFactory" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralSubType" %>
<%@ page import="com.integrosys.cms.ui.collateral.TimeFreqList" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
 	String collValCurrency = "";
    rowIdx = 0; // to reset odd-even row highlighting

    IValuation iValIntoCMS = iCol.getValuationIntoCMS();


    boolean isiValIntoCMSNull = (iValIntoCMS == null);
    IValuation oldValuationIntoCMS = null;
    IValuation newValuationIntoCMS = null;
    boolean nonstdFreqChangedIntoCMS = false;
System.out.println("prefix:"+prefix);
    if (isProcess) {
        oldValuationIntoCMS = (oldCollateral == null) ? null : oldCollateral.getValuationIntoCMS();
        newValuationIntoCMS = newCollateral.getValuationIntoCMS();

        if (oldValuationIntoCMS != null && newValuationIntoCMS != null) {
            nonstdFreqChangedIntoCMS = !(CompareOBUtil.compOB(newValuationIntoCMS, oldValuationIntoCMS, "nonRevaluationFreq") &&
                    CompareOBUtil.compOB(newValuationIntoCMS, oldValuationIntoCMS, "nonRevaluationFreqUnit"));
        }
    }
    boolean checkNull = false;
    double haircut = 0;
    if (isProcess) {
        haircut = newCollateral.getMargin();
        if (haircut < 0 && oldCollateral == null) {
            checkNull = true;
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
  }else if(prefix.equals("Cash"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.cash.CashAction.exchangeRate"; 
    }
  else if(prefix.equals("Gte"))
  {
	  actionPackName = "com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.exchangeRate"; 
  }
  else if(prefix.equals("NoCollateral"))
  {
	  actionPackName = "com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.exchangeRate"; 
  } 
  else if(prefix.equals("Property"))
    {
  	  actionPackName = "com.integrosys.cms.ui.collateral.property.PropertyAction.exchangeRate"; 
    }
  String exchangeRate = (String)session.getAttribute(actionPackName);
  
  if(itrxValue.getCollateral()!=null && itrxValue.getCollateral().getCurrencyCode()!= null)
  	collValCurrency = itrxValue.getCollateral().getCurrencyCode().trim();
  
  if(collValCurrency==null)
  {
  collValCurrency = "";
  }
  String event = request.getParameter("event");
  Boolean hideAudit = new Boolean(String.valueOf(pageContext.getAttribute("hideAudit")));
  pageContext.setAttribute("hideAudit", hideAudit);
  
  IPropertyCollateral oldCollateralProp=null;
  IPropertyCollateral newCollateralProp=null;
  if("Property".equals(prefix)){
	 oldCollateralProp = (IPropertyCollateral) itrxValue.getCollateral();
	 newCollateralProp = (IPropertyCollateral) itrxValue.getStagingCollateral();
  }
  
%>


<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><script type="text/javascript">
	function exchangeRateINRCal() {
		var numAmountCMV;
		var exchangeRateINR = <%=exchangeRate%>;

		//Phase 3 CR:comma separated
		exchangeRateINR=exchangeRateINR.replace(/,/g,'');
		
		<%
			//BigDecimal  bVal;
		double amountP = 0.0;
		Amount amount = new Amount();
		if(itrxValue!=null){
			if(event.equals(ICommonEventConstant.EVENT_PROCESS) || event.equals("reject") || event.equals("track") 
			|| event.equals("prepare_close") || event.equals("process_return") || event.equals("track_return") || ICommonEventConstant.EVENT_APPROVE.equals(event)){
				amount = itrxValue.getStagingCollateral().getCMV();
			}else{
				amount = itrxValue.getCollateral().getCMV();
			}
			if(amount!=null){
				amountP=amount.getAmount();
			}else{
				amount= new Amount();
			}
		}
		%>
		var numAmountCMV = <%=amountP%>
		var valExchangeRateCal = exchangeRateINR*numAmountCMV;	
		
		if(isNaN(valExchangeRateCal))
		{
			document.getElementById('valExchangeRateINRCal').innerHTML = "-";
		}
		else{
			
			var parts = valExchangeRateCal.toFixed(2).toString().split(".");
		    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		    valExchangeRateCal= parts.join(".");
			document.getElementById('valExchangeRateINRCal').innerHTML = valExchangeRateCal;
		}
	}
	
	function calculateLoanableAmount(){
		var amountCMV = document.getElementById('amountCMV').value;
		var margin = document.getElementById('mrgn').value;
		
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
</script>


<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">

<tbody>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
		
        <%if(collValCurrency!=null && !collValCurrency.equals("")  && !collValCurrency.equalsIgnoreCase("INR")) {%>
        	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
             		<td class="fieldname" width="20%"><bean:message key="label.security.backend.exchange.rate.inr"/>&nbsp;
                  	</td>
             		<td colspan="3">
             		<integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(exchangeRate)%>"/>
             		<input type="hidden" id="exchangeRateINR" name="exchangeRateINR" value="<%=exchangeRate%>">

             		</td>	
            </tr>
            <%}%>
             <%if(collValCurrency!=null ){ %>
              <tr class="<%=(rowIdx++)%2==0?"even":"even"%>">
              	<%if("Property".equals(prefix)){ %>
     		   <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateralProp,oldCollateralProp,"CMV")?"fieldname":"fieldnamediff"):"fieldname"%>"  width="20%" >
<%}else{%>
     		   <td class="fieldname"  width="20%" >
<%}%>  
<bean:message key="label.security.backend.security.omv.value"/><span class="mandatoryPerfection"> * </span></td>
  			 	<td <%=(collValCurrency!=null && !collValCurrency.equals("") && !collValCurrency.equalsIgnoreCase("INR"))?"colspan=\"1\"":"colspan=\"3\"" %>>

  			 	 <%=UIUtil.formatWithCommaAndDecimal(amount.getAmountAsBigDecimal().toString())%>             
  			 	   <input type="hidden" name="amountCMV" id="amountCMV"  value="<%=amount.getAmountAsBigDecimal()%>">
  			 	  
  			 	   <%if(!"Property".equals(prefix)){ %>
     		   			<html:errors property="loaMasterError"/>
     		   			<html:errors property="notAllowedError"/>
				  <%}%>
  			   </td>
  			   
              <%if(!collValCurrency.equalsIgnoreCase("INR") && !collValCurrency.equals("") ) {%>         
              <td class="fieldname" width="20%"><bean:message key="label.security.backend.security.omv.inr" />&nbsp;</td>
               <td  width="30%">
               <b id='valExchangeRateINRCal' ><script language="javascript">
                           
               exchangeRateINRCal();
               </script></b>
             &nbsp;</td>
             <%}}%>

           </tr>
        	
        	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
             		<td class="fieldname" width="20%">Margin&nbsp;
                  	</td width="30%">
                  	<% if(iCol.getMargin()> 0.0){ %>
             			<td>
	             			<integro:empty-if-null value="<%=Double.toString(iCol.getMargin())%>"/>
	             			<input type="hidden" name="mrgn" id="mrgn" value="<%=Double.toString(iCol.getMargin())%>">
             			</td>
             		<%}else{ %>
             			<td width="30%">0</td>
             			<input type="hidden" name="mrgn" id="mrgn" value="<%=0%>">
             		<%} %>	
             		<td class="fieldname" width="20%">Loanable Amount</td>
             		<td width="30%">
                 		<b id='valLoanableAmount'>
                 			<script language="javascript">
                 				calculateLoanableAmount();
			               </script>
			            </b>&nbsp;
             		</td>	
            </tr>
        
        </tbody>
        </table>
        
    </td>
</tr>
<tr><td>&nbsp;</td></tr>
</tbody>
</table>
<logic:equal value="false" name="hideAudit">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>	
				<%@ include file="/collateral/common/view_audit_details.jsp"%> 		
					
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
</table>
</logic:equal>