<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="java.util.Iterator"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
	int rowIdx = Integer.parseInt(request.getParameter("rowIdx"));
%>

<tr>
<td colspan="2">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td width="20%"  class="fieldname"><bean:message key="label.security.vessel.type"/>&nbsp;<bean:message key="label.mandatory"/> </td>
        <td width="30%">
             <html:select property="assetType">
                <option value=""><bean:message key="label.please.select"/></option>
                <html:options name="vesselID" labelName="vesselValue"/>
            </html:select>
            <html:errors property="assetType"/>
        <td class="fieldname"><bean:message key="label.security.vessel.name"/></td>
        <td><html:text property="vesselName" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselName"/>&nbsp;</td>
    </tr>
	
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.port.reg"/> </td>
        <td><html:select property="regCountry">
                <option value=""><bean:message key="label.please.select"/></option>
                <html:options name="countryValue" labelName="countryLabel"/>
            </html:select>
            <html:errors property="regCountry"/></td>
        <td class="fieldname"><bean:message key="label.security.vessel.state"/> </td>
        <td><html:select property="vesselState">
                <option value=""><bean:message key="label.please.select"/></option>
                <html:options name="vesselStateValue" labelName="vesselStateLabel"/>
            </html:select>
            <html:errors property="vesselState"/>&nbsp;</td>
    </tr>

    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.asset.insurer"/> </td>
        <td><html:select property="insurers">
                <integro:common-code categoryCode="<%=CategoryCodeConstant.INSURER_NAME%>" />
            </html:select>&nbsp
            <html:errors property="insurers"/></td>
        <td class="fieldname"><bean:message key="label.security.asset.registration.date"/> </td>
        <td><html:text property="regDate" readonly="true"/>
                    <img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('regDate', 'dd/mm/y')"
                    onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
            <html:errors property="regDate"/>&nbsp;</td>
    </tr>

    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.expected.occupancy.date"/> </td>
        <td><html:text property="vesselExptOccupDate" readonly="true"/>
                    <img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('vesselExptOccupDate', 'dd/mm/y')"
                    onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
            <html:errors property="vesselExptOccupDate"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.expected.occupancy"/></td>
        <td><html:text property="vesselExptOccup" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselExptOccup"/>&nbsp;</td>
    </tr>

    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.occupancy.type"/> </td>
        <td><html:select property="vesselOccupType">
                <option value="" selected><bean:message key="label.please.select"/></option>
                <html:options name="occupancyValue" labelName="occupancyLabel"/>
            </html:select> &nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.built.year"/> &nbsp;<bean:message key="label.mandatory"/></td>
        <td><html:select property="vesselBuildYear" onclick="YearCalculate()">
                <option value="" selected><bean:message key="label.please.select"/></option>
                <html:options name="yearValue" labelName="yearLabel"/>
            </html:select> &nbsp;
           <html:errors property="vesselBuildYear"/></td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.builder"/></td>
        <td><html:text property="vesselBuilder" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselBuilder"/>&nbsp;</td>
        <td class="fieldname"> <bean:message key="label.security.main.reg"/> </td>
        <td><html:text property="vesselMainReg" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselMainReg"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.length"/></td>
        <td><html:text property="vesselLength" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselLength"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.width"/></td>
        <td><html:text property="vesselWidth" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselWidth"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.secrity.depth"/></td>
        <td><html:text property="vesselDepth" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselDepth"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.deck.load"/></td>
        <td><html:text property="vesselDeckLoading" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselDeckLoading"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.deck.weight"/> </td>
        <td><html:text property="vesselDeckWeight" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselDeckWeight"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.side.board"/> </td>
        <td><html:text property="vesselSideBoard" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselSideBoard"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.bow"/></td>
        <td><html:text property="vesselBOW" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselBOW"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.deck"/></td>
        <td><html:text property="vesselDECK" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselDECK"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"> <bean:message key="label.security.deck.thickness"/> </td>
        <td><html:text property="vesselDeckThickness" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselDeckThickness"/>&nbsp;</td>
        <td class="fieldname"> <bean:message key="label.security.bottom"/></td>
        <td><html:text property="vesselBottom" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselBottom"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.winch.drive"/> </td>
        <td><html:text property="vesselWinchDrive" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselWinchDrive"/>&nbsp;</td>
        <td class="fieldname"> <bean:message key="label.security.bhp"/></td>
        <td><html:text property="vesselBHP" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselBHP"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.speed"/></td>
        <td><html:text property="vesselSpeed" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselSpeed"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.vessel.use"/> </td>
        <td><html:text property="vesselUse" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselUse"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.anchor"/></td>
        <td><html:text property="vesselAnchor" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselAnchor"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.anchor.drive"/> </td>
        <td><html:text property="vesselAnchorDrive" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselAnchorDrive"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.place.construction"/> </td>
        <td><html:select property="vesselConstructPlace" >
                <option value="" selected><bean:message key="label.please.select"/></option>
               <html:options name="countryValue" labelName="countryLabel"/>
            </html:select>&nbsp;
            <html:errors property="vesselConstructPlace"/></td>
        <td class="fieldname"><bean:message key="label.security.country.construction"/> </td>
        <td><html:select property="vesselConstructCountry" >
                <option value="" selected><bean:message key="label.please.select"/></option>
               <html:options name="countryValue" labelName="countryLabel"/>
            </html:select>&nbsp;
            <html:errors property="vesselConstructCountry"/></td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.charter.contract"/> </td>
        <td><html:radio property="vesselCharterContract" value="true" ><bean:message key="label.common.yes"/></html:radio> &nbsp;&nbsp;
             <html:radio property="vesselCharterContract"  value="false" ><bean:message key="label.common.no"/></html:radio>&nbsp;
              <html:errors property="vesselCharterContract"/></td>
        <td class="fieldname"> <bean:message key="label.security.charterer.name"/> </td>
        <td><html:text property="vesselChartererName" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselChartererName"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.charter.period"/> </td>
        <td><html:text property="vesselCharterPeriod" size="30" maxlength="50"/>
			&nbsp;<html:errors property="vesselCharterPeriod"/>
			<html:select property="vesselCharterPeriodUnit">
                <html:option value=""><bean:message key="label.please.select"/></html:option>
				<html:option value="M">Months</html:option>
				<html:option value="Y">Years</html:option>
			</html:select>
            <html:errors property="vesselCharterPeriodUnit"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.class.society"/> </td>
        <td><html:text property="vesselClassSociety" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselClassSociety"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.charter.amount"/> </td>
        <td><html:text property="vesselCharterAmt" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselCharterAmt"/>&nbsp;</td>
        <td class="fieldname"><bean:message key="label.security.charter.currency"/> </td>
        <td><html:select property="vesselCharterCurrency">
                <option value=""><bean:message key="label.please.select"/></option>
                <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
			<html:errors property="vesselCharterCurrency"/></td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.charter.rate"/> </td>
        <td><html:select property="vesselCharterRateUnit" >
                <option value="" selected><bean:message key="label.please.select"/></option>
               <html:options name="vesselCharterRateUnitValue" labelName="vesselCharterRateUnitLabel"/>
            </html:select>&nbsp;
            <html:errors property="vesselCharterRateUnit"/></td>
        <td class="fieldname"><bean:message key="label.security.charter.rate.other"/> </td>
        <td><html:text property="vesselCharterRateUnitOTH" size="30" maxlength="50"/>&nbsp;
            <html:errors property="vesselCharterRateUnitOTH"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.asset.public.transport"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
		<td><html:radio property="pubTransport" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>&nbsp
			<html:radio property="pubTransport" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio>&nbsp; 
			<html:errors property="pubTransport"/></td>
			<td class="fieldname">
		        <span class=stp><bean:message key="label.security.asset.date.chattel.sold"/></span>&nbsp;</td>
		    <td><html:text property="chattelSoldDate" readonly="true" size="15" maxlength="11"/>
		        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
		             onclick="showCalendar('chattelSoldDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
		             onmouseout="MM_swapImgRestore()"/>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.asset.rl.serialno"/></span>&nbsp;</td>
		<td><html:text property="rlSerialNumber"/>&nbsp;</td>
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.asset.repossession.date"/></span> </td>
		<td><html:text property="repossessionDate" readonly="true" size="15" maxlength="11"/>
			<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
				 onclick="showCalendar('repossessionDate', 'dd/mm/y')"
				 onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
				 onmouseout="MM_swapImgRestore()"/>&nbsp;
			<html:errors property="repossessionDate"/></td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.asset.model"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
		<td><html:select property="modelNo">
				<integro:common-code categoryCode="<%=CategoryCodeConstant.ASSET_MODEL_TYPE%>" />
			</html:select>&nbsp;<html:errors property="modelNo"/></td>
		<td class="fieldname">&nbsp;</td>
		<td>&nbsp;</td>
    </tr>
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.security.charter.remark"/> </td>
        <td colspan="3">
            <html:textarea property="vesselCharterRemarks" rows="5" cols="120" style="width:100%" />&nbsp;
            <html:errors property="vesselCharterRemarks"/></td>
    </tr>
    
    </tbody>
    </table>
</td>
</tr>