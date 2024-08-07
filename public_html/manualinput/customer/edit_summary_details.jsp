
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamDao"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamEntry"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,java.math.BigDecimal,com.integrosys.base.businfra.currency.Amount,
	com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page
	import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<%
	//List relationshipMgrList = null;
	List partyGroupList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupList");
	List rmRegionList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rmRegionList");
	List rbiIndustryCodeList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rbiIndustryCodeList");
	List relationshipMgrList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.relationshipMgrList");
	List countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryList");
	List regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionList");
	List cityList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityList");
	List stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateList");
			
	ICMSCustomer custObj = (ICMSCustomer) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.OBCMSCustomerNew");
	
	ICMSCustomer custObjActual = (ICMSCustomer) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.OBCMSCustomerActual");

	String rmRegionName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rmRegionName");
	String relManagerName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.relManagerName");
	
	
	String scfStatus=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.scfStatus");
	System.out.println("--------------------------scfStatus-------------------------");	
	String scfErrMsg=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.scfErrMsg");
	System.out.println("--------------------------scfErrMsg------------------------");	
	String scfFlag=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.scfFlag");
	System.out.println("--------------------------scfFlag------------------------");
		
	String ecbfStatus=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ecbfStatus");
	System.out.println("--------------------------ecbfStatus-------------------------");
	String ecbfErrMsg=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ecbfErrMsg");
	System.out.println("--------------------------ecbfErrMsg------------------------");	
	String ecbfFlag=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ecbfFlag");
	System.out.println("--------------------------ecbfFlag------------------------"); 
	
	String panNo = "";
	String nameAsPerPan="";
	String dob="";
	char isPanValid = ' ';
	try{
		 if(null != custObj ){
			 SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
			 panNo=custObj.getPan();
			 isPanValid=custObj.getIsPanValidated();
			 nameAsPerPan=custObj.getPartyNameAsPerPan();
			 dob=sdf.format(custObj.getDateOfIncorporation());
		 }
		
	 }catch(Exception e){e.printStackTrace();}

	String leiCode = "";
	char isLeiValid = ' ';
	try{
		 if(null != custObj ){
			 leiCode=custObj.getLeiCode();
			 isLeiValid=custObj.getIsLeiValidated();
		 }
		
	 }catch(Exception e){e.printStackTrace();}
	
	String lastModifiedDate = "";
	String lastValidatedDateStr ="";
	String lastModifiedLeiDate = "";
	String lastValidatedLeiDateStr ="";
	SimpleDateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	String systemDate= df.format(new Date());

	try{
	if(null != custObj.getLastModifiedOn()){
		lastModifiedDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(custObj.getLastModifiedOn());
	}
	 }catch(Exception e){e.printStackTrace();}
	Date lastValidatedDate = (Date) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.lastValidatedDate");
	
	if(null !=lastValidatedDate){
		lastValidatedDateStr = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(lastValidatedDate);
	}
	
	try{
	if(custObj.getLastModifiedOn()!=null){
		lastModifiedLeiDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(custObj.getLastModifiedOn());
	}
	 }catch(Exception e){e.printStackTrace();}
	
	Date lastValidatedLeiDate = (Date) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.lastValidatedLeiDate");
	
	if(lastValidatedLeiDate!=null){
		lastValidatedLeiDateStr = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(lastValidatedLeiDate);
	}

	List systemBranchList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.systemBranchList");
	if (!(null == systemBranchList )) {
		TreeMap soretedMap= new TreeMap();
		for(int i=0;i<systemBranchList.size();i++)
		{
			OBSystemBankBranch ob=(OBSystemBankBranch)systemBranchList.get(i);
			
				soretedMap.put(ob.getSystemBankBranchCode().toUpperCase(),ob);	
		}
		systemBranchList = new ArrayList(soretedMap.values());
	}
	List systemList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.systemList");
	List vendorList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.vendorList");

	System.out.println("----------Party group list on jsp is  ----    "
			+ partyGroupList.size());
	OBSystemBankBranch systemBank = (OBSystemBankBranch) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchObj");
	if (!(null == partyGroupList)) {
		
		pageContext.setAttribute("partyGroupList", partyGroupList);
		//request.setAttribute("otherBankList", otherBankList);
	}
