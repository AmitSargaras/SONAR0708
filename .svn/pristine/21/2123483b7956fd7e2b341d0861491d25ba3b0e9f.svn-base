<%@ page import="com.integrosys.cms.app.limit.bus.*,
		   com.integrosys.base.businfra.currency.Amount,
		   com.integrosys.base.businfra.currency.CurrencyManager,
		   java.util.Date,
		   java.util.List,
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
		   com.integrosys.cms.app.limit.trx.ICoBorrowerLimitTrxValue,
		   com.integrosys.base.techinfra.propertyfile.PropertyManager,
		   com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@ page import="com.integrosys.cms.ui.common.ConvertFloatToString"%>
<%@ page import="com.integrosys.cms.app.limit.proxy.ILimitProxy"%>
<%@ page import="com.integrosys.cms.app.limit.proxy.LimitProxyFactory"%>

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
    document.forms[0].event.value = "checker_approve_update_co_borrower_limits";
	document.forms[0].submit();
}

function rejectPage() {
	document.forms[0].event.value = "checker_reject_update_co_borrower_limits"; 
	document.forms[0].submit();
}

function cancel(){
    document.forms[0].action="ToDo.do?";
    document.forms[0].submit();
}
</script>
<%
ICoBorrowerLimitTrxValue coBorrowerLimitTrxValue = (ICoBorrowerLimitTrxValue)session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.coBorrowerLimitTrxValue");
ICoBorrowerLimitTrxValue[] trxValues = coBorrowerLimitTrxValue.getCoBorrowerLimitTrxValues();

CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
ForexHelper fr = new ForexHelper();

CountryList cList = CountryList.getInstance();
List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
List ctryVals = (List)CountryList.getInstance().getCountryValues();
%>
</head>
<body onload="MM_preloadImages('img/return2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<html:form  action="Limits.do">
<input name="event" type="hidden" value=""/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Co-Borrower Limits</h3></td>
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
              <td width="3%"><bean:message key="label.global.sn"/></td>
              <td width="9%">Co-Borrower <bean:message key="label.limit.id"/></td>
              <td width="8%"><bean:message key="label.product.desc"/></td>
              <td width="9%"><bean:message key="label.global.outer.limit.id"/></td>
              <td width="12%">Approved Limit</td>
              <td width="12%">Activated Limit </td>               
              <td width="9%"><bean:message key="label.customer.id"/><br/>
              <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
              <bean:message key="label.customer.subprofile.id"/>
              <% } %>
              </td>
              <td width="24%">Legal Name<br/>Customer Sub-Profile Name</td>
              <td width="9%"><bean:message key="label.security.id"/></td>
              <td>Required Security Coverage (%)</td>
              <td width="9%">Limit-Security Linkage</td>
              <td width="10%" nowrap="nowrap"><bean:message key="label.security.type"/>/<bean:message key="label.security.sub.type"/></td>
              <td width="11%"><bean:message key="label.security.loc"/></td>
	      <td width="4%"><bean:message key="label.org.code "/></td>
              <td width="5%"><bean:message key="label.global.action"/></td>              
            </tr>
          </thead>  
          <tbody>
<%
	String color1 = "";
	String changedColor = "";
	double totalAppLimitAmt1 = 0;
	double totalActLimitAmt1 = 0;	
	if (trxValues!=null && trxValues.length!=0) {
		String reason1 = trxValues[0].getStagingLimit().getZerorisedReasons();	
		String zerorisedDate1 = trxValues[0].getStagingLimit().getZerorisedDate()==null?"":DateUtil.convertToDisplayDate(trxValues[0].getStagingLimit().getZerorisedDate());	
		boolean isZerorised1 = trxValues[0].getStagingLimit().getLimitZerorised();	
		boolean isZerorisedChanged = trxValues[0].getStagingLimit().getIsZerorisedChanged();
		boolean isZerorisedDateChanged = trxValues[0].getStagingLimit().getIsZerorisedDateChanged();
		boolean isZerorisedReasonChanged = trxValues[0].getStagingLimit().getIsZerorisedReasonChanged();			
	for (int i=0; i<trxValues.length; i++) {
		String actualCoBorrowerLimitID = String.valueOf(trxValues[i].getLimit().getLimitID());
        ICoBorrowerLimit coBorrowerLimit = trxValues[i].getStagingLimit();
        boolean isChanged = coBorrowerLimit.getIsChanged();
		String limitRef1 = coBorrowerLimit.getLimitRef();		
		String limitStatus = "";		
		if (coBorrowerLimit.getStatus()!=null && coBorrowerLimit.getStatus().equals(ICMSConstant.STATE_DELETED))
			limitStatus = "Deleted";
		String productKey1 = coBorrowerLimit.getProductDesc();
		if (productKey1==null) 
			productKey1 = "";		
        String productDesc1=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, productKey1);
        if (productDesc1==null)
        	productDesc1 = "-";
		String outerLimitRef1 = coBorrowerLimit.getOuterLimitRef();		
		if (outerLimitRef1==null)
		outerLimitRef1 = "0";        	
		Amount appLimitAmt1 = coBorrowerLimit.getApprovedLimitAmount();
		Amount actLimitAmt1 = coBorrowerLimit.getActivatedLimitAmount();						
		if (outerLimitRef1.equals("0") && coBorrowerLimit.getStatus()!=null && !coBorrowerLimit.getStatus().equals(ICMSConstant.STATE_DELETED)) {
			totalAppLimitAmt1 += fr.convertAmount(appLimitAmt1,usd);
		 	totalActLimitAmt1 += fr.convertAmount(actLimitAmt1,usd);
		}				        		        													
		ICMSCustomer customer = coBorrowerLimit.getCustomer();		
		String leID = customer.getCMSLegalEntity().getLEReference();
		String subProfileID = customer.getCustomerReference();
		String leName = customer.getCMSLegalEntity().getLegalName();
		String subProfileName = customer.getCustomerName();

        //start cr 35
        ICollateralAllocation[] collaterals = coBorrowerLimit.getCollateralAllocations();

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
            securityType += type+"/"+subType+"<br>";
			for( int k=0; k<ctryLbls.size(); k++){
                  if((collaterals[x].getCollateral().getCollateralLocation()!=null) && (collaterals[x].getCollateral().getCollateralLocation()).equals(ctryVals.get(k)))
                  		location += (String) ctryLbls.get(k)+"<br>";
            }
            if (collaterals[x].getCollateral().getSecurityOrganization() != null) {
                        orgCode += CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,collaterals[x].getCollateral().getSecurityOrganization()) + "<br>";
                    }			
						
            }
		}
        String secReqdCoverage = "";
         if (coBorrowerLimit.getRequiredSecurityCoverages() != ICMSConstant.FLOAT_INVALID_VALUE) {
            secReqdCoverage = ConvertFloatToString.getInstance().convertFloat (coBorrowerLimit.getRequiredSecurityCoverages());
        }
        //end cr 35
        if (isChanged)
			changedColor = "indexadd";
		else
			changedColor = "index";
		if (i%2==0)
			color1="even";
		else
			color1="odd";
