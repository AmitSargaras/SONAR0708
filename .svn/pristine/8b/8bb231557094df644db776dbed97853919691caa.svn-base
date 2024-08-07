<%@ page import="com.integrosys.cms.ui.collateral.assetbased.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.asset.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 java.util.HashMap,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.assetbased.ChargeAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%
    ChargeForm aForm = (ChargeForm)request.getAttribute("AssetBasedChargeForm");

    HashMap limitMapType = (HashMap)request.getAttribute("colLimitMapValue");
    HashMap limitStatusMap = (HashMap) request.getAttribute("colLimitStatusMap");
    HashMap chargeLimitIDMap = (HashMap)request.getAttribute("colChargeLimitIDMap");

    String from_event = request.getParameter("from_event");
    boolean isProcess = (from_event.equals("process"));
    HashMap chargeMap = (HashMap) request.getAttribute("natureOfChargeMap");

    ILimitCharge stagingOB = (ILimitCharge)request.getAttribute("stageCharge");
    ILimitCharge originOB = (ILimitCharge)request.getAttribute("actualCharge");
    Amount oldChargeAmt = null;
    Amount newChargeAmt = null;
    Amount oldPriorAmt = null;
    Amount newPriorAmt = null;
    if (stagingOB != null) {
        newChargeAmt = stagingOB.getChargeAmount();
        newPriorAmt = stagingOB.getPriorChargeAmount();
    }
    if (originOB != null) {
        oldChargeAmt = originOB.getChargeAmount();
        oldPriorAmt = originOB.getPriorChargeAmount();
    }
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
</head>

