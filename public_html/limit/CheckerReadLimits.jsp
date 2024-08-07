<%@ page import="com.integrosys.cms.app.limit.bus.*,
							   com.integrosys.base.businfra.currency.Amount,
                 			   com.integrosys.base.businfra.currency.CurrencyManager,
                 			   java.util.Date,
                 			   com.integrosys.base.businfra.currency.CurrencyCode,
                 			   com.integrosys.base.businfra.forex.ForexManager,
                 			   com.integrosys.cms.app.common.constant.ICMSConstant,
                 			   com.integrosys.cms.app.common.util.CommonUtil,
                 			   com.integrosys.cms.ui.common.ForexHelper,
                 			   com.integrosys.cms.ui.common.CountryList,
                 			   com.integrosys.component.commondata.app.CommonDataSingleton,
                 			   com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 			   com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 			   com.integrosys.base.techinfra.util.DateUtil,
                 			   java.util.List,
                 			   java.util.HashMap,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.common.Constants"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>
<title>View Limits</title>


<script language="JavaScript" src="js/imageLoad.js"></script>
<script language="JavaScript" type="text/JavaScript">
function approvePage() {
    document.forms[0].event.value = "checker_approve_update_limits";
	document.forms[0].submit();
}

function rejectPage() {
	document.forms[0].event.value = "checker_reject_update_limits"; 
	document.forms[0].submit();
}

function cancel(){
    document.forms[0].action="ToDo.do?";
    document.forms[0].submit();
}
</script>
<%
HashMap outerlimitObHash = (HashMap)session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.innerOuterBcaObList");
ILimitTrxValue limitTrxValue = (ILimitTrxValue)session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.limitTrxProfile");
Locale locale = (Locale) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "."+ Constants.GLOBAL_LOCALE_KEY);

ILimitTrxValue[] trxValues = limitTrxValue.getLimitTrxValues();
CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
ForexHelper fr = new ForexHelper();
CountryList cList = CountryList.getInstance();
List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
List ctryVals = (List)CountryList.getInstance().getCountryValues();
%>
</head>
<body onload="MM_preloadImages('img/return2.gif')">
<html:form  action="Limits.do">
<input name="event" type="hidden" value=""/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Limit List</h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<table  width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="8%">Product Desc</td>              
              <td width="9%">LE ID /<br> Customer Name </td>
              <td width="15%">Limit Location</td>
              <td width="9%"><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/> /<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
              <td width="9%">Outer Limit ID</td>
              <td width="12%">Approved Limit</td>
              <td width="12%">Activated Limit </td>              
              <td width="9%">Security ID</td>
              <td>Required Security Coverage (%)</td>     
              <td width="9%">Limit-Security Linkage</td>
              <td width="14%" nowrap="nowrap">Security Type/Subtype</td>
              <td width="11%">Security Location</td>
			  <td width="4%">Organisation Code</td>
              <td width="5%">Action</td>
            </tr>
          </thead>  
          <tbody>
