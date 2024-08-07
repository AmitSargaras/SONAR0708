<%--
  User: Priya
  Date: Oct 12, 2009
--%>

<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 java.text.NumberFormat,
				 java.text.DecimalFormat" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%     
	String event = (String) request.getAttribute("event");
	boolean isListExists = false; 
	
	NumberFormat formatter = new DecimalFormat("#############.##");
%>
<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Maintain Sector Limit Parameter</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" type="text/JavaScript">
<!--
  function submitForm(selectObj, id) {
  	var selectIndex = selectObj.selectedIndex;
  
    	document.forms[0].event.value = selectObj.options[selectIndex].value;
	  	document.forms[0].productLimitId.value = id;
	  	document.forms[0].submit();

  }
  
  function addNew()
  {
	document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_PREPARE%>';
    document.forms[0].submit();
  }

  function viewSectorLimit(id)
  { 
	document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_VIEW%>';
	document.forms[0].productLimitId.value = id;
    document.forms[0].submit();
  }

  function deleteSectorLimit(id)
  { 
	document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_PREPARE_DELETE%>';
	document.forms[0].productLimitId.value = id;
    document.forms[0].submit();
  }
  
-->
</script>

<!-- InstanceEndEditable -->
</head>

<body onLoad="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="ProductProgramLimitParam.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="productLimitId" value="-1"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.productlimit.program"/></h3></td>
      <td valign="bottom">
        <table border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            <td valign="baseline" align="center">
				<input type="button" value="<bean:message key="label.add.new"/>" class="btnNormal" onclick="javascript:addNew()"/>
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
        <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr style="border:3px solid red">
              <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="45%"><bean:message key="label.productlimit.product.program"/></td>
              <td width="30%"><bean:message key="label.productlimit.limit.amount"/></td>
              <td width="20%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>

            <tbody>
            
              
                    <logic:iterate name="limitList" id="element" indexId="ind" scope="request" type="com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductProgramLimitParameter">
                    <% 
                    	String rowClass = (ind.intValue()%2==0?"odd":"even"); 
                    	isListExists = true; 
                    %>
                        <tr class="<%=rowClass%>">
                            <td class="index"><%= ind.intValue() + 1 %></td>
                            <td><integro:empty-if-null value="<%=element.getProductProgramDesc()%>"/></td>
                            <td><%=element.getLimitAmount() == null ? "-" : element.getLimitAmount().getCurrencyCode()%>
                            	<%=element.getLimitAmount() == null ? "" : formatter.format(element.getLimitAmount().getAmount())%>
                            </td>
                            <td> <%//out.println(element.getId()); %>
                            	<select name="actionPerformed" onChange="javascript:submitForm(this, '<%=element.getId()%>')">
									<option value=""><bean:message key="label.please.select"/></option>
                            		<option value="<%=ProductProgramLimitAction.EVENT_VIEW%>"><bean:message key="label.view"/> </option>
                            		<option value="<%=ProductProgramLimitAction.EVENT_PREPARE_DELETE%>"><bean:message key="label.global.delete"/> </option>
                            	</select>                            	
                            </td>
                        </tr>

                    </logic:iterate>
                    <% if(!isListExists){%>
                            <tr class="index">
                                <td colspan="4"><bean:message key="label.global.not.found"/></td>
                            </tr>
                    <% } %>
                
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
</html>