if (!(null == systemBranchList)) {
		
		pageContext.setAttribute("systemBranchList", systemBranchList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(null == rmRegionList  )) {
		
		pageContext.setAttribute("rmRegionList", rmRegionList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(null == relationshipMgrList)) {
		
		pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
		//request.setAttribute("otherBankList", otherBankList);
	}
    if (!(null== rbiIndustryCodeList)) {
		
	pageContext.setAttribute("rbiIndustryCodeList", rbiIndustryCodeList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	
	if (!(null == countryList)) {
		
		pageContext.setAttribute("countryList", countryList);
		//request.setAttribute("otherBankList", otherBankList);
	}if (!(null == regionList)) {
		
		pageContext.setAttribute("regionList", regionList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(null==cityList)) {
		
		pageContext.setAttribute("cityList", cityList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(null == stateList )) {
		
		pageContext.setAttribute("stateList", stateList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	

	if (!(null==systemList)) {
		
		pageContext.setAttribute("systemList", systemList);
		//request.setAttribute("systemList", systemList);
	}
	else 
	{
		pageContext.setAttribute("systemList", new ArrayList());
	}

if (!(null == vendorList )) {
		
		pageContext.setAttribute("vendorList", vendorList);
		//request.setAttribute("systemList", systemList);
	}
	else 
	{
		pageContext.setAttribute("vendorList", new ArrayList());
	}

	int sno = 0;
	int no = 0;
	int vno = 0;

	//if (sr != null) {
	// relationshipMgrList = new ArrayList(sr.getResultList());
	//pageContext.setAttribute("relationshipMgrList",
	//		relationshipMgrList);
	//}

	//String event = request.getParameter("event");
	//pageContext.setAttribute("partyGroupList", sr);
	//int sno = 0;
	//int startIndex=0;
	//int counter=1;
	//String ind= (String) request.getAttribute("startIndex");
	//if(ind!=null && (!ind.equals("")))
	//{
	//	 startIndex = Integer.parseInt(ind);

	//}
%>
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
	
	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
	System.out.println(value );
	
	
	IGeneralParamDao generalParamDao =(IGeneralParamDao)BeanHouse.get("generalParamDao");
	IGeneralParamEntry generalParamEntry  =generalParamDao.getGeneralParamEntryByParamCodeActual("VALIDATE_PAN_WITH_NSDL");
	String paramValue = generalParamEntry.getParamValue();
	IGeneralParamEntry generalParamEnt  =generalParamDao.getGeneralParamEntryByParamCodeActual("VALIDATE_LEI_WITH_CCIL");
	String leiParamValue = generalParamEnt.getParamValue();
	System.out.println("leiParamValue ->"+leiParamValue);
	
	
	String[] revisedArr1 = value.getRevisedEmailIdsArray();
	 String[] revisedArr = value.getRevisedEmailIdsArray();
	 int len = 0;
	 
	 value.setRevisedEmailIdsArray(value.getRevisedEmailIdsArray());
	 
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
				System.out.println("cibil details=>+++++value.getRevisedEmailIdsArray()--=======>"+value.getRevisedEmailIdsArray()[i].toString()+" ** value.getRevisedEmailIdsArray().length=>"+value.getRevisedEmailIdsArray().length);
			}
		}
	}
	
	
	List revisedArr22 = value.getRevisedArrayListN();
	 
	
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			len = revisedArr1.length;
			revisedArr = new String[len ];
			for(int i=0; i<value.getRevisedEmailIdsArray().length ;i++){
				revisedArr[i] = revisedArr1[i];
				System.out.println("I="+i+" ** revisedArr[i]===>"+revisedArr[i]);
			}
		}
	}  
	
	System.out.println("Revised ArrayList create cibil method =>"+value.getRevisedArrayListN());
	/* List arr12 = value.getRevisedArrayListN();
	System.out.println("arr12.size()=>"+arr12.size());
	pageContext.setAttribute("arr12",arr12); */
	pageContext.setAttribute("revisedArr",revisedArr);
	int cnt = 0;
%>



<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="java.util.TreeMap"%>
<head>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>




<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<script language="JavaScript" type="text/JavaScript"><!--
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

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


function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}
function checkboxStatusActive(){

	 if(document.getElementById("status").value=='')
	{
		document.getElementById("status").value= "ACTIVE";
	}
	else
	{
		document.getElementById("status").value= "ACTIVE";	
	}
	addDetail();
}
function checkboxStatusInactive(){

		document.getElementById("status").value= "INACTIVE";
	addDetail();
}

function addParty(){
	document.getElementById('addParty').style.display = '';
	document.getElementById('addSystemDetails').style.display = '';
	document.getElementById('addSystemDetails2').style.display = '';
	document.getElementById('coBorrowerDetailsBlockHeader').style.display = '';
	document.getElementById('coBorrowerDetailsBlock').style.display = '';
	document.getElementById('hrline').style.display = '';
	openVendorBlock();
	addDetail();
	
}

 function openVendorBlock(){
document.getElementById('addVendorDetails').style.display = '';
document.getElementById('addVendorDetails2').style.display = '';
document.getElementById('hrline1').style.display = '';
} 
function addSystem(name){
	document.forms[0].action="ManualInputCustomer.do?event="+name;
	
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
 var url = '/cms/ManualInputCustomer.do?event=refresh_region_id&countryId='+curSel;
 
 sendLoadDropdownReq(dep, url);
 
}
function getAction(id,name,ind) {
	
	var type = document.getElementById("actionType"+ind).value;
	
	 if(type =="Edit"){
		
		document.forms[0].action = "ManualInputCustomer.do?systemCustomerId=" +id +"&system="+name+"&index="+ind;		
		
	    	document.forms[0].event.value = "edit_system_in_edit";
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "ManualInputCustomer.do?systemCustomerId=" +id +"&system="+name+"&index="+ind;		
    	document.forms[0].event.value = "delete_system_in_edit";
    	document.forms[0].submit();
	}	    
}
function getvendorAction(name,id,ind) {
	
	var type = document.getElementById("action"+ind).value;
	
	 if(type =="Edit"){
		
		document.forms[0].action = "ManualInputCustomer.do?vendorName=" +name +"&vendorId="+id+"&index="+ind;		
		document.forms[0].event.value = "edit_vendor_in_edit";
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "ManualInputCustomer.do?vendorName=" +name +"&vendorId="+id+"&index="+ind;		
    	document.forms[0].event.value = "delete_vendor_in_edit";
    	document.forms[0].submit();
	}	    
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
 var url = '/cms/ManualInputCustomer.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function makeUppercase() {
	
	document.getElementById("customerNameShort").value = document.getElementById("customerNameShort").value.toUpperCase();
	}

function addDetail(){
	makeUppercase();
	document.getElementById('name').value = document.getElementById('customerNameShort').value;
	document.getElementById('sts').value = document.getElementById('status').value;
	document.getElementById('segment').value = document.getElementById('customerSegment')[document.getElementById('customerSegment').selectedIndex].innerHTML;
	document.getElementById('branch').value = document.getElementById('mainBranch').value;

	

}

function changeNameAsPerPan(){
	document.getElementById('partyNameAsPerPan').value = document.getElementById('customerNameShort').value;
}

function makeUpperCasePan() {
	document.getElementById("partyNameAsPerPan").value = document.getElementById("partyNameAsPerPan").value.toUpperCase();
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
 var dep = 'city';
 var url = '/cms/ManualInputCustomer.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function refreshRelationshipMgrId(dropdown)
{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'relationshipMgr';
	 var url = '/cms/ManualInputCustomer.do?event=refresh_rm_id&regionId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
function ladSelected()
{
	alert('LAD Cycle is selected.');
}
function docSelected()
{
	alert('DOC Cycle is selected.');
}

function hideCinLlpin(dropdown) 
{
	
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}
		if(curSel == 22 || curSel == "PVT.LTD." || curSel == "LIMITED" ) {
	    	document.getElementById("cin").style.visibility = "visible";
	    }
		else {
		    document.getElementById("cin").style.visibility = "hidden";
		}

	 }
}

function refreshRbiIndustryCode(dropdown)
{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'rbiIndustryCode';
	 var url = '/cms/ManualInputCustomer.do?event=refresh_rbi_industry_code&industryName='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
	
function checkboxForForm6061(){

	if(document.getElementById("form6061Checked").value=='N'){
		document.getElementById("form6061Checked").value= "Y";
	}else if(document.getElementById("form6061Checked").value==''){
		document.getElementById("form6061Checked").value= "Y";
	}else{
		document.getElementById("form6061Checked").value= "N";
	}
	
}

function validatePANNo(){

	var pan = document.getElementById('pan').value;
	var partyNameAsPerPan = document.getElementById('partyNameAsPerPan').value;
	var dateOfIncorporation = document.getElementById('dateOfIncorporation').value;
	
	if(pan!=null && pan!=""){
		if(pan.length != 10){
			alert("Pan No length should be of 10 character");
			return false;
		}
		
		if(partyNameAsPerPan === ""){
			alert("Please enter 'Party name as per PAN' to validate PAN");
			return false;
		}
		
		if(dateOfIncorporation === ""){
			alert("Please enter 'Date of Birth/Incorporation' to validate PAN");
			return false;
		}
		
		//To perform PANNO appropriate value validation
        var ObjVal = pan;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        if (ObjVal.search(panPat) == -1) {
            alert('Invalid Pan No');
            return false;
        }
		
		//Check if PAN already validated

		if(pan == '<%=panNo%>' && "Y"=='<%=isPanValid%>'
				&& partyNameAsPerPan == '<%=nameAsPerPan%>'
				&& dateOfIncorporation == '<%=dob%>'){

			
			if(confirm("PAN "+pan +" is Already validated. Last Modified date :'<%=lastModifiedDate%>' and last validated date is : '<%=lastValidatedDateStr%>' Do you still want to validate the PAN No? ")==true){
			
				<%if("Y".equalsIgnoreCase(paramValue)){%>
			
				var xmlhttp;
				if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}else{// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				
				xmlhttp.onreadystatechange=function()
				{
				 //alert("readyState: "+xmlhttp.readyState);
				 //alert("status: "+xmlhttp.status);
				 if (xmlhttp.readyState==4 && xmlhttp.status==200)
				 {
				 	if(confirm(xmlhttp.responseText) == true){
				 		document.getElementById('panNSDLResTemp').innerHTML =  xmlhttp.responseText;
				 		
						if(document.getElementById('panNSDLResTemp').innerHTML.indexOf("PAN STATUS :E")!= -1){
				 			document.getElementById("displayImgForPANValidation").style.display = "inline-block";
				 		}else{
					 		document.getElementById("displayImgForPANValidation").style.display = "none";
					 	}
				 	}else{
				 		document.getElementById("displayImgForPANValidation").style.display = "none";
				 	}
				 	
				 	if(document.getElementById('panNSDLResTemp').innerHTML.indexOf("PAN STATUS :E")!= -1){
				 		document.getElementById('isPanValidated').value='Y';
				 	}else{
				 		document.getElementById('isPanValidated').value='N';
				 	}
				 	
				 	document.getElementById('panValGenParamFlag').value='<%=paramValue%>';
				 }
				}
				
				var partyNameAsPerPanEncoded = encodeURIComponent(partyNameAsPerPan);
				xmlhttp.open("GET","/cms/ManualInputCustomer.do?event=validate_pan_no_with_NSDL&panNo="+pan+"&dateOfIncorporation="+dateOfIncorporation+"&partyNameAsPerPan="+partyNameAsPerPanEncoded,true);
				xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xmlhttp.send();
				
			<%}else{%>
				alert("Web service is down, so PAN No will not be validated with NSDL.General Param Field 'Validate PAN with NSDL' value is N. ");
			<%}%>
			
			}else{
				return true;
			}		
	}else{
	
		<%if("Y".equalsIgnoreCase(paramValue)){%>
			
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
			}else{// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlhttp.onreadystatechange=function()
			{
			 //alert("readyState: "+xmlhttp.readyState);
			 //alert("status: "+xmlhttp.status);
			 if (xmlhttp.readyState==4 && xmlhttp.status==200)
			 {
			 	if(confirm(xmlhttp.responseText) == true){
			 		document.getElementById('panNSDLResTemp').innerHTML =  xmlhttp.responseText;
			 		
					if(document.getElementById('panNSDLResTemp').innerHTML.indexOf("PAN STATUS :E")!= -1){
			 			document.getElementById("displayImgForPANValidation").style.display = "inline-block";
			 		}else{
				 		document.getElementById("displayImgForPANValidation").style.display = "none";
				 	}
			 	}else{
			 		document.getElementById("displayImgForPANValidation").style.display = "none";
			 	}
			 	
			 	if(document.getElementById('panNSDLResTemp').innerHTML.indexOf("PAN STATUS :E")!= -1){
			 		document.getElementById('isPanValidated').value='Y';
			 		document.all.isPanValidated.value='Y';
			 	}else{
			 		document.getElementById('isPanValidated').value='N';
			 		document.all.isPanValidated.value='N';
			 	}
			 	
			 	document.getElementById('panValGenParamFlag').value='<%=paramValue%>';
			 	document.all.panValGenParamFlag.value='<%=paramValue%>';
			 }
			}
			var partyNameAsPerPanEncoded = encodeURIComponent(partyNameAsPerPan);
			xmlhttp.open("GET","/cms/ManualInputCustomer.do?event=validate_pan_no_with_NSDL&panNo="+pan+"&dateOfIncorporation="+dateOfIncorporation+"&partyNameAsPerPan="+partyNameAsPerPanEncoded,true);
			xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlhttp.send();
			
		<%}else{%>
			alert("Web service is down, so PAN No will not be validated with NSDL.General Param Field 'Validate PAN with NSDL' value is N. ");
		<%}%>
		}
	}else{
		alert("Please enter PAN No to validate");
	}
}

function checkboxForDeferLEI()
{
	var x =document.getElementById("defer").checked;
		if (x == true) {
		document.getElementById("deferLEI").value="Y";
		document.getElementById("defer").value="Y";
		}
	else
		{
		document.getElementById("deferLEI").value="N";
		document.getElementById("defer").value="N";
		}	
}

function changeLeiDetails(){
	var xmlhttp;
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("GET","/cms/ManualInputCustomer.do?event=validate_lei_details_change",true);	
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();
	document.getElementById("displayImgForLEIValidation").style.display = "none";
}

function validateLEICode(){
	var leiExpDate ="";
	var lei = document.getElementById('lei').value;
	var deferLEI = document.getElementById('deferLEI').value;
	if(deferLEI!="Y"){
	if(lei!=null && lei!=""){
		if(lei.length != 20){
			alert("LEI Code length should be of 20 character");
			return false;
		}
		
        var ObjVal = lei;
        var leiPat = /^[0-9]{4}[0]{2}[A-Z0-9]{12}[0-9]{2}$/;
        if (ObjVal.search(leiPat) == -1) {
            alert('Invalid LEI Code');
            return false;
        }
 //Check if LEI already validated

if(lei == '<%=leiCode%>' && "Y"=='<%=isLeiValid%>'){

	
	if(confirm("LEI "+lei +" is Already validated. Last Modified date :'<%=lastModifiedLeiDate%>' and last validated date is : '<%=lastValidatedLeiDateStr%>' Do you still want to validate the LEI Code? ")==true){
	
		<%if("Y".equalsIgnoreCase(leiParamValue)){%>
	
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlhttp.onreadystatechange=function()
		{
		 //alert("readyState: "+xmlhttp.readyState);
		 //alert("status: "+xmlhttp.status);
		 if (xmlhttp.readyState==4 && xmlhttp.status==200)
		 {
		 	if(confirm(xmlhttp.responseText) == true){
		 		document.getElementById('leiCCILResTemp').innerHTML =  xmlhttp.responseText;

		 		var data = this.responseText;
		 		var p1 = data.indexOf("Date :");
		 		var date = data.substring(p1+7, p1+17).replaceAll("-","/");
		 		var month = date.substring(3,5);
		 		let monthNames =["Jan","Feb","Mar","Apr",
		               "May","Jun","Jul","Aug",
		               "Sep", "Oct","Nov","Dec"];
		 		leiExpDate = date.substring(0,3).concat(monthNames[month-1].concat(date.substring(5,10)));
		 		const sysDate = Date.parse('<%=systemDate%>');				 
		 		const leidate = Date.parse(leiExpDate);				 
		 		if(leidate < sysDate){
		 			alert('LEI Exp. Date is less than System Date');
		 		}
				if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : ISSUED")!= -1){
		 			document.getElementById("displayImgForLEIValidation").style.display = "inline-block";
		 		}else if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : LAPSED")!= -1){
		 			document.getElementById("displayImgForLEIValidation").style.display = "inline-block";
		 		}else{
			 		document.getElementById("displayImgForLEIValidation").style.display = "none";
			 	}
		 	}else{
		 		document.getElementById("displayImgForLEIValidation").style.display = "none";
		 	}
		 	
		 	if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : ISSUED")!= -1){
		 		document.getElementById('isLeiValidated').value='Y';
		  		document.getElementById('leiExpDate').value=leiExpDate;
		  		document.getElementById('deferLEI').value="N";
		 	}else if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : LAPSED")!= -1){
		 		document.getElementById('isLeiValidated').value='Y';
		  		document.getElementById('leiExpDate').value=leiExpDate;
		  		document.getElementById('deferLEI').value="N";
		 	}else{
		 		document.getElementById('isLeiValidated').value='N';
		 	}
		 	
		 	document.getElementById('leiValGenParamFlag').value='<%=leiParamValue%>';
		 }
		}
		
		xmlhttp.open("GET","/cms/ManualInputCustomer.do?event=validate_lei_code_with_CCIL&leiCode="+lei,true);
		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttp.send();
		
	<%}else{%>
		document.getElementById('validateLEI').disabled = true;
	<%}%>
	
	}else{
		return true;
	}		
}else{

<%if("Y".equalsIgnoreCase(leiParamValue)){%>
	
	var xmlhttp;
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
	 //alert("readyState: "+xmlhttp.readyState);
	 //alert("status: "+xmlhttp.status);
	 if (xmlhttp.readyState==4 && xmlhttp.status==200)
	 {
	 	if(confirm(xmlhttp.responseText) == true){
	 		document.getElementById('leiCCILResTemp').innerHTML =  xmlhttp.responseText;

	 		var data = this.responseText;
	 		var p1 = data.indexOf("Date :");
	 		var date = data.substring(p1+7, p1+17).replaceAll("-","/");
	 		var month = date.substring(3,5);
	 		let monthNames =["Jan","Feb","Mar","Apr",
	               "May","Jun","Jul","Aug",
	               "Sep", "Oct","Nov","Dec"];
	 		leiExpDate = date.substring(0,3).concat(monthNames[month-1].concat(date.substring(5,10)));
	 		const sysDate = Date.parse('<%=systemDate%>');				 
	 		const leidate = Date.parse(leiExpDate);				 
	 		if(leidate < sysDate){
	 			alert('LEI Exp. Date is less than System Date');
	 		}
			if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : ISSUED")!= -1){
	 			document.getElementById("displayImgForLEIValidation").style.display = "inline-block";
	 		}else if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : LAPSED")!= -1){
	 			document.getElementById("displayImgForLEIValidation").style.display = "inline-block";
	 		}else{
		 		document.getElementById("displayImgForLEIValidation").style.display = "none";
		 	}
	 	}else{
	 		document.getElementById("displayImgForLEIValidation").style.display = "none";
	 	}
	 	
	 	if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : ISSUED")!= -1){
	 		document.getElementById('isLeiValidated').value='Y';
	 		document.all.isLeiValidated.value='Y';
	  		document.getElementById('leiExpDate').value=leiExpDate;
	  		document.getElementById('deferLEI').value="N";
	 	}else if(document.getElementById('leiCCILResTemp').innerHTML.indexOf("Registration Status : LAPSED")!= -1){
	 		document.getElementById('isLeiValidated').value='Y';
	 		document.all.isLeiValidated.value='Y';
	  		document.getElementById('leiExpDate').value=leiExpDate;
	  		document.getElementById('deferLEI').value="N";
	 	}else{
	 		document.getElementById('isLeiValidated').value='N';
	 		document.all.isLeiValidated.value='N';
	 	}
	 	
	 	document.getElementById('leiValGenParamFlag').value='<%=leiParamValue%>';
	 	document.all.leiValGenParamFlag.value='<%=leiParamValue%>';
	 }
	}
	
	xmlhttp.open("GET","/cms/ManualInputCustomer.do?event=validate_lei_code_with_CCIL&leiCode="+lei,true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();
	
<%}else{%>
	document.getElementById('validateLEI').disabled = true;
<%}%>
}
}else{
alert("Please enter LEI Code to validate");
}
}else{
	alert("Please uncheck Defer LEI");
}	
}



