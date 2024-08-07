<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
                 
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.*"%>

<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="com.integrosys.cms.app.directorMaster.bus.IDirectorMaster"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<%
String context = request.getContextPath() + "/";
ManualInputCustomerInfoForm customer = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
String index = (String) request.getAttribute("index");
String event = (String)  session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.event");
if(index == null || index == "")
{
	index="0";
}
List directorCountryList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorCountryList");
List directorRegionList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorRegionList");
List directorCityList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorCityList");
List directorStateList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorStateList");
//List dirList = (List) request.getAttribute("dirList");
List dirList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.dirList");
/* com.integrosys.cms.app.customer.bus.OBDirector ob = new OBDirector();
ob = ((com.integrosys.cms.app.customer.bus.OBDirector)dirList.get(0)); */
SearchResult searchResult = (SearchResult) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorMasterList");
pageContext.setAttribute("directorCountryList", directorCountryList);
pageContext.setAttribute("directorRegionList", directorRegionList);
pageContext.setAttribute("directorCityList", directorCityList);
pageContext.setAttribute("directorStateList", directorStateList);
pageContext.setAttribute("dirList", dirList);
Collection directorMasterList = null;
int totalCount = 0;
int listSize = 0;
if (searchResult != null) {
	directorMasterList = searchResult.getResultList();
	pageContext.setAttribute("directorMasterList", directorMasterList);
}
%>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
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

  function returnPage(name) {
	    document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value = name;
	    document.forms[0].submit();
	}
	
