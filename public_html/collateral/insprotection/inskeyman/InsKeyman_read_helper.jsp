<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.type.insurance.subtype.keymaninsurance.IKeymanInsurance,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.insprotection.NatureOfChargeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insprotection/inskeyman/InsKeyman_read_helper.jsp,v 1.31 2006/07/27 01:58:31 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Insurance, Subtype - Keyman Insurance
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.31 $
* Date: $Date: 2006/07/27 01:58:31 $
* Tag: $Name:  $
*/
%>

<%
    IKeymanInsurance oldCollateral = (IKeymanInsurance) itrxValue.getCollateral();
    IKeymanInsurance newCollateral = (IKeymanInsurance) itrxValue.getStagingCollateral();
    String formName = "InsKeymanForm";
    String prefix = "Ins";
    String subtype = "InsKeyman";
    String formActionName = subtype+"Collateral.do";
    
    String insurerNameVal= (String)request.getAttribute("InsurerName"); 
    
    InsKeymanForm colForm = (InsKeymanForm) request.getAttribute(formName);
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
  
<%@page import="com.integrosys.cms.ui.collateral.insprotection.inskeyman.InsKeymanForm"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><tbody>
    <tr>
      <td colspan="2">
      	<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
          <tbody>
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
<!--            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.security.fsv"/></td>
              <td>
              <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;
              </td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>          
          </tr>
            <tr class="even">
            <%@ include file="/collateral/common/common_security_custodian_read.jsp" %>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>-->
            <%
                ILimitCharge[] limit = iCol.getLimitCharges();
                ILimitCharge objLimit = null;
                if (limit != null && limit.length > 0) {
                    objLimit = limit[0];
                }
                ILimitCharge oldLimit = null;
                ILimitCharge newLimit = null;
                Amount oldChargeAmt = null;
                Amount newChargeAmt = null;
                if (isProcess) {
                    if (oldCollateral != null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                        oldLimit = oldCollateral.getLimitCharges()[0];
                    }
                    if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                        newLimit = newCollateral.getLimitCharges()[0];
                    }
                    if (oldLimit != null) {
                        oldChargeAmt = oldLimit.getChargeAmount();
                    }
                    if (newLimit != null) {
                        newChargeAmt = newLimit.getChargeAmount();
                    }
                }
                boolean isLimitNull = (objLimit == null);
            %>
          </tbody>
        </table></td>
    </tr>
<!--  Added by Pramod Katkar for New Filed CR on 22-08-2013-->
  <%if("process".equals(from_event)){ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%} %>
<!--End by Pramod Katkar-->
  </tbody>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
<%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<%-- 
	<thead>
		<tr>
			<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
		</tr>
		<tr>
			<td><hr/></td>
		</tr>
	</thead>
	--%>
	<tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<% rowIdx++; %>
            <tr class="even">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insurerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.insurer.company.name"/>&nbsp;</td>
             <td width="30%">
<%--
              <integro:empty-if-null value="<%=iCol.getInsurerName()%>"/>
--%><!--
			  <integro:common-code categoryCode="INSURER_NAME" entryCode="<%=iCol.getInsurerName()%>" display="true"/> &nbsp;-->
			  
			  
<integro:empty-if-null value="<%=insurerNameVal%>" />&nbsp;
	
			  </td>
              <%--Govind S: Commented for HDFC Insurence(Life Insurence) security 06/07/2011
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insuranceType")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.insurance.type"/>&nbsp;<span class="mandatory">*</span></td>
              <td><integro:common-code categoryCode="<%=CategoryCodeConstant.INSURANCE_TYPE %>" entryCode="<%=iCol.getInsuranceType()%>" display="true"/> &nbsp;</td>
			 --%>
			  <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"policyNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.policy.num"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=iCol.getPolicyNo()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getInsuredAmount(),((oldCollateral==null)?null:oldCollateral.getInsuredAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.insured.amt"/>&nbsp;</td>
              <td colspan="3"><!-- <bean:write name="InsKeymanForm" property="insuredAmt"/> -->
               <%if(null!=iCol.getInsuredAmount() && !"".equals(iCol.getInsuredAmount())){ %>
              <%= UIUtil.formatWithComma(iCol.getInsuredAmount().getAmountAsBigDecimal().toPlainString())%>	 
              <%} %>&nbsp;</td>
            </tr>
            
            <tr class="even">
               <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insEffectiveDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.insurance.effective.date"/>
               <%--Start:-------->Abhishek Naik --%>
               <span class="mandatoryPerfection">*</span>&nbsp;
               <%--End:-------->Abhishek Naik --%>
               </td>
              <td width="20%"><integro:date object="<%=iCol.getInsEffectiveDate()%>" />&nbsp;</td>
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insExpiryDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.insurance.maturity.dat"/>&nbsp;<%--<bean:message key="label.insurance.expiry.dat"/></td>--%>
              	<td width="30%"><integro:date object="<%=iCol.getInsExpiryDate()%>" />&nbsp;</td>
              	
            </tr>
         
            <tr class="odd">

               <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.maturity.date"/>&nbsp;</td>
              <td colspan="3"><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
            </tr>
<!--  Added by Pramod Katkar for New Filed CR on 22-08-2013-->
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isPhysicalInspection")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/><span class="mandatoryPerfection">*</span>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol.getIsPhysicalInspection()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        if (isProcess) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreq")||(iCol.getPhysicalInspectionFreq() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreqUnit");
        }
    %>
    <td class="<%=isProcess?(physicalUpdated?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
        <%if (iCol.getIsPhysicalInspection()) {%>
        &nbsp;<%--<span class="mandatory">*</span>
        --%><%}%>
    </td> 
        
        <% if (iCol.getPhysicalInspectionFreqUnit() != null) { %>
       <td> <integro:common-code-single entryCode="<%=iCol.getPhysicalInspectionFreqUnit()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% } else{ %>
        <td>-&nbsp;</td>
        <%} %>
       
        
    
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.last.phy.verification.date"/><span class="mandatoryPerfection">*</span>
        <%if (iCol.getIsPhysicalInspection()) {%>
        &nbsp;<%}%></td>
        <%if(iCol.getLastPhysicalInspectDate()!=null){ %>
    <td><integro:date object="<%=iCol.getLastPhysicalInspectDate()%>"/>&nbsp;</td>
    <%}else{ %>
     <td>-&nbsp;</td>
    <%} %>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
    <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
    <%if(iCol.getNextPhysicalInspectDate()!=null){ %>
    <td><integro:date object="<%=iCol.getNextPhysicalInspectDate()%>"/>&nbsp;</td>
    <%}else{ %>
     <td>-&nbsp;</td>
    <%} %>
    
