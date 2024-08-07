<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.IAddtionalDocumentFacilityDetails,
com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
				 com.integrosys.cms.ui.collateral.CollateralConstant,
				 com.integrosys.cms.ui.common.UIUtil, 
				 com.integrosys.cms.app.common.constant.ICMSConstant,   
				 java.util.List,                
				 java.util.Locale"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%  
	HashMap insuranceCoverageMap1 = new HashMap(); 
	/* if(prefix.equals("Asset")){
		insuranceCoverageMap1 = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageMap1");
	}
	else if(prefix.equals("Other")){
		insuranceCoverageMap1 = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageMap1");
	}
	else if(prefix.equals("Property")){
		insuranceCoverageMap1 = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageMap1");
	} */
    InsurerNameList insurerList1 = InsurerNameList.getInstance();
	String actionName1 = "";
	
	rowIdx = 1; // reset odd-even row highlighting
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	IPropertyCollateral iCol = (IPropertyCollateral)itrxValue.getCollateral();
	String getSubtypeCode1 = iCol.getCollateralSubType().getSubTypeCode();
	getSubtypeCode1 = (getSubtypeCode1==null?"":getSubtypeCode1);	
	
	System.out.println("actionName1:"+actionName1);
	
%>				 


<%@page import="java.util.HashMap"%><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
		<%
			String conversionCcy1 = SecuritySubTypeUtil.getConversionCcy(iCol);
			CurrencyCode ccy1 = new CurrencyCode(conversionCcy1);
		%>      
          <thead>
          
    <tr>
    <td colspan="4" style="text-align: left;" class="fieldname">Additional Document Facility Details</td>
    
    </tr>
    
            <tr>
            
            <td width="10%">S/N</td>
 			<td width="25%">Document Facility Category</td>
 			<td width="25%">Document Facility Type</td>
 			<td width="25%">Document Facility Amount</td>
 			 
            </tr>
          </thead>
          <tbody>
<% 
    BigDecimal totalAmount = BigDecimal.ZERO;
	
        IAddtionalDocumentFacilityDetails[] addFacDocDetArr = iCol.getAdditonalDocFacDetails();
        if (addFacDocDetArr != null) {
            if (addFacDocDetArr.length == 0) { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td colspan="4">
                    There is no Additional Facility Document Details.
                    </td>
                    </tr>
			<%	} %>
				<% 	for (int counter = 0; counter < addFacDocDetArr.length; counter++) {
                    String insrAmt = null;
                    String amts = addFacDocDetArr[counter].getDocFacilityAmount();
                    amts = amts.replace(",", "");
                    amts= amts.replace(".00","");
                    totalAmount = totalAmount.add(new BigDecimal(amts)); 
                    String docFacilityCategory= addFacDocDetArr[counter].getDocFacilityCategory();
                %>
           
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=counter + 1%></td>
                    
            <td><center><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY %>" entryCode="<%=docFacilityCategory%>" display="true" descWithCode="false"/>
            </center>
                              <%--  <center><integro:empty-if-null
												value="<%=addFacDocDetArr[counter].getDocFacilityCategory()%>" /></center> --%>
                               </td>
                               
                               <td>
                               <center><integro:empty-if-null
												value="<%=addFacDocDetArr[counter].getDocFacilityType()%>" /></center>
                               </td> 
                               
                                <%
                               String num1 = addFacDocDetArr[counter].getDocFacilityAmount();
               					num1 = UIUtil.formatWithCommaAndDecimalNew(num1);
               					//num = num.replace(".00", "");
                               %>
                               <td>
                               <center><integro:empty-if-null
												value="<%=num1%>" /></center>
                               </td>
                               
                               </tr>
						<%	
	                }
                } else { %>
                    <tr class="odd">
                    <td colspan="4">
                    There is no Additional Document Facility Details.
                    </td>
                    </tr>
             <% }   %>
                    <tr class="even">
                    <td colspan="3"></td>
                    <%
                    String totalAmts = UIUtil.formatWithCommaAndDecimalNew(totalAmount.toPlainString());
					%>
                    <td>
                    	<center>
                    	<span class="totalDocFacAmt_InNum">
                         	<integro:empty-if-null	value="<%=totalAmts%>" />
                         </span>
                         </center>
                    </td>
                              
                    
                    </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
