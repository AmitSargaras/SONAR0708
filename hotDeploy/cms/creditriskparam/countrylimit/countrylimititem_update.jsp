<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.countrylimit.EventConstant,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitItemForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Add New Country Rating</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
  <script type="text/javascript" src="js/itgUtilities.js"></script>
  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
  <script type="text/javascript" src="js/validation.js"></script>
</head>

<body onLoad="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
   function performSubmit()
   {
		if (document.forms[0].indexID.value == '')
		{
		    document.forms[0].event.value = '<%=EventConstant.EVENT_CREATE%>';
		}
		else
		{
		    document.forms[0].event.value = '<%=EventConstant.EVENT_SUBMIT%>';	
		} 
		document.forms[0].submit();	
   }

   function cancelSubmit()
   {
		document.forms[0].event.value = '<%=EventConstant.EVENT_CANCEL%>';
		document.forms[0].submit();
   }

	function killEnter(evt)
	{
		if(evt.keyCode == 13 || evt.which == 13)
		{
			return false;
		}
		return true;
	}   
   
 </script>
<%
CountryLimitItemForm countryLimitItemForm = (CountryLimitItemForm)request.getAttribute("CountryLimitItemForm");
String indexID = countryLimitItemForm.getIndexID();
%>
 <html:form action="CountryLimitItemParam.do">
  <input type="hidden" name="event" value=""/> 
  <input type="hidden" name="errorEvent" value="<%=request.getAttribute("errorEvent")%>"/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="indexID"/>
  
  <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td width="46%"> <h3><%if( indexID.equals("") ) {%><bean:message key="title.crp.countryLimit.rating.add"/><%}else{%><bean:message key="title.crp.countryLimit.rating.edit"/><%}%></h3></td>
     <td width="54%" align="right">&nbsp;</td>
    </tr>
    <tr> 
     <td colspan="2"><hr /></td>
    </tr>
    <tr> 
     <td colspan="2">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
       <tbody>
        <tr class="odd"> 
         <td width="32%" class="fieldname"><bean:message key="label.country"/>&nbsp;<font color="#0000FF">*</font></td>
         <td width="68%">
				 <html:select property="country">
		            <option value=""><bean:message key="label.please.select"/> </option>
		            <html:options collection="countryList" property="value" labelProperty="label"/>
		        </html:select>&nbsp;
				&nbsp;<html:errors property="country" />	 
         </td>
        </tr>
        
        <tr class="even"> 
         <td class="fieldname"><bean:message key="label.crp.countryLimit.country.rating"/>&nbsp;<font color="#0000FF">*</font></td>
         <td>
			<html:select property="countryRating">
		            <option value=""><bean:message key="label.please.select"/></option>
		            <html:options collection="ratingList" property="value" labelProperty="label"/>
		        </html:select>&nbsp;
				&nbsp;<html:errors property="countryRating" />	
         </td>
        </tr>
       </tbody>
	   <html:errors property="duplicateEntryError"/>	
      </table>
     </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
   </thead>
   <tbody>
   </tbody>
  </table>  

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:performSubmit()"><img src="img/ok1.gif" border="0" /></a></td>
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>
 </html:form>
</body>