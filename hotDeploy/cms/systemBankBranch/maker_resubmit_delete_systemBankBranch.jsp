
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
	com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchForm,com.integrosys.cms.app.systemBankBranch.trx.ISystemBankBranchTrxValue,com.integrosys.cms.app.systemBankBranch.trx.OBSystemBankBranchTrxValue"%>
<%
	 MaintainSystemBankBranchForm systemBankBranchForm = (MaintainSystemBankBranchForm) request.getAttribute("MaintainSystemBankBranchForm");
ISystemBankBranchTrxValue systemBankBranchTrx = (ISystemBankBranchTrxValue)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.ISystemBankBranchTrxValue");

List hubValueList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.hubValueList");
List cityList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.cityList");
List stateList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.stateList");
List countryList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.countryList");
List regionList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.regionList");
String statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.pincodesString");

String rejectEvent="";
if(systemBankBranchTrx.getFromState().equals("PENDING_CREATE")){
	rejectEvent="maker_confirm_resubmit_create";
}else if(systemBankBranchTrx.getFromState().equals("PENDING_UPDATE")){
	rejectEvent="maker_confirm_resubmit_edit";
}else if(systemBankBranchTrx.getFromState().equals("PENDING_DELETE")){
	rejectEvent="maker_confirm_resubmit_delete";
}



pageContext.setAttribute("hubValueList",hubValueList);
pageContext.setAttribute("countryList",countryList);
pageContext.setAttribute("regionList",regionList);
pageContext.setAttribute("stateList",stateList);
pageContext.setAttribute("cityList",cityList);
boolean isVault=false;
boolean isNotHub=false;
if(systemBankBranchForm.getIsVault()!=null)
	isVault=true;
if(systemBankBranchForm.getIsHub()!=null)
	if(systemBankBranchForm.getIsHub().equalsIgnoreCase("N"))
		isNotHub=true;
	int sno = 0;
	int startIndex = 0;
%>


<html>
<!--	 InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
<!--		 InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
<!--		 InstanceEndEditable -->

<!--		 InstanceBeginEditable name="CssStyle" -->

<!--		 InstanceEndEditable -->
<!--		 InstanceBeginEditable name="head" -->
		<script language="JavaScript" type="text/JavaScript">

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
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}

function submitPage () {

	if(isPincodeValidated()){
			document.forms[0].action="systemBankBranch.do?event=<%=rejectEvent%>";
		    document.forms[0].submit();	
	}
	else{
		alert("Please enter correct pin code.");
	}
}
function showSpanHub()   {
 	document.getElementById("linkedHub").className = "visibleDiv";
}

