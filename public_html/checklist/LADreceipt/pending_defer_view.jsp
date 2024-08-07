<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
				 com.integrosys.cms.app.common.util.*,
                 java.util.*"
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.allCreditApproverList");
//System.out.println("::::::allCreditApproverList:::::"+allCreditApproverList);

if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}
    LADReceiptForm form = (LADReceiptForm)request.getAttribute("LADReceiptForm");
    String lableDocDate = "Doc Expiry Date";
	/*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0)
	{
		
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if(monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))
	{
				lableDocDate = "Due Date to Receive Premium Receipt";
	}*/
	List currencyList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.currencyList");
    if(currencyList!=null){
    	pageContext.setAttribute("currencyList",currencyList);
    }
	
%>

<%--  // cr 36
    ICheckListItem item = (ICheckListItem) session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.LADReceiptAction.checkListItem");

    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();

    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);
    
--%>




<%@page import="com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptForm"%>
<%@page import="org.apache.struts.util.LabelValueBean"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script>

function saveForm() {
	document.forms["LADReceiptForm"].event.value="view_ok";
	document.forms["LADReceiptForm"].submit();
}
</script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
<!-- InstanceEndEditable --></head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="LADReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update LAD Doc Receipt </h3></td>
    </tr>
    <tr>
      <td>
      <h3> View Doc Description - Pending Deferred</h3>
    </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="docCode" /></td>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Doc No</td>-->
<!--              <td>&nbsp;<bean:write name="LADReceiptForm" property="docNo" /></td>-->
<!--            </tr>-->
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="docDesc" /></td>
            </tr>
             
<!--            <tr class="even">-->
<!--              <td class="fieldname">Document Type</td>-->
<!--              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>-->
<!--              <td>-</td>-->
<!--              <%}else{ %>-->
<!--              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>-->
<!--            	<%} %>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td>&nbsp;<bean:write name="LADReceiptForm" property="formNo" /></td>-->
<!--            </tr>-->
            <tr class="even">
              <td class="fieldname">Doc Date</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="docDate" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Doc Due Date</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="completedDate" /></td>
            </tr>
<%--
            <tr class="odd">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="identifyDate" /></td>
            </tr>
--%>
        	<tr class="odd">
              <td class="fieldname"><%=lableDocDate%></td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="docExpDate" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Date Deferred&nbsp;</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="deferDate" /></td>
            </tr>
            <%-- // cr 36 --%>
            <tr class="odd">
              <td class="fieldname">Next Due Date </td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="expectedReturnDate" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Defer Counter</td>
              <td><bean:write name="LADReceiptForm" property="deferCount"/> 
               
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Defered Days</td>
              <td><bean:write name="LADReceiptForm" property="deferedDays"/> 
               
              </td>
            </tr>
<%--            <tr class="odd">
              <td class="fieldname" >DDN valid for </td><td ><input type="text" name="ddnDays" size="5" readonly="true"> &nbsp;&nbsp;<a href="#" onclick="calculateDaysDiff()">Days</a></td>
            </tr>
--%>            
           <tr class="even" >
            <td class="fieldname">Credit Approver</td>
            <td>&nbsp;
            
           <%
           if(allCreditApproverList!=null){
        	for(int a=0; a<allCreditApproverList.size();a++){   
           LabelValueBean bean=(LabelValueBean) allCreditApproverList.get(a);
           if(bean.getValue()!=null){
          	 if(bean.getValue().trim().equals(form.getCreditApprover())){
          		
          	%>	 
          		 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          	<% 
          	 }
          	 }          
        	}
        	} %> 
            </td>
          
        </tr>
<%--            <tr class="odd">
              <td class="fieldname" >DDN valid for </td>
              <td >
            	  <% if (bcaApprovedDate == null) { %>
	                 &nbsp;
	              <% } else {
		               Date d1 = null;
	                   if (item.getDeferExtendedDate() != null) {
	                     d1 = item.getDeferExtendedDate();
                       } else {
 	                     d1 = item.getDeferExpiryDate();
                       }
 	                   Date d2 = cal.getTime();
 	                   if (d1.before(d2)) {
		          %>
		             &nbsp;         
	              <%   } else { %>
		              <%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%> days
	              <%
                       }
                     }
                  %>
              </td>
            </tr>
--%>            
<!--            <tr class="even">-->
<!--              <td class="fieldname">Action Party</td>-->
<!--              <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=form.getActionParty()%>" display="true" descWithCode="false"/></td>-->
<!--            </tr>-->
<%-- start here for cr-17
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                   <html:radio property="shared" disabled="true" value="true" />Yes
                   <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>
--%>
            </tbody>
        </table>
<%--
        <jsp:include page="/checklist/secreceipt/ViewShareCheckList.jsp" />
--%>
<!--        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">-->
<!--            <tbody>-->
<!--            <tr class="odd">-->
<!--                <td class="fieldname">Remarks</td>-->
<!--                <td>-->
<!--                <% LADReceiptForm aForm = (LADReceiptForm)request.getAttribute("LADReceiptForm"); %>-->
<!--                    <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;-->
<!--                </td>-->
<!--            </tr>-->
<!--            </tbody>-->
<!--        </table>-->
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                  <a href="#" onClick="saveForm()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                </td>
              </tr>
        </table>
<%-- End here for cr-17 --%>
</td>
    </tr>
  </tbody>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
