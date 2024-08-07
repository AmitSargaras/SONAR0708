<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.ForexHelper,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.app.limit.bus.OBLimit"%>
<%@ page import="com.integrosys.cms.ui.common.UIUtil"%>

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
* Purpose: view customer limit exposure
* Description: view customer exposure's limit details
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
<thead>
    <tr>
        <td rowspan="2" width="3%"><bean:message key="label.global.sno"/></td>
        <td colspan="4"><bean:message key="label.svc.exposure"/></td>
        <td colspan="3"><bean:message key="label.svc.sec.col"/></td>
    </tr>
    <tr>
        <td width="18%"><bean:message key="label.global.prd.desc"/></td>
        <td width="13%"><bean:message key="label.global.limit.id"/></td>
        <td width="13%"><bean:message key="label.global.outer.limit.id"/></td>
        <td width="15%"><bean:message key="label.limit.approved.limit"/></td>
        <td width="13%" nowrap="nowrap"><bean:message key="label.security.type"/></td>
        <td width="13%" nowrap="nowrap"><bean:message key="label.security.sub.type"/></td>
        <td width="15%" nowrap="nowrap"><bean:message key="label.svc.omv.value"/></td>
    </tr>
</thead>
<tbody>

<%
    ILimitExposureProfile[] limitExposureProfiles = null;
    ILimit[] limits = null;
    int count = 0;
    int s = 0;
    int num = 0;
    double totalAppLimitAmt = 0;
    double totalCMVAmt = 0;
    CurrencyCode baseCurrency = new CurrencyCode(CommonUtil.getBaseCurrency(user));
    if (aICustExposure != null){
        limitExposureProfiles = aICustExposure.getLimitExposureProfile();
        DefaultLogger.debug(this, "@@@ILimitExposureProfile::::::::" + limitExposureProfiles);
    }  

    if(limitExposureProfiles != null && limitExposureProfiles.length != 0){
    ILimitProfile limitProfile = null;
    boolean limitExists = false;
    for (int i = 0; i < limitExposureProfiles.length; i++ ) {
   	  limitProfile = limitExposureProfiles[i].getLimitProfile();			
 	 
		  limits = limitProfile.getLimits();
		  
			//DefaultLogger.debug(this, "@@@Limits::::::::" + limits);
			if (limits != null && limits.length != 0) {
					limitExists = true;
	        ForexHelper fr = new ForexHelper();
	        String sourceDesc = "";
	        String limitRef = "";
        
				for (int j = 0; j < limits.length; j++) {
           ILimit limitsObj = limits[j];
           
           if (limitsObj == null){
                limitsObj = new OBLimit();
            }
            
           //limitRef = limitsObj.getLimitRef();
            sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_SOURCE_SYSTEM, (limitsObj.getSourceId() == null) ? "" : limitsObj.getSourceId());
            limitRef =((limitsObj.getLimitRef() == null) ? "" : limitsObj.getLimitRef())
                             + ((sourceDesc == null) ? "" : (" - " + sourceDesc));
                
            boolean isSameBCA = limitsObj.getIsInnerOuterSameBCA(); 
            String outerLimitRef = limitsObj.getOuterLimitRef();
            
            if (outerLimitRef == null){
                outerLimitRef = "0";
                s++;
            }
            
            String limitStatus = limitsObj.getLimitStatus();

            Amount appLimitAmt = limitsObj.getApprovedLimitAmount();
 
            if (outerLimitRef.equals("0") && limitStatus != null && !limitStatus.equals(ICMSConstant.STATE_DELETED)){
                try {
                    if (appLimitAmt != null && appLimitAmt.getCurrencyCode() != null){
                        totalAppLimitAmt += fr.convert(appLimitAmt, baseCurrency).getAmount();
                    }
                } catch (Exception e) {
                    appLimitAmt = fr.getForexErrorAmount();
                }
            }
            
            ICollateralAllocation[] collaterals = limitsObj.getCollateralAllocations();
            String orgCode = "";
            String secType = "";
            String secSubType = "";
            Amount cmv = null;
            String omv = "";          
            
            DefaultLogger.debug(this, "@@@collaterals::::::::" + limitsObj.getCollateralAllocations());
            
            if (collaterals != null){
                for (int x = 0; x < collaterals.length; x++) {								   
                    String type = collaterals[x].getCollateral().getCollateralType().getTypeName();
                    String subType = collaterals[x].getCollateral().getCollateralSubType().getSubTypeName(); 
                    
                    secType += type + "<br>"; 
                    secSubType += subType + "<br>"; 
                    cmv = collaterals[x].getCollateral().getCMV();
                    if(cmv !=null){
                         omv += UIUtil.formatAmount(cmv,0,locale)+ "<br>";
                     }else{
	                     omv += "-" + "<br>";;
                     }
                    
                    if (cmv != null){
                        totalCMVAmt += fr.convert(cmv, baseCurrency).getAmount();
                    }

                    if (collaterals[x].getCollateral().getSecurityOrganization() != null){
                        orgCode += CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, collaterals[x].getCollateral().getSecurityOrganization()) + "<br>";
                    }                   
                }              
            }
            
            if ("".equals(orgCode)){
                orgCode = null;
            }
            String displayDel = "";
            if (limitsObj.getLimitStatus() != null && limitsObj.getLimitStatus().equals(ICMSConstant.STATE_DELETED))
                displayDel = "Deleted";  
                
            String inB = "&nbsp;" ;
            String outB = "&nbsp;" ;
            if (limitsObj.getOuterLimitRef() == null || limitsObj.getOuterLimitRef().trim().equals("0") || "".equals(limitsObj.getOuterLimitRef().trim())) {
            }else{
             inB = "(" ;
             outB = ")" ;
           }                    
            
%>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
         <%if(outerLimitRef.equals("0")){
	         num++;
	         count=0;%>
        <td class="index"><%=num%></td>
        <%}else{
	        if(outerLimitRef != null){
							count++;
			     }
	       %>
        <td class="index"><%=num%>.<%=count%></td>
        <%}%>
        <td><integro:empty-if-null
                value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.FACILITY_DESCRIPTION,limitsObj.getSourceId(),null, limitsObj.getProductDesc())%>"/></td>
        <td nowrap="nowrap"><integro:empty-if-null value="<%=limitRef%>"/><font color="#FF0000" size="1"><%=displayDel%></font></td>

        <% if (outerLimitRef.equals("0")){ %>
        <td>-&nbsp;</td>
        <% } else if (isSameBCA){ %>
        <td><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
        <%} else { %>
        <td class="outerlimit"><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
        <% } %>
        <td class="amount">
        <% if (appLimitAmt != null && appLimitAmt.getCurrencyCode() != null ){
            System.out.println("appLimitAmt = " + appLimitAmt);%>
            <integro:currency amount="<%=appLimitAmt%>" param="currency"/>&nbsp;
            <integro:empty-if-null value="<%=inB%>"/><integro:amount amount="<%=appLimitAmt%>" param="amount" decimal="0"/><integro:empty-if-null value="<%=outB%>"/>      
        <%} else { %>
        -
        <% } %>
       &nbsp;</td>
       <%%>
        <td nowrap="nowrap"><integro:empty-if-null value="<%=secType%>"/>&nbsp;</td>
        <td nowrap="nowrap"><integro:empty-if-null value="<%=secSubType%>"/>&nbsp;</td>
        <td class="amount"><integro:empty-if-null value="<%=omv%>" />&nbsp;</td>
    </tr>
<% } %>
<!--end for loop-->
<% } 
}if (!limitExists) {
    System.out.println("No Limits Found");  
%>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td colspan="8"><bean:message key="label.global.not.found"/></td>
    </tr>
    
<% }} else{
	  System.out.println("No Limit Profiles Found");
	  %>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td colspan="8"><bean:message key="label.global.not.found"/></td>
 </tr>
<%}%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="total" valign="top">&nbsp;</td>
        <!--<td class="total">&nbsp;</td>-->
        <!--<td valign="top" class="total">&nbsp;</td>-->
        <td valign="top" colspan="3" class="total" style="text-align:right;padding-right:3px"><bean:message key="label.common.total"/></td>
        <td class="total"  style="text-align:right;padding-right:3px">
            <%=CommonUtil.getBaseCurrency()%>&nbsp;
            <integro:amount amount="<%=new Amount(totalAppLimitAmt,baseCurrency)%>" param="amount" decimal="0"/></td>
        <td valign="top" class="total">&nbsp;</td>
        <td valign="top" class="total">&nbsp;</td>
        <td valign="top" class="total">&nbsp;</td>
</tr>
</tbody>
</table>





