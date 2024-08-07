<%@ page import="com.integrosys.cms.ui.collateral.commodity.security.SecurityAction,
                 com.integrosys.cms.ui.collateral.commodity.security.SecurityForm,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ICommodityCollateral,
                 com.integrosys.cms.ui.common.CountryOrgCodeUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 java.util.HashMap,
                 java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/security/update_security.jsp,v 1.29 2006/10/27 08:31:28 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.29 $
* Date: $Date: 2006/10/27 08:31:28 $
* Tag: $Name:  $
*/
%>
<%
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
        boolean isCMTmaker=false;
  TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    isCMTmaker = true;

                    DefaultLogger.debug(this, "User is ssc maker checker...");
                    break TOP_LOOP;
                }
            }
        }
  }

    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null) {
        from_event = request.getParameter("from_page");
    }

    SecurityForm aForm = (SecurityForm)request.getAttribute("CommSecForm");

    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");
    ICollateralTrxValue[] trxValues = (ICollateralTrxValue[])(trxValueMap.get("trxValue"));

    ICommodityCollateral[] iCols = (ICommodityCollateral[])trxValueMap.get("staging");
    int index = Integer.parseInt(request.getParameter("indexID"));
    ICollateralTrxValue itrxValue = trxValues[index];
    ICommodityCollateral iCol = iCols[index];
%>

<html>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=SecurityAction.EVENT_UPDATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=SecurityAction.EVENT_CANCEL%>";
    }
	enableAllFormElements();
	
    document.forms[0].submit();
}

function manda11(obj) {
	if (obj == "Y")
    {
		if (document.getElementById('span11') != null)
			document.getElementById('span11').innerText = "* ";
    }
    else {
		if (document.getElementById('span11') != null)
			document.getElementById('span11').innerText = " ";
    }
}        
//-->
</script>

</head>

<body>

<html:form action="CommoditySec.do">
<input type="hidden" name="event" value="<%=SecurityAction.EVENT_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="apportionIndexID" />
<input type="hidden" name="itemType" />
<input type="hidden" name="isCMTmaker" value="<%=isCMTmaker?ICMSConstant.TRUE_VALUE:ICMSConstant.FALSE_VALUE%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.commodity"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.id"/></td>
          <td width="30%"><bean:write name="CommSecForm" property="securityID"/>&nbsp;
          <html:hidden property="securityID"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.sub.type"/></td>
          <td width="30%">
          <integro:empty-if-null value="<%=aForm.getSecuritySubType()%>"/>
          <html:hidden property="securitySubType"/>
          </td>
        </tr>
        <tr class="even">
        <td width="20%" class="fieldname"><bean:message key="label.security.sci.currency"/></td>
        <td width="30%"><bean:write name="CommSecForm" property="sciSecurityCurrency"/>&nbsp;
        <html:hidden property="sciSecurityCurrency"/>
        </td>
        <td width="20%" class="fieldname"><bean:mesage key="label.security.cms.currency"/>&nbsp;<font color="#0000FF">* </font></td>
        <td width="30%">
              <html:select property="cmsSecurityCurrency" disabled="<%=isCMTmaker%>">
	              <option value="" ><bean:message key="label.please.select"/> </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="cmsSecurityCurrency"/>
        </td>
        </tr>
        
     
     	<tr class="odd">
	  <td class="fieldname"><bean:message key="label.security.legal.enforceability"/>
	    <font color="#FF0000">*</font>
	  </td>
	  <td>
	      <html:select property="le" disabled="<%=isCMTmaker%>"