function saveOtherSystem(name) 
{	
	var dinNo = new String(document.getElementById("dinNo").value);
  	<%
  		Iterator itor = directorMasterList.iterator();
  		while(itor.hasNext()){
  	IDirectorMaster dirMaster = (IDirectorMaster)itor.next();
  	System.out.println(dirMaster.getDinNo());
         %>   
        if('<%=dirMaster.getDinNo().trim()%>' == dinNo)
        {
            alert("Entered Director is already HDFC DIRECTOR.!!!");
        }  
        <%}%>
  	document.forms[0].action = "ManualInputCustomer.do";
      document.forms[0].event.value = name;
      document.forms[0].submit();
      
    
    //alert(document.getElementById("customerNameShort").value);
}
function refreshDirectorRegionId(dropdown)
{

 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'directorRegion';
 var url = '/cms/ManualInputCustomer.do?event=refresh_region_id&countryId='+curSel;
 
 sendLoadDropdownReq(dep, url);
 
}
function refreshDirectorStateId(dropdown)
{

 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'directorState';
 var url = '/cms/ManualInputCustomer.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshDirectorCityId(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'directorCity';
 var url = '/cms/ManualInputCustomer.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ManualInputCustomer.do">
<body>
<input type="hidden" name="event">

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <input type="hidden" value="event"></input>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
           <tr>
    <td width="100%">      
      <h3>Edit Other / Relationship Details</h3>
      <hr />
     
      <table class="tblFormSection" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                	<%if(dirList != null && dirList.size() != 0) {%>
												<logic:present
													name="dirList">
													<logic:iterate id="OB" name="dirList"
														type="com.integrosys.cms.app.customer.bus.OBDirector"
														scope="page" length="10">
														
                   <tr class="odd">
                    <td class="fieldname" width="20%">Director Name</td>
                    <td width="30%"><html:text property="directorName" size="30"
											maxlength="100" value="<%=OB.getDirectorName()%>"></html:text>&nbsp;
											<br><html:errors property="directorNameError"/>
											<html:errors property="directorNameLengthError"/>
											<html:errors property="specialCharactergetDirectorNameError"/>
											</td>
                    <td class="fieldname" width="20%">DIN No.
                    </td>
                    <td width="30%"><html:text property="dinNo" styleId="dinNo" size="15"
											maxlength="9" value="<%=OB.getDinNo()%>"></html:text>&nbsp;
												<br><html:errors property="dinNoError"/>
												<html:errors property="dinNoLengthError"/>
												<html:errors property="specialCharacterDinNoError"/>
											</td>
                  </tr>
                
                     <tr class="odd">
                    <td class="fieldname" width="20%">Related DUNS No.</td>
                    <td width="30%"><html:text property="relatedDUNSNo" size="15"
											maxlength="9" value="<%=OB.getRelatedDUNSNo()%>"></html:text>&nbsp;
											<br><html:errors property="specialCharacterRelatedDUNSNoError"/>
											<html:errors property="relatedDUNSNoLengthError"/>
											</td>
                    <td class="fieldname" width="20%">Related Type<font color="red">*</font></td>
                    <td width="20%" class="even"><html:select property="relatedType" value="<%=OB.getRelatedType()%>">
                           <integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.RELATED_TYPE%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
											<br><html:errors property="relatedTypeError"/>
										</td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname" width="20%">PAN</td>
                    <td width="30%"><html:text property="directorPan" size="15"
											maxlength="10" value="<%=OB.getDirectorPan()%>"></html:text>&nbsp;
											<br><html:errors property="directorPanLengthError"/>
												<html:errors property="specialCharacterDirectorPanError"/>
												<html:errors property="invalidPanError"/>
											</td>
                    <td class="fieldname" width="20%">Relationship<font color="red">*</font></td>
                    <td width="20%" class="even"><html:select property="relationship" value="<%=OB.getRelationship()%>">
                           <integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.RELATIONSHIP_TYPE%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
											<br><html:errors property="relationshipError"/>
										</td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname" width="20%">Business Entity Name</td>
                    <td width="30%"><html:text property="businessEntityName" size="30"
											maxlength="100" value="<%=OB.getBusinessEntityName()%>"></html:text>&nbsp;
											<br><html:errors property="businessEntityNameLengthError"/>
												<html:errors property="specialCharacterBusinessEntityNameError"/>
											</td>
                    <td class="fieldname" width="20%">Individual Name Prefix</td>
                    <td width="30%"><html:text property="namePrefix" size="30"
											maxlength="20" value="<%=OB.getNamePrefix()%>"></html:text>&nbsp;
											<html:errors property="specialCharacterNamePrefixError"/>
											</td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Full Name</td>
                    <td><html:text property="fullName" size="30"
											maxlength="100" value="<%=OB.getFullName()%>"></html:text>&nbsp;
											<br><html:errors property="fullNameLengthError"/>
											<html:errors property="specialCharacterFullNameError"/>
											</td>
                    <td class="fieldname">Percentage of Control</td>
                    <td><html:text property="percentageOfControl" size="10"
											maxlength="6" value="<%=OB.getPercentageOfControl()%>"></html:text>&nbsp;
												<br><html:errors property="percentageOfControlLengthError"/>
											</td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Address 1<font color="red">*</font></td>
                    <td><html:text property="directorAddress1" size="30"
											maxlength="200" value="<%=OB.getDirectorAddress1()%>"></html:text>&nbsp;
											<br><html:errors property="directorAddress1Error"/>
											
											</td>
                    <td class="fieldname">Address 2<font color="red">*</font></td>
                    <td><html:text property="directorAddress2" size="30"
											maxlength="50" value="<%=OB.getDirectorAddress2()%>"></html:text>&nbsp;
											<br><html:errors property="directorAddress2Error"/>
										
											</td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Address 3</td>
                    <td><html:text property="directorAddress3" size="30"
											maxlength="50" value="<%=OB.getDirectorAddress3()%>"></html:text>&nbsp;
											<br><html:errors property="directorAddress3Error"/>
											
											</td>
                    <td class="fieldname">Pincode</td>
                    <td><html:text property="directorPostCode" size="10"
											maxlength="6" value="<%=OB.getDirectorPostCode()%>"></html:text>&nbsp;
											<html:errors property="directorPostCodeLengthError"/>
											<html:errors property="specialCharacterdirectorPostCodeError"/>
											<html:errors property="directorPostcodeError"/></td>
                  </tr>
                  <tr class="odd">
                    <td class="fieldname">Country<font color="red">*</font></td>
										<td><html:select property="directorCountry"
											name="ManualInputCustomerInfoForm"
											onchange="javascript:refreshDirectorRegionId(this)" value="<%=OB.getDirectorCountry()%>">
											<option value="">-Select-</option>
											<html:options collection="directorCountryList" labelProperty="label"
												property="value" />
										</html:select>
										<br><html:errors property="directorCountryError"/>
										</td>
                   <td class="fieldname">Region<font color="red">*</font></td>
										<td><html:select property="directorRegion"
											name="ManualInputCustomerInfoForm"
											onchange="javascript:refreshDirectorStateId(this)" value="<%=OB.getDirectorRegion()%>">
											<option value="">-Select-</option>
											<html:options collection="directorRegionList" labelProperty="label"
												property="value" />
										</html:select>
										<br><html:errors property="directorRegionError"/>
										</td>
                  </tr>
                  <tr class="even">
                   <td class="fieldname">State<font color="red">*</font></td>
										<td><html:select property="directorState"
											name="ManualInputCustomerInfoForm"
											onchange="javascript:refreshDirectorCityId(this)" value="<%=OB.getDirectorState()%>">
											<option value="">-Select-</option>
											<html:options collection="directorStateList" labelProperty="label"
												property="value" />
										</html:select>
										<br><html:errors property="directorStateError"/>
										</td>
                    <td class="fieldname">City<font color="red">*</font></td>
										<td><html:select property="directorCity"
											name="ManualInputCustomerInfoForm" value="<%=OB.getDirectorCity()%>">
											<option value="">-Select-</option>
											<html:options collection="directorCityList" labelProperty="label"
												property="value" />
										</html:select>
											<br><html:errors property="directorCityError"/>
										</td>
                  </tr>
                  
                  <tr class="odd">
                    <td class="fieldname">Telephone Number</td>
                    <td><html:text property="dirStdCodeTelNo" size="5"
											maxlength="5" value="<%=OB.getDirStdCodeTelNo()%>"></html:text>
                     <html:text property="directorTelNo" size="20"
											maxlength="15" value="<%=OB.getDirectorTelNo()%>"></html:text>&nbsp;
											<br><html:errors property="directorTelNoLengthError"/>
												<html:errors property="specialCharacterDirectorTelNoError"/>
											</td>
                    <td class="fieldname">Fax No.</td>
                    <td><html:text property="dirStdCodeTelex" size="5"
											maxlength="5" value="<%=OB.getDirStdCodeTelex()%>"></html:text>
                      <html:text property="directorFax" size="20"
											maxlength="15" value="<%=OB.getDirectorFax()%>"></html:text>&nbsp;
											<br><html:errors property="directorFaxLengthError"/>
												<html:errors property="specialCharacterDirectorFaxError"/>
											</td>
                  </tr>
                  <tr class="even">
                    <td class="fieldname">Email</td>
                    <td><html:text property="directorEmail" size="30"
											maxlength="50" value="<%=OB.getDirectorEmail()%>"></html:text>&nbsp;
											<br><html:errors property="directorEmailError"/>
											</td>
                    <td class="fieldname">AADHAR Number</td>
                    <td><html:text property="directorAadhar" size="30"
											maxlength="75" value="<%=OB.getDirectorAadhar()%>"></html:text>&nbsp;
											<br><html:errors property="directorAadharLengthError"/>
											<html:errors property="directorAadharLengthLessError"/>
											<html:errors property="directorAadharCharacterError"/>
											<html:errors property="directorAadharNumberError"/>
											</td>
											
                  </tr>
                  </logic:iterate>
                  </logic:present>
                  <%} %>
                 
        </table>
      </td>
    </tr>
    </tbody></table>
    

<%--@ include file="/customer/view_credit_rating.jsp"--%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>    
   <%if(event.equals("edit_director")){ %>  
      <td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_edited_director')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('display_cibil_details')"/></a>	        	
      </td>
      	<%}else if(event.equals("edit_director_in_edit")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_edited_director_in_edit')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('edit_summary_details')"/></a>	        	
      </td>
      	
      	 	<%}else if(event.equals("edit_director_in_resubmit")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_edited_director_in_resubmit')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('process_summary_details')"/></a>	        	
      </td>
      	
      	<%} %>
  </tr>
 
</table>
</td></tr></table>
</td></tr></thead></table>
<!-- InstanceEndEditable -->
</body>
<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
	<html:hidden name="ManualInputCustomerInfoForm"property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
    <html:hidden name="ManualInputCustomerInfoForm" property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyGroupName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />		
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rbiIndustryCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	<html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />
	<html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" /> 
	<html:hidden name="ManualInputCustomerInfoForm" property="industryName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
		<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	
	<input type="hidden" name="index" value="<%=index %>"/>
	 <html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
	<html:hidden name="ManualInputCustomerInfoForm" property="bankingMethod" />
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalNonFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="fundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="nonFundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm" property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="nonFundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
	<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
	<!--End Santosh LEI CR  -->		
	<html:hidden name="ManualInputCustomerInfoForm" property="system" />

	<html:hidden name="ManualInputCustomerInfoForm" property="systemCustomerId" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeState" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeState" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="borrowerDUNSNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity1" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity2" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity3" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="willfulDefaultStatus" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitFilledStatus" />

	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfSuit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="suitAmount" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relatedType" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationship" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorEmail" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorFax" />
		
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorAadhar" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="dirStdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="dirStdCodeTelNo" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorTelNo" />
		
	 
<html:hidden name="ManualInputCustomerInfoForm"
		property="directorCountry" />
		
	
<html:hidden name="ManualInputCustomerInfoForm"
		property="directorState" />
		
      
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorCity" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorRegion" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorPostCode" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorAddress3" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorAddress2" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorAddress1" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="percentageOfControl" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fullName" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="namePrefix" />
		

	<html:hidden name="ManualInputCustomerInfoForm"
		property="businessEntityName" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorPan" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relatedDUNSNo" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="dinNo" />
		
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="directorName" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="branchCode" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag" styleId="panValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated" styleId="isPanValidated" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="form6061Checked" styleId="form6061Checked" />

	    <html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
	<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
		
		
		<html:hidden name="ManualInputCustomerInfoForm" property="directorName" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="isRBIWilfulDefaultersList" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="nameOfBank" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isDirectorMoreThanOne" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="nameOfDirectorsAndCompany" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfDefault" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="extOfCompromiseAndWriteoff" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isCibilStatusClean" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfCleanCibil" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isBorrDefaulterWithBank" />
		
			<html:hidden name="ManualInputCustomerInfoForm" property="vendorName" />
	
	    <jsp:include page="cri_hidden_details.jsp"></jsp:include>
	    <jsp:include page="udf_hidden_details.jsp"></jsp:include>
</html:form>

<!-- InstanceEnd -->
</html>
