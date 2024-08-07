<%@page import="java.util.LinkedHashMap"%>
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
<%@page import="com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchForm"%>                 

<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			 MaintainSystemBankBranchForm systemBankBranchForm = (MaintainSystemBankBranchForm) request.getAttribute("MaintainSystemBankBranchForm");
	String systemBankId= (String)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.systemBankId");		 
	String systemBankCode= (String)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.systemBankCode");		
	String systemBankName= (String)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.systemBankName");	
	List hubValueList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.hubValueList");
	List cityList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.cityList");
	List stateList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.stateList");
	List countryList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.countryList");
	List regionList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.regionList");
	String statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.pincodesString");
	
	pageContext.setAttribute("hubValueList",hubValueList);
	pageContext.setAttribute("countryList",countryList);
	pageContext.setAttribute("regionList",regionList);
	pageContext.setAttribute("stateList",stateList);
	pageContext.setAttribute("cityList",cityList);
	boolean isVault=false;
	boolean isNotHub=true;
	if(systemBankBranchForm!=null){
		if(systemBankBranchForm.getIsVault()!=null)
			isVault=true;
		if(systemBankBranchForm.getIsHub()!=null)
		if(systemBankBranchForm.getIsHub().equalsIgnoreCase("Y"))
			isNotHub=false;
		
	}
	
	String country1 = systemBankBranchForm.getCountry();
	String region1 = systemBankBranchForm.getRegion();
	String state1 = systemBankBranchForm.getState();
	String city1 = systemBankBranchForm.getCityTown();
	
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function disableHub(){
	

	var key = document.getElementById("pqr").value;
	alert(key);
	var radioBtns = document.getElementById('choiceTable');
	var allRadios = radioBtns.getElementsByTagName('html:radio');
	for(var i=0; i<allRadios.length;i++)
	{
		alert("xx");
		if(allRadios[i].checked == true){
			var val = allRadios[i].value;
			if(val=='N'){
				document.getElementById('abc').disabled = false;
			}
			else{
				document.getElementById('abc').disabled = true;
			}
		}
	}
}

function enableStatus(){
	document.forms[0].status="ACTIVE";
}

function showSpanHub()   {
     	document.getElementById("linkedHub").className = "visibleDiv";
     	document.forms[0].isHub="N";
}

function hideSpanHub()   {
   document.getElementById("linkedHub").className = "hiddenDiv";
   document.forms[0].isHub="Y";
}

function showSpanCustodian()   {
	
	if(document.forms[0].isVault.checked==false){
		document.getElementById("cust1").className = "hiddenDiv";
		document.getElementById("cust2").className = "hiddenDiv";
		//document.getElementById("cust1").style.visibility = "hidden"; 
		// document.getElementById("cust2").style.visibility = "hidden"; 
		
		}else if(document.forms[0].isVault.checked==true){
			document.getElementById("cust1").className = "visibleDiv";
			document.getElementById("cust2").className = "visibleDiv";
		//	 document.getElementById("cust1").style.visibility = "visible"; 
		//	 document.getElementById("cust2").style.visibility = "visible"; 
			}
	 
     	//document.getElementById("custodian").style.visibility = "visible";
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
    document.forms[0].action="systemBank.do?event=maker_view_systemBank&bankCode=1";
    document.forms[0].submit();
}
function submitForm() {

 	document.forms[0].action="systemBankBranch.do?event=maker_create_systemBankBranch";
    document.forms[0].submit();
}

