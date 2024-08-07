<%@ page import="java.util.Locale,
				 java.util.List,
				 java.util.Arrays,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.base.businfra.currency.CurrencyManager,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitUIHelper,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitForm,                
                 com.integrosys.cms.app.creditriskparam.bus.countrylimit.ICountryLimit,
                 com.integrosys.cms.app.creditriskparam.bus.countrylimit.ICountryRating,
				 com.integrosys.cms.app.creditriskparam.trx.countrylimit.ICountryLimitTrxValue,
				 com.integrosys.cms.app.creditriskparam.trx.countrylimit.OBCountryLimitTrxValue"%>
				 
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>
<%
    CountryLimitUIHelper helper = new CountryLimitUIHelper();
%>
<tbody>
<bean:define id="formObj" name="CountryLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitForm"/>



<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
		<tr>
            <td align="right"><p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
        </tr>
        <tr>
            <td><h3><bean:message key="title.crp.countryLimit.process"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">	
					
	                    <thead>
	                        <tr>
	                            <td width="2%"><bean:message key="label.global.sno"/></td>
	                            <td width="18%"><bean:message key="label.country"/><font color="#0000FF">*</font></td>
	                            <td width="15%"><bean:message key="label.crp.countryLimit.country.rating"/><font color="#0000FF">*</font></td>  
	                            <td width="15%"><bean:message key="label.crp.countryLimit.country.limit"/></td>  
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <logic:present name="CountryLimitForm" property="deletedItemList" scope="request">
	                            <bean:define id="itemSize" value="<%= String.valueOf(formObj.getCountryLimitItemList().size()) %>"/>
	                            <logic:notEqual name="itemSize" value="0">
								 <logic:iterate id="itemObj" indexId="itemInd" name="CountryLimitForm" 
											property="countryLimitItemList" scope="request"
                                            type="java.lang.Object">	
											
	                                <% String headerClass = "index";
                                        ICountryLimit ctryLmtItem = null;
                                        if (itemObj instanceof CompareResult) {
                                            ctryLmtItem = (ICountryLimit) ((CompareResult) itemObj).getObj();
                                            headerClass = ((CompareResult) itemObj).getKey();
                                        } else {
                                            ctryLmtItem = (ICountryLimit) itemObj;
                                        } 
									%>
	                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                        <td class="<%=headerClass%>">
	                                            <%= itemInd.intValue() + 1 %>
	                                        </td>                                                           
	                                        <td>
	                                            &nbsp;<integro:wrapper value="<%=helper.getCountryDesc( ctryLmtItem.getCountryCode() )%>"/>
	                                        </td>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%=helper.getRatingDesc( ctryLmtItem.getCountryRatingCode() )%>"/>
	                                        </td>	
											<% if (ctryLmtItem.getCountryLimitAmount() != null && ctryLmtItem.getCountryLimitAmount().getCurrencyCode() != null)
											 {
										    %>	
											<td>
											    <integro:empty-if-null value="<%=ctryLmtItem.getCountryLimitAmount().getCurrencyCode()%>"/> &nbsp;
											    <integro:empty-if-null value="<%=CurrencyManager.convertToString(locale, ctryLmtItem.getCountryLimitAmount())%>"/>
											</td>
											<% } else { %>
											<td> &nbsp;</td>
											<% } %>	                                       
	                                    </tr>
	                                </logic:iterate>
	                            </logic:notEqual>
	                            <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                    <td colspan="8"><bean:message key="label.no.records.found"/></td>
	                                </tr>
	                            </logic:equal>
	                        </logic:present>               
	                    
					</tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
	
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <thead>
	        <tr>
	            <td><h3><bean:message key="title.crp.countryLimit.max.country.limit"/></h3></td>
	        </tr>
			 <tr>
	        <td colspan="2"><hr/></td>
	    </tr>
	    </thead>
	        <tr>
	            <td colspan="2">
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
	                    <thead>
	                        <tr>
	                            <td width="2%"><bean:message key="label.global.sno"/></td>
	                            <td width="18%"><bean:message key="label.crp.countryLimit.country.rating"/></td>
	                            <td width="15%"><bean:message key="label.crp.countryLimit.bank.capital.funds.percentage"/></td>  
	                            <td width="15%"><bean:message key="label.crp.countryLimit.preset.country.limit.percentage"/></td>  
	                        </tr>
	                    </thead>
	                    <tbody>
						
	                        <logic:present name="CountryLimitForm" property="countryRatingList" scope="request">
	                            <bean:define id="itemSize" value="<%= String.valueOf(formObj.getCountryRatingList().size()) %>"/>
	                            <logic:notEqual name="itemSize" value="0">
	                                <logic:iterate id="itemObj" indexId="itemInd" name="CountryLimitForm" 
												property="countryRatingList" scope="request"
	                                            type="java.lang.Object">
	                                    
	                                <% String headerClass = "index";
                                        ICountryRating item = null;
                                        if (itemObj instanceof CompareResult) {
                                            item = (ICountryRating) ((CompareResult) itemObj).getObj();
                                            headerClass = ((CompareResult) itemObj).getKey();
                                        } else {
                                            item = (ICountryRating) itemObj;
                                        } 
									%>
	                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                        <td class="<%=headerClass%>">
	                                            <%= itemInd.intValue() + 1 %>
	                                        </td>                                 
	                                        <td>
	                                            &nbsp;<integro:wrapper value="<%=helper.getRatingDesc( item.getCountryRatingCode() )%>"/>
	                                        </td>
											<% if (item.getBankCapFundPercentage() != null ) { %>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf( item.getBankCapFundPercentage().doubleValue() )%>"/>
	                                        </td>
											<% } else { %>
											<td> &nbsp;</td>
											<% } %>
											<% if (item.getPresetCtryLimitPercentage() != null ) { %>											
											 <td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf( item.getPresetCtryLimitPercentage().doubleValue() )%>"/>
	                                        </td>	
											<% } else { %>
	                                        <td> &nbsp;</td>
											<% } %>
	                                    </tr>
	                                </logic:iterate>
	                            </logic:notEqual>
	                            <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                    <td colspan="8"><bean:message key="label.no.records.found"/></td>
	                                </tr>
	                            </logic:equal>
	                        </logic:present>
	                        
	                    </tbody>
	                </table>
	            </td>
	        </tr>
	   
	</table>
    </tbody>


