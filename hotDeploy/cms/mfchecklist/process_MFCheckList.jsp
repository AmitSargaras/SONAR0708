<%@ page import="com.integrosys.cms.ui.mfchecklist.MFCheckListForm,
                 com.integrosys.cms.ui.mfchecklist.MFCheckListAction,
                 java.util.Collection,
                 java.util.Arrays,
                 java.util.Iterator,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.GlobalAccessControlCommand"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
 <head>

  <title>Marketability Factor Input</title>

  


  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
  
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">
   <!--
     function performApprove()
     {
		document.forms[0].event.value = "checker_approve_mfchecklist";
        document.forms[0].submit();
     }

     function performReject()
     {
		document.forms[0].event.value = "checker_reject_mfchecklist";
        document.forms[0].submit();
     } 
     --> 
   </script>
   <html:form action="MarketabilityFactor.do">	
    <input type="hidden" name="event" value="" />   

	
    <html:hidden property="MFTemplateID"/>
	
	<bean:define id="itrxValue" name="com.integrosys.cms.ui.mfchecklist.MFCheckListAction.MFChecklistTrxObj" type="com.integrosys.cms.app.collateral.trx.marketfactor.IMFChecklistTrxValue" scope="session"/>
	
   <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
      	  <td width="88%"> <h3><bean:message key="title.mfchecklist.detail"/></h3></td>
          <td width="12%" style="text-align:right">&nbsp;
          </td>
    	</tr>
    	<tr>
      	  <td colspan="2"> <hr/> </td>
    	</tr>
      </thead>
      <%@ include file="read_MFCheckList.jsp" %>
      <tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>
    
      <tr>
    	<table width="98" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>		
        		<tr>
            		<td class="fieldname"><bean:message key="label.remarks"/></td>
            		<td class="odd">
						<html:textarea property="remarks" rows="3" cols="110"/>&nbsp;
						<html:errors property="remarks"/>
             		</td>
        		</tr>
        		<tr>
             		<td class="fieldname"><bean:message key="label.last.action.by"/></td>
             		<td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
        		</tr>
        		<tr class="odd">
             		<td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
             		<td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
        		</tr>
        	</tbody>
        </table>
      </tr>
    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td> 
      </tr>
      <tr>
        <td><a href ="javascript:performApprove()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <td><a href ="javascript:performReject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
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