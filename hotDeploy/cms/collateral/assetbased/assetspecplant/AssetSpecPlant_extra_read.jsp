<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.common.FrequencyList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"serialNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.serial.no"/> </td>
    <td><integro:empty-if-null value="<%=iCol.getSerialNumber()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"invoiceNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.invoice.no"/> &nbsp;</td>
    <td><integro:empty-if-null value="<%=iCol.getInvoiceNumber()%>"/>&nbsp;</td>
</tr>

--%>


<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getRegistrationFee(),((oldCollateral==null)?null:oldCollateral.getRegistrationFee()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.registration.fee"/></td>
    <td><bean:write name="<%=formName %>" property="registrationFee"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"registrationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.registration.date"/></td>
    <td><% if (!(iCol.getRegistrationDate() == null)) { %>
            <integro:date object="<%=iCol.getRegistrationDate()%>"/>
       <% } %>&nbsp;</td>
</tr>

--%>
<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013-->

<%@page import="com.integrosys.cms.ui.common.UIUtil"%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isPhysicalInspection")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/><span class="mandatoryPerfection">*</span>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol.getIsPhysicalInspection()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        if (isProcess) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreq")||(iCol.getPhysicalInspectionFreq() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreqUnit");
        }
    %>
    <td class="<%=isProcess?(physicalUpdated?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
        <%if (iCol.getIsPhysicalInspection()) {%>
        &nbsp;<%--<span class="mandatory">*</span>
        --%><%}%>
    </td>
    <%if(iCol.getPhysicalInspectionFreqUnit() != null){ %>
     <td>
        <integro:common-code-single entryCode="<%=iCol.getPhysicalInspectionFreqUnit()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% } else{ %>
        <td>-&nbsp;</td>
        <%} %>
       
        
    
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.last.phy.verification.date"/><span class="mandatoryPerfection">*</span>
        <%if (iCol.getIsPhysicalInspection()) {%>
        &nbsp;<%}%></td>
        <%if(iCol.getLastPhysicalInspectDate()!=null){ %>
    <td><integro:date object="<%=iCol.getLastPhysicalInspectDate()%>"/>&nbsp;</td>
    <%}else{ %>
     <td>-&nbsp;</td>
    <%} %>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
    <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
    <%if(iCol.getNextPhysicalInspectDate()!=null){ %>
    <td><integro:date object="<%=iCol.getNextPhysicalInspectDate()%>"/>&nbsp;</td>
    <%}else{ %>
     <td>-&nbsp;</td>
    <%} %>
    
</tr>
<!--End by Pramod Katkar-->
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"brand")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span><bean:message key="label.security.asset.makebrand"/></span></td>
    <td><integro:empty-if-null value="<%=iCol.getBrand()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"modelNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span><bean:message key="label.security.asset.modelno"/></span></td>
		<%--<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ASSET_MODEL_TYPE, iCol.getModelNo())%>"/>&nbsp;</td>
--%>
<td><integro:empty-if-null value="<%=iCol.getModelNo()%>"/>&nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"yearOfManufacture")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.yearofmanufacture"/> &nbsp;</td>
    <td><bean:write name="<%=formName %>" property="yearOfManufacture"/> &nbsp</td>
    
                <%-- residualAssetLife field is used as year of installation by sachin patil --%>

    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"residualAssetLife")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.yearofinstallation"/> &nbsp;</td>
    <td><bean:write name="<%=formName %>" property="residualAssetLife"/> &nbsp</td>
    
    <%--<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetType")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.typeofplant"/> &nbsp;<bean:message key="label.mandatory"/></td>
    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PLANT_EQUIP_TYPE, iCol.getAssetType())%>"/>
		&nbsp;</td>
--%>
    <%--<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetType")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.typeofplant"/> &nbsp;<bean:message key="label.mandatory"/></td>
    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PLANT_EQUIP_TYPE, iCol.getAssetType())%>"/>
		&nbsp;</td>
