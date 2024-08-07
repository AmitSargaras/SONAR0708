<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.state.StateForm"%>
<%@page import="com.integrosys.cms.app.geography.state.trx.IStateTrxValue"%>

<%
    StateForm form = (StateForm) request.getAttribute("StateForm");
	IStateTrxValue stateTrx = (IStateTrxValue) session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.IStateTrxValue");
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
					<tr><td><h3>View State</h3></td></tr>
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
				                        <td class="even" width="20%"><bean:write name="StateForm" property="stateCode"/></td>
										
										<td class="fieldname" width="20%">State Name</td>
				                        <td class="even" width="20%"><bean:write name="StateForm" property="stateName"/></td>
									</tr>
									
									<tr class="even">	
										<td class="fieldname" width="20%">Country Name</td>
										<td class="even" width="20%">									
										<html:select property="countryOBId" name="StateForm">				                  
											<html:option value="">Please Select</html:option>                      
											<html:options collection ="countryList" labelProperty ="label" property ="value"/>								                   
										</html:select>									
										</td>
										
										<td class="fieldname" width="20%">Region Name</td>
										<td class="even" width="20%">									
											<html:select property="regionOBId" name="StateForm">				                  
											<html:option value="">Please Select</html:option>                      
											<html:options collection ="regionList" labelProperty ="label" property ="value"/>								                   
										</html:select>									
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
				<tr><td width="65">&nbsp;</td>
					<td width="65">&nbsp;</td>
				</tr>
			<tr>


			<td colspan="4"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/approve2.gif',1)"
				onClick="approveCreate()"><img src="img/approve1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp; 
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"
				onClick="rejectCreate()"><img src="img/reject1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp; <a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> &nbsp;</td>

				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
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