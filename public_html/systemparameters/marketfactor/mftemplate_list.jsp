<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.propertyparameters.bus.marketfactor.*,		
                 com.integrosys.cms.ui.systemparameters.marketfactor.EventConstant"%>


<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Maintain MF Template</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" type="text/JavaScript">
  function addNew()
  {
	document.forms[0].event.value = '<%=EventConstant.EVENT_PREPARE_CREATE%>';
	document.forms[0].isCreate.value = 'Y';
    document.forms[0].submit();
  }

  function performSelect(selectObj, templateID)
  {
    var curInd = selectObj.selectedIndex;
    if (curInd == 1)
    {        
		document.forms[0].event.value = '<%=EventConstant.EVENT_READ%>';
        document.forms[0].MFTemplateID.value = templateID;
        document.forms[0].submit();
    }
    else if (curInd == 2)
    {
        document.forms[0].event.value = '<%=EventConstant.EVENT_PREPARE_DELETE%>';
        document.forms[0].MFTemplateID.value = templateID;
        document.forms[0].submit();
    }
  }
  
</script>

<!-- InstanceEndEditable -->
</head>

<body onLoad="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="MaintainMFTemplate.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="isCreate" value=""/>
<input type="hidden" name="MFTemplateID" value=""/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td> <h3><bean:message key="title.mftemplate"/></h3></td>
      <td valign="bottom"><table width="75"  border="0" align="right" cellpadding="0" cellspacing="2">
          <tr> 
            <td width="75" valign="baseline" align="center"> 
				<input type="button" value="Create" class="btnNormal" onclick="javascript:addNew()"/>			
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>  
    <tr>
      <td colspan="2">
        <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="3%"><bean:message key="label.global.sn"/></td>
              <td width="7%"><bean:message key="label.mftemplate.templatename"/></td>
              <td width="9%"><bean:message key="label.last.date.update"/></td>
              <td width="9%"><bean:message key="label.status"/></td>
              <td width="11%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
		  
          <tbody>
			<logic:present name="templateList" scope="request">
		      <% 
				  List templateList = (List)request.getAttribute("templateList");
				  int templateSize = 0;
				  if(templateList != null) {
					templateSize = templateList.size(); 
				  }

			  %>
			  <% if (templateSize > 0) { %>
				<logic:iterate name="templateList" id="element" indexId="ind" type="com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFTemplate">
                <% String rowClass = (ind.intValue()%2==0?"even":"odd"); %>
				<tr class="<%=rowClass%>">
				<%
					int colspanSize = 1;	  
					boolean canDelete = true; 
		   
				%>
                <td class="index" rowspan="<%= colspanSize %>" valign="top" width="3%"><%= ind.intValue() + 1 %></td>
	          	<td valign="top" rowspan="<%= colspanSize %>" width="7%" >&nbsp;<bean:write name="element" property="MFTemplateName"/></td>
	          	<td valign="top" rowspan="<%= colspanSize %>" width="7%" >&nbsp;<bean:write name="element" property="lastUpdateDate" format="dd/MM/yyyy"/></td>
	          	<td width="9%" valign="top">
					<% if ( ICMSConstant.MF_STATUS_ACTIVE.equals( element.getMFTemplateStatus() )) {
						canDelete = false;
		            %>
		            <bean:message key="label.active"/>&nbsp;
		            <%
		            } else {
		            %>
		            <bean:message key="label.inactive"/>&nbsp;
		            <%
		                }
		            %>			
				</td>
          	
				<td width="11%" rowspan="<%= colspanSize %>" valign="middle">
                    <select name="select2" onchange="performSelect(this, '<%= element.getMFTemplateID() %>')">
                      <option value=""><bean:message key="label.please.select"/></option>
                      <option value="edit"><bean:message key="label.view.edit"/></option>
					  <% if( canDelete ) { %>
							<option value="del"><bean:message key="label.global.delete"/></option>
					  <% } %>
                    </select>
                  &nbsp;
                </td>
		</tr>
		
		</logic:iterate>
        <%} else{%>
			<tr class="odd">
				<td colspan="15"><bean:message key="label.global.not.found"/></td>
            </tr>
	    <%}%>
        </logic:present>
	    <logic:notPresent name="templateList" scope="request">
	      <logic:equal name="templateSize" value="0">
			<tr class="odd">
                  <td colspan="15"><bean:message key="label.global.not.found"/></td>
			</tr>
	      </logic:equal>
	    </logic:notPresent>
        </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p>

<!-- InstanceEndEditable -->
</html:form>
</body>
