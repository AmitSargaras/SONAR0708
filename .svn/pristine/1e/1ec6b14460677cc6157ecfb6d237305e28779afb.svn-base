<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.geography.GeographyAction,com.integrosys.cms.ui.geography.state.StateForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.cms.app.geography.country.bus.OBCountry,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.Collection,java.util.List"
	pageEncoding="ISO-8859-1"%>

<%
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);	
%>
<head>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
    function goPageIndex(ind)
    {
        document.forms[0].startIndex.value  = ind;
        document.forms[0].event.value       = "";
        document.forms[0].submit();
    }

    function saveState()
 	{   
 	 	document.forms[0].action      	= "State.do";
     	document.forms[0].event.value 	= "maker_save_state";
     	document.forms[0].submit();
 	}
 	
    function createState()
 	{    
 	 	document.forms[0].action      	= "State.do";
     	document.forms[0].event.value 	= "maker_create_state";
     	document.forms[0].submit();
 	}

    function goBack(){
		document.forms[0].action		=	"State.do";
		document.forms[0].event.value	=	"view_list_state";
		document.forms[0].submit(); 
	}

    function getList(){
        alert('doing');
	}

    function refreshRegionId(dropdown)
    {
     var curSel = "";
     for(i=0; i<dropdown.options.length; i++)
     {
    	if (dropdown.options[i].selected == true)
    	{
    	    curSel = dropdown.options[i].value;	
    	}    	
     }
     var dep = 'regionOBId';
     var url = '/cms/State.do?event=refresh_region_id&countryId='+curSel;
     sendLoadDropdownReq(dep, url);
    }	

    insertHeader();
    insertMenu('examples');
</script>
</head>
<html:form action="/State">
	<html:hidden property="startIndex" />
	<html:hidden property="numItems" />
	<html:hidden property="event" />
	<table width="100%" height="100%" border="0" align="center"
		cellpadding="0" cellspacing="0" class="tblFormSection"
		id="contentWindow">
		<tr height="95%">
			<td valign="top">
			<div id="contentCanvas" style="height: 100%; width: 100%;">
			<table width="96%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<tr>
					<td width="70%">
					<h3>Create State</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="tblInfo">
						<tbody>
							<tr>
								<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tblInput">
									<thead>
									</thead>
									<tbody>
										<tr class="odd">
											<td class="fieldname" width="20%">State Code<font color="red">*</font></td>
											<td class="even" width="20%"><html:text
												property="stateCode"  maxlength="30"></html:text>
											<html:errors property="stateCodeError"/></td>

											<td class="fieldname" width="20%">State Name<font color="red">*</font>
											<br/><bean:message key="error.string.location.name"/></td>
											<td class="even" width="20%"><html:text
												property="stateName"  maxlength="30"></html:text>
											<html:errors property="stateNameError"/></td>
										</tr>

										<tr class="even">
											<td class="fieldname" width="20%">Country Name<font color="red">*</font></td>
											<td class="even" width="20%"><html:select
												property="countryOBId" name="StateForm"
												onchange="javascript:refreshRegionId(this)">
												<option value="">Please Select</option>
												<html:options collection="countryList" labelProperty="label"
													property="value" />
											</html:select>
											<br/><html:errors property="countryOBIdError"/></td>

											<td class="fieldname" width="20%">Region Name<font color="red">*</font></td>
											<td class="even" width="20%"><html:select
												property="regionOBId" name="StateForm">
												<option value="">Please Select</option>
												<html:options collection="regionList" property="value"
													labelProperty="label" />
											</html:select>
											<br/><html:errors property="regionOBIdError"/></td>
										</tr>
									</tbody>
								</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="130" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="65">&nbsp;</td>
							<td width="65">&nbsp;</td>
						</tr>

						<tr>
							<td colspan="2">
							<center><a href="javascript:saveState()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/save2.gif',1)"><img
								src="img/save1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
							<td colspan="2">
							<center><a href="javascript:createState()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)"><img
								src="img/submit1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
							<td colspan="2">
							<center><a href="javascript:goBack()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</div>
			</td>
		</tr>
	</table>
<html:hidden property="stateCode"/>	
</html:form>