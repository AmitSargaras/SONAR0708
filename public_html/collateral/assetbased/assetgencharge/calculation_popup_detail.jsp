<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.geography.city.proxy.ICityProxyManager"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 java.util.HashMap,
                 java.util.Iterator,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeAction,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory,
                 com.integrosys.cms.ui.dataprotection.DataProtectionConstants,
				 java.util.Locale" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"/>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"/>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>
<%  
BigDecimal stoackAmt= new BigDecimal("0");
BigDecimal debtorsAmt= new BigDecimal("0");
BigDecimal drawingPower= new BigDecimal("0");

BigDecimal LessCreditAmt= new BigDecimal("0");
BigDecimal TotalLessCreditAmt= new BigDecimal("0");

BigDecimal LessAdvancesAmt= new BigDecimal("0");

BigDecimal excessCredit= new BigDecimal("0");
BigDecimal totalCredit= new BigDecimal("0");
BigDecimal valueOfExcessCr= new BigDecimal("0");
BigDecimal valueOfAdvances = new BigDecimal("0");

BigDecimal totalPaidStock= new BigDecimal("0");
BigDecimal totalDebtorsValueForDP= new BigDecimal("0");

final BigDecimal ONE_HUNDRED = new BigDecimal(100);

   ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate");

    IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
String assetsFixedMarginValue= (String)request.getAttribute("assetsFixedMarginValue");
String assetsMarginType= (String)request.getAttribute("assetsMarginType");

String assetsFixedMarginValueNew= (String)request.getAttribute("assetsFixedMarginValueNew");
String assetsMarginTypeNew= (String)request.getAttribute("assetsMarginTypeNew");

String liabilityFixedMarginValueAdv= (String)request.getAttribute("liabilityFixedMarginValueAdv");
String liabilityMarginTypeAdv= (String)request.getAttribute("liabilityMarginTypeAdv");


String liabilityFixedMarginValue= (String)request.getAttribute("liabilityFixedMarginValue");
String liabilityMarginType= (String)request.getAttribute("liabilityMarginType");

    
    List stockDetailsList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceStockDetailsList");
    
    IGeneralChargeDetails chargeDetaills=null;
 
    
    
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

    AssetGenChargeStockDetailsForm colForm = (AssetGenChargeStockDetailsForm) request.getAttribute("AssetGenChargeStockDetailsForm");
    
	List  locationList = (List) request.getAttribute("locationList");
	pageContext.setAttribute("locationList", locationList);
	
    String remarks = (String) request.getAttribute("remarks");
    if (remarks == null || remarks.trim().length() == 0) {
        remarks = request.getParameter("remarks");
    }
    String classtype ="";
    String prefix = "Asset";
    String subtype = "AssetGenCharge";
    String formName = subtype + "Form";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";

     //todo - need to check
    String collateralLocation = iCol.getCollateralLocation();

    String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong(roleType);

    IDataProtectionProxy dpProxy = DataProtectionProxyFactory.getProxy();

    boolean updatableSecDetails = true;
	if (collateralLocation!=null) dpProxy.isFieldAccessAllowed(ICMSConstant.INSTANCE_COLLATERAL, subtypeCode, DataProtectionConstants.COL_PT_DTL,
            teamTypeMshipID, collateralLocation, IDataProtectionProxy.ANY_ORGANISATION);

	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
    //todo - end
      
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsForm"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" type="text/JavaScript">

function setTotalLonable()
{
	if (window.opener != null && !window.opener.closed) {
		
		  var txtName = window.opener.document.getElementById("totalLonable");
	        txtName.value = document.getElementById("drawingPower").value;
	        
        var txtName1 = window.opener.document.getElementById("totalLonable1");
        txtName1.value = document.getElementById("drawingPower").value;
    }
    window.close();
}
<!--

//-->
</script>
<html>
	<head>
		<title>DP Calculation Details </title>
		<%@ include file="/template/stylesheet_template.jsp" %>

<br>
<DIV style="overflow: auto;width:1000;height:500;scrollbar:true;">

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
   
</thead>

