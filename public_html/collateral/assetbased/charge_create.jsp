<%@ page import="com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.asset.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.collateral.assetbased.ChargeForm,
                 com.integrosys.cms.ui.collateral.assetbased.ChargeAction,
                 java.util.HashMap,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.collateral.bus.type.others.subtype.othersa.IOthersa,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    ChargeForm aForm = (ChargeForm)request.getAttribute("AssetBasedChargeForm");

    HashMap limitMapType = (HashMap)request.getAttribute("colLimitMapValue");
    HashMap limitStatusMap = (HashMap)request.getAttribute("colLimitStatusMap");
    HashMap chargeLimitIDMap = (HashMap)request.getAttribute("colChargeLimitIDMap");
    
    String securityId = (String) request.getAttribute("securityId");
    if ((securityId != null && (securityId.equals("null")))||securityId==null) {
	    securityId = "-";
    }
    
    IOthersa iCol = (IOthersa) pageContext.getAttribute("obj");
	ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	String CIFNo = customer.getCMSLegalEntity().getLEReference()==null?"":customer.getCMSLegalEntity().getLEReference();
	String isBorrower = "No" ;
	if (iCol != null && iCol.getPledgors()!=null) {
		ICollateralPledgor[] pledgor = iCol.getPledgors();
		if(pledgor!=null){
			if(pledgor.length==0){
				isBorrower = "Yes";
			}else{
				for(int i=0;i<pledgor.length;i++){
					if(pledgor[i].getLegalID()!=null&&pledgor[i].getLegalID().equals(CIFNo)){
						isBorrower = "Yes";
					}
				}
			}
		}else{
			isBorrower = "Yes";
		}
	}else{
		isBorrower = "Yes";
	}
    
    String partyChange1st = isBorrower==null?"":isBorrower;
    String paretyChangeValue = aForm.getPartyCharge()==null?"":aForm.getPartyCharge();
    boolean select1 = false;
    if(partyChange1st.equals("Yes")&&paretyChangeValue.equals("")){
    	select1 = true ;
    }else{
    	select1 = false;
    }
	
    boolean isBlankPriorChargeType = StringUtils.isBlank(aForm.getPriorChargeType());
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num) {
    List = document.forms[0].limitMapID;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].limitID;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

	enableAllFormElements();
	
    if (num == 1) {
    	document.forms[0].event.value="create";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    if (num == 3) {
        document.forms[0].event.value="cancel";
    }

    document.forms[0].submit();

}

function hideAll(idArray) {
	for (var i=0; i<idArray.length; i++) {
		elem = document.getElementById(idArray[i]);
		elem.style.visibility = "hidden";
	}
}

function showAll(idArray) {
	for (var i=0; i<idArray.length; i++) {
		elem = document.getElementById(idArray[i]);
		elem.style.visibility = 'visible';
	}
}

function rankChanged() {
	var	ids = new Array('mandPerfChargeePrior', 'mandPerfPriorChargeAmt', 'mandPerfPriorChargeType', 
						'mandSubmChargeePrior', 'mandSubmPriorChargeAmt', 'mandSubmPriorChargeType');
	
    if (document.forms[0].rank.selectedIndex == 0) {
		hideAll(ids);
   	}
   	else {
		showAll(ids);
   	}

   	<% if(StringUtils.isNotBlank(aForm.getHostCollateralId())) { %>
   	document.forms[0].rank.disabled = true;
   	<% } %>
}

function setPriorChargeType(){
	var rank = document.getElementById("rank").value;
	if(rank == '1' &&<%=isBlankPriorChargeType%>){
		document.forms[0].priorChargeType[2].checked = true;
	}
}

//-->
</script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>

<html:form action="AssetBasedCharge.do">
<input type="hidden" name="next_page" />

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    String subtypecode = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
    if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(subtypecode)) {
%>
<%--<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>--%>
<% } %>

<input type="hidden" name="event" value="<%=ChargeAction.EVENT_FORWARD%>"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>" />

