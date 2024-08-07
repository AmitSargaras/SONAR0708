<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.cms.app.collateral.bus.type.marketable.subtype.mainindexlocal.IMainIndexLocal,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.marketablesec.NatureOfChargeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 java.text.DecimalFormat"%>
                  <%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.OBMutualFundsFeedEntry"%>
                 <%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/marketablesec/marksecmainlocal/MarksecMainLocal_read_helper.jsp,v 1.44 2006/07/27 02:06:00 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Marketable Securities, Subtype - Portfolio others
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.44 $
* Date: $Date: 2006/07/27 02:06:00 $
* Tag: $Name:  $
*/
%>

<%
    IMainIndexLocal oldCollateral = (IMainIndexLocal) itrxValue.getCollateral();
    IMainIndexLocal newCollateral = (IMainIndexLocal) itrxValue.getStagingCollateral();
    String formName = "MarksecMainLocalForm";
    String prefix = "Mark";
    String subtype = "MarksecMainLocal";
    String formActionName = subtype+"Collateral.do";
    java.text.DecimalFormat dft = new java.text.DecimalFormat("#0.00");
    IMutualFundsFeedEntry obMutualFundsEntry = null;
    
    List   FundList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.FundList");
      if(FundList!= null){
      	for(int i = 0; i< FundList.size() ; i++)
      	{
      		obMutualFundsEntry = (OBMutualFundsFeedEntry)FundList.get(i);
      		String str = 	obMutualFundsEntry.getSchemeName();	
      	}
    			
    		 
      }
      
  	DecimalFormat df = new DecimalFormat("##.####");
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<!-- InstanceBeginEditable name="Content" -->
	
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry"%><tbody>
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
				    	 <td width="30%">
							<% if (!(iCol== null)) { %>
								<integro:empty-if-null value="<%=LEList.getInstance().getLEItem(iCol.getIsLE())%>"/>
							<% } %> &nbsp;</td>
					    <td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lEDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
						<bean:message key="label.security.legal.enforceability.date"/></td>
						<td width="30%">
							<% if (iCol!= null && iCol.getLEDate()!= null) { %>
								<integro:date object="<%=iCol.getLEDate()%>"></integro:date>
							<% } %> &nbsp;</td>
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
							<bean:message key="label.security.asset.cgc.pledged"/></td>
						<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
						<td class="fieldname">&nbsp;</td>
						<td>&nbsp;</td>
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
              <td width="7%"><bean:message key="label.global.scheme.Code"/></td>
              <td width="7%"><bean:message key="label.global.scheme.name"/></td>
              <td width="6%"><bean:message key="label.marketsec.port.detail.noofunits"/></td>
              <td width="7%"><bean:message key="label.predeal.unit.price"/></td>
              <td width="10%"><bean:message key="label.global.total"/></td>
              <td width="10%"><bean:message key="label.security.line"/></td>
			<td width="10%"><bean:message key="label.security.serial"/></td>
			<td width="10%"><bean:message key="label.security.fas.no"/></td>
			<td width="5%"><bean:message key="label.security.ltv"/></td>
			<td width="30%"><bean:message key="label.security.remarks"/></td>
              <td width="5%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>
            <%  String classtype1 = "odd";
                if (from_event.equals("process")) {
                List res  =  CompareOBUtil.compOBArray(newCollateral.getEquityList(),((oldCollateral==null)?null:oldCollateral.getEquityList()));
                ArrayList list = new ArrayList(res);
                pageContext.setAttribute("equity",list);
                int counter = 0;
                    if (list == null || list.size() == 0) {
%>                     <tr class="<%=classtype1%>">
                <td colspan="12"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

<% } %>
		<logic:present name="equity" >
		   <logic:iterate id="compResult" name="equity"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
           <%  IMarketableEquity marketEquity = (IMarketableEquity) compResult.getObj();
               classtype1 = "odd";
           %>
                    <tr class="<%=classtype1%>">
                      <td class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
                      <td><integro:empty-if-null value="<%=marketEquity.getStockCode()%>"/></td>
                      <td>
                      <%
                      String str = "";
                      for(int i = 0; i< FundList.size() ; i++)
                  	{
                  		obMutualFundsEntry = (OBMutualFundsFeedEntry)FundList.get(i);
                  		if(obMutualFundsEntry.getSchemeCode().equals(marketEquity.getStockCode()))
                  		{
                  			 str = 	obMutualFundsEntry.getSchemeName();		
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>
                      &nbsp;</td>
                      <td valign="right">
                      <!-- <%=marketEquity.getNoOfUnits()%>  -->
                      <!-- Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
                      <%=df.format(marketEquity.getNoOfUnits())%>
                      <!-- End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
                        </td>
                      <td>
                      <% if (marketEquity.getNominalValue() != null) { %>
                      	<%=UIUtil.formatWithCommaAndDecimal(String.valueOf(marketEquity.getNominalValue().getAmount()))%>
                      <% } %> &nbsp;
                      </td>
                    <!--  <td width="23%" valign="right"><%=dft.format(marketEquity.getNoOfUnits() * marketEquity.getNominalValue().getAmount())%>&nbsp;</td>  -->
                    <!-- Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. --> 
                      <td valign="right"><%=UIUtil.formatWithCommaAndDecimal(df.format(marketEquity.getNoOfUnits() * marketEquity.getNominalValue().getAmount()))%>&nbsp;</td>
                      <!-- End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->

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
						
                      <td><a href="MarketPortItem.do?event=marksecmainlocal_read&indexID=<%=marketEquity.getRefID()%>&subtype=MarksecMainLocal&from_event=<%=from_event%>">View</a>
                      </td>
                    </tr>
					<%	if (classtype1.equals("odd")) {
                        classtype1 = "even";
                    }
                    else {
                        classtype1 = "odd";
                    }
                        counter++;
%>
                    </logic:iterate>
                    </logic:present>
<%                } else {
                IMarketableEquity[] equity = iCol.getEquityList();
                 classtype1 = "odd";
                    if (equity != null) {
                        if (equity.length == 0) { %>
                <tr class="<%=classtype1%>">
                <td colspan="12"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

				 <% } for (int counter = 0; counter < equity.length; counter++) {
                     if ( equity[counter] == null )
                         continue;
%>
                    <tr class="<%=classtype1%>">
                      <td class="index"><%=counter + 1%></td>
                      <td><integro:empty-if-null value="<%=equity[counter].getStockCode()%>"/>&nbsp;</td>
                      <td>
                       <%
                      String str = "";
                      for(int i = 0; i< FundList.size() ; i++)
                  	{
                  		obMutualFundsEntry = (OBMutualFundsFeedEntry)FundList.get(i);
                  		if(obMutualFundsEntry.getSchemeCode().equals(equity[counter].getStockCode()))
                  		{
                  			 str = 	obMutualFundsEntry.getSchemeName();		
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>
                      &nbsp;</td>

                      <td valign="right">
                     <!-- <%=equity[counter].getNoOfUnits()%>  --> 
                     <!-- Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
                       <%= df.format(equity[counter].getNoOfUnits())%>
                       <!-- End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
                        </td>
                      <td>
                      
                      <% 	if (equity[counter].getNominalValue() != null ) { %>
								<%=UIUtil.formatWithCommaAndDecimal(String.valueOf(equity[counter].getNominalValue().getAmount()))%>
							<% } %>
                      </td>
                       <!--  <td width="23%" valign="right"><%=dft.format(equity[counter].getNoOfUnits() * equity[counter].getNominalValue().getAmount()) %>&nbsp;  -->
                       <!-- Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. --> 
                          <td valign="right"><%=UIUtil.formatWithCommaAndDecimal(df.format(equity[counter].getNoOfUnits() * equity[counter].getNominalValue().getAmount())) %>&nbsp;
                          <!-- End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->

                        <input type="hidden" name="schemeCode" value="<%=equity[counter].getStockCode()%>"/>
                        </td>
                        
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
                      	<td><a href="MarketPortItem.do?event=marksecmainlocal_read&indexID=<%=equity[counter].getRefID()%>&subtype=MarksecMainLocal&from_event=<%=from_event%>">View</a>
                      	</td>

                    </tr>
					<%	if (classtype1.equals("odd")) {
                            classtype1 = "even";
                        } else {
                            classtype1 = "odd";
                        }
                    }
                } else { %>
                <tr class="<%=classtype1%>">
                <td colspan="12"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

                <% } }%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%--Add by Govind S:04/09/2011 --%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<%--<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>


<%@ include file="/collateral/marketablesec/marksecmainlocal/MarksecMainLocal_view_valuation_from_los.jsp"%>
<%@ include file="/collateral/marketablesec/marksecmainlocal/MarksecMainLocal_view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>
--%>
<br>