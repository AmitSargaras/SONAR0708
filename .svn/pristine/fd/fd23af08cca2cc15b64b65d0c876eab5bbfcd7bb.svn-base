<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String cName = (String)request.getAttribute("countryName");
    
	int sno = 0;
    int row = 0;
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
<script>

function goEdit(trxId) {
    document.forms[0].custTypeTrxID.value=trxId;
    document.forms[0].event.value="edit_template_item";
//    alert(document.forms[0].custTypeTrxID.value);
    document.forms[0].submit();
}

function goCreate(lawCode,custTypeCode) {
    document.forms[0].event.value="create_template_list";
    document.forms[0].lawCode.value=lawCode;
    document.forms[0].custTypeCode.value=custTypeCode;
    document.forms[0].submit();
}

function goView(trxId) {
    document.forms[0].custTypeTrxID.value=trxId;
    document.forms[0].event.value="view_template_item";
    document.forms[0].submit();
}

function goCreateEdit(lawCode,trxId,custTypeCode){
if(trxId=="" || trxId.length < 1 || trxId == "null"){
    goCreate(lawCode,custTypeCode);
}else{
    goEdit(trxId);
}
}
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCCountry.do">
<input type="hidden" name="event" />
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>
<input type="hidden" name="custTypeTrxID" />
<input type="hidden" name="lawCode" />
<input type="hidden" name="custTypeCode" />
<html:hidden property="countryCode" />

<input type="hidden" name="countryName" value="<%=cName%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>&nbsp;<%=cName%></h3></td>
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
			  <td width="6%">S/N</td>
			  <td width="27%">Law</td>
			  <td width="38%">Customer Legal Constitution</td>
			  <td width="14%">Completed</td>
			  <td width="15%">Action</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="ccCountryLawList">
   <logic:iterate id="OB" name="ccCountryLawList"  type="com.integrosys.cms.app.chktemplate.bus.LawSearchResultItem" >
   <%
       String rowClass="";
       row++;
      if(row%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }
       boolean rowspan = true;
   %>
   <logic:iterate id="subOB" name="OB"  property="customerTypeList" type="com.integrosys.cms.app.chktemplate.bus.CustomerTypeResultItem" >
   <%
       sno++;
   %>

            <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              <% if(rowspan) { %>
                <td rowspan="<%=OB.getCustomerTypeList().length%>" valign="top">&nbsp;<bean:write property="lawDesc" name="OB"/></td>
              <% } %>
              <td><bean:write property="custTypeDesc" name="subOB"/></td>
              <td style="text-align:center">
              <% if(subOB.isCompleted()){ %>
              <img src="img/tick(black).gif" width="18" height="16" border="0" />
              <%}else{%>
              &nbsp;
              <%}%>
              </td>
              <% if(subOB.isNew()){%>
                  <%if(!viewOnly){%>
                    <td style="text-align:center"><input type="button" name="Submit5622" value="Create/Edit" class="btnNormal" style="width:80" onclick="goCreateEdit('<%=OB.getLawCode()%>','<%=subOB.getTrxID()%>','<%=subOB.getCustTypeCode()%>')"/></td>
                  <%}else{%>
                  	<td style="text-align:center">-</td>
<%--                    <td style="text-align:center"><input type="button" name="Submit5622" value="New" class="btnNormal" style="width:80" onclick="#"/></td>--%>
                  <%}%>
                <%}else{%>
                    <%if(subOB.isEditAllowed()) {%>
                        <%if(!viewOnly){%>
                            <td style="text-align:center"><input type="button" name="Submit5622" value="Create/Edit" class="btnNormal" style="width:80" onclick="goCreateEdit('<%=OB.getLawCode()%>','<%=subOB.getTrxID()%>','<%=subOB.getCustTypeCode()%>')"/></td>
                        <%}else{%>
                            <td style="text-align:center"><input type="button" name="Submit5622" value="View" class="btnNormal" style="width:80" onclick="goView('<%=subOB.getTrxID()%>')"/></td>
                        <%}%>
                    <%}else{%>
                        <td style="text-align:center"><input type="button" name="Submit5622" value="View" class="btnNormal" style="width:80" onclick="goView('<%=subOB.getTrxID()%>')"/></td>
              <%}}%>
            </tr>
    <% rowspan = false; %>
    </logic:iterate>
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
