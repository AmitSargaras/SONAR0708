<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.region.RegionForm"%>


<%
    RegionForm form = (RegionForm) request.getAttribute("RegionForm");
	String event = (String) request.getAttribute("checkerEvent");
	String ind= (String) request.getAttribute("startIndex");
%>
<%
String actionStr1 = "com.integrosys.cms.ui.geography.region.RegionAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>

<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"Region.do?startIndex="+<%=ind%>;
		document.forms[0].event.value	=	"view_list_region";
		document.forms[0].submit(); 
	}

	function goBackChecker(){
		document.forms[0].action		=	"Region.do?startIndex="+<%=ind%>;
		document.forms[0].event.value	=	"checker_view_list_region";
		document.forms[0].submit(); 
	}
</script>

<html:form action="Region.do">
<html:hidden property="event"/>
<center>
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
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>View Region</h3></td></tr>
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
										<td class="fieldname" width="20%">Region Code</td>
				                        <td class="even" width="20%"><bean:write name="RegionForm" property="regionCode"/></td>
										
										<td class="fieldname" width="20%">Region Name</td>
				                        <td class="even" width="20%"><bean:write name="RegionForm" property="regionName"/></td>
									</tr>
									<tr class="even">	
										<td class="fieldname" width="20%">Country Name</td>
										<td class="even" width="20%">									
											<html:select property="countryOBId" name="RegionForm" disabled="true">				                  
												<html:option value="">Please Select</html:option>                      
												<html:options collection ="countryList" labelProperty ="label" property ="value"/>								                   
											</html:select>									
										</td>
										<td class="fieldname" width="20%">&nbsp;</td>
										<td class="even" width="20%">&nbsp;</td>
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
</center>
<html:hidden property="countryId"/>
</html:form>