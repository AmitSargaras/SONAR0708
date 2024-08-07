<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.registration.no"/> <bean:message key="label.mandatory"/></td>
    <td><html:text property="regNo" maxlength="15"/>&nbsp;
        <html:errors property="regNo"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.registrationcard.no"/> </td>
    <td><html:text property="registrationCardNo" maxlength="20"/>&nbsp;
        <html:errors property="registrationCardNo"/>
    </td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.registration.fee"/></td>
    <td>
        <html:text property="regFee" maxlength="20"/>&nbsp;
        <html:errors property="regFee"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.registration.date"/></td>
    <td>
        <html:text property="regDate" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
             onclick="showCalendar('regDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
             onmouseout="MM_swapImgRestore()"/>&nbsp;
        <html:errors property="regDate"/>
    </td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
        <bean:message key="label.security.coe"/></td>
    <td colspan="3">
        <html:text property="coe" maxlength="15"/>&nbsp;
        <html:errors property="coe"/>
    </td>
</tr>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname"><bean:message key="label.security.asset.amt.collected.frm.sales"/>
	</td>
	<td>
		<html:text property="amtCollectedFromSales" maxlength="15"/>
	</td>
	<td class="fieldname">&nbsp;</td>
	<td>&nbsp;</td>
 </tr>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.yearofmanufacture"/> <bean:message key="label.mandatory"/></td>
    <td>
        <html:text property="yearMfg" maxlength="4" onkeyup="YearCalculate()" />&nbsp;
        <html:errors property="yearMfg"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.brand"/> <bean:message key="label.mandatory"/></td>
    <td>
                <html:select property="brand" >
                    <option value=""><bean:message key="label.please.select"/></option>
                   <html:options name="brandID" labelName="brandValue"/>
                </html:select>&nbsp;
                <html:errors property="brand"/></td>
    
    
</tr>

 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.model"/> &nbsp;<font color="#0000FF">* </font></td>
    <td><html:text property="modelNo" maxlength="50"/>&nbsp;
        <html:errors property="modelNo"/>
    </td>
    <td class="tooltips"><bean:message key="label.security.asset.vehicletype"/><span class="style2">&nbsp;<bean:message key="label.mandatory"/>
    <a href="#"><font color="#0000FF" style="text-decoration:none">Host Ref.<span class="Float"><integro:empty-if-null value="<%=iCol.getAssetTypeHostRef()%>"/></span></a></td>
	
    <td>
        <html:select property="assetType">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="vehicleID" labelName="vehicleValue"/>
        </html:select>&nbsp;
        <html:errors property="assetType"/>
    </td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.purchase.price"/>
    &nbsp;<bean:message key="label.mandatory"/>
	</td>
    <td><html:text property="purchasePrice" maxlength="15"/>&nbsp;
        <html:errors property="purchasePrice"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.purchase.date"/> </td>
    <td><html:text property="datePurchase" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
             onclick="showCalendar('datePurchase', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
             onmouseout="MM_swapImgRestore()"/>&nbsp;
        <html:errors property="datePurchase"/>
    </td>
</tr>
 <!--Mandatory if goodstatus is not New-->
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.residual.asset.life"/>
        <span id="spanASSETLIFE" >
            <bean:message key="label.mandatory"/></span></td>
    <td><html:text property="residualAssetLife" maxlength="4" disabled="true"/>&nbsp;
        <html:errors property="residualAssetLife"/>
        <html:select property="residualAssetLifeUOM" disabled="true">
            <html:option value=""><bean:message key="label.please.select"/></html:option>
            <html:options name="freqID" labelName="freqValue"/>
        </html:select>
        <html:errors property="residualAssetLifeUOM"/>
    </td>
     <!--Mandatory if goodstatus is not New. Defaulted to 0.-->
    <td class="fieldname"><bean:message key="label.security.asset.residual.scrap.value"/>&nbsp;
        <span id="spanSCRAPVALUE" >
            </span><bean:message key="label.mandatory"/>
         </td>
    <td><html:text property="scrapValue" maxlength="15"/>&nbsp;
        <html:errors property="scrapValue"/>
    </td>
</tr>
<!--Mandatory if goodstatus is not New-->
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.asset.value"/>&nbsp;
        <span id="spanASSETVALUE" >
            <bean:message key="label.mandatory"/></span>
        </td>
    <td><html:text property="assetValue" maxlength="15"/>&nbsp;
        <html:errors property="assetValue"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.ageofasset"/> </td>
    <td><html:text property="docPerfectAge" maxlength="5" readonly="true"/>&nbsp;Year(s)
        <html:errors property="docPerfectAge"/></td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.chassisno"/> <font color="#0000FF">* </font></td>
<td><html:text property="chassisNumber" maxlength="20"/>&nbsp;
    <html:errors property="chassisNumber"/></td>
