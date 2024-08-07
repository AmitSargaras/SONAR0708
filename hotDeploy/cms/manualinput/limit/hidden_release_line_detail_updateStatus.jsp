<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>


  <html:hidden property="fromEvent"/> 
  <html:hidden property="limitProfileID"/>
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  <html:hidden property="customerID"/>
  <input type="hidden" name="inrValue"/>
<input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
<input type="hidden" name="facilityType" value="<%=request.getParameter("facilityType") %>">
<input type="hidden" name="facCat" value="<%=request.getParameter("facCat") %>"/>
 <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
	
<html:hidden name="XRefDetailForm" property="facilitySystemID" />  
<html:hidden name="XRefDetailForm" property="facilitySystem" />
<html:hidden name="XRefDetailForm" property="liabBranch" />
<html:hidden name="XRefDetailForm" property="currencyRestriction" />
<html:hidden name="XRefDetailForm" property="lineNo" />
<html:hidden name="XRefDetailForm" property="serialNo" />
<html:hidden name="XRefDetailForm" property="mainLineCode" />

<html:hidden name="XRefDetailForm" property="currency" />
<html:hidden name="XRefDetailForm" property="releasedAmount" />
<html:hidden name="XRefDetailForm" property="utilizedAmount" />
<html:hidden name="XRefDetailForm" property="releaseDate" />
<html:hidden name="XRefDetailForm" property="available" />

<html:hidden name="XRefDetailForm" property="limitStartDate" />
<html:hidden name="XRefDetailForm" property="dateOfReset" />
<html:hidden name="XRefDetailForm" property="closeFlag" />
<html:hidden name="XRefDetailForm" property="lastavailableDate" />
<html:hidden name="XRefDetailForm" property="uploadDate" />

<html:hidden name="XRefDetailForm" property="segment" />
<html:hidden name="XRefDetailForm" property="ruleId" />
<html:hidden name="XRefDetailForm" property="isCapitalMarketExposer" />
<html:hidden name="XRefDetailForm" property="freeze" />
<html:hidden name="XRefDetailForm" property="revolvingLine" />
<html:hidden name="XRefDetailForm" property="scfStatus" />
<html:hidden name="XRefDetailForm" property="scfFailedReason" />
<html:hidden name="XRefDetailForm" property="scmFlag" />
<html:hidden name="XRefDetailForm" property="vendorDtls" />


<html:hidden name="XRefDetailForm" property="isPrioritySector" /> 
<html:hidden name="XRefDetailForm" property="prioritySector" />
<html:hidden name="XRefDetailForm" property="isRealEstateExposer" />
<html:hidden name="XRefDetailForm" property="uncondiCancl" />
<html:hidden name="XRefDetailForm" property="interestRateType" /> 

<html:hidden name="XRefDetailForm" property="intRateFix" />
<html:hidden name="XRefDetailForm" property="intRateFloatingType" />
<html:hidden name="XRefDetailForm" property="intRateFloatingRange" />
<html:hidden name="XRefDetailForm" property="intRateFloatingMarginFlag" />
<html:hidden name="XRefDetailForm" property="intRateFloatingMargin" />

<html:hidden name="XRefDetailForm" property="estateType" />
<html:hidden name="XRefDetailForm" property="commRealEstateType" />
<html:hidden name="XRefDetailForm" property="limitTenorDays" />
<html:hidden name="XRefDetailForm" property="allAliasBranchCodeList" />
<html:hidden name="XRefDetailForm" property="aliasBranchCodes" />

<html:hidden name="XRefDetailForm" property="security1" />
<html:hidden name="XRefDetailForm" property="security2" />
<html:hidden name="XRefDetailForm" property="security3" />
<html:hidden name="XRefDetailForm" property="security4" />
<html:hidden name="XRefDetailForm" property="security5" />
<html:hidden name="XRefDetailForm" property="security6" />

<html:hidden name="XRefDetailForm" property="internalRemarks" />
<html:hidden name="XRefDetailForm" property="intradayLimitExpiryDate" />
<html:hidden name="XRefDetailForm" property="dayLightLimit" />
<html:hidden name="XRefDetailForm" property="coreStpRejectedReason" styleId="coreStpRejectedReason"/>
<html:hidden name="XRefDetailForm" property="appendAliasBranchCodeList" />
<html:hidden name="XRefDetailForm" property="branchAllowedFlag" />

<html:hidden name="XRefDetailForm" property="udfAllowed" />
<html:hidden name="XRefDetailForm" property="udfAllowed_2" />

<html:hidden name="XRefDetailForm" property="currencyCodes" />
<html:hidden name="XRefDetailForm" property="productCodes" />
<html:hidden name="XRefDetailForm" property="aliasBranchCodes" />
<html:hidden name="XRefDetailForm" property="branchAllowed" />
<html:hidden name="XRefDetailForm" property="productAllowed" />
<html:hidden name="XRefDetailForm" property="currencyAllowed" />
<html:hidden name="XRefDetailForm" property="limitRestriction" />
 <input type="hidden" name="limitType"  value="<%=(String)request.getAttribute("limitType")  %>"/>
 <html:hidden name="XRefDetailForm" property="sendToFile" styleId="sendToFile"/>
<html:hidden name="XRefDetailForm" property="status" styleId="status"/>
<html:hidden property="indexID"/>
<html:hidden property="lineAction" styleId="lineAction"/>
<html:hidden property="sourceRefNo"/>
  <html:hidden property="fromEvent"/>
<html:hidden name="XRefDetailForm" property="dayLightLimitApproved"/>
<html:hidden name="XRefDetailForm" property="bankingArrangement" />
<html:hidden name="XRefDetailForm" property="isDayLightLimitAvailable" />
<html:hidden name="XRefDetailForm" property="adhocLine" />
<html:hidden name="XRefDetailForm" property="generalPurposeLoan" />
<html:hidden name="XRefDetailForm" property="adhocTenor" />
<html:hidden name="XRefDetailForm" property="idlEffectiveFromDate" />
<html:hidden name="XRefDetailForm" property="idlExpiryDate" />
<html:hidden name="XRefDetailForm" property="idlAmount" />
<html:hidden name="XRefDetailForm" property="releaseableAmountCheck" />
<html:hidden name="XRefDetailForm" property="idlApplicableFlagCheck" />