--%></tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getPurchasePrice(),((oldCollateral==null)?null:oldCollateral.getPurchasePrice()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <SPAN><bean:message key="label.security.asset.purchase.price"/></SPAN> &nbsp;</td>
    <td><!--<bean:write name="<%=formName %>" property="purchasePrice"/>-->
     <%if(null!=iCol.getPurchasePrice() && !"".equals(iCol.getPurchasePrice())){ %>
    		<%=UIUtil.formatWithCommaAndDecimal(iCol.getPurchasePrice().getAmountAsBigDecimal().toPlainString()) %>
    	<%} %>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"purchaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span><bean:message key="label.security.asset.date.purchase"/></span></td>
	<td><% if (!(iCol.getPurchaseDate() == null)) { %>
            <integro:date object="<%=iCol.getPurchaseDate()%>"/>
       <% } %>&nbsp;</td>
</tr>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"residualAssetLife")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.residual.asset.life"/>
        <span id="spanASSETLIFE" >
            <bean:message key="label.mandatory"/></span></td>
    <td><bean:write name="<%=formName %>" property="residualAssetLife"/>&nbsp;
        <integro:empty-if-null value="<%=FrequencyList.getInstance().getFrequencyValue(iCol.getResidualAssetLifeUOM())%>"/></td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getScrapValue(),((oldCollateral==null)?null:oldCollateral.getScrapValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span class=stp><bean:message key="label.security.asset.residual.scrap.value"/></span>
            <!--<span id="spanSCRAPVALUE" ><bean:message key="label.mandatory"/></span>--></td>
    <td><bean:write name="<%=formName %>" property="scrapValue"/>&nbsp;</td>
</tr>

--%>

<%-- assetValue field is used for asset value at the time of collateral booking  by Scahin Patil
--%>
<%-- registrationCardNo is used as document Perfect Age dropdown value field by sachin patil--%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getAssetValue(),((oldCollateral==null)?null:oldCollateral.getAssetValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.asset.value.collat.booking"/>
        <%--<span id="spanASSETVALUE"><bean:message key="label.mandatory"/></span>
        --%></td>
    <td><!--<bean:write name="<%=formName %>" property="assetValue"/>-->
     <%if(null!=iCol.getAssetValue() && !"".equals(iCol.getAssetValue())){ %>
    <%=UIUtil.formatWithCommaAndDecimal(iCol.getAssetValue().getAmountAsBigDecimal().toPlainString()) %>
    	 <%} %>&nbsp;</td>
     
<%-- prevOwnerName field is used for inspector name  by Scahin Patil
--%>

    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"prevOwnerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.inspector.name"/> </td>
    <td><bean:write name="<%=formName %>"  property="prevOwnerName"/>&nbsp;</td><%--
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"prevFinancierName")?"fieldname":"fieldnamediff"):"fieldname"%>">
    <bean:message key="label.security.asset.previous.financier.name"/> </td>
     <td><bean:write name="<%=formName %>" property="prevFinancierName"/>&nbsp;</td>
--%>  
    
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <%--<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span class=stp><bean:message key="label.security.asset.repossession.date"/></span></td>
    <td><% if (iCol.getRepossessionDate() != null) { %>
            <integro:date object="<%=iCol.getRepossessionDate()%>"/>
		<% } %>&nbsp;</td>
    --%>
    <%-- yard is used as physical inspection dropdown value field by sachin patil--%>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionAge")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.ageofplant.equipment.date"/> </td>
    <td><bean:write name="<%=formName %>" property="repossessionAge"/>&nbsp;<bean:write name="<%=formName%>" property="yard"/></td>
   <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"docPerfectAge")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.ageofassetdoc"/> </td>
    <td><bean:write name="<%=formName %>" property="docPerfectAge"/>&nbsp;<bean:write name="<%=formName%>" property="registrationCardNo"/></td>
   
</tr>


<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span class=stp><bean:message key="label.security.asset.repossession.date"/></span></td>
    <td><% if (iCol.getRepossessionDate() != null) { %>
            <integro:date object="<%=iCol.getRepossessionDate()%>"/>
		<% } %>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionAge")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.ageofplant.equipment.date"/> </td>
    <td><bean:write name="<%=formName %>" property="repossessionAge"/>&nbsp;

<% if (iCol.getYard >= 0) { %>
            <bean:write name="<%=formName%>" property="yard"/>&nbsp;
        <% } %>       
        
        &nbsp;
        </td>
        <bean:write name="<%=formName %>" property="yard"/></td>
</tr>

