<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.List,
                 java.util.Arrays"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: For Maker to view list of Auto Valuation Parameters
* Description: view the list of Auto Valuation Parameters
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    int sno = 0;
    int subTypeMatched = 0;

    List collateralSubTypeFullList = (List)request.getAttribute("collateralSubTypeFullList");
    List collateralSubTypeFullListLabel = (List)request.getAttribute("collateralSubTypeFullListLabel");
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
function MM_jumpMenu(selObj,paramTrxId){ //v3.0
  if(selObj.selectedIndex == 0){
    return ;
  }
  if(selObj.selectedIndex == 1){
    document.forms[0].event.value="maker_prepare_edit";
    document.forms[0].paramTrxId.value=paramTrxId;
    document.forms[0].submit();
  }
  if(selObj.selectedIndex == 2){
    document.forms[0].event.value="view_auto_val_param";
    document.forms[0].paramTrxId.value=paramTrxId;
    document.forms[0].submit();
  }
  if(selObj.selectedIndex == 3){
    document.forms[0].event.value="maker_prepare_delete";
    document.forms[0].paramTrxId.value=paramTrxId;
    document.forms[0].submit();
  }
}

function goToPage() {
    document.forms[0].event.value="maker_prepare_create";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="AutoValParam.do">
<input type="hidden" name="event" />
<input type="hidden" name="paramTrxId" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.auto.valuation.parameter"/></h3></td>
      <td valign="bottom">
        <table width="75"  border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            <td width="75" valign="baseline" align="center">
                <input type="button" value="<bean:message key="label.add.new"/>" class="btnNormal" onclick="goToPage()"/>
            </td>
          </tr>
        </table>
      </td>
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
          <td width="5%"><bean:message key="label.global.sn"/></td>
          <td width="16%"><bean:message key="label.autovalparam.collateral.type"/></td>
          <td width="20%"><bean:message key="label.autovalparam.collateral.subtype"/></td>
          <td width="41%"><bean:message key="label.autovalparam.valuation.description"/></td>
          <td width="18%"><bean:message key="label.global.action"/></td>
        </tr>
        </thead>
        <tbody>
<logic:present name="autoValParamList">
   <logic:iterate id="obParam" name="autoValParamList"  type="com.integrosys.cms.app.propertyparameters.bus.OBPropertyParameters" >
   <%
       String rowClass="";
       sno++;
      if(sno%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }
   %>

        <tr class="<%=rowClass%>">

          <td class="index" height="18" ><%=sno%></td>
          <td >&nbsp;<integro:empty-if-null value="<%=obParam.getPropertyType()%>"/></td>
          <td height="18" >
            <% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
                if(obParam.getSecuritySubTypeList()!=null
                        && (obParam.getSecuritySubTypeList()).contains(collateralSubTypeFullList.get(i))){
                    subTypeMatched++;
                %>
                    &nbsp;<%=collateralSubTypeFullListLabel.get(i)%><br>
                <%
                }
              }
            %>
            
            <% if (subTypeMatched == 0) { %>
                <integro:empty-if-null value="<%=null%>"/>
            <% } %>
          </td>
          <td>&nbsp;<integro:empty-if-null value="<%=obParam.getValuationDescription()%>"/></td>
          <td style="text-align:center">
            <select name="menu1" onchange="MM_jumpMenu(this,'<%=obParam.getParameterId()%>')">
                <option value="0" selected><bean:message key="label.please.select"/></option>
                <option value="edit"><bean:message key="label.edit"/></option>
                <option value="view"><bean:message key="label.view"/></option>
                <option value="delete"><bean:message key="label.global.delete"/></option>
            </select>
          </td>

        </tr>
   </logic:iterate>
</logic:present>
<%if(sno == 0) { %>
<tr class="odd">
<td colspan="5" ><bean:message key="label.global.not.found"/></td>
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