<td class="fieldname"><bean:message key="label.security.asset.engine.no"/></td>
<td><html:text property="engineNo" maxlength="20"/>&nbsp;
    <html:errors property="engineNo"/></td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.transmission.type"/> </td>
    <td>
        <html:select property="transType">
            <option value=""><bean:message key="label.please.select"/></option>
           <html:options name="transTypeID" labelName="transTypeValue"/>
        </html:select>&nbsp;
        </td>
    <td class="fieldname"> <bean:message key="label.security.asset.energy.source"/> </td>
<td><html:text property="energySource" maxlength="15"/>&nbsp;
    <html:errors property="energySource"/></td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.hp.power" /></td>
<td><html:text property="horsePower" maxlength="20"/>&nbsp;
    <html:errors property="horsePower"/></td>
<td class="fieldname"> <bean:message key="label.security.asset.color"/> </td>
<td><html:text property="vehColor" maxlength="10"/>&nbsp;
    <html:errors property="vehColor"/></td>
</tr>

 <!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.previous.owner.name"/></td>
    <td><html:text property="prevOwnerName" maxlength="50"/></td>
    <td class="fieldname"><bean:message key="label.security.asset.previous.financier.name"/></td>
    <td><html:text property="prevFinancierName" maxlength="50"/></td>
</tr>-->
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.repossession.date"/> </td>
    <td><html:text property="repossessionDate" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
             onclick="showCalendar('repossessionDate', 'dd/mm/y')"
             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
             onmouseout="MM_swapImgRestore()"/>&nbsp;
        <html:errors property="repossessionDate"/>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.ageofvehicle.repossession.date"/></td>
    <td><html:text property="repossessionAge" maxlength="5"/>&nbsp;
        <html:errors property="repossessionAge"/></td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.yard"/></td>
    <td><html:text property="yard" maxlength="40"/></td>
    <td class="fieldname"><bean:message key="label.security.asset.sales.proceed"/></td>
    <td><html:text property="salesProceed" maxlength="15"/>&nbsp;
        <html:errors property="salesProceed"/></td>
</tr>
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.insurance.indicator"/>&nbsp;
    <bean:message key="label.mandatory"/></td>
    <td>
                <html:radio property="iindicator" value="Y"><bean:message key="label.common.yes"/></html:radio>
                <html:radio property="iindicator" value="N"><bean:message key="label.common.no"/></html:radio>
                <html:errors property="iindicator"/>
              </td>
    <td class="fieldname"><bean:message key="label.security.asset.collateral.fee"/>&nbsp;
    	<bean:message key="label.mandatory"/></td>
    <td>
                <html:radio property="collateralfee" value="Y"><bean:message key="label.common.yes"/></html:radio>
                <html:radio property="collateralfee" value="N"><bean:message key="label.common.no"/></html:radio>
                <html:errors property="collateralfee"/>
              </td>
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.downpayment.tradein"/>&nbsp;
    	<bean:message key="label.mandatory"/></td>
    <td><html:text property="dptradein" maxlength="40"/>
    <html:errors property="dptradein"/></td>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.downpayment.cash"/>&nbsp;
    	<bean:message key="label.mandatory"/></td>
    <td><html:text property="dpcash" maxlength="15"/>
    <html:errors property="dpcash"/></td>
        </td>
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.freight.charges"/>&nbsp;
    	<bean:message key="label.mandatory"/></td>
    <td><html:text property="fcharges" maxlength="40"/>
    <html:errors property="fcharges"/></td>
    </td>
    <td class="fieldname"><bean:message key="label.security.asset.price.list"/>&nbsp;
    	<bean:message key="label.mandatory"/></td>
    <td><html:text property="plist" maxlength="15"/>&nbsp;
    <html:errors property="plist"/></td>
        </td>
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.heavyvehicle.type"/></td>
    <td>
                <html:radio property="heavyvehicle" value="Y"><bean:message key="label.common.yes"/></html:radio>
                <html:radio property="heavyvehicle" value="N"><bean:message key="label.common.no"/></html:radio>
                <html:errors property="heavyvehicle"/>
              </td>
    <td class="fieldname"><bean:message key="label.security.asset.public.transport"/>&nbsp;
    	<bean:message key="label.mandatory"/></td>
    <td>
                <html:radio property="pubtransport" value="Y"><bean:message key="label.common.yes"/></html:radio>
                <html:radio property="pubtransport" value="N"><bean:message key="label.common.no"/></html:radio>
                <html:errors property="pubtransport"/>
              </td>
        </td>
</tr>


<script language="JavaScript" type="text/JavaScript">

 <!--
    function setGoodStatus(val){
            /*if (val == 'N') {
                document.getElementById("spanASSETLIFE").style.visibility = "hidden";
                document.getElementById("spanSCRAPVALUE").style.visibility = "hidden";
                document.getElementById("spanASSETVALUE").style.visibility = "hidden";
             }else {
                document.getElementById("spanASSETLIFE").style.visibility = "visible";
                document.getElementById("spanSCRAPVALUE").style.visibility = "visible";
                document.getElementById("spanASSETVALUE").style.visibility = "visible";
            }*/
    }

    var goodStatus = "<%=colForm.getGoodStatus()%>";
    setGoodStatus(goodStatus);

 -->

</script>


