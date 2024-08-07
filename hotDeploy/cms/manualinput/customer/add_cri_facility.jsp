<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
                 
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.directorMaster.bus.IDirectorMaster"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
request.setAttribute("ManualInputCustomerInfoForm",customer);

String strRefId = customer.getCifId();

String index = (String) request.getAttribute("index");
String event = (String)  session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.event");
if(index == null || index == "")
{
	index="0";
}

SearchResult searchResult = (SearchResult) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorMasterList");
Collection directorMasterList = null;
	int totalCount = 0;
	int listSize = 0;
	if (searchResult != null) {
		directorMasterList = searchResult.getResultList();
		pageContext.setAttribute("directorMasterList", directorMasterList);
	}
List facilityList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facilityList");

pageContext.setAttribute("facilityList",facilityList);

//--------------------------------------------------------
List serialNoList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.serialNoList");

pageContext.setAttribute("serialNoList",serialNoList);

String[] revisedArr1 = customer.getRevisedEmailIdsArray();
String[] revisedArr = customer.getRevisedEmailIdsArray();
int len = 0;

customer.setRevisedEmailIdsArray(customer.getRevisedEmailIdsArray());

if(customer != null){
	if(customer.getRevisedEmailIdsArray() != null){
		for(int i=0; i<customer.getRevisedEmailIdsArray().length;i++){
			System.out.println("cibil details=>+++++customer.getRevisedEmailIdsArray()--=======>"+customer.getRevisedEmailIdsArray()[i].toString()+" ** customer.getRevisedEmailIdsArray().length=>"+customer.getRevisedEmailIdsArray().length);
		}
	}
}


List revisedArr22 = customer.getRevisedArrayListN();


if(customer != null){
	if(customer.getRevisedEmailIdsArray() != null){
		len = revisedArr1.length;
		revisedArr = new String[len];
		for(int i=0; i<customer.getRevisedEmailIdsArray().length;i++){
			revisedArr[i] = revisedArr1[i];
			System.out.println("I="+i+" ** revisedArr[i]===>"+revisedArr[i]);
		}
	}
}  

System.out.println("Revised ArrayList create cibil method =>"+customer.getRevisedArrayListN());
/* List arr12 = value.getRevisedArrayListN();
System.out.println("arr12.size()=>"+arr12.size());
pageContext.setAttribute("arr12",arr12); */
pageContext.setAttribute("revisedArr",revisedArr);
int cnt = 0;

