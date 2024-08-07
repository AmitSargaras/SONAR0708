<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/sublimittype/list/ck_process_slt_list.jsp,v 1.9 2006/02/28 02:01:45 nkumar Exp $
 *
 * Describe this JSP.
 * Purpose:
 * Description:
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-22
 * Tag : \public_html\commodityglobal\sublimittype\list\process_slt_list.jsp
 */
%>
<%@ page import="
				 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Arrays,
                 java.util.List,
                 java.util.ArrayList,
                 java.util.HashMap,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.commodity.main.trx.sublimittype.ISubLimitTypeTrxValue,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.SubLimitTypeComparator,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	ISubLimitTypeTrxValue trxValue  = (ISubLimitTypeTrxValue) session.getAttribute(SLTUIConstants.CN_SLT_ACTION+"."+SLTUIConstants.AN_SLT_TRX_VALUE);
	HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
%>

<script type="text/javascript" src="js/validation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
	function submitPage(eventType) {
		document.forms[0].event.value = eventType;
		document.forms[0].submit();
	}
//-->
</script>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<html:form action="SubLimitTypeList.do">
<input type="hidden" name="event" value=""/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      	<h3>Commodity Sub Limit Type </h3>
      </td>        
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%">S/N</td>
              <td width="23%">Approved Limit Type&nbsp;<font color="#00AAFF">* </font></td>
              <td width="23%">Sub Limit Type&nbsp;<font color="#00AAFF">* </font></td>
              <%--td width="8%">Action</td--%>
            </tr>
          </thead>
          <tbody>
<%
  	if(trxValue!=null){
	  	ISubLimitType[] staging = trxValue.getStagingSubLimitTypes();
  		ISubLimitType[] actual = trxValue.getSubLimitTypes();  	  		
  		
  		System.out.println("Num of actual : "+(actual==null?0:actual.length));
  		System.out.println("Num of staging : "+(staging==null?0:staging.length));
  		
	    List res = CompareOBUtil.compOBArray(staging,actual);
	    CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
	    SubLimitTypeComparator c = new SubLimitTypeComparator(limitTypeMap);
        Arrays.sort(resultList,c);        
        ArrayList list = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("sltList",list);
  		if(list==null||list.size() == 0){
%>
          	<tr class="odd">
              <td colspan="3">There is no sub limit type.&nbsp;</td>
            </tr>
<%
	  	}else{
            int index = 0;
%>		  	
		<logic:present name="sltList" >
        	<logic:iterate id="compResult" name="sltList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        
        <%
            ISubLimitType slt = (ISubLimitType) compResult.getObj();            
         	String limitName = (String)limitTypeMap.get(String.valueOf(slt.getLimitType()));
        %>
			<tr class="<%=index%2==0?"odd":"even"%>">
              <td class="<bean:write name="compResult" property="key" />" width="8%"><%=index + 1%></td>
              <td width="15%"><integro:empty-if-null value="<%=limitName%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=slt.getSubLimitType()%>"/></td>
              <%index++;%>
              <%--td width="15%"><a href="javascript:viewItem(<%=String.valueOf(index++)%>)">View</a></td--%>
            </tr>         
        	</logic:iterate>
        </logic:present>
<%        
		}
	}else{
		System.out.println("in update_submittype_list.jsp : trxValue == null");
	}
%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr>
        <td class="fieldname" width="39%">Remarks</td>
        <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"  onkeyup="limitTextInput(this,2000,'Remarks')"/>&nbsp;
            <html:errors property="remarks"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">Last Action By</td>
        <td class="even"><%=trxValue!=null?trxValue.getUserInfo():""%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname">Last Remarks Made</td>
        <td><% if (trxValue != null) { %>
            <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
            <% } %>&nbsp;
       </td>
    </tr>
    </tbody>
</table>


<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
        <td><a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_APPROVE%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <td><a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_REJECT%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>

</html:form>