<body>
<html:form action="AssetBasedCharge.do">
<input type="hidden" name="next_page" />
<input type="hidden" name="event" value="<%=ChargeAction.EVENT_FORWARD%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<%ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    String subtypecode = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
    if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(subtypecode)) {
%>
<%--<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>--%>
<% } %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.charge.infor"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.limit.id"/>&nbsp;<font color="#0000FF">*</font></td>
              <td valign="top" style="border-right:0"><bean:message key="label.security.selected.limit.ids"/><br/>
              <%
                  String[] id = aForm.getLimitMapID();
                  String style = "";
                  if (id == null || id.length == 0) {
                      style = "width:100%";
                  }
              %>
              <html:select property="limitMapID" disabled="true" style="<%=style%>" multiple="true" size="10">
              <%
                  if (id != null) {
                    for (int i = 0; i < id.length; i++) {
                    	//System.out.println(" limitmapid: "+i+"\t"+id[i]);
                    %>
                       <option value="<%=id[i]%>"><%=((String[])chargeLimitIDMap.get(id[i]))[0]%>&nbsp
                       <%--(<%=((String[])chargeLimitIDMap.get(id[i]))[1]%>)&nbsp;--%>
                        (<integro:empty-if-null value="<%=limitMapType.get(id[i])%>"/>)&nbsp;<%=limitStatusMap.get(id[i])%>
                       </option>
              <% } } %>
              </html:select>
              &nbsp;
              </td>

              <td  colspan="2" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input name="Button" type="button" disabled="true" class="btnNormal" style="width:80" onClick="moveDualList(limitMapID,limitID, false )" value="Add&gt;&gt;"/>
                <br/> <br/> <input name="Button" type="button" disabled="true" class="btnNormal" style="width:80" onClick="moveDualList(limitID,limitMapID,false )" value="&lt;&lt;Remove"/>
              </td>

              <td style="border-left:0;border-right:0">Selected Limit IDs<br />
              <%
                    id = aForm.getLimitID();
                  style = "";
                  if (id == null || id.length == 0) {
                      style = "width:100%";
                  }
              %>
                <html:select property="limitID" size="10" multiple="true" disabled="true" style="<%=style%>">
                <%

                    if (id != null) {
                      for (int i = 0; i < id.length; i++) {
                    	  //System.out.println(" limitID: "+i+"\t"+id[i]);
                      %>
                      <% if (Long.parseLong(id[i]) != ICMSConstant.LONG_MIN_VALUE) {%>
                       <option value="<%=id[i]%>"><%=((String[])chargeLimitIDMap.get(id[i]))[0]%>&nbsp
                       <%--(<%=((String[])chargeLimitIDMap.get(id[i]))[1]%>)&nbsp;--%>
                        (<integro:empty-if-null value="<%=limitMapType.get(id[i])%>"/>)&nbsp;<%=limitStatusMap.get(id[i])%>
                       </option>
                <% }  } } %>
                </html:select> &nbsp;
             </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.id"/></td>
              <td colspan="2">
				<%
				    if ((aForm.getSecurityID() != null && (aForm.getSecurityID().equals("null"))) || aForm.getSecurityID()==null) {
						out.println("-");
					}
					else {
				%>
					<bean:write name="AssetBasedChargeForm" property="securityID"/>
				<%	} %>
			  &nbsp;
			  </td>
              <td  class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "securityRank")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.rank.sec"/></td>
              <td colspan="2">
                <integro:empty-if-null value="<%=RankList.getInstance().getRankListItem(aForm.getRank())%>"/>&nbsp;
              </td>
            <%  boolean unchanged = true;
                if (isProcess) {
                    if (newChargeAmt != null && oldChargeAmt == null) {
                        if (newChargeAmt.getAmount() >= 0 && newChargeAmt.getCurrencyCode() != null) {
                            unchanged = false;
                        }
                    } else if (newChargeAmt != null && oldChargeAmt != null) {
                        unchanged = CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount");
                    }
                }
            %>
              <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.charge.amount"/>&nbsp;<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td><bean:write name="AssetBasedChargeForm" property="chargeAmount"/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "legalChargeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.date.legal.charge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td colspan="2"><bean:write name="AssetBasedChargeForm" property="dateLegalCharge"/>&nbsp;</td>

              <td  class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "natureOfCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.nature.charge"/>&nbsp;</td>
              <td>
                <integro:empty-if-null value="<%=(String)chargeMap.get(aForm.getNatureOfCharge())%>"/>&nbsp;
              </td>
            </tr>

            <tr class="even">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "priorChargeChargee")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.charge.prior.charge"/>&nbsp;</td>
              <td width="30%" colspan="2"><bean:write name="AssetBasedChargeForm" property="chargeePriorCharge"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
              </tr>
              <tr class="odd">
            <%  unchanged = true;
                if (isProcess) {
                    if (newPriorAmt != null && oldPriorAmt == null) {
                        if (newPriorAmt.getAmount() != 0) {
                            unchanged = false;
                        }
                    } else if (newPriorAmt != null && oldPriorAmt != null) {
                        unchanged = CompareOBUtil.compOB(newPriorAmt,oldPriorAmt,"amount");
                    }
                }
            %>
              <td width="20%" class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.prior.charge.amount"/></td>
              <td width="30%" colspan="2"><bean:write name="AssetBasedChargeForm" property="priorChargeAmount"/>&nbsp;</td>
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "priorChargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.prior.charge.type"/>&nbsp;</td>
              <td width="30%">
				<integro:common-code categoryCode="PRIOR_CHARGE_TYPE" entryCode="<%=aForm.getPriorChargeType() %>" display="true" descWithCode="false"/>
                &nbsp;
              </td>
            </tr>

            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.charge.type"/>&nbsp;<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td colspan="2">
              <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(aForm.getChargeType())%>"/>&nbsp;
              </td>
               <td class="fieldname">
              	<bean:message key="label.security.charge.redemption"/>&nbsp;
              </td>
             <td colspan="2">
           	   <html:radio property="redemption" value="Yes" disabled="true" />
               <bean:message key="label.security.charge.redemption.yes"/>&nbsp;
	           <html:radio property="redemption" value="No" disabled="true"/>
	            <bean:message key="label.security.charge.redemption.no"/>&nbsp;
               <html:errors property="redemption"/>
              </td>
            </tr>
			<tr class="odd">
			<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "folio")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.charge.folio"/></td>
				<td colspan="2" ><bean:write name="AssetBasedChargeForm" property="folio"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "jilid")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.charge.jilid"/></td>
				<td colspan="2" ><bean:write name="AssetBasedChargeForm" property="jilid"/>&nbsp;</td>
			</tr>
			<tr class="even">
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "partyCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.charge.partyCharge"/>&nbsp;<span class="mandatory">*</span></td>
				<td colspan="2" >&nbsp;<integro:common-code categoryCode="PARTY_CHARGE" entryCode="<%=aForm.getPartyCharge()%>" display="true" descWithCode="false"/></td>
				<td class="fieldname">&nbsp;</td>
				<td colspan="2" >&nbsp;</td>
			</tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
</html:form>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td valign="baseline" align="center">&nbsp;</td>
	<td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
	<td colspan="2" width="100" valign="baseline" align="center"> <a href="AssetBasedCharge.do?event=read_return&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
	</td>
  </tr>
  <tr>
	<td valign="baseline" align="center">&nbsp;</td>
	<td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>


</body>

</html>
