<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/limitdetails/ck_process_view_sl_list.jsp,v 1.7 2006/09/15 12:47:49 hshii Exp $
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
				 java.util.Iterator,
				 java.util.Arrays,
				 java.util.Locale,
                 java.math.BigDecimal,				 
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,				 
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SLUIConstants,           
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.list.SubLimitListForm,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SubLimitUtils,
				 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainUtil,                 
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
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
  	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

  	HashMap trxValueMap = (HashMap)session.getAttribute(SLUIConstants.CN_COMMODITY_MAIN_ACTION+"."+SLUIConstants.AN_COMM_MAIN_TRX_VALUE);

	HashMap limitMap  = (HashMap)trxValueMap.get("stageLimit");
	HashMap actualLimitMap = (HashMap)trxValueMap.get("actualLimit");
	if(limitMap!=null&&!limitMap.isEmpty()){	
		
		HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
        HashMap sltMap = SubLimitUtils.getSLTMap();
			
		HashMap limitList = (HashMap) trxValueMap.get("limitList");	
		boolean isCMTmaker= CommodityMainUtil.isCurrUserCMTMaker(session);
		SubLimitListForm aForm = (SubLimitListForm)request.getAttribute("SubLimitListForm");
		String[] cashReqQtyArray = aForm.getCashReqQty();
		int limitMapIndex = 0;
		try {
			for(Iterator iterator = SubLimitUtils.getSortedLimitDetails(limitMap).iterator();iterator.hasNext();limitMapIndex++){
				ICollateralLimitMap stagingCollateralLimitMap = (ICollateralLimitMap)iterator.next();
				if(limitMapIndex!=0){
%>
		<tr><td colspan=3>&nbsp;</td></tr>
		<tr><td colspan="3"><hr>&nbsp;</td></tr>
<%		
			}
%>			
			<%@ include file="ck_sub_limit_view.jsp" %>
<%
			}//end : loop limitMap
		}catch(Exception e){
			e.printStackTrace();
		}
	}else{
%>
		<tr><td><bean:message key="label.security.none.limit"/></td></tr>
<%
	}
%>
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