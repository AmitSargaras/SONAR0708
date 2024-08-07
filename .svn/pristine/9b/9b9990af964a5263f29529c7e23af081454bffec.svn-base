<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/sublimittype/list/update_slt_list.jsp,v 1.4 2006/02/28 02:02:05 nkumar Exp $
 *
 * Describe this JSP.
 * Purpose:This JSP page is the entry to the maintenance sub-limit type.
 * Description:List all sub-limit types.
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-14
 * Tag : /public_html/commodityglobal/sublimittype/list/update_slt_list.jsp
 */
%>
<%@ page import="java.util.Collection,
				 java.util.ArrayList,
				 java.util.HashMap,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.commodity.main.trx.sublimittype.ISubLimitTypeTrxValue,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,
				 com.integrosys.component.commondata.app.CommonDataSingleton
				 "%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	ISubLimitTypeTrxValue trxValue  = (ISubLimitTypeTrxValue) session.getAttribute(SLTUIConstants.CN_SLT_ACTION+"."+SLTUIConstants.AN_SLT_TRX_VALUE);
	HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
                    
%>

<script language="JavaScript" type="text/JavaScript">
<!--
	function submitPage(eventType) {
		document.forms[0].event.value = eventType;
		if("<%=SLTUIConstants.EN_PREPARE_ADD%>"==eventType){			
        	document.forms[0].action = "SubLimitTypeItem.do"
			document.forms[0].indexID.value = "-1";
		}
		document.forms[0].submit();
	}
	function editItem(index) {
    	document.forms[0].event.value = "<%=SLTUIConstants.EN_PREPARE_UPDATE%>";		
        document.forms[0].action = "SubLimitTypeItem.do"
	    document.forms[0].indexID.value = index;
	   // document.forms[0].isNewItem.value = itemStatus;
	    
	    document.forms[0].submit();
	}
//-->
</script>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<html:form action="SubLimitTypeList.do">
<input type="hidden" name="event" value=""/>
<!-- For Edit -->
<input type="hidden" name="indexID"/>
<input type="hidden" name="isNewItem"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      	<h3>Commodity Sub Limit Type Summary</h3>
      </td>
      <td valign="bottom"><html:errors property="<%=SLTUIConstants.ERR_EMPTY_SLT%>"/></td>
      <td width="42%" valign="bottom">
          <table width="160"  border="0" align="right" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="80" valign="baseline" align="center">
	            <input name="Submit2" type="button" class="btnNormal" value="Add New" onclick="javascript:submitPage('<%=SLTUIConstants.EN_PREPARE_ADD%>')"/>
	          </td>
	          <td width="80" valign="baseline" align="center">
	            <input name="Submit2" type="button" class="btnNormal" value="Delete" onclick="javascript:submitPage('<%=ICommonEventConstant.EVENT_DELETE%>')"/>
	          </td>
	        </tr>
        </table>
      </td>         
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
              <td width="13%">Action</td>
              <td width="8%">Delete</td>
            </tr>
          </thead>
          <tbody>
<%
  	if(trxValue!=null){
	  	
	  	Collection commRefColl = new ArrayList();
        ISubLimitType[] actualList = trxValue.getSubLimitTypes();
        if ( actualList!= null) {
        	for (int i = 0; i < actualList.length; i++) {
            	commRefColl.add(String.valueOf(actualList[i].getCommonRef()));
            }
        }
        ISubLimitType[] subLimitTypes = trxValue.getStagingSubLimitTypes();
  		if(subLimitTypes==null||subLimitTypes.length == 0){
%>
          	<tr class="odd">
              <td colspan="5">There is no sub limit type.</td>
            </tr>
<%
	  	}else{
	    	for(int index =0 ;index<subLimitTypes.length;index++) {	    
		    	boolean isNew = false;
		    	if(subLimitTypes[index].getSubLimitTypeID() <= 0){
		    		isNew = true;
			    }else if(!commRefColl.contains(String.valueOf(subLimitTypes[index].getCommonRef()))){
			    	isNew = true;
				}
         		String limitName = (String)limitTypeMap.get(String.valueOf(subLimitTypes[index].getLimitType()));
%>
			<tr class="<%=index%2==0?"odd":"even"%>">
              <td class="index" width="4%"><%=index + 1%></td>
              <td width="15%"><integro:empty-if-null value="<%=limitName%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=subLimitTypes[index].getSubLimitType()%>"/></td>
              <td width="13%"><a href="javascript:editItem(<%=index%>)">View/Edit</a></td>
              <td width="15%" style="text-align:center">
              	<%
              		if(isNew){
              	%>
                <html:multibox property="chkDeletes" value="<%=String.valueOf(index)%>"/>
                <%
            		}
                %>&nbsp;
              </td>
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


<% 
	if (trxValue != null && trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { 
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td class="fieldname" width="39%">Remarks</td>
        <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
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
<% 
} 
%>

<%
    String colspan = "2";
    //System.out.println("in update_submittype_list.jsp : state is "+trxValue.getStatus());
    if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
            trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
        colspan = "3";
    }
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="<%=colspan%>">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_SUBMIT%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_UPDATE%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31" border="0" id="Image3" /></a></td>
    <%
        if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
    %>
    <td>
    	<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
    		<img src="img/cancel1.gif" name="Image1"border="0" id="Image1" />
    	</a>
    </td>
    <%
    	} 
    %>
  </tr>
  <tr>
    <td colspan="<%=colspan%>">&nbsp;</td>
  </tr>
</table>
</html:form>