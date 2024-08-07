
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
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
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.app.systemBank.trx.ISystemBankTrxValue,
	com.integrosys.cms.ui.systemBank.MaintainSystemBankForm"%>
	<%
	String context = request.getContextPath() + "/";
%>  
<%
ISystemBankTrxValue systemBankTrx = (ISystemBankTrxValue)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.ISystemBankTrxValue");
	 MaintainSystemBankForm systemBankForm = (MaintainSystemBankForm) request.getAttribute("MaintainSystemBankForm");
	 List cityList = (List)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.cityList");
		List stateList = (List)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.stateList");
		List countryList = (List)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.countryList");
		List regionList = (List)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.regionList");
		
		
		pageContext.setAttribute("countryList",countryList);
		pageContext.setAttribute("regionList",regionList);
		pageContext.setAttribute("stateList",stateList);
		pageContext.setAttribute("cityList",cityList);
	 
	 //int sno = 0;
	//int startIndex = 0;
%>


<html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
		<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
	
    document.forms[0].action="ToDo.do?event=prepare";
    
    document.forms[0].submit();
}
function submitForm() {
	
	
		
		document.forms[0].action="systemBank.do?event=maker_save_update";
    document.forms[0].submit();
}

function saveForm() {

 	document.forms[0].action="systemBank.do?event=maker_draft_systemBank";
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

 var dep = 'region';
 var url = '/cms/systemBank.do?event=refresh_region_id&countryId='+curSel;
 
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
 var dep = 'state';
 var url = '/cms/systemBank.do?event=refresh_state_id&regionId='+curSel;
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
 var url = '/cms/systemBank.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}	

function setMaxLenght(field,maxChars)
{
      if(field.value.length >= maxChars) {
         event.returnValue=false;
         return false;
      }
}
//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='systemBank.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					
					<tr>
						<td>
							<h3>
								View System Bank
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
													Bank Code
												</td>
												<td width="30%"><%=systemBankForm.getSystemBankCode()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Bank Name
												</td>
												<td width="30%"><%=systemBankForm.getSystemBankName()%>&nbsp;
												</td>
											</tr>
							   <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea property="address" value="<%=systemBankForm.getAddress()%>" onkeypress="setMaxLenght(this,'200')"/>&nbsp;</br> <html:errors property="systemBankBranchAddressError"/></td>
              <td class="fieldname" width="20%">Country <font color="red">*</font></td>
											<td class="even" width="20%">
											<html:select property="country"  
												onchange="javascript:refreshRegionId(this)">
											<option value="">Please Select</option>
											<html:options collection="countryList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="countryOBIdError"/></td>
              
            </tr>
             <tr class="even">
											

											<td class="fieldname" width="20%">Region <font color="red">*</font></td>
											<td class="even" width="20%">
											<html:select property="region"  
												onchange="javascript:refreshStateId(this)">
											<option value="">Please Select</option>
											<html:options collection="regionList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="regionOBIdError"/></td>
												<td class="fieldname" width="20%">State <font color="red">*</font></td>
											<td class="even" width="20%">
											<html:select property="state"  onchange="javascript:refreshCityId(this)" >
											<option value="">Please Select</option>
											<html:options collection="stateList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="stateOBIdError"/></td>
										</tr>
										 <tr class="even">

<!--                  <td class="fieldname">Country </td>-->
<!--                  <td><html:text property="country"  />&nbsp;</br>  <html:errors property="systemBankBranchCountryError"/></td>-->
										<td class="fieldname">City/Town <font color="red">*</font></td>
              							<td><html:select property="cityTown"  >
											<option value="">Please Select</option>
											<html:options collection="cityList" labelProperty="label" property="value" />
											</html:select>&nbsp;</br>  <html:errors property="systemBankCityError"/></td>
				  <td class="fieldname">Contact Number </td>
                  <td><html:text property="contactNumber" value="<%=systemBankForm.getContactNumber()%>"/>&nbsp;</br><html:errors property="systemBankContactNumberError"/></td>
             </tr>
			<tr class="odd">
              <td class="fieldname">Contact Mail </td>
              <td><html:text property="contactMail" value="<%=systemBankForm.getContactMail()%>"/>&nbsp;</br><html:errors property="systemBankContactMailError"/></td>
              <td class="fieldname">Fax Number</td>
							<td><html:text property="faxNumber" value="<%=systemBankForm.getFaxNumber()%>"/>&nbsp;</td>


<html:hidden name="MaintainSystemBankForm" property="status"/>
 <html:hidden name="MaintainSystemBankForm" property="systemBankCode"/>
 <html:hidden name="MaintainSystemBankForm" property="systemBankName"/>
 <html:hidden name="MaintainSystemBankForm" property="region"/>
 <html:hidden name="MaintainSystemBankForm" property="country"/>
 <html:hidden name="MaintainSystemBankForm" property="state"/>

 <html:hidden name="MaintainSystemBankForm" property="masterId"/>

 <html:hidden name="MaintainSystemBankForm" property="createBy"/>
 <html:hidden name="MaintainSystemBankForm" property="lastUpdateBy"/>
  <html:hidden name="MaintainSystemBankForm" property="lastUpdateDate"/>
    <html:hidden name="MaintainSystemBankForm" property="creationDate"/>
     <html:hidden name="MaintainSystemBankForm" property="deprecated"/>
      <html:hidden name="MaintainSystemBankForm" property="id"/>
										
								</tbody>
							</table>
						</td>
					</tr>
					 <tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=systemBankTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=systemBankTrx.getRemarks() != null
						? systemBankTrx.getRemarks()
						: ""%>&nbsp;</td>
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
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
				  <tr>

                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;
					</td>
                     
   
<!--			<td colspan="2">-->
<!--			<center>-->
<!--			<a href="javascript:saveForm();"-->
<!--				onmouseout="MM_swapImgRestore()"-->
<!--				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img-->
<!--				src="img/save1.gif" name="ImageSave" width="70" height="20"-->
<!--				border="0" id="ImageSave" /></a>-->
<!--				</center>-->
<!--				&nbsp;-->
<!--				</td>-->
			<td colspan="2">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
					</td>
 
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


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
