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
String event=(String)request.getAttribute("event");
String customerID=(String)request.getAttribute("customerID");
List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");
IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}
String checkDiscrepency =null;
OBDiscrepency actualDisc=new OBDiscrepency();
System.out.println("discrepencyTrx.getActualDiscrepency():1111111111111111111111111111111111111"+event);
IDiscrepencyTrxValue discrepencyTrx = (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
if("prepare_maker_edit_discrepency".equals(event)){


actualDisc=(OBDiscrepency)discrepencyTrx.getActualDiscrepency();
checkDiscrepency = discrepencyTrx.getActualDiscrepency().getDiscrepencyType();

//for(int i=0;i<selectedList.size();i++)
	
	if(discrepencyTrx.getActualDiscrepency()!=null){
		if(discrepencyTrx.getActualDiscrepency().getFacilityList()!=null){
		 discrepencyFacilityLists=discrepencyTrx.getActualDiscrepency().getFacilityList();
		}
	}
}
OBDiscrepency sessionDisc=new OBDiscrepency();
if("prepare_maker_edit_reject_discrepency".equals(event)){
	//String checkDiscrepency =null;
	OBDiscrepency objDisc=(OBDiscrepency)request.getAttribute("discrepencyObj");
	sessionDisc=objDisc;
	checkDiscrepency=objDisc.getDiscrepencyType();
	//IDiscrepencyFacilityList[] discrepencyFacilityLists=null;
	if(objDisc!=null){
		if(objDisc.getFacilityList()!=null){
		 discrepencyFacilityLists=objDisc.getFacilityList();
		}
	}
	
}
System.out.println("discrepencyTrx.getActualDiscrepency():111111111111111122222222222222111111111111111111111"+event);
%>
<%
String startIndex=(String) request.getAttribute("startIndex");
int startIndex1 = 0;
String ind = (String) request.getAttribute("startIndex");
if (ind != null && (!ind.equals("")))
	startIndex1 = Integer.parseInt(ind);


String actionStr1 = "com.integrosys.cms.ui.discrepency.DiscrepencyAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<%
String cancelEvent=null;

if("prepare_maker_edit_reject_discrepency".equals(event)||"maker_next_list_discrepency".equals(event)){
	cancelEvent = "maker_process_search_discrepency";
	
}
else{
	cancelEvent ="return_list_discrepency";
	
}
String searchstatus= (String) request.getAttribute("searchstatus");
String discType= (String) request.getAttribute("discType");

if(searchstatus==null){
	searchstatus="Please";
}
if(discType==null){
	discType="Please";
}



%>
<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.OBDiscrepency"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
        var myEvent="prepare_maker_edit_reject_discrepency";
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

        function saveForm() {
            
            document.forms["DiscrepencyForm"].action = "Discrepency.do?event=maker_edit_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType%>&startIndex=<%=startIndex%>";
            document.forms["DiscrepencyForm"].submit();
        }

 	function saveForm1() {
 		
            document.forms["DiscrepencyForm"].action = "Discrepency.do?event=maker_submit_update_discrepancy&customerID=<%=customerID%>&searchstatus=<%=searchstatus%>&discType=<%=discType%>&startIndex=<%=startIndex%>";
            document.forms["DiscrepencyForm"].submit();
        }
		
        function cancelForm() {
        	
            document.forms["DiscrepencyForm"].action = "Discrepency.do?event=return_list_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType %>&startIndex=<%=startIndex%>";
            document.forms["DiscrepencyForm"].submit();
           
        }
        function cancelForm1() {
        	
            document.forms["DiscrepencyForm"].action = "Discrepency.do?event=maker_return_process_list_discrepency&searchstatus=<%=searchstatus%>&discType=<%=discType %>&startIndex=<%=startIndex%>&customerID=<%=customerID%>";
            document.forms["DiscrepencyForm"].submit();
           
        }

        function verifyDocEffDateChanged() {
            if (document.forms["DiscrepencyForm"].isPolicy.value == "true") {
                if (document.forms["DiscrepencyForm"].docEffDate.value != document.forms["DiscrepencyForm"].docOldEffDate.value) {
                    document.forms["DiscrepencyForm"].isEffDateChanged.value = "true";
                }
            }
        }

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/calendarb.gif','img/cancel2.gif')">

<html:form action="Discrepency">

    <!--Hidden variables-->
    <html:hidden property="event"/>
    <html:hidden property="startIndex" />


<%
   
    
    DiscrepencyForm aForm = (DiscrepencyForm)request.getAttribute("DiscrepencyForm");
	

	
	
	
%>
<p class="required"><font color="red">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3>Update Discrepancy Doc  </h3></td>
        </tr>
        
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>	<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tblInput">
									<thead>
									</thead>
									<tbody>
									
                        
                   
								<tr class="odd" >
								<td class="fieldname">Discrepancy Id</td>
                        <td class="even">&nbsp;
                        
                       <%
								
								String disId="-";
                       System.out.println("discrepencyTrx.getActualDiscrepency():"+discrepencyTrx);
							if(discrepencyTrx.getActualDiscrepency()!=null){
								disId=String.valueOf(discrepencyTrx.getActualDiscrepency().getId());
							}
								%>
								<%=disId %> &nbsp;	
                        
                        </td>
                        <td class="fieldname" >Type of Discrepancy</td>
                        <td class="even">&nbsp;<bean:write name="DiscrepencyForm" property="discrepencyType"/></td>
                       
                    </tr>
                      <% if( checkDiscrepency.equals("Facility") ) { %>
		                        		<tr class="even" >
											<td class="fieldname" >Facility</td>
											<td class="even" >
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
		                        		
										<tr class="odd">
											<td class="fieldname" width="20%">Creation Date<font color="red">*</font></td>
											<td class="even" width="30%">
											
											<html:text property="creationDate" name="DiscrepencyForm" readonly="true"/>
								            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('creationDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp;
									        <br/><html:errors property="creationDateError"/>
											</td>

											<td class="fieldname" width="30%">Approved Date</td>
											<td class="even" width="40%">
											
											<html:text property="acceptedDate"  name="DiscrepencyForm" readonly="true"/>
								            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('acceptedDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; 
											<br/><html:errors property="acceptedDateError"/></td>
										</tr>
										<tr class="even">
											<td class="fieldname" width="20%">Original Target Date<font color="red">*</font></td>
											<td class="even" width="20%">
											
											<html:text property="originalTargetDate"  name="DiscrepencyForm" readonly="true"/>
								            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('originalTargetDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; 
											<br/><html:errors property="originalTargetDateError"/></td>
											
											<td class="fieldname" width="20%">Next Due Date</td>
											<td class="even" width="20%">
											
											<html:text property="nextDueDate"  name="DiscrepencyForm" readonly="true"/>
								            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
									             onclick="showCalendar('nextDueDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>&nbsp; 
											<br/><html:errors property="nextDueDateError"/></td>
											

										</tr>
										<tr class="odd">
										<td class="fieldname" width="20%">Critical</td>
										<%if("prepare_maker_edit_reject_discrepency".equals(event)){
										if(sessionDisc.getCritical().equals("Yes")){ %>
											<td class="even" width="20%" >Yes
	                          				<input type="radio" name="critical" id="radio3" value="Yes" checked="checked">
	                          				 No
			                            <input type="radio" name="critical" id="radio4" value="No" ></td>
	                          				<%}else if(sessionDisc.getCritical().equals("No")){ %>
	                          				<td class="even" width="20%" >Yes
	                          				<input type="radio" name="critical" id="radio3" value="Yes" >
				                            No
			                            <input type="radio" name="critical" id="radio4" value="No" checked="checked"></td>
			                            <%} } else{
			                            if(actualDisc.getCritical().equals("Yes")){%>
													<td class="even" width="20%" >Yes
	                          				<input type="radio" name="critical" id="radio3" value="Yes" checked="checked">
				                            No
			                            <input type="radio" name="critical" id="radio4" value="No">	</td>	                            
			                            <%}else if(actualDisc.getCritical().equals("No")){ %>
			                            					<td class="even" width="20%" >Yes
	                          				<input type="radio" name="critical" id="radio3" value="Yes" >
				                            No
			                            <input type="radio" name="critical" id="radio4" value="No" checked="checked">
											<%}} 
											%>			                            
											<br/><html:errors property="criticalError"/></td>
											 
											<td class="fieldname" width="20%">Credit Approver<font color="red">*</font></td>
											<td class="even" width="20%">
											<html:select property="approvedBy" name="DiscrepencyForm" >
											<option value="">Please Select</option>
											<html:options collection="allCreditApproverList" labelProperty="label" property="value" />
											</html:select>
											
											<br/><html:errors property="approvedByError"/></td>
										</tr>
										
										<tr class="even">
											<td class="fieldname" width="20%">Discrepancy<font color="red">*</font></td>
											<td class="even" width="20%" colspan="3">
											<html:select property ="discrepency" name="DiscrepencyForm" >
												<integro:common-code categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>"  descWithCode="false"/>
											</html:select>											
											<br/><html:errors property="discrepencyError"/></td>
											<!--<td class="fieldname" width="20%">Discrepency Counter</td>
											<td class="even" width="20%"><bean:write name="DiscrepencyForm" property="counter"/>
											</td>
											
										--></tr>
										
										<tr>
										<td class="fieldname">Creation Remarks<font color="red">*</font></td>
										<td class="even" colspan="3">
										<html:textarea property="discrepencyRemark" rows="6" cols="120"/>
										<br/><html:errors property="discrepencyRemarkError"/></td>
									</tr>
									
									<tr>
                         			   <td class="fieldname">Remarks</td>
                            			<td class="even" colspan="3"><html:textarea name="DiscrepencyForm" rows="6" cols="120" property="docRemarks"
                                               onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks"/></td>
                       				 </tr>
									<%if("prepare_maker_edit_reject_discrepency".equals(event)){
										String status=form.getStatus();
										%>
										 <html:hidden property="status" value="<%=status %>"/>
										  
										 <%}else{ %>  
										 <html:hidden property="status" value="PENDING_UPDATE"/>
										 <%} %>  
										  <html:hidden property="id"/>
         <html:hidden property="customerId"/>
         <html:hidden property="discrepencyType"/>
         <html:hidden property="facilityList"/>
         <html:hidden property="discrepencyId"/>
         <html:hidden property="selectedFacilityList"/>
         <html:hidden property="hiddenList"/>
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
									</tbody>
								</table>

                             
                       
                     
        
                 
                 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>  
                        <%if(!"prepare_maker_edit_reject_discrepency".equals(event)){ %>   
 <jsp:include page="view_audit_details.jsp"></jsp:include><%} %>
</td>
                    </tr>
                     </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                        <%if("prepare_maker_edit_reject_discrepency".equals(event)){ %>
                            <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveForm1()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                                <a href="#" onclick="cancelForm1()" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4" border="0" id="Image4"/></a>
                                <%}else{ %>
                                 <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveForm()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                                <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4" border="0" id="Image4"/></a>
                                <%} %>
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
