<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.corpthirdparty.ICorporateThirdParty,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.FrequencyList,
                 java.lang.*,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="com.integrosys.cms.ui.collateral.*" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gtecorp3rd/GteCorp3rd_read_helper.jsp,v 1.50 2006/07/27 01:49:45 jzhan Exp $
     *
     * Purpose: Helper page to display data for read and process
     * Description: Type - Guarantee, Subtype - Corporate - Third Party
     *
     * @author $Author: jzhan $$<br>
     * @version $Revision: 1.50 $
     * Date: $Date: 2006/07/27 01:49:45 $
     * Tag: $Name:  $
     */
%>

<%
    ICorporateThirdParty oldCollateral = (ICorporateThirdParty) itrxValue.getCollateral();
    ICorporateThirdParty newCollateral = (ICorporateThirdParty) itrxValue.getStagingCollateral();
    String prefix = "Gte";
    String subtype = "GteCorp3rd";
    String formName = subtype + "Form";
    String formActionName = subtype+"Collateral.do";
	String claimDate="";
	
	String cityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.cityName");
	String stateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.stateName");
	String regionName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.regionName");
	String countryName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.countryName");
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@page import="com.integrosys.cms.ui.common.UIUtil"%><tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
                
                <%
                    ILimitCharge[] limit = iCol.getLimitCharges();
                    ILimitCharge objLimit = null;
                    if (limit != null && limit.length > 0) {
                        objLimit = limit[0];
                    }
                    ILimitCharge oldLimit = null;
                    ILimitCharge newLimit = null;
                    if (isProcess) {
                        if (oldCollateral != null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                            oldLimit = oldCollateral.getLimitCharges()[0];
                        }

                        if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                            newLimit = newCollateral.getLimitCharges()[0];
                        }
                    }
                    boolean isLimitNull = (objLimit == null);
                %>
			</tbody>
        </table>
    </td>
