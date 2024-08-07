<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.List,
                 java.util.HashMap,
                 com.integrosys.cms.app.limitbooking.bus.OBLimitBooking,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.tag.TokenTag,
                 com.integrosys.cms.ui.limitbooking.LimitBookingUIHelper"%>
                 
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

	String fromEvent = request.getParameter(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT);
    
    String submitEvent = "";
    
    if (fromEvent.equals(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_ADD)) {
    	submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_ADD_BOOKING;
    }
    else if (fromEvent.equals(LimitBookingAction.LIMIT_BOOKING_FROM_EVENT_EDIT)) {
    	submitEvent = "LimitBooking.do?event=" + LimitBookingAction.EVENT_EDIT_BOOKING; 
	}
    
    OBLimitBooking limitBooking  = (OBLimitBooking) session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction.sess.limitBooking");
    List allBkg  = null;
    if (limitBooking != null) {
        allBkg = limitBooking.getAllBkgs();
        if (allBkg != null) {
        	pageContext.setAttribute("allBkg",allBkg);
       	}
    }
    
    HashMap map = new HashMap();
    map.put(ICMSConstant.BKG_TYPE_BGEL,ICMSConstant.BKG_TYPE_BGEL+" - ");
    map.put(ICMSConstant.BKG_TYPE_MAIN_POL,"Main Sector - ");
    map.put(ICMSConstant.BKG_TYPE_SUB_POL,"Sub Sector - ");
    map.put(ICMSConstant.BKG_TYPE_ECO_POL,"Economic Sector - ");
    map.put(ICMSConstant.BKG_TYPE_COUNTRY,"Country Limit - ");
    map.put(ICMSConstant.BKG_TYPE_ENTITY,"Entity Limit - ");
    map.put(ICMSConstant.BKG_TYPE_PROD_PROG,"Product Limit - ");

	String context = request.getContextPath() + "/";
	
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" type="text/JavaScript">

function submitPage() {
    document.forms[0].action = "<%=submitEvent%>";
    document.forms[0].submit();
}

function cancel() {
    document.forms[0].action = "LimitBooking.do?event=<%=LimitBookingAction.EVENT_CANCEL_VIEW_RESULT%>";
    document.forms[0].submit();
}


function viewLimitBooking(rowIdx) {   
     var url = 'LimitBooking.do?event=limit_booking_popup&rowIdx=' + rowIdx;
     var token='<%=TokenTag.generateToken()%>';
     MM_openBrWindow(url ,token, 'width=750,height=500,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes')
     disableGoButtons(false) ;
}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>
    <html:hidden property="event"/>
    <input type="hidden" name="fromEvent" value="<%=fromEvent%>"/>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td height="111" class="odd" style="text-align:center"> Your booking result is as follows : <br>
			  <table class="tblInfo" width="100%" border="0" cellpadding="0" cellspacing="0">
			  <thead>
			  <tr style="text-align:center">
			  <td width="26%" height="21" style="text-align:center"><bean:message key="label.dimension.type"/></td>
			  <td width="6%" style="text-align:center"><bean:message key="label.result"/></td>
			  <td width="17%" style="text-align:center"><bean:message key="label.limit"/></td>
			  <td width="18%" style="text-align:center"><bean:message key="label.current.exposure.and.booked.limit"/></td>
			  <td width="14%" style="text-align:center"><bean:message key="label.available.limit"/></td>
			  <td width="19%" style="text-align:center"><bean:message key="label.your.booking"/></td>
			  </tr>
			  </thead>
              <tbody>
               <%if (allBkg == null || allBkg.size() <= 0){%>
						    <tr class="odd">
                             <td colspan="6"><bean:message key="error.limit.booking.no.dimension"/></td>
						    </tr>
                          <%}else{
                            int rowIdx = 0;
                          %>
              <logic:iterate id="ob" type="com.integrosys.cms.app.limitbooking.bus.ILimitBookingDetail" name="allBkg">
              
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                  <%
                      Amount currExposure = ob.getCurrentExposure();
                      Amount currPlusBooked = CommonUtil.addAmount(currExposure,ob.getTotalBookedAmount());
                      Amount available = CommonUtil.subtractAmount(ob.getLimitAmount(), currPlusBooked);
                  %>
                  <td>

                  <% if (ob.getBkgType().equals(ICMSConstant.BKG_TYPE_BGEL) 
                		  || ob.getBkgType().equals(ICMSConstant.BKG_TYPE_BANK_WIDE_BANK_ENTITY_CUSTOMER_GROUP) 
                		  || ob.getBkgType().equals(ICMSConstant.BKG_TYPE_BANK_WIDE_BANK_ENTITY_CUSTOMER)) {%> 
                  <integro:empty-if-null value="<%=ob.getBkgTypeDesc()%>"/> -
                  <integro:empty-if-null value="<%=LimitBookingUIHelper.getBookingTypeDescription(ob.getBkgSubType(), ob.getBkgTypeDesc())%>"/>
                 <% } else if (ob.getBkgType().equals(ICMSConstant.BKG_TYPE_MAIN_POL)
               		  || ob.getBkgType().equals(ICMSConstant.BKG_TYPE_SUB_POL)
            		  || ob.getBkgType().equals(ICMSConstant.BKG_TYPE_ECO_POL)) { %>
                 <integro:empty-if-null value="<%=map.get(ob.getBkgType())%>"/> 
                 <integro:empty-if-null value="<%=ob.getBkgTypeDesc()%>"/> -
                 <integro:empty-if-null value="<%=LimitBookingUIHelper.getBookingTypeDescription(ob.getBkgSubType(), ob.getBkgTypeDesc())%>"/>       
                    <% } else if (ob.getBkgType().equals(ICMSConstant.BKG_TYPE_PROD_PROG))  { %>
                  <integro:empty-if-null value="<%=map.get(ob.getBkgType())%>"/>
                  <integro:empty-if-null value="<%=ob.getBkgProdTypeDesc()%>"/>
                   <% } else { %>
                  <integro:empty-if-null value="<%=map.get(ob.getBkgType())%>"/>
                  <integro:empty-if-null value="<%=ob.getBkgTypeDesc()%>"/>
                  <% } %>
                  
                  </td>
                  <td style="text-align:center"><integro:empty-if-null value="<%=ob.getBkgResult()%>"/></td>
                  <td style="text-align:center"><integro:amount amount="<%=ob.getLimitAmount()%>" />&nbsp;</td>
                  <td style="text-align:center"><a href="javascript:viewLimitBooking('<%=rowIdx-1%>');">
                  <integro:amount amount="<%=currPlusBooked%>" /></a>&nbsp;</td>
                  <td style="text-align:center"><integro:amount amount="<%=available%>" />&nbsp;</td>
                  <td style="text-align:center"><integro:amount amount="<%=ob.getBkgBaseAmount()%>" />&nbsp;</td>
           
                </tr>
          
                </logic:iterate>
                <tr class="odd" >
			  		<td><b>OVERALL</b></td>
			  		<td style="text-align:center"><b><integro:empty-if-null value="<%=limitBooking.getOverallBkgResult()%>"/></b></td>
			  		<td style="text-align:center" colspan="4">&nbsp;</strong></td>
			  	</tr>
			  	
                <%}%>
              </tbody>
              </table> </td>
            </tr>
              </tbody>
            </table>

</td>
</tr>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" valign="baseline align="center"><a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a>
        <td width="50%" valign="baseline" align="center"> <a href="javascript:cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
			
        </tr>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</td>
</tr>

</tbody>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
