<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.deedsub.IDeedSub,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.collateral.document.docdeedsub.DocDeedSubForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/document/docDeedSub/DocDeedSub_update.jsp,v 1.59 2007/03/15 16:05:15 jerlin Exp $
    *
    * Purpose: Update Collateral
    * Description: Type - Document, Subtype - Deed of Subordination
    *
    * @author $Author: jerlin $<br>
    * @version $Revision: 1.59 $
    * Date: $Date: 2007/03/15 16:05:15 $
    * Tag: $Name:  $
    */
%>

<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<%    
    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.serviceColObj");
    IDeedSub iCol = (IDeedSub) itrxValue.getStagingCollateral();

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String formName = "DocDeedSubForm";
    DocDeedSubForm colForm = (DocDeedSubForm) request.getAttribute(formName);
    String prefix = "Doc";
    String subtype = "DocDeedSub";     
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.from");
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ include file="/collateral/locale.jsp"%>

<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
<!--

function checkPriorityRanking(){
    /*
    for (Count = 0; Count < document.forms[0].priorityRankingCheck.value; Count++) {
        for (innerCount = Count+1; innerCount < document.forms[0].priorityRankingCheck.value; innerCount++) {
            if(document.forms[0].priorityRanking[Count].value == document.forms[0].priorityRanking[innerCount].value && !(document.forms[0].priorityRanking[Count].value =="") )
            {
                alert("Priority Ranking should be different");
                return false;
            }    
        }
    }
    */
    return true;
}

function checkMinMaxAmount(){
    var min = document.forms[0].minAmount.value;
    var max = document.forms[0].maxAmount.value;
    var tempMin="";
    var tempMax="";
    for(i=0;i<min.length;i++){
        if(min.charAt(i)!=","){
            tempMin += min.charAt(i);
        }
    }  
    for(j=0;j<max.length;j++){
        if(max.charAt(j)!=","){
            tempMax += max.charAt(j);
        }
    }  
    if(parseInt(tempMin)> parseInt(tempMax))
        {
            alert("Min amount should not be greater than Max amount");
            return false;
        }
    return true;
}

/*function selectLists(){
    List = document.forms[0].secInstrument;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
    }
}*/

function submitPage(num) {
    enableAllFormElements();
    //selectLists();
    if (num == 1) {
        document.forms[0].event.value="submit";
    }
    if (num == 2) {
        document.forms[0].event.value="update";
    }
    document.forms[0].submit();

}
//-->
</script>

<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/ssc.jsp"%>
<html:form action="DocDeedSubCollateral.do">
<input type="hidden" name="event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="itemType"/>
<input type="hidden" name="subtype" value="<%=subtype%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.documentation.title.create"/>
			<% } else { %>
				<bean:message key="label.security.documentation.title.edit"/>
			<% } %>
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>	
    <tr>
      <td > <h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>

    <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
            <%@ include file="/collateral/common/common_fields_update.jsp" %>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"> <bean:message key="label.security.perfection.date"/>
					&nbsp;<span class="mandatoryPerfection">*</span>	</td>
				<td><html:text property="perfectionDate" readonly="true"/>
					<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('perfectionDate', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/><br>
					<html:errors property="perfectionDate"/></td>
				<td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:select property="chargeType" >
						<option value="" ><bean:message key="label.please.select"/> </option>
						<html:options name="chargeID" labelName="chargeValue"/>
					</html:select>
					<html:errors property="chargeType"/></td>
			</tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.maturity.date"/>&nbsp;
					<span class="mandatoryPerfection">*</span></td>
				<td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="collateralMaturityDate"/></td>
				<td class="fieldname">
                    <bean:message key="label.security.issuing.bank"/></td>
                <td><html:text property="issuer"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.borrower.collateral" /></td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio></td>
				<td class="fieldname"><bean:message key="label.security.deed.subordination.date"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:text property="documentDate" readonly="true" size="15" maxlength="11" />
					<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('documentDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
					<html:errors property="documentDate"/> </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.ref.no"/>&nbsp;</td>
				<td><html:text property="numberLetter"  size="30" maxlength="30" />
					<html:errors property="numberLetter"/></td>
				<td class="fieldname"><bean:message key="label.security.doc.amt"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><html:text property="amountLetter"  size="15" maxlength="11" />
					<html:errors property="amountLetter"/>
              </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.amt.min"/>&nbsp;</td>
				<td><html:text property="minAmount"  size="15" maxlength="11" />
					<html:errors property="minAmount"/></td>
				<td  class="fieldname"><bean:message key="label.security.amt.max"/>&nbsp;</td>
				<td><html:text property="maxAmount"  size="15" maxlength="11" />
					<html:errors property="maxAmount"/></td>
            </tr>  

			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.remarks"/></td>
              <td colspan="3">
              <html:textarea property="description" rows="5" cols="120" style="width:100%" />
              <html:errors property="description"/>
              </td>
            </tr>
			<%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%-- @ include file="/collateral/document/priority_ranking_update.jsp" --%>   
    
<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>
<%@ include file="/collateral/common/update_netRV.jsp" %>

<%-- <%@ include file="/collateral/secapportion/update_apportion_summary.jsp" %> --%>

<%--@ include file="/collateral/document/update_valuation.jsp"--%>           
    
<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value='<%=subtype+"Collateral.do"%>'/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>