function populateRMData(){
	var rmCode = document.forms[0].relationshipMgrEmpCode.value;	
	var relationshipMgr = "";
	var rmRegion = "";	
	if(rmCode.length>10){
		alert("Enter Valid RM Employee Code");
		return false;
	}else{
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}		
		xmlhttp.onreadystatechange=function()
		{
		 if (xmlhttp.readyState==4 && xmlhttp.status==200)
		 {
			 var data = this.responseText;
			 var p1 = data.indexOf("r:");
			 var p2 = data.indexOf(";")-1;
			 
			 relationshipMgr = data.substr(p1+2, p2-p1).replace(";","");
			 rmRegion = data.substr(data.indexOf("n:")+2, data.length);
			 
			 if(rmRegion.length < 20){
					document.getElementById('relationshipMgr').value=relationshipMgr;
					document.getElementById('rmRegion').value=rmRegion;
				 }else{
					 alert("Entered RM EMP ID is not present in HRMS or disabled in RM Master.");
						document.getElementById('relationshipMgr').value="-";
						document.getElementById('rmRegion').value="-";
				 }
		 }
		}
		
		xmlhttp.open("GET","/cms/ManualInputCustomer.do?event=populate_rm_data&rmCode="+rmCode,true);
		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttp.send();
	}
}
//function createPartyGroup() {
	
 //	document.forms[0].action = "MIPartyGroup.do?event=maker_prepare_create_party_group&startIndex=";
 	
  //  document.forms[0].submit();