onchange="manda11(this.value)">
		      <option value="" ><bean:message key="label.please.select"/></option>
		      <html:options name="LEID" labelName="LEValue"/>
	      </html:select>
	      <html:errors property="le"/>
	  </td>
	  <td  class="fieldname"><bean:message key="label.security.legal.enforceability.date"/>&nbsp;<font color="#FF0000">* </font><font color="#0000FF"><span id="span11">&nbsp;</span></font></td>
	  <td>
			  <html:text property="leDate" readonly="true" size="15" maxlength="11" />
	      <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=isCMTmaker?"":"onclick=\"return showCalendar('leDate', 'dd/mm/y');\""%> onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
	      <html:errors property="leDate"/>
	  </td>
        </tr>
        
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.date.legal.charge"/></td>
          <td>
			  <html:text property="legalChargeDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=isCMTmaker?"":"onclick=\"return showCalendar('legalChargeDate', 'dd/mm/y');\""%> onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="legalChargeDate"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
                <html:select property="chargeType" disabled="<%=isCMTmaker%>">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="chargeID" labelName="chargeValue"/>
                    </html:select>
                <html:errors property="chargeType"/>
          </td>
        </tr>
        <tr class="odd">
        <td class="fieldname"><bean:message key="label.security.charge.amount"/> <font color="#FF0000">*</font></td>
        <td>
              <html:text property="chargeAmount" maxlength="20" disabled="<%=isCMTmaker%>"/>&nbsp;
              <html:errors property="chargeAmount"/>
        </td>
        <td class="fieldname"><bean:message key="label.security.exchange.ctr.app"/>
        <font color="#FF0000">*</font>
        </td>
        <td>
                <html:select property="exchangeControlObtained" disabled="<%=isCMTmaker%>">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
                    </html:select>
                <html:errors property="exchangeControlObtained"/>
        </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.sec.env.liability"/>
            <font color="#FF0000">*</font>
          </td>
          <td>
                <html:select property="securityEnvRisk" disabled="<%=isCMTmaker%>">
                <option value=""><bean:message key="label.please.select"/> </option>
                <html:options name="secRiskyID" labelName="secRiskyValue"/>
                </html:select></td>
                <html:errors property="securityEnvRisk" />
          </td>
          <td class="fieldname"><bean:message key="label.security.date.sec.confirm.env.risk"/>
          </td>
          <td>
			  <html:text property="dateSecurityEnvRisk" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=isCMTmaker?"":"onclick=\"return showCalendar('dateSecurityEnvRisk', 'dd/mm/y');\""%> onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="dateSecurityEnvRisk"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
          <td colspan="3">
            <html:textarea property="remarkSecurityEnvRisk" rows="3" cols="100" style="width:100%" disabled="<%=isCMTmaker%>"/>
              &nbsp; <html:errors property="remarkSecurityEnvRisk" />
          </td>
        </tr>
        <tbody> </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.approved.commodity.type"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.loc"/>
          <font color="#FF0000">*</font><font color="#0000FF">* </font></td>
          <td>
            <html:select property="securityLocation" disabled="<%=isCMTmaker%>" onchange="changeOrgByCountry()">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="countryValues" labelName="countryLabels"/>
            </html:select>&nbsp;
            <html:errors property="securityLocation"/>
          </td>


<%
 ArrayList organizationLabels = new ArrayList();
 ArrayList organizationValues = new ArrayList();
String collateralLoc=aForm.getSecurityLocation();
CountryOrgCodeUtil.fillOrgCode2List(collateralLoc, organizationValues,organizationLabels);
request.setAttribute("organizationValues",organizationValues);
request.setAttribute("organizationLabels",organizationLabels);	
%>	
<script>
function changeOrgByCountry()
{
enableAllFormElements();
document.forms[0].event.value="prepare_update_sub";
document.forms[0].from_page.value="prepare_update_sub";
document.forms[0].submit();
}
</script>  
			<td class="fieldname"><bean:message key="label.org.code "/>&nbsp;
			   <font color="#FF0000">*</font><font color="#0000FF">* </font></td>
			<td>
			<html:select property="securityOrganization" disabled="<%=isCMTmaker%>" >
				 <option value="" ><bean:message key="label.please.select"/></option>
				 <html:options name="organizationValues" labelName="organizationLabels"/>
			</html:select>
			<html:errors property="securityOrganization"/>
			</td>

   </tr>
      </table>
    </td>
  </tr>
  </tbody>
</table>


