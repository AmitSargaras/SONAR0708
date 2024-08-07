<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.state.StateForm"%>
<%@page import="com.integrosys.cms.app.geography.state.trx.IStateTrxValue"%>
<%@page import="java.util.List"%>

<%
    StateForm form = (StateForm) request.getAttribute("StateForm");
	IStateTrxValue stateTrx = (IStateTrxValue) session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.IStateTrxValue");
	
	System.out.println(" stateTrx getFromState::"+ stateTrx.getFromState());
	System.out.println(" stateTrx getStatus::"+ stateTrx.getStatus());
	
	List countryList=null;
	List regionList=null;
	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.countryList");
	regionList = (List)session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.regionList");
	
	pageContext.setAttribute("countryList",countryList);
	pageContext.setAttribute("regionList",regionList);
%>


<script language="JavaScript" type="text/javascript">
	function approveCreate(){
		document.forms[0].action		=	"State.do";
		document.forms[0].event.value	=	"checker_approve_state";
		document.forms[0].submit(); 
	}
	
	function rejectCreate(){
		document.forms[0].action		=	"State.do";
		document.forms[0].event.value	=	"checker_reject_state";
		document.forms[0].submit(); 
	}
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"totrack";
		document.forms[0].submit(); 
	}

</script>

<html:form action="State.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>
						<%if( stateTrx.getStatus().equals("PENDING_ACTIVATE") ){ %>
								Enable State
							<%} else if( stateTrx.getStatus().equals("PENDING_DELETE") ){ %>
								Disable State
							<%} else { %>
								View State
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
										<td class="fieldname" width="20%">State Code</td>
				                        <td class="odd" width="20%"><bean:write name="StateForm" property="stateCode"/>
				                        <br/><html:errors property="duplicateStateCodeError"/></td>
										
										<td class="fieldname" width="20%">State Name</td>
				                        <td class="even" width="20%"><bean:write name="StateForm" property="stateName"/>
				                        <br/><html:errors property="duplicateStateNameError"/></td>
									</tr>
									
									<tr class="even">	
										<td class="fieldname" width="20%">Country Name</td>
										<td class="even" width="20%">
										<%--
											if( stateTrx.getFromState().equals("ND") || stateTrx.getFromState().equals("PENDING_PERFECTION") ){
										--%>	
										<%=stateTrx.getStagingState().getRegionId().getCountryId().getCountryName() %>
										<%--} else if( stateTrx.getFromState().equals("DRAFT") ) { --%>
												<%--=stateTrx.getStagingState().getRegionId().getCountryId().getCountryName() --%>
										<%-- } else { --%>
												<%--=stateTrx.getActualState().getRegionId().getCountryId().getCountryName() --%>
										<%-- } --%>		
										</td>
										
										<td class="fieldname" width="20%">Region Name</td>
										<td class="odd" width="20%">		
										
										<%--
											if( stateTrx.getFromState().equals("ND") || stateTrx.getFromState().equals("PENDING_PERFECTION") ){
										--%>	
										<%=stateTrx.getStagingState().getRegionId().getRegionName() %>
										<%--} else  if( stateTrx.getFromState().equals("DRAFT") ) { --%>	
												<%--=stateTrx.getStagingState().getRegionId().getRegionName() --%>
												<%--}  else { --%>
												<%--=stateTrx.getActualState().getRegionId().getRegionName() --%>
										<%-- } --%>	
										
																	
																				
										</td>
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
							<td class="even"><%=stateTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=stateTrx.getRemarks() != null ? stateTrx.getRemarks(): ""%>&nbsp;</td>
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
				</tr>
			</table>


			<!-- InstanceEndEditable -->
	</body>
<html:hidden name="StateForm" property="stateCode" />
<html:hidden name="StateForm" property="stateName" />
<html:hidden name="StateForm" property="id" />
<html:hidden name="StateForm" property="status" />
<html:hidden name="StateForm" property="deprecated" />
</html:form>