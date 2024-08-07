<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.city.CityForm"%>
<%@page import="java.util.List"%>

<%
	CityForm form = (CityForm) request.getAttribute("CityForm");	
	String id = (String) request.getAttribute("TrxId");
	String context = request.getContextPath() + "/";
	
	List countryList=null;
	List regionList=null;
	List stateList=null;
	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.countryList");
	regionList = (List)session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.regionList");
	stateList = (List)session.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.stateList");
	
	pageContext.setAttribute("countryList",countryList);
	pageContext.setAttribute("regionList",regionList);
	pageContext.setAttribute("stateList",stateList);
%>

<head>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"ToDo.do";
		document.forms[0].event.value	=	"prepare";
		document.forms[0].submit(); 
	}

	function sumbitSavedCity(){
		document.forms[0].action		=	"City.do";
		document.forms[0].event.value	=	"maker_create_saved_city";
		document.forms[0].submit();		 
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
	     var url = '/cms/City.do?event=refresh_region_id&countryId='+curSel;
	     sendLoadDropdownReq(dep, url);
    }

	function refreshStateId(dropdown)
	{
	     var curSel = "";
	     for(i=0; i<dropdown.options.length; i++)
	     {
	    	if (dropdown.options[i].selected == true)
	    	{
	    	    curSel = dropdown.options[i].value;	
	    	}    	
	     }
	     var dep = 'stateOBId';
	     var url = '/cms/City.do?event=refresh_state_id&regionId='+curSel;
	     sendLoadDropdownReq(dep, url);
	}	

	 insertHeader();
	 insertMenu('examples');
</script>
</head>

<html:form action="City.do">
<html:hidden property="event"/>
<body>
	<!-- InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr><td><h3><br>Create Saved City</h3></td></tr>
			<tr>
				<td>
					<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInput">
						<thead>
						</thead>
						<tbody>									
							<tr class="odd">	
								<td class="fieldname" width="20%">City Code</td>
		                        <td class="even" width="20%"><bean:write name="CityForm" property="cityCode"/></td>
								
								<td class="fieldname" width="20%">City Name<font color="red">*</font>
								<br/><bean:message key="error.string.location.name"/></td>
		                        <td class="even" width="20%"><html:text property="cityName"></html:text>
		                        <br/><html:errors property="cityNameError"/>
		                        <br/><html:errors property="specialCharacterCodeError"/></td>
							</tr>
							
							<tr class="even">	
								<td class="fieldname" width="20%">Country Name<font color="red">*</font></td>
								<td class="even" width="20%">									
								<html:select property="countryOBId" name="CityForm" onchange="javascript:refreshRegionId(this)">				                  
									<option value="">Please Select </option>                     
									<html:options collection ="countryList" labelProperty ="label" property ="value"/>								                   
								</html:select>
								<br/><html:errors property="countryOBIdError"/></td>
								
								<td class="fieldname" width="20%">Region Name<font color="red">*</font></td>
								<td class="even" width="20%">									
								<html:select property="regionOBId" name="CityForm" onchange="javascript:refreshStateId(this)">				                  
									<option value="">Please Select </option>                    
									<html:options collection ="regionList" labelProperty ="label" property ="value"/>								                   
								</html:select>									
								<br/><html:errors property="regionOBIdError"/></td>
							</tr>
							<tr class="even">	
								<td class="fieldname" width="20%">State Name<font color="red">*</font></td>
								<td class="even" width="20%">									
								<html:select property="stateOBId" name="CityForm">				                  
									<option value="">Please Select </option>                     
									<html:options collection ="stateList" labelProperty ="label" property ="value"/>								                   
								</html:select>
								<br/><html:errors property="stateOBIdError"/></td>
								<td class="fieldname" width="20%">ECBF City Id&nbsp;</td>
								<td class="even" width="20%">
									<html:text property="ecbfCityId"></html:text>
									<br/>
									<html:errors property="ecbfCityId"/>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>

	<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr><td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>
		<tr>				
			<td colspan="2">
				<center>
					<a href="javascript:sumbitSavedCity()" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)"><img
							src="img/submit1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
				</center>	
			</td>
			<td colspan="2">
				<center>
					<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
				</center>
			</td>
		</tr>				
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>

	<!-- InstanceEndEditable -->
</body>
<html:hidden name="CityForm" property="cityCode" />
<html:hidden name="CityForm" property="cityName" />
<html:hidden name="CityForm" property="id" />
<html:hidden name="CityForm" property="status" />
<html:hidden name="CityForm" property="deprecated" />
</html:form>