function saveForm() {

 	document.forms[0].action="systemBankBranch.do?event=maker_draft_systemBankBranch";
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
 var url = '/cms/systemBankBranch.do?event=refresh_region_id&countryId='+curSel;
 
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
 var url = '/cms/systemBankBranch.do?event=refresh_state_id&regionId='+curSel;
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
 var url = '/cms/systemBankBranch.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}	

function setMaxLenght(field,maxChars)
{
      if(field.value.length >= maxChars) {
         event.returnValue=false;
         return false;
      }
}
function refreshRegionId1(dropdown)
{
 var curSel = dropdown;
 
if(curSel==""){
		clearDisplayDropdown('state');
		clearDisplayDropdown('cityTown');
		
}
 var dep = 'region';
 var url = '/cms/systemBankBranch.do?event=refresh_region_id&countryId='+curSel;
 
 sendLoadDropdownReq(dep, url);
}

function refreshStateId1(dropdown)
{
 var curSel = dropdown;
 
 if(curSel==""){
		clearDisplayDropdown('cityTown');
		
}
 var dep = 'state';
 var url = '/cms/systemBankBranch.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}	

function refreshCityId1(dropdown)
{
 var curSel = dropdown;
 
 var dep = 'cityTown';
 var url = '/cms/systemBankBranch.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}	



function newOnload(){
	var country2 = '<%=country1%>';
	if(null != country2){
		refreshRegionId1(country2);
	}
	
	var region2 = '<%=region1%>';
	//document.getElementById('region').value = region2;
	
	if(null != region2){
		refreshStateId1(region2);
	}
	
	var state2 = '<%=state1%>';
	
	if(null != state2){
		refreshCityId1(state2);
	}
	
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
<!-- InstanceEndEditable -->
</head>

<html:form action="/systemBankBranch" onreset="showSpanCustodian()">
<body onload="showSpanCustodian();enableStatus();newOnload();">

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
      <td><h3>Add New System Bank Branch</h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" id="choiceTable">
          <thead>
          </thead>
          <tbody>
           <tr class="odd">
             
              <td class="fieldname" width="20%">Bank Code </td>
              <td width="30%"><%= systemBankCode %>&nbsp;</td>
              <td class="fieldname" width="20%">Bank Name </td>
              <td width="30%"><%= systemBankName %>&nbsp;</td>
            </tr>
            <tr class="odd">
             
              <td class="fieldname" width="20%">Branch Code <font color="red">*</font></td>
              <td width="30%"><html:text property="systemBankBranchCode"/>&nbsp;
              </br><html:errors property="systemBankBranchCodeError"/>
              <html:errors property="systemBankBranchDuplicateCodeError"/>
              <html:errors property="spaceError"/></br></td>
              <td class="fieldname" width="20%">Branch Name <font color="red">*</font>
              <br/><bean:message key="error.string.branch.name"/></td>
              <td width="30%"><html:text property="systemBankBranchName" maxlength="50" />&nbsp;
              </br><html:errors property="systemBankBranchNameError"/>
              <html:errors property="specialCharacterNameError"/><html:errors property="systemBankBranchDuplicateBranchNameError"/></td>
            </tr>
            <tr class="even">
             
              <td class="fieldname" width="20%">RBI Code</td>
              <td width="30%"><html:text property="rbiCode" maxlength="9" />&nbsp;</br><html:errors property="systemBankBranchRbiError"/>
              <html:errors property="rbiCodeError"/><html:errors property="systemBankBranchDuplicateRBICodeError" /></td>
             <td class="fieldname" width="20%">Status&nbsp;</td>
              <td width="30%">Enable<input type="radio" checked="checked" id="status" name="status" value="ACTIVE"  disabled="disabled" >
             &nbsp;
              Disable<input type="radio"  id="status" name="status" value="INACTIVE"  disabled="disabled">&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">HUB OR Spoke </td>
<!--              <td>HUB<html:radio  name="MaintainSystemBankBranchForm"  property="isHub" value="Y" onclick="javascript:hideSpanHub();" />&nbsp;-->
<!--              Spoke<html:radio  name="MaintainSystemBankBranchForm" property="isHub" value="N"  onclick="javascript:showSpanHub();"/>&nbsp;-->
<!--              </td>-->
                <td >HUB<input type="radio" id="isHub" <%if(isNotHub){ %><%}else{ %> checked="checked" <%} %> name="isHub" value="Y" onclick="javascript:hideSpanHub();" >
             &nbsp;
              Spoke<input type="radio" <%if(isNotHub){ %>  checked="checked"<%}else{ %>  <%} %>  id="isHub" name="isHub" value="N" onclick="javascript:showSpanHub();">&nbsp;</td>
               <td class="fieldname">Linked HUB </td>
              <td>
              
              <span id="linkedHub" class="<%= isNotHub? "visibleDiv":"hiddenDiv"%>" ><html:select name="MaintainSystemBankBranchForm"   property="linkedHub" >
		      <option value="">Please Select </option>	
                      <html:options collection="hubValueList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;</br> <html:errors property="systemBankBranchIsHubError"/> </span></td>
            </tr>
             <tr class="even">
              <td class="fieldname">Is Vault </td>
              <td><html:checkbox name="MaintainSystemBankBranchForm"  property="isVault" onclick="showSpanCustodian()" /></td>
              <td class="fieldname"><html:errors property="systemBankBranchCustodianError"/> &nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Custodian 1 </td>
              <td><SPAN class="<%= isVault? "visibleDiv":"hiddenDiv"%>" id="cust1" ><html:text property="custodian1" maxlength="50" />&nbsp;</br> <html:errors property="systemBankBranchCustodianError"/>
              <html:errors property="custodian1Error"/></SPAN></td>
              <td class="fieldname">Custodian 2 </td>
              <td><SPAN class="<%= isVault? "visibleDiv":"hiddenDiv"%>" id="cust2"><html:text property="custodian2" maxlength="50" />&nbsp;</br>  <html:errors property="systemBankBranchCustodianError"/>
                  <html:errors property="custodian2Error"/></SPAN></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea property="address" cols="45" rows="5" onkeypress="setMaxLenght(this,'200')"/>&nbsp;</br> <html:errors property="systemBankBranchAddressError"/>
              </td>
              <td class="fieldname" width="20%">Country <font color="red">*</font></td>
											<td class="even" width="20%">
											<html:select property="country" 
												onchange="javascript:refreshRegionId(this)">
											<option value="">Please Select</option>
											<html:options collection="countryList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="countryOBIdError"/></td>
           									</tr><tr class="even">
											<td class="fieldname" width="20%">Region <font color="red">*</font> </td>
											<td class="even" width="20%">
											<html:select property="region" 
												onchange="javascript:refreshStateId(this)">
											<option value="">Please Select</option>
											<html:options collection="regionList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="regionOBIdError"/></td>
												<td class="fieldname" width="20%">State <font color="red">*</font> </td>
											<td class="even" width="20%">
											<html:select property="state" styleId="state" onchange="javascript:refreshCityId(this)" >
											<option value="">Please Select</option>
											<html:options collection="stateList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="stateOBIdError"/></td>
										</tr>
<!--										<tr class="even">-->
<!--										-->
<!--											<td class="fieldname" width="20%">&nbsp;</td>-->
<!--											<td class="even" width="20%">&nbsp;</td>-->
<!--										</tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">State</td>-->
<!--              <td><html:text property="state" />&nbsp;</br>  <html:errors property="systemBankBranchStateError"/></td>-->
<!--              <td class="fieldname">Region</td>-->
<!--                <td><html:text property="region"  />&nbsp;</br>  <html:errors property="systemBankBranchRegionError"/></td>-->
<!--            </tr>-->
            <tr class="even">

<!--                  <td class="fieldname">Country </td>-->
<!--                  <td><html:text property="country"  />&nbsp;</br>  <html:errors property="systemBankBranchCountryError"/></td>-->
										<td class="fieldname">City <font color="red">*</font> </td>
              							<td><html:select property="cityTown" >
											<option value="">Please Select</option>
											<html:options collection="cityList" labelProperty="label" property="value" />
											</html:select>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>

				  <td class="fieldname">Pin Code<font color="red">*</font></td>
                  <td><html:text property="pincode" styleId="pincode" onblur="validatePinCode()" maxlength="6" />&nbsp;</br><html:errors property="systemBankBranchPincodeError"/></td>
             </tr>
             
             <tr class="even">

				  <td class="fieldname"></td>
              	  <td></td>

				  <td class="fieldname">Telephone no. </td>
                  <td><html:text property="contactNumber" maxlength="15" />&nbsp;</br><html:errors property="systemBankBranchContactNumberError"/></td>
             </tr>
             
			<tr class="odd">
              <td class="fieldname">Bank mail id</td>
              <td><html:text property="contactMail" maxlength="50" />&nbsp;</br><html:errors property="systemBankBranchContactMailError"/></td>
              
							<td class="fieldname">Fax No. </td>
							<td><html:text property="faxNumber" maxlength="15"/>&nbsp;
							</br><html:errors property="systemBankBranchFaxNumberError"/></td>
                
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankCode" />
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankName"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankBranchCode"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankBranchName"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="status" />
 <html:hidden name="MaintainSystemBankBranchForm" property="region"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="country"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="state"/>
 
 
  <html:hidden name="MaintainSystemBankBranchForm" property="rbiCode" />
 <html:hidden name="MaintainSystemBankBranchForm" property="faxNumber"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="isHub"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="linkedHub"/>


 <html:hidden name="MaintainSystemBankBranchForm" property="custodian1"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="custodian2"/>
 
 <html:hidden name="MaintainSystemBankBranchForm" property="pincode"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="statePincodeString" value="<%=statePinCodeString %>"/>
 
 

 <html:hidden name="MaintainSystemBankBranchForm" property="masterId"/>

 <html:hidden name="MaintainSystemBankBranchForm" property="createBy" value="SA_MAKER"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="lastUpdateBy" value="SA_MAKER"/>
  <html:hidden name="MaintainSystemBankBranchForm" property="lastUpdateDate"/>
    <html:hidden name="MaintainSystemBankBranchForm" property="creationDate"/>
     <html:hidden name="MaintainSystemBankBranchForm" property="deprecated" value="N"/>
      <html:hidden name="MaintainSystemBankBranchForm" property="id"/>
       <html:hidden name="MaintainSystemBankBranchForm" property="systemBankId" value="<%=systemBankId %>"/>
                
            </tr>
           
		
          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>

   <tr>
  
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                    
  <td colspan="2">
  <center>
  <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" 
				border="0" id="ImageSave" /></a>
				
				</center>
				&nbsp;
				</td>
			<td colspan="2">

						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
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

<script>
	
	function validatePinCode(){
		var state = document.getElementById("state").value;
		var	pincode = document.getElementById("pincode").value;
		var statePinCodeString = '<%=statePinCodeString%>';
		var splittedPins = statePinCodeString.split(",");
		
		var statePinCodeMappingMap = new Map();
		for (index = 0; index < splittedPins.length; ++index) {
			var subSplittedPins = splittedPins[index].split("=");
			statePinCodeMappingMap.set(subSplittedPins[0],subSplittedPins[1]);
		}
		
		if(statePinCodeMappingMap.get(state) != undefined && statePinCodeMappingMap.get(state) != pincode.charAt(0) && pincode != "" && state != ""){
			alert("Please enter correct pin code");
		}
	}
	
</script>