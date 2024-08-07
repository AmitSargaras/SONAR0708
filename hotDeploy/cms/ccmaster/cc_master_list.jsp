<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    List list = (List)request.getAttribute("ccMasterList");
    //System.out.println(list);
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
    document.forms[0].event.value="edit_cc_master";
 //   alert(document.forms[0].custTypeTrxID.value);
    document.forms[0].submit();
}

function goCreate(lawCode,custTypeCode) {
    document.forms[0].event.value="create_cc_master";
    document.forms[0].lawCode.value=lawCode;
    document.forms[0].custTypeCode.value=custTypeCode;
  //    alert("sfssdaf"+custTypeCode);
    document.forms[0].submit();
}


function goView(trxId) {
    // alert(trxId);
    document.forms[0].custTypeTrxID.value=trxId;
    document.forms[0].event.value="view_cc_master";
    <%if(viewOnly){%>
        document.forms[0].view.value="view";
    <%}%>
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
<html:form action="CCMaster.do">
<input type="hidden" name="event" />
<input type="hidden" name="view" />
<input type="hidden" name="custTypeTrxID" />
<input type="hidden" name="lawCode" />
<input type="hidden" name="custTypeCode" />

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Constitutional / Contractual Document Template - Master</h3></td>
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
              <td width="8%">S/N</td>
              <td width="16%">Law</td>
              <td width="44%">Constitution</td>
              <td width="16%">Completed</td>
              <td width="16%">Action</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="ccMasterList">
   <logic:iterate id="OB" name="ccMasterList"  type="com.integrosys.cms.app.chktemplate.bus.LawSearchResultItem" >
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