</tr>
<!--End by Pramod Katkar-->
            <%--
            <tr class="odd">
              	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isBankInterestDulyNoted")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.bank.interest.duly.noted"/></td>
              		
              	<td colspan="3"><%if(!iCol.getIsBankInterestDulyNoted()){%>
              	Primary
              	<% }if(iCol.getIsBankInterestDulyNoted()){%>
              	Secondary
              	<%} %>
              	</td>
              	 %>
              <%-- 
              	<integro:boolean-display style="yn" value="<%=iCol.getIsBankInterestDulyNoted()%>"/>&nbsp;</td>
              --%>
            <%--</tr>--%>
            
   <%--Govind S: Comment for Insurence(Life Insurence) security 06/07/2011
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
  --%>
	<%--Govind S: Comment for HDFC Insurence(Life Insurence) security 06/07/2011
            <tr class="odd">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
            		<bean:message key="label.security.asset.nature.assignment"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><% if (!isLimitNull) { %>
	                	<integro:empty-if-null value="<%=NatureOfChargeList.getInstance().getNatureOfChargeItem(objLimit.getNatureOfCharge())%>"/>
	                <% } %> &nbsp; </td>	
	            	<%  boolean changed = false;
		                if (isProcess) {
		                    if (newChargeAmt != null && oldChargeAmt == null) {
		                        if (newChargeAmt.getAmount() != 0) {
		                            changed = true;
		                        }
		                    } else if (newChargeAmt != null && oldChargeAmt != null) {
		                        changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount");
		                    }
		                }
	            	%>
	            <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>">
	            	<bean:message key="label.security.asset.amountdesc.assignment"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
	            <td><% if (!isLimitNull && objLimit.getChargeAmount() != null &&
	                      objLimit.getChargeAmount().getCurrencyCode() != null) { %>
	              		<bean:write name="InsKeymanForm" property="amtCharge"/>
	              	<% } %> &nbsp;</td>
            </tr>
            
            <tr class="even">
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.security.asset.date.legally"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
              	<td><% if (!isLimitNull) { %>
              			<integro:date object="<%=objLimit.getLegalChargeDate()%>" />
               	 	<% } %> &nbsp; </td>
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeConfirmationDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.confirmation.assignmnt.date"/></td>
              	<td><% if (!isLimitNull) { %>
              			<integro:date object="<%=objLimit.getChargeConfirmationDate()%>" />
                	<% } %> &nbsp; </td>
            </tr>
           
            <tr class="odd">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
            		<bean:message key="label.security.charge.type"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
            	<td><% if (!isLimitNull) { %>
            			<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
            		<% } %>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"arrInsurer")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.credit.arr.insurer"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ARR_INSURER, iCol.getArrInsurer())%>"/></td>
            </tr>
            
    
            <tr class="even">   
           
  				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insurancePremium")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.insurance.premium.amount"/></td>
               <td><bean:write name ="<%=formName %>" property="premiumAmount"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
              	<td>&nbsp;</td>
            </tr>
           
			<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
			
			<%@ include file="/collateral/common/common_fields_read.jsp" %>
             <!--<%@ include file="/collateral/common/view_security_instrument.jsp" %>-->
	    --%> 
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%--Govind S: Commented for HDFC Insurence(Life Insurence) security 06/07/2011
<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %> 

<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>
--%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
