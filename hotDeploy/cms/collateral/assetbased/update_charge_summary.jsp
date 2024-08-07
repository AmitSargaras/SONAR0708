<%@page import="com.integrosys.cms.ui.collateral.CollateralHelper,
				com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				com.integrosys.cms.ui.collateral.assetbased.RankList,
				com.integrosys.cms.app.collateral.bus.ICollateral,
				com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
				com.integrosys.cms.app.collateral.bus.ILimitCharge,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.component.commondata.app.CommonDataSingleton,
				com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%@ include file="/collateral/ssc.jsp" %>
<%
   int rowIdx = 0; // reset odd-even row highlighting
   
%>
<%
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    ICollateral iCol = itrxValue.getStagingCollateral();
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
    <td><h3><bean:message key="label.security.charge.infor"/></h3></td>
    <td align="right" valign="baseline">
    <% if (!isSSC) { %>
    <input class="btnNormal" type="button" name="Submit2222" value="Add New" onclick="javascript:submitPage(3, -1)"/>
    &nbsp; <input name="Submit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(5, 0)"/>
    <% } %>
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
              <td width="25%"><bean:message key="label.security.prior.charge.type"/></td>
              <td width="15%"><bean:message key="label.security.amount.charge"/></td>
              <td width="8%"><bean:message key="label.global.action"/></td>
              <td width="5%"><bean:message key="label.global.delete"/></td>
            </tr>
          </thead>
          <tbody>
			<%
                ILimitCharge[] limit = iCol.getLimitCharges();
                if (limit != null) {
                    if (limit.length == 0) { 
			%>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    	<td colspan="8"><bean:message key="label.security.charge.infor.none"/></td>
                    </tr>
			<%  }  
			
				for (int counter = 0; counter < limit.length; counter++) {
					if ( limit[counter] == null ) {
						continue;
					}
					
					ICollateralLimitMap[] limitMap = (limit[counter].getLimitMaps()==null?new ICollateralLimitMap[0]:limit[counter].getLimitMaps());
			%>

					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td width="3%" class="index"><%=counter + 1%></td>
						<td width="22%">
							<% 
								for (int i = 0; i < limitMap.length; i++) {
									String limitID = CollateralHelper.getDisplayColLimitMapLimitID(limitMap[i]);
									if (limitID != null) {
							%>
							<% if (i > 0) { %> <br> <% } %>
							<%=limitID%>
                            <%--&nbsp;(<%=limitMap[i].getSCISysGenID()%>)&nbsp;--%>
							<% if (limitMap[i].getLimitType() != null) { %>
                      			(<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limitMap[i].getLimitType() %>" descWithCode="false"/>)
              				<% }
								if (limitMap[i].getSCIStatus() != null &&
							      limitMap[i].getSCIStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
							%>
							<font color="#FF0000"><b><bean:message key="label.deleted"/></b></font>
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
					<%	
                }
                } else { %>
                    <tr class="odd">
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