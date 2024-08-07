<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IPostDatedCheque,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeTypeList,
                 java.util.List,
                 java.util.ArrayList,
                 org.apache.commons.lang.StringUtils,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.NatureOfChargeList,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.collateral.BookingLocationList"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    IAssetPostDatedCheque oldCollateral = (IAssetPostDatedCheque) itrxValue.getCollateral();  
    IAssetPostDatedCheque newCollateral = (IAssetPostDatedCheque) itrxValue.getStagingCollateral();
    boolean isOnlyOneNull = false;
    boolean isBothNull = false;
    String prefix = "Asset";
    String subtype = "AssetPostDatedChqs";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";
    String classtype ;
    
    
   
%>


<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.OBPostDatedCheque"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%><tbody>
    <tr>
        <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
				<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
			</tbody>
        </table>
		</td>
	</tr>
	<%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
</tbody>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td ></td>
	</tr>
	<tr>
		<td ></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
                <%
                    ILimitCharge[] limit = iCol.getLimitCharges();
                    ILimitCharge objLimit = null;
                    if (limit != null && limit.length > 0) {
                        objLimit = limit[0];
                    }
                    isOnlyOneNull = false;
                    isBothNull = false;
                    ILimitCharge oldLimit = null;
                    ILimitCharge newLimit = null;
                    Amount oldChargeAmt = null;
                    Amount newChargeAmt = null;
                    if (isProcess) {
                        if (oldCollateral != null &&
                        		oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                            oldLimit = oldCollateral.getLimitCharges()[0];
                        }

                        if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                            newLimit = newCollateral.getLimitCharges()[0];
                        }
                        if (oldLimit != null) {
                            oldChargeAmt = oldLimit.getChargeAmount();
                        }
                        if (newLimit != null) {
                            newChargeAmt = newLimit.getChargeAmount();
                        }
                    }
                    boolean isLimitNull = (objLimit == null);
                %>
		
			
			<!--<%@ include file="/collateral/common/view_security_instrument.jsp" %>-->
            </tbody>
        </table></td>
    </tr>
</tbody>
</table>



