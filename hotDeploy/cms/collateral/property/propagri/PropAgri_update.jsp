<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.IAgricultural,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.property.RankList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
				 com.integrosys.cms.ui.collateral.property.PropertyForm,
                 com.integrosys.cms.ui.collateral.property.propagri.PropAgriForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propagri/PropAgri_update.jsp,v 1.87 2006/11/23 03:00:46 jzhan Exp $
    *
    * Purpose: Update Collateral
    * Description: Type - Property, Subtype - Agricultural
    *
    * @author $Author: jzhan $<br>
    * @version $Revision: 1.87 $
    * Date: $Date: 2006/11/23 03:00:46 $
    * Tag: $Name: DEV_20061123_B286V1 $
    */
%>
<%	
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj");

    IAgricultural iCol = (IAgricultural) itrxValue.getStagingCollateral();
    pageContext.setAttribute("obj", iCol);
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String subtype = "PropAgri";
    String subtype2 = "Property";
    String prefix = "Property"; 
	String formName = subtype + "Form";
//    String formName = subtype2+"Form";    
	String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	
    PropAgriForm colForm = (PropAgriForm) request.getAttribute(formName);
    String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.from");
//	PropertyForm colForm = (PropertyForm) request.getAttribute(formName);
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script>
<!--
function submitPage(num, index) {
	enableAllFormElements();
	/*selectAllOptions(document.forms[0].secInstrument);*/ //Modified by Grace;ABank CLIMS;Description:remove field purpose
    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    if (num == 3) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 4) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 5) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 6) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";	    
    }
    if (num == 7) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 8) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    }

    document.forms[0].submit();

}

    function getNextPhyDate(cal, date) {
        if (cal != "" && date != "") {
            cal.sel.value = date;
        }
        lastPhyDateValue = document.forms[0].datePhyInspec.value;
        frequency = document.forms[0].physInspFreq.value;
        frequencyUOM = document.forms[0].physInsFreqUOM.value;

        if (lastPhyDateValue != "" && frequency != "" && frequencyUOM != "") {
            frequency = parseFloat(frequency.split(' ').join(''));
            lastDate = new Date();
     	    lastDate.setDate(lastPhyDateValue.substring(0,2));
     	    lastDate.setMonth(months[lastPhyDateValue.substring(3,6)]);
     	    lastDate.setFullYear(lastPhyDateValue.substring(7,11));
            nextDate = new Date();
            if (frequencyUOM == 'D') {
                nextDate = lastDate.add(Date.DAY, frequency);
            }
            if (frequencyUOM == 'W') {
                nextDate = lastDate.add(Date.DAY, (frequency * 7));
            }
            if (frequencyUOM == 'M') {
                nextDate = lastDate.add(Date.MONTH, frequency);
            }
            if (frequencyUOM == 'Y') {
                nextDate = lastDate.add(Date.YEAR, frequency);
            }
            nextDateStr = "";
            if (nextDate.getDate() < 10) {
                nextDateStr = "0";
            }
            nextDateStr = nextDateStr + nextDate.getDate()+"/"+month[nextDate.getMonth()]+"/"+nextDate.getFullYear();
            document.forms[0].nextPhyInspecDate.value = nextDateStr;
        }
    }
-->
</script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="PropAgriCollateral.do">
<input type="hidden" name="event"/>
    <input type="hidden" name="indexID" />
    <input type="hidden" name="subtype" value="PropAgri"/>
    <input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>
<input type="hidden" name="subTypeCode" value="<%=subtypeCode%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
		<td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.property.title.create"/>
			<% } else { %>
				<bean:message key="label.security.property.title.edit"/>
			<% } %>
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
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

<%@ include file="/collateral/property/update_common_property.jsp" %>   

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
<script>
/*    var s = "<%=colForm.getLe()%>";
      manda11(s);*/
</script>
<script>
  if (document.forms[0].isPhysInsp[0].checked)
  {
     setPhysInsp('1');
  }
</script>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>
</html>
