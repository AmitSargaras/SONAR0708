<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/limitdetails/view_sublimit_list.jsp,v 1.9 2005/10/14 06:22:05 hmbao Exp $
 *
 * Describe this JSP.
 * Purpose:This JSP page is the entry to the maintenance sub-limit type.
 * Description:List all sub-limit types.
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-14
 * Tag : /public_html/commodityglobal/sublimittype/list/view_sublimit_list.jsp
 */
%>
<%@ page import="java.util.ArrayList,
				 java.util.List,
				 java.util.HashMap,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SLUIConstants,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script language="JavaScript" type="text/JavaScript">
<!--
	function submitPage(eventType) {
		document.forms[0].event.value = eventType;
		document.forms[0].indexID.value = "-1";
		document.forms[0].submit();
	}
//-->
</script>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommoditySubLimit.do">
<input type="hidden" name="event" value=""/>

<input type="hidden" name="fromEvent" value="<%=request.getParameter("fromEvent")%>"/>
<input type="hidden" name="from_page" value="<%=request.getParameter("fromEvent")%>"/>
<input type="hidden" name="limitID" value=""/>
<input type="hidden" name="indexID"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      	<h3><bean:message key="label.security.title.view.commodity.limit.details"/></h3>
      </td>
      <td valign="bottom"></td>
      <td width="42%" valign="bottom">
      </td>         
    </tr>
    <tr><td colspan=3><hr>&nbsp;</td></tr>
  </thead>
  <tbody>  
  		<%
  			boolean isView = true;
  		%>
		<%@ include file="sub_limit_detail.jsp" %>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage('<%=SLUIConstants.EN_VIEW_RETURN%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
</html:form>