<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralSubType"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	rowIdx = 0; //reset even-odd row highlighting

	ICollateralSubType subType = iCol.getCollateralSubType();

	String typeCode = subType.getTypeCode();
	String subTypeCode = subType.getSubTypeCode();
			
	String tableWidth = "98%";	
	
	if( typeCode.equals( ICMSConstant.SECURITY_TYPE_ASSET ) 
		|| typeCode.equals( ICMSConstant.SECURITY_TYPE_PROPERTY ) 
		|| typeCode.equals( ICMSConstant.SECURITY_TYPE_OTHERS ) 
	  ) {
	
		tableWidth = "100%";
	
	}
%>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

<tbody>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB((newCollateral == null) ? null : newCollateral.getNetRealisableAmount(),((oldCollateral==null)?null:oldCollateral.getNetRealisableAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.net.col.value"/>
            </td>
            <td colspan="3">
                <bean:write name="<%=formName%>" property="netRealisableSecValue"/>&nbsp;
            </td>
        </tr>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>


