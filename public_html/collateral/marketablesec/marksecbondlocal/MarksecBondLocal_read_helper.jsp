<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.cms.app.collateral.bus.type.marketable.subtype.bondslocal.IBondsLocal,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.marketablesec.NatureOfChargeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList"%>
                 <%@page import="com.integrosys.cms.app.feed.bus.bond.OBBondFeedEntry"%>
                 <%@page import="com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/marketablesec/marksecbondlocal/MarksecBondLocal_read_helper.jsp,v 1.42 2006/07/27 02:02:13 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Marketable Securities, Subtype - Bonds - Local
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.42 $
* Date: $Date: 2006/07/27 02:02:13 $
* Tag: $Name:  $
*/
%>

<%
    java.text.DecimalFormat dft = new java.text.DecimalFormat("#0.00");
    IBondsLocal oldCollateral = (IBondsLocal) itrxValue.getCollateral();
    IBondsLocal newCollateral = (IBondsLocal) itrxValue.getStagingCollateral();
    String formName = "MarksecBondLocalForm";
    String prefix = "Mark";
    String subtype = "MarksecBondLocal";
    String formActionName = subtype+"Collateral.do";
    
    IBondFeedEntry obMutualFundsEntry = null;
    
  List   BondList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.BondList");
    if(BondList!= null){
    	for(int i = 0; i< BondList.size() ; i++)
    	{
    		obMutualFundsEntry = (OBBondFeedEntry)BondList.get(i);
    		String str = 	obMutualFundsEntry.getName();	
    	}
  			
  		 
    }
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<script type="text/javascript">
	function getElementsByClassName(document, className) {
		 if(document.getElementsByClassName){
			 return document.getElementsByClassName(className);
		 }else{
			 var elements = document.body.getElementsByTagName("*");
			 var retNodes = []
			 for (var i = 0; i < elements.length; i++) {
			        if ((elements[i].className).indexOf(className) > -1) {
			        	retNodes.push(elements[i]);
			        }
			 }
			 return retNodes;
		 }
	}
	function formatAmt() {
		 var spanAmts = getElementsByClassName(document,'amtClass');
		 for(var i = 0; i < spanAmts.length; i++){
			 if(spanAmts[i].innerText && spanAmts[i].innerText != "-"){
			 	var formatedAmt = formatAmountAsCommaSeparated1(spanAmts[i].innerText);
			 	spanAmts[i].innerText = formatedAmt;
		 	}
		 }
	}