//}
//-->

window.onload = function(e){ 
	<%
	if("22".equalsIgnoreCase(value.getEntity()) || "PVT.LTD.".equalsIgnoreCase(value.getEntity()) || "LIMITED".equalsIgnoreCase(value.getEntity())) {
		%>	
	    	document.getElementById("cin").style.visibility = "visible";
	    	<% }
		else {
			%>
		    document.getElementById("cin").style.visibility = "hidden";
	 <%	} %>
}

</script>
<!-- InstanceEndEditable -->
</head>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
		<tr background="red">
						<td width="100%" colspan="4">
						<h3>Summary Details </h3>
						</td>
					</tr>
					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<jsp:include page="cri_hidden_details.jsp"></jsp:include>
			<jsp:include page="udf_hidden_details.jsp"></jsp:include>
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party ID</td>
										<td width="30%">
										<input type="text" size="30" style="background:#B4CFEC"  disabled="true"/>
										<html:hidden property="cifId" 
											></html:hidden>&nbsp;
											</td>
										<td class="fieldname" width="20%">Party Name<font color="red">*</font></td>
										<td width="30%"><html:text property="customerNameShort" styleId="customerNameShort"
											size="30" maxlength="100"   onchange="javascript : addDetail();changeNameAsPerPan()"></html:text>&nbsp;
												<br><html:errors property="customerNameShortError"/>
												<html:errors property="specialCharacterCustomerNameShortError"/>
											<html:errors property="customerNameShortLengthError"/>
											<html:errors property="dupCustomerNameError"/>
											</td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status<font color="red">*</font></td>
										<td width="30%">
										<%if( value.getStatus()==null){
											%>
						                  	<input type="radio" name="status" id="status" checked="checked" value="ACTIVE"   onclick="javascript:checkboxStatusActive()">Open</input>
					                  		<input type="radio" name="status" id="status" value="INACTIVE"   onclick="javascript:checkboxStatusInactive()">Close</input>
					                  		<%
										}
										else if( value.getStatus().equalsIgnoreCase("ACTIVE") ){
					                  	%>
					                  	<input type="radio" name="status" id="status" checked="checked" value="ACTIVE"   onclick="javascript:checkboxStatusActive()" >Open</input>
				                  		<input type="radio" name="status" id="status" value="INACTIVE"   onclick="javascript:checkboxStatusInactive()">Close</input>
				                  		<%}else{%>
				                  			<input type="radio" name="status" id="status"  value="ACTIVE"   onclick="javascript:checkboxStatusActive()">Open</input>
					                  		<input type="radio" name="status" id="status" checked="checked" value="INACTIVE"   onclick="javascript:checkboxStatusInactive()">Close</input>
				                  		<%} %>
												<br><html:errors property="statusError"/>
											</td>
										<td class="fieldname" width="20%">Main Branch<Font color="red">*</Font></td>
										<td width="30%">
										
										<html:select property="mainBranch" styleId="mainBranch"
											size="1"    onchange="javascript : addDetail()" style="width:250px">
											<option value="">Please Select</option>
											<logic:present name="systemBranchList">
												<logic:iterate id="ob" name="systemBranchList"
													type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"
													 scope="page">
													<%
														String rowClass = "";
																	sno++;
																	if (sno % 2 != 0) {
																		rowClass = "odd";
																	} else {
																		rowClass = "even";
																	}
																	// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
													%>

													<%
														if (value.getMainBranch() == null) {
													%>
													<option 
														value="<%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%>"><%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%></option>
													<%
														} else {
													%>
													<%
														if (value.getMainBranch().equals(
																				String.valueOf(ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()))) {
													%>
													<option 
														value="<%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%>" selected="selected"><%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%></option>
													<%
														} else {
													%>
													<option 
														value="<%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%>"><%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%></option>
													<%
														}
													%>
													<%
														}
													%>


												</logic:iterate>
											</logic:present>


										</html:select>
										
												<br><html:errors property="mainBranchError"/>
											</td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment<font color="red">*</font></td>
										<td width="30%"><html:select property="customerSegment" styleId="customerSegment"   onchange="javascript : addDetail()" style="width:250px">

											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
										<br><html:errors property="customerSegmentError"/>
										</td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%"><html:text property="relationshipStartDate" size="30"
											maxlength="20"  readonly="true"></html:text><img src="img/calendara.gif"
											alt="calender" name="Image723" border="0" id="Image725"
											onclick="showCalendar('relationshipStartDate', 'dd/mm/y')"
											onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />&nbsp;
												<br><html:errors property="relationshipDateError"/>
											</td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="right"><input onclick="javascript : addParty()"
								name="AddNew12" type="button" id="AddNew12" value="Add Details"
								class="btnNormal" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo" id="addParty" style="display: none;">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%">
										<textarea id="name"  readonly="readonly"  style="width: 300px; height: 30px;"><%=value.getCustomerNameShort()%></textarea>&nbsp;
										
										</td>
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><input type="text" id="sts" readonly="readonly"></input>&nbsp;</td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%">
										
									<input type="text" id="branch" readonly="readonly" value="<%=value.getMainBranch()==null?"":value.getMainBranch()%>"></input>&nbsp;
										</td>
										
										<td class="fieldname" width="20%">Group</td>
										<td width="30%">
										<%BigDecimal str = new BigDecimal("0.0"); %>
										<html:select property="partyGroupName"
											size="1" style="width:250px">
											 <option value="">Please Select
											</option>
												<logic:present name="partyGroupList">
										<logic:iterate id="ob" name="partyGroupList"
											type="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"
											 scope="page">
											<%
												String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											
											   <%if(value.getPartyGroupName()== null){ %>
											   	<option  value="<%=ob.getId()%>" ><%=ob.getPartyName() %></option>
											   <%str = ob.getGroupExpLimit().getAmountAsBigDecimal();
											  
											   }else { %>
													<%if(value.getPartyGroupName().equals(String.valueOf(ob.getId()))){ 
														str = ob.getGroupExpLimit().getAmountAsBigDecimal();
														 System.out.println("2"+ob.getGroupExpLimit().getAmount());
													%>
													<option  value="<%=ob.getId()%>" selected="selected" ><%=ob.getPartyName() %></option>
													<%}else{ 
													%>
													<option  value="<%=ob.getId()%>" ><%=ob.getPartyName() %></option>
													<%} %>
													<%} %>
										</logic:iterate>
									</logic:present>
											<logic:notPresent name="partyGroupList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>

										</html:select>
										<html:hidden property="groupExposer" value="<%= String.valueOf(str)%>"/>
										<br><html:errors property="partyGroupNameError"/>
										</td>

									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">RM Employee Code<font color="red">*</font></td>
										<td width="30%"><html:text
											name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" style="width:250px" maxlength="10" onblur="javascript:populateRMData();"/>
											<html:errors property="relationshipMgrEmpCodeError"/></td>
											<td class="fieldname" width="20%">Relationship Manager</td>
										<td width="30%"><html:text
											name="ManualInputCustomerInfoForm" property="relationshipMgr" styleId="relationshipMgr" style="width:250px" readonly="true"/>
										</td>
									</tr>
									<tr class="even">
									<td class="fieldname" width="20%">RM Region</td>
										<!-- code end:Uma Khot 18/08/2015 Phase 3 CR:Rename Region to RM Region -->
										<td width="30%"><html:text
											name="ManualInputCustomerInfoForm" styleId="rmRegion" property="rmRegion" 
											style="width:250px" readonly="true"/>
										
										<br><html:errors property="rmRegionError"/>
										</td>
										<td class="fieldname">Segment</td>
										<td><input type="text" id="segment" readonly="readonly" value="<integro:common-code descWithCode="false" display="true"
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode='<%=value.getCustomerSegment() %>'/>" size="40"></input>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Entity<font color="red">*</font></td>
										<td><html:select name="ManualInputCustomerInfoForm"
											property="entity" style="width:250px"  onclick="javascript:hideCinLlpin(this)">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.ENTITY%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
											<br><html:errors property="entityError"/>
										</td>
										<td class="fieldname">Industry Name<font color="red">*</font></td>
										<td><html:select property="industryName" style="width:250px" onchange="javascript:refreshRbiIndustryCode(this)" style="width:250px"> 

											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
										<br><html:errors property="industryNameError"/>
										</td>
									</tr>
									
									<tr class="even">
										<td class="fieldname" width="20%">CIN/LLPIN<font color="red" id="cin">*</font></td>
										<td width="30%"><html:text property="cinLlpin" styleId="cinLlpin" size="30" maxlength="30" style="width:250px">
										</html:text>
										<br><html:errors property="cinLlpinError"/>
										    <html:errors property="cinError"/>
										</td>
										<td class="fieldname" width="20%">Date of Birth/Incorporation<font color="red">*</font>
										</td>
										<td width="30%"><html:text
											property="dateOfIncorporation" size="30" maxlength="20" readonly="true" styleId="dateOfIncorporation"></html:text><img
											src="img/calendara.gif" alt="calender" name="Image723"
											border="0" id="Image725"
											onclick="showCalendar('dateOfIncorporation', 'dd/mm/y')"
											onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />&nbsp;
											<br><html:errors property="corporationDateError"/>
											</td>
									</tr>

									<tr class="odd">
									<td class="fieldname">RBI Industry Code<font color="red">*</font></td>
										<td><span class="even"> <html:select
											property="rbiIndustryCode" style="width:250px" >

											<option value="">Please Select</option>
											<html:options collection="rbiIndustryCodeList" labelProperty="label"
												property="value" />
										</html:select></span>
										<br><html:errors property="rbiIndustryCodeError"/>
										</td>
										<td class="fieldname">Cycle<font color="red">*</font></td>
										<td>
										<%if( value.getCycle()==null){
											%>
						                  	<input type="radio" name="cycle"  value="DOC" onclick="javascript:docSelected()">DOC Cycle</input>
					                  		<input type="radio" name="cycle" checked="checked" value="LAD" onclick="javascript:ladSelected()">LAD Cycle</input>
					                  		<%
										}
										else if( value.getCycle().equalsIgnoreCase("DOC") ){
					                  	%>
					                  	<input type="radio" name="cycle" checked="checked" value="DOC" onclick="javascript:docSelected()">DOC Cycle</input>
				                  		<input type="radio" name="cycle" value="LAD" onclick="javascript:ladSelected()">LAD Cycle</input>
				                  		<%}else{%>
				                  			<input type="radio" name="cycle"  value="DOC" onclick="javascript:docSelected()">DOC Cycle</input>
					                  		<input type="radio" name="cycle" checked="checked" value="LAD" onclick="javascript:ladSelected()">LAD Cycle</input>
				                  		<%} %>
											<br><html:errors property="cycleError"/>
										</td>
									</tr>
									<tr class="even">
										<td class="fieldname"></td>
										<td></td>
										<td class="fieldname">Party name as per PAN</td>
										<td><html:text property="partyNameAsPerPan" styleId="partyNameAsPerPan" onchange="javascript : makeUpperCasePan()"
											size="40" maxlength="85"></html:text>
										<html:errors property="partyNameAsPerPanError"/>
										</td>
									</tr>
									<tr class="even">
										<td class="fieldname" >Form 60/61</td>
										<td>
											<% if(value.getForm6061Checked()==null || value.getForm6061Checked().equals("")){%>
												<input type="checkbox" id="form6061" onclick="javascript:checkboxForForm6061()"></input>
												<html:hidden property="form6061Checked"/>
												<% }else if(value.getForm6061Checked().equals("Y")){%>
												<input type="checkbox" id="form6061" checked="checked" onclick="javascript:checkboxForForm6061()"></input>
												<html:hidden property="form6061Checked"/>
												<%} else if(value.getForm6061Checked().equals("N")){%>
												<input type="checkbox" id="form6061" onclick="javascript:checkboxForForm6061()"></input>
												<html:hidden property="form6061Checked"/>
											<%} %>
										</td>	

										
										<td class="fieldname">PAN<font color="red">*</font></td>
										<td><html:text property="pan" styleId= "pan" size="15" maxlength="10"></html:text>&nbsp;
											<input type="button" id="validatePAN" name="validatePAN" value=" Validate PAN " onclick="javascript:validatePANNo();" />
											<br>
											<% try{ if( 'Y'== isPanValid){ %>
											<img src="img/tick.gif" id="displayImgForPANValidation" style="display:inline-block" />
											<%}  else{ %>
											<img src="img/tick.gif" id="displayImgForPANValidation" style="display:none" />
											<%}  }catch(Exception e){e.printStackTrace();}%>
											<html:errors property="panLengthError"/>
											<html:errors property="specialCharacterPanError"/>
											<html:errors property="invalidPanError"/>
											<html:errors property="validatePANWithNSDLError"/>
										</td>
									</tr>
									<!--Santosh LEI CR  -->
									<tr class="even">
										<td class="fieldname">LEI Code</td>
										<td><html:text property="leiCode" size="30"
											maxlength="20" onchange="javascript : changeLeiDetails(this)" styleId="lei"></html:text>&nbsp;
											<!-- LEI Validation -->
											<%if(!"Y".equalsIgnoreCase(leiParamValue)){%>
											<input type="button" id="validateLEI" name="validateLEI" value=" Validate LEI " disabled="disabled" onclick="javascript:validateLEICode();" />
											<%}else{ %>
											<input type="button" id="validateLEI" name="validateLEI" value=" Validate LEI " onclick="javascript:validateLEICode();" />
											<%} %>
											<br>
											<% try{ if( 'Y'== isLeiValid){ %>
											<img src="img/tick.gif" id="displayImgForLEIValidation" style="display:inline-block" />
											<%}  else{ %>
											<img src="img/tick.gif" id="displayImgForLEIValidation" style="display:none" />
											<%}  }catch(Exception e){e.printStackTrace();}%>
											<html:errors property="validateLEIWithCCILError"/>
											<!-- End LEI Validation -->
											<html:errors property="invalidLeiCodeError"/>
										</td>
										<td class="fieldname">LEI Exp. Date</td>
          								<td>
            								<html:text property="leiExpDate" styleId="leiExpDate" style="width:80px"  size="12" maxlength="11" readonly="true" />
            								<img src="img/calendara.gif"  name="Image5223161211" border="0" id="Image5" onclick="return showCalendar('leiExpDate', 'dd/mm/y'  );" onMouseOver="MM_swapImage('Image5223161211','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            								<html:errors property="invalidLeiExpDate"/>
            							</td>
									</tr>
									<!--End Santosh LEI CR  -->
									<!-- Defer LEI -->
									<tr class="even">
									<td class="fieldname" >Defer LEI</td>
									<td>
										<% if(value.getDeferLEI()==null || value.getDeferLEI().equals("")){%>
											<input type="checkbox" name="deferLEI" id="defer" value="" onclick="javascript:checkboxForDeferLEI()"></input>
											<html:hidden property="deferLEI" styleId="deferLEI"/>
											<% }else if(value.getDeferLEI().equals("Y")){%>
											<input type="checkbox" name="deferLEI" id="defer" value="Y" checked="checked" onclick="javascript:checkboxForDeferLEI()"></input>
											<html:hidden property="deferLEI" styleId="deferLEI"/>
											<%} else if(value.getDeferLEI().equals("N")){%>
											<input type="checkbox" name="deferLEI" id="defer" value="N" onclick="javascript:checkboxForDeferLEI()"></input>
											<html:hidden property="deferLEI" styleId="deferLEI"/>
										<%} %>
									</td>
									<td class="fieldname"></td>										
									</tr>
									<!-- Defer LEI -->
									<tr class="even">
									<tr class="odd">
										<td class="fieldname">Address1<font color="red">*</font></td>
										<td><html:text property="address1" size="30"
											maxlength="75"></html:text>&nbsp;
											<br><html:errors property="address1Error"/>
											<html:errors property="address1LengthError"/>
											</td>
										<td class="fieldname">Address2</td>
										<td><html:text property="address2" size="30"
											maxlength="75"></html:text>&nbsp;
												<html:errors property="address2LengthError"/>
											</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Address3</td>
										<td><html:text property="address3" size="30"
											maxlength="75"></html:text>&nbsp;
												<html:errors property="address3LengthError"/>
											</td>
										<td class="fieldname">Pincode</td>
										<td><html:text property="postcode" size="10"
											maxlength="6"></html:text>&nbsp;
											<html:errors property="postcodeLengthError"/>
											<html:errors property="specialCharacterPostcodeError"/>
											<html:errors property="postcodeError"/>
											</td>

									</tr>
									<tr class="odd">
										<td class="fieldname">Country<font color="red">*</font></td>
										<td><html:select name="ManualInputCustomerInfoForm"  property="country"
											
											onchange="javascript:refreshRegionId(this)" style="width:250px">
											<option value="">Please Select</option>
											<html:options collection="countryList" labelProperty="label"
												property="value" />
										</html:select>
										<br><html:errors property="countryError"/>
										</td>
										<td class="fieldname">Region<font color="red">*</font></td>
										<td><html:select property="region"
											name="ManualInputCustomerInfoForm"
											onchange="javascript:refreshStateId(this)" style="width:250px">
											<option value="">Please Select</option>
											<html:options collection="regionList" labelProperty="label"
												property="value" />
										</html:select>
											<br><html:errors property="regionError"/>
										</td>
									</tr>
									<tr class="even">
										<td class="fieldname">State<font color="red">*</font></td>
										<td><html:select property="state"
											name="ManualInputCustomerInfoForm"
											onchange="javascript:refreshCityId(this)" style="width:250px">
											<option value="">Please Select</option>
											<html:options collection="stateList" labelProperty="label"
												property="value" />
										</html:select>
											<br><html:errors property="stateError"/>
										</td>
										<td class="fieldname">City<font color="red">*</font></td>
										<td><html:select property="city"
											name="ManualInputCustomerInfoForm" style="width:250px">
											<option value="">Please Select</option>
											<html:options collection="cityList" labelProperty="label"
												property="value" />
										</html:select>
											<br><html:errors property="cityError"/>
										</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Telephone Number</td>
										<td><html:text property="stdCodeTelNo" size="5"
											maxlength="5"></html:text> <html:text
											property="telephoneNo" size="20" maxlength="15"></html:text>&nbsp;
											<br><html:errors property="telephoneNoLengthError"/>
											<html:errors property="specialCharacterTelephoneNoError"/>
											<html:errors property="specialCharacterStdTelephoneNoError"/>
											</td>
										<td class="fieldname">Fax No.</td>
										<td><html:text property="stdCodeTelex" size="5"
											maxlength="5"></html:text> <html:text
											property="telex" size="20" maxlength="15"></html:text>&nbsp;
										<br><html:errors property="telexLengthError"/>
										<html:errors property="specialCharacterTelexError"/>
											<html:errors property="specialCharacterStdTelexError"/>
										</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Email</td>
										<td><html:text property="email" size="30" maxlength="50"></html:text>&nbsp;
										<br>
										<html:errors property="emailError"/>
										</td>
										<td class="fieldname">AADHAR Number</td>
										<td><html:text property="aadharNumber" size="30" maxlength="75"></html:text>
											<br><html:errors property="aadharLengthError"/>
											<html:errors property="aadharLengthLessError"/>
											<html:errors property="aadharCharacterError"/>
										</td>
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.listedCompany"/><font color="red">*</font></td>
										<td>
										<%if(( null == value.getListedCompany() || "".equalsIgnoreCase(value.getListedCompany()))){
											%>	<input type="radio" name="listedCompany"  value="Yes" >Yes</input>
					                  		<input type="radio" name="listedCompany"  value="No" >No</input>
					                  		&nbsp;
					                  		<%
										}
										else if( "Yes".equalsIgnoreCase(value.getListedCompany()) ){
					                  	%>
					                  	<input type="radio" name="listedCompany"  checked="checked"  value="Yes" >Yes</input>
					                  		<input type="radio" name="listedCompany"  value="No" >No</input>
					                  		&nbsp;
					                  	<%}else  if( "No".equalsIgnoreCase(value.getListedCompany())){%>
					                  	<input type="radio" name="listedCompany"  value="Yes" >Yes</input>
					                  		<input type="radio" name="listedCompany" checked="checked" value="No" >No</input>
					                  		&nbsp;
					                  		<%} %>
										<br>
										 <html:errors property="listedCompanyError"/>  
										</td>
										<td class="fieldname"><bean:message key="label.party.summary.isinNo"/></td>
										<td><html:text property="isinNo" size="30" maxlength="20"></html:text>
											<br><html:errors property="isinNoError"/>
											
										</td>
									</tr>
									
									<tr class="even">
										<td class="fieldname"><bean:message key="label.party.summary.raroc"/></td>
										<td><html:text property="raroc"  size="30" maxlength="13"></html:text>
												<br>	<html:errors property="rarocCharacterError"/>
										</td>
										<td class="fieldname"><bean:message key="label.party.summary.raraocPeriod"/></td>
 
										 <td width="30%"><html:text
											property="raraocPeriod" size="30" maxlength="20" readonly="true"></html:text><img
											src="img/calendara.gif" alt="calender" name="Image723"
											border="0" id="Image725"
											onclick="showCalendar('raraocPeriod', 'dd/mm/y')"
											onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />&nbsp;
											
											</td> 
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.yearEndPeriod"/><font color="red">*</font></td>
										<td><html:text property="yearEndPeriod" size="30" maxlength="75"></html:text>(Enter Data in 'DD-MMM' format)
											<br><html:errors property="yearEndPeriodError"/>
											<html:errors property="yearEndPeriodFormatError"/>
										</td>
										<td class="fieldname"><bean:message key="label.party.summary.creditMgrEmpId"/></td>
										<td><html:text property="creditMgrEmpId" size="30" maxlength="100"></html:text>
											<br><html:errors property="creditMgrEmpIdError"/>
										</td>
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.pfLrdCreditMgrEmpId"/></td>
										<td><html:text property="pfLrdCreditMgrEmpId" size="30" maxlength="100"></html:text>
											<br><html:errors property="pfLrdCreditMgrEmpIdError"/>
										</td>
										<td class="fieldname"><bean:message key="label.party.summary.creditMgrSegment"/></td>
										<td width="30%"><html:select property="creditMgrSegment" styleId="creditMgrSegment"  style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"/>
										</html:select>
										<br><html:errors property="creditMgrSegmentError"/>
										</td>
									</tr>
								</tbody>
							        <tr class="odd">
										<td class="fieldname">SCF Interface Status</td>
										<td><html:text property="scfStatus" size="30"
												maxlength="50" disabled="true" value="<%=scfStatus%>"></html:text>&nbsp;<br></td>
										<td class="fieldname">SCF Interface Failed Reason</td>
										<%if(scfErrMsg.isEmpty()) {%>
												<td><html:text property="scfFailedReason" size="30"
														disabled="true" value="<%=scfErrMsg%>"></html:text><br /></td>
												<%}else{ %>
												<td><html:textarea property="scfFailedReason" rows="4"
														cols="50" disabled="true" value="<%=scfErrMsg%>"></html:textarea>
													<br /></td>
												<%} %>
										</tr>	
									  <tr class="even">
										<td class="fieldname">ECBF Interface Status</td>
										<td><html:text property="ecbfStatus" size="30"
												maxlength="50" disabled="true" value="<%=ecbfStatus%>" ></html:text>&nbsp; <br></td>
										<td class="fieldname">ECBF Interface Failed Reason</td>
										<%if(ecbfErrMsg.isEmpty()) {%>
												<td><html:text property="ecbfFailedReason" size="30"
														disabled="true" value="<%=ecbfErrMsg%>"></html:text><br/></td>
										<%}else{ %>
												<td><html:textarea property="ecbfFailedReason" rows="4"
														cols="50" disabled="true" value="<%=ecbfErrMsg%>"></html:textarea>
													<br /></td>
												<%} %>
								  </tr>				
							</tbody>
							</table>
							</td>
						</tr>
						<tr id="addVendorDetails" style="display: none;">
							<td align="right">
							<h3 align="left">Vendor Details</h3>
							<input onclick="javascript : addSystem('add_vendor_name_in_edit')"
								name="AddNew12" type="button" id="AddNew12"
								value="Add Vendor Details" class="btnNormal" /></td>
						</tr>
						<tr id="hrline1" style="display: none;">
							<td>
							<hr />
							</td>
						</tr>
						<tr id="addVendorDetails2" style="display: none;">
							<td>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>	<html:errors property="bankingMethodEmptyError"/></tr>
									<tr>
									
										<td>S/N</td>
										<td>Vendor Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="vendorList">
										<logic:iterate id="ob" name="vendorList"
											type="com.integrosys.cms.app.customer.bus.OBVendor"
											 scope="page">
											<%
												String rowClass = "";
														vno++;
														if (vno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getVendorName()%>&nbsp;</center>
												</td>
												<td>
												<center><select id="action<%=vno%>"
													onchange="getvendorAction('<%=ob.getVendorName()%>','<%=ob.getVendorId()%>','<%=vno%>')">
													<option value="">-Select-</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
										<%if(vendorList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody>
							</table>
							</td>
						</tr>
						
						<jsp:include page="edit_co_borrower_details_summary.jsp" />
						
						<tr id="addSystemDetails" style="display: none;">
							<td align="right">
							<h3 align="left">System Details</h3>
							<input onclick="javascript : addSystem('add_other_system_in_edit')"
								name="AddNew12" type="button" id="AddNew12"
								value="Add System Details" class="btnNormal" /></td>
						</tr>
						<tr id="hrline" style="display: none;">
							<td>
							<hr />
							</td>
						</tr>
						<tr id="addSystemDetails2" style="display: none;">
							<td>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
										<td>S/N</td>
										<td>System</td>
										<td>System ID</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="systemList">
										<logic:iterate id="ob" name="systemList"
											type="com.integrosys.cms.app.customer.bus.OBSystem"
											 scope="page">
											<%
												String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
												<td>
												<center>
												<integro:common-code
												categoryCode="<%=CategoryCodeConstant.SYSTEM%>"
												entryCode="<%=ob.getSystem()%>"
												descWithCode="false"  display="true"/>
												</center>
												</td>
												<td>
												<center><%=ob.getSystemCustomerId()%>&nbsp;</center>
												</td>
												<td>
												<center><select id="actionType<%=no%>"
													onchange="getAction('<%=ob.getSystemCustomerId()%>','<%=ob.getSystem()%>','<%=no%>')">
													<option value="">-Select-</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
										<%if(systemList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								
								
								<logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str11 = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str11);
										%>
										<tr>
											<td><html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str11%>"/></td>
										</tr>
										<%cnt++;
										%>
									</logic:iterate>
								</logic:present>
								
								
								
								</tbody>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
		</table>
		</td>
	</tr>
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" styleId="cifId"/>
	<html:hidden name="ManualInputCustomerInfoForm"
		property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />

	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="scfStatus" />	
	<html:hidden name="ManualInputCustomerInfoForm" property="scfFailedReason" />
	<html:hidden name="ManualInputCustomerInfoForm" property="ecbfStatus" />	
	<html:hidden name="ManualInputCustomerInfoForm" property="ecbfFailedReason" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" styleId="status"/>
	<html:hidden name="ManualInputCustomerInfoForm"
		property="partyGroupName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
 	<!--<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" /> -->
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="rbiIndustryCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="industryName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" styleId="pan"/>
		<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />
	<html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" />  
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
	<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="bankingMethod" />
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalNonFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedShareLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" value="'<%=leiParamValue%>'" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
		<!--End Santosh LEI CR  -->	
		
		<html:hidden  property="event"/>
			<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" />
		<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
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
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateOfSuit" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitAmount" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="directorListEmpty" />
		
		
		
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
		
		
		<%if(systemList!=null && systemList.size()==0){ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="systemListEmpty" value="Y" />
		<%}else{ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="systemListEmpty" value="N" />
		<%} %>
		
		
		<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag" value="'<%=paramValue%>'" styleId="panValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated" styleId="isPanValidated" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
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
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIds" />
		
</table>
<div id="panNSDLResTemp" style="display: none"  />
<div id="leiCCILResTemp" style="display: none"  />
<!-- InstanceEnd -->