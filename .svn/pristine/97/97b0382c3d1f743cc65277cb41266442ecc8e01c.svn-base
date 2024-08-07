<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralSearchForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.VehicleTypeList" %>
<%@ page import="java.util.List" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%
    CollateralSearchForm advanceAssetForm = (CollateralSearchForm) request.getAttribute("CollateralSearchForm");
    String secSubTypeAsset = "";
    if (advanceAssetForm != null) {
        secSubTypeAsset = advanceAssetForm.getSecuritySubType();
    }

%>

<table class="tblInput" width="100%" border="0" cellspacing="0" cellpadding="0">

<% if (ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH.equals(secSubTypeAsset)) { %>
<tr class="odd">
    <td width="40%" class="fieldname"><bean:message key="label.security.asset.vehicletype"/> </td>
    <td width="60%">
        <html:select property="vehType">
            <option value="" selected><bean:message key="label.please.select"/></option>
            <html:options name="vehicleID" labelName="vehicleValue"/>
        </html:select>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.asset.registration.no"/></td>
    <td><html:text property="regN0" maxlength="10"/></td>
</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.asset.chassisno"/></td>
    <td>
        <html:text property="chassissNo" maxlength="25" size="30"/>
    </td>
</tr>

<% } else if (ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_GOLD.equals(secSubTypeAsset)) { %>

<tr class="odd">
    <td width="40%" class="fieldname"><bean:message key="label.security.gold.type"/></td>
    <td width="60%">
        <html:select property="itemType">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="goldTypeValue" labelName="goldTypeLabel"/>
        </html:select>&nbsp;
        <html:errors property="itemType"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.purchase.receipt.num"/></td>
    <td>
        <html:text property="purchaseReceiptNo" maxlength="40"/>&nbsp;
        <html:errors property="purchaseReceiptNo"/>
    </td>
</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.gold.grade"/></td>
    <td>
        <html:select property="goldGrade">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="goldGradeValue" labelName="goldGradeLabel"/>
        </html:select>&nbsp;
        <html:errors property="goldGrade"/>
    </td>
</tr>

<% } else if (ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_PLANT.equals(secSubTypeAsset)) { %>

<tr class="odd">
    <td width="40%" class="fieldname"><bean:message key="label.security.asset.typeofplant"/></td>
    <td width="60%">
        <html:select property="assetType">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="plantEquipID" labelName="plantEquipValue"/>
        </html:select>
        &nbsp;<html:errors property="assetType"/>
    </td>
</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.asset.yearofmanufacture"/></td>
    <td>
        <html:text property="yearOfManufacture" maxlength="15"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.asset.modelno"/></td>
    <td><html:text property="modelNo" maxlength="15"/>
        &nbsp;<html:errors property="modelNo"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.serial.no"/> </td>
    <td>
        <html:text property="serialNo" maxlength="40"/>&nbsp;
        <html:errors property="serialNo"/>
    </td>
</tr>
<% } else if (ICMSConstant.COLTYPE_ASSET_VESSEL.equals(secSubTypeAsset)) { %>

<tr class="odd">
    <td width="40%" class="fieldname"><bean:message key="label.security.vessel.type"/> </td>
    <td width="60%">
        <html:select property="assetType">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="vesselID" labelName="vesselValue"/>
        </html:select>
        <html:errors property="assetType"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.flag.register"/> </td>
    <td>
        <html:select property="flagRegistered">
            <option value="" selected><bean:message key="label.please.select"/></option>
			<html:options name="countryValue" labelName="countryLabel"/>
		</html:select>
    </td>
</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.built.year"/> </td>
    <td>
        <html:text property="builtYear" maxlength="15"/>
        &nbsp;<html:errors property="builtYear"/>
    </td>
</tr>

<% } else if ((ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_AIRCRAFT.equals(secSubTypeAsset))
        || ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_AIRCRAFT_REG_JET.equals(secSubTypeAsset)
        || ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_AIRCRAFT_FREIGHT.equals(secSubTypeAsset)
        ) { %>

<tr class="odd">
    <td width="40%" class="fieldname"><bean:message key="label.security.asset.aircraft.type"/> </td>
    <td width="60%">
         <html:select property="assetType">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="aircraftValues" labelName="aircraftLabels"/>
        </html:select>&nbsp;
        <html:errors property="assetType"/>
		<%--
        <html:text property="aircraftType" maxlength="50"/>&nbsp;
        <html:errors property="aircraftType"/>
		--%>
    </td>
</tr>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.security.asset.yearofmanufacture"/></td>
    <td>
        <html:text property="yearOfManufacture" maxlength="15"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.security.asset.modelno"/></td>
    <td><html:text property="modelNo" maxlength="15"/>
        &nbsp;<html:errors property="modelNo"/>
    </td>
</tr>
<% }%>
</table>



