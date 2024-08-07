<%@ page import="com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCap,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityForm,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.OBExemptFacilityGroupTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacility,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacilityGroup,
                 java.util.Collection,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: Exempt Facility - View page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>
<%
    OBExemptFacilityGroupTrxValue obj = (OBExemptFacilityGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.ExemptFacility.ExemptFacilityAction.ExemptFacilityTrxValue");
    ExemptFacilityForm aForm = (ExemptFacilityForm) request.getAttribute("ExemptFacilityForm");
    DefaultLogger.debug(this,  "Form = " +aForm );

    //CommonCodeList boardDescList = (CommonCodeList)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.boardDescList");

    //String event = request.getParameter("event");
    String isRejectedStr = request.getParameter("isRejected");
    //boolean isRejected = !(isRejectedStr == null);

    DefaultLogger.debug(this,"in view..");
    IExemptFacilityGroup group= null;
    IExemptFacility[] stagingParametersArray = null;
    DefaultLogger.debug(this,"obj="+obj);
    if(obj != null) {
        group = obj.getStagingExemptFacilityGroup();
        stagingParametersArray = group.getExemptFacility();
    }

    //Collection losSystemList = CommonCodeList.getInstance(null,null, ICMSUIConstant.AA_SOURCE_CODE).getCommonCodeValues();
    //Collection losSystemDescList =  CommonCodeList.getInstance(null,null, ICMSUIConstant.AA_SOURCE_CODE).getCommonCodeLabels();;
    //pageContext.setAttribute("losSystemList", losSystemList);
    //pageContext.setAttribute("losSystemDescList", losSystemDescList);

    String los = (String)session.getAttribute("com.integrosys.cms.ui.ExemptFacility.ExemptFacilityAction.los");
    Collection facilityCodeList = CommonCodeList.getInstance(null,null, ICategoryEntryConstant.FACILITY_DESCRIPTION, los).getCommonCodeValues();
    Collection facilityCodeDescList =  CommonCodeList.getInstance(null,null, ICategoryEntryConstant.FACILITY_DESCRIPTION, los).getCommonCodeLabels();
    pageContext.setAttribute("facilityCodeList", facilityCodeList);
    pageContext.setAttribute("facilityCodeDescList", facilityCodeDescList);

%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage() {
    document.forms[0].event.value="maker_close";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="ExemptFacility.do">
<table width="100%">
<input type="hidden" name="event"/>

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="70%"><h3><bean:message key="label.view"/>&nbsp;-&nbsp;<bean:message key="title.exemptFacility"/></h3></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
  <tr>
    <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
  </tr>
</thead>
        <tbody>
        <%--
        <tr class="odd">
          <td width="40%" class="fieldname"><bean:message key="label.crp.exemptfac.los.system"/>
            <bean:message key="collateral.stock.delete.stockitem"/>
          </td>
          <td>
             <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.AA_SOURCE_CODE,aForm.getLosSystem())%>"/>
              &nbsp;</td>
        </tr>
        --%>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.crp.exemptfac.facility"/><bean:message key="collateral.stock.delete.stockitem"/>
          </td>
          <td >
             <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.FACILITY_DESCRIPTION, aForm.getFacilityCode())%>"/>
              &nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.crp.exemptfac.facility"/><bean:message key="label.status"/>
          <bean:message key="collateral.stock.delete.stockitem"/>
          <td>
           <% if (ICMSConstant.EXEMPT_FACILITY_STATUS_EXEMPTED.equals(aForm.getFacilityStatusExempted())) {%>
                Exempted
            <%}else{%>
                <%=aForm.getFacilityStatusConditionalPerc()%>
            <%}%>
          </td>
        </tr>
        <%--<tr class="odd">
          <td  class="fieldname"><bean:message key="label.remarks"/> </td>
          <td>
              <integro:htmltext value="<%=aForm.getRemarks()%>" lineLength="75" />
          </td>
        </tr>--%>
        </tbody>
      </table>    </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>
      </tbody>
    </table>
    </td>
  </tr>
</tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
<%--
   <%if("to_track".equals(event)){%>
	   <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else if (isRejected){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else { %>
--%>
	   <td width="100%" valign="baseline" align="center"> <a href="ExemptFacility.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
<%--   <%}%>--%>

  </tr>
</table>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>