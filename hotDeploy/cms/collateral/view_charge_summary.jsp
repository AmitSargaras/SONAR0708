<%@page import="com.integrosys.cms.ui.collateral.CollateralHelper"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.ILimitCharge"%>
<%@ page import="java.util.Comparator"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap"%>

<% 
	rowIdx = 0; // reset odd-even row highlighting 
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
      <td> <h3>Charge Information</h3></td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="22%">Limit ID / Product Type</td>
              <td width="9%">Ranking of Security</td>
              <td width="16%">Prior Charge Amount</td>
              <td width="25%">Chargee of Prior Charge</td>
              <td width="17%">Amount of Charge</td>
              <td width="8%">Action</td>
            </tr>
          </thead>
          <tbody>
            <% if (from_event.equals("process")) {
                List res = CompareOBUtil.compOBArray(newCollateral.getLimitCharges(),((oldCollateral==null)?null:oldCollateral.getLimitCharges()));

                CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);

                Arrays.sort(resultList, new Comparator() {
                public int compare(Object o1, Object o2) {
                    int int1 = ((ILimitCharge)((CompareResult)o1).getObj()).getSecurityRank();
                    int int2 = ((ILimitCharge)((CompareResult)o2).getObj()).getSecurityRank();
                    return int1 - int2;
                }});

                ArrayList list = new ArrayList(Arrays.asList(resultList));
                pageContext.setAttribute("limit",list);

                int counter = 0;
                if (list == null || list.size() == 0) { %>
                    <tr class="odd">
                    <td colspan="7">There is no charge information.</td>
                    </tr>
<%                }
%>
		<logic:present name="limit" >
		   <logic:iterate id="compResult" name="limit"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
           <%  ILimitCharge limitCharge = (ILimitCharge) compResult.getObj();
           %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td width="3%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
                      <% ICollateralLimitMap[] limitMap = limitCharge.getLimitMaps(); %>
                      <td width="22%">
                      <% for (int i = 0; i < limitMap.length; i++) { 
                      		String limitID = CollateralHelper.getDisplayColLimitMapLimitID(limitMap[i]);
                      		 if (limitID != null) {
                      %>
                      <% if (i > 0) { %> <br> <% } %>
                      <%=limitID%>&nbsp;
                      <%--(<%=limitMap[i].getSCISysGenID()%>)&nbsp;--%>
                      <% if (limitMap[i].getLimitType() != null) { %>
                      (<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limitMap[i].getLimitType() %>" descWithCode="false"/>)
                      <% }
                            if (limitMap[i].getSCIStatus() != null &&
                                    limitMap[i].getSCIStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
                      %>
                          <span class="deleted"><b>DELETED</b></span>
                      <% } } } %>                        &nbsp;
                      </td>

                      <td width="9%" valign="right">
                      <integro:empty-if-null value="<%=RankList.getInstance().getRankListItem(String.valueOf(limitCharge.getSecurityRank()))%>"/>&nbsp;
                      </td>
                      <td width="16%">
                      <% if (limitCharge.getPriorChargeAmount() != null && limitCharge.getPriorChargeAmount().getCurrencyCode() != null) { %>
                        <integro:currency amount="<%=limitCharge.getPriorChargeAmount()%>" param="amount" />&nbsp;
                      <% } 
						 else {
							out.println("-");
						 } 
					  %>
						&nbsp;
                      </td>
                      <td width="25%"><integro:empty-if-null value="<%=limitCharge.getPriorChargeChargee()%>"/>&nbsp;</td>
                      <td width="17%">
                      <% if (limitCharge.getChargeAmount() != null && limitCharge.getChargeAmount().getCurrencyCode() != null ) { %>
                        <integro:currency amount="<%=limitCharge.getChargeAmount()%>" param="amount" />&nbsp;
                        <% } %> &nbsp;
                      </td>

                      <td width="8%"><a href="<%=chargeAction%>.do?event=read&indexID=<%=limitCharge.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View</a>
                      </td>
                    </tr>
					<%	
                        counter++;
%>
                    </logic:iterate>
                    </logic:present>
<%                } else {
                ILimitCharge[] limit = iCol.getLimitCharges();
                if (limit != null) {
                    if (limit.length == 0) { %>
                    <tr class="odd">
                    <td colspan="7">
						There is no charge information.
                    </td>
                    </tr>
<%                    }
				 for (int counter = 0; counter < limit.length; counter++) {
                     if ( limit[counter] == null )
                         continue;
%>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td width="3%" class="index"><%=counter + 1%></td>
                      <% ICollateralLimitMap[] limitMap = limit[counter].getLimitMaps(); %>
                      <td width="22%">
                      <% if (limitMap != null) {
                            for (int i = 0; i < limitMap.length; i++) { 
                            	String limitID = CollateralHelper.getDisplayColLimitMapLimitID(limitMap[i]);
                            	if (limitID != null) {%>
                      <% if (i > 0) { %> <br> <% } %>
                      <%=limitID%>&nbsp;
                      <%--(<%=limitMap[i].getSCISysGenID()%>)&nbsp;--%>
                      <% if (limitMap[i].getLimitType() != null) { %>
                      (<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limitMap[i].getLimitType() %>" descWithCode="false"/>)
                      <% }
                                if (limitMap[i].getSCIStatus() != null &&
                                        limitMap[i].getSCIStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
                      %>
                          <span class="deleted"><b>DELETED</b></span>
                      <% } } } }%>                        &nbsp;

                      </td>

                      <td width="9%" valign="right">
                      <integro:empty-if-null value="<%=RankList.getInstance().getRankListItem(String.valueOf(limit[counter].getSecurityRank()))%>"/>&nbsp;
                      </td>
                      <td width="16%">
                      <% if (limit[counter].getPriorChargeAmount() != null && limit[counter].getPriorChargeAmount().getCurrencyCode() != null) { %>
                        <integro:currency amount="<%=limit[counter].getPriorChargeAmount()%>" param="amount" />
                        <% } %>&nbsp;
                      </td>
                      <td width="25%"><integro:empty-if-null value="<%=limit[counter].getPriorChargeChargee()%>"/>&nbsp;</td>
                      <td width="17%">
                      <% if (limit[counter].getChargeAmount() != null && limit[counter].getChargeAmount().getCurrencyCode() != null) { %>
                      <integro:currency amount="<%=limit[counter].getChargeAmount()%>" param="amount" />&nbsp;
                      <% } %> &nbsp;
                      </td>

                      <td width="8%"><a href="<%=chargeAction%>.do?event=read&indexID=<%=limit[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View</a>
                      </td>
                    </tr>
					    <%	
                    }
                } else { %>
                    <tr class="odd">
                    <td colspan="7">
						There is no charge information.
                    </td>
                    </tr>
<%                }
           }
					%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
