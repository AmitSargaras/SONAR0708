<%@ page import="com.integrosys.cms.app.collateral.bus.IAddtionalDocumentFacilityDetails,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.cms.ui.collateral.InsurerNameList,
				 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
				 com.integrosys.cms.ui.common.UIUtil,   
				 com.integrosys.cms.app.common.constant.ICMSConstant,              
				 java.util.Locale"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<script language="JavaScript" type="text/JavaScript">
function editAddDocFacDetails(obj,counter) {
	var event;
	var actionType = obj.value;
	//alert("actionType:"+actionType);
	/* if('UPDATE_RECEIVED' == actionType){
		event="maker_edit_add_fac_doc_det";
	}else if('VIEW_RECEIVED' == actionType){
		event="maker_view_insurance_received";
	}else if('DEFER' == actionType){
		event="maker_update_insurance_deferred";
	}else if('VIEW_DEFERRED' == actionType){
		event="maker_view_insurance_deferred";
		
	}else if('WAIVER' == actionType){
		event="maker_update_insurance_waived";
		
	}else if('VIEW_WAIVED' == actionType){
		event="maker_view_insurance_waived";
		
	}else if('UPDATE' == actionType){
		event="maker_update_insurance_pending";
		 
	}else if('VIEW_AWAITING' == actionType){
		event="maker_view_insurance_pending";
		
	}if('RECEIVE' == actionType){
		event="maker_edit_insurance_received";
		
		} */
	if('PENDING_UPDATE' == actionType){
		event="maker_update_add_fac_doc_det";
	}else if('SUCCESS' == actionType){
		event="maker_update_add_fac_doc_det";
	}else if('PENDING_EDIT' == actionType){
		event="maker_edit_add_fac_doc_det";
	}
	//event="maker_edit_add_fac_doc_det";
	document.forms[0].event.value = event;
	 document.forms[0].indexID.value = counter;
	// alert("counter 2:"+counter);	
     document.forms[0].itemType.value = "<%=CollateralConstant.ADD_DOC_FAC_DET_INFO%>";
    // alert("event 3:"+event);	
    var prefix1 = "<%=prefix%>";
   // if("Property" == prefix1){
    	document.forms[0].action='PropertyAddtionalDocumentFacilityDetails.do';
   // }
   // else{
    //	document.forms[0].action='AssetInsurancePolicy.do';
   // }
    document.forms[0].submit();

    return action;
}	
</script>
<%
	
	/* HashMap insuranceCoverageMap = new HashMap(); 
	if(prefix.equals("Asset")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageMap");
	}
	else if(prefix.equals("Other")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageMap");
	}
	else if(prefix.equals("Property")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageMap");
	}
    InsurerNameList insurerList = InsurerNameList.getInstance();
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);	        
	rowIdx = 0; // reset odd-even row highlighting
	
	String getSubtypeCode = iCol.getCollateralSubType().getSubTypeCode();
	getSubtypeCode = (getSubtypeCode==null?"":getSubtypeCode); */
%>				 

