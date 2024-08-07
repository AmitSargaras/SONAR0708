<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
				 com.integrosys.cms.ui.collateral.CollateralConstant,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recopen.IReceivableOpen,
                 java.util.Date,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 java.util.Iterator,
                 java.util.HashMap,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetrecopen.AssetRecOpenForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetrecopen/assetRecOpen_read.jsp
    * Purpose: Read Collateral
    * Description: Type - AssetBased, Subtype - Assetrecopen
    *
    * @author $Author: jzhan $<br>
    * @version $Revision: 1.64 $
    * Date: $Date: 2006/11/23 02:42:41 $
    * Tag: $Name: DEV_20061123_B286V1 $
    */
%>

<%
    try {
		ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
		String natureOfAssignment=null;
		String amt= null;
		String dtlegallyassigned=null;
		String evalDateFSV=null;
		IReceivableOpen iCol = (IReceivableOpen) itrxValue.getStagingCollateral();
		//pageContext.setAttribute("obj", iCol);
		ILimitCharge ilimitcharge[] =iCol.getLimitCharges();

        if(ilimitcharge!=null && ilimitcharge.length>0)
        {
            natureOfAssignment= ilimitcharge[0].getNatureOfCharge();
            Amount amountOfAssignment= ilimitcharge[0].getChargeAmount();
            if (amountOfAssignment != null && amountOfAssignment.getCurrencyCode() != null) { 
            	amt =  CurrencyManager.convertToString(request.getLocale(),amountOfAssignment);
            }
            Date dateLegallyAssigned = ilimitcharge[0].getLegalChargeDate();
            dtlegallyassigned =  DateUtil.convertToDisplayDate(dateLegallyAssigned);
        }
        else
        {
            natureOfAssignment="-";
            amt ="-";
            dtlegallyassigned="-";
		}

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();    
    String subtype = "AssetRecOpen";
    String prefix = "Asset";
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";

    AssetRecOpenForm colForm = (AssetRecOpenForm)request.getAttribute(formName);
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
<!--

function updateInternal() {
    document.forms[0].secCustodianExt.value = '';
    document.forms[0].secCustodianExt.disabled = true;
    document.forms[0].secCustodianInt.disabled = false;
}

function updateExternal() {
    document.forms[0].secCustodianInt.value = '';
    document.forms[0].secCustodianInt.disabled = true;
    document.forms[0].secCustodianExt.disabled = false;
}


/*function selectLists(){
    List = document.forms[0].secInstrument;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
    }
}*/

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();
	
    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
	if (num == 3) {
    	document.forms[0].event.value="prepare_form";
    }
    if (num == 6) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";	    
    }
    if (num == 7) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 8) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    }

    document.forms[0].submit();

}

//-->
</script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="AssetRecOpenCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="subtype" value="AssetRecOpen"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.asset.title.create"/>
			<% } else { %>
				<bean:message key="label.security.asset.title.edit"/>
			<% } %>
		</h3></td>
      <!-- CR CMS-99 -->
      <!--<TD vAlign=bottom align=right >
	  <TABLE cellSpacing=0 class="tblFormSection" width="35%">
	    <TBODY>
	    <TR>
	    <TD class="edit">&nbsp;</TD>
	    <TD >SSC Editable Field </TD>
	    </TR>
	    </TBODY></TABLE>
      </TD>     -->
      <!-- CR CMS-99 -->
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
   <tbody>
    <tr>
      <td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
			<%@ include file="/collateral/common/common_fields_update.jsp" %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
				<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
					<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
						 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						 onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
			</tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.maturity.date" />&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><html:text readonly="true" property="collateralMaturityDate" style="width:90px" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="collateralMaturityDate"/></td>
					<html:hidden property="chargeId" />
				<td class="fieldname"><bean:message key="label.security.charge.type"/><bean:message key="label.mandatory"/></td>               
				<td><html:select property="chargeType">
		                <option value="" ><bean:message key="label.please.select"/></option>
		                <html:options name="chargeID" labelName="chargeValue"/>
                    </html:select>
	                <html:errors property="chargeType"/>
	                <html:errors property="chargeError"/></td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname">
		             <bean:message key="label.security.asset.amountdesc.assignment"/>&nbsp;<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			    <td><html:text property="amtCharge" size="15" maxlength="15"/>&nbsp;
			        <html:errors property="amtCharge"/>&nbsp;</td>
			    <td class="fieldname">
		            <bean:message key="label.security.asset.nature.assignment"/></td>
			    <td><html:select property="natureOfCharge">
			            <option value=""><bean:message key="label.please.select"/></option>
			            <html:options name="natureOfChargeID" labelName="natureOfChargeValue"/>
			        </html:select>
			        <html:errors property="natureOfCharge"/></td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname">
		            <bean:message key="label.security.asset.date.legally"/></td>
			    <td><html:text property="legalChargeDate" readonly="true" size="15" maxlength="11"/>
			        <img src="img/calendara.gif" name="Image723" border="0"
			             id="Image723" onclick="return showCalendar('legalChargeDate', 'dd/mm/y');"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
			        <html:errors property="legalChargeDate"/></td>
				<td class="fieldname">
					<bean:message key="label.security.asset.remaining.contract.period"/>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
                       
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.asset.approved.buyer"/></td>
				<td><html:text property="approvedBuyer" size="40" maxlength="50"/>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.security.asset.loc.approved.buyer"/></td>            
				<td><html:select property="locApprBuyer">
						<option value="" ><bean:message key="label.please.select"/></option>
						<html:options name="countryValues" labelName="countryLabels"/>
					</html:select>&nbsp;</td>
			</tr>
		  
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.asset.types.invoices"/></td>
				<td><html:select property="typeOfInvoice">
						<option value="" ><bean:message key="label.please.select"/></option>
						<html:options name="typeOfInvoiceListID" labelName="typeOfInvoiceListValue"/>
	                </html:select>
					<html:errors property="typeOfInvoice"/></td>
				<td class="fieldname">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp;
					<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.description" /></span> </td>
				<td colspan="3">
					<html:textarea property="remarks" rows="5" cols="120" style="width:100%" />&nbsp;
					<html:errors property="remarks"/></td>		                
			</tr>

          <!--<%@ include file="/collateral/common/update_security_instrument.jsp" %>-->
          </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>


<!--Update three valuation details-->
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp"%>

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>

</html:form>

<%
	} catch(Exception e)   {
           DefaultLogger.error(this,"error is "+e);
	}
%>

<%-- <%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %> --%>

</body>
</html>