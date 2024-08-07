<%@ page import="java.util.Collection"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/bfltatparameters/search_bfl_tat_param.jsp,v 1.3 2006/10/27 08:11:12 hmbao Exp $
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.3 $
* Date: $Date: 2006/10/27 08:11:12 $
* Tag: $Name:  $
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
<head>



<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
   Collection countryValue = (Collection) request.getAttribute("countryValues");
%>
<html:form action="/BflTatParams.do?event=list">
<form name="BflTatParametersForm">

<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
  <tr>
	<td><table class="tblInput" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
		<thead>
		  <tr>
			<td colspan="2"><bean:message key="label.global.enterSearchCriteria"/></td>
		  </tr>
		</thead>
		<tbody>
		  <tr class="odd">
			<td class="fieldname"><bean:message key="label.global.country"/> :</td>
			  <td>
              <%if(countryValue!=null && countryValue.size()>0)
              {
                 if(countryValue.size()==1)   { %>
                 <html:select property="countryCode" >
				 <html:options name="countryValues"
					labelName="countryLabels"/>
				 </html:select>

               <%  } else {    %>
               <html:select property="countryCode" >
					<option value="" ><bean:message key="label.please.select"/></option>
				<html:options name="countryValues"
					labelName="countryLabels"/>
				</html:select>

              <%   }
              }   %>
              <br><html:errors property="countryCode"/>&nbsp;
			  </td>
		  </tr>
		</tbody>
	  </table></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
  </tr>
  <tr>
	<td style="text-align:center"><input type="submit" name="go" id="btn_go" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" /></td>
  </tr>
</table>

</html:form>
 </body>
</html>