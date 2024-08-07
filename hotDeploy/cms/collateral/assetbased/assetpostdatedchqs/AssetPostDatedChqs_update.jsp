<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IPostDatedCheque,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeTypeList,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 java.util.HashMap,
                 java.util.Iterator,
                 java.text.DecimalFormat,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.AssetPostDatedChqsForm,
                 com.integrosys.cms.ui.collateral.CollateralAction" %>

<% 


ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String collValCurrency1 = "";
ICollateral actualCol1 = itrxValue.getCollateral();
collValCurrency1 = itrxValue.getCollateral().getCurrencyCode();

    IAssetPostDatedCheque iCol = (IAssetPostDatedCheque) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    
    pageContext.setAttribute("obj", iCol);
    String prefix = "Asset"; 
    String subtype = "AssetPostDatedChqs";
    String formName = "AssetPostDatedChqsForm";
    String from_event="prepare_update" ;
    String formActionName = "AssetPostDatedChqsCollateral.do";

    String classtype ="";
    AssetPostDatedChqsForm colForm = (AssetPostDatedChqsForm) request.getAttribute(formName);
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
	List branchList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.branchList");
    if (branchList != null) {
   pageContext.setAttribute("branchList",branchList);
    }
   List otherBankList = (List) request.getAttribute("otherBankList");
   if (otherBankList != null) {
	       pageContext.setAttribute("otherBankList",otherBankList);
	     }
   DateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
   String context = request.getContextPath() + "/";
   DecimalFormat dft = new DecimalFormat("#0.00");
   String prefix1 = "Asset";
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.OBPostDatedCheque"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
	<script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script language="JavaScript" type="text/JavaScript">
  


	function submitPage(num, index) {
	    enableAllFormElements();
	 
            if (num == 1) {
               
                document.forms[0].event.value = "submit";
            }
            if (num == 2) {
            	  
                document.forms[0].event.value = "update";
            }
            if (num == 3) {
            	 
                document.forms[0].event.value = "itemDelete";
                document.forms[0].itemType.value = "CHEQUE";
            }
            if (num == 4) {
            	  
                document.forms[0].event.value = "prepare";
                document.getElementById("indexID").value= "-1";
                document.getElementById("itemType").value="CHEQUE";
            }
            if (num == 5) {
            	 
                document.forms[0].event.value = "prepare_update_sub";
                document.getElementById("indexID").value=index;
                document.getElementById("itemType").value="CHEQUE";
            }
            if (num == 6) {
            	  
                document.forms[0].event.value = "viewChequeDetails";
                document.getElementById("indexID").value= "-1";
                document.getElementById("itemType").value="CHEQUE";
            }
            
            document.forms[0].submit();

        }

    
	function MM_jumpMenuval(indexID,itemType,bankCode,selObj,draweeBankStatus,issuerStatus){ //v3.0
		var opValue=selObj.options[selObj.selectedIndex].value;
		
		if(opValue=='viewAsset'){
			 document.forms[0].event.value="view_chequeDetail";
			 
		 }else if(opValue=='editAsset'){
			 document.forms[0].event.value="prepare_update_sub";
			 
		}else if(opValue=='deleteAsset'){
			 document.forms[0].event.value="delete_chequeDetail";
			 
		}
		document.getElementById("indexID").value=indexID;
		document.getElementById("draweeBankStatus").value=draweeBankStatus;
		document.getElementById("issuerStatus").value=issuerStatus;
		document.forms[0].itemType.value = "CHEQUE";
		document.forms[0].bankCode.value=bankCode;
	    document.forms[0].submit();
	}
     
    </script>    
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetPostDatedChqsCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID" id="indexID"/>
<input type="hidden" name="itemType" id="itemType"/>                
<input type="hidden" name="bankCode" id="bankCode"/>
<input type="hidden" name="issuerStatus" id="issuerStatus"/>
<input type="hidden" name="draweeBankStatus" id="draweeBankStatus"/>
                 

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.asset.title.create"/>
			<% } else { %>
				<bean:message key="label.security.asset.title.edit"/>
			<% } %>
		</h3></td>
        </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
        <tr>
            <td><h3><bean:message key="label.security.general"/></h3></td>
            <td width="50%" align="right">
                <% if (isDeleting) { %>
                    <p class="deletedItem">DELETED </p>
                <% } %>
            </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>

    <tbody>
        <tr>
            <td colspan="2">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>
                    <%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
				</tbody>
			</table>
			</td>
		</tr>
		<%@ include file="/collateral/collateral_general_common_field.jsp" %>
	</tbody>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tbody>
	<tr>
		<td colspan="2">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
				<tbody>
	
                </tbody>
            </table></td>
        </tr>
    </tbody>
