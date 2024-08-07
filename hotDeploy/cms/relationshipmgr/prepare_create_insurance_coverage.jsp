<%@ page import="com.integrosys.component.notification.bus.INotification,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 java.util.ArrayList,
                 com.integrosys.component.notification.bus.OBNotification,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.IRelationshipMgr"%>

<html>
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

	function submitPage() {
		var rmCode = document.getElementById("insuranceCoverageCode").value;
		document.forms[0].action="InsuranceCoverage.do?event=maker_submit_create_insurance_coverage&ICCode="+rmCode;
		document.forms[0].submit();
	}

	function savePage() {
		document.forms[0].action="InsuranceCoverage.do?event=maker_save_create_insurance_coverage";
		document.forms[0].submit();
	}

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="InsuranceCoverage.do">
<input type="hidden" name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0"/>

  <tr >

	<td width="100%" height="100%" valign="bottom" >
      <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            	<br/>
            	<br/>
                <tr>
                    <td width="70%">
                                 <h3>Add Insurance Coverage Details </h3>
                                 <table id="111" border="0" cellpadding="0" cellspacing="0" width="99%">
                                   <tbody>                                  
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
				                  <td class="fieldname" >Insurance Coverage Code <font color="red">*</font></td>
				                  <td>
				                  	<html:text name="insuranceCoverageForm" property="insuranceCoverageCode" size="30"/>
				                  	<html:errors property="insuranceCoverageCodeError"/>
				                  </td>
				                  <td class="fieldname" >Company Name <font color="red">*</font></td>
				                  <td>
				                  	<html:text name="insuranceCoverageForm" property="companyName" size="30"/>
				                  	<html:errors property="companyNameError"/>
				                  </td>
				                </tr>
				                <tr class="odd">  
				                  <td class="fieldname" width="15%">Address </td>
				                  <td>
				                  	<html:textarea name="insuranceCoverageForm" property="address" rows="5" cols="40"/>
				                  </td>
				                  
				                  <td class="fieldname" width="15%">Contact Number </td>
				                  <td>
				                  	<html:text name="insuranceCoverageForm" property="contactNumber" size="30" ></html:text>
				                  </td>
				                </tr>
                            </tbody>
                                 
                        </table>
                    </td>
                </tr>
            </table>
            </table>
            <br/>
            <hr width="95%" align="center"></hr>
            
            <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
					<tr align="center">
						<td width="100" valign="baseline" align="center"><a href="#"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image2211','','img/save2.gif',1)"
							onClick="savePage()"><img src="img/save1.gif"
							name="Image2211" border="0" id="Image2211" /></a></td>
						<td width="100" valign="baseline" align="center"><a href="#"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick="submitPage()"><img src="img/submit1.gif"
							name="Image3311" border="0" id="Image3311" /></a></td>
						<td width="100" valign="baseline" align="center">
						 <a href="InsuranceCoverage.do?event=list_insurance_coverage"
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

