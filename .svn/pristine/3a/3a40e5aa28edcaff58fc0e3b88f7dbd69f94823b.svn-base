<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.ui.limitbooking.LimitBookingForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.HashMap,
                 java.util.List,
                 java.util.ArrayList,
                 java.util.Collection,
                 com.integrosys.cms.app.limitbooking.bus.OBLimitBooking,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.limitbooking.bus.ILoanSectorDetail,
                 com.integrosys.cms.app.limitbooking.bus.IBankGroupDetail,
                 java.text.NumberFormat,
                 java.text.DecimalFormat,
                 org.apache.struts.util.LabelValueBean,
                 java.util.Comparator,
                 java.util.Map,
                 java.util.Collections,
                 java.util.Iterator"%>
                 
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

<% class AlphabeticComparator implements Comparator {
        public int compare(Object o1, Object o2) {
            LabelValueBean s1 = (LabelValueBean) o1;
            LabelValueBean s2 = (LabelValueBean) o2;
            return s1.getValue().compareTo(s2.getValue());
        }
    }
%>  

<%
    try{
    
    String event = request.getParameter("event");
    
    Object isGroupRetrieved = request.getAttribute(LimitBookingAction.LIMIT_BOOKING_GROUP_RETRIEVED_FLAG);
    
    String title = "";
    String fromEvent = "";
    String cancelEvent = "";
    String submitEvent = "";
    String retrieveBGELEvent = "";
    String removePOLEvent = "";
    String removeGroupEvent = "";
    String addPOLEvent = ""; 
    String editPOLEvent = ""; 
    String searchGroupEvent = ""; 
    boolean isEdit = false;

    if (LimitBookingAction.EVENT_PREPARE_ADD_BOOKING.equals(event) || LimitBookingAction.EVENT_VIEW_RESULT_ADD.equals(event) ||
    LimitBookingAction.EVENT_RETRIEVE_BGEL_ADD.equals(event) || LimitBookingAction.EVENT_REMOVE_POL_ADD.equals(event) ||
    LimitBookingAction.EVENT_REMOVE_GROUP_ADD.equals(event) || LimitBookingAction.EVENT_PREPARE_ADD_POL_ADD.equals(event) ||
    LimitBookingAction.EVENT_PREPARE_EDIT_POL_ADD.equals(event) || LimitBookingAction.EVENT_PREPARE_SEARCH_GROUP_ADD.equals(event)) {
        title = "title.limit.booking.new";
        fromEvent = LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_ADD;
        
        cancelEvent = "Welcome.do?event=prepare";
        submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_VIEW_RESULT_ADD;
        retrieveBGELEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_RETRIEVE_BGEL_ADD;
        removePOLEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_REMOVE_POL_ADD;
        removeGroupEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_REMOVE_GROUP_ADD;
        addPOLEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_ADD_POL_ADD;
        editPOLEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_EDIT_POL_ADD;
        searchGroupEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_SEARCH_GROUP_ADD;
        isEdit = false;
    }
    else if (LimitBookingAction.EVENT_PREPARE_EDIT_BOOKING.equals(event) || LimitBookingAction.EVENT_VIEW_RESULT_EDIT.equals(event) ||
    LimitBookingAction.EVENT_RETRIEVE_BGEL_EDIT.equals(event) || LimitBookingAction.EVENT_REMOVE_POL_EDIT.equals(event) ||
    LimitBookingAction.EVENT_REMOVE_GROUP_EDIT.equals(event)  || LimitBookingAction.EVENT_PREPARE_ADD_POL_EDIT.equals(event) ||
    LimitBookingAction.EVENT_PREPARE_EDIT_POL_EDIT.equals(event) || LimitBookingAction.EVENT_PREPARE_SEARCH_GROUP_EDIT.equals(event)) {
        title = "title.limit.booking.edit";
        fromEvent = LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_EDIT;
        
        cancelEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_SEARCH_BOOKING;
        submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_VIEW_RESULT_EDIT;
        retrieveBGELEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_RETRIEVE_BGEL_EDIT;
        removePOLEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_REMOVE_POL_EDIT;
        removeGroupEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_REMOVE_GROUP_EDIT;
        addPOLEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_ADD_POL_EDIT;
        editPOLEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_EDIT_POL_EDIT;
        searchGroupEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_PREPARE_SEARCH_GROUP_EDIT;
        isEdit = true;
	}
	
    LimitBookingForm aForm = (LimitBookingForm) request.getAttribute("LimitBookingForm");
  
    if (aForm == null) {
        aForm = new LimitBookingForm();
    }
  
    List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
    List ctryVals = (List)CountryList.getInstance().getCountryValues();
    pageContext.setAttribute("ctryLbls", ctryLbls);
    pageContext.setAttribute("ctryVals", ctryVals);
    
    List busUnitValueList = new ArrayList();
    List busUnitLabelList = new ArrayList();
    CommonCodeList busUnit = CommonCodeList.getInstance(null, null, ICMSConstant.BIZ_SGMT, null, true);
    busUnitValueList.addAll((List)busUnit.getCommonCodeValues());
    busUnitLabelList.addAll((List)busUnit.getCommonCodeLabels());
    pageContext.setAttribute("busUnitValueList", busUnitValueList);
    pageContext.setAttribute("busUnitLabelList", busUnitLabelList);

    CurrencyList currencyList = CurrencyList.getInstance();
    Collection currencyLabels = currencyList.getCurrencyLabels();
    Collection currencyValues = currencyList.getCountryValues();
    pageContext.setAttribute("currencyLabels", currencyLabels);
    pageContext.setAttribute("currencyValues", currencyValues);

    Collection sourceSystemLabels = CommonDataSingleton.getCodeCategoryLabels(CategoryCodeConstant.AA_SOURCE);
    Collection sourceSystemValues = CommonDataSingleton.getCodeCategoryValues(CategoryCodeConstant.AA_SOURCE);
    pageContext.setAttribute("sourceValueList", sourceSystemValues);
    pageContext.setAttribute("sourceLabelList", sourceSystemLabels);
    
    Collection bankEntityLabels = CommonDataSingleton.getCodeCategoryLabels(ICMSConstant.SUB_LIMIT_DESC_CATEGORY_CODE, null, null , ICMSConstant.SUB_LIMIT_TYPE_BANK_ENTITY_ENTRY_CODE);
    Collection bankEntityValues = CommonDataSingleton.getCodeCategoryValues(ICMSConstant.SUB_LIMIT_DESC_CATEGORY_CODE, null, null , ICMSConstant.SUB_LIMIT_TYPE_BANK_ENTITY_ENTRY_CODE);
    pageContext.setAttribute("bkgBankEntityValueList", bankEntityValues);
    pageContext.setAttribute("bkgBankEntityLabelList", bankEntityLabels);

    OBLimitBooking limitBooking  = (OBLimitBooking) session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction.sess.limitBooking");
    
    List customerBusinessSectorList = new ArrayList();
    CommonCodeList customerBusinessSector = CommonCodeList.getInstance(CategoryCodeConstant.CUSTOMER_BUSINESS_SECTOR);
    Map m = customerBusinessSector.getLabelValueMap();
    Collection keys = customerBusinessSector.getCommonCodeValues();

    for (Iterator i = keys.iterator(); i.hasNext();) {
    	Object o = i.next();
    	LabelValueBean bean = new LabelValueBean( "[" + o + "] " + m.get(o), (String) o );
        customerBusinessSectorList.add(bean);
    }
    
    Collections.sort(customerBusinessSectorList, new AlphabeticComparator());   

    pageContext.setAttribute("customerBusinessSectorList", customerBusinessSectorList);
    
   
    List bgel  = null;
    List pol  = null;
    List allBkg  = null;
    if (limitBooking != null) {
        bgel = limitBooking.getBankGroupList();
        pol = limitBooking.getLoanSectorList();
        
        if (bgel != null)
            pageContext.setAttribute("bgel", bgel);
        if (pol != null) {
        	
        	Collections.sort(pol, new Comparator() {
				public int compare (Object o1, Object o2) {
					
					int result = (((ILoanSectorDetail)o1).getBkgProdTypeDesc()).compareTo(((ILoanSectorDetail)o2).getBkgProdTypeDesc()); 
					if (result != 0) return result;  
					return (((ILoanSectorDetail)o1).getBkgTypeDesc()).compareTo(((ILoanSectorDetail)o2).getBkgTypeDesc());
				}		
			});
        	
            pageContext.setAttribute("pol", pol);
        }
    }
    
    NumberFormat formatterDisplay = new DecimalFormat("#,###,###.##");
 
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
    document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].action = "<%=cancelEvent%>";
    document.forms[0].submit();
}

