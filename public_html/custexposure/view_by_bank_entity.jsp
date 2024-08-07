<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@ page import="com.integrosys.cms.ui.common.ForexHelper"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ICollateralAllocation"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICategoryEntryConstant"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: view by bank entity
* Description: view all records, which is related to bank entity 
*
* @author $GraceTeh$<br>
* @version $Revision$
* Date: $10/7/2008$
* Tag: $Name$
*/
%>
<%    
      Map sortedMap = new TreeMap(aa);
		  Set b = sortedMap.keySet();	
			Iterator kk  = b.iterator();
      ILimitExposureByBankEntity[] value = null;   
      limits =null;
      boolean entityType = false;
      String key = "";
      String type = "";

			while (kk.hasNext()){  
        key = (String)kk.next(); 
        value = (ILimitExposureByBankEntity[])sortedMap.get(key);       

%>
<tr>
    <td>
     </br>
		</td>  
</tr>
<tr>
    <td colspan="4">
						<h3><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.SUB_LIMIT_DESC_CATEGORY_CODE, key)%>"/></h3>
				<hr align="center" width="100%"></hr>
		</td>  
</tr>


<tr>
    <td colspan="4">
        <table align="center" width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td width="3%"><bean:message key="label.global.sno"/></td>
                    <td width="16%"><bean:message key="label.global.prd.desc"/></td>
                    <td width="12%"><bean:message key="label.global.limit.id"/></td>
                    <td width="12%"><bean:message key="label.global.outer.limit.id"/></td>
                    <td width="12%"><bean:message key="label.limit.approved.limit"/></td>
                    <td width="12%"><bean:message key="label.svc.outstanding.amt"/></td>
                    <td width="8%"><bean:message key="label.svc.disbursement"/></td>
                    <td width="13%"><bean:message key="label.svc.exposure"/></td>
                </tr>
            </thead>
            <tbody>
<%
CurrencyCode baseCurrency = new CurrencyCode(CommonUtil.getBaseCurrency(user));
ForexHelper fr = new ForexHelper();
int s=0;
int count=0;
int num =0;
double totalAppLimitAmt = 0;
Amount exposureAmount = null;