</tr>
 <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

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
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersName")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.guaranters.name"/>&nbsp;<span class="mandatoryPerfection"> * </span></td>
			            <td><integro:wrapper value="<%=newCollateral.getGuarantersName() %>" lineLength="50"/>&nbsp;
			            </td> 
			            <%
                     Amount stagingAmt = (newCollateral == null) ? null : newCollateral.getGuaranteeAmount();
                     Amount actualAmt = (oldCollateral == null) ? null : oldCollateral.getGuaranteeAmount();
                %>
	         
	         	<td class="<%=isProcess?(UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"):"fieldname"%>">
	         		<bean:message key="label.security.net.worth"/> &nbsp;<span class="mandatoryPerfection"> * </span></td>
	         	<td><integro:currency amount="<%=iCol.getGuaranteeAmount()%>" param="amount"/>&nbsp;</td>
	              			            
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	             	<bean:message key="label.security.net.worth.date"/></td>
		          	<td><integro:date object="<%=iCol.getClaimDate()%>"/> &nbsp;</td>
			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"addressLine1")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.address.line1"/>&nbsp;<span class="mandatoryPerfection"> * </span></td>
			            <td width="30%"><integro:wrapper value="<%=newCollateral.getAddressLine1() %>" lineLength="50"/>&nbsp;
			             </td> 
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">			
			             
			             <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetStatement")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Asset Statement
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getAssetStatement()%>"/>&nbsp;</td>
			             <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersDunsNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.guaranters.duns.no"/>
			      </td>
			            <td><integro:empty-if-null value="<%=newCollateral.getGuarantersDunsNumber()%>"/>&nbsp;
			                 </td>   
			             
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantorType")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Guarantor Type <span class="mandatoryPerfection">*</span>&nbsp;
				 </td>
					<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_GUARANTOR_TYPE,newCollateral.getGuarantorType())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersPam")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.guaranters.pan"/>
		         </td>
			            <td><integro:empty-if-null value="<%=newCollateral.getGuarantersPam()%>"/>&nbsp;
			            </td> 
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersNamePrefix")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.guaranters.name.prefix"/>&nbsp;<span class="mandatoryPerfection"> * </span></td>
			            <td><integro:wrapper value="<%=newCollateral.getGuarantersNamePrefix() %>" lineLength="50"/>&nbsp;
			                 </td> 
			                
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersFullName")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.guaranters.full.name"/>&nbsp;<span class="mandatoryPerfection"> * </span></td>
			            <td><integro:wrapper value="<%=newCollateral.getGuarantersFullName() %>" lineLength="50"/>&nbsp;
			                </td>          
	         </tr>
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         
			                
			      <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"addressLine2")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.address.line2"/></td>
			            <td width="30%"><integro:wrapper value="<%=newCollateral.getAddressLine2() %>" lineLength="50"/>
			            &nbsp;</td>   
			         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"addressLine3")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.address.line3"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getAddressLine3() %>" lineLength="50"/>&nbsp; </td>
			               
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		          
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"country")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
			 	 		<bean:message key="label.security.country"/>&nbsp;
	            		<span class="mandatoryPerfection">*</span>&nbsp;</td>          
			      	<td>
			      		<integro:empty-if-null value="<%=countryName %>"/>
			      		&nbsp;<html:hidden name="GteCorp3rdForm" property="country"/></td>	
			      		<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"region")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
	                	<bean:message key="label.security.region"/></td>          
			      	<td>
			      		<integro:empty-if-null value="<%=regionName %>"/>&nbsp;
			      		<html:hidden name="GteCorp3rdForm" property="region"/></td>		      
			                 
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					

			 		<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"state")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
			 			<bean:message key="label.security.state"/></td>          
			      	<td>
			      		<integro:empty-if-null value="<%=stateName %>"/>&nbsp;
			      		<html:hidden name="GteCorp3rdForm" property="state"/> </td>
			      		 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"city")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
			      	<bean:message key="label.security.city" /></td>          
			      <td>
			      	<integro:empty-if-null value="<%=cityName %>"/>&nbsp;
			      	<html:hidden name="GteCorp3rdForm" property="city"/></td>
			      	
			 </tr>
			  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				  <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"district")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	District
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getDistrict()%>"/>&nbsp;</td>	
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"pinCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Pin Code
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getPinCode()%>"/>&nbsp;</td>
			 </tr>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"telephoneNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.telephone.no"/></td>
			            <td><%=newCollateral.getTelephoneNumber()%>&nbsp;</td> 
			         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"telephoneAreaCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.telephone.area.code"/></td>
			            <td><%=newCollateral.getTelephoneAreaCode()%>&nbsp;
			            </td>       
			             
	         </tr>
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            
		            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guaranteeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
		            	<span >
		            	

		            	
		            	<bean:message key="label.security.start.guarantee.date"/></span>&nbsp;
		            	<%--Start:-------->Abhishek Naik %-->
		            	
		            	
		            	<span class="mandatoryPerfection">*</span>
		            	<%--End:-------->Abhishek Naik --%>
		          	<td><integro:date object="<%=iCol.getGuaranteeDate()%>"/> &nbsp;
		          	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                       <bean:message key="label.security.maturity.date"/></td>
                    <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/> &nbsp;</td>
		          	
		          	</td>    
		    </tr> 	
		    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">		          	
						
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"referenceNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
						<bean:message key="label.security.ram.id"/></td>
		            <td><%=newCollateral.getRamId()%>&nbsp; </td>  
		             <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantorNature")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Guarantor Nature 
				 </td>
				 	<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_GUARANTOR_NATURE,newCollateral.getGuarantorNature())%>"/>&nbsp;</td>
		    	
	        </tr>
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			 	 <td class="fieldname"> 
			 	 	<bean:message key="label.security.charge.type"/>&nbsp;
	            </td>          
			      <td><% if (!isLimitNull) { %>
                        <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
                        <% } %>&nbsp;
                   </td>
                   
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"rating")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.rating"/>
		         </td>
			            <td><integro:empty-if-null value="<%=newCollateral.getRating()%>"/>&nbsp;</td>
			               
			 </tr>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"recourse")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	<bean:message key="label.security.recourse" />
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getRecourse()%>"/>&nbsp;</td>
				 	<td class="fieldname"><bean:message key="label.security.holding.period"/></td>
					<td><% if (!(iCol== null)) { 
                           String claimPeriod = "";
                           if(iCol.getClaimPeriod() == null){
                        	   claimPeriod = String.valueOf(iCol.getClaimPeriod());
                            	 if(claimPeriod == null || claimPeriod.equals("null"))
    	                           {
    	                        	   claimPeriod ="-"; 	                        	   
    	                           }                           }
                           if(iCol.getClaimPeriodUnit() != null && !iCol.getClaimPeriodUnit().equals("null")){
                        	   claimPeriod = String.valueOf(iCol.getClaimPeriod());
                            	 if(claimPeriod == null || claimPeriod.equals("null"))
    	                           {
    	                        	   claimPeriod ="-"; 	                        	   
    	                           }
                            	 claimPeriod = claimPeriod + "&nbsp;" + FrequencyList.getInstance().getFrequencyValue(iCol.getClaimPeriodUnit()); 
                            }
							if (iCol.getClaimDate()==null) claimDate = "-";
							else {
							  claimDate = (new SimpleDateFormat("dd/MMM/yyyy")).format(iCol.getClaimDate());
							}  
							%>
                        <integro:empty-if-null value="<%=claimPeriod%>"/>
                        <% } %> &nbsp;
					
					</td>
			 </tr>
			
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"discriptionOfAssets")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            	<bean:message key="label.security.discri.assets"/></td>
	            <td class="fieldname">
	                <integro:wrapper value="<%=newCollateral.getDiscriptionOfAssets()%>"/>&nbsp; </td>
	                <td class="fieldname"><bean:message key="label.security.ref.num.guarantee"/></td>
		            <td><integro:empty-if-null value="<%=newCollateral.getReferenceNo()%>"/>&nbsp;
		            </td>
	        </tr>
		
            </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
