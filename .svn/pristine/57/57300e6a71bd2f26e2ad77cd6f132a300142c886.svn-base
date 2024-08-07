<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation" %>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    int rowIndex = 0; // reset even-odd row highlighting
    Locale localy = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    String conversion = SecuritySubTypeUtil.getConversionCcy(iCol);
    CurrencyCode curencycy = new CurrencyCode(conversion);
    String valuationFromLOSAction = "ValuationFromLOS";
    String securityType = subtype;
    boolean displayDateFSV = true;    // for MBB-1391 by jitu

        if (securityType !=  null && !"".equals(securityType)) {
            if (securityType.startsWith("Asset")){
                displayDateFSV = false;
                valuationFromLOSAction ="AssetValuationFromLOS";
            }else if (securityType.startsWith("Cash")){
                valuationFromLOSAction ="CashValuationFromLOS";
            }else if (securityType.startsWith("Gte")){
                valuationFromLOSAction ="GteValuationFromLOS";
            }else if (securityType.startsWith("Mark")){
                valuationFromLOSAction ="MarkValuationFromLOS";
            }else if (securityType.startsWith("Others")){
                valuationFromLOSAction ="OthersValuationFromLOS";
            }else if (securityType.startsWith("Prop")){
                displayDateFSV = false;
                valuationFromLOSAction ="PropValuationFromLOS";
            }else{
                valuationFromLOSAction ="ValuationFromLOS";
            }
        }

    IValuation[] iValuationArray = iCol.getValuationFromLOS();
        
            
%>

<input type="hidden" name="formActionName" value="<%=formActionName %>"/>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.valuation.from.los" /></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
                    <thead>
                        <tr>
                            <td width="5%"><bean:message key="label.global.sn"/> </td>
<%--                           
                            <td><span class="fieldname"><bean:message key="label.valuation.valuer" /></td>
--%>
                            <td><span class="fieldname"><bean:message key="label.valuation.omv.amount" /></td>
<!--                             <%if (!displayDateFSV){ %>
                              <td><span class="fieldname"><bean:message key="label.valuation.fsv.amount"/> </td>
                            <% } %>-->
                            <td><span class="fieldname"><bean:message key="label.valuation.date.omv" /></td>
                            <td><span class="fieldname"><bean:message key="label.valuation.date.received" /></td>
<!--                            <%if (displayDateFSV){ %>
                            <td><span class="fieldname"><bean:message key="label.valuation.date.of.fsv"/> </td>
                           <% } %>-->
                            <td><span class="fieldname"><bean:message key="label.global.action" /> </td>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (iValuationArray == null || iValuationArray.length == 0) { %>
                        <tr class="even">
                            <td colspan="7">
                                <bean:message key="label.no.records.found" />
                            </td>
                        </tr>
                        <% } else {
                            for (int counter = 0; counter < iValuationArray.length; counter++) {
                                IValuation valuation = (IValuation) iValuationArray[counter];
                        %>
                        <tr class="<%=(rowIndex++)%2==0?"even":"odd"%>">
                            <td class="index"><%=counter + 1%></td>
 <%--                           
                            <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUER,valuation.getValuerName())%>"/>&nbsp;</td>
 --%>                           
                            <td class="amount">
                                <% if (valuation.getCMV() !=  null && valuation.getCMV().getAmount() > 0 ){ %>
                                    <integro:amount param="amount" amount="<%=valuation.getCMV()%>" decimal="2"/>
                                <% }  %>
                                &nbsp; </td>

<!--                            <%if (!displayDateFSV){ %>
                             <td class="amount">
                               <% if (valuation.getFSV() !=  null && valuation.getFSV().getAmount() > 0 ){ %>
                                    <integro:amount param="amount" amount="<%=valuation.getFSV()%>" decimal="2"/>
                                <% }  %>
                                &nbsp;</td>
                            <% } %>-->

                            <td><integro:date object="<%=valuation.getValuationDate()%>"/>&nbsp;</td>
                            <td><integro:date object="<%=valuation.getUpdateDate()%>"/>&nbsp;</td>
<!--                            <%if (displayDateFSV){ %>
                            <td><integro:date object="<%=valuation.getEvaluationDateFSV()%>"/>&nbsp;</td>
                            <% } %>-->
                            
                        <%
                             boolean isUpdateReturn = false;
                            // boolean isProcessReturn = false;
						     String forward_event1 = (String)request.getParameter("event");
						     if (CollateralAction.EVENT_PREPARE_UPDATE.equals(forward_event1)
						     	 ||CollateralAction.EVENT_UPDATE_RETURN.equals(forward_event1)
						     	 ||CollateralAction.EVENT_PROCESS_UPDATE.equals(forward_event1)) 
						     {
						        from_event = "update_read_valuation_from_los";
						        isUpdateReturn = true;
						     }
						    /* if(CollateralAction.EVENT_PROCESS_RETURN.equals(forward_event1)){
						     
							     	 isProcessReturn = true;
						     		from_event = "view_valuation_from_los";
					     	}*/
						     
                            	if(isUpdateReturn){
                         %>
                         
                            <td>
                            <a href="#" onclick="javascript:submitPage(9, '<%=valuation.getValuationID()%>')"><bean:message key="label.view"/></a>
                            </td>                
							<%}else{%>
							<td>
							<a href="<%=formActionName%>?formActionName=<%=formActionName%>&indexID=<%=valuation.getValuationID()%>&event=view_valuation_from_los&from_page=<%=from_event%>"><bean:message key="label.view"/></a>       
                            </td>
                           <%}%>
                          
                        </tr>
                        <% } }%>
                    </tbody>
