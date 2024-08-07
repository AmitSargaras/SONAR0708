<%@ page import="com.integrosys.cms.ui.checklist.paripassuupdate.*,
				java.util.*,
				 org.apache.struts.util.LabelValueBean" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    UpdatePariPassuCheckListForm aForm = (UpdatePariPassuCheckListForm) request.getAttribute("UpdatePariPassuCheckListForm");
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.allCreditApproverList");
    
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    <script language="JavaScript">
     <!--
        function saveForm() {
            document.forms["UpdatePariPassuCheckListForm"].event.value = "view_ok";
            document.forms["UpdatePariPassuCheckListForm"].submit();
        }
     -->
    </script>

    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="UpdatePariPassuCheckListAction">

    <html:hidden property="event"/>

    <html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="actionTypeName"/>
    <html:hidden property="index"/>
    <html:hidden property="deferDate"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Update Constitutional/Contractual Doc Receipt </h3></td>
    </tr>
    <tr>
        <td>
            <h3> View Doc Description - Pending Deferred</h3>
        </td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname">Branch Name</td>
                        <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docCode"/></td>
                    </tr>
<!--                    <tr class="even">-->
<!--                        <td class="fieldname">Doc No</td>-->
<!--                        <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docNo"/></td>-->
<!--                    </tr>-->
                    <tr class="odd">
                        <td class="fieldname">Bank name</td>
                        <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docDesc"/></td>
                    </tr>

		            <tr class="odd">
		              <td class="fieldname">Doc Due Date</td>
		              <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docEffDate" /></td>
		            </tr>
		            <tr class="even">
		              <td class="fieldname">Doc Expiry Date</td>
		              <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docExpDate" /></td>
		            </tr>

                    <tr class="odd">
                        <td class="fieldname">Date Deferred&nbsp;<font color="#0000FF">* </font></td>
                        <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="deferDate"/></td>
                    </tr>
                    
                        <%-- // cr 36 --%>
                    <tr class="even">
                        <td class="fieldname">Next Due Date</td>
                        <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="expectedReturnDate"/></td>
                    </tr>
            		<tr class="odd">
              			<td class="fieldname">Defer Counter</td>
              			<td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="deferCount" /></td>
            		</tr>
                        <tr class="odd">
              				<td class="fieldname">Defered Days</td>
              				<td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="deferedDays" /></td>
           				 </tr>                    
                    <tr class="odd">
                        <td class="fieldname">Credit Approver</td>
                        <td>&nbsp;           <%
           if(allCreditApproverList!=null){
        	for(int a=0; a<allCreditApproverList.size();a++){   
           LabelValueBean bean=(LabelValueBean) allCreditApproverList.get(a);
           if(bean.getValue()!=null){
          	 if(bean.getValue().trim().equals(aForm.getCreditApprover())){
          		
          	%>	 
          		 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          	<% 
          	 }
          	 }          
        	}
        	} %> </td>
                    </tr>

                </tbody>
            </table>
   <%--         <jsp:include page="/checklist/ccreceipt/ViewShareCheckList.jsp"/>  --%>
            <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                    <tr class="even">
                        <td class="fieldname">Remarks</td>
                        <td>
                            <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80"/>&nbsp;
                        </td>
                    </tr>
                </tbody>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" valign="middle">
                        <a href="#" onClick="saveForm()">
                            <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a>
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
<!-- InstanceEnd -->
</html>
