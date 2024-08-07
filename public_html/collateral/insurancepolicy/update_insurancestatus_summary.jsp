<%@ page import="com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
				 com.integrosys.cms.ui.common.UIUtil,   
				 com.integrosys.cms.app.common.constant.ICMSConstant,              
				 java.util.Locale"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<script language="JavaScript" type="text/JavaScript">
function editInsuranceDetail(obj,counter) {
	var event;
	var actionType = obj.value;
	enableAllFormElements();
	
	//alert("actionType:"+actionType);
	if('UPDATE_RECEIVED' == actionType){
		event="maker_update_insurance_received";
	}else if('VIEW_RECEIVED' == actionType){
		event="maker_view_insurance_received";
	}else if('DEFER' == actionType){
		event="maker_update_insurance_deferred";
	}else if('VIEW_DEFERRED' == actionType){
		event="maker_view_insurance_deferred";
		
	}else if('WAIVER' == actionType){
		event="maker_update_insurance_waived";
		
	}else if('VIEW_WAIVED' == actionType){
		event="maker_view_insurance_waived";
		
	}else if('UPDATE' == actionType){
		event="maker_update_insurance_pending";
		 
	}else if('VIEW_AWAITING' == actionType){
		event="maker_view_insurance_pending";
		
	}if('RECEIVE' == actionType){
		event="maker_edit_insurance_received";
		
		}

	document.forms[0].event.value = event;
	 document.forms[0].indexID.value = counter;
	// alert("counter 2:"+counter);	
     document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    // alert("event 3:"+event);	
    var prefix1 = "<%=prefix%>";
    
   
    
    document.forms[0].submit();

    return action;
}	
</script>
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
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);	        
	rowIdx = 0; // reset odd-even row highlighting
	
	String getSubtypeCode = iCol.getCollateralSubType().getSubTypeCode();
	getSubtypeCode = (getSubtypeCode==null?"":getSubtypeCode);
%>				 

