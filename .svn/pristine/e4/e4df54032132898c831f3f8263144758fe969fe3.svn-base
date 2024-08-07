<%@ page import="java.util.ArrayList,
				 java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/global_doc_checklist.jsp,v 1.8 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.8 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    int sno = 0;
    boolean viewOnly = false;
    if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
        viewOnly=true;
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
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function refreshContent() {
	window.location="CCDocTemp(sscmaker,corp&eng).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(selObj,docTrxID){ //v3.0
  if(selObj.selectedIndex == 0){
    return ;
  }
  if(selObj.selectedIndex == 1){
    document.forms[0].event.value="edit_doc_item";
    document.forms[0].docTrxID.value=docTrxID;
    document.forms[0].submit();
  }

}

function goToPage() {
    document.forms[0].event.value="prepare_create_doc_item";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCGlobal.do">
<input type="hidden" name="event" />
<input type="hidden" name="docTrxID" />


<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global Constitutional / Contractual Document Template</h3></td>
      <%if(!viewOnly){%>
      <td valign="baseline" align="right" width="10%"> <input type="button" value="Create" class="btnNormal" onclick="goToPage()"/></td>
        <%}%>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead>
        <tr>
          <td rowspan="2" width="4%">S/N</td>
          <td rowspan="2" width="11%">Code</td>
          <td rowspan="2" width="50%">Description</td>
          <td rowspan="2" width="4%"><bean:message key="label.cc.checklist.application.type"/></td>
          <td rowspan="2" width="3%">Pre-Approval Doc</td>
          <td colspan="2" width="14%">Type</td>
		  <td rowspan="2" width="6%">Document Version</td>
          <td rowspan="2" width="10%">Expiry Date</td>
          <%if(!viewOnly){%>
          <td rowspan="2" width="10%">Action</td>
          <%}%>
        </tr>
        <tr>
          <td>Borrower</td>
          <td>Chargor/<br>Pledgor/<br>Guarantor</td>
        </tr>
        </thead>
        <tbody>
<logic:present name="globalDocChkList">
   <logic:iterate id="OB" name="globalDocChkList"  type="com.integrosys.cms.app.chktemplate.bus.DocumentSearchResultItem" >
   <%
       String rowClass="";
       sno++;
      if(sno%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }

//       OB.getI

   %>

        <tr class="<%=rowClass%>">
          <td class="index" height="18" ><%=sno%></td>
          <td >&nbsp;<bean:write property="itemCode" name="OB"/></td>
          <td height="18">&nbsp;<bean:write property="itemDesc" name="OB"/></td>
          <td style="text-align:center" nowrap>
          <%java.util.Iterator iter = OB.getItem().getCMRDocAppItemList().iterator(); 
          	while (iter.hasNext())
          	{
          		com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
          %>
          	&nbsp;<integro:common-code display="true" categoryCode="APPLICATION_TYPE" descWithCode="false" entryCode="<%=docAppItem.getAppType()%>" />
          	<br>
          <%
          	}
          %>
          </td>
          <td style="text-align:center">&nbsp;<bean:write property="isPreApprove" name="OB"/></td>
          <td style="text-align:center">&nbsp;<%=(OB.getIsForBorrower()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td style="text-align:center">&nbsp;<%=(OB.getIsForPledgor()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td style="text-align:center">&nbsp;<bean:write property="docVersion" name="OB"/></td>
          <td style="text-align:center">&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
          
         <%if(!viewOnly){%>
          <td style="text-align:center">
            <select name="menu1" onchange="MM_jumpMenu(this,'<%=OB.getTrxID()%>')">
              <option value="0" selected>Please Select</option>
			  <% if(ICMSConstant.STATE_ACTIVE.equals(OB.getTrxStatus())) {%>
                <option value="edit">Edit</option>
              <% }%>
            </select>
          </td>
          <%}%>
        </tr>
</logic:iterate>
</logic:present>
<%if(sno == 0) { %>
<tr class="odd">
<td colspan='<%= viewOnly?"9":"10"%>' ><bean:message key="label.global.not.found"/></td>
</tr>
<% }%>

  </tbody>
</table>
</td>
</tr>
</tbody>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
