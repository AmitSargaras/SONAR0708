<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralAssetLife,
                 com.integrosys.cms.app.collateral.trx.assetlife.OBCollateralAssetLifeTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/systemparameters/assetlife/assetlife_maker_view.jsp,v 1 2007/01/30 Jerlin Exp $
*
* Describe this JSP.
* Purpose: For Maker and Checker to view Maintain Asset Life Parameters
* Description: view the detail of Maintain Asset Life Parameters
*
* @author $Author: Jerlin$<br>
* @version $Revision: 1$
* Date: $Date: 2007/01/30$
* Tag: $Name$
*/
%>

<%
    ICollateralAssetLife[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.systemparameters.assetlife.MaintainAssetLifeAction.CollateralAssetLifeTrxValue");
    com.integrosys.cms.ui.systemparameters.assetlife.MaintainAssetLifeForm aForm = (com.integrosys.cms.ui.systemparameters.assetlife.MaintainAssetLifeForm) request.getAttribute("MaintainAssetLifeForm");
    OBCollateralAssetLifeTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
    	DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.OBCollateralAssetLifeTrxValue");
        obTrxValue = (OBCollateralAssetLifeTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_close_assetlife") || request.getParameter("event").equalsIgnoreCase("to_track")) {
           parametersArray = obTrxValue.getStagingCollateralAssetLifes();
        } else {
           parametersArray = obTrxValue.getCollateralAssetLifes();
        }
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'CollateralAssetLifesTrxValue' ");
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
function goToPage() {
    document.forms[0].action = "MaintainAssetLife.do?event=maker_edit_assetlife";
    document.forms[0].submit();
}

function closeEditRejected() {
    document.forms[0].action = "MaintainAssetLife.do?event=maker_close_assetlife_confirm";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="MaintainAssetLife.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
      	<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
		    <tr>
		      <td>&nbsp;</td>
		    </tr>
          <tr>
      		<td width="60%"><h3>Asset Life</h3></td>
      		<% String event = request.getParameter("event");
      			if(event.equals("maker_view_assetlife")){%>
            <td width="40%" valign="baseline" align="right"> <input type="button" value=" Edit " class="btnNormal" onclick="goToPage()"/>
            </td>
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="10%">S/N</td>
              <td width="65%">Security Type / Security Sub-Type</td>
              <td width="25%">Useful Life of Asset</td>
            </tr>
          </thead>
          <tbody>
          	<tr>
          	  <td colspan=3>Asset Based</td>
          	</tr>
          <%
              for (int i = 0; i < parametersArray.length; i++)
              {
                  ICollateralAssetLife parameter = parametersArray[i];
          %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
                <td class="index"><%=(i+1)%></td>
                <td><integro:empty-if-null value="<%=parameter.getSubTypeDesc()%>"/>&nbsp;</td>
                <td style="text-align:center;padding-right:5px"> <%=parameter.getLifeSpan()%></td>
            </tr>
          <%
              }
          %>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
	   <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_assetlife".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
