<%@ page import="com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityForm,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Collection,
                 java.util.ArrayList,
                 java.util.HashMap,
                 java.util.Map,
                 java.util.Comparator,
                 java.util.List,
                 java.util.Iterator,
                 java.util.Collections,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.OBExemptFacilityGroupTrxValue,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.struts.util.LabelValueBean"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: For Maker and checker view the Exempt Facility
*
* @author $Author: lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>

<% class AlphabeticComparator implements Comparator {
        public int compare(Object o1, Object o2) {
            LabelValueBean s1 = (LabelValueBean) o1;
            LabelValueBean s2 = (LabelValueBean) o2;
            return s1.getLabel().compareTo(s2.getLabel());
        }
    }
%>  

<%
    String strIndex = request.getParameter("index");
    System.out.println("strIndex = " + strIndex);
    int index = 0;
    try{index=Integer.parseInt(strIndex);}catch(Exception e){}
    String event = request.getParameter("event");
    System.out.println("event " + event);
    String action = "";
    boolean isAdd=false;
    if (ExemptFacilityAction.EV_PREPARE_ADD.equals(event)||ExemptFacilityAction.EV_ADD.equals(event)|| ExemptFacilityAction.EV_REFRESH.equals(event))
        isAdd = true;
    if (isAdd)
        action = "label.add.new";
    else
        action = "label.edit";
    ExemptFacilityForm aForm = (ExemptFacilityForm) request.getAttribute("ExemptFacilityForm");
    DefaultLogger.debug(this,  "Form = " +aForm );

    DefaultLogger.debug(this, "Before get NPL");
    boolean isError=false;  //if validation error...
    if(event.equals(ExemptFacilityAction.EV_ADD)||event.equals(ExemptFacilityAction.EV_EDIT)){
        isError=true;
        System.out.println("isError = " + isError);
    }

    //Collection losSystemList = CommonCodeList.getInstance(null,null, ICMSUIConstant.AA_SOURCE_CODE).getCommonCodeValues();
    //Collection losSystemDescList =  CommonCodeList.getInstance(null,null, ICMSUIConstant.AA_SOURCE_CODE).getCommonCodeLabels();;
    //pageContext.setAttribute("losSystemList", losSystemList);
    //pageContext.setAttribute("losSystemDescList", losSystemDescList);

    Collection facilityCodeList = null;
    Collection facilityCodeDescList =  null;

    //System.out.println("aForm.getLosSystem() = " + aForm.getLosSystem());
    //if (aForm != null && aForm.getLosSystem() != null) {
    //    facilityCodeDescList = CommonCodeList.getInstance(null,aForm.getLosSystem(), ICMSUIConstant.FACILITY_CODE,null).getCommonCodeLabels();
    //    facilityCodeList = CommonCodeList.getInstance(null,aForm.getLosSystem(), ICMSUIConstant.FACILITY_CODE,null).getCommonCodeValues();
    //}
    //facilityCodeDescList = CommonCodeList.getInstance(null,null, ICategoryEntryConstant.FACILITY_DESCRIPTION, null).getCommonCodeLabels();
    //facilityCodeList = CommonCodeList.getInstance(null,null, ICategoryEntryConstant.FACILITY_DESCRIPTION, null).getCommonCodeValues();

    //if (facilityCodeList != null)
    //pageContext.setAttribute("facilityCodeList", facilityCodeList);
    //else
    //pageContext.setAttribute("facilityCodeList", new ArrayList());

    //if (facilityCodeDescList != null)
    //pageContext.setAttribute("facilityCodeDescList", facilityCodeDescList);
    //else
    //pageContext.setAttribute("facilityCodeDescList", new ArrayList());
    
    List facilityList = new ArrayList();
    CommonCodeList facility = CommonCodeList.getInstance(ICategoryEntryConstant.FACILITY_DESCRIPTION);
    Map m = facility.getLabelValueMap();
    Collection keys = facility.getCommonCodeValues();

    for (Iterator i = keys.iterator(); i.hasNext();) {
    	Object o = i.next();
    	LabelValueBean bean = new LabelValueBean((String)m.get(o), (String) o);
        facilityList.add(bean);
    }
    
    Collections.sort(facilityList, new AlphabeticComparator());   

    pageContext.setAttribute("facilityList", facilityList);
    
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
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link href="js/calendar-blue.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
<!--
function gotoListing() {
    document.forms[0].action = "ExemptFacility.do?event=<%=ExemptFacilityAction.EVENT_LIST%>";
    document.forms[0].submit();
}
function addExpense() {
    document.forms[0].action = "ExemptFacility.do?event=<%=ExemptFacilityAction.EV_ADD%>";
    document.forms[0].submit();
}
function editExpense() {
    document.forms[0].action = "ExemptFacility.do?event=<%=ExemptFacilityAction.EV_EDIT%>";
    document.forms[0].submit();
}

function fnAssign(str) {
  //  document.forms[0].advanceSearchType.value=<%=Boolean.FALSE %>;
    document.forms[0].action="ExemptFacility.do?event=refresh" ;
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ExemptFacility.do">
<body>
<p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission" />&nbsp;</p><br>
<input type="hidden" name="index" value="<%=index%>"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="70%"><h3><bean:message key="<%=action%>"/>&nbsp;-&nbsp;<bean:message key="title.crp.exemptfac"/></h3></td>
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
        <tr class="even">
          <td class="fieldname"><bean:message key="label.crp.exemptfac.facility"/><font color="#0000FF" size="1">*</font>
          </td>
          <td >
             <html:select property="facilityCode" value="<%=aForm.getFacilityCode()%>">
                <option value=""><bean:message key="label.please.select"/> </option>
                <html:options collection="facilityList" property="value" labelProperty="label"/>
             </html:select>

          <html:errors property="facilityCodeError" />
              &nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.crp.exemptfac.facility"/><bean:message key="label.status"/>
          <font color="#0000FF" size="1">*</font>
          <td>
            <html:radio property="facilityStatusExempted" value="<%=ICMSConstant.EXEMPT_FACILITY_STATUS_EXEMPTED%>"/>Exempted &nbsp;&nbsp;
            <br>
            <html:radio property="facilityStatusExempted" value="<%=ICMSConstant.EXEMPT_FACILITY_STATUS_CONDITIONAL%>"/>Conditional
            &nbsp;<html:text property="facilityStatusConditionalPerc"/>&nbsp;%
            <html:errors property="facilityStatusExemptedError" />
              <html:errors property="facilityStatusConditionalPercError" />
          </td>
        </tr>
        </tbody>
      </table>    </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp<html:errors property="<%=ICMSUIConstant.EXEMPT_FACILITY_DUPLICATE%>"/></td>
    </tr>
      </tbody>
    </table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <% if(isAdd){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:addExpense();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2"  border="0" id="Image0" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"  border="0" id="Image1" /></a></td>
   <%} else if(ExemptFacilityAction.EV_PREPARE_EDIT.equals(event) || ExemptFacilityAction.EV_EDIT.equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:editExpense();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok2.gif" name="Image2"  border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3"  border="0" id="Image3" /></a></td>
   <%}else if(ExemptFacilityAction.EVENT_CHECKER_VIEW.equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ExemptFacility.do?event=<%=ExemptFacilityAction.EVENT_LIST%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4"  border="0" id="Image4" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
