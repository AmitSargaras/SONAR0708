<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@ page import="com.integrosys.base.techinfra.util.PropertyUtil" %>
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insurancepolicy/update_insurance_policy.jsp,v 1.7 2006/10/27 08:34:44 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.7 $
* Date: $Date: 2006/10/27 08:34:44 $
* Tag: $Name:  $
*/
%>

<%
	InsurancePolicyForm insuranceObj = (InsurancePolicyForm) request.getAttribute(formStr);
	
	String indexID = (String)request.getParameter("indexID");
	String title = indexID.equals("-1")?"Add":"Edit";

    String isStpStatus = (String) request.getAttribute("isStpStatus");
    if (isStpStatus == null || isStpStatus.equals(""))
        isStpStatus = "fail";

    //Added By KLYong: Stp switch mode 
    String stpMode = PropertyUtil.getInstance("/stp.properties").getProperty(IStpConstants.STP_SWITCH_MODE);
    
    String subtypeCode = (String)request.getAttribute("getSubtypeCode");
    List insuranceCoverageList = null;
   	
    if(session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList");
   	}
    else if(session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
   	}
    else if(session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList")!=null){
    	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList");
   	}
    
    pageContext.setAttribute("insuranceCoverageList", insuranceCoverageList);
    
%>

<%@page import="com.integrosys.cms.ui.collateral.insurancepolicy.InsurancePolicyForm"%>
<%
	String[] style = {"even", "odd"};
	int count = 0;
%>

<%@page import="java.util.List"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/JavaScript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(num) {
    if (num == 1) {
	    enableAllFormElements();
        document.forms[0].event.value = "<%=CollateralAction.EVENT_CREATE%>";
    }
    if (num == 2) {
	    enableAllFormElements();
        document.forms[0].event.value = "<%=CollateralAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=CollateralAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=CollateralAction.EVENT_SEARCH_ACCOUNT%>";
    } 
    if (num == 5) {
        document.forms[0].event.value = "<%=CollateralAction.EVENT_REFRESH%>";
    }
    
    document.forms[0].submit();
}

function checkCurrency(val1,val2)
{
	
	if(val1 == val2)
	{
		document.forms[0].insuranceExchangeRate.disabled = false;
		document.forms[0].insuranceExchangeRate.value = '1.0';
		document.forms[0].insuranceExchangeRate.disabled = true;
	}
	else {
		document.forms[0].insuranceExchangeRate.disabled = false;
		document.forms[0].insuranceExchangeRate.value = '0.0';
		document.forms[0].insuranceExchangeRate.disabled = true;
	}
}

//Andy Wong: set debit account as mandatory when auto debit is true
function setDebitAcctMandatory(){
    if (document.forms[0].autoDebit[0].checked) {
        document.getElementById("spanDebitAcct").style.visibility = "visible";
    } else {
        document.getElementById("spanDebitAcct").style.visibility = "hidden";
    }
}

//-->
</script>

</head>

<body>
<%@ include file="/collateral/checkIsSSC.jsp"%>

