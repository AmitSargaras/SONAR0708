<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.systemparameters.marketfactor.EventConstant,
                 com.integrosys.cms.ui.systemparameters.marketfactor.MFItemForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Maintain MF Template</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

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

 <html:form action="MaintainMFItem.do">
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  
  <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td width="46%"> <h3><bean:message key="title.mfitem"/></h3></td>
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
         <td width="32%" class="fieldname"><bean:message key="label.mfitem.factordesc"/>&nbsp;<font color="#0000FF">*</font></td>
         <td width="68%">
		    <html:textarea property="factorDescription" rows="3" cols="120" onkeyup="limitTextInput(this.form.factorDescription, 250, 'Factor Description');"/>&nbsp; 
	        &nbsp;<html:errors property="factorDescription" />	 
         </td>
        </tr>
        
        <tr class="odd"> 
         <td class="fieldname"><bean:message key="label.mfitem.weightpercentage"/>&nbsp;<font color="#0000FF">*</font></td>
         <td>
            <html:text property="weightPercentage" onkeypress="return killEnter(window.event);"/>
			&nbsp;<html:errors property="weightPercentage" />	
         </td>
        </tr>
       </tbody>
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