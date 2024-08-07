<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/sublimittype/item/update_slt_item.jsp,v 1.5 2006/02/28 02:01:04 nkumar Exp $
 *
 * Describe this JSP.
 * Purpose:This JSP page is the entry to the maintenance sub-limit type.
 * Description:List all sub-limit types.
 *
 * @author BaoHongMan
 * @version R1.4
 * @since 2005-9-14
 * Tag : /public_html/commodityglobal/sublimittype/list/update_slt_item.jsp
 */
%>
<%@ page import="
				 java.util.Collection,
				 java.util.Iterator,
				 java.util.HashMap,
				 java.util.List,
				 java.util.ArrayList,
				 java.util.Arrays,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.cms.ui.commodityglobal.sublimittype.item.SubLimitTypeItemAction,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.commodity.main.trx.sublimittype.ISubLimitTypeTrxValue,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	//ISubLimitTypeTrxValue trxValue  = (ISubLimitTypeTrxValue) session.getAttribute(SLTUIConstants.NAME_LISTSUBLIMITTYPEACTION+"."+SLTUIConstants.SUBLIMITTYPE_TRX_VALUE);
    String event = request.getParameter(ICommonEventConstant.EVENT);   
    String indexID = request.getParameter("indexID");    
    int index = -1;
    if(indexID!=null){
	   index = Integer.parseInt(indexID);
    }
    
    String title = "";
    if (SLTUIConstants.EN_PREPARE_ADD.equals(event)||index==-1) {
        title = "Add New";
        event = ICommonEventConstant.EVENT_CREATE;
    } else {
        title = "Edit";
        event = ICommonEventConstant.EVENT_UPDATE;
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
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<html:form action="SubLimitTypeItem.do">
<input type="hidden" name="event" value="<%=event%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<%--
<input type="hidden" name="from_event" value="<%=from_event%>"/>
--%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      	<h3>Commodity Sub Limit Type - <%=title%></h3>
      </td>        
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          	<tr>
         		<td colspan="2">
         			<html:errors property="<%=SLTUIConstants.ERR_DUPLICATE_SLT%>"/>&nbsp;
         		</td>
         	</tr>
          </thead>
          <%
                HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryLabelValueMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
              	List labelList = new ArrayList();              	
				List valueList = new ArrayList();
				if (limitTypeMap != null&&limitTypeMap.size()>0) {
					String[] labelArray = new String[limitTypeMap.size()];
					int labelArrayIndex = 0;
					for (Iterator iterator = limitTypeMap.keySet().iterator(); iterator
							.hasNext();) {
						labelArray[labelArrayIndex++] = (String) iterator.next();
					}
					Arrays.sort(labelArray);
					labelList = Arrays.asList(labelArray);
					for (int labelIndex = 0; labelIndex < labelList.size(); labelIndex++) {
						String label = (String) labelList.get(labelIndex);
						String value = (String) limitTypeMap.get(label);
						valueList.add(value);
					}
				}
				pageContext.setAttribute(SLTUIConstants.AN_LIMIT_TYPE_VALUE_COLL,valueList);
				pageContext.setAttribute(SLTUIConstants.AN_LIMIT_TYPE_LABEL_COLL,labelList);
          %>
          
          <tbody>
            <tr class="odd">
              <td class="fieldname">Limit Type&nbsp;<font color="#0000FF">* </font></td>
              <td>              	
                <html:select property="<%=SLTUIConstants.FN_LIMIT_TYPE%>" >
                    <option value="" >Please Select </option>
		            <html:options name="<%=SLTUIConstants.AN_LIMIT_TYPE_VALUE_COLL%>" labelName="<%=SLTUIConstants.AN_LIMIT_TYPE_LABEL_COLL%>"/>
                </html:select>&nbsp;
                <html:errors property="<%=SLTUIConstants.FN_LIMIT_TYPE%>"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Sub Limit Type&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="<%=SLTUIConstants.FN_SUB_LIMIT_TYPE%>" maxlength="100" size="100"/>&nbsp;
              	<html:errors property="<%=SLTUIConstants.FN_SUB_LIMIT_TYPE%>"/>
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
          <a href="javascript:submitPage('<%=event%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
        <td width="75" valign="baseline" align="center">
          <a href="javascript:submitPage('<%=ICommonEventConstant.EVENT_CANCEL%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>