<html:form action="<%=actionNameStr%>">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<!--<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>"/>-->
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="stpMode" value="<%=stpMode%>"/>
<html:hidden property="insuranceCompanyName"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td width="81%" ><h3><%=isSSC?"View":title%> <bean:message key="label.insurance.title"/></h3></td>
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
          	 <tr class="<%=style[count++%2] %>"> 
              <td class="fieldname">
              <bean:message key="label.insurance.policy.num"/>
			<span class="mandatoryperfection">*</span>
			  </td>
              <td>
              	<html:text property="insPolicyNum" maxlength="30" size="50"  />&nbsp;
             	<html:errors property="insPolicyNum"/>
              </td>
               <td  class="fieldname"><bean:message key="label.insurance.policy.cover.note"/></td>
              <td>
              	<html:text property="coverNoteNumber" maxlength="20" size="25" disabled="<%=isSSC%>"/>&nbsp;
              	<html:errors property="coverNoteNumber"/>
              </td>
            </tr>
            <tr class="<%=style[count++%2] %>"> 
              <td class="fieldname"><bean:message key="label.insurer.name"/>
				&nbsp;<span class="mandatoryperfection">*</span>
				</td>
              <td valign="top">
              	  <html:select property="insurerName">
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="insuranceCoverageList" labelProperty="label" property="value" />
	                  	</html:select>	
	              <html:errors property="insurerName" />
              </td>
            
              <td class="fieldname"><bean:message key="label.insurance.policy.currency"/>
				&nbsp; <span class="mandatoryperfection">*</span>
			  </td>
              <td> 
              <% if(insuranceObj.getInsPolicyCurrency()==null || "".equals(insuranceObj.getInsPolicyCurrency())){ %>                        
                    <html:select property="insPolicyCurrency"  value="INR">
                	  <option>Please Select </option>
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                    </html:select>&nbsp;
              <%}else{ %>                        
                    <html:select property="insPolicyCurrency" value="<%=insuranceObj.getInsPolicyCurrency().trim() %>">
                 	  <option value="">Please Select </option>
                      <html:options collection="currencyList" property="value" labelProperty="label" />	
                    </html:select>&nbsp;
              <%} %>
		    	   <html:errors property="insPolicyCurrency" />
              </td>
             </tr>
             
             <tr class="<%=style[count++%2] %>"> 
              <td  class="fieldname"><bean:message key="label.insurance.policy.type.perils1"/><span class="mandatoryPerfection"> * </span> </td>
              <td>
              	<html:select property="typeOfPerils1" disabled="<%=isSSC%>">
	            	<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY"/>
	            </html:select>&nbsp;
	              <html:errors property="typeOfPerils1" />
              </td>
            
              <td  class="fieldname"><bean:message key="label.insurance.policy.type.perils2"/>&nbsp; </td>
              <td>
              	<html:select property="typeOfPerils2" disabled="<%=isSSC%>">
	              <integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY"/>
	            </html:select>&nbsp;
	              <html:errors property="typeOfPerils2" />
              </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">   
              <td  class="fieldname"><bean:message key="label.insurance.policy.type.perils3"/>&nbsp; </td>
              <td>
              	<html:select property="typeOfPerils3" disabled="<%=isSSC%>">
	              <integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY"/>
	            </html:select>&nbsp;
	              <html:errors property="typeOfPerils3" />
              </td>
             
              <td  class="fieldname"><bean:message key="label.insurance.policy.type.perils4"/>&nbsp; </td>
              <td>
              	<html:select property="typeOfPerils4" disabled="<%=isSSC%>">
	              <integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY"/>
	            </html:select>&nbsp;
	              <html:errors property="typeOfPerils4" />
              </td>
            </tr>
              
            <tr class="<%=style[count++%2] %>">   
              <td class="fieldname"><bean:message key="label.insurable.amt.policy"/><span class="mandatoryPerfection"> * </span></td>
              <td>
              	<html:text property="insurableAmt" maxlength="22" size="32" disabled="<%=isSSC%>" styleId="insurableAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
              	<html:errors property="insurableAmt"/>
              </td>
            
              <td class="fieldname"><bean:message key="label.insured.amt"/>
				&nbsp;<span class="mandatoryperfection">*</span>
			   </td>
              <td>
              	<html:text property="insuredAmt" maxlength="22" size="32" disabled="<%=isSSC%>" styleId="insuredAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
              	<html:errors property="insuredAmt"/>
              </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insurance.received.date"/><span class="mandatoryPerfection"> * </span></td>
              <td>
              	<html:text property="receivedDate" readonly="true" size="15" maxlength="11" />
                	<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" 
                	<%=!isSSC?"onclick=\"return showCalendar('receivedDate', 'dd/mm/y');\"":""%> 
                		onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="receivedDate"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;
              </td>
           </tr>
            
           <tr class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insurance.effective.date"/>
				&nbsp;<span class="mandatoryperfection">*</span>
			  </td>
              <td>
              	<html:text property="effectiveDateIns" readonly="true" size="15" maxlength="11" />
                <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" <%=!isSSC?"onclick=\"return showCalendar('effectiveDateIns', 'dd/mm/y');\"":""%> onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="effectiveDateIns"/>
              </td>
              <td class="fieldname"><bean:message key="label.insurance.expiry.date"/>
				&nbsp;<span class="mandatoryperfection">*</span>
			  </td>
              <td>
              	<html:text property="expiryDateIns" readonly="true" size="15" maxlength="11" />
                <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" <%=!isSSC?"onclick=\"return showCalendar('expiryDateIns', 'dd/mm/y');\"":""%> onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="expiryDateIns"/>
              </td>
           </tr>
  
           <tr class="<%=style[count++%2] %>"> 
              <td  class="fieldname"><bean:message key="label.insurance.policy.insurance.defaulted"/>&nbsp; </td>
              <td>
              	<html:radio property="nonSchemeScheme" value="Y" ><bean:message key="label.insurance.policy.nonschema.schema.yes"/></html:radio>
              	&nbsp;&nbsp;
              	<html:radio property="nonSchemeScheme" value="N"><bean:message key="label.insurance.policy.nonschema.schema.no"/></html:radio>
              	<html:errors property="nonSchemeScheme"/>
              </td>
               <td  class="fieldname"><bean:message key="label.insurance.policy.premium"/>&nbsp; </td>
              <td>
              	<html:text property="insurancePremium" maxlength="20" size="30" disabled="<%=isSSC%>" styleId="insurancePremium" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
              	<html:errors property="insurancePremium"/>
              </td>
           </tr>
            
            <tr class="<%=style[count++%2] %>">
              	<td height="21" class="fieldname"><bean:message key="label.insured.addr"/></td>
	           	<td colspan="3">
				<html:textarea property="insuredAddress" rows="3" cols="150"   disabled="<%=isSSC%>"/>&nbsp;
	           	<html:errors property="insuredAddress"/><br>
	           	</td>
           	</tr>
           	<tr class="<%=style[count++%2] %>">
				<td height="21" class="fieldname"><bean:message key="label.insurance.policy.remark1"/></td>
	           	<td colspan="3" >
	             	<html:text property="remark1" size="80" maxlength="40" disabled="<%=isSSC%>"/>&nbsp;
	             	<html:errors property="remark1"/><br>
	           	</td>
           	</tr>
           	<tr class="<%=style[count++%2] %>">
			<td height="21" class="fieldname"><bean:message key="label.insurance.policy.remark2"/></td>
	           	<td colspan="3">
	             	<html:text property="remark2" size="80" maxlength="40" disabled="<%=isSSC%>"/>&nbsp;
	             	<html:errors property="remark2"/><br>
	           	</td>
           	</tr>
            <tr class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insured.against"/></td>
              <td colspan="3">
				<html:textarea property="insuredAgainst" rows="3" cols="150"  disabled="<%=isSSC%>"/>&nbsp;
              	<html:errors property="insuredAgainst"/>
              </td>
            </tr>
          </tbody>
        </table>
        </td>
      </tr>
      <tr><td colspan="2"><html:errors property="insuranceErr"/></td></tr>
  </tbody>
</table>
<table width="225"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="75" valign="baseline" align="center">
        <%
            if (indexID.equals("-1")) {
        %>
            <a href="#" onclick="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="#" onclick="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="#" onclick="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
	<tr><td height="50">&nbsp;</td></tr>
</table>
</html:form>

<script language="Javascript">
	setDebitAcctMandatory();
</script>
 
</body>
</html>
