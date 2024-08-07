<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recspecnoa.IReceivableSpecificNoAgent"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetrecspecnonagent/assetRecSpecNonAgent_process.jsp,v 1.13 2006/10/27 08:25:19 hmbao Exp $
*
* Purpose: Process to approve Collateral
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.13 $
* Date: $Date: 2006/10/27 08:25:19 $
* Tag: $Name:  $
*/
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    IReceivableSpecificNoAgent iCol = (IReceivableSpecificNoAgent) itrxValue.getStagingCollateral();

    String collateralTrxToState = itrxValue.getToState();
    pageContext.setAttribute("obj", iCol);
    String from_event = "process";
    boolean isProcess = true;

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/collateral_checker_process.js"></script> <!-- submitPage can be found here -->
</head>

<body>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetRecSpecNonAgentCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="AssetRecSpecNonAgent"/>
<input type="hidden" name="from_page"/>
<input type="hidden" name="helperId" />

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.title.process.assetbased.receivable.asign.spec.invoice.not"/></h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
<%@ include file="assetRecSpecNonAgent_read_helper.jsp" %>

  </tbody>
</table>
<br>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
     <tr>
       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
           <tbody>
             <tr>
                  <td class="fieldname"><bean:message key="label.remarks"/></td>
                  <td class="odd"><textarea name="remarks" cols="60" rows="3"></textarea><html:errors property="remarks"/> </td>
             </tr>
             <tr>
             <td class="fieldname"><bean:message key="label.last.action.by"/></td>
             <td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
             </tr>
             <tr class="odd">
               <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
               <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
             </tr>
           </tbody>
         </table></td>
     </tr>
  </tbody>
</table>

<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td width="89">&nbsp;</td>
	<td width="81">&nbsp;</td>
	<td width="70">&nbsp;</td>
  </tr>
  <tr>
    <td><a href ="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <% if (!StringUtils.equals(collateralTrxToState, ICMSConstant.STATE_PENDING_RETRY)) { //If not pending retry %>
		<td><a href ="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
	<% } %>
	<td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
</table>

</html:form>

</body>
</html>