<%@page import="java.util.HashMap"%><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
    <td> <h3><bean:message key="label.insurance.policies"/></h3></td>
    <td align="right" valign="baseline">
    <% if (!isSSC) { %>
    <input class="btnNormal" type="button" name="Submit2222" value="Add New" onclick="javascript:submitPage(6, -1)"/>
    &nbsp; <input name="Submit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(8, 0)"/>
    <% } %>
    </td>
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
	         <!-- <td width="4%"><bean:message key="label.global.sn"/></td>
				<td width="15%"><bean:message key="label.insurance.policy.num"/> </td>
	            <td width="20%"><bean:message key="label.insurer.name"/></td>
	            <td width="13%"><bean:message key="label.insured.amt"/> </td>
	            <td width="13%"><bean:message key="label.limit.expiry.date"/></td>
	            <td width="10%"><bean:message key="label.remove"/></td>  -->   
	            
	       	<td width="5%">S/N</td>
 			<td width="15%">Status</td>
			<td width="10%">Due Date</td>  
 			<td width="15%">Insurance Policy No.</td>
 			<td width="15%">Insurance Company Name</td>
			<td width="10%">Insured Amount</td>
			<td width="10%">Expiry Date</td>                                                                    
			<td width="10%">Action</td>
			<td width="10%"><bean:message key="label.remove"/></td>
            </tr>
          </thead>
          <tbody>
            <%
                IInsurancePolicy[] insuranceArr = iCol.getInsurancePolicies();
                if (insuranceArr != null) {
                    if (insuranceArr.length == 0) { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	                    <td colspan="8">
	                    There is no insurance policies.
	                    </td>
                    </tr>
			<%	} %>
				<% 	for (int counter = 0; counter < insuranceArr.length; counter++) {
                        String insrAmt = null;
                        //Andy Wong: return same amt when both currency code same or conversion null
            /*            if(StringUtils.isBlank(insuranceArr[counter].getConversionCurrency()) ||
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
				<!--   <td><a href="javascript:submitPage(7, <%=counter%>)"><integro:empty-if-null value="<%=insuranceArr[counter].getPolicyNo()%>"/></a>&nbsp;</td>
					  <td><integro:empty-if-null value="<%=insuranceCoverageMap.get(insuranceArr[counter].getInsurerName())%>"/>&nbsp;</td>
					  <td class="amount"><integro:amount param="amount" decimal="2" amount="<%=insuranceArr[counter].getInsuredAmount()%>"/>&nbsp;</td>
					  <td><integro:date object="<%=insuranceArr[counter].getExpiryDate()%>"/>&nbsp; </td>
					  			  
                      <td><html:multibox property="deleteInsItem" value="<%=String.valueOf(counter)%>"/></td>  -->	
                      
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
                               <%
                               String effectiveDate =  "";
                               String expiryDate = "";
                               if(insuranceArr[counter].getEffectiveDate()!=null){
                               effectiveDate=df1.format(insuranceArr[counter].getEffectiveDate());
                               }
                               if(insuranceArr[counter].getExpiryDate()!=null){
                               expiryDate=df1.format(insuranceArr[counter].getExpiryDate());
                               }
                               
                           //    String insuranceStatus="";
                               System.out.println("insuranceArr[counter].getInsuranceStatus():"+insuranceArr[counter].getInsuranceStatus()); 
                               
                               System.out.println("counter:"+counter);
                               String tempStr= "editInsuranceDetail(this,'"+counter+"')";
                               %>
                               <td>
                               <center><integro:empty-if-null
												value="<%=expiryDate%>" /></center>
                              
                              </td>
                               <td>
                               	
									
									<%-- <html:select property="actionType" onchange="editInsuranceDetail(this,'<%=counter%>')" >  --%>
									<html:select property="actionType" onchange='<%=tempStr%>' >
                					<option value="" >Please Select </option>
								<%	if("AWAITING".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="RECEIVE" >RECEIVED</option>
				<option value="UPDATE" >UPDATE</option>
				<option value="DEFER" >DEFERRED</option>
				<option value="WAIVER" >WAIVED</option>
				<%}if("RECEIVED".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus()) || "UPDATE_RECEIVED".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>
				<option value="VIEW_RECEIVED" >VIEW</option>				
				<option value="UPDATE_RECEIVED" >UPDATE</option>	
				<%}if("DEFERRED".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>
				<option value="VIEW_DEFERRED" >VIEW</option>
				<option value="RECEIVE" >RECEIVED</option>				
				<option value="DEFER" >DEFERRED</option>
				<option value="WAIVER" >WAIVED</option>
				
				<%}if("WAIVED".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>
				<option value="VIEW_WAIVED" >VIEW</option>	
				<%}if("PENDING_UPDATE".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>		
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="UPDATE" >UPDATE</option>
			
				<%}if("PENDING_RECEIVED".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>
				<option value="VIEW_RECEIVED" >VIEW</option>
				<option value="RECEIVE" >UPDATE</option>
					
				<%}if("PENDING_DEFER".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>	
				<option value="VIEW_DEFERRED" >VIEW</option>
				<option value="DEFER" >UPDATE</option>
				
				<%}if("PENDING_WAIVER".equalsIgnoreCase(insuranceArr[counter].getInsuranceStatus())){%>
				<option value="VIEW_WAIVED" >VIEW</option>
				<option value="WAIVER" >UPDATE</option>
				<%}%></html:select>
                                         
                                      <td><html:multibox property="deleteInsItem" value="<%=String.valueOf(counter)%>"/></td>    
                                         </td> 
                    </tr>
						<%	
	                }
                }else { %>
                    <tr class="odd">
                    <td colspan="8">
                    <bean:message key="label.insurance.policies.none"/>
                    </td>
                    </tr>
             <% } %>
          </tbody>
        </table></td>
    </tr>
	<tr><td><html:errors property="insPolicyErr"/>
  </tbody>
</table>