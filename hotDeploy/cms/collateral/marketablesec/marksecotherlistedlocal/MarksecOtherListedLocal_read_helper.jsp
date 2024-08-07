<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.cms.app.collateral.bus.type.marketable.subtype.otherlistedlocal.IOtherListedLocal,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.marketablesec.NatureOfChargeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,java.text.DecimalFormat"%>
                 
                  <%@page import="com.integrosys.cms.app.feed.bus.stock.OBStockFeedEntry"%>
                 <%@page import="com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/marketablesec/marksecotherlistedlocal/MarksecOtherListedLocal_read_helper.jsp,v 1.44 2006/07/27 02:08:20 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Marketable Securities, Subtype - Portfolio others
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.44 $
* Date: $Date: 2006/07/27 02:08:20 $
* Tag: $Name:  $
*/
%>

<%
	DecimalFormat dft = new DecimalFormat("#0.00");
    IOtherListedLocal oldCollateral = (IOtherListedLocal) itrxValue.getCollateral();
    IOtherListedLocal newCollateral = (IOtherListedLocal) itrxValue.getStagingCollateral();
    String formName = "MarksecOtherListedLocalForm";
    String prefix = "Mark";
    String subtype = "MarksecOtherListedLocal";
    String formActionName = subtype+"Collateral.do";
    
    IStockFeedEntry obStockFeedEntry = null;
    
    List   StockList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.StockList");
    if(StockList!= null){
      	for(int i = 0; i< StockList.size() ; i++)
      	{
      		obStockFeedEntry = (OBStockFeedEntry)StockList.get(i);
      		String str = 	obStockFeedEntry.getScriptCode();	
  			String str1 = 	obStockFeedEntry.getStockExchangeName();	
      		String str2 = 	obStockFeedEntry.getScriptName();	
      	}
      }
    
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<!-- InstanceBeginEditable name="Content" -->
	
<%@page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Map"%><tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
			
			</tbody>
        </table></td>
    </tr>
    <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
	</tbody>
    <tr>
		<td colspan="2">&nbsp;</td>
    </tr>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<%--<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
    <tr>
		<td> <h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
	</thead>
    <tr>
		<td colspan="2">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
				<tbody>
		            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLE")?"fieldname":"fieldnamediff"):"fieldname"%>">
						  <bean:message key="label.security.legal.enforceability"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
						  <td width="30%"><% if (!(iCol== null)) { %>
						    <integro:empty-if-null value="<%=LEList.getInstance().getLEItem(iCol.getIsLE())%>"/>
						  <% } %> &nbsp;</td>
					
						<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lEDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
						  <bean:message key="label.security.legal.enforceability.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
						  <td width="30%">
						  <% if (!(iCol== null)){ %>
						  <integro:date object="<%=iCol.getLEDate()%>" /> <% } %>&nbsp;</td>
					</tr>
					<%@ include file="/collateral/common/common_fields_read.jsp" %>
					<%@ include file="../view_common_charge.jsp" %>
				</tbody>
			</table>		
		</td>
    </tr>
  </tbody>
</table>