<% int index =2;

  if ("prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))) {
	index = 1;
  }

%>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.charge.infor"/> - <% if (index == 1) { %> New <% } else { %> Edit <% } %></h3></td>
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
              <td valign="top" style="border-right:0">Selected Limit IDs<br/>

              <%
                  String[] mapId = aForm.getLimitMapID();
                  if ("prepare".equals(request.getParameter("event"))) {
                      mapId = (String[]) request.getAttribute("colLimitMap");
                  }
                    String style = "";
                    if (mapId == null || mapId.length == 0) {
                        style = "width:100%";
                    }
                %>
              <html:select property="limitMapID" style="<%=style%>" multiple="true" size="10">
              <%
                  if (mapId != null) {
                    for (int i = 0; i < mapId.length; i++) { %>
                       <option value="<%=mapId[i]%>"><%=((String[])chargeLimitIDMap.get(mapId[i]))[0]%>
                           <%--&nbsp(<%=((String[])chargeLimitIDMap.get(mapId[i]))[1]%>)&nbsp;--%>
                            (<integro:empty-if-null value="<%=limitMapType.get(mapId[i])%>"/>)
                           &nbsp;<%=limitStatusMap.get(mapId[i])%>
                       </option>
                    <% } } %>
              </html:select>
              </td>
              <td  colspan="2" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(limitMapID,limitID, false )" value="Add&gt;&gt;"/>
                <br/> <br/> <input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(limitID,limitMapID,false )" value="&lt;&lt;Remove"/>
              </td>
              <td style="border-left:0;border-right:0">Selected Limit IDs &nbsp;<html:errors property="limitID"/><br />
              <%
                    String [] id = aForm.getLimitID();
                  style = "";
                  if (id == null || id.length == 0) {
                      style = "width:100%";
                  }
              %>
                <html:select property="limitID" size="10" multiple="true" style="<%=style%>">
                <%
                    if (id != null) {
                      for (int i = 0; i < id.length; i++) { %>
                       <option value="<%=id[i]%>"><%=((String[])chargeLimitIDMap.get(id[i]))[0]%>
                           <%--&nbsp(<%=((String[])chargeLimitIDMap.get(id[i]))[1]%>)&nbsp;--%>
                            (<integro:empty-if-null value="<%=limitMapType.get(id[i])%>"/>)
                           &nbsp;<%=limitStatusMap.get(id[i])%>
                       </option>
                <% } } %>

                </html:select>

             </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.id"/></td>
              <td colspan="2"><%=securityId%>&nbsp;</td>
              <td  class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.rank.sec"/></td>
              <td colspan="2">
              <html:select property="rank" onchange="rankChanged()">
              <html:options name="rankID" labelName="rankValue" />
              </html:select>
                <% if(StringUtils.isNotBlank(aForm.getHostCollateralId())) { %>
                <bean:message key="info.security.rank.stp"/>
                <% } %>
              <html:errors property="rank"/>
              </td>
              <td  class="fieldname"><bean:message key="label.security.charge.amount"/>&nbsp;
              	<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td><html:text property="chargeAmount" maxlength="15"/>
              <html:errors property="chargeAmount"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.date.legal.charge"/>&nbsp;
              	 <span class="mandatoryPerfection">*</span></td>
              <td colspan="2">
              <html:text property="dateLegalCharge" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('dateLegalCharge', 'dd/mm/y')" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="dateLegalCharge"/>
              </td>
              <td  class="fieldname"><bean:message key="label.security.nature.charge"/>&nbsp;</td>
              <td>
              <html:select property="natureOfCharge">
              <option value="" ><bean:message key="label.please.select"/></option>
              <html:options name="natureOfChargeID" labelName="natureOfChargeValue" />
              </html:select> &nbsp;
              <html:errors property="natureOfCharge"/>
              </td>
            </tr>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.security.charge.prior.charge"/>&nbsp;
                <span id="mandPerfChargeePrior" class="mandatoryPerfection" style="visibility:hidden">*</span>&nbsp;
              	<span id="mandSubmChargeePrior" class="mandatory" style="visibility:hidden">*</span></td></td>
              <td width="30%" colspan="2">
              <html:text property="chargeePriorCharge" size="30" maxlength="50"/>
              <html:errors property="chargeePriorCharge"/>
              </td>
              <td class="fieldname">&nbsp</td>
              <td>&nbsp;</td>
              </tr>
            <tr class="odd">
              <td width="20%"  class="fieldname"><bean:message key="label.security.prior.charge.amount"/>&nbsp;
                <span id="mandPerfPriorChargeAmt" class="mandatoryPerfection" style="visibility:hidden">*</span>&nbsp;
              	<span id="mandSubmPriorChargeAmt" class="mandatory" style="visibility:hidden">*</span></td></td>
              <td width="30%" colspan="2">
              <html:text property="priorChargeAmount" maxlength="15"/>
              <html:errors property="priorChargeAmount"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.prior.charge.type"/>&nbsp;
              	<span id="mandPerfPriorChargeType" class="mandatoryPerfection" style="visibility:hidden">*</span>&nbsp;
              	<span id="mandSubmPriorChargeType" class="mandatory" style="visibility:hidden">*</span></td>
              <td>
              <html:radio property="priorChargeType" value="I" ><bean:message key="label.security.custodian.internal"/></html:radio>
              &nbsp;&nbsp;
              <html:radio property="priorChargeType" value="E"><bean:message key="label.security.custodian.external"/></html:radio>
              <br>
              <html:radio property="priorChargeType" value="O" ><bean:message key="label.not.applicable"/></html:radio>
              &nbsp;
              <html:errors property="priorChargeType"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;
              	<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td colspan="2">
                <html:select property="chargeType">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="chargeID" labelName="chargeValue"/>
                    </html:select>
                <html:errors property="chargeType"/>
              </td>
              <td class="fieldname">
              	<bean:message key="label.security.charge.redemption"/>&nbsp;
              </td>
             <td colspan="2">
           	   <html:radio property="redemption" value="Yes"/>
               <bean:message key="label.security.charge.redemption.yes"/>&nbsp;
	           <html:radio property="redemption" value="No"/>
	            <bean:message key="label.security.charge.redemption.no"/>&nbsp;
               <html:errors property="redemption"/>
              </td>
            </tr>
			<tr class="odd">
			<td width="20%"  class="fieldname"><bean:message key="label.charge.folio"/></td>
			<td colspan="2">
				<html:text property="folio" maxlength="10"/>
				<html:errors property="folio"/>
			</td>
			<td  width="20%" class="fieldname"><bean:message key="label.charge.jilid"/></td>
			<td colspan="2" >
				<html:text property="jilid" maxlength="10"/>
				<html:errors property="jilid"/>
			</td>
			</tr>
			<tr class="even">
			<td width="20%" class="fieldname"><bean:message key="label.charge.partyCharge"/>&nbsp;<span class="mandatory">*</span></td>
			<td colspan="2" >
			<%if(select1){ %>
				<html:select property="partyCharge" value="1" >
			       <integro:common-code categoryCode="PARTY_CHARGE"/>                            
			    </html:select>
			<%}else{ %>
				<html:select property="partyCharge" >
			       <integro:common-code categoryCode="PARTY_CHARGE"/>                            
			    </html:select>
			<%} %>
				<html:errors property="partyCharge"/>
			</td>
			<td class="fieldname">&nbsp;</td>
			<td colspan="2" >&nbsp;</td>
			</tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                      <% if (!isSSC) { %>
         <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(<%=index%>)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image142','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image142"  height="22" border="0" id="Image142" /></a></td>
         <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
         <% } else { %>
        <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image142','','img/return2.gif',1)"><img src="img/return1.gif" name="Image142" width="75" height="22" border="0" id="Image142" /></a></td>
         <% } %>

                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>

</html:form>

<script>
	rankChanged();
	setPriorChargeType();
</script>

</body>
</html>
