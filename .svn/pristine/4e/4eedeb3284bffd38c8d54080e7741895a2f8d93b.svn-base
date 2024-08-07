<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.banksameccy.IBankSameCurrency,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
				 com.integrosys.cms.ui.common.CommonCodeList,
                 java.lang.*,
				 java.text.SimpleDateFormat" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gtebanksame/GteBankSame_read_helper.jsp,v 1.43 2006/07/27 01:49:00 jzhan Exp $
     *
     * Purpose: Helper page to display data for read and process
     * Description: Type - Guarantee, Subtype - Bank-Same Currency
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.43 $
     * Date: $Date: 2006/07/27 01:49:00 $
     */
%>

<%
GteBankSameForm formGte = (GteBankSameForm) request.getAttribute("GteBankSameForm");
System.out.println("@@@@@@@@@@@@@@formGte@@@@@@@@@@@"+formGte.getDiscriptionOfAssets());
//System.out.println("@@@@@@@@@@@@@@formGte@@@@@@@@@@@"+formGte.getAddressLine1());

    IBankSameCurrency oldCollateral = (IBankSameCurrency) itrxValue.getCollateral();
    IBankSameCurrency newCollateral = (IBankSameCurrency) itrxValue.getStagingCollateral();
    String prefix = "Gte";
    String subtype = "GteBankSame";
    String formName = subtype + "Form";
	String formActionName = subtype+"Collateral.do";
	String claimDate="";
	
	String cityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.cityName");
	String stateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.stateName");
	String regionName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.regionName");
	String countryName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.countryName");
	pageContext.setAttribute("hideAudit", "true");
%>


<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.ui.collateral.guarantees.gtebanksame.GteBankSameForm"%><tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
			</tbody>
        </table>
    </td>
</tr>
 <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