<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <tbody>
        <tr class="odd">

    <td class="tblFormSection">
      <h3><bean:message key="label.security.approved.cust.diff.eod.price"/></h3>
          </td>
          </tr>
        <tr class="even">
          <td class="tblFormSection">
            <hr/>
          </td>
          </tr>
        <tr class="even">
          <td class="tblFormSection">

      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname">(+) or (-)</td>
          <td width="30%">
            <html:radio property="plusmnSign" value="<%=CommodityConstant.SIGN_PLUS%>" disabled="<%=!isCMTmaker%>">+</html:radio>
            &nbsp;&nbsp;
            <html:radio property="plusmnSign" value="<%=CommodityConstant.SIGN_MINUS%>" disabled="<%=!isCMTmaker%>">-</html:radio>
            &nbsp;&nbsp;
            <html:radio property="plusmnSign" value="<%=CommodityConstant.SIGN_PLUS_OR_MINUS%>" disabled="<%=!isCMTmaker || true%>">&plusmn;</html:radio>
            <html:errors property="plusmnSign"/>
          </td>
          <td width="20%" class="fieldname">Customer Differential</td>
          <td width="30%">
            <html:text property="customerDiff" maxlength="22" disabled="<%=!isCMTmaker%>"/>&nbsp;
            <html:errors property="customerDiff"/>
          </td>
        </tr>
        </tbody>
      </table>
      </td>
      </tr>
  </tbody>
</table>
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.title"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                  <thead>
                    <tr>
                      <td width="5%"><bean:message key="label.global.sn"/></td>
                      <td width="20%"><bean:message key="label.security.pledgor.id"/></td>
                      <td width="20%"><bean:message key="label.security.le.id"/></td>
                      <td width="28%"><bean:message key="label.security.pledgor.name"/></td>
                      <td width="27%"><bean:message key="label.security.pledgor.relationship"/></td>
                    </tr>
                  </thead>
                  <tbody>
				<%
                    ICollateralPledgor[] pledgor = iCols[index].getPledgors();
                    String classtype = "odd";
                    if (pledgor != null) {
                        if (pledgor.length == 0) {
				%>
                    <tr class="<%=classtype%>">
                    <td colspan="5">
                    <bean:message key="label.security.pledgor.info.none"/>
                    </td>
                    </tr>
				<% } for (int counter = 0; counter < pledgor.length; counter++) { %>
                    <tr class="<%=classtype%>">
                      <td width="5%" class="index"><%=counter + 1%></td>
                      <td width="20%"><%=pledgor[counter].getSCIPledgorID()%>
                      <%
                    if (pledgor[counter].getSCIPledgorMapStatus() != null &&
                            pledgor[counter].getSCIPledgorMapStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
                      %>
                      &nbsp;<font color="#FF0000"><b>DELETED</b></font>
                      <% } %>
                      </td>
                      <td width="20%"><%=(pledgor[counter].getLegalID() > 0)?String.valueOf(pledgor[counter].getLegalID()):"-"%></td>
                      <td width="28%"><integro:empty-if-null value="<%=pledgor[counter].getPledgorName()%>"/></td>
                      <td width="27%"><integro:empty-if-null value="<%=pledgor[counter].getPledgorRelship()%>"/></td>
                    </tr>
					<%	if (classtype.equals("odd")) {
                            classtype = "even";
                        }
                        else {
                            classtype = "odd";
                        }
                    }
                    } else { %>
                    <tr class="<%=classtype%>">
                    <td colspan="5">
                    <bean:message key="label.security.pledgor.info.none"/>
                    </td>
                    </tr>
                    <% } %>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<!--<%@ include file="/collateral/secapportion/update_apportion_summary.jsp" %>-->

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.valuation.details"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td width="20%" class="fieldname"><bean:message key="label.valuation.currency"/></td>
          <td width="30%">
            <html:select property="valuationCurrency" disabled="<%=isCMTmaker%>">
	        <option value="" ><bean:message key="label.please.select"/"/> </option>
	        <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
            <html:errors property="valuationCurrency"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.val.date"/></td>
          <td width="30%">
          	<bean:write name="CommSecForm" property="valDate"/>&nbsp;
          	<html:hidden property="valDate"/>
          </td>
        </tr>
        <tr class="odd">
        	<td class="fieldname"><bean:message key="label.security.valuation.cmv"/></td>
        	<td>
        		<bean:write name="CommSecForm" property="valCMV"/>&nbsp;
        		<html:hidden property="valCMV"/>        		
        	</td>
        	<td class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
        	<td>
        		<bean:write name="CommSecForm" property="valFSV"/>&nbsp;
        		<html:hidden property="valFSV"/>
        	</td>
        </tr>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="60" height="22" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<script>
    var s = "<%=aForm.getLe()%>";
      manda11(s);
</script>

</html:form>

</body>
</html>
