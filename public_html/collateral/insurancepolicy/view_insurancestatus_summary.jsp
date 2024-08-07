<%@ page import="com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
				 com.integrosys.cms.ui.collateral.CollateralConstant,
				 com.integrosys.cms.ui.common.UIUtil, 
				 com.integrosys.cms.app.common.constant.ICMSConstant,   
				 java.util.List,                
				 java.util.Locale"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%  
	HashMap insuranceCoverageMap = new HashMap(); 
	if(prefix.equals("Asset")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageMap");
	}
	else if(prefix.equals("Other")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageMap");
	}
	else if(prefix.equals("Property")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageMap");
	}
    InsurerNameList insurerList = InsurerNameList.getInstance();
	String actionName = "";
	if("Othersa".equals(subtype)){
		actionName = "OthersInsurancePolicy";
	}else{
		actionName = subtype.startsWith(CollateralConstant.COL_ASSET)?"AssetInsurancePolicy":"PropertyInsurancePolicy";
	}
	rowIdx = 1; // reset odd-even row highlighting
	
	String getSubtypeCode = iCol.getCollateralSubType().getSubTypeCode();
	getSubtypeCode = (getSubtypeCode==null?"":getSubtypeCode);	
	
	System.out.println("actionName:"+actionName);
%>				 


<%@page import="java.util.HashMap"%><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
    <td> <h3><bean:message key="label.insurance.policies"/></h3></td>
    <td align="right" valign="baseline">&nbsp; </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
		<%
			String conversionCcy = SecuritySubTypeUtil.getConversionCcy(iCol);
			CurrencyCode ccy = new CurrencyCode(conversionCcy);
		%>      
          <thead>
            <tr>
         <!--  <td width="4%"><bean:message key="label.global.sn"/></td>
			<td width="15%"><bean:message key="label.insurance.policy.num"/> </td>
            <td width="20%"><bean:message key="label.insurer.name"/></td>
            <td width="19%"><bean:message key="label.insured.amt"/> </td>
            <td width="20%"><bean:message key="label.limit.expiry.date"/></td> -->
            
            <td width="5%">S/N</td>
 			<td width="15%">Status</td>
			<td width="10%">Due Date</td>  
 			<td width="15%">Insurance Policy No.</td>
 			<td width="15%">Insurance Company Name</td>
			<td width="10%">Insured Amount</td>
			<td width="10%">Expiry Date</td>                                                                    
			<td width="10%">Action</td>
            </tr>
          </thead>
          <tbody>