</tbody>

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
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	        				
		            <td class="fieldname" width="25%">
		            	<bean:message key="label.security.holding.period"/></td>
					<td width="25%"><% if (!(iCol== null)) { 
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
					<td class="fieldname" width="25%">&nbsp;
		            	</td>
		            <td width="25%">&nbsp;
		        		</td>
		        
			</tr>		
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname">
		            	<bean:message key="label.security.ref.num.guarantee"/></td>
		            <td>
		            <integro:empty-if-null value="<%=newCollateral.getReferenceNo() %>"/>&nbsp;
		            </td>
		            
		            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guaranteeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
		            	
		            	<bean:message key="label.security.start.guarantee.date"/>&nbsp;
		            	<%--Start:-------->Abhishek Naik--%>
						
		            	<span class="mandatoryPerfection">*</span>
		            	<%--End:-------->Abhishek Naik--%>
		            </td>
		          	<td><integro:date object="<%=iCol.getGuaranteeDate()%>"/> &nbsp;
		          	
		          	</td>    
		    </tr>     
		    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		          	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                       <%--<span class=stp>--%><bean:message key="label.security.maturity.date"/><%--</span> --%></td>
                    <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/> &nbsp;</td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ramId")?"fieldname":"fieldnamediff"):"fieldname"%>">
						<bean:message key="label.security.ram.id"/></td>
		            <td><%=newCollateral.getRamId() %>&nbsp; </td>      	
	        </tr>
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		          	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"followUpDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                       <bean:message key="label.security.follow.up.date"/>
                    </td>
                    <td><integro:date object="<%=iCol.getFollowUpDate()%>"/> &nbsp;</td>
					<td class="fieldname">&nbsp;</td>
		            <td>&nbsp;</td> 	
	        </tr>
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	         
	         	<%
                     Amount stagingAmt = (newCollateral == null) ? null : newCollateral.getGuaranteeAmount();
                     Amount actualAmt = (oldCollateral == null) ? null : oldCollateral.getGuaranteeAmount();
                %>
	         
	         	<td class="<%=isProcess?(UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"):"fieldname"%>">
	         		<bean:message key="label.security.net.worth"/></td>
	         	<td>
	         	<integro:currency amount="<%=iCol.getGuaranteeAmount()%>" param="amount"/>&nbsp;</td>
	            
	             <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"claimDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	             	<bean:message key="label.security.net.worth.date"/></td>
		          	<td><integro:date object="<%=iCol.getClaimDate()%>"/> &nbsp;</td>   
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"telephoneNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.telephone.no"/></td>
			            <td><%=newCollateral.getTelephoneNumber() %>&nbsp;</td> 
			                
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersDunsNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.guaranters.duns.no"/>
			      </td>
			            <td><integro:empty-if-null value="<%=newCollateral.getGuarantersDunsNumber() %>"/>&nbsp;
			                 </td>          
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersPam")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.guaranters.pan"/>
		         </td>
			            <td><integro:empty-if-null value="<%=newCollateral.getGuarantersPam() %>"/>&nbsp;
			            </td> 
			                
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersName")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.guaranters.name"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getGuarantersName() %>" lineLength="50"/>&nbsp;
			            </td>          
	         </tr>
	         
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersNamePrefix")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.guaranters.name.prefix"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getGuarantersNamePrefix() %>" lineLength="50"/>&nbsp;
			                 </td> 
			                
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantersFullName")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.guaranters.full.name"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getGuarantersFullName() %>" lineLength="50"/>&nbsp;
			                </td>          
	         </tr>
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"addressLine1")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.address.line1"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getAddressLine1() %>" lineLength="50"/>&nbsp;
			             </td> 
			                
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"addressLine2")?"fieldname":"fieldnamediff"):"fieldname"%>">
			      	<bean:message key="label.security.address.line2"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getAddressLine2() %>" lineLength="50"/>&nbsp;</td>          
	         </tr>	
	         
	         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"addressLine3")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.address.line3"/></td>
			            <td><integro:wrapper value="<%=newCollateral.getAddressLine3() %>" lineLength="50"/>&nbsp; </td>
			      
			      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"country")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
			 	 		<bean:message key="label.security.country"/></td>          
			      	<td>
			      		<integro:empty-if-null value="<%=countryName %>"/>
			      		&nbsp;<html:hidden name="GteBankSameForm" property="country"/></td>			      
			                 
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"region")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
	                	<bean:message key="label.security.region"/></td>          
			      	<td>
			      		<integro:empty-if-null value="<%=regionName %>"/>&nbsp;
			      		<html:hidden name="GteBankSameForm" property="region"/></td>

			 		<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"state")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
			 			<bean:message key="label.security.state"/></td>          
			      	<td>
			      		<integro:empty-if-null value="<%=stateName %>"/>&nbsp;
			      		<html:hidden name="GteBankSameForm" property="state"/> </td>
			      	
			 </tr> 
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			     
			     <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"city")?"fieldname":"fieldnamediff"):"fieldname"%>"> 
			      	<bean:message key="label.security.city" /></td>          
			      <td>
			      	<integro:empty-if-null value="<%=cityName %>"/>&nbsp;
			      	<html:hidden name="GteBankSameForm" property="city"/></td>
			      	
		         <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"telephoneAreaCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
		         	<bean:message key="label.security.telephone.area.code"/></td>
			            <td><%=newCollateral.getTelephoneAreaCode() %>&nbsp;
			            </td>
			      
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
			            <td><integro:empty-if-null value="<%=newCollateral.getRating() %>"/>&nbsp;</td>
			               
			 </tr>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"recourse")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	<bean:message key="label.security.recourse" />
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getRecourse() %>"/>&nbsp;</td>
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetStatement")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Asset Statement
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getAssetStatement() %>"/>&nbsp;</td>	
			 </tr>
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantorType")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Guarantor Type
				 </td>
					<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_GUARANTOR_TYPE,newCollateral.getGuarantorType())%>"/>&nbsp;</td>
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"district")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	District
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getDistrict() %>"/>&nbsp;</td>	
			 </tr>
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"pinCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Pin Code
				 </td>
					<td><integro:empty-if-null value="<%=newCollateral.getPinCode() %>"/>&nbsp;</td>
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guarantorNature")?"fieldname":"fieldnamediff"):"fieldname"%>">
				 	Guarantor Nature
				 </td>
				 	<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_GUARANTOR_NATURE,newCollateral.getGuarantorNature())%>"/>&nbsp;</td>
			 </tr>
			 
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"discriptionOfAssets")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            	<bean:message key="label.security.discri.assets"/></td>
	            <td colspan="3">
	                <integro:wrapper value="<%=newCollateral.getDiscriptionOfAssets() %>"/>&nbsp; </td>
	        </tr>
				
            </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>
<br>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<jsp:include page="/collateral/guarantees/linedetail/list_line_detail.jsp">
	<jsp:param name="editMode" value="false"/>
	<jsp:param name="isProcess" value="<%=isProcess%>"/>
</jsp:include>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<tr>
		<td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
	</tr>	
	<%@ include file="/collateral/common/view_audit_details.jsp"%> 		
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
