<%@ page import="com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction,
                 java.util.List, java.util.ArrayList, com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 java.util.ArrayList"%>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: Marketable Securities Policy Cap - prepare page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>

<%
    List values = (List)request.getAttribute("stockExchangeValues");
    List labels = (List)request.getAttribute("stockExchangeLabels");
    pageContext.setAttribute("values", values);
    pageContext.setAttribute("labels", labels);
    
    
    List bankEntityValues = new ArrayList();
    List bankEntityLabels = new ArrayList();
    
    CommonCodeList ccl = CommonCodeList.getInstance(CategoryCodeConstant.BANK_ENTITY);
    bankEntityLabels.addAll(ccl.getCommonCodeLabels());
    bankEntityValues.addAll(ccl.getCommonCodeValues());
    
    ccl = CommonCodeList.getInstance(CategoryCodeConstant.BANK_ENTITY_GROUP);
    
    bankEntityLabels.addAll(ccl.getCommonCodeLabels());
    bankEntityValues.addAll(ccl.getCommonCodeValues());    
	
    pageContext.setAttribute("bankEntityValues", bankEntityValues);
    pageContext.setAttribute("bankEntityLabels", bankEntityLabels);
	
%>

<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(selObj) {
    selectedExchange = document.forms[0].stockExchange.options[document.forms[0].stockExchange.selectedIndex].value;
    //if(selectedExchange=="") {
    //    return false;
    //}
    document.forms[0].stockExchangeName.value=document.forms[0].stockExchange.options[document.forms[0].stockExchange.selectedIndex].text;
    //document.forms[0].bankEntityName.value=document.forms[0].bankEntity.options[document.forms[0].bankEntity.selectedIndex].text;
    document.forms[0].submit();
}

//-->
</script>



<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>

<script type="text/javascript" src="js/imageNavigation.js"></script>
</head>

<body>
<html:form action="PolicyCap.do">
<%
//String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
long roleType = Long.parseLong(teamTypeMemID);

if (roleType == ICMSConstant.TEAM_TYPE_SC_MAKER||roleType == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH) {
    %><input type="hidden" name="event" value="maker_edit"/><%
}
else {
    %><input type="hidden" name="event" value="read"/><%
}
%>
<input type="hidden" name="stockExchangeName"/>
<input type="hidden" name="bankEntityName" value="<%= ((ArrayList)ccl.getCommonCodeLabels()).get(0) %>"/>
<input type="hidden" name="search" value="yes"/>
<input type="hidden" name="bankEntity" value="<%= ((ArrayList)ccl.getCommonCodeValues()).get(0)%>"/>

<!-- InstanceBeginEditable name="Content" -->
   <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
		<thead>
            <tr> 
                <td colspan="2"><bean:message key="label.pls.sel.stock.exchange"/></td>
            </tr>
		</thead>
        <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.stock.exchange"/></td>
              <td>
                <html:select property="stockExchange" onchange="">
                    <html:option value=""><bean:message key="label.please.select"/></html:option>
                    <html:options name="values" labelName="labels"/>
                </html:select>
                <html:errors property="stockExchange"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.bank.entity"/></td>
              <td>
                <html:select property="bankEntity" onchange="">
                    <html:option value=""><bean:message key="label.please.select"/></html:option>
                    <html:options name="bankEntityValues" labelName="bankEntityLabels"/>
                </html:select>
                <html:errors property="bankEntity"/>
              </td>           
            </tr>           
        </tbody>
    </table></td>
    </tr>
    <tr>
    	<td>&nbsp;</td>
    </tr>
  	<tr>
	    <td align="center"><a href="javascript:submitPage(this)"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/go1b.gif',1)"><img src="img/go1.gif" name="Image1" width="54" height="22" border="0" id="Image1" /></a></td>
	</tr> 
  </table>
</html:form>
</body>
</html>
