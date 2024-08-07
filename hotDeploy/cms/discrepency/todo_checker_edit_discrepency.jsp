<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.*,
				 java.util.*,
				 org.apache.commons.lang.StringUtils,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.util.DateUtil
                " %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
DiscrepencyForm form = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
IDiscrepencyTrxValue discrepencyTrxValue= (IDiscrepencyTrxValue)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}
List selectedList = (List) request.getAttribute("selectedList");
System.out.println("form"+form);
System.out.println("discrepencyTrxValue"+discrepencyTrxValue);
//System.out.println("allCreditApproverList"+allCreditApproverList);
System.out.println("selectedList"+selectedList);
String docStatus="";

String submitEvent = "checker_approve_discrepency";

String rejectEvent = "checker_reject_discrepency";

IDiscrepency discrepency= null;

if(discrepencyTrxValue.getActualDiscrepency()!=null){
	discrepency=discrepencyTrxValue.getActualDiscrepency();
	}else{
		discrepency=discrepencyTrxValue.getStagingDiscrepency();
	}




String checkDiscrepency = discrepency.getDiscrepencyType();
String append = "";

IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
	if(discrepency.getFacilityList()!=null){
		
	 discrepencyFacilityLists=discrepency.getFacilityList();
	 System.out.println("discrepencyFacilityLists:::::::"+discrepencyFacilityLists);
}
	
	docStatus=discrepencyTrxValue.getStagingDiscrepency().getStatus();
System.out.println("docStatus:::::::::::::::::::::::::::3:::::::::::::"+docStatus);
%>


<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepency"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    <script language="JavaScript" src="js/validation.js"></script>

    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

      
        function approvePage() {
        	
            document.forms[0].action="Discrepency.do?event=<%=submitEvent%>";
            document.forms[0].submit();
        }
        function rejectPage() {
            document.forms[0].action="Discrepency.do?event=<%=rejectEvent%>";
            document.forms[0].submit();
        }
        function cancelPage(){
            document.forms[0].action="ToDo.do?event=prepare";
            document.forms[0].submit();
        }

       

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/calendarb.gif','img/cancel2.gif')">

<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>


<%
   
    
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
	

	
	
	
%>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3> Discrepancy Doc  </h3></td>
        </tr>
        
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname">Type of Discrepency</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="discrepencyType"/></td>
                    </tr>
                     <% if( checkDiscrepency.equals("Facility") ) { %>
		                        		<tr class="even" id="mutlipleSelect">
											<td class="fieldname" >Facility</td>
											<td class="even"  >
											<%
											if(discrepencyFacilityLists!=null){
											for(int i=0;i<discrepencyFacilityLists.length;i++){
											%>
											<%=discrepencyFacilityLists[i].getFacilityName() %></br>
											<%}
											}%>
			                            	</td>
		                        		</tr>
		                        		<%}%>
                    <tr class="even">
                        <td class="fieldname">Critical</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="critical"/></td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Discrepency</td>
                        <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=form.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    </tr>
            
						<tr class="even">
                        <td class="fieldname">Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getCreationDate() %>" /></td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Approved Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getAcceptedDate() %>" />
								            </td>
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getOriginalTargetDate() %>" />
								            </td>
											
										</tr>
										
										<tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getNextDueDate() %>" />
								            </td>
											

										</tr>
                    <tr class="even">
                        <td class="fieldname">Date Closed&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getRecDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Waived&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getWaiveDate() %>" /></td>
                    </tr>
                      <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;</td>
                         <td>&nbsp;<integro:date object="<%=discrepencyTrxValue.getStagingDiscrepency().getDeferDate() %>" /></td>
                    </tr>
                     <tr class="even">
											<td class="fieldname" >Defer Counter</td>
											<td class="even" >
											&nbsp;
											<bean:write property="counter"  name="DiscrepencyForm" />
								            </td>
											

										</tr>
                       <tr class="even">
                        <td class="fieldname">Document Status&nbsp;</td>
                         <td>
                         <%
                         String statusDoc="";
                         System.out.println("");
                         if(docStatus.equals("PENDING_CLOSE")){
                        	 statusDoc="CLOSED";
                         %>
                         
                         
                        	 <html:hidden property="status" value="CLOSE"/>
                      <%   }else if(docStatus.equals("PENDING_WAIVE")){
                        	 statusDoc="WAIVED";
                         %>
                        
                         
                    	 <html:hidden property="status" value="WAIVED"/>
                  <%   }else if(docStatus.equals("PENDING_DEFER")){
                        	 statusDoc="DEFERED";
                         %>
                       
                         
                    	 <html:hidden property="status" value="DEFERED"/>
                  <%   }else{
                         %>
                          <html:hidden property="status"/>  
                         <%} %>
                         <%=statusDoc %>
                         &nbsp;</td>
                            
                    </tr>
                   <tr class="odd">
                        <td class="fieldname">Approved By</td>
                        <td><%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(form.getApprovedBy())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%>&nbsp;
                        </td>
                    </tr>
 
                  
                   <tr class="odd">
                        <td class="fieldname">Credit Approver</td>
                        <td><%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(form.getCreditApprover())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }%>&nbsp;
                        </td>
                    </tr>

                </tbody>
            </table>

                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                    <tr class="odd">
                            <td class="fieldname">Creation Remarks</td>
                            
                            <td><integro:empty-if-null value="<%=discrepencyTrxValue.getStagingDiscrepency().getDiscrepencyRemark()%>"/>&nbsp;</td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td>
                            
                            <%if(discrepencyTrxValue.getActualDiscrepency()!=null){ %>
                            <integro:empty-if-null value="<%=discrepencyTrxValue.getStagingDiscrepency().getDocRemarks()%>"/>&nbsp;</td>
                            <%} %>
                           
                        </tr>
                     
         <html:hidden property="id"/>
         <html:hidden property="customerId"/>
         <html:hidden property="discrepencyType"/>
         <html:hidden property="discrepencyId"/>
         <html:hidden property="creationDate"/>
         <html:hidden property="acceptedDate"/>
         <html:hidden property="originalTargetDate"/>
         <html:hidden property="nextDueDate"/>
         <html:hidden property="critical"/>
         <html:hidden property="approvedBy"/>
         <html:hidden property="counter"/>
         <html:hidden property="discrepency"/>
         <html:hidden property="discrepencyRemark"/>  
         <html:hidden property="docRemarks"/>   
         <html:hidden property="recDate"/>   
         <html:hidden property="deferDate"/>   
         <html:hidden property="waiveDate"/>
         <html:hidden property="creditApprover"/>  
                         <html:hidden name="DiscrepencyForm" property="selectedFacilityList" value="<%=append%>"/>  
                    </tbody>
                    
                </table>
                <tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></br><html:errors property="remarkError"/></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=discrepencyTrxValue.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=discrepencyTrxValue.getRemarks() != null
						? discrepencyTrxValue.getRemarks()
						: ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
               <table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
			
				<tr>


					 <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
                    <%-- End here for cr-17 --%>
            </td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
