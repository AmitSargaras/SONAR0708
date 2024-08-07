
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger, 
				com.integrosys.cms.app.propertyindex.bus.IPropertyIdxSecSubType,
				org.apache.commons.lang.StringUtils,
				com.integrosys.cms.app.common.constant.ICMSConstant,
				com.integrosys.component.commondata.app.CommonDataSingleton,
				java.util.List,
				java.util.Iterator"
%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: For Maker to view list of Property Valuation By Index
* Description: view the list of Property Valuation By Index
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
	String event = request.getParameter("event");
    List propertySubtypeFullList = (List)request.getAttribute("propertySubTypeFullList");
    List propertySubtypeFullListLabel = (List)request.getAttribute("propertySubTypeFullListLabel");
 
%>

<%@page import="com.integrosys.cms.app.propertyindex.bus.OBPropertyIdxSecSubType"%>
<html>
<head>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(selObj,propertyIdxId){ //v3.0
  if(selObj.selectedIndex == 0){
    return ;
  }
  if(selObj.selectedIndex == 1){
    document.forms[0].event.value="maker_prepare_edit";
    document.forms[0].propertyIdxId.value=propertyIdxId;
    document.forms[0].submit();
  }
  else if(selObj.selectedIndex == 2){
    document.forms[0].event.value="maker_prepare_delete";
    document.forms[0].propertyIdxId.value=propertyIdxId;
    document.forms[0].submit();
  } 
}

function MM_jumpMenu2(selObj,propertyIdxId){ //v3.0
  if(selObj.selectedIndex == 0){
    return ;
  }
  if(selObj.selectedIndex == 1){
    document.forms[0].event.value="checker_view_property_index";
    document.forms[0].propertyIdxId.value=propertyIdxId;
    document.forms[0].submit();
  }

}

function goToPage() {
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="MaintainPropertyIndex.do">
<input type="hidden" name="event" value="maker_prepare_create"/>
<input type="hidden" name="propertyIdxId" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.property.valuation.by.index.name"/></h3></td>
      <td valign="bottom">
        <table width="75"  border="0" align="right" cellpadding="0" cellspacing="2">
        <!--maker can view the add new button-->
        <%if(event.equals("property_index_list")){%>
          <tr>
           <td width="75" valign="baseline" align="center">
                <input type="button" value="Add New" class="btnNormal" onclick="goToPage()"/>
            </td>
          </tr>
        <% } %>
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
          <td width="5%"><bean:message key="label.property.valuation.by.index.sn"/></td>
          <td width="16%"><bean:message key="label.property.valuation.by.index.collateral.type"/></td>
          <td width="20%"><bean:message key="label.property.valuation.by.index.property.subtype"/></td>
          <td width="41%"><bean:message key="label.property.valuation.by.index.valuation.description"/></td>
          <td width="18%"><bean:message key="label.property.valuation.by.index.action"/></td>
        </tr>
        </thead>
        <tbody>
       <logic:present name="propertyIdxList">
   	   <logic:iterate id="obParam" name="propertyIdxList"  type="com.integrosys.cms.app.propertyindex.bus.OBPropertyIdx" >
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
          <td >&nbsp;<integro:empty-if-null value="Property"/></td>
          <td height="18" >
            <% 
            for(int i=0; i<propertySubtypeFullListLabel.size(); i++){
	        	for (Iterator iter = obParam.getPropertyIdxSecSubTypeList().iterator(); iter.hasNext();) {
					IPropertyIdxSecSubType secSubType = (IPropertyIdxSecSubType) iter.next();
					
					if(StringUtils.equals(secSubType.getSecuritySubTypeId(), propertySubtypeFullList.get(i).toString()))
	                {
	                    subTypeMatched++;
	                    out.print("&nbsp;" + propertySubtypeFullListLabel.get(i) + "<br>");
						break;
                	}
				}
            }
            %>
            
            <% if (subTypeMatched == 0) { %>
                <integro:empty-if-null value="<%=null%>"/>
            <% } %>
          </td>
          
          <td>&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.PROP_VAL_DESCR, obParam.getValDescr())%>"/></td>
          
          <td style="text-align:center">
           <!--maker can view these options-->
           <%if(event.equals("property_index_list")){%>
            <select name="menu1" onchange="MM_jumpMenu(this,'<%=obParam.getPropertyIdxId()%>')">
                <option value="0" selected><bean:message key="label.please.select"/></option>
                <option value="edit"><bean:message key="label.edit"/>/<bean:message key="label.view"/></option>
                <option value="delete"><bean:message key="label.global.delete"/></option>
            </select>
            <!--checker can view these options-->
            <%} else {%>
            <select name="menu2" onchange="MM_jumpMenu2(this,'<%=obParam.getPropertyIdxId()%>')">
                <option value="0" selected><bean:message key="label.please.select"/></option>
                <option value="view"><bean:message key="label.view"/></option>
            </select>
            <%}%>
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
