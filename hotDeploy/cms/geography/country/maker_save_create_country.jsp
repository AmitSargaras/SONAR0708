<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.country.CountryForm"%>

<%
	CountryForm form = (CountryForm) request.getAttribute("CountryForm");
%>
<%
	String context = request.getContextPath() + "/";

System.out.println("************************************ "+context);
%>
<head>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"prepare";
		document.forms[0].submit(); 
	}
 	
	function sumbitSavedCountry(){
		document.forms[0].action		=	"Country.do";
		document.forms[0].event.value	=	"maker_create_saved_country";
		document.forms[0].submit();
	}

</script>
</head>

<html:form action="Country.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>Create Saved Country</h3></td></tr>
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
										<td class="fieldname" width="20%">Country Code<font color="red">*</font></td>
				                        <td class="even" width="20%"><bean:write name="CountryForm" property="countryCode"/></td>
										
										<td class="fieldname" width="20%">Country Name</td>
				                        <td class="even" width="20%"><html:text property="countryName"></html:text>
				                        <br/><html:errors property="countryNameError"/>
				                        <br/><html:errors property="specialCharacterNameError"/></td>
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
							<a href="javascript:sumbitSavedCountry()" onmouseout="MM_swapImgRestore()"
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