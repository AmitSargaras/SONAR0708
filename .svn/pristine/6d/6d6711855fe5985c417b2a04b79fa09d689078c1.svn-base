<%@ page import="com.integrosys.base.businfra.currency.Amount,
								 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.ForexHelper,
                 com.integrosys.cms.app.custexposure.bus.*,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.util.SortUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 java.util.LinkedHashSet,
                 java.util.*"%>
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
* Purpose: group svc -- view customer limit exposure
* 
* @author $Grace Teh$<br>
* @version $Revision$
* Date: $30 July 2008$
* Tag: $Name$
*/
%>   
<%!
	//private String getStr(LinkedHashSet set) {
	//	String str = "";
	//	Iterator iterator = set.iterator(); 
	//	while(iterator.hasNext()) {
	//		String s = (String) iterator.next();
	//		if (!"".equals(str)) str += ", ";
	//		str += s;
	//	}
	//	return str;
	//}
	
%> 
<table width="98%" align="center" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
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
    ICustExposureEntityRelationship[] aIEntityRelationship =null;
    ICMSLegalEntity leEntity = null;
    String isiccd="-";
    String isicdesc="-";
    int t=0;
    int count=0;
    int s=0;
    int p=0;
    CurrencyCode groupBaseCurrCode;
    Amount total = null;

  if (custExposure!= null){
             if((startIndex + records_per_page)>custExposure.length){
	                 endIndex=custExposure.length;
	           }else{
				           endIndex = startIndex + records_per_page;
	           }
	           LinkedHashSet RelEntityName = new LinkedHashSet();
             //LinkedHashSet set = new LinkedHashSet();
					   for(int d=startIndex; d<endIndex; d++){

					     limitExposureProfiles = custExposure[d].getLimitExposureProfile();      
					     aIEntityRelationship = custExposure[d].getCustExposureEntityRelationship();
					     ICMSCustomer customers = custExposure[d].getCMSCustomer() ;

				        if(customers != null){
					          custName = customers.getCustomerName();
					          leEntity = customers.getCMSLegalEntity(); 
					          subProfileID = String.valueOf(customers.getCustomerID()); 

					          if(leEntity != null){
						        // businessSec=leEntity.getBusinessSector();
						         IISICCode isiccode[] = leEntity.getISICCode();
					            if(isiccode!=null && isiccode.length !=0) {
					                for (int i=0;i <isiccode.length;i++)
					                {
					                    if(isiccode[i].getISICType()!=null && isiccode[i].getISICType().equals("ISIC"))
					                    {
					                    if(isiccode[i].getISICCode()!=null)
					                        isicdesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ISIC_CODE, isiccode[i].getISICCode().toString() );
					                        isiccd = isiccode[i].getISICCode().toString();
					                   }
					
					                }
					            }
						         leRef=leEntity.getLEReference();
						         leSource=leEntity.getSourceID();
					         }
				        }
		             String rel = ""; 
		            // if (aIEntityRelationship != null && aIEntityRelationship.length > 0) {
                    //for (int counter = 0; counter < aIEntityRelationship.length; counter++) {
                    //    set.add(aIEntityRelationship[counter].getRelationName());
                    //}
                  //}	   
                        
%>  
		<tr>
		 <% String getCustName = custName.replaceAll("'","");%>
		  <td colspan="5" bgcolor="#CCCCCC"><strong><a href="javascript:fnViewCustExposure('<%=leRef%>','<%=subProfileID%>','<%=getCustName%>','<%=leSource%>','<%=grpID%>')"><integro:empty-if-null value="<%=custName%>"/></a>(<bean:message key="label.security.pledgor.le.id"/>:<integro:empty-if-null value="<%=leRef%>"/>) - <integro:empty-if-null value="<%=custExposure[d].getGroupMemberRelation()%>"/></strong> 
		  </td>
		  
		  <td bgcolor="#CCCCCC"><a href="javascript:fnViewCustBackSysExposure('<%=subProfileID%>')"><bean:message key="label.view.by.bank.entity"/></a></td>
		  <td colspan="2" bgcolor="#CCCCCC">Business Sector : <integro:empty-if-null value="<%=isicdesc%>"/></td>
		</tr>
		  
<%							
							int num = 0;
							double totalAppLimitAmt = 0;
						  double totalCMVAmt = 0;
						  double totalAdd = 0;

					    CurrencyCode baseCurrency = new CurrencyCode(CommonUtil.getBaseCurrency(user));
      
						 ILimitProfile limitProfile = null;
						    
						 if(limitExposureProfiles != null && limitExposureProfiles.length != 0){
						 
						    boolean limitExists = false;
						 
						 	for (int a = 0; a < limitExposureProfiles.length; a++ ) {
						 		limitProfile = limitExposureProfiles[a].getLimitProfile();						   	  	
									limits = limitProfile.getLimits();
									if (limits != null && limits.length != 0) {
								    	limitExists = true;
								}
						 	}
						 
						    for (int i = 0; i < limitExposureProfiles.length; i++ ) {
						   	  limitProfile = limitExposureProfiles[i].getLimitProfile();						   	  	
									limits = limitProfile.getLimits();
									if (limits != null && limits.length != 0) {

						        ForexHelper fr = new ForexHelper();
						        String sourceDesc = "";
						        String limitRef = "";		 
						        
										for (int j = 0; j < limits.length; j++) {
						           ILimit limitsObj = limits[j];
      
					             if(limits[j].getLimitType().equals(ICMSConstant.CCC_OUTER_LIMIT)) {						                   
						                 t++;
					             }
					            
						           if (limitsObj == null){
						                limitsObj = new OBLimit();
						            }
						            
						           limitRef = limitsObj.getLimitRef();
						                
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
						                    if(grpIdn.getGroupCurrency() != null && grpIdn.getGroupCurrency().trim().length() != 0){
							                        groupBaseCurrCode = new CurrencyCode(grpIdn.getGroupCurrency());
																	    totalAppLimitAmt += fr.convert(appLimitAmt, groupBaseCurrCode).getAmount();
						                    } else{
							                    if (appLimitAmt != null && appLimitAmt.getCurrencyCode() != null){
						                        totalAppLimitAmt += fr.convert(appLimitAmt, baseCurrency).getAmount();
						                       }
						                    }
						                    
						                } catch (Exception e) {
						                   // appLimitAmt = fr.getForexErrorAmount();
						                }
						            }

						            ICollateralAllocation[] collaterals = limitsObj.getCollateralAllocations();
						            String orgCode = "";
						            String secType = "";
						            String secSubType = "";
						            Amount cmv = null;
						            String omv = "";          
						            
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
							                     omv += "-" + "<br>";
						                     }
						                    
						                    if (cmv != null){
							                    System.out.println("convertion prepare cmv::");
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
        count=0;
        num++;
	    %>
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
<%}
%>
<!--end for loop-->

<%}} if (!limitExists) {
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
        <td valign="top" class="total" style="text-align:right;padding-right:3px">Sub Total</td>
        <td valign="top" class="total">&nbsp;</td>
        <td valign="top" class="total">&nbsp;</td>
        <td class="total"  style="text-align:right;padding-right:3px">
        <% if (grpIdn.getGroupCurrency() != null && grpIdn.getGroupCurrency().trim().length() != 0){%>
             <%=grpIdn.getGroupCurrency()%>&nbsp;
             <integro:amount amount="<%=new Amount(totalAppLimitAmt,grpIdn.getGroupCurrency())%>" param="amount" decimal="0"/></td>
        <%}else{%>
            <%=CommonUtil.getBaseCurrency()%>&nbsp;
            <integro:amount amount="<%=new Amount(totalAppLimitAmt,baseCurrency)%>" param="amount" decimal="0"/></td>
        <%}%>
        <td valign="top" class="total">&nbsp;</td>
        <td valign="top" class="total">&nbsp;</td>
        <td valign="top" class="total">&nbsp;</td>
    </tr>
<tr>
       <td colspan="8" bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
    </tr>
<%}
  if(startIndex == 0 && endIndex == 0){
%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td colspan="8"><bean:message key="label.global.not.found"/></td>
</tr>
<tr>
    <td colspan="8" bgcolor="#FFFFFF" style="border:0">&nbsp;</td>
</tr>
<%}}
%>



<script type="text/javascript">
<!--
   function fnViewCustBackSysExposure(subProfileID){
	             
               var frm = document.forms[0];
               frm.fromEvent.value = '';
               frm.event.value='<%=CustExposureAction.EVENT_VIEW_CUST_BACK_SYS_EXPOSURE%>';
               frm.action="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_BACK_SYS_EXPOSURE%>&sub_profile_id="+subProfileID;
               frm.submit();
  }
  
  function fnViewCustExposure(leRef,subProfileID,custName,leSource,grpID){
	             
               var frm = document.forms[0];
               frm.event.value='<%=CustExposureAction.EVENT_VIEW_CUST_EXPOSURE_FRM_GRP%>';
               frm.action="CustExposure.do?event=<%=CustExposureAction.EVENT_VIEW_CUST_EXPOSURE_FRM_GRP%>&cifNo="+leRef+"&sub_profile_id="+subProfileID+ "&cifSource="+ escape(leSource)+"&cifName="+custName +"&grpID="+grpID;
               frm.submit();
  }
-->
</script>

</tbody>
</table>





