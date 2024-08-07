<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%
	InsuranceCoverageForm insuranceCoverageForm = (InsuranceCoverageForm) request.getAttribute("insuranceCoverageForm");
	String event = (String) request.getAttribute("event");

	pageContext.setAttribute("InsuranceCoverageObj", insuranceCoverageForm);

	String iCId = insuranceCoverageForm.getId();
%> 

<%@page import="com.integrosys.cms.ui.insurancecoverage.InsuranceCoverageForm"%><html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}

	function submitPage(idx) {
		document.forms[0].action="InsuranceCoverage.do?event=maker_submit_edit&RMId="+idx;
		document.forms[0].submit();
	}

	function saveToDraft(){
		document.forms[0].action="InsuranceCoverage.do?event=maker_save_update_insurance_coverage";
		document.forms[0].submit();
	}
		


</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="InsuranceCoverage.do">
<input type="hidden" name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0"/>

<html:hidden  name="insuranceCoverageForm" property="insuranceCoverageCode"/>
<html:hidden  name="insuranceCoverageForm" property="id" />
<html:hidden  name="insuranceCoverageForm" property="createdBy" />
<html:hidden  name="insuranceCoverageForm" property="lastUpdateBy" />
<html:hidden  name="insuranceCoverageForm" property="lastUpdateDate" />
<html:hidden  name="insuranceCoverageForm" property="status" />
<html:hidden  name="insuranceCoverageForm" property="deprecated" />
<html:hidden  name="insuranceCoverageForm" property="versionTime" />

  <tr >

	<td width="100%" height="100%" valign="bottom" >
      <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
                                 <table id="111" border="0" cellpadding="0" cellspacing="0" width="99%">
                                   <tbody> 
                                   <tr>
										<td>
										<h3>Relationship Manager Details:Edit</h3>
										</td>
									</tr>                                 
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
	                            <tr class="even">
									<td class="fieldname" width="20%">Insurance Coverage Code <font color="red">*</font></td>
									<td width="30%"><%=insuranceCoverageForm.getInsuranceCoverageCode()%>&nbsp;
									</td>
									<td class="fieldname" >Company Name <font color="red">*</font></td>
				                  <td>
				                  	<html:text name="insuranceCoverageForm" property="companyName" value="<%=insuranceCoverageForm.getCompanyName() %>" size="30"/>
				                  	<html:errors property="companyNameError"/>
				                  </td>
				                </tr>
								<tr class="odd">  
									<td class="fieldname" width="20%">Address </td>
									<td width="30%">
										<html:textarea name="insuranceCoverageForm" property="address" rows="5" cols="30" value="<%=insuranceCoverageForm.getAddress() %>"></html:textarea>
									</td>
								
									<td class="fieldname">Contact Number </td>
									<td>
										<html:text name="insuranceCoverageForm" property="contactNumber" value="<%=insuranceCoverageForm.getContactNumber()%>"></html:text>
									</td>
								</tr>
                            </tbody>
                                 
                        </table>
                    </td>
                </tr>
            </table>
            </table>
					<table width="150" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr align="center">
							<td><a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('saveImage','','img/save2.gif',1)"><img
								src="img/save1.gif" name="saveImage" border="0" 
								onclick="saveToDraft()" /></a></td>
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
								onClick="submitPage('<%=iCId %>')"><img
								src="img/submit1.gif" name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="InsuranceCoverage.do?event=list_insurance_coverage"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>
					</table>
					</td>
    </tr>
</table>

</td>
</tr>
</html:form>
</table>
</body>
</html>