<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.security.asset.cheque.detail"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                    <tr>
                    <td width="15%">Bank Name</td>
                    <td width="15%">Cheque Number</td>
                    <td width="10%">Cheque Number From</td>
                    <td width="10%">Cheque Number To</td>
                    <td width="15%">Deposit Date</td>
                    <td width="15%">Expiry Date</td>
                    <td width="10%">Cheque Amount</td>
                    <td width="10%">Action</td>
                   </tr>
                </thead>
                 <tbody>
                <%
                    IPostDatedCheque[] cheque = iCol.getPostDatedCheques();  
                    classtype = "odd";
                    if (cheque != null) {
                        if (cheque.length == 0) {
                %>
                <tr class="<%=classtype%>">
                    <td colspan="8">There is no cheque detail.</td>
                </tr>
                <% }
                    for (int counter = 0; counter < cheque.length; counter++) {
                    	
                    	ChequeForm obj=new ChequeForm();
                        if (cheque[counter] == null)
                            continue;
                %>
                     <%OBPostDatedCheque post=new OBPostDatedCheque();
                     
                      post= (OBPostDatedCheque)cheque[counter];%> 
            
                <tr class="<%=classtype%>">
               
                  <%if(post.getOtherbank()!=null){ %>
                    <td width="25%">
                        <integro:empty-if-null value="<%=post.getOtherbank().getOtherBankName()%>"/>&nbsp;
                    </td>
                    <%}else if(post.getSystemBank()!=null){ %>
                      <td width="15%" valign="right">
                       <integro:empty-if-null value="<%=post.getSystemBank().getSystemBankName()%>"/>&nbsp;
                      &nbsp;   </td>
                     <%}else{%>
                     <td width="25%">&nbsp;
                     </td>
                     <%} %>
                    
                    <td width="25%">
                    
                         <%if(cheque[counter].getChequeNumber()!=null){ %>
                          <%=  StringUtils.leftPad(cheque[counter].getChequeNumber()==null?"":cheque[counter].getChequeNumber(),6, "0")%>
                 
                 <%}else{ %>   
                  <integro:empty-if-null value="<%=cheque[counter].getChequeNumber()%>"/>&nbsp;
                 <%} %>
                        
                    </td>
                     <td width="15%">
                      <%if(String.valueOf(cheque[counter].getChequeNoFrom())!=null){ %>
                          <%=  StringUtils.leftPad(String.valueOf(cheque[counter].getChequeNoFrom())==null?"":String.valueOf(cheque[counter].getChequeNoFrom()),6, "0")%>
                 
                 <%}else{ %>   
                  <integro:empty-if-null value="<%=String.valueOf(cheque[counter].getChequeNoFrom())%>"/>&nbsp;
                 <%} %>
                      
                    </td>
                    <td width="15%">
                    <%if(String.valueOf(cheque[counter].getChequeNoTo())!=null){ %>
                          <%=  StringUtils.leftPad(String.valueOf(cheque[counter].getChequeNoTo())==null?"":String.valueOf(cheque[counter].getChequeNoTo()),6, "0")%>
                 
                 <%}else{ %>   
                  <integro:empty-if-null value="<%=String.valueOf(cheque[counter].getChequeNoTo())%>"/>&nbsp;
                 <%} %>          
                    </td>
                     <%if(cheque[counter].getIssueDate()!=null){ %>
                    <td width="15%" valign="right">
                       <integro:empty-if-null value="<%= dt.format(cheque[counter].getIssueDate())%>"/>&nbsp;
                    </td>
                    <%}else{ %>
                      <td width="15%" valign="right">&nbsp;   </td>
                     <%}%>
                     
                      <%if(cheque[counter].getExpiryDate()!=null){ %>
                     <td width="15%" valign="right">
                      
                        <integro:empty-if-null value="<%= dt.format(cheque[counter].getExpiryDate())%>"/>&nbsp;
                   
                    </td>
                     <%}else{ %>
                      <td width="20%" valign="right">&nbsp;   </td>
                     <%}%>
                   <td width="25%">
                        <% if (cheque[counter].getChequeAmount() != null ) { 
                        	obj.setChequeAmt( String.valueOf(cheque[counter].getChequeAmount().getAmount()));
                            	
                        %>
                            <integro:empty-if-null value="<%= UIUtil.formatWithCommaAndDecimal(String.valueOf(cheque[counter].getChequeAmount().getAmountAsBigDecimal()))%>"/>&nbsp;
                    </td>
                        <% } %>
                        
                       
                     <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                  <%
                               	
                                  if(forward_event!=null && !forward_event.equals("")){
                                	  if(forward_event.equals("prepare_close")){
                                	  %>  
                                        <option value='AssetPostDatedChqsCollateral.do?event=view_list&indexID=<%=counter%>&itemType=CHEQUE&trxID=<%= trxID %>&pdcEvent=<%=forward_event %>&collateralID=<%=collateralID %>'>View</option>
                                     <%}
                                	  else if(forward_event.equals("track")){  %>
                                      <option value='AssetPostDatedChqsCollateral.do?event=view_list&indexID=<%=counter%>&itemType=CHEQUE&trxID=<%= trxID %>&pdcEvent=<%="close_totrack" %>&collateralID=<%=collateralID %>'>View</option>
                                     
                                     <%} else{%>
                                     <option value='AssetPostDatedChqsCollateral.do?event=view_list&indexID=<%=counter%>&itemType=CHEQUE&trxID=<%= trxID %>&pdcEvent=<%=forward_event %>&collateralID=<%=collateralID %>'>View</option>
                                     
                                     <%} %>
                                   
                                <%  }%>
								
                                    </select> </td>
                   
                 </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="7">There is no cheque detail.</td>
                </tr>
                <% } %>
				
            </tbody>
       
            </table></td>
        </tr>
		<tr><td>&nbsp;</td></tr>
    </tbody>
</table>


<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
