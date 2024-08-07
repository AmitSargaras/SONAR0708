<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/limitdetails/update_sublimit_list.jsp,v 1.8 2005/11/22 02:57:50 hmbao Exp $
 *
 * Describe this JSP.
 * Purpose:This JSP page is the entry to the maintenance sub-limit type.
 * Description:List all sub-limit types.
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-14
 * Tag : /public_html/commodityglobal/sublimittype/list/update_sublimit_list.jsp
 */
%>
<%@ page import="java.util.ArrayList,
				 java.util.List,
				 java.util.HashMap,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SLUIConstants,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%	
	List msgList = (List)request.getAttribute(SLUIConstants.AN_SL_AMOUNT_CHK_MSG_LIST);	
	//System.out.println("Size of MSG : "+(msgList==null?0:msgList.size()));
	//System.out.println(request.getParameter("fromEvent"));	
%>

<script type="text/javascript" src="js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
	function submitPage(eventType) {
		document.forms[0].event.value = eventType;
		document.forms[0].indexID.value = "-1";
		enableAllFormElements();
		document.forms[0].submit();
	}
	
	function addItem(limitId,approvedLimitType){
		document.forms[0].limitID.value = limitId;
		document.forms[0].approvedLimitType.value = approvedLimitType;
		submitPage("<%=SLUIConstants.EN_PREPARE_UPDATE_ITEM%>");
	}
	
	function editItem(limitId,index) {
    	document.forms[0].event.value = "<%=SLUIConstants.EN_PREPARE_UPDATE_ITEM%>";
		document.forms[0].limitID.value = limitId;		
	    document.forms[0].indexID.value = index;
		enableAllFormElements();
	    document.forms[0].submit();
	}
	
	function subLimitAmountLimit(){
		<%
			if(msgList!=null){
				for(int index=0;index<msgList.size();index++){
		%>
					alert('<%=(String)msgList.get(index)%>');
		<%
				}
			}
		%>
	}
	
	function changeCashReqQty() {
		if (document.forms[0].cashReqQtyChk.length+'' == 'undefined') {
			if (document.forms[0].cashReqQtyChk.checked) {
		    	document.forms[0].cashReqQty.disabled = false;
		    } else {
		    	document.forms[0].cashReqQty.disabled = true;
		    	document.forms[0].cashReqQty.value = '';
		    }
	    }else{
	        var list = document.forms[0].cashReqQtyChk;
	        for (i = 0; i < list.length; i++) {
	            if (list[i].checked) {
	                document.forms[0].cashReqQty[i].disabled = false;
	            } else {
	                document.forms[0].cashReqQty[i].disabled = true;
	                document.forms[0].cashReqQty[i].value = '';
	            }
	        }
        }
	}
//-->
</script>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommoditySubLimit.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="fromEvent" value="<%=request.getParameter("fromEvent")%>"/>
<input type="hidden" name="limitID" value=""/>
<input type="hidden" name="approvedLimitType" value=""/>
<input type="hidden" name="indexID"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      	<h3><bean:message key="label.security.title.update.commodity.limit"/></h3>
      </td>
      <td valign="bottom"></td>
      <td width="42%" valign="bottom">
      </td>         
    </tr>
    <tr><td colspan=3><hr>&nbsp;</td></tr>
  </thead>
  <tbody>
  		<%
  			boolean isView = false;
  		%>
		<%@ include file="sub_limit_detail.jsp" %>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_SUBMIT%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
    <td><a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_CANCEL%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</html:form>

<script>
 subLimitAmountLimit();
</script>