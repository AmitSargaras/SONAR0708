<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"registrationNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.registration.no"/><bean:message key="label.mandatory"/> </td>
    <td><integro:empty-if-null value="<%=iCol.getRegistrationNo()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"registrationCardNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.registrationcard.no"/> </td>
    <td><integro:empty-if-null value="<%=iCol.getRegistrationCardNo()%>"/>&nbsp;</td>
</tr>


<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getRegistrationFee(),((oldCollateral==null)?null:oldCollateral.getRegistrationFee()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.registration.fee"/></td>
    <td><integro:amount param="amount" amount="<%=iCol.getRegistrationFee()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"registrationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.registration.date"/></td>
    <td>
        <integro:date object="<%=iCol.getRegistrationDate()%>"/>&nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getCoe(),((oldCollateral==null)?null:oldCollateral.getCoe()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.coe"/></td>
    <td colspan="3">
        <bean:write name="AssetSpecVehiclesForm" property="coe"/>
        &nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getAmtCollectedFromSales(),((oldCollateral==null)?null:oldCollateral.getAmtCollectedFromSales()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.amt.collected.frm.sales"/></td>
    <td colspan="3">
        <bean:write name="AssetSpecVehiclesForm" property="amtCollectedFromSales"/>
        &nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"yearOfManufacture")?"fieldname":"fieldnamediff"):"fieldname"%>">
    <bean:message key="label.security.asset.yearofmanufacture"/> <bean:message key="label.mandatory"/></td>
    <td><bean:write name="AssetSpecVehiclesForm" property="yearMfg"/>
    </td>
    
    
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"brand")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.brand"/> </td>
    <td ><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_BRAND, iCol.getBrand())%>"/>&nbsp;</td>
    
    
   
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"modelNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.model"/>&nbsp;<font color="#0000FF">* </font></td>
    <td><integro:empty-if-null value="<%=iCol.getModelNo()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetType")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.vehicletype"/> <font color="#0000FF">* </font></td>
    <td>
        <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_TYPE, iCol.getAssetType())%>"/>
           &nbsp;</td>
</tr>


<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getPurchasePrice(),((oldCollateral==null)?null:oldCollateral.getPurchasePrice()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.purchase.price"/>
        &nbsp;<bean:message key="label.mandatory"/>
    </td>
    <td><integro:amount param="amount" amount="<%=iCol.getPurchasePrice()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"purchaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.purchase.date"/> </td>
    <td>
        <integro:date object="<%=iCol.getPurchaseDate()%>"/>&nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"residualAssetLife")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.residual.asset.life"/>
    <span id="spanASSETLIFE" >
            <bean:message key="label.mandatory"/></span></td>
    <td>
	<bean:write name="AssetSpecVehiclesForm" property="residualAssetLife"/>&nbsp;

	<integro:empty-if-null value="<%=FrequencyList.getInstance().getFrequencyValue(iCol.getResidualAssetLifeUOM())%>"/>
	</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getScrapValue(),((oldCollateral==null)?null:oldCollateral.getScrapValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.residual.scrap.value"/>
        <span id="spanSCRAPVALUE" >
            <bean:message key="label.mandatory"/></span></td>
    <td><bean:write name="AssetSpecVehiclesForm" property="scrapValue"/>&nbsp; </td>
</tr>


 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getAssetValue(),((oldCollateral==null)?null:oldCollateral.getAssetValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.asset.value"/>
        <span id="spanASSETVALUE" >
            <bean:message key="label.mandatory"/></span>
        </td>
    <td><bean:write name="AssetSpecVehiclesForm" property="assetValue"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"docPerfectAge")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.ageofasset"/></td>
    <td><bean:write name="AssetSpecVehiclesForm" property="docPerfectAge"/>&nbsp;Year(s)</td>
</tr>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"chassisNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.chassisno"/> <font color="#0000FF">* </font></td>
    <td><integro:empty-if-null value="<%=iCol.getChassisNumber()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"engineNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.engine.no"/></td>
    <td><integro:empty-if-null value="<%=iCol.getEngineNo()%>"/>&nbsp;</td>
</tr>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"transType")?"fieldname":"fieldnamediff"):"fieldname"%>">
       <bean:message key="label.security.asset.transmission.type"/>&nbsp;
    </td>
    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.TRANSMISSION_TYPE, iCol.getTransType())%>"/>&nbsp;</td>
    <td class="fieldname">&nbsp;</td>
    <td>&nbsp;</td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"horsePower")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.hp.power"/> </td>
    <td><bean:write name="AssetSpecVehiclesForm" property="horsePower"/>&nbsp;</td>
	<td class="fieldname">&nbsp;</td>
	<td>&nbsp;</td>
