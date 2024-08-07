<%@ page import="com.integrosys.cms.app.collateral.trx.parameter.ICollateralSubTypeTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Arrays,
                 com.integrosys.cms.ui.srp.global.SRPGlobalConstants,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Collection,
                 java.util.HashMap,
                 com.integrosys.cms.app.collateral.bus.ICollateralSubType,
                 com.integrosys.cms.ui.srp.global.SRPGlobalAction,
                 com.integrosys.cms.ui.srp.SRPHelper,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/srp/global/srpglobal_view.jsp,v 1.3 2006/10/27 08:48:09 hmbao Exp $
*
* Purpose: CRP Global Parameter - View page
* Description: Type - CRP Global Parameter
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.3 $
* Date: $Date: 2006/10/27 08:48:09 $
* Tag: $Name:  $
*/
%>

<%
    String event = request.getParameter("event");
    
    ICollateralSubTypeTrxValue obTrxValue = (ICollateralSubTypeTrxValue)session.getAttribute("com.integrosys.cms.ui.srp.global.SRPGlobalAction.CollateralSubTypeTrxValue");;
    if( obTrxValue == null ) {
        out.println("Expected session parameter 'CollateralSubTypeTrxValue' is missing.");
        return;
    }

    ICollateralSubType[] parametersArray = null;
    if (SRPGlobalAction.EVENT_VIEW.equals(event)) {
    	parametersArray = obTrxValue.getCollateralSubTypes();
	} else {
    	parametersArray = obTrxValue.getStagingCollateralSubTypes();
	}
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function closeEditRejected() {
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="<%=SRPGlobalConstants.ACTION_URL%>" >
<input type="hidden" name="event" value="maker_cncl_reject_edit"/>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>   	
    <tr>
      <td><h3>SRP - Global Parameter and Eligible Security - <%=obTrxValue.getCollateralSubTypes()[0]!=null?obTrxValue.getCollateralSubTypes()[0].getTypeName():"SECURITY_SUBTYPE_IS_NULL"%></h3></td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="10%">S/N</td>
              <td width="50%">Description</td>
              <td width="10%">Max %</td>
							<td width="10%">Standardised Approach</td>
              <td width="10%">Foundation IRB</td>
              <td width="10%">Advanced IRB</td>
            </tr>
          </thead>
          <tbody>
          <%
              for (int i = 0; i < parametersArray.length; i++)
              {
                  ICollateralSubType parameter = parametersArray[i];
          %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
                <td class="index"><%=(i+1)%></td>
                <td><integro:empty-if-null value="<%=parameter.getSubTypeDesc()%>"/>&nbsp;</td>
                <td style="text-align:right;padding-right:5px"><%=ConvertFloatToString.getInstance().convertDouble(parameter.getMaxValue())%> </td>
                <td style="text-align:center"><input name="subTypeStandardisedApproach" disabled type="checkbox" <%if(parameter.getSubTypeStandardisedApproach()){ %> checked <% } %> /></td>
                <td style="text-align:center"><input name="subTypeFoundationIRB" disabled type="checkbox" <%if(parameter.getSubTypeFoundationIRB()){ %> checked <% } %> /></td>
                <td style="text-align:center"><input name="subTypeAdvancedIRB" disabled type="checkbox" <%if(parameter.getSubTypeAdvancedIRB()){ %> checked <% } %> /></td>
            </tr>
          <%
              }
          %>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>  
  <tr>
   <%if("to_track".equals(event)){%>
	   <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
	   <td>&nbsp;</td>
   <%} else if ("srpglobal_maker_close".equals(event)){%>
        <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
        <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else { %>
	    <td width="100%" valign="baseline" align="center"> <a href="<%=SRPGlobalConstants.ACTION_URL%>?event=view_prepare_srpglobal" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
	    <td>&nbsp;</td>
   <%}%>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>     
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>
