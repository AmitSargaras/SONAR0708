<%@page import="com.integrosys.cms.ui.collateral.CollateralHelper"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
    <td> <h3><bean:message key="label.security.charge.infor"/></h3></td>
    <td align="right" valign="baseline">
    <input class="btnNormal" type="button" name="Submit2222" value="Add New" onclick="javascript:submitPage(3, -1)"/>
    &nbsp; <input name="Submit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(5, 0)"/>
    </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="3%"><bean:message key="label.global.sn"/></td>
              <td width="22%"><bean:message key="label.security.limit.id.pt"/></td>
              <td width="7%"><bean:message key="label.security.rank.sec"/></td>
              <td width="15%"><bean:message key="label.security.prior.charge.amount"/></td>
              <td width="25%"><bean:message key="label.security.charge.prior.charge"/></td>
              <td width="15%"><bean:message key="label.security.amount.charge"/></td>
              <td width="8%"><bean:message key="label.global.action"/></td>
              <td width="5%"><bean:message key="label.global.delete"/></td>
            </tr>
          </thead>
          <tbody>
            <%  
                ILimitCharge[] limit = iCol.getLimitCharges();
                if (limit != null) {
                    if (limit.length == 0) { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td colspan="8">
                    <bean:message key="label.security.charge.infor.none"/>
                    </td>
                    </tr>
										<%				}%>
				<% for (int counter = 0; counter < limit.length; counter++) { %>
                        <%
                                  if ( limit[counter] == null )
                                      continue;
                        %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td width="3%" class="index"><%=counter + 1%></td>

                      <% ICollateralLimitMap[] limitMap = limit[counter].getLimitMaps(); %>
                      <td width="22%">

                      <% for (int i = 0; i < limitMap.length; i++) { 
                      	 	String limitID = CollateralHelper.getDisplayColLimitMapLimitID(limitMap[i]);
                      		if (limitID != null) {%>
                        <% if (i > 0) { %> <br> <% } %>
                        <%=limitID%>
                          <%--&nbsp;  (<%=limitMap[i].getSCISysGenID()%>)&nbsp;--%>
                      <% if (limitMap[i].getLimitType() != null) { %>
                      (<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limitMap[i].getLimitType() %>" descWithCode="false"/>)
                      <% }
                          if (limitMap[i].getSCIStatus() != null &&
                                  limitMap[i].getSCIStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
                      %>
                          <font color="#FF0000"><b>DELETED</b></font>
                      <% } } } %>                        &nbsp;
                      </td>
                      <td width="7%" valign="right">
                      <integro:empty-if-null value="<%=RankList.getInstance().getRankListItem(String.valueOf(limit[counter].getSecurityRank()))%>"/>&nbsp;
                      </td>
                      <td width="15%">
                      <% if (limit[counter].getPriorChargeAmount() != null && limit[counter].getPriorChargeAmount().getCurrencyCode() != null) { %>
                        <integro:currency amount="<%=limit[counter].getPriorChargeAmount()%>" param="amount" />
                      <% } 
						 else {
							out.println("-");
						 } 
					  %>
						&nbsp;
                      </td>
                      <td width="25%"><integro:empty-if-null value="<%=limit[counter].getPriorChargeChargee()%>"/>&nbsp;</td>
                      <td width="17%">
                      <% if (limit[counter].getChargeAmount() != null && limit[counter].getChargeAmount().getCurrencyCode() != null ) { %>
                      <integro:currency amount="<%=limit[counter].getChargeAmount()%>" param="amount" />
                      <% } %>&nbsp;
                      </td>
                      <td width="8%">
                      <a href="javascript:submitPage(4, <%=counter%>)"><%=isSSC?"View":"View / Edit"%></a>
                      </td>
                      <td width="5%"><html:multibox property="deleteItem" value="<%=String.valueOf(counter)%>"/></td>
                    </tr>
					<%	  }
               } else { %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td colspan="8">
                    <bean:message key="label.security.charge.infor.none"/>
                    </td>
                    </tr>
                <% } %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%--
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:errors property="chargeError"/> --%>
