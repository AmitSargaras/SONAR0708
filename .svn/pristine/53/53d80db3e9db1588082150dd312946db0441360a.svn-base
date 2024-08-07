<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
//Start:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
boolean allowToDeleteFacility=(Boolean)request.getAttribute("allowToDeleteFacility");
System.out.println("allowToDeleteFacility:"+allowToDeleteFacility);
//End:Uma Khot:Don't Delete the facility if facility doc pending in case creation.

//Uma:Don't Delete the facility if facility doc pending in facility checklist.
boolean facilityChklistDocPending=(Boolean)request.getAttribute("facilityChklistDocPending");
System.out.println("facilityChklistDocPending:"+facilityChklistDocPending);


boolean pendingPropertySecCount=(Boolean)request.getAttribute("pendingPropertySecCount");
System.out.println("pendingPropertySecCount:"+pendingPropertySecCount);

boolean checklistIsActive=(Boolean)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.checklistIsActive");
System.out.println("checklistIsActive:"+checklistIsActive);


ILimitTrxValue lmtTrxObj1 =(ILimitTrxValue)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
 ILimitSysXRef[] limitSysXRefs =null;
 boolean checkAmount=false;
 if(null!=lmtTrxObj1){
	 if(lmtTrxObj1.getLimit() != null && lmtTrxObj1.getLimit().getLimitSysXRefs()!=null) {
			limitSysXRefs = lmtTrxObj1.getLimit().getLimitSysXRefs();
			for (int i = 0; i < limitSysXRefs.length; i++) {
				ILimitSysXRef iLimitSysXRef = limitSysXRefs[i];
				
				System.out.println(">>>>>>>Utilized amount:["+i+"]"+iLimitSysXRef.getCustomerSysXRef().getUtilizedAmount());
				System.out.println(">>>>>>>Release amount:["+i+"]"+iLimitSysXRef.getCustomerSysXRef().getReleasedAmount());
				
				BigDecimal utilizedAmount=new BigDecimal(iLimitSysXRef.getCustomerSysXRef().getUtilizedAmount());
				BigDecimal releasedAmount=new BigDecimal(iLimitSysXRef.getCustomerSysXRef().getReleasedAmount());
				if(utilizedAmount.compareTo(releasedAmount)>=1){
					checkAmount=true;
					break;
				}
			}
			System.out.println("<<<<<checkAmount>>>>>: "+checkAmount);
		}
 }


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
     function approveLmt(allowToDeleteFacility,facilityChklistDocPending,pendingPropertySecCount,checklistIsActive)
     {

    	<%if(checkAmount){%> 
    		var answer5=  confirm("Outstanding of some of the line is more than its respective limit, do you still want to authorize?");
			if(answer5 == true){
				if(allowToDeleteFacility=='true' && facilityChklistDocPending=='false'){
			        document.forms[0].event.value = 'approve';
			        document.forms[0].submit();
			    }
			    //Start:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
			    else{
			        if(facilityChklistDocPending=='true' && allowToDeleteFacility=='false'){
			        	alert("Facility cannot be deleted as it's documents are pending in case creation and facility checklist.");
			        }else if (facilityChklistDocPending=='true'){
			        	alert("Facility cannot be deleted as it's documents are pending in facility checklist.");		 
			        }else{
			        	alert("Facility cannot be deleted as it's documents are pending in case creation.");
			        }
			    }
			    //End:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
			}	
    	<%}else{%>
    		if(allowToDeleteFacility=='true' && facilityChklistDocPending=='false'){
            	document.forms[0].event.value = 'approve';
            	document.forms[0].submit();
             	}
           		//Start:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
        	 	else{
            	 	if(facilityChklistDocPending=='true' && allowToDeleteFacility=='false'){
            		 	alert("Facility cannot be deleted as it's documents are pending in case creation and facility checklist.");
            	 	}else if (facilityChklistDocPending=='true'){
            		 	alert("Facility cannot be deleted as it's documents are pending in facility checklist.");		 
            	 	}else{
            	 		alert("Facility cannot be deleted as it's documents are pending in case creation.");
            	 	}
        	 	}
        		//End:Uma Khot:Don't Delete the facility if facility doc pending in case creation.
    	<%}%>
    }


    function rejectLmt()
    {
		document.forms[0].event.value = 'reject';
        document.forms[0].submit();
    } 

   </script>
   <html:form action="MILimit.do">	
    <input type="hidden" name="event" value="process" />
    <html:hidden property="isDelete"/>	
    <html:hidden property="limitProfileID"/>
	<html:hidden property="customerID"/>	
    <html:hidden property="limitId"/>
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj"  type="com.integrosys.cms.app.limit.trx.ILimitTrxValue" scope="session"/>		
    <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
     <html:errors property="facDocError"/>
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
      <tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>		
      <tr>
        <td>
	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
              <tr>
                <td class="fieldname">Remarks</td>
                <td class="odd">
		  <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
                 </br> <html:errors property="limitRemarksError"/>
                </td>
              </tr>
              <tr>
                <td class="fieldname">Last Action By</td>
               	<td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
              </tr>
              <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
              </tr>
            </tbody>
          </table>
	</td>
      </tr>	    
    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td> 
      </tr>
      <tr>
        <td><a href ="javascript:approveLmt('<%=allowToDeleteFacility%>','<%=facilityChklistDocPending %>','<%=pendingPropertySecCount %>','<%=checklistIsActive %>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <td><a href ="javascript:rejectLmt()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
        <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </html:form>
 </body>