function hideSpanHub()   {
document.getElementById("linkedHub").className = "hiddenDiv";
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

function setMaxLenght(field,maxChars)
{
      if(field.value.length >= maxChars) {
         event.returnValue=false;
         return false;
      }
}
//
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
<!--		 InstanceEndEditable -->
	</head>

	<html:form action='systemBankBranch.do?'>
		<body>
<!--			 InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
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
								Edit System Bank Branch
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
          
            <tr class="even">
             
              <td class="fieldname" width="20%">Branch Code </td>
              <td width="30%"><%=systemBankBranchForm.getSystemBankBranchCode()%>&nbsp;</td>
              <td class="fieldname" width="20%">Branch Name </td>
              <td width="30%"><%=systemBankBranchForm.getSystemBankBranchName()%>&nbsp;</td>
            </tr>
            <tr class="odd">
             
              <td class="fieldname" width="20%">Bank Code </td>
              <td width="30%"><%=systemBankBranchForm.getSystemBankCode()%>&nbsp;</td>
              <td class="fieldname" width="20%">Bank Name </td>
              <td width="30%"><%=systemBankBranchForm.getSystemBankName()%>&nbsp;</td>
            </tr>
            <tr class="even">
             
              <td class="fieldname" width="20%">RBI Code</td>
              <td width="30%"><%=systemBankBranchForm.getRbiCode()%>&nbsp;
              </td>
              <td class="fieldname" width="20%">Status&nbsp;</td>
              <% if(  systemBankBranchTrx.getFromState().equals("PENDING_UPDATE") || systemBankBranchTrx.getFromState().equals("CLOSED") ){ %>
             	<td >Enable<html:radio   property="status" value="ACTIVE"/>&nbsp;
              Disable<html:radio  property="status" value="INACTIVE"/>&nbsp;</td>
             <%}else{ %>
              <td >Enable<html:radio   property="status" value="ACTIVE" disabled="true"/>&nbsp;
              Disable<html:radio  property="status" value="INACTIVE" disabled="true"/>&nbsp;</td>
              <%} %>
            </tr>
            <tr class="odd">
              <td class="fieldname">HUB OR Spoke </td>
              <td>HUB<html:radio  name="MaintainSystemBankBranchForm"  property="isHub" value="Y" onclick="javascript:hideSpanHub();" />
              &nbsp;Spoke<html:radio  name="MaintainSystemBankBranchForm" property="isHub" value="N" onclick="javascript:showSpanHub();"/>
              &nbsp;</br>
              <html:errors property="invalidHUBError" /></td>
               <td class="fieldname">HUB <font color="red">*</font></td>
              <td>
              
              <span id="linkedHub" class="<%= isNotHub? "visibleDiv":"hiddenDiv"%>" ><html:select name="MaintainSystemBankBranchForm"   property="linkedHub" >
		      
                      <html:options collection="hubValueList" property="value" labelProperty="label"/>
                    </html:select>&nbsp; </span></td>
            </tr>
             <tr class="even">
              <td class="fieldname">Is Vault </td>
              <td><html:checkbox name="MaintainSystemBankBranchForm"  property="isVault" onclick="showSpanCustodian()" /></td>
             <td class="fieldname"><html:errors property="systemBankBranchCustodianError"/> &nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Custodian 1 </td>
              <td><SPAN class="<%= isVault? "visibleDiv":"hiddenDiv"%>" id="cust1" ><html:text property="custodian1" maxlength="50" />&nbsp;</SPAN></td>
              <td class="fieldname">Custodian 2 </td>
              <td><SPAN class="<%= isVault? "visibleDiv":"hiddenDiv"%>" id="cust2"><html:text property="custodian2" maxlength="50"  />&nbsp;</SPAN></td>
           </tr>
             <tr class="even">
              <td class="fieldname">Address </td>
              <td><html:textarea  property="address" onkeypress="setMaxLenght(this,'200')" />&nbsp;</br> <html:errors property="systemBankBranchAddressError"/></td>
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
											<html:select property="state" styleId="state" onchange="javascript:refreshCityId(this)" >
											<option value="">Please Select</option>
											<html:options collection="stateList" labelProperty="label" property="value" />
											</html:select>
											<br/><html:errors property="stateOBIdError"/></td>
										</tr>
										 <tr class="even">

<!--                  <td class="fieldname">Country </td>-->
<!--                  <td><html:text property="country"  />&nbsp;</br>  <html:errors property="systemBankBranchCountryError"/></td>-->
										<td class="fieldname">City/Town <font color="red">*</font> </td>
              							<td><html:select property="cityTown"  >
											<option value="">Please Select</option>
											<html:options collection="cityList" labelProperty="label" property="value" />
											</html:select>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>

				  <td class="fieldname">Pincode<font color="red">*</font></td>
                  <td><html:text property="pincode" styleId="pincode" maxlength="15" onblur="validatePinCode()" value="<%=systemBankBranchForm.getPincode()%>" />&nbsp;</br><html:errors property="systemBankBranchPincodeError"/></td>
             </tr>
             
             <tr class="even">
				 <td class="fieldname"></td>
 				 <td></td>
   				 <td class="fieldname">Telephone no.</td>
  	             <td><html:text property="contactNumber" maxlength="15" value="<%=systemBankBranchForm.getContactNumber()%>" />&nbsp;</br><html:errors property="systemBankBranchContactNumberError"/></td>
             </tr>
             
<!--            <tr class="even">-->
<!--              <td class="fieldname">Address *</td>-->
<!--              <td><html:text property="address" value="<%=systemBankBranchForm.getAddress()%>" />&nbsp;</br> <html:errors property="systemBankBranchAddressError"/></td>-->
<!--              <td class="fieldname">City/Town *</td>-->
<!--              <td><html:text property="cityTown" value="<%=systemBankBranchForm.getCityTown()%>"/>&nbsp;</br>  <html:errors property="systemBankBranchCityError"/></td>-->
<!--            </tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">State</td>-->
<!--              <td><%=systemBankBranchForm.getState()%>&nbsp;</td>-->
<!--              <td class="fieldname">Region</td>-->
<!--                <td><%=systemBankBranchForm.getRegion()%>&nbsp;</td>-->
<!--            </tr>-->
<!--            <tr class="even">-->
<!---->
<!--                  <td class="fieldname">Country </td>-->
<!--                  <td><%=systemBankBranchForm.getCountry()%>&nbsp;</td>-->
<!--				  <td class="fieldname">Contact Number *</td>-->
<!--                  <td><html:text property="contactNumber" value="<%=systemBankBranchForm.getContactNumber()%>"/>&nbsp;</br><html:errors property="systemBankBranchContactNumberError"/></td>-->
<!--             </tr>-->
			<tr class="odd">
              <td class="fieldname">Bank email id</td>
              <td><html:text property="contactMail" maxlength="50" value="<%=systemBankBranchForm.getContactMail()%>"/>&nbsp;</br><html:errors property="systemBankBranchContactMailError"/></td>
              <td class="fieldname">Fax No. </td>
							<td><html:text property="faxNumber" maxlength= "15" value="<%=systemBankBranchForm.getFaxNumber()%>"/>&nbsp;</br><html:errors property="systemBankBranchFaxNumberError"/></td>
                <html:hidden name="MaintainSystemBankBranchForm" property="status"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankCode"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankName"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankBranchCode"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="systemBankBranchName"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="region"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="rbiCode"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="country"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="state"/>
 
 <html:hidden name="MaintainSystemBankBranchForm" property="pincode"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="statePincodeString" value="<%=statePinCodeString %>"/>

 <html:hidden name="MaintainSystemBankBranchForm" property="masterId"/>

 <html:hidden name="MaintainSystemBankBranchForm" property="createBy"/>
 <html:hidden name="MaintainSystemBankBranchForm" property="lastUpdateBy"/>
  <html:hidden name="MaintainSystemBankBranchForm" property="lastUpdateDate"/>
    <html:hidden name="MaintainSystemBankBranchForm" property="creationDate"/>
     <html:hidden name="MaintainSystemBankBranchForm" property="deprecated"/>
      <html:hidden name="MaintainSystemBankBranchForm" property="id"/>
       <html:hidden name="MaintainSystemBankBranchForm" property="systemBankId"/>
                
            </tr>
           
		
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
							<td class="even"><%=systemBankBranchTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=systemBankBranchTrx.getRemarks() != null
						? systemBankBranchTrx.getRemarks()
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
						 <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>&nbsp;&nbsp;
          
						&nbsp;
					</td>
					<td colspan="2">
						
          <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a>
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


<!--			 InstanceEndEditable -->
		</body>
	</html:form>
<!--	 InstanceEnd -->
</html>

<script>
	
	function validatePinCode(){
		
		if(!isPincodeValidated()){
			alert("Please enter correct pin code");
		}
	}
	
	function isPincodeValidated(){
		
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
			return false;
		}
		else if(checkIfPositiveNumber(pincode)){
			return true;			
		}
		else{
			return false;
		}
	}
	
	function checkIfPositiveNumber(num){
		var rgx = /^\d+(\.\d+)?$/;
		if(null != num && undefined != num){
			num = num.replace(/,/g,'');
			return rgx.test(num); 
		}
		else{
			return false;
		}
	}
	
</script>