<%
try{
	String color = "";
	String changeColor = "";
	double totalAppLimitAmt = 0;
	double totalActLimitAmt = 0;	
	if (trxValues!=null && trxValues.length!=0) {
		String reason = trxValues[0].getStagingLimit().getZerorisedReason();
		String zerorisedDate = trxValues[0].getStagingLimit().getZerorisedDate()==null?"":DateUtil.convertToDisplayDate(trxValues[0].getStagingLimit().getZerorisedDate());	
		boolean isZerorised = trxValues[0].getStagingLimit().getIsLimitZerorised();
		boolean isZerorisedChanged = trxValues[0].getStagingLimit().getIsZerorisedChanged();
		boolean isZerorisedDateChanged = trxValues[0].getStagingLimit().getIsZerorisedDateChanged();
		boolean isZerorisedReasonChanged = trxValues[0].getStagingLimit().getIsZerorisedReasonChanged();	
	for (int i=0; i<trxValues.length; i++) {
		String actualLimitID = String.valueOf(trxValues[i].getLimit().getLimitID());
	    ILimit stagingLimit = trxValues[i].getStagingLimit();
	    boolean isChanged = stagingLimit.getIsChanged();
		String limitID = String.valueOf(stagingLimit.getLimitID());
		String limitRef = stagingLimit.getLimitRef();
		String productKey =stagingLimit.getProductDesc();
		if (productKey==null) 
			productKey = "";		
        String productDesc=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, productKey);
        if (productDesc==null)
        	productDesc = "-";
		HashMap outerLimitMisc = (HashMap)outerlimitObHash.get(String.valueOf(limitID));
		String leID = "";
		String custName = "";
		String bcaRef = "";
		String bkgLoc = "";
		if (outerLimitMisc!=null) {
			leID = (String)outerLimitMisc.get("leId");
			custName = (String)outerLimitMisc.get("custName");
			bcaRef = (String)outerLimitMisc.get("bcaRef");
			bkgLoc = cList.getCountryName((String)outerLimitMisc.get("bkgLoc"));
		}
		String limitCountryCode = stagingLimit.getBookingLocation().getCountryCode();
		String limitOrgCode = stagingLimit.getBookingLocation().getOrganisationCode();
		String limitLocation="";
/*		for( int k=0; k<ctryLbls.size(); k++) {
			if(limitCountryCode!=null && limitCountryCode.equals(ctryVals.get(k)))
				limitLocation = (String)ctryLbls.get(k);
		}*/
		limitLocation = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,limitOrgCode)+ " ("+limitOrgCode+")";
		boolean isSameBCA = stagingLimit.getIsInnerOuterSameBCA();
		String outerLimitRef = stagingLimit.getOuterLimitRef();		
		if (outerLimitRef==null)
			outerLimitRef = "0";
	    String limitStatus = stagingLimit.getLimitStatus();
		Amount appLimitAmt =stagingLimit.getApprovedLimitAmount();
		Amount actLimitAmt = stagingLimit.getActivatedLimitAmount();	
		if (outerLimitRef.equals("0") && limitStatus!=null && !limitStatus.equals(ICMSConstant.STATE_DELETED)) {
			 totalAppLimitAmt += fr.convertAmount(appLimitAmt,usd);
			 totalActLimitAmt += fr.convertAmount(actLimitAmt,usd);
		}
		ICollateralAllocation[] collaterals = stagingLimit.getCollateralAllocations();
		String securityID = "";
		String linkage = "";
		String securityType = "";
		String location = "";
		String orgCode="";
		if (collaterals!=null) {			
			for (int x=0; x<collaterals.length; x++) {
			securityID += collaterals[x].getCollateral().getSCISecurityID()+"<br>";	
			String hostStatus = collaterals[x].getHostStatus();
			if (hostStatus!=null && hostStatus.equals( ICMSConstant.HOST_STATUS_DELETE )) 
				linkage += "Deleted"+"<br>";
			else
				linkage += "Active"+"<br>";
			String type = collaterals[x].getCollateral().getCollateralType().getTypeName();
			String subType = collaterals[x].getCollateral().getCollateralSubType().getSubTypeName();
			securityType += type+"/ "+subType+"<br>";
			for( int k=0; k<ctryLbls.size(); k++){			
                  if((collaterals[x].getCollateral().getCollateralLocation()!=null) && (collaterals[x].getCollateral().getCollateralLocation()).equals(ctryVals.get(k)))
                  		location += (String) ctryLbls.get(k)+"<br>";            							
            	}
				if (collaterals[x].getCollateral().getSecurityOrganization() != null) {
                        orgCode += CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,collaterals[x].getCollateral().getSecurityOrganization()) + "<br>";
                    }
			}
			      
			
		}		
		String requiredSecurityCoverage = "-";
		//if (stagingLimit.getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
         //   requiredSecurityCoverage = MapperUtil.mapDoubleToString (stagingLimit.getRequiredSecurityCoverage(), 0, locale);
        //}  //Shiv 210911
		
		if (stagingLimit.getRequiredSecurityCoverage() != null || stagingLimit.getRequiredSecurityCoverage().equals("")) {
            requiredSecurityCoverage = stagingLimit.getRequiredSecurityCoverage();
         }  //Shiv 210911
		// cms-3040 the deleted limits did not appear in "Red" - Start 
		String displayDel = "";
		if (limitStatus !=null && limitStatus.equals(ICMSConstant.STATE_DELETED))
			displayDel = "Deleted";
		// cms-3040 - End         
		if (isChanged)
			changeColor = "indexadd";
		else 
			changeColor = "index";
	    if (i%2==0)
			color="even";
		else
			color="odd";
%>
	<tr class="<%=color%>">
	<td class="<%=changeColor%>"><%=i+1%>&nbsp;</td>
	<td><integro:empty-if-null value="<%=limitRef%>"/>&nbsp; <font color="#FF0000" size="1"><%=displayDel%></font></td>
	<td><integro:empty-if-null value="<%=productDesc%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=leID%>"/>&nbsp;<br><integro:empty-if-null value="<%=custName%>"/></td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=limitLocation%>"/>&nbsp;</td>
	<td><integro:empty-if-null value="<%=bcaRef%>"/>&nbsp;<br><integro:empty-if-null value="<%=bkgLoc%>"/></td>	
