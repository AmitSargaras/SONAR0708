<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.ui.limitbooking.LimitBookingForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.List,
                 java.util.Collections,
                 java.util.Iterator,
                 java.util.Comparator,
                 java.util.ArrayList,
                 java.util.Map,
                 java.util.Collection,
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
* @author priya
*
*/
%>


<%
    String event = request.getParameter("event");
    String polID = request.getParameter("polID");
    String fromEvent = request.getParameter(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT);
    
    String action = "";
    String cancelEvent = "";
    String submitEvent = "";
    
    if (LimitBookingAction.EVENT_PREPARE_ADD_POL_ADD.equals(event) || LimitBookingAction.EVENT_PREPARE_ADD_POL_EDIT.equals(event)) {
    	action = "label.add.new";
    	submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_ADD_POL;
    }
    else if (LimitBookingAction.EVENT_PREPARE_EDIT_POL_ADD.equals(event) || LimitBookingAction.EVENT_PREPARE_EDIT_POL_EDIT.equals(event)) {
    	action = "label.edit";
    	submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_EDIT_POL + "&polID=" + polID;
    }
    
    if (fromEvent.equals(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_ADD)) {
    	cancelEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_ADD_BOOKING;
    }
    else if (fromEvent.equals(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_EDIT)) {
    	cancelEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_EDIT_BOOKING;
    }
    
    LimitBookingForm aForm = (LimitBookingForm) request.getAttribute("LimitBookingForm");
    if (aForm == null) {
        aForm = new LimitBookingForm();
    }
    
    class AlphabeticComparator implements Comparator {
    	public int compare(Object o1, Object o2) {
        LabelValueBean s1 = (LabelValueBean) o1;
        LabelValueBean s2 = (LabelValueBean) o2;
        return s1.getLabel().compareTo(s2.getLabel());
    	}
	}
    
	CommonCodeList ecoSec = CommonCodeList.getInstance(ICMSConstant.CATEGORY_CODE_ECONOMIC_SECTOR);
	
	List ecoSecList = new ArrayList();
	Map ecoSecMap = ecoSec.getLabelValueMap();
	Collection keys = ecoSec.getCommonCodeValues();

	for (Iterator i = keys.iterator(); i.hasNext();) {
	    	Object o = i.next();
	    	LabelValueBean bean = new LabelValueBean((String) o + " - " +(String)ecoSecMap.get(o), (String)(o) );
	    	ecoSecList.add(bean);
	}
	
	Collections.sort(ecoSecList, new AlphabeticComparator());   
	pageContext.setAttribute("ecoSecList", ecoSecList);
	
    List prodTypeValueList = new ArrayList();
    List prodTypeLabelList = new ArrayList();
    CommonCodeList prodType = CommonCodeList.getInstance(null, null, ICMSConstant.CATEGORY_CODE_PRODUCT_TYPE, null, true);
    prodTypeValueList.addAll((ArrayList)prodType.getCommonCodeValues());
    prodTypeLabelList.addAll((ArrayList)prodType.getCommonCodeLabels());
    pageContext.setAttribute("prodTypeValueList", prodTypeValueList);
    pageContext.setAttribute("prodTypeLabelList", prodTypeLabelList);

    CurrencyList currencyList = CurrencyList.getInstance();
    Collection currencyLabels = currencyList.getCurrencyLabels();
    Collection currencyValues = currencyList.getCountryValues();
    pageContext.setAttribute("currencyLabels", currencyLabels);
    pageContext.setAttribute("currencyValues", currencyValues);
    
    Map labelValue1 = CommonDataSingleton.getCodeCategoryValueLabelMap(ICMSConstant.CATEGORY_CODE_ECONOMIC_SECTOR);
    
    Map labelValue2 = CommonDataSingleton.getCodeCategoryValueLabelMap(ICMSConstant.CATEGORY_CODE_PRODUCT_TYPE);
    
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage() {
    document.forms[0].action = "<%=submitEvent%>";
    var obj = document.forms[0].pol;
    document.forms[0].polBkgDesc.value = obj.options[obj.selectedIndex].text;
    var obj1 = document.forms[0].prodType; 
    document.forms[0].prodTypeDesc.value = obj1.options[obj1.selectedIndex].text;
    document.forms[0].submit();
}

function cancel() {
    document.forms[0].action = "<%=cancelEvent%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>
<input type="hidden" name="fromEvent" value="<%=fromEvent%>"/>
    <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
  <thead>
    <tr>
      <td width="83%"> <h3>Add Booking Details </h3></td>
      <td width="17%" align="right" valign="bottom"></td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr>
        <td colspan="2" class="odd">
         <html:errors property="duplicatePolEntryError"/>
         </td>
        </tr>
        <tr class="even">
            <td width="38%" class="fieldname">Product Type <font color="blue">*</font></td>
            <td width="62%">
              <html:select property="prodType" value="<%=aForm.getProdType()%>">
	  			<option value=""><bean:message key="label.please.select"/></option>
                <html:options name="prodTypeValueList" labelName="prodTypeLabelList"/>
	  			</html:select>
              <html:errors property="prodTypeError" />
              </td>
            </tr>
             <html:hidden property="prodTypeDesc" value="<%=String.valueOf(labelValue2.get(aForm.getProdTypeDesc()))%>"/>
          <tr class="odd">
            <td width="38%" class="fieldname">Loan Sector <font color="blue">*</font></td>
            <td width="62%">
              <html:select property="pol" value="<%=aForm.getPol()%>">
	  			<option value=""><bean:message key="label.please.select"/></option>
                <html:options collection="ecoSecList" property="value" labelProperty="label"/>
	  			</html:select>
              <html:errors property="polError" />
              </td>
            </tr>
            <html:hidden property="polBkgDesc" value="<%=String.valueOf(labelValue1.get(aForm.getPol()))%>"/>
          <tr class="even">
            <td class="fieldname">Limit Currency<font color="blue">*</font> </td>
            <td><html:select property="polBkgCurrency"  value="<%=aForm.getPolBkgCurrency()%>">
                <option value="">Please Select </option>
                <html:options name="currencyValues" labelName="currencyLabels"/>
              </html:select>
              <html:errors property="polBkgCurrencyError" /></td>
          </tr>
          <tr class="odd">
            <td class="fieldname">Booking Amount<font color="blue">*</font> </td>
          <td>
			<html:text property="polBkgAmount" value="<%=aForm.getPolBkgAmount()%>" maxlength="16" size="20" />
            <html:errors property="polBkgAmountError" />
          </td>
        </tr>
        </tbody>
      </table></td>
    </tr>
      </tbody>
    </table>

<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                                                  onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" border="0"></a>
        <a href="javascript:cancel();" onmouseout="MM_swapImgRestore()"
                                   onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" width="70" height="20" border="0"></a></td>
    </td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>
