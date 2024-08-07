

<%@ page import="java.util.List"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.VehicleTypeList"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralSearchForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%

     List vehicleDesc = (List)  VehicleTypeList.getInstance().getVehicleTypeValue();
     List vehicleCode = (List) VehicleTypeList.getInstance().getVehicleTypeID();

    System.out.println("vehicleCode.size() = " + vehicleCode.size());

     CollateralSearchForm serachForm = (CollateralSearchForm)request.getAttribute("CollateralSearchForm");
%>
<tr>
 <td>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
    <tr>
        <td align="right">
            <table class="tblInput"  width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr class="odd">
                        <td width="39%" class="fieldname"><bean:message key="label.col.owner.name"/></td>
                        <td width="61%"><html:text property="nameOfOwner" maxlength="10"/></td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.security.owner.le.id.type"/></td>
                        <td><html:select property="leIDType">
                            <option><bean:message key="label.please.select"/></option>
                            <option>GCIF</option>
                            <option>BWCIF</option>
                            </html:select>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.security.owner.le.id"/></td>
                        <td><html:text property="leID" maxlength="10"/></td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                        <td><html:text property="idNo" maxlength="10"/></td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.security.id.country"/></td>
                        <td>
                            <html:select property="idCountry">
                                <option selected><bean:message key="label.please.select"/></option>
                                <option value="SG">Singapore</option>
                                <option value="MY">Malaysia</option>
                            </html:select>
                        </td>
                    </tr>
                </tbody>
            </table></td>
    </tr>
    <tr>
        <td align="right">&nbsp;</td>
    </tr>
   <tr>
        <td>&nbsp;</td>
    </tr>
</table>

 </td>
</tr>