<%
	if (outerLimitRef.equals("0")) {
%>
	<td>-&nbsp;</td>
<%
	} else if (isSameBCA) {
%>
	<td><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
<%
	} else {
%>
	<td class="outerlimit" ><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
<%
	}
%>
<%
	if (appLimitAmt!=null) {
%>
	<td class="amount"><integro:currency amount="<%=appLimitAmt%>" param="currency" />&nbsp;
<%
	if (outerLimitRef == null || outerLimitRef.equals("0")) {
%>
	<integro:currency amount="<%=appLimitAmt%>" param="amount" />
<%
	} else {
%>
	(<integro:currency amount="<%=appLimitAmt%>" param="amount" />)
<%
	}
%>
	</td>
<%
	} else {
%>
	<td class="amount">&nbsp;</td>	
<%
	}
%>

<%
	if (actLimitAmt!=null) {
%>
	<td class="amount"><integro:currency amount="<%=actLimitAmt%>" param="currency" />&nbsp;
<%
	if (outerLimitRef == null || outerLimitRef.equals("0")) {
%>
	<integro:currency amount="<%=actLimitAmt%>" param="amount" />
<%
	} else {
%>
	(<integro:currency amount="<%=actLimitAmt%>" param="amount" />)
<%
	}
%>
	</td>
<%
	} else {
%>
	<td class="amount">&nbsp;</td>	
<%
	}
%>
	<td><%=securityID%>&nbsp;</td>
	<td class="amount">100<%--integro:empty-if-null value="<%=requiredSecurityCoverage%>"/--%>&nbsp;</td>
	<td><integro:empty-if-null value="<%=linkage%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=securityType%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=location%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=orgCode%>"/>&nbsp;</td>
	<td width="5%"><a href="Limits.do?event=view_limit_details&limitID=<%=actualLimitID%>&fromPage=checker_read_limits" >View</a></td>      
	</tr>

<%
		}
%>	
	<tr class="odd">
<%
	if (isZerorisedChanged) {
%>
		<td colspan="2"  class="indexadd">Limit reduced to Zero</td>			
<%
	} else {
%>		
		<td colspan="2"  class="fieldname">Limit reduced to Zero</td>			
<%
	}
%>
		<td><integro:boolean-display style="yn" value="<%=isZerorised%>"/>&nbsp;</td>
<%
	if (isZerorisedDateChanged) {
%>		
		<td colspan="2"  class="indexadd">Date Limit reduced to Zero&nbsp;<font color="#00AAFF">* </font></td>
<%
	} else {
%>
		<td colspan="2"  class="fieldname">Date Limit reduced to Zero</td>
<%
	}
%>		
		<td colspan="2"><integro:empty-if-null value="<%=zerorisedDate%>"/>&nbsp;</td>
		<td colspan="9">&nbsp;</td>
	</tr>
	<tr class="odd">
<%
	if (isZerorisedReasonChanged) {
%>	
	<td colspan="2"  class="indexadd">Reasons For Limit Reduced to Zero&nbsp;<font color="#00AAFF">* </font></td>
<%
	} else {
%>
	<td colspan="2"  class="fieldname">Reasons For Limit Reduced to Zero</td>
<%
	}
%>
	<td colspan="14"><integro:empty-if-null value="<%=reason%>"/>&nbsp;</td>		
	</tr>
<%		
	}
%>
	<tr class="odd">
	<td class="total" valign="top" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:currency amount="<%=new Amount(totalAppLimitAmt,usd)%>" param="amount" /></td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:currency amount="<%=new Amount(totalActLimitAmt,usd)%>" param="amount" /></td>
	<td class="total" valign="top" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>    
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>        
    <td valign="top" class="total" >&nbsp;</td>
	<td valign="top" class="total" >&nbsp;</td>
	</tr>
	<tr>
		<td colspan="16">&nbsp;</td>
	</tr>
	<tr class="even">
	<td colspan="2" class="fieldname">Remarks</td>
	<td colspan="14"><html:textarea property="remarks"  rows="4" cols="140" value=""/></td>
	</tr>
</tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td width="100" valign="baseline" align="center"> <a href="javascript:approvePage();"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2211','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image2211"  border="0" id="Image2211" /></a></td>
<td width="100" valign="baseline" align="center"> <a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
<td width="100" valign="baseline" align="center"> <a href="javascript:cancel();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>	       	       
</tr>
</table>
</td>
</tr>
</tbody>
</table>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>
</html:form>
</body>
</html>