</script>
<!-- InstanceBeginEditable name="Content" -->
	<tbody>
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
							<bean:message key="label.security.legal.enforceability.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
						<td width="30%">
							<% if (!(iCol== null)){ %>
								<integro:date object="<%=iCol.getLEDate()%>" /> 
							<% } %>&nbsp;</td>
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
              <td width="6%"><bean:message key="label.global.sn"/></td>
              <td width="8%"><bean:message key="label.bond.code"/></td>
              <td width="12%"><bean:message key="label.bond.Name"/></td>
              <td width="9%"><bean:message key="label.marketsec.port.detail.noofunits"/></td>
              <td width="9%"><bean:message key="label.predeal.unit.price"/></td>
              <td width="12%"><bean:message key="label.global.total"/></td>
              <td width="8%"><bean:message key="label.marketsec.sec.detail.line.number"/></td>
              <td width="8%"><bean:message key="label.marketsec.sec.detail.serial.no"/></td>
              <td width="12%"><bean:message key="label.marketsec.sec.detail.line.value"/></td>
              <td width="8%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>
            <%  String classtype = "odd";
                if (from_event.equals("process")) {
	                List res = CompareOBUtil.compOBArray(newCollateral.getEquityList(),((oldCollateral==null)?null:oldCollateral.getEquityList()));
	                ArrayList list = new ArrayList(res);
	                pageContext.setAttribute("equity",list);
	                int counter = 0;
	                if (list == null || list.size() == 0) {
			%>
		                <tr class="odd">
							<td colspan="10"><bean:message key="label.security.no.security.detail"/></td>
		                </tr>
					<% } %>
			<logic:present name="equity" >
			   <logic:iterate id="compResult" name="equity"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
					<%  IMarketableEquity marketEquity = (IMarketableEquity) compResult.getObj();
	               classtype = "odd";
	           %>
	                    <tr class="<%=classtype%>">
							<td class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
							
								<td>
					
							<integro:empty-if-null value="<%=marketEquity.getStockCode()%>"/>&nbsp;</td>
							
							<td>
							 <%
                      String str = "";
                      for(int i = 0; i< BondList.size() ; i++)
                  	{
                  		obMutualFundsEntry = (OBBondFeedEntry)BondList.get(i);
                  		if(obMutualFundsEntry.getBondCode().equals(marketEquity.getStockCode()))
                  		{
                  			 str = 	obMutualFundsEntry.getName();	
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>
							</td>
							<!--Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
							<td valign="right"><%=Double.valueOf(marketEquity.getNoOfUnits()).longValue()%></td>
							<!--End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
							<td>
							<% if (marketEquity.getValuationUnitPrice() != null) { %>
								<%=UIUtil.formatWithCommaAndDecimal(String.valueOf(marketEquity.getValuationUnitPrice().getAmount()))%>
							<% } %>&nbsp;</td>
							                                  
							<td valign="right"><%=UIUtil.formatWithCommaAndDecimal(dft.format(marketEquity.getNoOfUnits() * marketEquity.getValuationUnitPrice().getAmount()))%>&nbsp;</td>
						    <%
		                          StringBuffer sbLine = new StringBuffer(); 
		                          StringBuffer sbSerial = new StringBuffer();		  
		                          StringBuffer sbLineValue = new StringBuffer();
		                          if(marketEquity.getLineDetails()!= null){
		                        	  for(IMarketableEquityLineDetail lineDetail : marketEquity.getLineDetails()){
		                        		  sbLine.append(lineDetail.getLineNumber()!=null? lineDetail.getLineNumber() :"-").append("<br>");
		                        		  sbSerial.append(lineDetail.getSerialNumber()!=null? lineDetail.getSerialNumber() :"-").append("<br>");
		                        		  sbLineValue.append("<span class='amtClass'>");
		                        		  sbLineValue.append(lineDetail.getLineValue()!=null? lineDetail.getLineValue().toPlainString() :"-");
		                        		  sbLineValue.append("</span>").append("<br>");
		                              }
		                          }
	                        %>
	                        <td><integro:empty-if-null value="<%=sbLine.toString() %>"/></td>
						    <td><integro:empty-if-null value="<%=sbSerial.toString() %>"/></td>
						    <td><integro:empty-if-null value="<%=sbLineValue.toString() %>"/></td>
							<td><a href="MarketPortItem.do?event=marksecbondlocal_read&indexID=<%=marketEquity.getRefID()%>&subtype=MarksecBondLocal&from_event=<%=from_event%>">View</a></td>
	                    </tr>
						<%	if (classtype.equals("odd")) {
	                        classtype = "even";
		                    } else {
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
							<td colspan="10"><bean:message key="label.security.no.security.detail"/></td>
						</tr>
				<% } 
					for (int counter = 0; counter < equity.length; counter++) {
						if ( equity[counter] == null ) continue;
				%>
                    <tr class="<%=classtype%>">
                      <td class="index"><%=counter + 1%></td>
                      <td>                      
                    
                      <integro:empty-if-null value="<%=equity[counter].getStockCode()%>"/>&nbsp;</td>
                      <td>                      
                      <%
                      String str = "";
                      for(int i = 0; i< BondList.size() ; i++)
                  	{
                  		obMutualFundsEntry = (OBBondFeedEntry)BondList.get(i);
                  		if(obMutualFundsEntry.getBondCode().equals(equity[counter].getStockCode()))
                  		{
                  			 str = 	obMutualFundsEntry.getName();		
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>
                      </td>

                      <td valign="right">
                      <!--Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
                      <%=Double.valueOf(equity[counter].getNoOfUnits()).longValue()%>
                      <!--End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->
                        </td>
                        <td width="20%">
								<% if (equity[counter].getValuationUnitPrice() != null ) { %>
									<%=UIUtil.formatWithCommaAndDecimal(String.valueOf(equity[counter].getValuationUnitPrice().getAmount()))%>
								<% } %>&nbsp;</td>
                    
                      <td valign="right"><%=UIUtil.formatWithCommaAndDecimal(dft.format(equity[counter].getNoOfUnits() * equity[counter].getValuationUnitPrice().getAmount()))%>&nbsp;</td>
					  <%
	                        StringBuffer sbLine = new StringBuffer(); 
	                        StringBuffer sbSerial = new StringBuffer();		  
	                        StringBuffer sbLineValue = new StringBuffer();
	                        if(equity[counter].getLineDetails()!= null){
	                        	for(IMarketableEquityLineDetail lineDetail : equity[counter].getLineDetails()){
	                        		sbLine.append(lineDetail.getLineNumber()!=null? lineDetail.getLineNumber() :"-").append("<br>");
	                        		sbSerial.append(lineDetail.getSerialNumber()!=null? lineDetail.getSerialNumber() :"-").append("<br>");
	                        		sbLineValue.append("<span class='amtClass'>");
	                        		sbLineValue.append(lineDetail.getLineValue()!=null? lineDetail.getLineValue().toPlainString() :"-");
	                        		sbLineValue.append("</span>").append("<br>");
	                            }
	                        }
                      %>
                      <td><integro:empty-if-null value="<%=sbLine.toString() %>"/></td>
					  <td><integro:empty-if-null value="<%=sbSerial.toString() %>"/></td>
					  <td><integro:empty-if-null value="<%=sbLineValue.toString() %>"/></td>
                      <td><a href="MarketPortItem.do?event=marksecbondlocal_read&indexID=<%=equity[counter].getRefID()%>&subtype=MarksecBondLocal&from_event=<%=from_event%>">View</a>
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
						<td colspan="10"><bean:message key="label.security.no.security.detail"/></td>
					</tr>
				<%  } }%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<%--<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %> 

<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>

--%><br>
<script>
	formatAmt();
</script>