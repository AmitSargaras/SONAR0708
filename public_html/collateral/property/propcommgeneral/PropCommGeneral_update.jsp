<%--Beatified by jj --%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comgeneral.ICommercialGeneral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.property.RankList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory,
                 com.integrosys.cms.ui.dataprotection.DataProtectionConstants,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.property.propcommgeneral.PropCommGeneralForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propcommgeneral/PropCommGeneral_update.jsp,v 1.89 2006/11/23 03:01:06 jzhan Exp $
     *
     * Purpose: Update Collateral
     * Description: Type - Property, Subtype - General Commercial
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.89 $
     * Date: $Date: 2006/11/23 03:01:06 $
     * Tag: $Name: DEV_20061123_B286V1 $
     */
%>

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj");

    ICommercialGeneral iCol = (ICommercialGeneral) itrxValue.getStagingCollateral();
    pageContext.setAttribute("obj", iCol);

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String subtype = "PropCommGeneral";
    String prefix = "Property";
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String prefix1 = "Property";
    PropCommGeneralForm colForm = (PropCommGeneralForm) request.getAttribute(formName);

    String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.from");
    
    int policiesLength = iCol.getInsurancePolicies().length;
    
    String insuranceCheck1 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCheck");
    
    Boolean checklistIsActive = (Boolean)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.checklistIsActive");
    String cersaiApplicableIndup =(String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cersaiApplicableInd");
    String otherChecklistCountPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.otherChecklistCountPartyName");
    System.out.println("otherChecklistCountPartyName======>>>>>"+otherChecklistCountPartyName);
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">

function submitPage(num, index) {
    enableAllFormElements();
   /* selectAllOptions(document.forms[0].secInstrument);*/
/*    if(num == 1 || num == 2){
		var valuation2Mandatory = document.getElementById('valuation2Mandatory');
		var valcreationdate_v2 = document.getElementById('valcreationdate_v2').value;
		if(valuation2Mandatory && valuation2Mandatory.value == 'Y'){
			if(!valcreationdate_v2 || valcreationdate_v2 ==''){
				alert("You must require to add VALUATION 2");
				return;
			}
		}
   } */
   var  otherChecklistCountPartyName1 = '<%=otherChecklistCountPartyName%>';
   if (num == 1) {
    	if(<%=insuranceCheck1.equalsIgnoreCase("no")%>){
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	} else if(<%=policiesLength%> > 0){
    		<% if(checklistIsActive){%>
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    		newShowSilkScreen();
    	    <%}else{%>
    		alert("Please approve the other checklist for given party.Party Pending for checker authorization=>"+otherChecklistCountPartyName1);
    	    <%}%>
    	}else{
    		alert("Please Add the Insurance Details");
    	}
    }
    if (num == 2) {
        document.forms[0].event.value = "update";
        document.forms[0].submit();
    }
    if (num == 3) {
        document.forms[0].event.value = "prepare";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 4) {
        document.forms[0].event.value = "prepare_update_sub";
        document.forms[0].indexID.value = index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 5) {
        document.forms[0].event.value = "itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 6) {
        /* document.forms[0].event.value = "prepare"; */
        document.forms[0].event.value = "maker_add_insurance";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 7) {
        document.forms[0].event.value = "prepare_update_sub";
        document.forms[0].indexID.value = index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 8) {
        document.forms[0].event.value = "itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
	if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    	 document.forms[0].submit();
    }
	if (num == 10) {
        /* document.forms[0].event.value = "prepare"; */
        document.forms[0].event.value = "maker_add_addfacdocdet";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.ADD_DOC_FAC_DET_INFO%>";
        document.forms[0].submit();
    }
	if (num == 11) {
	    document.forms[0].event.value = "prepare_update_sub";
	    document.forms[0].indexID.value = index;
	    document.forms[0].itemType.value = "<%=CollateralConstant.ADD_DOC_FAC_DET_INFO%>";
	    document.forms[0].submit();
	}
	if (num == 12) {
	    document.forms[0].event.value = "itemDelete";
	    document.forms[0].itemType.value = "<%=CollateralConstant.ADD_DOC_FAC_DET_INFO%>";
	    document.forms[0].submit();
	}
    
   

}

</script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="PropCommGeneralCollateral.do">
    <input type="hidden" name="event">
    <input type="hidden" name="indexID"/>
    <input type="hidden" name="subtype" value="PropCommGeneral"/>
    <input type="hidden" name="subTypeCode" value="<%=subtypeCode%>"/>
    <input type="hidden" name="itemType"/>
    <input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
		<td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.property.title.create"/>
			<% } else { %>
				<bean:message key="label.security.property.title.edit"/>
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
            <p class="deletedItem"> DELETED </p>
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<% try { %>
<%@ include file="/collateral/property/update_common_propertyVal.jsp" %>   
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>

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
<script>
  if (document.forms[0].isPhysInsp[0].checked)
  {
     setPhysInsp('1');
  }
</script>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>
<script language="Javascript" type="text/javascript">
    	window.onload = function(){
    		//alert("mortgageCreationAdd:"+document.getElementById("mortgageCreationAdd").value);
    		var flagMortgage=document.getElementById("mortgageCreationAdd").value;
    		if(flagMortgage=='preMortDdTrue'){
    			document.getElementById("salePurchareAmount").disabled =true;
    	 		 document.getElementById("Image1LegalAuditDate").disabled =true;
    	 		document.getElementById("Image1IntervPeriSearchdate").disabled =true; 
    	 	/*	  document.getElementById("Image1LegalAuditDate").setAttribute('disabled', 'true');
    	 		document.getElementById("Image1IntervPeriSearchdate").setAttribute('disabled', 'true'); */
    	 		document.getElementById("typeOfMargage").disabled =true; 
    	 		<% if(ICMSConstant.YES.equals(cersaiApplicableIndup)){%>
    	 		 document.getElementById("dateOfCersaiRegisterationImg").disabled =true;
    	 		//document.getElementById("dateOfCersaiRegisterationImg").setAttribute('disabled', 'true');
    	 		document.getElementById("cersaiId").disabled =true;
    	 		document.getElementById("cersaiTransactionRefNumber").disabled =true; 
    	 		<%}%>
    		}
    		
    		
    		var val1_idVar=document.getElementById("val1_id").value;
    		if(val1_idVar ==''){
    			document.getElementById("ImageValuationDate_v1").disabled =false; 
    		}
    		else{
    			document.getElementById("ImageValuationDate_v1").disabled =true; 
    		}
    		
    		var val2_idVar=document.getElementById("val2_id").value;
    		if(val2_idVar ==''){
    			document.getElementById("ImageValuationDate_v2").disabled =false; 
    		}
    		else{
    			document.getElementById("ImageValuationDate_v2").disabled =true; 
    		}
    		
    		var val3_idVar=document.getElementById("val3_id").value;
    		if(val3_idVar ==''){
    			document.getElementById("ImageValuationDate_v3").disabled =false; 
    		}
    		else{
    			document.getElementById("ImageValuationDate_v3").disabled =true; 
    		}
    	}
    	dispAmtInWords();
    </script>
</body>
</html>
