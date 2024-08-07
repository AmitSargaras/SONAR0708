<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/sublimittype/list/view_slt_list.jsp,v 1.6 2006/02/28 02:02:15 nkumar Exp $
 *
 * Describe this JSP.
 * Purpose:
 * Description:
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-22
 * Tag : \public_html\commodityglobal\sublimittype\list\view_slt_list.jsp
 */
%>
<%@ page import="java.util.HashMap,
				 java.util.Arrays,
                 com.integrosys.cms.app.commodity.main.bus.sublimittype.SubLimitTypeComparator,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.commodity.main.trx.sublimittype.ISubLimitTypeTrxValue,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	ISubLimitTypeTrxValue trxValue  = (ISubLimitTypeTrxValue) session.getAttribute(SLTUIConstants.CN_SLT_ACTION+"."+SLTUIConstants.AN_SLT_TRX_VALUE);
    String event = request.getParameter("event");
    HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
    
%>

<script language="JavaScript" type="text/JavaScript">
<!--
	function submitPage() {
	  	document.forms[0].event.value="close";	
	    document.forms[0].submit();
	}
//-->
</script>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<html:form action="SubLimitTypeList.do">
<input type="hidden" name="event" value="<%=event%>"/>
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
  		ISubLimitType[] subLimitTypes = trxValue.getStagingSubLimitTypes();
  		SubLimitTypeComparator c = new SubLimitTypeComparator(limitTypeMap);
  		Arrays.sort(subLimitTypes,c);  
  		
  		//System.out.println("sorted..........");
  		
  		if(subLimitTypes==null||subLimitTypes.length == 0){
%>
          	<tr class="odd">
              <td colspan="4">&nbsp;</td>
            </tr>
<%
	  	}else{
	    	for(int index =0 ;index<subLimitTypes.length;index++) {	    
         	String limitName = (String)limitTypeMap.get(String.valueOf(subLimitTypes[index].getLimitType()));		
%>
			<tr class="<%=index%2==0?"odd":"even"%>">
              <td class="index" width="4%"><%=index + 1%></td>
              <td width="15%"><integro:empty-if-null value="<%=limitName%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=subLimitTypes[index].getSubLimitType()%>"/></td>
              <%--td width="15%"><a href="javascript:viewItem(<%=String.valueOf(index)%>)">View</a></td--%>
            </tr>  
<%    		}//end for.
	    }//end if.
	}else{
		System.out.println("in update_submittype_list.jsp : trxValue == null");
	}
%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
<%
    if (event.equals(SLTUIConstants.EN_PRE_CLOSE) ){
	//if (event.equals(SLTUIConstants.EN_PRE_CLOSE) ||event.equals(SLTUIConstants.EN_CLOSE_RETURN)) {
%>
        <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
<%
   //} else if (event.equals(CommProfileListAction.EVENT_TO_TRACK) ||
   //       event.equals(CommProfileListAction.EVENT_TRACK_RETURN)) { 
   
	}else if(SLTUIConstants.EN_TO_TRACK.equals(event)){
%>
  		<td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
<%
	}  
%>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>

</html:form>