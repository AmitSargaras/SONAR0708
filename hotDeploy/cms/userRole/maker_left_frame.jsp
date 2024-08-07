<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.component.bizstructure.app.bus.ITeamType"%>
<%

    List teamTypeList = (List)session.getAttribute("com.integrosys.cms.ui.userrole.BizStructureIPinAction.TeamTypeList");

    if(teamTypeList==null || teamTypeList.size()==0){
        out.write("No Team Types setup in database");
        return;
    }
%>



<%@page import="com.integrosys.component.bizstructure.app.bus.ITeamTypeMembership"%>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->


<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="150" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  </thead>
  <tbody>
    <tr>
      <td colspan="4" nowrap style="padding-left:15px"><strong><bean:message key="label.login.role.type"/></strong></td>
    </tr>
    <tr>
      <td colspan="4" nowrap>&nbsp;</td>
    </tr>
    <%
        for(int i=0; i<teamTypeList.size(); i++){
            ITeamTypeMembership tt = (ITeamTypeMembership)teamTypeList.get(i);
    %>
    <tr>
      <td nowrap>&nbsp;</td>
      <td width="22" nowrap><input name="imageField" type="image" src="img/level3.gif" width="15" height="11" border="0" /></td>
      <td width="116" height="18" colspan="2" nowrap><a href='UserRole.do?event=maker_list_user_role&memberTypeId=<%=""+tt.getMembershipID()%>&teamTypeName=<%=""+tt.getMembershipName()%>' title='<%=tt.getMembershipName()%>' ><%=tt.getMembershipName()%></a></td>
    </tr>
    <tr>
      <td nowrap>&nbsp;</td>
      <td nowrap>&nbsp;</td>
      <td colspan="2" nowrap>&nbsp;</td>
    </tr>
    <%
        } //}
    %>
    <tr>
      <td nowrap>&nbsp;</td>
      <td nowrap>&nbsp;</td>
      <td colspan="2" nowrap>&nbsp;</td>
    </tr>
    <tr>
      <td nowrap>&nbsp;</td>
      <td nowrap>&nbsp;</td>
      <td colspan="2" nowrap>&nbsp;</td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>