if(value !=null && value.length>0){
     for(int j=0; j<value.length; j++){
	                limits = value[j].getLimit(); 

	                //calculating total exposure
	                  exposureAmount = value[j].getExposureAmount(); 
	                  try { 
						           if (exposureAmount != null && exposureAmount.getCurrencyCode() != null){
						                   totalExposureAmt += fr.convert(exposureAmount, baseCurrency).getAmount(); 
				                }
					           } catch (Exception e) {
					                                   // totalExposureAmt = fr.getForexErrorAmount();
					           }

                 if(limits != null){
		                  
		                        String secType = "";
                            String secSubType = "";
                            double totalCMVAmt = 0;
                            String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_SOURCE_SYSTEM, (limits.getSourceId() == null) ? "" : limits.getSourceId());

                            String limitRef =
                                    ((limits.getLimitRef() == null) ? "" : limits.getLimitRef())
                                    + ((sourceDesc == null) ? "" : (" - " + sourceDesc));

                            boolean isSameBCA = limits.getIsInnerOuterSameBCA();
                            String outerLimitRef = limits.getOuterLimitRef();
                            if (outerLimitRef == null){
                                outerLimitRef = "0";
                                s++;
                              }

                            //Limit Status
                            String displayDel = "";
                            String limitStatus = limits.getLimitStatus();
                            if (ICMSConstant.STATE_DELETED.equals(limitStatus)){
                                displayDel = "Deleted";
                            }

                           // calculating  total Approved Limit Amount
                           Amount appLimitAmt = limits.getApprovedLimitAmount();
                           if ("0".equals(outerLimitRef) && limitStatus != null && !limitStatus.equals(ICMSConstant.STATE_DELETED)){
                               try {
                                   if (appLimitAmt != null && appLimitAmt.getCurrencyCode() != null){
                                       totalAppLimitAmt += fr.convert(appLimitAmt, baseCurrency).getAmount();
                                     }

                               } catch (Exception e) {
                                       appLimitAmt = fr.getForexErrorAmount();
                               }
                           }

                            // calculating  total Approved Limit Amount

                            Amount authorizedLimitAmt =limits.getApprovedLimitAmount();
                            try {
                                if (authorizedLimitAmt != null && authorizedLimitAmt.getCurrencyCode() != null){
                                    totalAuthorizedLimitAmt += fr.convert(authorizedLimitAmt, baseCurrency).getAmount();
                                }
                            } catch (Exception e) {
                                    //totalAuthorizedLimitAmt = fr.getForexErrorAmount();
                            }

                            // calculating  total Outstanding Amount
                            Amount outStandingAmt = limits.getOutstandingAmount();
                            if ("0".equals(outerLimitRef) && limitStatus != null && !limitStatus.equals(ICMSConstant.STATE_DELETED)){
	                            try {
	                                if (outStandingAmt != null && outStandingAmt.getCurrencyCode() != null){
	                                    totalOutstandingAmt += fr.convert(outStandingAmt, baseCurrency).getAmount();
	                                }
	                            } catch (Exception e) {
	                                   // totalOutstandingAmt = fr.getForexErrorAmount();
	                            }
                            }
                            
			                      String inB = "&nbsp;" ;
								            String outB = "&nbsp;" ;
								            if (limits.getOuterLimitRef() == null || limits.getOuterLimitRef().trim().equals("0") || "".equals(limits.getOuterLimitRef().trim())) {
								            }else{
								             inB = "(" ;
								             outB = ")" ;
								           }  
%>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                   <%if(outerLimitRef.equals("0")){
	                   num++;
	                   count=0;
	                   %>
                    <td class="index"><%=num%></td>
                   <%}else{
	                   if(outerLimitRef != null){
													count++;
									    }
	                  %>
                    <td class="index"><%=num%>.<%=count%></td>
                   <%}%>
                    <td><integro:empty-if-null value="<%=value[j].getProductDescription()%>"/></td>
                 
                    <td nowrap="nowrap">
                        <integro:empty-if-null value="<%=limitRef%>"/>
                        <font color="#FF0000" size="1"><%=displayDel%></font>
                    </td>

                        <% if ("0".equals(outerLimitRef)){ %>
                            <td>-&nbsp;</td>
                        <% } else if (isSameBCA){ %>
                            <td><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
                        <%} else { %>
                            <td class="outerlimit"><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
                        <% } %>

                        <% if (authorizedLimitAmt != null){ %>
                            <td class="amount">
                                <integro:currency amount="<%=appLimitAmt%>" param="currency"/>&nbsp;
                                <integro:empty-if-null value="<%=inB%>"/><integro:amount amount="<%=appLimitAmt%>" param="amount" decimal="0"/><integro:empty-if-null value="<%=outB%>"/>
                            </td>
                        <%} else { %>
                            <td class="amount">-&nbsp;</td>
                        <% } %>

                       <% if (outStandingAmt != null){ %>
                            <td class="amount">
                                <integro:currency amount="<%=outStandingAmt%>" param="currency"/>&nbsp;
                                <integro:empty-if-null value="<%=inB%>"/><integro:amount amount="<%=outStandingAmt%>" param="amount" decimal="0"/><integro:empty-if-null value="<%=outB%>"/>
                            </td>
                        <%} else { %>
                            <td class="amount">-&nbsp;</td>
                        <% } %>
                    
                   <td><integro:empty-if-null value="<%=value[j].getDisbursement()%>"/></td>
                   
                   <%if(exposureAmount != null){%>
                    <td class="amount">
                            <integro:currency amount="<%=exposureAmount%>" param="currency"/>&nbsp;
                            <integro:amount amount="<%=exposureAmount%>" param="amount" decimal="0"/>
                    </td>
                    <%} else {%>
                    <td class="amount" >-&nbsp;</td>
                    <%}%>
                 </tr>
                 <%}
                 }
                 %>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						        <td class="total" valign="top">&nbsp;</td>
						        <td valign="top" colspan="3" class="total" style="text-align:right;padding-right:3px"><bean:message key="label.common.total"/></td>
						        <td class="total"  style="text-align:right;padding-right:3px">
						            <%=CommonUtil.getBaseCurrency()%>&nbsp;
						            <integro:amount amount="<%=new Amount(totalAppLimitAmt,baseCurrency)%>" param="amount" decimal="0"/></td>
						        <td class="total" style="text-align:right;padding-right:3px">
						            <%=CommonUtil.getBaseCurrency()%>&nbsp;
						            <integro:amount amount="<%=new Amount(totalOutstandingAmt,baseCurrency)%>" param="amount" decimal="0"/></td>
						            <%totalOutstandingAmt = 0;%>
						        <td valign="top" class="total">&nbsp;</td>
						        <td class="total" style="text-align:right;padding-right:3px">
						            <%=CommonUtil.getBaseCurrency()%>&nbsp;
						            <integro:amount amount="<%=new Amount(totalExposureAmt,baseCurrency)%>" param="amount" decimal="0"/></td>
						            <% totalExposureAmt = 0;%>
						    </tr>  
                  <%                     
                     }else{
                  %>
                  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							        <td colspan="8"><bean:message key="label.global.not.found"/></td>
							    </tr>
							    <tr>
							       <td colspan="8" bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
							    </tr>
                  <%}%>
            </tbody>
        </table>
    </td>
</tr>
<%      
      }
%>