%>
	<tr class="<%=color1%>">
	<td class="<%=changedColor%>"><%=i+1%>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=limitRef1%>"/>&nbsp;<font color="#FF0000" size="1"><%=limitStatus%></font></td>
	<td><integro:empty-if-null value="<%=productDesc1%>"/>&nbsp;</td>
<%
	if (outerLimitRef1.equals("0")) {
%>
	<td>-&nbsp;</td>
<%
    } else {
%>
	<td><integro:empty-if-null value="<%=outerLimitRef1%>"/>&nbsp;</td>
<%
	}
%>

<%
	if (appLimitAmt1!=null) {
%>		
	<td class="amount"><integro:currency amount="<%=appLimitAmt1%>" param="currency" />&nbsp;
<%
	if (outerLimitRef1.equals("0")) {
%>
	<integro:currency amount="<%=appLimitAmt1%>" param="amount" />
<%
	} else {
%>
	(<integro:currency amount="<%=appLimitAmt1%>" param="amount" />)
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
	if (actLimitAmt1!=null) {
%>
	<td class="amount"><integro:currency amount="<%=actLimitAmt1%>" param="currency" />&nbsp;
<%
	if (outerLimitRef1.equals("0")) {
%>
	<integro:currency amount="<%=actLimitAmt1%>" param="amount" />
<%
	} else {
%>
	(<integro:currency amount="<%=actLimitAmt1%>" param="amount" />)
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
	<td><integro:empty-if-null value="<%=leID%>"/><br>
	<% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
	<integro:empty-if-null value="<%=subProfileID%>"/>&nbsp;
	<% } %>
	</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=leName%>"/><br><integro:empty-if-null value="<%=subProfileName%>"/>&nbsp;</td>
    	<td nowrap="nowrap"><%=securityID%>&nbsp;</td>
	<td class="amount">100<%--integro:empty-if-null value="<%=secReqdCoverage%>"/--%>&nbsp;</td>
	<td><integro:empty-if-null value="<%=linkage%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=securityType%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=location%>"/>&nbsp;</td>
	<td nowrap="nowrap"><integro:empty-if-null value="<%=orgCode%>"/>&nbsp;</td>
    <td width="5%"><a href="Limits.do?event=view_co_borrower_limit_details&limitID=<%=actualCoBorrowerLimitID%>&trxID=<%=request.getParameter("trxID")%>&fromPage=checker_read_co_borrower_limits" >View</a></td>
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
	<td><integro:boolean-display style="yn" value="<%=isZerorised1%>"/>&nbsp;</td>
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
	<td colspan="3"><integro:empty-if-null value="<%=zerorisedDate1%>"/>&nbsp;</td>
	<td colspan="7">&nbsp;</td>
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
	<td colspan="7"><integro:empty-if-null value="<%=reason1%>"/>&nbsp;</td>
    <td colspan="6">&nbsp;</td>
    </tr>
<%		
	}
%>
	<tr class="odd">
	<td class="total" valign="top" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>
    <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:currency amount="<%=new Amount(totalAppLimitAmt1,usd)%>" param="amount" /></td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:currency amount="<%=new Amount(totalActLimitAmt1,usd)%>" param="amount" /></td>
	<td class="total" valign="top" >&nbsp;</td>
    <td valign="top" class="total" >&nbsp;</td>    
    <td valign="top" class="total" >&nbsp;</td>
    <td colspan="6" class="total">&nbsp;</td>
    </tr>
	<tr>
		<td colspan="15">&nbsp;</td>
	</tr>
	<tr class="even">
	<td colspan="2" class="fieldname">Remarks</td>
	<td colspan="7"><html:textarea property="remarks"  rows="4" cols="140" value=""/></td>
    <td colspan="6">&nbsp;</td>
    </tr>
</tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td colspan="12">&nbsp;</td>
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
</html:form>
</body>
</html>