</table>

    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <thead>
        <tr>
            <td><h3>Cheque Details</h3></td>
               <td align="right" valign="baseline">
                <input type="hidden" name="subtype" value="AssetPostDatedChqs"/>
                <html:button property="chequeSubmit155" value="Add New"    onclick="javascript:submitPage(4, -1)" styleClass="btnNormal"/> &nbsp;
                 </td>
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
                    <td width="5%">Bank Name</td>
                    <td width="5%">Cheque Number</td>
                    <td width="5%">Cheque Number From</td>
                    <td width="5%">Cheque Number To</td>
                    <td width="25%">Deposit Date</td>
                    <td width="15%">Expiry Date</td>
                    <td width="20%">Cheque Amount</td>
                    <td width="20%">Action</td>
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
                    	String valtext="";
                    	String draweeBankStatus="";
                    	String issuerStatus="";
                    	if(cheque[counter]!=null){
                    	valtext=cheque[counter].getBankCode();
                    	draweeBankStatus=cheque[counter].getDraweeBank();
                    	issuerStatus=cheque[counter].getIssuerName();
                          
                    	}
                              if (cheque[counter] == null)
                            continue;
                        
                       
                %>
                     <%
                      OBPostDatedCheque post=new OBPostDatedCheque();
                   
                      post= (OBPostDatedCheque)cheque[counter];
                           
                        %> 
                      
            
                <tr class="<%=classtype%>">
                  <%if(post.getOtherbank()!=null){ %>
                    <td width="15%" valign="right">
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
                    
                    <td width="15%">
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
                  <integro:empty-if-null value="<%= String.valueOf(cheque[counter].getChequeNoFrom()) %>"/>&nbsp;
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
                      <td width="15%" valign="right">&nbsp;   </td>
                     <%}%>
                    <td width="10%">
                        <% if (cheque[counter].getChequeAmount() != null ) { 
                        	obj.setChequeAmt( String.valueOf(cheque[counter].getChequeAmount().getAmount()));
                        	BigDecimal bdreq = new BigDecimal(cheque[counter].getChequeAmount().getAmount()).setScale(0, 0);
                               
                         	
                        %>
                            <integro:empty-if-null value="<%= UIUtil.formatWithCommaAndDecimal(String.valueOf(cheque[counter].getChequeAmount().getAmountAsBigDecimal()))%>"/>&nbsp;
                    </td>
                        <% } %>
                      
                     <td>
                                            
                    <select name="menu1" onchange="MM_jumpMenuval(<%=counter%>,'CHEQUE','<%=valtext%>',this,'<%=draweeBankStatus%>','<%=issuerStatus%>')" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <option value='viewAsset'>View</option>
                      <option value='editAsset'>Edit</option>
                      <option value='deleteAsset'>Delete</option>
                    </select>                 
                  </td>
                 <input type="hidden" name="indexID" id="indexID"/>
                 <input type="hidden" name="itemType" id="itemType"/>
                 <input type="hidden" name="bankCode" id="bankCode"/>
                 <input type="hidden" name="itemType" id="itemType"/>
                 
                </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="8">There is no cheque detail.</td>
                </tr>
                <% } %>
				
            </tbody>
        </table></td>
    </tr>
</table>
 
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
</html:form>

</body>
</html>
