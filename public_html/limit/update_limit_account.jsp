<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.limit.limitaccount.LimitAccountAction,
                 com.integrosys.cms.ui.limit.limitaccount.LimitAccountForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
</head>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
   	function submitAccount() {
		if (document.forms[0].indexID.value == -1) {
	    	document.forms[0].event.value = "<%=LimitAccountAction.EVENT_CREATE%>";
    	} else {
	    	document.forms[0].event.value = "<%=LimitAccountAction.EVENT_UPDATE%>";	
		} 
		document.forms[0].submit();	
   	}

   function cancelSubmit()
   {
	document.forms[0].event.value = "<%=LimitAccountAction.EVENT_RETURN%>";
	document.forms[0].submit();
   }
	
   function refreshHostSystem(dropdown)
   {
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
        }	
        var dep = 'hostSystemName';
        var url = '/cms/LimitAccount.do?event=refresh&hostSystemCountry='+curSel;
        sendLoadDropdownReq(dep, url);
   }	
 </script>
 <html:form action="LimitAccount">
  <input type="hidden" name="event" value=""/> 
  <input type="hidden" name="from_page" value="<%=(String)request.getParameter("from_page")%>"/>
  <input type="hidden" name="limitID" value="<%=(String)request.getParameter("limitID")%>" />	
  <html:hidden property="indexID"/>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td width="46%"> <h3>Add Account/X-Reference Details</h3></td>
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
         <td width="32%" class="fieldname"><bean:message key="label.limit.account.host.country"/></td>
         <td width="68%">
          <html:select property="hostSystemCountry" onchange="javascript:refreshHostSystem(this)">
	   <option value="">Please Select </option>	
           <html:options collection="hostSystemCountryList" property="value" labelProperty="label"/>  
          </html:select>
          &nbsp;<html:errors property="hostSystemCountry" />
         </td>
        </tr>
        <tr class="even"> 
         <td class="fieldname">Host/Source System Name</td>
         <td>
          <html:select property="hostSystemName">
	   <option value="">Please Select </option>	
           <html:options collection="hostSystemNameList" property="value" labelProperty="label"/>     
          </html:select>
          &nbsp;<html:errors property="hostSystemName" />
         </td>
        </tr>
        <tr class="odd"> 
         <td class="fieldname"><bean:message key="label.limit.account.no"/></td>
         <td>
          <html:text property="accountNo"/>
          &nbsp;<html:errors property="accountNo" />
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
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td><h3>Account Details </h3></td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
   </thead>
   <tbody>
    <tr> 
     <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
       <thead>
       </thead>
       <tbody>
        <tr class="odd">
         <td class="fieldname">Account Classification</td>
         <td>&nbsp;<bean:write name="LimitAccountForm" property="acctClassification"/>&nbsp;</td>
         <td class="fieldname">Effective Date</td>
         <td>&nbsp;<bean:write name="LimitAccountForm" property="effectiveDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
         <td class="fieldname">Account Status</td>
         <td>&nbsp;<bean:write name="LimitAccountForm" property="acctStatus"/>&nbsp;</td>
         <td class="fieldname">Net Outstanding Amount</td>
         <td>&nbsp;<bean:write name="LimitAccountForm" property="netOutstandingCcy"/>&nbsp;<bean:write name="LimitAccountForm" property="netOutstandingAmt"/></td>
        </tr>
	<tr class="odd">
	 <td class="fieldname">Realisable Value</td>
         <td>&nbsp;<bean:write name="LimitAccountForm" property="rvCcy"/>&nbsp;<bean:write name="LimitAccountForm" property="realizableVal"/></td>
         <td class="fieldname">&nbsp;</td>
         <td>&nbsp;</td>	
	</tr>	
       </tbody>
      </table>
     </td>
    </tr>
    <tr>
     <td>
      &nbsp;
     </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
   </tbody>
  </table>

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:submitAccount()"><img src="img/ok1.gif" border="0" /></a></td>
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>
 </html:form>
</body>