--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"yard")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.yard"/> </td>
    <td> <bean:write name="<%=formName %>" property="yard"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getSalesProceed(),((oldCollateral==null)?null:oldCollateral.getSalesProceed()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.sales.proceed"/> </td>
    <td><bean:write name="<%=formName %>" property="salesProceed"/>&nbsp;</td>
</tr>

--%><%--<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
		
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.cgc.pledged"/> </td>
	<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"chattelSoldDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <span class=stp> <bean:message key="label.security.asset.date.chattel.sold"/></span>&nbsp;
	<td><integro:date object="<%=iCol.getChattelSoldDate()%>"/>&nbsp;</td>
</tr>
		
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDptradein(),((oldCollateral==null)?null:oldCollateral.getDptradein()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp> <bean:message key="label.security.asset.downpayment.tradein"/></span>&nbsp;</td>
	<td><integro:amount param="amount" amount="<%=iCol.getDptradein()%>" decimal="2" />&nbsp;</td>
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getTradeinValue(),((oldCollateral==null)?null:oldCollateral.getTradeinValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp> <bean:message key="label.security.asset.tradein.value"/></span>&nbsp;</td>
	<td><integro:amount param="amount" amount="<%=iCol.getTradeinValue()%>" decimal="2"/>&nbsp;</td>
</tr>
		
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"rlSerialNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp> <bean:message key="label.security.asset.rl.serialno"/></span>&nbsp;
	<td><integro:empty-if-null value="<%=iCol.getRlSerialNumber()%>"/>&nbsp;</td>
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDpcash(),((oldCollateral==null)?null:oldCollateral.getDpcash()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp> <bean:message key="label.security.asset.downpayment.cash"/></span>&nbsp;</td>
	<td><integro:amount param="amount" amount="<%=iCol.getDpcash()%>" decimal="2"/>&nbsp;</td>
</tr>
		
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"pubTransport")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp> <bean:message key="label.security.asset.public.transport"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
	<td><% if (iCol.getPubTransport() != null && iCol.getPubTransport().equals("Y")) {%>
				Yes &nbsp;&nbsp;
				<% } else if (iCol.getPubTransport() != null && iCol.getPubTransport().equals("N")) { %>
				No &nbsp;&nbsp;
				<% } else {%>
				&nbsp;&nbsp;
				<% } %>
			</td>
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"registrationNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp> <bean:message key="label.security.asset.registration.no"/></span>&nbsp;<span class="mandatory">*</span</td>
	<td><integro:empty-if-null value="<%=iCol.getRegistrationNo()%>"/>&nbsp;</td>
</tr>




<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"equipmf")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.equipment.mf"/>&nbsp;<bean:message key="label.mandatory"/> </td>
    <td ><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EQUIP_MF, iCol.getEquipmf())%>"/>&nbsp;</td>
    
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"equipriskgrading")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.equip.risk.grading"/> &nbsp;<bean:message key="label.mandatory"/></td>
    <td ><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EQUIP_RISK_GRADING, iCol.getEquipriskgrading())%>"/>&nbsp;</td>
</tr>
--%><%--
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">    
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"purpose")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.purpose"/> </td>
    <td ><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PLANT_EQUIP_PURPOSE, iCol.getPurpose())%>"/>&nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"equipmf")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.equipment.mf"/>&nbsp;<bean:message key="label.mandatory"/> </td>
    <td ><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EQUIP_MF, iCol.getEquipmf())%>"/>&nbsp;</td>

    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"equipriskgrading")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.equip.risk.grading"/> &nbsp;<bean:message key="label.mandatory"/></td>
    <td ><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EQUIP_RISK_GRADING, iCol.getEquipriskgrading())%>"/>&nbsp;</td>
</tr>                     --%>
<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"equipcode")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.asset.equipment.code"/>&nbsp;<bean:message key="label.mandatory"/> </td>
    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EQUIP_CODE, iCol.getEquipcode())%>"/>&nbsp;</td>
	<td class="<%if (newCollateral != null && oldCollateral != null) { %> <%=isProcess?(CompareOBUtil.compOB(newCollateral.getQuantity(),oldCollateral.getQuantity(),"amount")?"fieldname":"fieldnamediff"):"fieldname"%> <%} else { %>'fieldname'<%} %>">
        <bean:message key="label.security.asset.quantity"/></td>
    <td><bean:write name="<%=formName %>" property="quantity"/>&nbsp;</td>
</tr>
--%><script language="JavaScript" type="text/JavaScript">
<!--
function setGoodStaus(val){
    if (val == 'N') {
        document.getElementById("spanASSETLIFE").style.visibility = "hidden";
        document.getElementById("spanSCRAPVALUE").style.visibility = "hidden";
        document.getElementById("spanASSETVALUE").style.visibility = "hidden";
    }  else{
        document.getElementById("spanASSETLIFE").style.visibility = "visible";
        document.getElementById("spanSCRAPVALUE").style.visibility = "visible";
        document.getElementById("spanASSETVALUE").style.visibility = "visible";
    }
}

<%
    String  goodStatus = iCol.getGoodStatus();

    if  (goodStatus != null) {
        goodStatus =goodStatus.trim() ;
    }else{
        goodStatus = "N" ;
    }

%>

//var goodStatus = "<%=goodStatus%>";
//setGoodStaus(goodStatus);

-->
</script>





