<%--
  User: Syukri
  Date: Jun 6, 2008
--%>

<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitAction,
				 com.integrosys.cms.ui.common.CommonCodeList" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<bean:define id="formObj" name="SectorLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.sectorlimit.SectorLimitForm"/>
<%     
	boolean hasSectorLimit = false;
	String event = (String) request.getAttribute("event");
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
  
  	//if (selectIndex > 0) {
	  	document.forms[0].event.value = selectObj.options[selectIndex].value;
	  	document.forms[0].sectorLimitId.value = id;
	  	//document.forms[0].groupId.value = groupId;
	  	document.forms[0].submit();
  	//}
  }
  
  function addNew()
  {
	document.forms[0].event.value = '<%=SectorLimitAction.EVENT_PREPARE%>';
    document.forms[0].submit();
  }

  function viewSectorLimit(id)
  { alert("main id:::"+id);
	document.forms[0].event.value = '<%=SectorLimitAction.EVENT_VIEW%>';
	document.forms[0].sectorLimitId.value = id;
    document.forms[0].submit();
  }

  function deleteSectorLimit(id)
  { alert("main id:::"+id);
	document.forms[0].event.value = '<%=SectorLimitAction.EVENT_PREPARE_DELETE%>';
	document.forms[0].sectorLimitId.value = id;
    document.forms[0].submit();
  }
  
-->
</script>

<!-- InstanceEndEditable -->
</head>

<body onLoad="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="SectorLimitParam.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="sectorLimitId" value="-1"/>
<!-- input type="hidden" name="sectorLimitId" value="<%=request.getParameter("sectorLimitId") %>"/-->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.sectorlimit"/></h3></td>
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
              <td width="35%"><bean:message key="label.sectorlimit.main.sector"/></td>
              <td width="12%"><bean:message key="label.sectorlimit.aBank.percentage"/></td>
              <td width="12%"><bean:message key="label.sectorlimit.convBank.percentage"/></td>
			  <td width="12%"><bean:message key="label.sectorlimit.islamicBank.percentage"/></td>
			  <td width="12%"><bean:message key="label.sectorlimit.invBank.percentage"/></td>
              <td width="11%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>

            <tbody>
                   <logic:iterate name="limitList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.sectorlimit.IMainSectorLimitParameter">
                    <% 
                    	hasSectorLimit = true;
                    	String rowClass = (ind.intValue()%2==0?"odd":"even"); 
                    %>
                        <tr class="<%=rowClass%>">
                            <td class="index"><%= ind.intValue() + 1 %></td>
                            <td><integro:empty-if-null value="<%=element.getLoanPurposeCode()%>"/></td>
                            <td><integro:empty-if-null value="<%=element.getLimitPercentage()%>"/></td>
                            <td><integro:empty-if-null value="<%=element.getConventionalBankPercentage()%>"/></td>
							<td><integro:empty-if-null value="<%=element.getIslamicBankPercentage()%>"/></td>
							<td><integro:empty-if-null value="<%=element.getInvestmentBankPercentage()%>"/></td>
                            <td> <select name="actionPerformed" onChange="javascript:submitForm(this, '<%=element.getId()%>')">
									<option value=""><bean:message key="label.please.select"/></option>
                            		<option value="<%=SectorLimitAction.EVENT_VIEW%>"><bean:message key="label.view"/> </option>
                            		<option value="<%=SectorLimitAction.EVENT_PREPARE_DELETE%>"><bean:message key="label.global.delete"/> </option>
                            	</select>                            	
                            </td>
                        </tr>

                    </logic:iterate>
               <% if(!hasSectorLimit){%>
                            <tr class="index">
                                <td colspan="7"><bean:message key="label.global.not.found"/></td>
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