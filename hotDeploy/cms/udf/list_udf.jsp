<jsp:directive.page import="java.util.Collection"/>
<jsp:directive.page import="com.integrosys.base.uiinfra.tag.PageIndex"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.Set"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.integrosys.cms.app.udf.bus.IUdf"/>
<%@page import="com.integrosys.cms.app.udf.bus.UDFConstants"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% 
    Map udfMap = (Map) session.getAttribute("com.integrosys.cms.ui.udf.UdfAction.UdfMap");
    List udfKeyList = (List) session.getAttribute("com.integrosys.cms.ui.udf.UdfAction.udfKeyList");
    int rowCount = 0;
    pageContext.setAttribute("UdfKeyList", udfKeyList);
    List udfList = null;
    boolean isCpuAdmMaker=false;
    boolean isCpuAdmMakerCheck=false;
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    System.out.println("***********************"+user.getTeamTypeMembership().getMembershipID());
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER
    		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH 
    		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER
    		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH){
    	isCpuAdmMaker=true;
    }
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER_WFH){
    	isCpuAdmMakerCheck=true;
    }
    
%>


<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%><html>
<head>
	<script type="text/javascript">
	
	function MM_jumpMenu(targ,selObj,restore){ //v3.0
		  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		  if (restore) selObj.selectedIndex=0;
		}
	
		function addNew() {
	    	document.forms[0].action = "./udf.do?event=maker_prepare_create_udf&customerID=-999999999&limitProfileID=-999999999";
	    	document.forms[0].submit();
		}
		function remove(idVal) {
	    	document.forms[0].action = "./udf.do?event=delete_udf&id="+idVal;
	    	document.forms[0].submit();
		}
		function freeze(idVal) {
	    	document.forms[0].action = "./udf.do?event=freeze_udf&id="+idVal;
	    	document.forms[0].submit();
		}
		
	</script>
</head>
<body>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		<html:form action="udf.do">
			<tr>
				<td width="100%" height="100%" valign="bottom">
					<table width="100%" height="100%" border="0" align="center"	cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
						<tr height="95%">
							<td valign="top">
							    <div id="contentCanvas" style="height: 100%; width: 100%;">
							        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
							            <tr>
							                <td width="70%">
							                    <h3><bean:message key="list_udf.formTitle"/></h3>
							                    <table border="0" cellpadding="0" cellspacing="0" width="99%">
							                    	<tr>
							                    	    <td colspan="2">
							                    	        <hr/>
							                    	    </td>
							                    	</tr>
							                    	<tbody>
							                    	 <%if(isCpuAdmMaker  || isCpuAdmMakerCheck){ %>
							                    		<tr>
							                    			<td  valign="bottom" align="right">
																<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
															</td>
							                    		</tr>
							                    		<%} %>
							                    	</tbody>
							                    	<tr>
							                    		<td colspan="2"/>
							                    	</tr>
							                    	<tr>
							                    		<td colspan="2"/>
							                    	</tr>
							                    </table>
											</td>
										</tr>
										<tr>
											<td width="70%">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
							                        <thead>
												        <tr>
													    	<td width="5%"><bean:message key="list_udf.sn"/></td>
															<td width="10%"><bean:message key="list_udf.fieldName"/></td>
															<td width="10%"><bean:message key="list_udf.fieldType"/></td>
															<td width="10%"><bean:message key="list_udf.mandatory"/></td>
															<td width="10%">Numeric Length</td>
															<td width="10%"><bean:message key="list_udf.sequence"/></td>
															<td width="30%"><bean:message key="list_udf.options"/></td>
															<td width="8%"><bean:message key="list_udf.status"/></td>
															 <%if(isCpuAdmMaker  || isCpuAdmMakerCheck){ %>
															<td width="8%"><bean:message key="list_udf.action"/></td>
															<%} %>
													    </tr>
													</thead>
													<logic:iterate id="moduleName" name="UdfKeyList" type="java.lang.String" scope="page">
														<% udfList = (List)udfMap.get(moduleName);
														   pageContext.setAttribute("UdfList", udfList);
														   rowCount = 0;
														   System.out.println(udfKeyList);%>
														<tr>
															<td colspan="9"/>&nbsp;
														</tr>
														<tr>
															<td colspan="9"><%=moduleName%></td>
														</tr>
														<logic:iterate id="udf" name="UdfList" type="com.integrosys.cms.app.udf.bus.IUdf" scope="page">
															<tbody>		
																<tr class="<%= (++rowCount %2) == 0 ? "odd" : "even" %>">
																	<td width="5%"  class="index"><%= rowCount%></td>
																	<td width="10%"><%= udf.getFieldName() %></td>
																	<td width="10%"><%= udf.getFieldType() %></td>
																	
																	<td width="10%">
																	<%if(udf.getMandatory()!=null){ 
																	
																	if(udf.getMandatory().equals("on")){
																	%>
																	Mandatory
																	<%}else{ %>
																	
																	Not-Mandatory
																	<%}}else{ %>
																	Not-Mandatory
																	<%} %>
																	&nbsp;</td>
																	<td width="10%">
																	<%if(udf.getNumericLength()!=null){ 
																	
																	 %>
																	<%=udf.getNumericLength() %>
																	<%} %>
																	&nbsp;</td>
																	<td width="10%"><%= udf.getSequence() %></td>
																	<td width="30%"><%= (udf.getOptions() == null ? "-" :  udf.getOptions()) %></td>
																	<td width="8%">
																	<%if("ACTIVE".equals(udf.getStatus()) ) {%> Enable</br>
																	
																	<%}else{ %>
																	Disable</br>
																	<%} %>
																	</td>
																	 <%if(isCpuAdmMaker  || isCpuAdmMakerCheck){ %>
																	<td width="8%">
																		<%-- <% if (UDFConstants.STATUS_CREATED.equals(udf.getStatus())) {%>
																		       <a href="#" onclick="remove('<%=udf.getId()%>')"><bean:message key="list_udf.remove"/></a> / 
																		       <a href="#" onclick="freeze('<%=udf.getId()%>')"><bean:message key="list_udf.freeze"/></a>
																		<% } else { %> -
																		<% } %> --%>
																		
																		
										<% if("SELECT BOX".equals(udf.getFieldType()) && "ACTIVE".equals(udf.getStatus())) { %> 
										<select name="udfaction" onchange="MM_jumpMenu('self',this,0)" style="width:100">
                                      <option value="#" selected>Please Select</option>
                                     <%--  <option value='udf.do?event=maker_view_udf&productCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option> --%>
									  <option value='udf.do?event=maker_edit_udf_read&trxId=<%=udf.getId()%>'>Edit</option>
										<option value='udf.do?event=maker_disable_udf_read&trxId=<%=udf.getId()%>'>Disable</option>
                                     </select> <%}else if ("SELECT BOX".equals(udf.getFieldType()) && "INACTIVE".equals(udf.getStatus())){ %>
                                     <select name="udfaction" onchange="MM_jumpMenu('self',this,0)" style="width:100">
                                      <option value="#" selected>Please Select</option>
                                        <option value='udf.do?event=maker_enable_udf_read&trxId=<%=udf.getId()%>'>Enable</option>
                                      </select>  <%}%> 
                                       <% if(!"SELECT BOX".equals(udf.getFieldType())) {%> -
                                       <%} %>
                                     </td>
										<%} %>
																</tr>
															</tbody>
														</logic:iterate>
													</logic:iterate>
													<tbody>
													</tbody>
												</table>
											</td>
										</tr>
							        </table>
							    </div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</html:form>
	</table>
</body>
</html>