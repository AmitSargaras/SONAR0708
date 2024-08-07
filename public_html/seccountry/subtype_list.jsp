<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.ui.seccountry.SecurityCountryForm"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/seccountry/subtype_list.jsp,v 1.11 2006/10/27 08:47:26 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.11 $
 * @since $Date: 2006/10/27 08:47:26 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String secTypeDesc = (String) request.getAttribute("secTypeDesc");
    String secType = (String) request.getAttribute("secType");
    if (secTypeDesc == null || secTypeDesc.equals("")) {
        SecurityCountryForm aForm = (SecurityCountryForm) request.getAttribute("SecurityCountryForm");
        secTypeDesc = aForm.getSecTypeDesc();
        secType = aForm.getSecType();
    }
//    System.out.println("sec type----------------------"+secType);
    int sno = 0;
    String formNumber = "1";
    String frame = (String) session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.frame");
    if (!"true".equals(frame)) {
        formNumber = "0";
    }

    boolean viewOnly = false;
    if (request.getParameter("view") != null && request.getParameter("view").equals("view")) {
        viewOnly = true;
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

function gotopage(aLocation) {
	window.location = aLocation;
}
function goCreate(){
formObj = document.forms[<%=formNumber%>];
formObj.event.value="create_template_item";
formObj.submit();
//alert('going create');
}
function goView(subType,subTypeDesc,trxID){
formObj = document.forms[<%=formNumber%>];
formObj.subType.value=subType;
formObj.subTypeDesc.value=subTypeDesc;
formObj.custTypeTrxID.value=trxID;
formObj.event.value="view_template_item";
formObj.submit();
}



function createEdit(subType,subTypeDesc,trxID){
formObj = document.forms[<%=formNumber%>];
formObj.subType.value=subType;
formObj.subTypeDesc.value=subTypeDesc;
//alert(subType);
//alert(subTypeDesc);

if(trxID=="" || trxID.length == 0 || trxID == "null"){
    goCreate();
}
else{
formObj.event.value="edit_template_item";
formObj.custTypeTrxID.value=trxID;
//alert('going edit');
formObj.submit();
}
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="SecurityCountry" >
<input type="hidden" name="event" />
<input type="hidden" name="subType" />
<input type="hidden" name="ckeckString" />
<input type="hidden" name="subTypeDesc" />
<input type="hidden" name="custTypeTrxID" />
<% if(secType!=null) { %>
<input type="hidden" name="secType" value="<%=secType%>"/>
<% }else{%>
<html:hidden property="secType" />
<% } %>
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>
<html:hidden property="countryCode" />
<input type="hidden" name="secTypeDesc" value="<%=secTypeDesc%>" />
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>&nbsp;<%=secTypeDesc%></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="9%">S/N</td>
              <td width="56%">Security Sub-Type</td>
              <td width="14%">Completed</td>
              <td width="21%">Action</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="colSubTypeList">
   <logic:iterate id="OB" name="colSubTypeList"  type="com.integrosys.cms.app.chktemplate.bus.CollateralSubTypeSearchResultItem" >
   <%
       String rowClass="";
       sno++;
      if(sno%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }
    %>
        <tr class=<%=rowClass%>>
          <td class="index"><%=sno%></td>
          <td>&nbsp;<bean:write name="OB" property="collateralSubTypeDesc"/></td>
          <td style="text-align:center">
          <%if(OB.isCompleted()){%>
          <img src="img/tick(black).gif" width="18" height="16" border="0" />
          <%}else{%>
          &nbsp;
          <%}%>
          </td>
          <td style="text-align:center">
          <%if(OB.isNew()){%>
              <%if(!viewOnly){%>
                <input type="button" name="Submit" value="Create/Edit" class="btnNormal" style="width:80" onclick="createEdit('<%=OB.getCollateralSubTypeCode()%>','<%=OB.getCollateralSubTypeDesc()%>','<%=OB.getTrxID()%>')" />
              <%}else{%>
              -
<%--                <input type="button" name="Submit" value="New" class="btnNormal" style="width:80" onclick="#" />--%>
              <%}%>
          <%}else{%>
            <%if(OB.isEditAllowed()){%>
                <%if(!viewOnly){%>
                    <input type="button" name="Submit" value="Create/Edit" class="btnNormal" style="width:80" onclick="createEdit('<%=OB.getCollateralSubTypeCode()%>','<%=OB.getCollateralSubTypeDesc()%>','<%=OB.getTrxID()%>')"/>
                <%}else{%>
                    <input type="button" name="Submit" value="View" class="btnNormal" style="width:80" onclick="goView('<%=OB.getCollateralSubTypeCode()%>','<%=OB.getCollateralSubTypeDesc()%>','<%=OB.getTrxID()%>')"/>
                <%}%>
            <%}else{%>
                <input type="button" name="Submit" value="View" class="btnNormal" style="width:80" onclick="goView('<%=OB.getCollateralSubTypeCode()%>','<%=OB.getCollateralSubTypeDesc()%>','<%=OB.getTrxID()%>')"/>
          <%}}%>
          </td>
        </tr>
   </logic:iterate>
</logic:present>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td style="text-align:center">&nbsp;</td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
