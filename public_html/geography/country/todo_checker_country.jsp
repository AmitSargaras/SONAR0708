<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.country.CountryForm"%>
<%@page import="com.integrosys.cms.app.geography.country.trx.ICountryTrxValue"%>

<%
    CountryForm form = (CountryForm) request.getAttribute("CountryForm");
	ICountryTrxValue countryTrx = (ICountryTrxValue) session.getAttribute("com.integrosys.cms.ui.geography.country.CountryAction.ICountryTrxValue");
	System.out.print("countryTrx.getStatus() "+countryTrx.getStatus());
%>

<script language="JavaScript" type="text/javascript">
	function approveCreate(){
		document.forms[0].action		=	"Country.do";
		document.forms[0].event.value	=	"checker_approve_country";
		document.forms[0].submit(); 
	}
	
	function rejectCreate(){
		document.forms[0].action		=	"Country.do";
		document.forms[0].event.value	=	"checker_reject_country";
		document.forms[0].submit(); 
	}
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"totrack";
		document.forms[0].submit(); 
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
					<tr><td><h3>
							<%if( countryTrx.getStatus().equals("PENDING_ACTIVATE") ){ %>
								Enable Country
							<%} else if( countryTrx.getStatus().equals("PENDING_DELETE") ){ %>
								Disable Country
							<%} else { %>
								View Country
							<%} %>		
						</h3></td></tr>
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
				                        <td class="even" width="20%"><bean:write name="CountryForm" property="countryCode"/>
				                         <br/><html:errors property="duplicateCountryCodeError"/></td>
										
										<td class="fieldname" width="20%">Country Name</td>
				                        <td class="even" width="20%"><bean:write name="CountryForm" property="countryName"/>
				                        <br/><html:errors property="duplicateCountryNameError"/></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					
					<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="even"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea>
							<br/><html:errors property="remarkError"/></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=countryTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=countryTrx.getRemarks() != null ? countryTrx.getRemarks(): ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
					</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr><td valign="baseline" align="center">&nbsp;</td>
					<td valign="baseline" align="center">&nbsp;</td>
					<td valign="baseline" align="center">&nbsp;</td>
				</tr>
			<tr>
			<td width="100" valign="baseline" align="center"> 
			<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/approve2.gif',1)"
				onClick="approveCreate()"><img src="img/approve1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td width="100" valign="baseline" align="center"> 	 
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"
				onClick="rejectCreate()"><img src="img/reject1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td width="100" valign="baseline" align="center"> 
			<a href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> &nbsp;
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