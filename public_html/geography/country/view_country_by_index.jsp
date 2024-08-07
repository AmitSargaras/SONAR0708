<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.country.CountryForm"%>

<%
    CountryForm form = (CountryForm) request.getAttribute("CountryForm");
	String event = (String) request.getAttribute("checkerEvent");
	String ind= (String) request.getAttribute("startIndex");
	int startIndex=0;
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	String actionStr1 = "com.integrosys.cms.ui.geography.country.CountryAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>


<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"Country.do?startIndex="+<%=ind%>;
		document.forms[0].event.value	=	"view_list_country";		
		document.forms[0].submit(); 
	}

	function goBackChecker(){
		document.forms[0].action		=	"Country.do?startIndex="+<%=ind%>;
		document.forms[0].event.value	=	"checker_view_list_country";
		document.forms[0].submit(); 
	}

</script>
<html:form action="Country.do">
<html:hidden property="event"/>
		<body>
		<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>View Country</h3></td></tr>
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

			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr><td width="65">&nbsp;</td>
					<td width="65">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">
						<center>
							<%
								if( "yes".equals(event) ){
							%>
							<a href="javascript:goBackChecker()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
							<% } else { %>
							<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
							<%} %>
						</center>&nbsp;
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

