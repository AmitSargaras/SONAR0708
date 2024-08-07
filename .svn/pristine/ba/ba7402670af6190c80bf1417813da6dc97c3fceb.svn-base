<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue" %>
                 
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%ILimitTrxValue lmtTrxObj1=(ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");

//Start:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
boolean allowToDeleteFacility=(Boolean)request.getAttribute("allowToDeleteFacility");
System.out.println("allowToDeleteFacility:"+allowToDeleteFacility);
//End:Uma Khot:Don't Delete the facility if facility doc pending in case creation.

//Uma:Don't Delete the facility if facility doc pending in facility checklist.
boolean facilityChklistDocPending=(Boolean)request.getAttribute("facilityChklistDocPending");
System.out.println("facilityChklistDocPending:"+facilityChklistDocPending);


boolean isCollDeletedFlag=(Boolean)request.getAttribute("isCollDeletedFlag");
System.out.println("isCollDeletedFlag:"+isCollDeletedFlag);

Boolean checkFacilityDocumentsIsPendingReceived = (Boolean)request.getAttribute("checkFacilityDocumentsIsPendingReceived");
System.out.println("checkFacilityDocumentsIsPendingReceived:"+checkFacilityDocumentsIsPendingReceived);

Boolean checkFacilityDocumentsIsReceived = (Boolean)request.getAttribute("checkFacilityDocumentsIsReceived");
System.out.println("checkFacilityDocumentsIsReceived:"+checkFacilityDocumentsIsReceived);

%>
<html>
 <head>
  <!-- InstanceBeginEditable name="doctitle" -->
  <title>Untitled Document</title>
  <!-- InstanceEndEditable -->
  
  <!-- InstanceBeginEditable name="CssStyle" -->
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
  <!-- InstanceEndEditable -->
  <!-- InstanceBeginEditable name="head" -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">
   function deleteLimit(allowToDeleteFacility ,facilityChklistDocPending,checkFacilityDocumentsIsPendingReceived,checkFacilityDocumentsIsReceived,isCollDeletedFlag)    
     {
        //Start:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
        if(allowToDeleteFacility=='true' && facilityChklistDocPending=='false' && checkFacilityDocumentsIsPendingReceived=='false' && checkFacilityDocumentsIsReceived=='false'){
        	document.forms[0].event.value = 'delete';
        	document.forms[0].submit();
        }else{
	         if(checkFacilityDocumentsIsPendingReceived!=null && checkFacilityDocumentsIsPendingReceived=='true'){
	    	 	alert("Facility cannot be deleted since one or more facility or its security documents are pending for approval in customer checklist.");
	    	 }else if(checkFacilityDocumentsIsReceived!=null && checkFacilityDocumentsIsReceived=='true'){
	    		 if(allowToDeleteFacility=='true'){
		    	 	var flag = confirm("Facility cannot be deleted since one or more facility or its security documents have been received in customer checklist.\nDo you want to delete the record? ");
	    	 	if (flag==true){
	    	 		document.forms[0].event.value = 'delete';
        			document.forms[0].submit();
	    	 	}
	    		 }else{                                                                                          
	    				alert("Facility cannot be deleted as Collateral Linkage is Active.");
	    		 }
	    	 }else{
	        	 if(facilityChklistDocPending=='true' && allowToDeleteFacility=='false'){
	        		alert("Facility cannot be deleted as it's documents are pending in case creation and facility checklist.");
	        	 }else if (facilityChklistDocPending=='true'){
	        		alert("Facility cannot be deleted as it's documents are pending in facility checklist.");		 
	        	 }else if (isCollDeletedFlag=='false'){
		        		alert("Facility cannot be deleted as Collateral Linkage is Active.");
		        	 }else{
	        	 	alert("Facility cannot be deleted as it's documents are pending in case creation.");
	        	 }
        	 }
    	}
    	//End:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
     }

     function backToLimitList()
     {
    	 var custID = document.forms[0].customerID.value;
    	 var limitProfileID = document.forms[0].limitProfileID.value;
		document.location.href = 'MILimitList.do?event=list_limit&limitProfileID=' + limitProfileID + '&source=manualinput' + "&customerID=" +custID;
     }
   </script>
   <html:form action="MILimit.do">
    <input type="hidden" name="event" />
  <%
String actionStr1 = "com.integrosys.cms.ui.manualinput.limit.LmtDetailAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
    <input type="hidden" name="lmtId" value="<%=request.getAttribute("lmtId") %>"/>
    <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <table align="right" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
      <thead>
    	<tr>
      	  <td>&nbsp;</td>
          <td>&nbsp;</td>
    	</tr>
    	<tr>
          <td>&nbsp;</td>
          <td style="text-align:right">&nbsp;</td>
    	</tr>
    	<tr>
      	  <td width="88%"> <h3><bean:message key="title.facility.details"/></h3></td>
          <td width="12%" style="text-align:right">&nbsp;
          </td>
    	</tr>
    	<tr>
      	  <td colspan="2"> <hr/> </td>
    	</tr>
      </thead>
      <%@ include file="milimit_read_helper.jsp" %>    
       <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr> 
      <tr>
        <td> <jsp:include page="view_audit_details.jsp"></jsp:include></td>
      </tr> 
    </table>
    
    <%if(!lmtTrxObj1.getStatus().equals("ACTIVE")) {
    String remarks="-";
    if(!lmtTrxObj1.getRemarks().equals("")&&lmtTrxObj1.getRemarks()!=null){
    	remarks=lmtTrxObj1.getRemarks();
    }%>
     <table width="98%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td width="43%" class="fieldname">Remarks</td>
							<td width="57%" class="odd"><textarea name="remarks"
								rows="4" style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=lmtTrxObj1.getUserInfo() %>
							&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td class="even"><%=remarks%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
   <%} %>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
	<td><a href="javascript:deleteLimit('<%=allowToDeleteFacility%>','<%=facilityChklistDocPending %>','<%=checkFacilityDocumentsIsPendingReceived %>','<%=checkFacilityDocumentsIsReceived %>','<%=isCollDeletedFlag %>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>
	
	<%if(!lmtTrxObj1.getStatus().equals("ACTIVE")) {%>
	<td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
	<%}else{ %>
           <td><a href="javascript:backToLimitList()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
           <%} %>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </html:form>
 </body>