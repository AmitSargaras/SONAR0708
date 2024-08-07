<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/limitdetails/update_sublimit_item.jsp,v 1.11 2006/09/25 05:56:30 hmbao Exp $
 *
 * Describe this JSP.
 * Purpose:This JSP page is the entry to the maintenance sub-limit type.
 * Description:List all sub-limit types.
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-14
 * Tag : /public_html/commodityglobal/sublimittype/list/update_sublimit_item.jsp
 */
%>
<%@ page import="
				 java.util.Collection,
				 java.util.Iterator,
				 java.util.HashMap,
				 java.util.List,
				 java.util.ArrayList,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.collateral.commodity.CommodityMainUtil,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SLUIConstants,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
				 com.integrosys.cms.app.limit.bus.ILimit,				 
				 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SubLimitUtils,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.item.SubLimitItemForm"%>
				 
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	//ISubLimitTypeTrxValue trxValue  = (ISubLimitTypeTrxValue) session.getAttribute(SLTUIConstants.NAME_LISTSUBLIMITTYPEACTION+"."+SLTUIConstants.SUBLIMITTYPE_TRX_VALUE);
    //String event = request.getParameter(ICommonEventConstant.EVENT);   
    String title = "";
    String indexStr = request.getParameter("indexID");
    int index = -1;
    if(indexStr!=null){
	   index = Integer.parseInt(indexStr);
    }
    //System.out.println("index : "+index);
    if (index==-1) {
        title = "Add New";
    } else {
        title = "Edit";
    }
    HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
	String limitID = request.getParameter("limitID");
    HashMap trxValueMap = (HashMap)session.getAttribute(SLUIConstants.CN_COMMODITY_MAIN_ACTION+"."+SLUIConstants.AN_COMM_MAIN_TRX_VALUE);
	HashMap limitMap = (HashMap) trxValueMap.get(SLUIConstants.AN_STAGE_LMT);
	ICollateralLimitMap cLimitMap = (ICollateralLimitMap) limitMap.get(limitID);
	boolean isInnerLimit = false;
	String approvedLimitType = request.getParameter("approvedLimitType");
	if(approvedLimitType==null||approvedLimitType.trim().equals("")){
		SubLimitItemForm form = (SubLimitItemForm)request.getAttribute("SubLimitItemForm");
		//approvedLimitType = form.getSubLimitType();
		ISubLimitType slt = (ISubLimitType)SubLimitUtils.getSLTMap().get(form.getSubLimitType());
		if(slt==null){			
			System.out.println("cannot find...: "+form.getSubLimitType());
		}else{
			approvedLimitType = (String)limitTypeMap.get(String.valueOf(slt.getLimitType()));
		}
		System.out.println("read from form...: "+approvedLimitType);
	}
	System.out.println("approvedLimitType : "+approvedLimitType);
	HashMap limitList = (HashMap) trxValueMap.get("limitList");	
	if (limitList != null) {
		if (limitID.substring(0,2).equals(ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER)) {
			ILimit limit = (ILimit) limitList.get(limitID);
			isInnerLimit = CommodityMainUtil.isInnerLimit(limit);
		} else if (limitID.substring(0,2).equals(ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER)) {
			ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitID);
			isInnerLimit = CommodityMainUtil.isInnerLimit(colmt);
		}
	}
%>


<script language="JavaScript" type="text/JavaScript">
<!--
	function submitPage(eventType) {
		document.forms[0].event.value = eventType;
		document.forms[0].submit();
	}
//-->
</script>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CmdtSubLimitItem.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="indexID" value="<%=indexStr%>"/>
<input type="hidden" name="limitID" value="<%=limitID%>"/>
<input type="hidden" name="approvedLimitType" value="<%=approvedLimitType%>"/>

<input type="hidden" name="CollateralPool" value="<%=request.getParameter("CollateralPool")%>"/>
<input type="hidden" name="SpecificTrx" value="<%=request.getParameter("SpecificTrx")%>"/>
<input type="hidden" name="CashReqQty" value="<%=request.getParameter("CashReqQty")%>"/>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      	<h3><bean:message key="label.security.commodity.sub.limit"/> - <%=title%></h3>
      </td>        
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          	<tr>
         		<td colspan="2">
         			<html:errors property="<%=SLUIConstants.ERR_DUPLICATE_SL%>"/>&nbsp;
         		</td>
         	</tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.sub.limit.type"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<%
              		List sltList = (List)request.getAttribute(SLUIConstants.AN_SLT_LIST);
              		if(sltList==null){
	              		sltList = new ArrayList();
              		}
              		//System.out.println("Size of sltList : "+sltList.size());
              	%>              	
                <html:select property="<%=SLUIConstants.FN_SLT%>" >
                    <option value="" ><bean:message key="label.please.select"/></option>
                    <%
                    for(int i=0;i<sltList.size();i++){
	                    ISubLimitType slt = (ISubLimitType)sltList.get(i);
	                    String appLimitType = (String)limitTypeMap.get(slt.getLimitType());
	                    if(approvedLimitType!=null&&approvedLimitType.equals(appLimitType)){
	                %>
                    <html:option value="<%=String.valueOf(slt.getSubLimitTypeID())%>" >
                    <%--
                    	System.out.println("-"+slt.getSubLimitType());
                    	System.out.println("-"+limitTypeMap.get(String.valueOf(slt.getLimitType())));
                    --%>
                    	<%=slt.getSubLimitType()%>(<%=limitTypeMap.get(String.valueOf(slt.getLimitType()))%>)
                    </html:option>
                    <%
                		}
                	}
                    %>
                    <%--
		            <html:options collection="<%=SLUIConstants.AN_SLT_LIST%>" property="subLimitTypeID" labelProperty="subLimitType"/>
		            --%>
                </html:select>&nbsp;
                <html:errors property="<%=SLUIConstants.FN_SLT%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.sub.limit.ccy"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="<%=SLUIConstants.FN_SL_CCY%>">
                    <option value="" ><bean:message key="label.please.select"/> </option>
		            <html:options name="<%=SLUIConstants.AN_CURRENCY_COLLECTION%>" labelName="<%=SLUIConstants.AN_CURRENCY_COLLECTION%>"/>
                </html:select>&nbsp;
              	<html:errors property="<%=SLUIConstants.FN_SL_CCY%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.sub.limit.amount"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="<%=SLUIConstants.FN_SL_AMOUNT%>" maxlength="15" size="15"/>&nbsp;
              	<html:errors property="<%=SLUIConstants.FN_SL_AMOUNT%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.sub.limit.activate.amount"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="<%=SLUIConstants.FN_ACTIVE_AMOUNT%>" maxlength="15" size="15"/>&nbsp;
              	<html:errors property="<%=SLUIConstants.FN_ACTIVE_AMOUNT%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.ineer.limit"/></td>
              <td>
              <%
              	if(isInnerLimit){
              %>                          	
              	<html:hidden property="<%=SLUIConstants.FN_INNERFLAG%>" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              <%
          		}else{
              %>
              <html:radio property="<%=SLUIConstants.FN_INNERFLAG%>" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="<%=SLUIConstants.FN_INNERFLAG%>" value="<%=ICMSConstant.FALSE_VALUE%>" /><bean:message key="label.common.no"/>
              <%
          		}
              %>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="75" valign="baseline" align="center">
          <a href="javascript:submitPage('<%=SLUIConstants.EN_OK_UPDATE_ITEM%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
        <td width="75" valign="baseline" align="center">
          <a href="javascript:submitPage('<%=SLUIConstants.EN_CANCEL_UPDATE_ITEM%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>