</tr>


 <!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"prevOwnerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.previous.owner.name"/></td>
    <td><integro:empty-if-null value="<%=iCol.getPrevOwnerName()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"prevFinancierName")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.previous.financier.name"/></td>
     <td><integro:empty-if-null value="<%=iCol.getPrevFinancierName()%>"/>&nbsp;</td>
</tr>-->


 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.repossession.date"/> </td>
    <td>
        <integro:date object="<%=iCol.getRepossessionDate()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionAge")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.ageofvehicle.repossession.date"/></td>
    <td><bean:write name="AssetSpecVehiclesForm" property="repossessionAge"/>&nbsp;</td>
</tr>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"yard")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.yard"/></td>
    <td><integro:empty-if-null value="<%=iCol.getYard()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getSalesProceed(),oldCollateral.getSalesProceed(),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.sales.proceed"/></td>
    <td><bean:write name="AssetSpecVehiclesForm" property="salesProceed"/>&nbsp;</td>
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iindicator")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.insurance.indicator"/>
        &nbsp;<bean:message key="label.mandatory"/>
    </td>
    <td><% if (iCol.getIindicator() != null && iCol.getIindicator().equals("Y")) {%>
                Yes &nbsp;&nbsp;
                <% } else if (iCol.getIindicator() != null && iCol.getIindicator().equals("N")) { %>
                No &nbsp;&nbsp;
                <% } else {%>
                &nbsp;&nbsp;
                <% } %>
            </td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralfee")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.collateral.fee"/>&nbsp;
        <bean:message key="label.mandatory"/></td>
    <td><% if (iCol.getCollateralfee() != null && iCol.getCollateralfee().equals("Y")) {%>
                Yes &nbsp;&nbsp;
                <% } else if (iCol.getCollateralfee() != null && iCol.getCollateralfee().equals("N")) { %>
                No &nbsp;&nbsp;
                <% } else {%>
                &nbsp;&nbsp;
                <% } %>
            </td>
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDptradein(),((oldCollateral==null)?null:oldCollateral.getDptradein()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.downpayment.tradein"/>&nbsp;
        <bean:message key="label.mandatory"/></td>
    <td><integro:amount param="amount" amount="<%=iCol.getDptradein()%>"/>&nbsp;</td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDpcash(),((oldCollateral==null)?null:oldCollateral.getDpcash()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.downpayment.cash"/>&nbsp;
        <bean:message key="label.mandatory"/>
        </td>
   <td><integro:amount param="amount" amount="<%=iCol.getDpcash()%>"/>&nbsp;</td>
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getFcharges(),((oldCollateral==null)?null:oldCollateral.getFcharges()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.freight.charges"/>&nbsp;
        <bean:message key="label.mandatory"/></td>
    <td><integro:amount param="amount" amount="<%=iCol.getFcharges()%>"/>&nbsp;</td>
    
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getPlist(),((oldCollateral==null)?null:oldCollateral.getPlist()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.price.list"/>&nbsp;
        <bean:message key="label.mandatory"/>
        </td>
   <td><integro:empty-if-null value="<%=aForm.getPlist()%>"/>&nbsp;</td>
   
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"heavyvehicle")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.heavyvehicle.type"/></td>
    <td><% if (iCol.getHeavyvehicle() != null && iCol.getHeavyvehicle().equals("Y")) {%>
                Yes &nbsp;&nbsp;
                <% } else if (iCol.getHeavyvehicle() != null && iCol.getHeavyvehicle().equals("N")) { %>
                No &nbsp;&nbsp;
                <% } else {%>
                &nbsp;&nbsp;
                <% } %>
            </td>
    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"pubtransport")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.public.transport"/>&nbsp;
        <bean:message key="label.mandatory"/></td>
    <td><% if (iCol.getPubtransport() != null && iCol.getPubtransport().equals("Y")) {%>
                Yes &nbsp;&nbsp;
                <% } else if (iCol.getPubtransport() != null && iCol.getPubtransport().equals("N")) { %>
                No &nbsp;&nbsp;
                <% } else {%>
                &nbsp;&nbsp;
                <% } %>
            </td>
</tr>


<script language="JavaScript" type="text/JavaScript">
<!--
function setGoodStaus(val){
    if (val == 'N' || val =='') {
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
    }
%>

//var goodStatus = "<%=goodStatus%>";
//setGoodStaus(goodStatus);

-->
</script>


