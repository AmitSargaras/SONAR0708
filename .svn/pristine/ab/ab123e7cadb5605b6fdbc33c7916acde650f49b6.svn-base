
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.valuationAgency.ValuationAgencyForm"%>                 

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
List cityList = (List)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.cityList");
List stateList = (List)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.stateList");
List countryList = (List)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.countryList");
List regionList = (List)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.regionList");


pageContext.setAttribute("countryList",countryList);
pageContext.setAttribute("regionList",regionList);
pageContext.setAttribute("stateList",stateList);
pageContext.setAttribute("cityList",cityList);
%>




<html>
<head>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function showSpanHub()   {
     	document.getElementById("linkedHub").style.visibility = "visible";
}
function hideSpanHub()   {
   document.getElementById("linkedHub").style.visibility = "hidden"; 
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function cancelPage(){
    document.forms[0].action="ValuationAgency.do?event=maker_list_valuation&go=N";
    
    document.forms[0].submit();
}
function submitForm() {

 	document.forms[0].action="ValuationAgency.do?event=maker_submit_valuationAgency";
    document.forms[0].submit();
}

function saveForm() {

 	document.forms[0].action="ValuationAgency.do?event=maker_draft_valuationAgency";
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
 if(curSel==""){
		clearDisplayDropdown('state');
		clearDisplayDropdown('cityTown');
		
}
 var dep = 'region';
 var url = '/cms/ValuationAgency.do?event=refresh_region_id&countryId='+curSel;
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
 if(curSel==""){
		
		clearDisplayDropdown('cityTown');
		
}
 var dep = 'state';
 var url = '/cms/ValuationAgency.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshCityId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'cityTown';
 var url = '/cms/ValuationAgency.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}




//-->
</script>
	<style type="text/css"><!--

.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}
-->
</style>
	</head>

	<html:form action="/ValuationAgency" >
    <body >
			
			<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<br>
					<br>
					<br>
					<br>
					<tr>
						<td>
							<h3>
								Add Valuation Agency
							</h3>
						</td>
					</tr>
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

												<td class="fieldname" width="20%">
													Valuation Agency Code </font> 
												</td>
												<td width="30%" class="even"><html:text name="ValuationAgencyForm" property="valuationAgencyCode" maxlength="30" style="background:#B4CFEC" disabled="true"/>&nbsp;
												</br>
												<html:errors property="valuationAgencyDuplicateCodeError"/>
												</br>
												</td>
												<td class="fieldname" width="20%">
													Valuation Agency Name <font color="red">*</font> 
												<br/><bean:message key="error.string.valAndInsuCove.name"/></td>
												<td width="30%" ><html:textarea name="ValuationAgencyForm" property="valuationAgencyName" cols="30" rows="3"/>&nbsp;
												</br><html:errors property="valuationAgencyNameError"/>
												<html:errors property="specialCharacterNameError"/>
												</td>
											</tr>
											<tr class="even">
												<td class="fieldname">
													Address 
												</td>
												<td><html:textarea name="ValuationAgencyForm" property="address" cols="45" rows="5" />&nbsp;</br> 
												      <html:errors property="addressError"/></td>
												<td class="fieldname">Country </font> </td>
													
											      <td class="even" width="20%">
											      <html:select property="country" name="ValuationAgencyForm"	onchange="javascript:refreshRegionId(this)">
											      <option value="">Please Select</option>
											     <html:options collection="countryList" labelProperty="label" property="value" />
											      </html:select>
											<br/>
										</tr>
											<tr class="odd">
											
											<td class="fieldname">Region </font></td>
											<td class="even" width="20%">
											<html:select property="region" name="ValuationAgencyForm"
												onchange="javascript:refreshStateId(this)">
											<option value="">Please Select</option>
											<html:options collection="regionList" labelProperty="label" property="value" />
											</html:select>												
												</td>									
											<td class="fieldname">State </font></td>
												<td class="even" width="20%">
											<html:select property="state" name="ValuationAgencyForm"onchange="javascript:refreshCityId(this)">
											<option value="">Please Select</option>
											<html:options collection="stateList" labelProperty="label" property="value" />
											</html:select>
												</td>
												
											</tr>
											<tr class="even">

												
												<td class="fieldname">City/Town </font></td>
												<td class="even" width="20%">
										    	<html:select property="cityTown" name="ValuationAgencyForm">
											   <option value="">Please Select</option>
										    	<html:options collection="cityList" labelProperty="label" property="value" />
											   </html:select>
											    <br/>
												</td>	
												<td class="fieldname">
													
												</td>
												<td></br> 
												</td>
											</tr>
											<tr class="odd">
	                 <html:hidden name="ValuationAgencyForm"	property="valuationAgencyCode" />
					<html:hidden name="ValuationAgencyForm"	property="valuationAgencyName"  />
					<html:hidden name="ValuationAgencyForm" property="address"  />
					<html:hidden name="ValuationAgencyForm"	property="country" />
					<html:hidden name="ValuationAgencyForm"	property="region" />
					
					<html:hidden name="ValuationAgencyForm"	property="state" />
					<html:hidden name="ValuationAgencyForm"	property="cityTown" />
					
					
				    <html:hidden name="ValuationAgencyForm"	property="masterId" />
					<html:hidden name="ValuationAgencyForm"	property="createBy" value="SC_MAKER" />
					<html:hidden name="ValuationAgencyForm" property="lastUpdateBy" value="SC_MAKER" />
					<html:hidden name="ValuationAgencyForm"	property="lastUpdateDate" />
					<html:hidden name="ValuationAgencyForm"	property="creationDate" />
					<html:hidden name="ValuationAgencyForm"	property="deprecated" value="N" />
					<html:hidden name="ValuationAgencyForm" property="id" />
				    <html:hidden name="ValuationAgencyForm" property="status" value="ACTIVE"/>
						</tr>
								
								</tbody>
							</table>
						</td>
					</tr>

				</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
  <td colspan="4">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;
					</td>
			<td colspan="4">
 <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" width="70" height="20"
				border="0" id="ImageSave" />
				
				</a>&nbsp;</td>
			<td colspan="4">
								<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>




