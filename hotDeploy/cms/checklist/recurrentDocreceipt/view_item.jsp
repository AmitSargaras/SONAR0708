<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String previous = request.getParameter("previous");
    String flag = request.getParameter("flag");
    ICheckListItem itemOb = (ICheckListItem)request.getAttribute("itemOb");
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.allCreditApproverList");
    RecurrentDocReceiptForm form = (RecurrentDocReceiptForm)request.getAttribute("RecurrentDocReceiptForm");
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
	
	int bb = 0;
	String taggedFileNames = (String) request.getAttribute(ITagUntagImageConstant.TAGGED_FILE_NAMES);
	String unTaggedFileNames = (String) request.getAttribute(ITagUntagImageConstant.UN_TAGGED_FILE_NAMES);


%>



<%@page import="com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptForm"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.util.List"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function returnPage(num) {
    document.forms["RecurrentDocReceiptForm"].event.value = "view_return";
    document.forms["RecurrentDocReceiptForm"].submit();
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
<html:form action="RecurrentDocReceipt" >
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

<input type="hidden" name="previous" value="<%=previous%>"/>
<input type="hidden" name="flag" value="<%=flag%>"/>
<input type="hidden" name="checkListID"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Recurrent Doc Receipt </h3></td>
    </tr>
    <tr>
      <td>
      <h3> View Doc Description</h3>
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
          <%String aa = "odd"; %>
            <tr class=<%=aa%> >
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docCode" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
            <tr class=<%=aa%> >
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docDesc" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
<%-- 
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docRef" /></td>
            </tr>
--%>
            <tr class=<%=aa%> >
              <td class="fieldname">Doc Date</td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docDate" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
<%--
           <%
				if(isPolicy!=null && isPolicy.equals("true"))
				{
	
			%>
			<tr class="odd">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docEffDate" /></td>
            </tr>
            
            <%
       			 }
       		%>
--%>
            <tr class=<%=aa%> >
              <td class="fieldname"><%=lableDocDate%></td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docExpDate" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="identifyDate" /></td>
            </tr>
--%>
            <%
                boolean isdeferred = false;
              if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFERRED)  ||
                      itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL) ||
                      itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFER_REQ) ||
                      itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFER_REQ)) {
                  isdeferred = true;
            %>
            <tr class=<%=aa%> >
              <td class="fieldname">Date Deferred</td>
              <td>&nbsp;
                <bean:write name="RecurrentDocReceiptForm" property="deferDate" />
              </td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
            <tr class=<%=aa%> >
	            <td class="fieldname">Next Due Date&nbsp;</td>
	            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="expectedReturnDate"/>
	            </td>
	            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
	        </tr>
	         <tr class=<%=aa%>>
              <td class="fieldname">Defer Counter</td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="deferCount"/> &nbsp;
               
              </td>
            </tr>
            <tr class=<%=aa%>>
              <td class="fieldname">Defered Days</td>
              <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="deferedDays"/> &nbsp;
               
              </td>
            </tr>
              <% } %>
              <% 	boolean isWaiver = false;
		        if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVED) ||
		        		itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER) ||
		        		itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVER_REQ) ||
		        		itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER_REQ )){
		        	
		        	isWaiver = true;
		        }	
		        %>
		        <%if(isWaiver){ %>
		        	 <tr class=<%=aa%> >
		            <td class="fieldname">Date Waived</td>
		            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="waivedDate"/>
		            </td>
		            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
		        </tr>
		        	
		        <%} %>
		        
		         <% boolean isComplete = false;
			        if (itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_COMPLETED)||
			        	itemOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_COMPLETE))
			        {
			        	isComplete = true; 	
		        }	
		        %>
		        <%if(isComplete){ %>
		        	 <tr class=<%=aa%> >
		            <td class="fieldname" >Date Completed </td>
		            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="completedDate"/>
		            </td>
		            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
		        </tr>
		        	
		        <%} %>
		        <% boolean received = false;
			        if (itemOb.getItemStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED)||
			        		itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED))
			        		{
			        	received = true; 	
		        }	
		        %>
		        <%if(received){ %>
		        	 <tr class=<%=aa%> >
		            <td class="fieldname">Date Received </td>
		            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="receivedDate"/>
		            </td>
		            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
		        </tr>	
		        <%} %>
		         <% boolean isLodged = false;
			        if (itemOb.getItemStatus().equals(ICMSConstant.ACTION_ITEM_PENDING_LODGE)||
			        		itemOb.getItemStatus().equals(ICMSConstant.STATE_LODGED)){
			        	isLodged = true; 	
		        }	
		        %>
		        <%if(isLodged){ %>
		        	 <tr class=<%=aa%> >
		            <td class= "fieldname">Date Lodged</td>
		            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="lodgedDate"/>
		            </td>
		            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
		        </tr>
        	
        <%} %>
        <% boolean tempUpliftedDate = false;
	        if (itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)||
	        		itemOb.getItemStatus().equals(ICMSConstant.STATE_TEMP_UPLIFTED))
	        		{
	        	tempUpliftedDate = true; 	
	        }	
	        %>
	        <%if(tempUpliftedDate){ %>
	        	 <tr class=<%=aa%> >
	            <td class="fieldname">Date Temp Uplifted
	            </td><td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="tempUpliftedDate"/>
	            </td>
	            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
	        </tr>	
	        <tr class=<%=aa%> >
	            <td class="fieldname">Date Expected Return
	            </td>
	            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="expectedReturnDate"/></td>
	            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
       		 </tr>
	        <%} %>
	        <% boolean permUpliftedDate = false;
	        if (itemOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)||
	        	itemOb.getItemStatus().equals(ICMSConstant.STATE_PERM_UPLIFTED))
	        		{
	        	permUpliftedDate = true; 	
		        }	
		        %>
		        <%if(permUpliftedDate){ %>
		        	 <tr class=<%=aa%> >
		            <td class="fieldname">Date Perm Uplifted
		            </td>
		            <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="permUpliftedDate"/> </td>
		            <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
		        </tr>
		        	
		        <%} %>
            
            <tr class="even">
              <td class="fieldname"><bean:message key="label.tagged.image.name"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=taggedFileNames%>"/> </td>
            </tr>
            
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.untagged.image.name"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=unTaggedFileNames%>"/></td>
            </tr>  

            <tr class="odd" >
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
<%--
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
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
           <tbody>
                <tr class=<%=(bb++%2!=0)?"even":"odd"%> >
              <td class="fieldname">Remarks</td>
              <td>
                   <% RecurrentDocReceiptForm aForm = (RecurrentDocReceiptForm)request.getAttribute("RecurrentDocReceiptForm"); %>
                    <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;
              </td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
           </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
             <%   if (previous != null && previous.equals("view")) { %>
                <td align="center" valign="middle"><a href="#" onclick="returnPage(0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
             <% } else { %>
                <td align="center" valign="middle"><a href="#" onclick="returnPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
             <% } %>
              </tr>
        </table>
        </td>
    </tr>
  </tbody>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
