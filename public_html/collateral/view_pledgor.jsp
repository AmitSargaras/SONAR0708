<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.limit.bus.ILimitProfile"%>

<% 
// reset odd-even row highlighting
rowIdx = 0;  

ILimitProfile theLimitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
boolean isHpVehicle = ((theLimitProfile != null) && ICMSConstant.APPLICATION_TYPE_HP.equals(theLimitProfile.getApplicationType()));
isHpVehicle = isHpVehicle && ICMSConstant.COLTYPE_ASSET_SPEC_CHARGE_VEH.equals(iCol.getCollateralSubType().getSubTypeCode());
%>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.title"/></h3></td>
      	<td align="right" valign="baseline">
	   		<input class="btnNormal" type="button" name="<%=(isHpVehicle)?"pledgorSubmit1":"nonHpVehiclePledgorSubmit1"%>" value="Add New" onclick="javascript:submitData(10, -1)"/>
               &nbsp; <input name="pledgorSubmit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitData(11, 0)"/>
		</td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                  <thead>
                    <tr>
                      <td width="5%"><bean:message key="label.global.sn"/></td>
                      <td width="15%"><bean:message key="label.security.pledgor.id"/></td>
                      <td width="10%"><bean:message key="label.customer.id"/></td>
                      <td width="25%"><bean:message key="label.security.pledgor.name"/></td>
                      <td width="25%"><bean:message key="label.security.pledgor.relationship"/></td>
                      <td width="10%"><bean:message key="label.global.action"/></td>
                      <td width="10%"><bean:message key="label.global.delete"/></td>
                    </tr>
                  </thead>
                  <tbody>
				<%
                    if (iCol != null && iCol.getPledgors()!=null) {
                    ICollateralPledgor[] pledgor = iCol.getPledgors();
                        if (pledgor.length == 0) {
				%>
                    <tr class="odd">
                    <td colspan="7">
                    <bean:message key="label.security.pledgor.info.none"/>
                    </td>
                    </tr>
				<% } for (int counter = 0; counter < pledgor.length; counter++) { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=counter + 1%></td>
                      <td> <integro:empty-if-null value="<%=pledgor[counter].getPlgIdNumText() %>"/>                         
                      <%
                    if (pledgor[counter].getSCIPledgorMapStatus() != null &&
                            pledgor[counter].getSCIPledgorMapStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
                      %>
                      &nbsp;<font color="#FF0000"><b><bean:message key="label.deleted"/></b></font>
                      <% } %>
                      </td>
                      <td><integro:empty-if-null value="<%=pledgor[counter].getLegalID()%>"/></td>
                      <td><integro:empty-if-null value="<%=pledgor[counter].getPledgorName()%>"/></td>
                      <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(pledgor[counter].getPledgorRelnshipCode(),pledgor[counter].getPledgorRelnship())%>"/></td>
                      <td><a href="javascript:submitData(15,'<%= counter %>')"><bean:message key="label.edit"/></a></td>
                      <td style="text-align: center;"><html:checkbox property="deletePledgor" value="<%=pledgor[counter].getLegalID()%>"></html:checkbox></td>
                    </tr>
					<%	/*
						if (classtype.equals("odd")) {
                            classtype = "even";
                        }
                        else {
                            classtype = "odd";
                        }
                        */
                    }
                    } else { %>
                    <tr class="odd">
                    <td colspan="7">
                    <bean:message key="label.security.pledgor.info.none"/>
                    </td>
                    </tr>
                    <% } %>
                  </tbody>
                </table>
	</td>
    </tr>
      <tr>
        <td colspan="2"><html:errors property="collateralPledgor" />&nbsp;</td>
      </tr>
  </tbody>
</table>