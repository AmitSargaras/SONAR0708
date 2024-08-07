<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.city.CityForm"%>
<%@page import="com.integrosys.cms.app.geography.city.trx.ICityTrxValue"%>
<%@page import="java.util.List"%>

<%
    CityForm form = (CityForm) request.getAttribute("CityForm");
	ICityTrxValue cityTrx = (ICityTrxValue) session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.ICityTrxValue");
	
	List countryList=null;
	List regionList=null;
	List stateList=null;
	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.countryList");
	regionList = (List)session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.regionList");
	stateList = (List)session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.stateList");
	
	pageContext.setAttribute("countryList",countryList);
	pageContext.setAttribute("regionList",regionList);
	pageContext.setAttribute("stateList",stateList);
%>

<script language="JavaScript" type="text/javascript">
	function approveCreate(){
		document.forms[0].action		=	"City.do";
		document.forms[0].event.value	=	"checker_approve_city";
		document.forms[0].submit(); 
	}
	
	function rejectCreate(){
		document.forms[0].action		=	"City.do";
		document.forms[0].event.value	=	"checker_reject_city";
		document.forms[0].submit(); 
	}
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"totrack";
		document.forms[0].submit(); 
	}

</script>

<html:form action="City.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>
							<%if( cityTrx.getStatus().equals("PENDING_ACTIVATE") ){ %>
								Enable City
							<%} else if( cityTrx.getStatus().equals("PENDING_DELETE") ){ %>
								Disable City
							<%} else { %>
								View City
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
										<td class="fieldname" width="20%">City Code</td>
				                        <td class="odd" width="20%"><bean:write name="CityForm" property="cityCode"/>
				                        <br/><html:errors property="duplicateCityCodeError"/></td>
										
										<td class="fieldname" width="20%">City Name</td>
				                        <td class="even" width="20%"><bean:write name="CityForm" property="cityName"/></td>
									</tr>
									
									<tr class="even">	
										<td class="fieldname" width="20%">Country Name</td>
										<td class="even" width="20%">									
										<%--
											if( cityTrx.getFromState().equals("ND") || cityTrx.getFromState().equals("PENDING_PERFECTION") ){
										--%>	
										<%=cityTrx.getStagingCity().getStateId().getRegionId().getCountryId().getCountryName() %>
										
										<%--} else if( cityTrx.getFromState().equals("DRAFT") ) { --%>
												<%--=cityTrx.getStagingCity().getStateId().getRegionId().getCountryId().getCountryName() --%>
										<%-- } else { --%>
												<%--=cityTrx.getActualCity().getStateId().getRegionId().getCountryId().getCountryName() --%>
										<%-- } --%>	
										
										</td>
										<td class="fieldname" width="20%">Region Name</td>
										<td class="odd" width="20%">
										<%--
											if( cityTrx.getFromState().equals("ND") || cityTrx.getFromState().equals("PENDING_PERFECTION") ){
										--%>	
										<%=cityTrx.getStagingCity().getStateId().getRegionId().getRegionName() %>
										
										<%--} else if( cityTrx.getFromState().equals("DRAFT") ) { --%>
												<%--=cityTrx.getStagingCity().getStateId().getRegionId().getRegionName() --%>
										<%-- } else { --%>
												<%--=cityTrx.getActualCity().getStateId().getRegionId().getRegionName() --%>
										<%-- } --%>	
										
										</td>
									</tr>
									<tr class="even">	
										<td class="fieldname" width="20%">State Name</td>
										<td class="even" width="20%">
										<%--
											if( cityTrx.getFromState().equals("ND") || cityTrx.getFromState().equals("PENDING_PERFECTION") ){
										--%>	
										<%=cityTrx.getStagingCity().getStateId().getStateName() %>
										
										<%--} else if( cityTrx.getFromState().equals("DRAFT") ) { --%>
												<%--=cityTrx.getStagingCity().getStateId().getStateName()--%>
										<%-- } else { --%>
												<%--=cityTrx.getActualCity().getStateId().getStateName() --%>
										<%-- } --%>	
										
										</td>
										
										<td class="fieldname" width="20%">ECBF City Id&nbsp;</td>
										<td class="even" width="20%"><%=cityTrx.getStagingCity().getEcbfCityId()%></td>
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
							<td class="even"><%=cityTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=cityTrx.getRemarks() != null ? cityTrx.getRemarks(): ""%>&nbsp;</td>
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
<html:hidden name="CityForm" property="cityCode" />
<html:hidden name="CityForm" property="cityName" />
<html:hidden name="CityForm" property="id" />
<html:hidden name="CityForm" property="status" />
<html:hidden name="CityForm" property="deprecated" />
</html:form>