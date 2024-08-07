<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.countrylimit.EventConstant,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryRatingForm,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitUIHelper,
				 com.integrosys.cms.ui.feed.FeedUtils" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Edit Maximum Country Limit</title>
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
		document.forms[0].event.value = '<%=EventConstant.EVENT_SUBMIT%>';	
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

 <html:form action="CountryRatingParam.do">
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
<%
	CountryLimitUIHelper helper = new CountryLimitUIHelper();
	CountryRatingForm formObj = (CountryRatingForm)request.getAttribute("CountryRatingForm");
	String[] ratingItem = formObj.getCountryRating();
	int itemLength = 0;
	if( ratingItem != null ) {
		itemLength = ratingItem.length;
	}
%>  
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td width="46%"> <h3><bean:message key="title.crp.countryLimit.max.country.limit.edit"/></h3></td>
     <td width="54%" align="right">&nbsp;</td>
    </tr>
    <tr> 
     <td colspan="2"><hr /></td>
    </tr>
    <tr> 
     <td colspan="2">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		<thead>
			<tr>
				<td width="2%"><bean:message key="label.global.sno"/></td>
				<td width="18%"><bean:message key="label.crp.countryLimit.country.rating"/></td>
				<td width="15%"><bean:message key="label.crp.countryLimit.bank.capital.funds.percentage"/></td>  
				<td width="15%"><bean:message key="label.crp.countryLimit.preset.country.limit.percentage"/></td>  
			</tr>
		</thead>
        <tbody>

			<% for (int itemInd = 0; itemInd < itemLength; itemInd++) { %>				
						
				<tr class="<%=(itemInd + 1)%2==0?"even":"odd"%>">
					<td class="index">
						<%= itemInd + 1 %>
					</td>                                        
					<td>
						&nbsp;<integro:wrapper value="<%=helper.getRatingDesc( formObj.getCountryRating()[itemInd] )%>"/>
					</td>
					
					<%
					String countryRatingName = "countryRating["+(itemInd)+"]";
					%>
					<input type="hidden" name="countryRating" size="20" value="<%=(formObj.getCountryRating()[itemInd]==null?"":formObj.getCountryRating()[itemInd])%>"/>

					<td>
					
						<%
						String bankCapFundPercentName = "bankCapFundPercent["+(itemInd)+"]";
						%>
						<input type="text" name="bankCapFundPercent" size="20" value="<%=(formObj.getBankCapFundPercent()[itemInd]==null?"":formObj.getBankCapFundPercent()[itemInd])%>"/>

						&nbsp;
						<br><html:errors property='<%="bankCapFundPercent" + itemInd%>' />
					</td>
						<%
						String presetCountryLimitPercentName = "presetCountryLimitPercent["+(itemInd)+"]";
						%>
					<td>
						<input type="text" name="presetCountryLimitPercent" size="20" value="<%=(formObj.getPresetCountryLimitPercent()[itemInd]==null?"":formObj.getPresetCountryLimitPercent()[itemInd])%>"/>
					
						<br><html:errors property='<%="presetCountryLimitPercent" + itemInd%>' />
					</td>								
							
				</tr>
			<% } %>			   
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