<tbody>
<tr>
     <td colspan="4">
        <table width="90%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
          	<tr>
          		<td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="70%">Particulars</td>
          		<td width="15%" align="center">Value</td>
          		
          	</tr>
          </thead> 
            <tbody>
             <%
             int index=0;
           
             if(stockDetailsList!=null && stockDetailsList.size()>0){
            	 IGeneralChargeStockDetails chargeStockDetails=null; 
                  classtype = "even";
                
            
                 
			for (int counter1= 0; counter1 < stockDetailsList.size(); counter1++) {
				 IGeneralChargeStockDetails chargeStockDetails1=null; 
           	 chargeStockDetails1=(IGeneralChargeStockDetails)stockDetailsList.get(counter1);
                if (chargeStockDetails1 != null && "CurrentLiabilities".equals(chargeStockDetails1.getStockType())
                		&& "YES".equals(chargeStockDetails1.getApplicableForDp())	
                		){
                	totalCredit   = (totalCredit).add(new BigDecimal(chargeStockDetails1.getComponentAmount() ) );
                } 
              } 
					
			
			
			
                 for (int counter = 0; counter < stockDetailsList.size(); counter++) {
                	
                	  BigDecimal CreditAmt= new BigDecimal("0");
                   	chargeStockDetails=(IGeneralChargeStockDetails)stockDetailsList.get(counter);
                    if (chargeStockDetails != null && "CurrentAsset".equals(chargeStockDetails.getStockType())
                    		&& "YES".equals(chargeStockDetails.getApplicableForDp())
                    	){
                    	index++;
                %>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                } %>
               <tr class="<%=classtype%>">
	        	 <td class="index"><%=index%></td>
          		<td>
					          		<integro:common-code-single categoryCode="CURRENT_ASSET" entryCode="<%=chargeStockDetails.getComponent()%>" display="true" descWithCode="false"  />    		
          		</td>
          		<td align="right"><%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getComponentAmount())%></td>
          		
          		       <% 	
          		     stoackAmt=new BigDecimal(chargeStockDetails.getComponentAmount());   
          		       %>
          	   </tr>
                <%	  IGeneralChargeStockDetails chargeStockDetails1=null; 
                 for (int counter1= 0; counter1 < stockDetailsList.size(); counter1++) {
                   	 chargeStockDetails1=(IGeneralChargeStockDetails)stockDetailsList.get(counter1);
	                    if (chargeStockDetails1 != null && "CurrentLiabilities".equals(chargeStockDetails1.getStockType())
	                    		&& "YES".equals(chargeStockDetails1.getApplicableForDp())	
	                    		){
	          		        CreditAmt= (CreditAmt).add(new BigDecimal(chargeStockDetails1.getComponentAmount() ) );
	                    } 
                    } 
           		System.out.println(" TotalLessCreditAmt===="+TotalLessCreditAmt);
           		totalCredit= CreditAmt;
                 CreditAmt= (CreditAmt).subtract(TotalLessCreditAmt);

                 //	int  val= (stoackAmt).compareTo(CreditAmt);
          		int  val= (CreditAmt).compareTo(stoackAmt);
          		System.out.println("Compare value Stock & Creditors"+val);
      			
          		  if( 1 == val   ){
          			LessCreditAmt= stoackAmt;
          		}else{
          			LessCreditAmt= CreditAmt;
          		}  
          		  
          		
          		TotalLessCreditAmt= (TotalLessCreditAmt).add(LessCreditAmt);
          		System.out.println(" TotalLessCreditAmt===="+TotalLessCreditAmt);

          		stoackAmt = (stoackAmt).subtract(LessCreditAmt);
          		%>
               <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                } %>
                 
                <tr class="<%=classtype%>" align="right">
	        	 		<td class="index">Less</td>
		          		<td>
		          		Creditors
		          		</td>
	          			<td align="right">
		          			 <%=UIUtil.formatWithCommaAndDecimal(LessCreditAmt.toString())%> 
		          		</td>
          	     </tr> 
                    
                     <%	  
                     BigDecimal paidStock= new BigDecimal("0");
                     paidStock=  stoackAmt;
             	     %>
                     <% if (classtype.equals("odd")) {
                    classtype = "even";
	                } else {
	                    classtype = "odd";
	                } %>
                 
                <tr class="<%=classtype%>">
                 <% index++; %> 
   	        	 <td class="index"><%=index%></td>
             		<td>
             		Paid Stock <integro:common-code-single categoryCode="CURRENT_ASSET" entryCode="<%=chargeStockDetails.getComponent()%>" display="true" descWithCode="false"  />
             		</td>
             		<td align="right">
             			  <%=UIUtil.formatWithCommaAndDecimal(paidStock.toString())%> 
             		</td>         		
             	 </tr>
             	   <%	  
             	  BigDecimal margin= new BigDecimal("0");
             	  BigDecimal lessMargin= new BigDecimal("0");
             	  margin= new BigDecimal(chargeStockDetails.getMargin());
             	  lessMargin=  paidStock.multiply(margin).divide(ONE_HUNDRED);
             	  %>
             	  
             	   <% if (classtype.equals("odd")) {
                    classtype = "even";
	                } else {
	                    classtype = "odd";
	                } %>
						<tr class="<%=classtype%>">
							<% index++; %>
							<td class="index">Less</td>
							<td>Margin @ <%=chargeStockDetails.getMargin()%>
							</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(lessMargin.toString())%></td>
						</tr>

						<%
							if (classtype.equals("odd")) {
											classtype = "even";
										} else {
											classtype = "odd";
										}
						%>
						<tr class="<%=classtype%>">
							<%
								BigDecimal netPaidStock = new BigDecimal("0");

											netPaidStock = (paidStock).subtract(lessMargin);
											totalPaidStock = (totalPaidStock).add(netPaidStock);
							%>
							<td class="index"><%=index%></td>
							<td>Net Paid Stock <integro:common-code-single	categoryCode="CURRENT_ASSET"
									entryCode="<%=chargeStockDetails.getComponent()%>"	display="true" descWithCode="false" />
							</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(netPaidStock.toString())%></td>
						</tr>
						
					<%	}
					} //End For Loop of Value stock
					%>

						<%
							if (classtype.equals("odd")) {
									classtype = "even";
								} else {
									classtype = "odd";
								}
						%>
						 <% index++; %> 
						<tr class="<%=classtype%>">
							<td class="index"><%=index%></td>
							<td>Total Paid Stock</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(totalPaidStock.toString())%></td>
						</tr>

					
					
						<%
						System.out.println("totalCredit============================================"+totalCredit);
						System.out.println("TotalLessCreditAmt============================================"+TotalLessCreditAmt);

						totalCredit= (totalCredit).subtract(TotalLessCreditAmt);
						
							for (int counter = 0; counter < stockDetailsList.size(); counter++) {
								
								    chargeStockDetails = (IGeneralChargeStockDetails) stockDetailsList.get(counter);
									if (chargeStockDetails != null && "ValueDebtors".equals(chargeStockDetails.getStockType())
											&& "YES".equals(chargeStockDetails.getApplicableForDp())		
											) {
										index++;
				
									if (classtype.equals("odd")) {
											classtype = "even";
										} else {
											classtype = "odd";
										}
						%>
						<tr class="<%=classtype%>">
							<td class="index"><%=index%></td>
							<td><integro:common-code-single categoryCode="CURRENT_ASSET"
									entryCode="<%=chargeStockDetails.getComponent()%>"
									display="true" descWithCode="false" /></td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getComponentAmount())%></td>

							<%
								debtorsAmt = new BigDecimal(chargeStockDetails.getComponentAmount());
							%>
						</tr>
					
						<%
					//	totalCredit= totalCredit
					//	valueOfExcessCr = CreditAmt;
						
						
						int val = (totalCredit).compareTo(debtorsAmt);
						System.out.println("val============================================"+val);
						if (1 == val) {
							valueOfExcessCr = debtorsAmt;
						} else {
							valueOfExcessCr = totalCredit;
						}

						totalCredit= (totalCredit).subtract(valueOfExcessCr);
						System.out.println("valueOfExcessCr============================================"+valueOfExcessCr);

							if (classtype.equals("odd")) {
											classtype = "even";
										} else {
											classtype = "odd";
										}
						%>
							<%		index++;	%>
						<tr class="<%=classtype%>">
							<td class="index"><%=index%></td>
							<td>Less Value of Creditors which are in excess of Total Paid
								Stock</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(valueOfExcessCr.toString())%></td>
						</tr>
					
					<%
									
										debtorsAmt = (debtorsAmt).subtract(valueOfExcessCr);
										System.out.println("debtorsAmt newwwwwwwwwwww after substract excess============================================"+debtorsAmt);
		
										
						%>				
						
					
						<%
							BigDecimal netDebtors = new BigDecimal("0");
										netDebtors = debtorsAmt;
						%>
						<%
							if (classtype.equals("odd")) {
											classtype = "even";
										} else {
											classtype = "odd";
										}
						%>
						<tr class="<%=classtype%>">
							<%		index++;	%>
							<td class="index"><%=index%></td>
							<td>Net Debtors</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(netDebtors.toString())%></td>
						</tr>
						<%
							BigDecimal margin = new BigDecimal("0");
										BigDecimal lessMargin = new BigDecimal("0");
										margin = new BigDecimal(chargeStockDetails.getMargin());
										lessMargin = netDebtors.multiply(margin).divide(ONE_HUNDRED);
						%>
						<%
							if (classtype.equals("odd")) {
											classtype = "even";
										} else {
											classtype = "odd";
										}
						%>
						<tr class="<%=classtype%>">
							<%	index++;	%>
							<td class="index">Less</td>
							<td>Margin @ <%=chargeStockDetails.getMargin()%>
							</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(lessMargin.toString())%></td>
						</tr>

						<%
							if (classtype.equals("odd")) {
											classtype = "even";
										} else {
											classtype = "odd";
										}
						%>
						<tr class="<%=classtype%>">
							<%
								BigDecimal DebtorsValueForDP = new BigDecimal("0");
											DebtorsValueForDP = (netDebtors).subtract(lessMargin);
											totalDebtorsValueForDP = (totalDebtorsValueForDP).add(DebtorsValueForDP);
							%>
							<td class="index"><%=index%></td>
							<td>Value of Debtors to be considered for DP</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(DebtorsValueForDP.toString())%></td>
						</tr>
						
					<%	}
					} //End For Loop of Value Debtors
						%>
						<%
							IGeneralChargeStockDetails chargeStockDetails1 = null;

										for (int counter1 = 0; counter1 < stockDetailsList.size(); counter1++) {
											chargeStockDetails1 = (IGeneralChargeStockDetails) stockDetailsList.get(counter1);
											if (chargeStockDetails1 != null
													&& "LessAdvances".equals(chargeStockDetails1.getStockType())
													&& "YES".equals(chargeStockDetails1.getApplicableForDp())		
													) {

												valueOfAdvances = (valueOfAdvances)
														.add(new BigDecimal(chargeStockDetails1.getComponentAmount()));

											}
										} //end for  looop
									
						%>
											
						<%
							if (classtype.equals("odd")) {
									classtype = "even";
								} else {
									classtype = "odd";
								}
						%>
						 <% index++; %> 
						<tr class="<%=classtype%>">
							<td class="index"><%=index%></td>
							<td>Total Value Of Debtors to be considered for DP</td>

							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(totalDebtorsValueForDP.toString())%></td>

						</tr>
						
						<% } %>


						<%
							if (classtype.equals("odd")) {
								classtype = "even";
							} else {
								classtype = "odd";
							}
						%>


						<tr class="<%=classtype%>">
							
							<td class="index" >Less</td>
							<td> Value of Creditors which are in excess of Total Paid
								Stock</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(totalCredit.toString())%></td>
						</tr>
						<%
							if (classtype.equals("odd")) {
								classtype = "even";
							} else {
								classtype = "odd";
							}
						%>
						
							
						<tr class="<%=classtype%>">
							
							<td class="index">Less</td>
							<td> Advances</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(valueOfAdvances.toString())%></td>
						</tr>
						
					 <% 	totalDebtorsValueForDP= (totalDebtorsValueForDP).subtract(totalCredit);
					   totalDebtorsValueForDP= (totalDebtorsValueForDP).subtract(valueOfAdvances);
             			drawingPower = (totalPaidStock).add(totalDebtorsValueForDP);                   %>

					
							<%	if (classtype.equals("odd")) {
								classtype = "even";
							} else {
								classtype = "odd";
							}  	%>

						<%	index++;	%>
						<tr class="<%=classtype%>">
							<td class="index"><%=index%></td>
							<td>Drawing Power: Stock + Debtors</td>
							<td align="right"><%=UIUtil.formatWithCommaAndDecimal(drawingPower.toString()) %></td>
							<input type="hidden" name="drawingPower" id= "drawingPower" value="<%=UIUtil.formatWithCommaAndDecimal(drawingPower.toString()) %>"/>
							
							<input type="hidden" name="totalLonable" id= "totalLonable" value="<%=UIUtil.formatWithCommaAndDecimal(drawingPower.toString()) %>"/>
							
							
						</tr>
				</tbody>
        </table>
    </td>
</tr>

</tbody>
<tr>
    <td colspan="4">&nbsp;</td>
</tr>
</table>
</DIV>

<br>
 
		<div style="text-align: center;">
			<input type="button" name="logClose" value=" OK " class="btnNormal" onclick="javascript:window.close(); javascript:setTotalLonable();"/>

				&nbsp;&nbsp;&nbsp;
		</div>
	</head>
	
</html>