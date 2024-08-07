<%@ page import="com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
				 com.integrosys.cms.ui.common.UIUtil,   
				 com.integrosys.cms.app.common.constant.ICMSConstant,              
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
	            <td width="4%"><bean:message key="label.global.sn"/></td>
				<td width="15%"><bean:message key="label.insurance.policy.num"/> </td>
	            <td width="20%"><bean:message key="label.insurer.name"/></td>
	            <td width="13%"><bean:message key="label.insured.amt"/> </td>
	            <td width="13%"><bean:message key="label.limit.expiry.date"/></td>
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
                        if(StringUtils.isBlank(insuranceArr[counter].getConversionCurrency()) ||
                                StringUtils.equals(insuranceArr[counter].getCurrencyCode(), insuranceArr[counter].getConversionCurrency())){
                            insrAmt = insuranceArr[counter].getInsuredAmount().getAmountAsBigDecimal().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                        } else if(insuranceArr[counter].getInsuranceExchangeRate()!=null
                                && insuranceArr[counter].getInsuredAmount()!=null){
                            insrAmt = (new BigDecimal(insuranceArr[counter].getInsuranceExchangeRate().doubleValue())
                                    .multiply(insuranceArr[counter].getInsuredAmount().getAmountAsBigDecimal())
                                    .setScale(2, BigDecimal.ROUND_HALF_UP)).toString();
                        }
                %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=counter + 1%></td>
					  <td><a href="javascript:submitPage(7, <%=counter%>)"><integro:empty-if-null value="<%=insuranceArr[counter].getPolicyNo()%>"/></a>&nbsp;</td>
					  <td><integro:empty-if-null value="<%=insuranceCoverageMap.get(insuranceArr[counter].getInsurerName())%>"/>&nbsp;</td>
					  <td class="amount"><integro:amount param="amount" decimal="2" amount="<%=insuranceArr[counter].getInsuredAmount()%>"/>&nbsp;</td>
					  <td><integro:date object="<%=insuranceArr[counter].getExpiryDate()%>"/>&nbsp; </td>
					  			  
                      <td><html:multibox property="deleteInsItem" value="<%=String.valueOf(counter)%>"/></td>
                    </tr>
						<%	
	                }
                } else { %>
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