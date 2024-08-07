<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.country.CountryForm"%>

<%
    CountryForm form = (CountryForm) request.getAttribute("CountryForm");
	String ind= (String) request.getAttribute("startIndex"); 
%>


<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"Country.do?startIndex="+<%=ind%>;
		document.forms[0].event.value	=	"view_list_country";
		document.forms[0].submit(); 
	}

	function activateCountry(){
		var ans = window.confirm('Are You Sure to Enable the COUNTRY ');
		if( ans == true )
		{
			document.forms[0].action		=	"Country.do";
			document.forms[0].event.value	=	"maker_activate_country";
			document.forms[0].submit();
		}
	}
	
</script>

<html:form action="Country.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>Enable Country</h3></td></tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>									
									<tr class="odd">	
										<td class="fieldname" width="20%">Country Code</td>
				                        <td class="even" width="20%"><bean:write name="CountryForm" property="countryCode"/></td>
										
										<td class="fieldname" width="20%">Country Name</td>
				                        <td class="even" width="20%"><bean:write name="CountryForm" property="countryName"/></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td width="65">&nbsp;</td>
					<td width="65">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<center>
							<a href="javascript:activateCountry()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)"><img
									src="img/submit1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
						</center>	
						</td> 
						<td colspan="2">
							<center>
							<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
						</center>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
	</body>
<html:hidden name="CountryForm" property="countryCode" />
<html:hidden name="CountryForm" property="countryName" />
<html:hidden name="CountryForm" property="id" />
<html:hidden name="CountryForm" property="status" />
<html:hidden name="CountryForm" property="deprecated" />
</html:form>