function searchGroup() {
    document.forms[0].action = "<%=searchGroupEvent%>";
    document.forms[0].submit();
}

function editPol(polID) {
    document.forms[0].action = "<%=editPOLEvent%>&polID="+polID;
    document.forms[0].submit();
}

function removeGroup() {
    document.forms[0].action = "<%=removeGroupEvent%>";
    document.forms[0].submit();
}

function removePOL() {
    document.forms[0].action = "<%=removePOLEvent%>";
    document.forms[0].submit();
}

function retrieveBgel() {
   
    document.forms[0].action = "<%=retrieveBGELEvent%>";
    document.forms[0].submit();
}

function selectSector() {
    document.forms[0].action = "<%=addPOLEvent%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>
			<input type="hidden" name="fromEvent" value="<%=fromEvent%>"/>
			
			<input type="hidden" name="event" value="<%=request.getParameter("event")%>"/>

                    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
                      <thead>
                      <tr>
                          <td colspan="2" align="right"><font color="#0000FF">*</font> Mandatory for Submission</td>
                        </tr>
                        <tr> 
					  <tr>
                        <td colspan="2"><h3><bean:message key="<%=title%>"/></h3>
                          <hr></td> 
                      </tr>
                      <tr>
        				<td colspan="2">
         					<html:errors property="limitBookingAmountError"/>
         				</td>
        				</tr>
						 <tr>
        				<td colspan="2">
         					<html:errors property="rateNotFoundError"/>
         				</td>
        				</tr>
					  </thead>
					  <tbody>
                      <tr>
                        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo" id="myTable">

                              <tbody>
                              
                                <tr class="even">
                                  <td width="50%" class="fieldname"><bean:message key="label.existing.customer"/><font color="blue">*</font></td>
                                  <td width="50%" valign="top">
                                  <% if (isEdit) { %>
                                    <% if (aForm.getIsExistingCustomer().equals("Y")) { %>
                                  		Yes 
                                  	<% } else { %>
                                  		No
                                  	<% } %>
                                    <input type="hidden" name="isExistingCustomer" value="<%=aForm.getIsExistingCustomer()%>"/>
                                  <% } else { %>
                                    <html:radio property="isExistingCustomer" value="<%=ICMSConstant.TRUE_VALUE%>"/>Yes &nbsp;&nbsp;
                                    <html:radio property="isExistingCustomer" value="<%=ICMSConstant.FALSE_VALUE%>"/>No
                                    <html:errors property="isExistingCustomerError" /></td>
                                  <% } %>
                                </tr>

                                <tr class="odd">
                                  <td width="50%" class="fieldname"><bean:message key="label.financial.institution"/><font color="blue">*</font></td>
                                  <td width="50%" valign="top">
                                  <% if (isEdit) { %>
                                    <% if (aForm.getIsFinancialInstitution().equals("Y")) { %>
                                        Yes 
                                  <% } else { %>
                                        No
                                  <% } %>
                                    <input type="hidden" name="isFinancialInstitution" value="<%=aForm.getIsFinancialInstitution()%>"/>
                                  <% } else { %>
                                    <html:radio property="isFinancialInstitution" value="<%=ICMSConstant.TRUE_VALUE%>"/>Yes &nbsp;&nbsp;
                                    <html:radio property="isFinancialInstitution" value="<%=ICMSConstant.FALSE_VALUE%>"/>No
                                    <html:errors property="isFinancialInstitutionError" /></td>
                                  <% } %>
                                </tr>
                                
                                <tr class="even">
                                  <td width="50%" class="fieldname"><bean:message key="label.customer.name"/><font color="blue">*</font></td>
                                  <td width="50%">
                                  <% if (isEdit) { %>
                                     <integro:wrapper value="<%=aForm.getBkgName()%>"/>
                                     <input type="hidden" name="bkgName" value="<%=aForm.getBkgName()%>"/>
                                  <% } else { %>
                                    <html:text property="bkgName"  value="<%=aForm.getBkgName()%>" maxlength="150" size="40" />
                                    <html:errors property="bkgNameError" />
                                  <% } %>
                                  </td>
                                </tr>

                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.id.no"/><font color="blue">*</font></td>
                                  <td>
                                  <% if (isEdit) { %>
                                     <integro:wrapper value="<%=aForm.getBkgIDNo()%>"/>
                                     <input type="hidden" name="bkgIDNo" value="<%=aForm.getBkgIDNo()%>"/>
                                  <% } else { %>
                                    <html:text property="bkgIDNo"  value="<%=aForm.getBkgIDNo()%>" maxlength="20" size="20" />
                                    <html:errors property="bkgIDNoError" />
                                  <% } %>
                                  <% if (!isEdit) { %> 
                                  <input name="Submit32" type="button" class="btnNormal" value="Retrieve Groups" onClick="javascript:retrieveBgel();" width="70">
                                  &nbsp;
                                  <% } %>
                                  </td>
                                </tr>
                                
                                <tr class="even">
                                  <td class="fieldname"><bean:message key="label.customer.business.sector"/><font color="blue">*</font></td>
                                  <td><html:select property="bkgBusSector"  value="<%=aForm.getBkgBusSector()%>">
                                    <option value=""><bean:message key="label.please.select"/></option>
	  								<html:options collection="customerBusinessSectorList" property="value" labelProperty="label"/>
                                  </html:select>
                                  <html:errors property="bkgBusSectorError" /></td>
                                </tr>

                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.source.sys"/><font color="blue">*</font></td>
                                  <td><html:select property="aaSource"  value="<%=aForm.getAaSource()%>">
                                    <option value="">Please Select </option>
                                    <html:options name="sourceValueList" labelName="sourceLabelList"/>
                                  </html:select>
                                  <html:errors property="aaSourceError" /></td>
                                </tr>
                                
								<tr class="even">
                                  <td class="fieldname"><bean:message key="label.aa.num"/></td>
                                  <td><html:text property="aaNo"  value="<%=aForm.getAaNo()%>" maxlength="35" size="35" />
                                    <html:errors property="aaNoError" /></td>
                                </tr>
                                
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.country.risk"/><font color="blue">*</font></td>
                                  <td>
                                  <html:select property="bkgCountry"  value="<%=aForm.getBkgCountry()%>">
                                    <option value="">Please Select </option>
                                    <html:options name="ctryVals" labelName="ctryLbls"/>
                                  </html:select>
                                  <html:errors property="bkgCountryError" />
                                  </td>
                                </tr>
                                
                                <tr class="even">
                                  <td class="fieldname"><bean:message key="label.business.unit"/><font color="blue">*</font></td>
                                  <td>
                                  <html:select property="bkgBusUnit" value="<%=aForm.getBkgBusUnit()%>">
                                    <option value="">Please Select </option>
                                    <html:options name="busUnitValueList" labelName="busUnitLabelList"/>
                                  </html:select>
                                  <html:errors property="bkgBusUnitError" />
                                  </td>
                                </tr>
                                
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.bank.entity"/><font color="blue">*</font></td>
                                  <td><html:select property="bkgBankEntity"  value="<%=aForm.getBkgBankEntity()%>">
                                    <option value="">Please Select </option>
                                    <html:options name="bkgBankEntityValueList" labelName="bkgBankEntityLabelList"/>
                                  </html:select>
                                  <html:errors property="bkgBankEntityError" /></td>
                                </tr>
                                
                                <tr class="even">
                                  <td class="fieldname"><bean:message key="label.booking.currency"/><font color="blue">*</font></td>
                                  <td><html:select property="bkgCurrency"  value="<%=aForm.getBkgCurrency()%>">
                                    <option value="">Please Select </option>
                                    <html:options name="currencyValues" labelName="currencyLabels"/>
                                  </html:select>
                                  <html:errors property="bkgCurrencyError" />
                                </td>
                                </tr>
                                
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.booking.amount"/><font color="blue">*</font></td>
                                  <td>
								  <html:text property="bkgAmount" value="<%=aForm.getBkgAmount()%>" maxlength="16" size="20" />
                                    <html:errors property="bkgAmountError" />
                                  </td>
                                </tr>
                                
                              </tbody>
                            </table>
                        </td>
                      </tr>
					  <tr>
                        <td colspan="2" align="center">&nbsp;</td>
                      </tr>
					  <tr>
                        <td><h3>Booking Details </h3></td>
					    <td align="right" valign="bottom">
                          <input name="Submit3" type="button" class="btnNormal" value="Add" onclick="javascript:selectSector();">
					      &nbsp;
					      <input name="delete3" type="button" class="btnNormal" value="Remove"  onclick="javascript:removePOL();">
					      </td>
					    </tr>
					  <tr>
                        <td colspan="2"><hr/>
                        </td>
					    </tr>
					  <tr>
        				<td colspan="2">
         					<html:errors property="polDeletedListError"/>
         				</td>
        			  </tr>
					  <tr>
                        <td colspan="2" align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                              <tr>
                                <td width="5%"><bean:message key="label.serial.no"/></td>
                                <td width="37%"><bean:message key="label.productlimit.product.type"/></td>
                                <td width="37%"><bean:message key="label.pol"/></td>
                                <td width="23%"><bean:message key="label.booking.limit"/></td>
                                <td width="17%"><bean:message key="label.global.action"/></td>
                                <td width="18%"><bean:message key="label.global.delete"/></td>
                              </tr>
                            </thead>
                            <tbody>
                          <%if (pol == null || pol.size() <= 0){%>
						    <tr class="odd">
                             <td colspan="6">Sorry, there are no records found.</td>
						    </tr>
                          <%}else{
                            int rowIdx = 0;
                          %>
                            <logic:iterate id="ob" type="com.integrosys.cms.app.limitbooking.bus.ILimitBookingDetail" name="pol">
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                              <td class="index"><%=rowIdx%></td>
                              <td><integro:empty-if-null value="<%=ob.getBkgProdTypeDesc()%>"/></td>
                              <td><integro:empty-if-null value="<%=ob.getBkgTypeDesc()%>"/></td>
                              <td style="text-align:center">
                              <integro:empty-if-null value="<%=ob.getBkgAmount().getCurrencyCode()%>"/> <integro:empty-if-null value="<%=formatterDisplay.format(ob.getBkgAmount().getAmount())%>"/>
                              </td>
                              <td style="text-align:center">
                                   <a href="javascript:editPol('<%=ob.getBkgTypeCode()%>');">Edit</a>
                              </td>
                              <td style="text-align:center">
                                <html:checkbox property="polDeletedList" value="<%=ob.getBkgTypeCode()%>" />
                              </td>
                            </tr>
                            </logic:iterate>
                          <%}%>
                          </tbody>
                        </table></td>
					    </tr>
					  <tr>
                        <td colspan="2" align="center">&nbsp;</td>
					    </tr>

					  <tr>
                        <td><h3>BGEL</h3></td>
                        <td align="right"><input name="Select Group" type="button" class="btnNormal" onclick="javascript:searchGroup();" value="Select Group" >
                        &nbsp;
					      <input name="delete4" type="button" class="btnNormal" value="Remove"  onclick="javascript:removeGroup();">                
                        </td>
					  </tr>
					  <tr>
                          <td colspan="2"><hr/> </td>
                        </tr>
                       <tr>
        				<td colspan="2">
         					 <html:errors property="bankGroupDeletedListError"/>
         				</td>
        				</tr>
					  <tr>
                        <td colspan="2" align="left"><table id="tblSample" width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">

						<thead><tr>
						<td width="5%"><bean:message key="label.serial.no"/></td>
						<td width="21%"><bean:message key="label.group.name"/></td>
						<td width="14%"><bean:message key="label.limit.conventional.banking"/></td>
						<td width="14%"><bean:message key="label.limit.islamic.banking"/></td>
						<td width="14%"><bean:message key="label.limit.investment.banking"/></td>
						<td width="15%"><bean:message key="label.limit.banking.group"/></td>
						<td width="17%"><bean:message key="label.global.delete"/></td>
                        </tr>
						</thead>
                          <tbody>
                          <% if (bgel == null || bgel.size() <= 0 && !(isGroupRetrieved != null && isGroupRetrieved == "false")){%>
						    <tr class="odd">
                             <td colspan="7">Sorry, there are no records found.</td>
						    </tr>
                          <%}else{
                            int rowIdx = 0;
                          %>
                            <logic:iterate id="ob" type="com.integrosys.cms.app.limitbooking.bus.IBankGroupDetail" name="bgel">
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                              <td class="index"><%=rowIdx%></td>
                              <td><integro:empty-if-null value="<%=ob.getBkgTypeDesc()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitConvAmount()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitIslamAmount()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitInvAmount()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitAmount()%>"/></td>
                              <td style="text-align:center">
                               <html:checkbox property="bankGroupDeletedList" value="<%=ob.getBkgTypeCode()%>" disabled="<%=ob.getGrpIsRetrieved()%>" />
                              </td>
                            </tr>
                            </logic:iterate>
                          <%}%>
                           <%if (isGroupRetrieved != null && isGroupRetrieved == "false") {%>
                          <tr class="odd">
                            <td colspan="7">
                             <font color="#FF0000" size="1">Sorry, there are no records found for the ID No <%=aForm.getBkgIDNo()%></font></td>
         					</td>
						    </tr>
						   <% } %>
                          </tbody>
                        </table></td>
                      </tr>
					  <tr>
                        <td colspan="2">&nbsp;</td>
                      </tr>
					  </tbody>
                    </table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  
   <tr height="40">
                            <td align="center"><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()"
                                                  onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                                
                                <a href="javascript:cancelForm();" onmouseout="MM_swapImgRestore()"
                                   onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
                                    <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                                
                            </td>

                </tr>
  
  
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<%}catch (Exception e){ e.printStackTrace();}%>
<!-- InstanceEnd -->
</html>