--%><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.sec.details"/></h3></td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="2%"><bean:message key="label.global.sn"/></td>
              <td width="8%"><bean:message key="label.global.script.code"/></td>
               <td width="8%"><bean:message key="label.global.script.name"/></td>
              <%--<td width="24%"><bean:message key="label.security.issuer.name"/></td>
              --%><td width="5%"><bean:message key="label.marketsec.port.detail.noofunits"/></td>
              <%--<td width="10%"><bean:message key="label.predeal.unit.price"/> / <bean:message key="label.security.valuation.unit.price"/></td>
              --%>
              <td width="10%"><bean:message key="label.global.total.value"/></td>
              
              <td width="10%"><bean:message key="label.security.line"/></td>
			  <td width="10%"><bean:message key="label.security.serial"/></td>
			  <td width="10%"><bean:message key="label.security.fas.no"/></td>
			  <td width="5%"><bean:message key="label.security.ltv"/></td>
			  <td width="30%"><bean:message key="label.security.remarks"/></td>
			
              <td width="5%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>
            <%  String classtype = "odd";
                if (from_event.equals("process")) {
	            List res = CompareOBUtil.compOBArray(newCollateral.getEquityList(),((oldCollateral==null)?null:oldCollateral.getEquityList()));
                IMarketableEquity[] a1 = newCollateral.getEquityList();
                IMarketableEquity[] a2 = oldCollateral.getEquityList();
                ArrayList list = new ArrayList(res);
                pageContext.setAttribute("equity",list);
				System.out.println("res=>"+res.size());
                int counter = 0;
                    if (list == null || list.size() == 0) {
%>
                <tr class="odd">
                <td colspan="11"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

<% } %>
		<logic:present name="equity" >
		   <logic:iterate id="compResult" name="equity"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
           <%  IMarketableEquity marketEquity = (IMarketableEquity) compResult.getObj();
               classtype = "odd";
           %>
                    <tr class="<%=classtype%>">
                      <td class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td><%--
                      <td width="24%"><integro:empty-if-null value="<%=marketEquity.getIssuerName()%>"/>&nbsp;</td>
                      --%>
                      <td><integro:empty-if-null value="<%=marketEquity.getIsinCode()%>"/>&nbsp;</td>
                         <td>
                            <%
                      String str = "";
                      for(int i = 0; i< StockList.size() ; i++)
                  	{
                    	  String stockExch =marketEquity.getStockExchange();
                     	  boolean isStockExchangeOthers = false; 
                     	 if(stockExch.equals("001"))
                     	 {
                     		 stockExch = "BSE"; 
                     	 }else if(stockExch.equals("002"))
                     	 {
                     		 stockExch = "NSE"; 
                     	 }else if(stockExch.equals("003"))
                     	 {
                     		 stockExch = "Others"; 
                     		isStockExchangeOthers = true;
                     	 }else 
                     	 {
                     		 stockExch = "-"; 
                     	 }
                    	  
                  		obStockFeedEntry = (OBStockFeedEntry)StockList.get(i);
                  		if((obStockFeedEntry.getScriptCode().equals(marketEquity.getIsinCode())) && 
                  				(isStockExchangeOthers? (marketEquity.getStockExchange() != null && marketEquity.getStockExchange().equals(obStockFeedEntry.getGroupStockType())) : 
                  					obStockFeedEntry.getStockExchangeName().equals(stockExch)))
                  		{
                  			 str = 	obStockFeedEntry.getScriptName();	
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>
                        &nbsp; 
                         </td>
                         <td valign="right">
<!--Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->                         
                      <%=Double.valueOf(marketEquity.getNoOfUnits()).longValue()%>
                        </td>
                          <%long getNoOfUnits =Double.valueOf(marketEquity.getNoOfUnits()).longValue();
 //End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->                          
                        double amount = marketEquity.getValuationUnitPrice().getAmount();
                        double totalValue = (double)getNoOfUnits*amount;
                        %>
                          <td> <%=UIUtil.formatWithCommaAndDecimal(dft.format(totalValue)) %>&nbsp;</td>
                        <%--
                      <td width="20%">
                      <% if (marketEquity.getUnitPrice() != null && marketEquity.getUnitPrice().getCurrencyCode() != null) { %>
                      <integro:empty-if-null value="<%=marketEquity.getUnitPrice().getCurrencyCode()%>"/>&nbsp;<%=marketEquity.getUnitPrice().getAmount()%>
                      <% } %> &nbsp; /
                      <% 	if (marketEquity.getValuationUnitPrice() != null && marketEquity.getValuationUnitPrice().getCurrencyCode() != null) { %>
                          <integro:empty-if-null value="<%=marketEquity.getValuationUnitPrice().getCurrencyCode()%>"/>&nbsp;<%=marketEquity.getValuationUnitPrice().getAmount()%>
                      <% } %>&nbsp;
                          </td>
                      --%>
                      
                      <%
                      StringBuffer sbLine = new StringBuffer(); 
                      StringBuffer sbSerial = new StringBuffer();		  
                      StringBuffer sbFasNo = new StringBuffer();
                      StringBuffer sbLtv = new StringBuffer();
                      StringBuffer sbRemarks = new StringBuffer();
                      if(marketEquity.getLineDetails()!= null){
                      	for(IMarketableEquityLineDetail lineDetail : marketEquity.getLineDetails()){
                      		sbLine.append(lineDetail.getLineNumber()!=null? lineDetail.getLineNumber() :"-").append("<br>");
                      		sbSerial.append(lineDetail.getSerialNumber()!=null? lineDetail.getSerialNumber() :"-").append("<br>");
                      		sbFasNo.append(lineDetail.getFasNumber()!=null? lineDetail.getFasNumber() :"-").append("<br>");
                      		sbLtv.append(lineDetail.getLtv()!=null? lineDetail.getLtv() :"-").append("<br>");
                      		sbRemarks.append(lineDetail.getRemarks()!=null? lineDetail.getRemarks() :"-").append("<br>");
                          }
                      }
                      
                      %>
                      
                        <td><%=StringUtils.isBlank(sbLine.toString())? "-" : sbLine.toString()%></td>
						<td><%=StringUtils.isBlank(sbSerial.toString())? "-" : sbSerial.toString() %></td>
						<td><%=StringUtils.isBlank(sbFasNo.toString())? "-" : sbFasNo.toString() %></td>
						<td><%=StringUtils.isBlank(sbLtv.toString())? "-" : sbLtv.toString() %></td>
						<td><%=StringUtils.isBlank(sbRemarks.toString())? "-" : sbRemarks.toString() %></td>
                      
                      <td><a href="MarketPortItem.do?event=marksecotherlistedlocal_read&indexID=<%=marketEquity.getRefID()%>&subtype=MarksecOtherListedLocal&from_event=<%=from_event%>">View</a>
                      </td>
                    </tr>
					<%	if (classtype.equals("odd")) {
                        classtype = "even";
                    }
                    else {
                        classtype = "odd";
                    }
                        counter++;
%>
                    </logic:iterate>
                    </logic:present>
<%                } else {
	
                IMarketableEquity[] equity = iCol.getEquityList();
                 classtype = "odd";
                    if (equity != null) {
                        if (equity.length == 0) { %>
                <tr class="<%=classtype%>">
                <td colspan="11"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

				 <% } for (int counter = 0; counter < equity.length; counter++) {
                     if ( equity[counter] == null )
                         continue;
%>
                    <tr class="<%=classtype%>">
                      <td class="index"><%=counter + 1%></td><%--
                      <td width="24%"><integro:empty-if-null value="<%=equity[counter].getIssuerName()%>"/>&nbsp;</td>

                      --%>
                      <td><integro:empty-if-null value="<%=equity[counter].getIsinCode()%>"/>&nbsp;</td>
                      <td>
                      
                      <%
                      String str = "";
                      for(int i = 0; i< StockList.size() ; i++)
                  	{
                    	 String stockExch = equity[counter].getStockExchange();
                    	 boolean isStockExchangeOthers = false; 
                    	 
                    	 if(stockExch.equals("001"))
                    	 {
                    		 stockExch = "BSE"; 
                    	 }else if(stockExch.equals("002"))
                    	 {
                    		 stockExch = "NSE"; 
                    	 }else if(stockExch.equals("003"))
                    	 {
                    		 stockExch = "Others"; 
                    		 isStockExchangeOthers = true;
                    	 }else 
                    	 {
                    		 stockExch = "-"; 
                    	 }
                    	  obStockFeedEntry = (OBStockFeedEntry)StockList.get(i);
                  		if((obStockFeedEntry.getScriptCode().equals(equity[counter].getIsinCode())) && 
                  				(isStockExchangeOthers? (equity[counter].getStockExchange() != null && equity[counter].getStockExchange().equals(obStockFeedEntry.getGroupStockType())) : 
                  					obStockFeedEntry.getStockExchangeName().equals(stockExch)))
                  		{
                  			 str = 	obStockFeedEntry.getScriptName();	
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>
                      
                      &nbsp;
                      </td>
<%--
                      <td width="20%">
                      <% if (equity[counter].getUnitPrice() != null && equity[counter].getUnitPrice().getCurrencyCode() != null) { %>
                      <integro:empty-if-null value="<%=equity[counter].getUnitPriceCcyCode()%>"/>&nbsp;<%=equity[counter].getUnitPrice().getAmount()%>
                      <% } %> &nbsp; /
                      <% 	if (equity[counter].getValuationUnitPrice() != null && equity[counter].getValuationUnitPrice().getCurrencyCode() != null) { %>
                          <integro:empty-if-null value="<%=equity[counter].getValuationUnitPrice().getCurrencyCode()%>"/>&nbsp;<%=equity[counter].getValuationUnitPrice().getAmount()%>
                      <% } %>&nbsp;
                      </td>
                      --%>
                      <td valign="right">
<!--Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->                      
                      <%=Double.valueOf(equity[counter].getNoOfUnits()).longValue()%>&nbsp;
                        </td>
                        <%long getNoOfUnits =Double.valueOf(equity[counter].getNoOfUnits()).longValue();
// End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->                        
                        double amount = equity[counter].getValuationUnitPrice().getAmount();
                        double totalValue = (double)getNoOfUnits*amount;
                        %>
                          <td> <%=UIUtil.formatWithCommaAndDecimal(dft.format(totalValue)) %>&nbsp;</td>
                          
                          <%
                      StringBuffer sbLine = new StringBuffer(); 
                      StringBuffer sbSerial = new StringBuffer();		  
                      StringBuffer sbFasNo = new StringBuffer();
                      StringBuffer sbLtv = new StringBuffer();
                      StringBuffer sbRemarks = new StringBuffer();
                      if(equity[counter].getLineDetails()!= null){
                      	for(IMarketableEquityLineDetail lineDetail : equity[counter].getLineDetails()){
                      		sbLine.append(lineDetail.getLineNumber()!=null? lineDetail.getLineNumber() :"-").append("<br>");
                      		sbSerial.append(lineDetail.getSerialNumber()!=null? lineDetail.getSerialNumber() :"-").append("<br>");
                      		sbFasNo.append(lineDetail.getFasNumber()!=null? lineDetail.getFasNumber() :"-").append("<br>");
                      		sbLtv.append(lineDetail.getLtv()!=null? lineDetail.getLtv() :"-").append("<br>");
                      		sbRemarks.append(lineDetail.getRemarks()!=null? lineDetail.getRemarks() :"-").append("<br>");
                          }
                      }
                      
                      %>
                      
                       <td><%=StringUtils.isBlank(sbLine.toString())? "-" : sbLine.toString()%></td>
						<td><%=StringUtils.isBlank(sbSerial.toString())? "-" : sbSerial.toString() %></td>
						<td><%=StringUtils.isBlank(sbFasNo.toString())? "-" : sbFasNo.toString() %></td>
						<td><%=StringUtils.isBlank(sbLtv.toString())? "-" : sbLtv.toString() %></td>
						<td><%=StringUtils.isBlank(sbRemarks.toString())? "-" : sbRemarks.toString() %></td>
                               
                      <td><a href="MarketPortItem.do?event=marksecotherlistedlocal_read&indexID=<%=equity[counter].getRefID()%>&subtype=MarksecOtherListedLocal&from_event=<%=from_event%>">View</a>
                      </td>

                    </tr>
					<%	if (classtype.equals("odd")) {
                            classtype = "even";
                        } else {
                            classtype = "odd";
                        }
                    }
                } else { %>
                <tr class="<%=classtype%>">
                <td colspan="13"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

                <% } } %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<%--Commented As SRS (HDFC)
<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %> 


<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>
--%>
<br>