<!--                    <tbody>
                    <% if (iValuationArray == null || iValuationArray.length == 0) { %>
                        <tr class="even">
                            <td colspan="7">
                                <bean:message key="label.no.records.found" />
                            </td>
                        </tr
	                      <tr class="even">
					                <td width="20%" class="fieldname"><bean:message key="label.valuation.date" /></td>
					                <td width="28%">-&nbsp;</td>
					                <td class="fieldname"><bean:message key="label.valuation.date.received"/> </td>
							            <td>-&nbsp;</td>
				          			</tr>
							          <tr class="odd">
							                <td width="20%" class="fieldname"><bean:message key="label.valuation.omv.amount" /></td>
							                <td width="28%">-
							                    &nbsp; </td>
							               <%if (!displayDateFSV){ %>     
							                 <td class="fieldname"><bean:message key="label.valuation.fsv.amount"/> </td>
							                 <td >-
							                    &nbsp; </td>
							                <%}else{%>
							                	<td class="fieldname"> &nbsp; </td>
							                  <td >&nbsp; </td> 	
							                <% } %>    
							          </tr>
							          <tr class="even">
							          			<td width="20%"  class="fieldname"><bean:message key="label.valuation.currency" /></td>
							                <td width="28%">-&nbsp;</td>
							                <td class="fieldname"> &nbsp; </td>
							                <td >&nbsp; </td>    
							          </tr>
							          <tr class="odd">
							          			<td width="20%" class="fieldname"><bean:message key="label.valuation.valuer" /></td>
					                		<td width="28%">-&nbsp;</td>
					                		<td class="fieldname"><bean:message key="label.valuation.type" /></td>
							                <td>-
							                   &nbsp;</td> 
							          </tr>
                        <% } else {
                            for (int counter = 0; counter < iValuationArray.length; counter++) {
                                IValuation valuation = (IValuation) iValuationArray[counter];
                        %> 
                      <tr>
                       <td width="3%" class="index" rowspan=5><%=counter + 1%></td>
                      </tr>
                    	<tr class="even">
				                <td width="20%" class="fieldname"><bean:message key="label.valuation.date" /></td>
				                <td width="28%"><integro:date object="<%=valuation.getValuationDate()%>" />&nbsp;</td>
				                <td class="fieldname"><bean:message key="label.valuation.date.received"/> </td>
						            <td><integro:date object="<%=valuation.getUpdateDate()%>"/> &nbsp;</td>
			          			</tr>
						          <tr class="odd">
						                <td width="20%" class="fieldname"><bean:message key="label.valuation.omv.amount" /></td>
						                <td width="28%">
						                    <% if (valuation.getCMV() !=  null && valuation.getCMV().getAmount() > 0 ){ %>
						                        <integro:amount param="amount" amount="<%=valuation.getCMV()%>" decimal="2"/>
						                    <% }  %>
						                    &nbsp; </td>
						               <%if (!displayDateFSV){ %>     
						                 <td class="fieldname"><bean:message key="label.valuation.fsv.amount"/> </td>
						                 <td >
						                 <% if (valuation.getFSV() !=  null && valuation.getFSV().getAmount() > 0 ){ %>
						                        <integro:amount param="amount" amount="<%=valuation.getFSV()%>" decimal="2"/>
						                    <% }  %>
						                    &nbsp; </td>
						                <%}else{%>
							                	<td class="fieldname"> &nbsp; </td>
							                  <td >&nbsp; </td> 	
							                <% } %>     
						          </tr>
						          <tr class="even">
						          			<td width="20%"  class="fieldname"><bean:message key="label.valuation.currency" /></td>
						                <td width="28%"><integro:empty-if-null value="<%=valuation.getCurrencyCode()%>"/>&nbsp;</td>
						                <td class="fieldname"> &nbsp; </td>
						                <td >&nbsp; </td>    
						          </tr>
						          <tr class="odd">
						          			<td width="20%" class="fieldname"><bean:message key="label.valuation.valuer" /></td>
				                		<td width="28%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUER, valuation.getValuerName())%>"/>&nbsp;</td>
				                		<td class="fieldname"><bean:message key="label.valuation.type" /></td>
						                <td>
						                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.VALUATION_TYPE, valuation.getValuationType())%>"/>
						                   &nbsp;</td> 
						          </tr>
						           <% } }%>
                    </tbody>-->
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>