<%@page import="java.util.HashMap"%><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  
  <tbody>
    <tr>
      <td ><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
		<%
			/* String conversionCcy = SecuritySubTypeUtil.getConversionCcy(iCol);
			CurrencyCode ccy = new CurrencyCode(conversionCcy); */
		%>      
          <thead>
          <tr>
    <td  width="30%" colspan="3" style="text-align: left;" class="fieldname"><b>Additional Document Facility Details</b></td>
    <td  width="70%" colspan="3" align="right" valign="baseline">
    <% if (!isSSC) { %>
    <input class="btnNormal"  type="button" name="Submit2222" value="Add New" onclick="javascript:submitPage(10, -1)"/>
    &nbsp; <input name="Submit2"  type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(12, 0)"/>
    <% } %>
    </td>
    </tr>
            <tr>
	         <!-- <td width="4%"><bean:message key="label.global.sn"/></td>
				<td width="15%"><bean:message key="label.insurance.policy.num"/> </td>
	            <td width="20%"><bean:message key="label.insurer.name"/></td>
	            <td width="13%"><bean:message key="label.insured.amt"/> </td>
	            <td width="13%"><bean:message key="label.limit.expiry.date"/></td>
	            <td width="10%"><bean:message key="label.remove"/></td>  -->   
	            
	       	<td width="5%">S/N</td>
 			<td width="25%">Document Facility Category</td>
			<td width="25%">Document Facility Type</td>  
 			<td width="25%">Document Facility Amount</td>
			<td width="10%">Action</td>
			<td width="10%"><bean:message key="label.remove"/></td>
            </tr>
          </thead>
          <tbody>
           <%
           IAddtionalDocumentFacilityDetails[] docFacDetArr = iCol.getAdditonalDocFacDetails();
           BigDecimal totalAmount = BigDecimal.ZERO;
           String amts = "";
           String totalAmts = "";
                if (docFacDetArr != null) {
                    if (docFacDetArr.length == 0) { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	                    <td colspan="6">
	                    There is no additonal document Facility detail records.
	                    </td>
                    </tr>
			<%	} %>
				<% 	for (int counter = 0; counter < docFacDetArr.length; counter++) {
                        String insrAmt = null;
            
                %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=counter + 1%></td>
				
                               <td>
                               
												<center><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY %>" entryCode="<%=docFacDetArr[counter].getDocFacilityCategory()%>" display="true" descWithCode="false"/></center>&nbsp;
												
                               </td>
                               
                               <td>
                               <center><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE %>" entryCode="<%=docFacDetArr[counter].getDocFacilityType()%>" display="true" descWithCode="false"/>&nbsp;</center>
                               </td>
                               <%
                               String num = docFacDetArr[counter].getDocFacilityAmount();
               					num = UIUtil.formatWithCommaAndDecimalNew(num);
               					//num = num.replace(".00", "");
                               %>
                                <td>
                               <center><integro:empty-if-null
												value="<%=num%>" /></center>
                               </td>
                               <%
                               amts = docFacDetArr[counter].getDocFacilityAmount();
                               amts = amts.replace(",", "");
                               amts= amts.replace(".00","");
                               totalAmount = totalAmount.add(new BigDecimal(amts)); 
                               String tempStr= "editAddDocFacDetails(this,'"+counter+"')";
                               %>
                               <td>
                               	
									
									<%-- <html:select property="actionType" onchange="editInsuranceDetail(this,'<%=counter%>')" >  --%>
									<html:select property="actionType" onchange='<%=tempStr%>'>
                					<option value="" >Please Select </option>
								<%	if("PENDING_EDIT".equalsIgnoreCase(docFacDetArr[counter].getAddFacDocStatus())){%>
				<option value="PENDING_EDIT">Edit</option>
				<%}if("PENDING_UPDATE".equalsIgnoreCase(docFacDetArr[counter].getAddFacDocStatus()) 
						|| "SUCCESS".equalsIgnoreCase(docFacDetArr[counter].getAddFacDocStatus())){%>
				<option value="PENDING_UPDATE">Edit</option>
				<%} %>
				</html:select>
                                         
                                      <td><html:multibox property="deleteInsItem" value="<%=String.valueOf(counter)%>"/></td>    
                                         </td> 
                    
						<%	
	                }
                }else { %>
                    <tr class="odd">
                    <td colspan="6">
                    There are no records found.
                    </td>
                    </tr>
                    <%} %>
                    </tr>
                    <tr class="even">
                    <td colspan="3"></td>
                    <%
					totalAmts = UIUtil.formatWithCommaAndDecimalNew(totalAmount.toPlainString());
					%>
                    <td>
                    	<center>
                    	<span class="totalDocFacAmt_InNum">
                         	<integro:empty-if-null	value="<%=totalAmts%>" />
                         </span>
                         </center>
                    </td>
                    <td colspan="2">
                    	<center><span id="totalDocFacAmt_InWords"></span></center>
                    </td>           
                    
                    </tr>
             
          </tbody>
        </table></td>
    </tr>
	<tr><td><html:errors property="insPolicyErr"/>
  </tbody>
</table>