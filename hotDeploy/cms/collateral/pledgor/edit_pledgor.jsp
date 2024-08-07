<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.customer.CategoryCodeConstant"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralPledgor" %>

<html>
<head>
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function submitPage(action) {
        if (action == 4) {
       		document.forms[0].event.value="cancel";
       	}
        document.forms[0].submit();
    }

    function save() {
        document.forms[0].event.value="edit_pledgor";
        document.forms[0].submit();
    }
</script>
</head>
<%
    ICollateralPledgor colPledgorObj = (ICollateralPledgor) request.getAttribute("colPledgorObj");

    String[] style = { "even", "odd" };
	int count = 1;
	String actionName = request.getParameter("actionName")+".do";
%>
<body>



<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
    <html:form action='<%=actionName%>'>
		<html:hidden property="event" />
        <input type="hidden" name="index" value="<%=request.getAttribute("index")%>">
        <input type="hidden" name="subtype"
			value="<%=request.getParameter("subtype")%>">
		<tr>
			<td valign="top">
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="70%" colspan="2">
						<h3><bean:message key="title.pledgor.edit.customer" /></h3>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<hr>
						</td>
					</tr>
                    <tr>
                        <td><html:errors property="stpError" /></td>
                    </tr>
				</thead>
				<tbody>
					<tr>
                        <td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="tblinfo" style="margin-top: 0">
								<thead>
									<tr>
										<td width="12%"><bean:message key="label.customer.id" /></td>
										<td width="14%"><bean:message
											key="label.customer.id.type" /></td>
										<td width="14%"><bean:message
											key="label.customer.id.number" /></td>
										<td width="25%"><bean:message
											key="label.customer.security.pledgor.name" /></td>
										<td width="36%"><bean:message
											key="label.customer.security.pledgor.relationship" /></td>
									</tr>
								</thead>
								<tbody>
									<logic:empty name="colPledgorObj">
										<tr class="odd">
											<td colspan="7"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:empty>
									<logic:notEmpty name="colPledgorObj">
                                        <tr class="<%=style[++count%2] %>">
                                            <td><integro:empty-if-null value="<%=colPledgorObj.getLegalID()%>"/>                                                
                                            </td>
                                            <td>
												<integro:common-code categoryCode="<%= CategoryCodeConstant.ID_TYPE%>" entryCode="<%= colPledgorObj.getPlgIdType()%>" display="true"/> &nbsp;
                                            </td>
                                            <td><integro:empty-if-null value="<%=colPledgorObj.getPlgIdNumText()%>" /></td>
                                            <td><integro:empty-if-null value="<%=colPledgorObj.getPledgorName()%>" /></td>
                                            <td><html:select property="relationship" value="<%=colPledgorObj.getPledgorRelnship()%>" >
                                                <integro:common-code categoryCode="RELATIONSHIP" />
                                                </html:select><html:errors property="relationship" />
                                                <html:hidden property="selected" value="0"></html:hidden>
                                            </td>
                                        </tr>
									</logic:notEmpty>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr valign="top">
						<td align="center">
                        <a href="#" onclick="save()" onmouseout="MM_swapImgRestore()"
                            onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
                            src="img/ok1.gif" name="Image3311" border="0" id="Image331"
                            width="60" height="22" /></a>
						<a href="javascript:submitPage(4)"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
						<img src="img/cancel1.gif" name="Image2" width="70" height="20"
							border="0" id="Image2" /></a></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</html:form>
</table>
</body>
</html>