%>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxCriFacility.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxCriTranch.js"></script>
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
  	document.forms[0].action = "ManualInputCustomer.do";
      document.forms[0].event.value = name;
      document.forms[0].submit();
  }

  function refreshFacility(dropdown)    {
	 var curSel = "";
	
	 for(i=0; i<dropdown.options.length; i++) {
		if (dropdown.options[i].selected == true)	{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'facilityName';
	 var url = '/cms/ManualInputCustomer.do?event=refresh_facility_list&facilityFor='+curSel+'&referenceId='+document.forms[0].strRefId.value;
	 
	 sendLoadDropdownReq(dep, url);

	 shwHideTranch(curSel);
}

 function shwHideTranch(curSel) {
	 document.getElementById('tranchshwHidPriority').style.display = 'none'; 
	 document.getElementById('tranchshwHidEstate').style.display = 'none'; 
	 document.getElementById('tranchshwHid').style.display = 'none';
	 document.getElementById('tranchshwHid1').style.display = 'none';
	 //clear all
	 document.getElementById('facilityAmount').value='';
	 document.getElementById('lineNo').value='';
	 document.getElementById('serialNo').value='';
	 document.getElementById('estateType').value='';
	 document.getElementById('commRealEstateType').value='';
	 document.getElementById('tempCommRealEstateType').value='';
	 document.getElementById('prioritySector').value='';
	 document.getElementById('tempPrioritySector').value='';
	 
	 if(curSel == "Priority/Non priority Sector"){
		 document.getElementById('tranchshwHidPriority').style.display = ''; 
		 document.getElementById('tranchshwHid').style.display = '';
		 document.getElementById('tranchshwHid1').style.display = ''; 
	 }
	 if(curSel == "Capital Market Exposure"){
		 document.getElementById('tranchshwHid').style.display = '';
		 document.getElementById('tranchshwHid1').style.display = ''; 
	 }
	 if(curSel == "Real Estate Exposure"){
		 document.getElementById('tranchshwHidEstate').style.display = ''; 
		 document.getElementById('tranchshwHid').style.display = ''; 
		 document.getElementById('tranchshwHid1').style.display = '';
	 }
 }
  

  function refreshFacilityDetail(dropdown)    {
		 var curSel = "";
		
		 for(i=0; i<dropdown.options.length; i++) {
			if (dropdown.options[i].selected == true)	{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 var dep = 'serialNo';
		 var url = '/cms/ManualInputCustomer.do?event=refresh_facility_detail_list&facilityName='+curSel+'&referenceId=' +
		 document.forms[0].strRefId.value+'&facilityFor='+document.forms[0].facilityFor.value;
		 
		 sendLoadCriFacReq(dep, url);
	}

  function refreshTranchDetail(dropdown)    {
		 var curSel = "";
		
		 for(i=0; i<dropdown.options.length; i++) {
			if (dropdown.options[i].selected == true)	{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 var dep = 'estateType';
		 var url = '/cms/ManualInputCustomer.do?event=refresh_tranch_detail_list&serialNo='+curSel+'&referenceId=' +
		 document.forms[0].strRefId.value+'&facilityName='+document.forms[0].facilityName.value;
		 
		 sendLoadCriTranchReq(dep, url);
	}


</script>

<!-- InstanceEndEditable -->
</head>
<html:form action="ManualInputCustomer.do">
<body>
<input type="hidden" name="event">
<input type="hidden" name="strRefId" value="<%=strRefId %>">
<input type="hidden" name="referenceId" value="<%=strRefId %>">
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
       
           <tr>
    <td width="100%">      
      <h3>Add Facility and Amount</h3>
      <hr />
     
      <table class="tblFormSection" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="1" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                   <tr class="odd" >
                    <td class="fieldname" width="20%">Facility For<font color="red">*</font></td>
                    <td width="30%" colspan="3"><html:select property="facilityFor"  onchange="javascript:refreshFacility(this)">
                    				<html:option value="">Please Select</html:option>
                    				<%if(customer.getIsKisanCreditCard().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Kisan Credit Card"></html:option>
                    				<%}
                    				 if(customer.getIsProjectFinance().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Project Finance"></html:option>
                    				<%}
                    				 if(customer.getIsInfrastructureFinanace().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Infrastructure Finance"></html:option>
                    				<%}
                    				 if(customer.getIsPermenentSsiCert().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Permanent SSI Certificate"></html:option>
                    				<%}
                    				 if(customer.getIsBackedByGovt().equalsIgnoreCase("State") || customer.getIsBackedByGovt().equalsIgnoreCase("Central")) { %>
                    				<html:option value="Backed by Govt."></html:option>
                    				<%} if(customer.getIsPrioritySector().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Priority/Non priority Sector"></html:option>
                    				<%} if(customer.getIsCapitalMarketExpos().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Capital Market Exposure"></html:option>
                    				<%} if(customer.getIsRealEstateExpos().equalsIgnoreCase("Yes")) { %>
                    				<html:option value="Real Estate Exposure"></html:option>
                    				<%} %>
									</html:select>
									<html:errors property="facilityFor"/>
									</td>
                    
                  </tr>
                     <tr class="odd">
                    <td class="fieldname" width="20%">Facility Name<font color="red">*</font></td>
                    <td width="30%">
									<html:select property="facilityName"   onchange="javascript:refreshFacilityDetail(this)">
									<html:option value="">Please Select</html:option>
									<html:options collection ="facilityList" labelProperty ="label" property ="value"/>
									</html:select>
											<html:errors property="facilityName"/>
											</td>
                    <td class="fieldname" width="20%">Facility Amount <font color="red">*</font></td>
                    <td width="20%" class="even"><html:text property="facilityAmount" maxlength="21"  styleId="facilityAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
										<br><html:errors property="facilityAmount"/>
					</td>
                  </tr>
                   <tr class="odd" id="tranchshwHid" style="background:transparent;height:auto;border:0 none;display:none;">
                    <td width="20%">&nbsp;</td>
                    <td width="30%">
									&nbsp;
											</td>
                    <td width="20%">&nbsp;</td>
                    <td width="20%" >&nbsp;
					</td>
                  </tr>
                   <tr class="odd" id="tranchshwHid1" style="background:transparent;height:auto;border:0 none;display:none;">
                   <td class="fieldname" width="20%">Line No. </td>
                    <td width="20%" class="even"><html:text property="lineNo" maxlength="21" readonly="true" value="<%=customer.getLineNo() %>"/>
										<br>
					</td>
                    <td class="fieldname" width="20%">Serial No. <font color="red">*</font></td>
                    <td width="30%">
									<html:select property="serialNo"  style="width:150" onchange="javascript:refreshTranchDetail(this)" >
									<html:option value="">Please Select</html:option>
									<html:options collection ="serialNoList" labelProperty ="label" property ="value" />
									</html:select><html:errors property="serialNo"/>								
					</td>
                    
                  </tr>
                   <tr class="odd" id="tranchshwHidEstate" style="background:transparent;height:auto;border:0 none;display:none;">
                   <td class="fieldname" width="20%">Estate Type </td>
                    <td width="20%" class="even">
                    <html:text property="estateType" readonly="true"/>
										<br>
					</td>
                     <td class="fieldname" width="20%">Commercial Real Estate Type</td>
                    <td width="20%" class="even">
                    <html:select property="tempCommRealEstateType" value="<%=customer.getCommRealEstateType() %>" disabled="true">
                  	<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" descWithCode="false" />   
					</html:select>
					<html:hidden property="commRealEstateType" />
					<br>
					</td>
                  </tr>
                   <tr class="odd" id="tranchshwHidPriority" style="background:transparent;height:auto;border:0 none;display:none;">
                   <td class="fieldname" width="20%">Priority Sector </td>
                    <td width="20%" class="even" >
                    
                    <html:select property="tempPrioritySector" disabled="true" value="<%=customer.getPrioritySector() %>">
                  	<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" descWithCode="false" />   
					</html:select>
					<html:hidden property="prioritySector" />
										<br>
					</td>
                     <td width="20%">&nbsp;</td>
                    <td width="20%">&nbsp;
					</td>
                  </tr>
                 <script type="text/javascript">
    <% if(customer.getFacilityFor() != null && !customer.getFacilityFor().equals("")) { %>
    <% if(customer.getFacilityFor().equalsIgnoreCase("Priority/Non priority Sector")) { %>
		 document.getElementById('tranchshwHidPriority').style.display = ''; 
		 document.getElementById('tranchshwHid').style.display = '';
		 document.getElementById('tranchshwHid1').style.display = ''; 
	<% }else 
	 if(customer.getFacilityFor().equalsIgnoreCase("Capital Market Exposure")) {%>
		 document.getElementById('tranchshwHid').style.display = '';
		 document.getElementById('tranchshwHid1').style.display = ''; 
		 <% }else 
	 if(customer.getFacilityFor().equalsIgnoreCase("Real Estate Exposure")) { %>
		 document.getElementById('tranchshwHidEstate').style.display = ''; 
		 document.getElementById('tranchshwHid').style.display = ''; 
		 document.getElementById('tranchshwHid1').style.display = '';
	<% } %>
	<% } %>
    </script>
        </table>
    
      </td>
    </tr>
    
    <logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str1 = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str1);
										%>
										<tr>
											<td><html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str1%>"/></td>
										</tr>
										<%cnt++;
										%>
									</logic:iterate>
								</logic:present>
    
    
    </tbody></table>
    

<%--@ include file="/customer/view_credit_rating.jsp"--%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>    
   <%if(event.equals("add_cri_fac_list")){ %>  
      <td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_cri_fac_list')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('display_cri_details')"/></a>	        	
      </td>
      	<%}else if(event.equals("edit_cri_fac_list")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('edit_cri_facility')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('edit_cri_details')"/></a>	        	
      </td>
      	
      	 	<%}else if(event.equals("process_cri_fac_list")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('process_cri_facility')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('process_cri_details')"/></a>	        	
      </td>
      	
      	<%} %>
  </tr>
 	<html:hidden name="ManualInputCustomerInfoForm" property="serialNo"/>
	
	<html:hidden name="ManualInputCustomerInfoForm" property="facilityName"  />
	<html:hidden name="ManualInputCustomerInfoForm" property="finalBankMethodList" />
<html:hidden name="ManualInputCustomerInfoForm" property="leadValue" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" />
</table>
</td></tr></table>
</td></tr></thead></table>
<!-- InstanceEndEditable -->
</body>
<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
<jsp:include page="udf_hidden_details.jsp"></jsp:include>
</html:form>
 
<!-- InstanceEnd -->
</html>
