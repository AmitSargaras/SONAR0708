<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.ui.limitbooking.LimitBookingForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton, 
                 java.util.HashMap,
                 java.util.List,
                 com.integrosys.cms.app.limitbooking.bus.OBLimitBooking,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.limitbooking.bus.ILoanSectorDetail,
                 com.integrosys.cms.app.limitbooking.bus.IBankGroupDetail,
                 java.text.NumberFormat,
                 java.text.DecimalFormat"%>
                 
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
    try{
    String event = request.getParameter("event");
    
    String title = "";
    String submitEvent = "";
    
    if (LimitBookingAction.EVENT_PREPARE_DELETE_BOOKING.equals(event)) {
        title = "title.limit.booking.delete";
        submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_DELETE_BOOKING;
    }
    else {
        title = "title.limit.booking.successful";
        submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_SUCCESSFUL_BOOKING;
	}
	
    LimitBookingForm aForm = (LimitBookingForm) request.getAttribute("LimitBookingForm");
  
    if (aForm == null) {
        aForm = new LimitBookingForm();
    }
    
    CountryList countryList = CountryList.getInstance();
    
    OBLimitBooking limitBooking  = (OBLimitBooking) session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction.sess.limitBooking");
    List bgel  = null;
    List pol  = null;
    List allBkg  = null;
    if (limitBooking != null) {
        bgel = limitBooking.getBankGroupList();
        pol = limitBooking.getLoanSectorList();
        
        if (bgel != null)
            pageContext.setAttribute("bgel", bgel);
        if (pol != null)
            pageContext.setAttribute("pol", pol);
    }
    
    HashMap labelValue = CommonDataSingleton.getCodeCategoryValueLabelMap(ICMSConstant.CATEGORY_CODE_ECONOMIC_SECTOR);
    
    NumberFormat formatter = new DecimalFormat("#######.##");
    NumberFormat formatterDisplay = new DecimalFormat("#,###,###.##");
    
     String regex = "[0-9]+(\\.[0-9]*)?$";

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

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>

                    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
                      <thead>
					  <tr>
                        <td colspan="2"><h3><bean:message key="<%=title%>"/></h3>
                          <hr></td> 
                      </tr>
					  </thead>
					  <tbody>
                      <tr>
                        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo" id="myTable">

                              <tbody>
                              
                                <tr class="even">
                                  <td width="50%" class="fieldname"><bean:message key="label.existing.customer"/></td>
                                  <td width="50%" valign="top">
                                    <% if (aForm.getIsExistingCustomer().equals("Y")) { %>
                                  		Yes 
                                  	<% } else { %>
                                  		No
                                  	<% } %>
                                   </td>
                                </tr>

                                <tr class="odd">
                                  <td width="50%" class="fieldname"><bean:message key="label.financial.institution"/></td>
                                  <td width="50%" valign="top">
                                  <% if (aForm.getIsFinancialInstitution().equals("Y")) { %>
                                  Yes 
                                  <% } else { %>
                                  No
                                  <% } %>
                                  </td>
                                </tr>
                                
                                <tr class="even">
                                  <td width="50%" class="fieldname"><bean:message key="label.customer.name"/></td>
                                  <td width="50%"><integro:wrapper value="<%=String.valueOf(aForm.getBkgName())%>"/></td>
                                </tr>

                           		<tr class="odd">
                                  <td class="fieldname"><bean:message key="label.id.no"/><font color="blue">*</font></td>
                                  <td><integro:wrapper value="<%=String.valueOf(aForm.getBkgIDNo())%>"/></td>
                                </tr>
                                
                                 <tr class="even">
                                  <td class="fieldname"><bean:message key="label.customer.business.sector"/></td>
                                  <td>
                                  <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_BUSINESS_SECTOR, aForm.getBkgBusSector())%>"/>
                               	  </td>
                                </tr>

                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.source.sys"/></td>
                                  <td>
                                   <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AA_SOURCE, aForm.getAaSource())%>"/>
                                  </td>
                                </tr>
                                
								<tr class="even">
                                  <td class="fieldname"><bean:message key="label.aa.num"/></td>
                                  <td><integro:empty-if-null value="<%=String.valueOf(aForm.getAaNo())%>"/></td>
                                </tr>
                                
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.country.risk"/></td>
                                  <td>
                                  <integro:empty-if-null value="<%=countryList.getCountryName(aForm.getBkgCountry())%>"/>	
                                  </td>
                                </tr>
                                
                                <tr class="even">
                                  <td class="fieldname"><bean:message key="label.business.unit"/></td>
                                  <td>
                                  <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT, aForm.getBkgBusUnit())%>"/>
                                  </td>
                                </tr>
                                
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.bank.entity"/></td>
                                  <td>
                                  <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.SUB_LIMIT_DESC_CATEGORY_CODE, aForm.getBkgBankEntity())%>"/>
                                  </td>
                                </tr>
                                
                                <tr class="even">
                                  <td class="fieldname"><bean:message key="label.booking.currency"/></td>
                                  <td>
                                  <integro:empty-if-null value="<%=aForm.getBkgCurrency()%>"/>
                                	</td>
                                </tr>
                                
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.booking.amount"/></td>
                                  <td>
                                   <% if (aForm.getBkgAmount() != null && aForm.getBkgAmount().matches(regex) && !aForm.getBkgAmount().toString().trim().equals("")) { %>
                                  <integro:empty-if-null value="<%=formatter.format(Double.parseDouble(aForm.getBkgAmount()))%>"/>
                                  <% } else { %>
								  <integro:empty-if-null value="<%=aForm.getBkgAmount()%>"/>
                                  <% } %>
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
                        <td><h3>Economic Sector </h3></td>
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
                                <td width="37%"><bean:message key="label.pol"/></td>
                                <td width="23%"><bean:message key="label.booking.limit"/></td>
                              </tr>
                            </thead>
                            <tbody>
                          <%if (pol == null || pol.size() <= 0){%>
						    <tr class="odd">
                             <td colspan="3">Sorry, there are no records found.</td>
						    </tr>
                          <%}else{
                            int rowIdx = 0;
                          %>
                            <logic:iterate id="ob" type="com.integrosys.cms.app.limitbooking.bus.ILimitBookingDetail" name="pol">
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                              <td class="index"><%=rowIdx%></td>
                              <td><integro:empty-if-null value="<%=ob.getBkgTypeDesc()%>"/></td>
                              <td style="text-align:center"><integro:empty-if-null value="<%=ob.getBkgAmount().getCurrencyCode()%>"/> <integro:empty-if-null value="<%=formatterDisplay.format(ob.getBkgAmount().getAmount())%>"/></td>
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
                        </tr>
						</thead>
                          <tbody>
                          <%if (bgel == null || bgel.size() <= 0){%>
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
                              <td style="text-align:center"><integro:amount amount="<%=ob.getBkgAmount()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitConvAmount()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitIslamAmount()%>"/></td>
                              <td style="text-align:center"><integro:amount amount="<%=ob.getLimitInvAmount()%>"/></td>
                            </tr>
                            </logic:iterate>
                          <%}%>
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
                            <td align="center"><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                                                  onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                                
                                <a href="LimitBooking.do?event=<%=LimitBookingAction.EVENT_SEARCH_BOOKING%>" onmouseout="MM_swapImgRestore()"
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
