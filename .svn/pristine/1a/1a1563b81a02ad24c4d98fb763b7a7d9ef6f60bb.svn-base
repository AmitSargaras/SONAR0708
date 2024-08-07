<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralSubType"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	rowIdx = 0; //reset even-odd row highlighting

	boolean isReadOnly = false;
	
	ICollateralSubType subType = iCol.getCollateralSubType();

	String typeCode = subType.getTypeCode();
	String subTypeCode = subType.getSubTypeCode();

//	if( typeCode.equals( ICMSConstant.SECURITY_TYPE_PROPERTY )
//		|| ( typeCode.equals( ICMSConstant.SECURITY_TYPE_GUARANTEE ) &&
//			 !subTypeCode.equals( ICMSConstant.COLTYPE_GUARANTEE_INTBR_INDEMNITY ) )
//		|| ( typeCode.equals( ICMSConstant.SECURITY_TYPE_DOCUMENT ) &&
//			 subTypeCode.equals( ICMSConstant.COLTYPE_DOC_DEED_ASSIGNMENT ) )
//		|| ( typeCode.equals( ICMSConstant.SECURITY_TYPE_ASSET ) &&
//			 subTypeCode.equals( ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE ) )
//		|| ( typeCode.equals( ICMSConstant.SECURITY_TYPE_CASH ) &&
//			 subTypeCode.equals( ICMSConstant.COLTYPE_CASH_FD ) )
//		|| subTypeCode.equals( ICMSConstant.SECURITY_TYPE_PROPERTY )
//		|| subTypeCode.equals( ICMSConstant.COLTYPE_MAR_MAIN_IDX_FOREIGN )
//			|| subTypeCode.equals( ICMSConstant.COLTYPE_MAR_MAIN_IDX_LOCAL )
//			|| subTypeCode.equals( ICMSConstant.COLTYPE_MAR_OTHERLISTED_FOREIGN )
//			|| subTypeCode.equals( ICMSConstant.COLTYPE_MAR_OTHERLISTED_LOCAL )
//	) {
//		System.out.println("Inside update_netRV... isReadOnly=true");
//		isReadOnly = true;
//	}
				
%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">  
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>            
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
               <td class="fieldname"><bean:message key="label.valuation.net.col.value" /> </td>
               <td colspan = "3">
                   <html:text property="netRealisableSecValue" size="40" maxlength="33" readonly="<%=isReadOnly%>"/>
                   <html:errors property="netRealisableSecValue"/>
               </td>
            </tr>			
          </tbody>
        </table>
       </td>
    </tr>
  </tbody>
</table>
<br/>