<% 
    if (isProcess) {
        List res = CompareOBUtil.compOBArray(newCollateral.getInsurancePolicies(),((oldCollateral==null)?null:oldCollateral.getInsurancePolicies()));                
        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        
        if (resultList == null || resultList.length == 0) {
%>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td colspan="7">
                    There is no insurance policies.
                    </td>
                    </tr>
<% 		} else { 
			for (int counter = 0; counter < resultList.length; counter++) { 
				IInsurancePolicy insurance = (IInsurancePolicy)resultList[counter].getObj();
       /*      String insrAmt = null;
                //Andy Wong: return same amt when both currency code same or conversion null
                if(StringUtils.isBlank(insurance.getConversionCurrency()) ||
                        StringUtils.equals(insurance.getCurrencyCode(), insurance.getConversionCurrency())){
                    insrAmt = insurance.getInsuredAmount().getAmountAsBigDecimal().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                } else  if(insurance.getInsuranceExchangeRate()!=null
                        && insurance.getInsuredAmount()!=null){
                    insrAmt = (new BigDecimal(insurance.getInsuranceExchangeRate().doubleValue())
                            .multiply(insurance.getInsuredAmount().getAmountAsBigDecimal())
                            .setScale(2, BigDecimal.ROUND_HALF_UP)).toString();
                }  */
                
%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="<%=resultList[counter].getKey()%>"><%=counter + 1%></td>
			<!--  <td><a href="<%=actionName%>.do?event=read&indexID=<%=insurance.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">
			  <integro:empty-if-null value="<%=insurance.getPolicyNo()%>"/></a>&nbsp;</td>
			  <td><integro:empty-if-null value="<%=insuranceCoverageMap.get(insurance.getInsurerName())%>"/>&nbsp;</td>
			  <td><integro:amount param="amount" decimal="2" amount="<%=insurance.getInsuredAmount()%>" /></td>			  
			  <td><integro:date object="<%=insurance.getExpiryDate()%>"/>&nbsp;</td>  --> 
			   <td>
                               <center>
                                <%if("UPDATE_RECEIVED".equals(insurance.getInsuranceStatus())){ %>
                                <integro:empty-if-null value="PENDING_RECEIVED" />
                                 <%}else if("AWAITING".equals(insurance.getInsuranceStatus())){ %>
                                <integro:empty-if-null value="PENDING" />
                                <%}else{ %>
                               <integro:empty-if-null value="<%=insurance.getInsuranceStatus()%>" />
                               <%} %>
                               </center>
                               </td>
                               <%	DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
                               		String dueDate1="";
                               		if(null!=insurance.getInsuranceStatus() && insurance.getInsuranceStatus().contains("DEFER")){
                               			if(null!=insurance.getNextDueDate()){
                               			dueDate1=df1.format(insurance.getNextDueDate());
                               			}
                               		}else if(null!=insurance.getInsuranceStatus() && insurance.getInsuranceStatus().contains("WAIVE")){
                               		
                               		}else if(null!=insurance.getOriginalTargetDate()){
                               		dueDate1=df1.format(insurance.getOriginalTargetDate());
                               		}
                               %>
                               <td>
                               <center><integro:empty-if-null value="<%=dueDate1%>" /></center>
                               </td>
                               <td>
                               <center><integro:empty-if-null
												value="<%=insurance.getPolicyNo()%>" /></center>
                               </td>
                               
                               <td>
                               <center><integro:empty-if-null
												value="<%=insuranceCoverageMap.get(insurance.getInsurerName())%>" /></center>
                               
                               </td>
                                <td>
                               <center><integro:amount param="amount" decimal="2" amount="<%=insurance.getInsuredAmount()%>" /></center>
                               
                               
                               </td>
                               <%DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
                               String effectiveDate =  "";
                               String expiryDate = "";
                               if(insurance.getEffectiveDate()!=null){
                               effectiveDate=df.format(insurance.getEffectiveDate());
                               }
                               if(insurance.getExpiryDate()!=null){
                               expiryDate=df.format(insurance.getExpiryDate());
                               }
                               
                           //    String insuranceStatus="";
                               System.out.println("insurance.getInsuranceStatus():"+insurance.getInsuranceStatus()); %>
                               <td>
                               <center><integro:empty-if-null
												value="<%=expiryDate%>" /></center>
                              
                              </td>
                               <td>
                               
                                           <%if("RECEIVED".equals(insurance.getInsuranceStatus()) || "PENDING_RECEIVED".equals(insurance.getInsuranceStatus()) || "UPDATE_RECEIVED".equals(insurance.getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_received&indexID=<%=insurance.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%}else if("DEFERRED".equals(insurance.getInsuranceStatus()) || "PENDING_DEFER".equals(insurance.getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_deferred&indexID=<%=insurance.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%}else if("WAIVED".equals(insurance.getInsuranceStatus()) || "PENDING_WAIVER".equals(insurance.getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_waived&indexID=<%=insurance.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%}else if("AWAITING".equals(insurance.getInsuranceStatus()) || "PENDING_UPDATE".equals(insurance.getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_pending&indexID=<%=insurance.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%} %>
                                         </td>   
            </tr>
				<%	
            }
		}
	} else {
        IInsurancePolicy[] insuranceArr = iCol.getInsurancePolicies();
        if (insuranceArr != null) {
            if (insuranceArr.length == 0) { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td colspan="7">
                    There is no insurance policies.
                    </td>
                    </tr>
			<%	} %>
				<% 	for (int counter = 0; counter < insuranceArr.length; counter++) {
                    String insrAmt = null;
                    //Andy Wong: return same amt when both currency code same or conversion null
         /*          if(StringUtils.isBlank(insuranceArr[counter].getConversionCurrency()) ||
                            StringUtils.equals(insuranceArr[counter].getCurrencyCode(), insuranceArr[counter].getConversionCurrency())){
                        insrAmt = insuranceArr[counter].getInsuredAmount().getAmountAsBigDecimal().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                    } else if(insuranceArr[counter].getInsuranceExchangeRate()!=null
                            && insuranceArr[counter].getInsuredAmount()!=null){
                        insrAmt = (new BigDecimal(insuranceArr[counter].getInsuranceExchangeRate().doubleValue())
                                .multiply(insuranceArr[counter].getInsuredAmount().getAmountAsBigDecimal())
                                .setScale(2, BigDecimal.ROUND_HALF_UP)).toString();
                    } */
                    
                %>
           
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=counter + 1%></td>
				<!--   <td><a href="<%=actionName%>.do?event=read&indexID=<%=insuranceArr[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">
					  <integro:empty-if-null value="<%=insuranceArr[counter].getPolicyNo()%>"/></a>&nbsp;</td>
					  <td><integro:empty-if-null value="<%=insuranceCoverageMap.get(insuranceArr[counter].getInsurerName())%>"/>&nbsp;</td>					  
					  <td><integro:amount param="amount" decimal="2" amount="<%=insuranceArr[counter].getInsuredAmount()%>" /></td>
					  <td><integro:date object="<%=insuranceArr[counter].getExpiryDate()%>"/>&nbsp;</td>
                    </tr> -->
                    
                    	   <td>
                               <center>
                                <%if("UPDATE_RECEIVED".equals(insuranceArr[counter].getInsuranceStatus())){ %>
                                <integro:empty-if-null value="PENDING_RECEIVED" />
                                 <%}else if("AWAITING".equals(insuranceArr[counter].getInsuranceStatus())){ %>
                                <integro:empty-if-null value="PENDING" />
                                <%}else{ %>
                               <integro:empty-if-null value="<%=insuranceArr[counter].getInsuranceStatus()%>" />
                               <%} %>
                               </center>
                               </td>
                               <%	DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
                               		String dueDate1="";
                               		if(null!=insuranceArr[counter].getInsuranceStatus() && insuranceArr[counter].getInsuranceStatus().contains("DEFER")){
                               			if(null!=insuranceArr[counter].getNextDueDate()){
                               			dueDate1=df1.format(insuranceArr[counter].getNextDueDate());
                               			}
                               		}else if(null!=insuranceArr[counter].getInsuranceStatus() && insuranceArr[counter].getInsuranceStatus().contains("WAIVE")){
                               		
                               		}else if(null!=insuranceArr[counter].getOriginalTargetDate()){
                               		dueDate1=df1.format(insuranceArr[counter].getOriginalTargetDate());
                               		}
                               %>
                               <td>
                               <center><integro:empty-if-null value="<%=dueDate1%>" /></center>
                               </td>
                               <td>
                               <center><integro:empty-if-null
												value="<%=insuranceArr[counter].getPolicyNo()%>" /></center>
                               </td>
                               
                               <td>
                               <center><integro:empty-if-null
												value="<%=insuranceCoverageMap.get(insuranceArr[counter].getInsurerName())%>" /></center>
                               
                               </td>
                                <td>
                               <center><integro:amount param="amount" decimal="2" amount="<%=insuranceArr[counter].getInsuredAmount()%>" /></center>
                               
                               
                               </td>
                               <%DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
                               String effectiveDate =  "";
                               String expiryDate = "";
                               if(insuranceArr[counter].getEffectiveDate()!=null){
                               effectiveDate=df.format(insuranceArr[counter].getEffectiveDate());
                               }
                               if(insuranceArr[counter].getExpiryDate()!=null){
                               expiryDate=df.format(insuranceArr[counter].getExpiryDate());
                               }
                               
                           //    String insuranceStatus="";
                               System.out.println("insuranceArr[counter].getInsuranceStatus():"+insuranceArr[counter].getInsuranceStatus()); %>
                               <td>
                               <center><integro:empty-if-null
												value="<%=expiryDate%>" /></center>
                              
                              </td>
                               <td>
                               
                                           <%if("RECEIVED".equals(insuranceArr[counter].getInsuranceStatus()) || "PENDING_RECEIVED".equals(insuranceArr[counter].getInsuranceStatus()) || "UPDATE_RECEIVED".equals(insuranceArr[counter].getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_received&indexID=<%=insuranceArr[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%}else if("DEFERRED".equals(insuranceArr[counter].getInsuranceStatus()) || "PENDING_DEFER".equals(insuranceArr[counter].getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_deferred&indexID=<%=insuranceArr[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%}else if("WAIVED".equals(insuranceArr[counter].getInsuranceStatus()) || "PENDING_WAIVER".equals(insuranceArr[counter].getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_waived&indexID=<%=insuranceArr[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%}else if("AWAITING".equals(insuranceArr[counter].getInsuranceStatus()) || "PENDING_UPDATE".equals(insuranceArr[counter].getInsuranceStatus())){ %>  
                                           <center> <a href="<%=actionName%>.do?event=checker_view_insurance_pending&indexID=<%=insuranceArr[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View </a></center>
                                           <%} %>
                                         </td> 
						<%	
	                }
                } else { %>
                    <tr class="odd">
                    <td colspan="7">
                    <bean:message key="label.insurance.policies.none"/>
                    </td>
                    </tr>
             <% }  } %>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
