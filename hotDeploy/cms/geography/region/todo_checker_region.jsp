<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.region.RegionForm"%>
<%@page import="com.integrosys.cms.app.geography.region.trx.IRegionTrxValue"%>
<%@page import="java.util.List"%>

<%
    RegionForm form = (RegionForm) request.getAttribute("RegionForm");
	IRegionTrxValue regionTrx = (IRegionTrxValue) session.getAttribute("com.integrosys.cms.ui.geography.region.RegionAction.IRegionTrxValue");
	
	List countryList=null;
	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.region.RegionAction.countryList");	
	pageContext.setAttribute("countryList",countryList);
	System.out.print(" countryList :"+countryList.size());
	
	
%>



<script language="JavaScript" type="text/javascript">
	function approveCreate(){
		document.forms[0].action		=	"Region.do";
		document.forms[0].event.value	=	"checker_approve_region";
		document.forms[0].submit(); 
	}
	
	function rejectCreate(){
		document.forms[0].action		=	"Region.do";
		document.forms[0].event.value	=	"checker_reject_region";
		document.forms[0].submit(); 
	}
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"totrack";
		document.forms[0].submit(); 
	}

</script>

<html:form action="Region.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>
							<%if( regionTrx.getStatus().equals("PENDING_ACTIVATE") ){ %>
								Enable Region
							<%} else if( regionTrx.getStatus().equals("PENDING_DELETE") ){ %>
								Disable Region
							<%} else { %>
								View Region
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
										<td class="fieldname" width="20%">Region Code</td>
				                        <td class="odd" width="20%"><bean:write name="RegionForm" property="regionCode"/>
				                        <br/><html:errors property="duplicateRegionyCodeError"/></td>
										
										<td class="fieldname" width="20%">Region Name</td>
				                        <td class="even" width="20%"><bean:write name="RegionForm" property="regionName"/>
				                        <br/><html:errors property="duplicateRegionyNameError"/></td>
									</tr>
									
									<tr class="even">	
										<td class="fieldname" width="20%">Country Name</td>
										<td class="even" width="20%">
										<%--
											if( regionTrx.getFromState().equals("ND") || regionTrx.getFromState().equals("PENDING_PERFECTION") ){
										--%>	
										<%=regionTrx.getStagingRegion().getCountryId().getCountryName() %>
										<%--} else if( regionTrx.getFromState().equals("DRAFT") ) { --%>
												<%--=regionTrx.getStagingRegion().getCountryId().getCountryName()--%>
										<%-- } else { --%>
												<%--=regionTrx.getActualRegion().getCountryId().getCountryName() --%>
										<%-- } --%>	
										</td>
										<td class="fieldname" width="20%">&nbsp;</td>
										<td class="even" width="20%">&nbsp;</td>
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
							<td class="even"><%=regionTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=regionTrx.getRemarks() != null ? regionTrx.getRemarks(): ""%>&nbsp;</td>
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
				</tr>
			<tr>


			<td valign="baseline" align="center">
			<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/approve2.gif',1)"
				onClick="approveCreate()"><img src="img/approve1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td valign="baseline" align="center">	 
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"
				onClick="rejectCreate()"><img src="img/reject1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td valign="baseline" align="center">	
				 <a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> &nbsp;
			 </td>

				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
	</body>
<html:hidden name="RegionForm" property="regionCode" />
<html:hidden name="RegionForm" property="regionName" />
<html:hidden name="RegionForm" property="id" />
<html:hidden name="RegionForm" property="status" />
<html:hidden name="RegionForm" property="deprecated" />
</html:form>