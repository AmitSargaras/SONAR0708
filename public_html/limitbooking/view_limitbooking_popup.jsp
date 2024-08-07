<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.limitbooking.LimitBookingAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.List,
                 com.integrosys.cms.app.limitbooking.bus.OBLimitBookingDetail,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
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
    String context = request.getContextPath() + "/";
    
    OBLimitBookingDetail limitBookingDetail  = (OBLimitBookingDetail) session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction.limitBookingDetail");
    List bookedLimitList  = null;
    if (limitBookingDetail != null) {
        bookedLimitList = limitBookingDetail.getBookedLimitList();
        if (bookedLimitList != null) {
        	pageContext.setAttribute("bookedLimitList",bookedLimitList);
       	}
    }
    
    int sno = 0;

%>

<html>
<head>
   <link rel="stylesheet" type="text/css" media="all" href="<%=context%>css/calendar-blue.css">
   <link href="<%=context%>css/smartlender-popup.css" rel="stylesheet" type="text/css"/>
   <link href="<%=context%>css/smartlender-print.css" media="print" rel="stylesheet" type="text/css"/>
   <script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
   <script type="text/javascript" src="js/imageNavigation.js"></script>

<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
      <td width="70%"><h3>Booked Limit Not Yet Released </h3></td>
      <td valign="baseline" style="text-align:right">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3"><hr /></td>
    </tr>
    </thead>
  <tbody>
    <tr>
      <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
       <thead>
          <tr>
            <td width="5%" class="index"><bean:message key="label.global.sno"/></td>
            <td width="15%" style="text-align:center"><bean:message key="label.customer.name"/></td>
            <td width="10%" style="text-align:center"><bean:message key="label.booked.amount"/></td>
            <td width="10%" style="text-align:center"><bean:message key="label.date.limit.booked"/></td>
			<td width="10%" style="text-align:center"><bean:message key="label.business.unit"/></td>
            <td width="10%" style="text-align:center"><bean:message key="label.last.updated.by"/></td>
            <td width="10%" style="text-align:center"><bean:message key="label.source.sys"/></td>
            <td width="15%" style="text-align:center"><bean:message key="label.aa.num"/></td>
			<td width="15%" style="text-align:center"><bean:message key="label.manual.booking.ticket.number"/></td>
          </tr>
       </thead>
       <tbody>
            	<%if (bookedLimitList == null || bookedLimitList.size() <= 0){%>
						    <tr class="odd">
                             <td colspan="9">Sorry, there are no records found.</td>
						    </tr>
                          <%}else{
                            int rowIdx = 0;
                          %>
              <logic:iterate id="ob" type="com.integrosys.cms.app.limitbooking.bus.ILimitBooking" name="bookedLimitList">
              
              <% sno++; %>
                               
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                 <td style="text-align:center" class="index"><%=sno%>&nbsp;</td>
                  <td style="text-align:center"><integro:empty-if-null value="<%=ob.getBkgName()%>"/></td>
                  <td style="text-align:center"><integro:amount amount="<%=ob.getBkgAmount()%>" />&nbsp;</td>
                  <td style="text-align:center"><integro:empty-if-null value="<%=ob.getCreateDate()%>"/></td>
				  <td style="text-align:center"><integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT, ob.getBkgBusUnit())%>"/></td>
                  <td style="text-align:center"><integro:empty-if-null value="<%=LimitBookingUIHelper.getUserNameByUserID(ob.getLastModifiedBy())%>"/></td>
                  <td style="text-align:center"><integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AA_SOURCE, ob.getAaSource())%>"/></td>
                  <td style="text-align:center"><integro:empty-if-null value="<%=ob.getAaNo()%>"/></td>
                  <td style="text-align:center"><integro:empty-if-null value="<%=ob.getTicketNo()%>"/></td>
          		</tr>
           </logic:iterate>
                <%}%>
 
    </tbody>
     
</table>
</tbody>
<table>
<tr>
<td height="30">&nbsp;</td>
</tr>
</table>

<table width="123" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="123">&nbsp;</td>
    </tr>
  <tr>
     <td> 
     <a href="javascript:window.close();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','<%=context%>img/close2a.gif',1)"><img src="<%=context%>img/close1a.gif" name="Image42" width="70" height="20" border="0" id="Image42" /></a>
     
     </td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    </tr>
</table>

  
				
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
