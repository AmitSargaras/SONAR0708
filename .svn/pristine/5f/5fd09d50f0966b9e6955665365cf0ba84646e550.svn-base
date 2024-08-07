<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,
	com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,
	com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,
	java.util.Vector,com.integrosys.cms.app.customer.bus.OBSubline,com.integrosys.cms.app.customer.bus.OBIfscMethod"%>
<%
int sno = 0;
int no = 0;
ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
List ifscBranchList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ifscBranchList");
System.out.println("??????????????????????"+ifscBranchList);
if (!(ifscBranchList == null)) {
	TreeMap soretedMap= new TreeMap();
	for(int i=0;i<ifscBranchList.size();i++)
	{
		OBIfscMethod ob=(OBIfscMethod)ifscBranchList.get(i);
		if("O".equals(ob.getBankType())){
			soretedMap.put(ob.getBranchName().toUpperCase()+"+"+ob.getIfscCode(),ob);
		}
	}
	ifscBranchList = new ArrayList(soretedMap.values());
	
	System.out.println("<<<<<<<<<1>>>>>>>>>>>"+value.getNodalLead());
 	for (int i = 0; ifscBranchList.size() > i; i++) {
		OBIfscMethod nodal = (OBIfscMethod) ifscBranchList.get(i);
		if(nodal != null && !nodal.equals("")){
		if (nodal.getNodal() != null && !nodal.getNodal().equals("")) {
			if (nodal.getBankType()!=null && nodal.getBankType().equals("O")) {
				if (nodal.getNodal()!= null && nodal.getNodal().equals("Y")) {
					if(value.getNodalLead()!=null && !value.getNodalLead().isEmpty() && nodal.getIfscCode().equals(value.getNodalLead().substring(2))){
						value.setNodalLead("o,"+(String.valueOf(nodal.getIfscCode()).trim()));
					}else if(value.getNodalLead()==null || value.getNodalLead().isEmpty()){
						value.setNodalLead("o,"+(String.valueOf(nodal.getIfscCode()).trim()));
					}
				}
			} else if (nodal.getBankType()!=null && nodal.getBankType().equals("S")) {
				if (nodal.getNodal()!= null && nodal.getNodal().equals("Y")) {
					value.setNodalLead("s,"+(String.valueOf(nodal.getIfscCode()).trim()));
				}
			}
		}
		if (nodal.getLead() != null &&  !nodal.getLead().equals("")) {
			if (nodal.getBankType()!=null && nodal.getBankType().equals("O") ) {
				if (nodal.getLead()!= null && nodal.getLead().equals("Y")) {
					if(value.getNodalLead()!=null && !value.getNodalLead().isEmpty() && nodal.getIfscCode().equals(value.getNodalLead().substring(2))){
						value.setNodalLead("o,"+(String.valueOf(nodal.getIfscCode()).trim()));
					}else if(value.getNodalLead()==null || value.getNodalLead().isEmpty()){
						value.setNodalLead("o,"+(String.valueOf(nodal.getIfscCode()).trim()));
					}
				}
			} else if (nodal.getBankType()!=null && nodal.getBankType().equals("S")) {
				if (nodal.getLead()!= null && nodal.getLead().equals("Y")) {
					value.setNodalLead("s,"+(String.valueOf(nodal.getIfscCode()).trim()));
				}
			}
		}
		}
	} 
}
if (ifscBranchList != null) {
	pageContext.setAttribute("ifscBranchList", ifscBranchList);
}else{
	pageContext.setAttribute("ifscBranchList", new ArrayList());
}

List branchList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchList");
if (!(branchList == null)) {
TreeMap soretedMap= new TreeMap();
for(int i=0;i<branchList.size();i++)
{
	OBBankingMethod ob=(OBBankingMethod)branchList.get(i);
	if("S".equals(ob.getBankType()) || "O".equals(ob.getBankType())){
		soretedMap.put(ob.getBankId(),ob);
	}
}

branchList = new ArrayList(soretedMap.values());
}
if (!(branchList == null)) {
	
	pageContext.setAttribute("branchList", branchList);
	//request.setAttribute("otherBankList", otherBankList);
}
List partyGrpList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGrpList");

OBSubline sysObj = new OBSubline();
for(int i = 0; i< partyGrpList.size();i++)
{
	sysObj = 	(OBSubline)partyGrpList.get(i);
		if(sysObj.getPartyGroup()== null)
	{
		partyGrpList.remove(i);	
		i = i-1;
	}
}

if (!(partyGrpList == null)) {
	
	pageContext.setAttribute("partyGrpList", partyGrpList);
	//request.setAttribute("otherBankList", otherBankList);
}
else
{
	pageContext.setAttribute("partyGrpList", new ArrayList());
}
 
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
	if(ifscBranchList!=null){
		System.out.println("???????????ifscBranchList.size()???????????"+ifscBranchList.size());
		for(int i=0;i<ifscBranchList.size();i++)
		{
			OBIfscMethod ob=(OBIfscMethod)ifscBranchList.get(i);
			System.out.println("???????????ifscBranchList???????????"+ob.getIfscCode());
		}
	}else{
		System.out.println("???????????ifscBranchList.size() is null???????????");
	}
	
	
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
<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->

<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.manualinput.CommonUtil"%>
<%@page import="com.integrosys.cms.app.customer.bus.IBankingMethod"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBBankingMethod"%><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
 <script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script type="text/javascript" src="js/ajaxList.js"></script>
    <script type="text/javascript" src="js/ajaxFinancialAmount.js"></script>
<script type="text/javascript" src="js/itgUtilities.js"></script>
<script language="JavaScript" type="text/JavaScript"> 

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
function getDelete(id,banktype,ind) {
   var type = document.getElementById("actionDelete"+ind).value;
   var answer = confirm("Are you sure you want to delete this branch ?")
   if(answer == true)	
   {
	   if (document.getElementById("nodalLead"+ind).checked) {
			alert("Please select other bank as Nodal/Lead.");
	   }else{
	   		if( type == "Delete"){					
				document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&banktype="+banktype;		
	    		document.forms[0].event.value = "delete_banking_method_in_edit";
	    		document.forms[0].submit();
			}
	   }
   }
}
function getDeleteIfsc(id,banktype,ind) {
	
   var type = document.getElementById("actionDelete"+ind).value;
   var answer = confirm("Are you sure you want to delete this branch ?")
   if(answer == true)	
   {
	   if (document.getElementById("nodalLead"+ind).checked) {
			alert("Please select other bank as Nodal/Lead.");
	   }else{
	   		if( type == "Delete"){					
				document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&banktype="+banktype+"&ifscFlag=true";		
	    		document.forms[0].event.value = "delete_banking_method_in_edit";
	    		document.forms[0].submit();
			}	
	  }
   }
	    
}
function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}
function enbleBtn(ifChecked){
	if(ifChecked == 1){
		document.getElementById('detailBtn').disabled = false;
		document.getElementById('sblnDetails').style.display = ''
	}else if (ifChecked == 2 ){
		document.getElementById('detailBtn').disabled = true;
		document.getElementById('sblnDetails').style.display = 'none'		
	}
}
function calculateFinancialDetail() {
	 var curSel = "";
	 var totalNonFundedLimit = document.getElementById('totalNonFundedLimit').value;
	 if(totalNonFundedLimit == "")
	 {
		 totalNonFundedLimit = "0.00";	
	 }
    var nonFundedSharePercent = document.getElementById('nonFundedSharePercent').value;
   
    if(nonFundedSharePercent == "")
	 {
   	 nonFundedSharePercent = "0.00";	 
	 }
	  var memoExposure = document.getElementById('memoExposure').value;
	
	  if(memoExposure == "")
		 {
		  memoExposure = "0.00";	
		 }
	  var totalFundedLimit = document.getElementById('totalFundedLimit').value;
	  
	  if(totalFundedLimit == "")
		 {
		  totalFundedLimit = "0.00";		
		 }
	  var fundedSharePercent = document.getElementById('fundedSharePercent').value;
	 
	  if(fundedSharePercent == "")
		 {
		  fundedSharePercent = "0.00";		
		 }
      var dep = 'fundedShareLimit';
      var url = '/cms/ManualInputCustomer.do?event=calculate_financial_detail_in_edit&totalNonFundedLimit='+totalNonFundedLimit+'&nonFundedSharePercent='+nonFundedSharePercent+'&memoExposure='+memoExposure+'&totalFundedLimit='+totalFundedLimit+'&fundedSharePercent='+fundedSharePercent;
      sendLoadSancAmountReq(dep, url);
}
function shwdetails(selobj){
	
	if(selobj.value == 'MULTIPLE' || selobj.value == 'CONSORTIUM' || selobj.value == 'OUTSIDEMULTIPLE'||selobj.value == 'OUTSIDECONSORTIUM'){
		document.getElementById('bnklbl').style.display = '';
		document.getElementById('exceptionalCasesSpan').style.display = '';
		document.getElementById('isNBFC1').style.visibility = "visible";
		document.getElementById('exceptional2').style.visibility = "visible";
		document.getElementById('exceptional1').style.visibility = "visible";
		
		//document.getElementById('bnkname').style.display = '';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = '';
		document.getElementById("fundedSharePercent").value = '';
		document.getElementById("nonFundedSharePercent").value = '';
	}else if(selobj.value == 'SOLE' || selobj.value == ''){
		//document.getElementById('bnklbl').style.display = 'none';
		//document.getElementById('exceptionalCasesSpan').style.display = 'none';
		document.getElementById('isNBFC1').style.visibility = "hidden";
		document.getElementById('exceptional2').style.visibility = "hidden";
		document.getElementById('exceptional1').style.visibility = "hidden";
		
		//document.getElementById('bnkname').style.display = 'none';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = 'none';
		document.getElementById("fundedSharePercent").value = '100';
		document.getElementById("nonFundedSharePercent").value = '100';
		
	}
}
function onloadDetails(selobj){
	
	if(selobj.value == 'MULTIPLE' || selobj.value == 'CONSORTIUM' || selobj.value == 'OUTSIDEMULTIPLE'||selobj.value == 'OUTSIDECONSORTIUM'){
		document.getElementById('bnklbl').style.display = '';
		document.getElementById('exceptionalCasesSpan').style.display = '';
		document.getElementById('isNBFC1').style.visibility = "visible";
		document.getElementById('exceptional2').style.visibility = "visible";
		document.getElementById('exceptional1').style.visibility = "visible";
		
		//document.getElementById('bnkname').style.display = '';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = '';
		//document.getElementById("fundedSharePercent").value = '';
		//document.getElementById("nonFundedSharePercent").value = '';
	}else if(selobj.value == 'SOLE' || selobj.value == ''){
		//document.getElementById('bnklbl').style.display = 'none';
		//document.getElementById('exceptionalCasesSpan').style.display = 'none';
		document.getElementById('isNBFC1').style.visibility = "hidden";
		document.getElementById('exceptional2').style.visibility = "hidden";
		document.getElementById('exceptional1').style.visibility = "hidden";
		
		//document.getElementById('bnkname').style.display = 'none';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = 'none';
		//document.getElementById("fundedSharePercent").value = '100';
		//document.getElementById("nonFundedSharePercent").value = '100';
		
	}
}
function addSubLine(name){
	document.forms[0].action="ManualInputCustomer.do?event="+name;
	
    document.forms[0].submit();
}

function getBankList(name)
{
	var exceptionalCase= document.getElementById("exceptionalCases").value
	var bankingMethod= document.getElementById("bankingMethod").value
	
	if(null !=bankingMethod && ""!=bankingMethod){
		//if(null !=exceptionalCase && ""!=exceptionalCase){
			var ifscCode=  document.getElementById("iFSCCode").value;
	   		var bankName=  document.getElementById("bankName").value;
	    	var bankBranchName=  document.getElementById("bankBranchName").value;
	    	var checkboxIsNBFC = document.getElementById('isNBFC');
	    
	    	if((null != ifscCode && ""!=ifscCode) ||(null !=bankName && ""!=bankName) || (null !=bankBranchName && ""!=bankBranchName)){
	    		
	      	  	if (checkboxIsNBFC.checked){
	      	  		if ( /[^A-Za-z\s]/.test(bankName)) {
      	  				alert("Bank name should be characters only");
    		    		return (false);
    				}
    				if ( /[^A-Za-z\s]/.test(bankBranchName)) {
    					alert("Branch name should be characters only");
    		    		return (false);
    				}
	      			document.forms[0].action="ManualInputCustomer.do?event="+name + "&bankName="+bankName+"&bankBranchName="+bankBranchName+"&checkboxIsNBFC="+true+"&exceptionalCase="+exceptionalCase;
	      	    	document.forms[0].submit();
	      	  	} else{
	      	  		if(null != ifscCode && ""!=ifscCode){
      	  				if ( /[^A-Za-z\d]/.test(ifscCode)) {
    						alert("Please enter only alphanumeric characters");
    		    			return (false);
    					}
      	  				if (ifscCode.length<9) {
    						alert("Minimum Length of IFSC Code should be 9 characters");
    		    			return (false);
    					}
      	  			}
      	  			if ( /[^A-Za-z\s]/.test(bankName)) {
						alert("Bank name should be characters only");
		    			return (false);
					}
					if ( /[^A-Za-z\s]/.test(bankBranchName)) {
						alert("Branch name should be characters only");
		    			return (false);
					}
	      			var name1="display_bank_list_in_edit_ifsc_code";  
	      			document.forms[0].action="ManualInputCustomer.do?event="+name1 + "&ifscCode="+ifscCode+"&checkboxIsNBFC="+false+"&exceptionalCase="+exceptionalCase+"&bankBranch="+bankBranchName;
	      	    	document.forms[0].submit();
	      	 	}
	    	}else{
	    		alert("Bank details will be mandatory Please Enter Bank Name or Branch Name Or IFSC Code");
	    		return false; 
	    	}
		/* }else{
			alert("Please Select Exceptional Cases Method");
	    	return false; 
		} */
	}else{
		alert("Please Select Banking Method");
    	return false; 
	}
}

function getAction(id,amt,ind) {
	
	var type = document.getElementById("actionType"+ind).value;
	 if(type =="Edit"){
		document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&amount="+amt;	
    	document.forms[0].event.value = "edit_subline_party_in_edit";
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&amount="+amt;		
    	document.forms[0].event.value = "delete_subline_party_in_edit";
    	document.forms[0].submit();
	}	    
}
function  calculateTotalNonFunded()
{
	var nonFundedAmt = document.getElementById("totalNonFundedLimit").value;
	if(nonFundedAmt==undefined)
	{
		nonFundedAmt = 0;
	}
	else{
		nonFundedAmt=eval(nonFundedAmt);
	}
	var percent = document.getElementById("nonFundedSharePercent").value;
	var memoExposure = document.getElementById("memoExposure").value;
	if(memoExposure==undefined)
	{
		memoExposure = 0;
	}
	else{
		memoExposure=eval(memoExposure);
	}
	var fundedAmt = document.getElementById("totalFundedLimit").value;
	if(fundedAmt==undefined)
	{
		fundedAmt = 0;
	}
	else{
		fundedAmt=eval(fundedAmt);
	}
	document.getElementById("nonFundedShareLimit").value = (nonFundedAmt*(percent/100));
	document.getElementById("totalSanctionedLimit").value = nonFundedAmt+fundedAmt+memoExposure;
}

function  calculateTotalFunded()
{
	var nonFundedAmt = document.getElementById("totalNonFundedLimit").value;
	if(nonFundedAmt==undefined)
	{
		
		nonFundedAmt = 0;
	}
	else{
		
		nonFundedAmt=eval(nonFundedAmt);
	}
	var memoExposure = document.getElementById("memoExposure").value;
	if(memoExposure==undefined)
	{
		
		memoExposure = 0;
	}
	else{
		
		memoExposure=eval(memoExposure);
	}
	var fundedAmt = document.getElementById("totalFundedLimit").value;
	if(fundedAmt==undefined)
	{
		
		fundedAmt = 0;
	}
	else{
		
		fundedAmt=eval(fundedAmt);
	}
	var percent = document.getElementById("fundedSharePercent").value;
	document.getElementById("fundedShareLimit").value = (fundedAmt * (percent/100));
	document.getElementById("totalSanctionedLimit").value =nonFundedAmt+fundedAmt+memoExposure;
}
    
function disableIfscCode(){
	var checkbox = document.getElementById('isNBFC');
	if (checkbox.checked == true){
	  document.getElementById("iFSCCode").value="";
	  document.getElementById("iFSCCode").disabled = true;
	}else{
	  document.getElementById("iFSCCode").disabled = false;
	}
}

window.onload = function() {
	var e = document.getElementById("bankingMethod");
	onloadDetails(e);
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>Financial Details</h3>
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
			<tr id="financialdetails">
				<td>
				<table width="100%" height="100%" cellspacing="0" cellpadding="0"
					border="0">
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo"
							width="100%">
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="25%">Sub Line<font color="red">*</font></td>
									<td width="25%">
									<%if( value.getSubLine()==null){
											%>
						                  	<input type="radio" name="subLine"  value="OPEN" onclick="javascript : enbleBtn(1);">Yes</input>
					                  		<input type="radio" name="subLine" checked="checked" value="CLOSE" onclick="javascript : enbleBtn(2);">No</input>
					                  		<%
										}
										else if( value.getSubLine().equalsIgnoreCase("OPEN") ){
					                  	%>
					                  	<input type="radio" name="subLine" checked="checked" value="OPEN"  onclick="javascript : enbleBtn(1);">Yes</input>
				                  		<input type="radio" name="subLine" value="CLOSE" onclick="javascript : enbleBtn(2);">No</input>
				                  		<%}else{%>
				                  			<input type="radio" name="subLine"  value="OPEN"  onclick="javascript : enbleBtn(1);">Yes</input>
					                  		<input type="radio" name="subLine" checked="checked" value="CLOSE" onclick="javascript : enbleBtn(2);">No</input>
				                  		<%} %>
										<br><html:errors property="subLineError"/>
										</td>
									<td class="fieldname" width="25%">&nbsp;
									
									</td>
									<td width="25%">&nbsp;</td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<%if(value.getSubLine().equals("OPEN")) {%>
						<td align="right"><input type="button" name="button"
							id="detailBtn" value="Add Details" class="btnNormal"
						onclick="javascript : addSubLine('add_sub_line_in_edit')">
						</td>
						<%}else{ %>
						<td align="right"><input type="button" name="button"
							id="detailBtn" value="Add Details" class="btnNormal"
							disabled="disabled" onclick="javascript : addSubLine('add_sub_line_in_edit')">
						</td>
						<%} %>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				
					<tr>
						<td>
							<%if(value.getSubLine().equals("OPEN")) {%>
								<html:errors property="sublineListEmptyError"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="sblnDetails" >
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Party</td>
									<td>Facility</td>
									<td>Amount (INR)</td>
									<td>Action</td>
								</tr>
							</thead>
							<tbody>
						
								<logic:present name="partyGrpList">
										<logic:iterate id="ob" name="partyGrpList"
											type="com.integrosys.cms.app.customer.bus.OBSubline"
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
											
											<tr class="<%=rowClass%>">
												<td  class="index"><%=sno%></td>
												<td><center><%=ob.getPartyGroup().getCustomerName()%></center></td>
												<td><center>GUARANTEE</center></td>
												<td><center><%=ob.getAmount()%></center></td>
									            
									              <td>
												<center><select id="actionType<%=sno%>"
													onchange="getAction('<%=ob.getPartyId()%>','<%=ob.getAmount()%>','<%=sno%>')">
													<option value="">-Select-</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
												</td>
									            
											</tr>
											
										</logic:iterate>
									</logic:present>
								 <%if(partyGrpList.size()==0 ){ %>
								
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									<%} %>
								
							</tbody>
						</table>
						<%}else if(value.getSubLine().equals("")) {%>
						
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="sblnDetails" style="display: none;">
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Party</td>
									<td>Facility</td>
									<td>Amount (INR)</td>
									<td>Action</td>
								</tr>
							</thead>
							<tbody>
						
								<logic:present name="partyGrpList">
										<logic:iterate id="ob" name="partyGrpList"
											type=" com.integrosys.cms.app.customer.bus.OBSubline"
											 scope="page">
											<%
												String rowClass = "";
														sno=0;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											
											<tr class="<%=rowClass%>">
												<td></td>
												<td></td>
												<td></td>
												<td></td>
									            <td></td>
											</tr>
											
										</logic:iterate>
									</logic:present>
								 <%if(partyGrpList.size()==0 ){ %>
									
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									<%} %>
								
							</tbody>
						</table>
						
					<%} %>
					</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Start Banking Method >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->					

<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<End Banking Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
						
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo">
							<tbody>
								<tr class="even">
									<td class="fieldname" width="17%">Total Funded Limit (INR)<font color="red">*</font></td>
									<td width="17%"><html:text property="totalFundedLimit" styleId="totalFundedLimit"
										size="30" maxlength="23" onkeyup="javascript:calculateFinancialDetail()" styleId="totalFundedLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"></html:text>&nbsp;

										<br><html:errors property="totalFundedLimitError"/>
										<html:errors property="totalFundedLimitLengthError"/>
										</td>
									<td class="fieldname" width="17%">Funded Share %<font color="red">*</font></td>
									<td width="17%"><html:text property="fundedSharePercent" styleId="fundedSharePercent"
										size="10" maxlength="6" onkeyup="javascript:calculateFinancialDetail()"></html:text>&nbsp;
										<br><html:errors property="fundedSharePercentError"/>
										<html:errors property="fundedSharePercentLengthError"/>
										</td>
									<td class="fieldname" width="17%">Funded Share Limit (INR)</td>
									<td width="17%"><html:text property="fundedShareLimit" styleId="fundedShareLimit"
										size="30" maxlength="20" readonly="true"></html:text>&nbsp;</td>
								</tr>
								
								<tr class="even">
									<td class="fieldname">Total Non Funded Limit (INR)<font color="red">*</font></td>
									<td><html:text property="totalNonFundedLimit" styleId="totalNonFundedLimit" size="30"
										maxlength="23" onkeyup="javascript:calculateFinancialDetail()" styleId="totalNonFundedLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"></html:text>&nbsp;

										<br><html:errors property="totalNonFundedLimitLengthError"/>
										<html:errors property="totalNonFundedLimitError"/>
										</td>
									<td class="fieldname">Non Funded Share %</td>
									<td><html:text property="nonFundedSharePercent" styleId="nonFundedSharePercent" size="10"
										maxlength="6" onkeyup="javascript:calculateFinancialDetail()"></html:text>&nbsp;
										<br><html:errors property="nonFundedSharePercentLengthError"/>
										</td>
									<td class="fieldname">Non Funded Limit (INR)</td>
									<td><html:text property="nonFundedShareLimit" styleId="nonFundedShareLimit" size="30"
										maxlength="20" readonly="true"></html:text>&nbsp;</td>
								</tr>
								
								<tr class="even">
									<td class="fieldname">Memo Exposure<font color="red">*</font></td>
									<td><html:text property="memoExposure" styleId="memoExposure" size="30"
										maxlength="23"  onkeyup="javascript:calculateFinancialDetail()" styleId="memoExposure" onblur="javascript:formatAmountAsCommaSeparated(this)"></html:text>&nbsp;
										<br><html:errors property="memoExposureError"/>
										<html:errors property="memoExposureLengthError"/>
										</td>
									<td class="fieldname"><bean:message key="label.dpShare.percent"/></td>
									<td><html:text property="dpSharePercent" styleId="dpSharePercent" size="10" maxlength="6" onkeyup="javascript:allowNumericDecimal(this)"></html:text>&nbsp;<br><html:errors property="dpSharePercentLengthError"/></td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								
								<tr class="even">
									<td class="fieldname">Total Sanctioned Limits</td>
									<td><html:text property="totalSanctionedLimit" styleId="totalSanctionedLimit" size="30"
										maxlength="25" readonly="true"></html:text>&nbsp;</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								
								<tr class="even">
									<td class="fieldname">MPBF </td>
									<td><html:text property="mpbf" size="23" maxlength="15" styleId="mpbf" onblur="javascript:formatAmountAsCommaSeparated(this)"></html:text>&nbsp;</td>
									<td class="fieldname">&nbsp;
									<br><html:errors property="mpbfError"/>
									<html:errors property="mpbfLengthError"/>
									</td>
									<td>&nbsp;</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								
								<logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str);
										%>
										
											<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str%>"/>
										
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
	
	
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" styleId="exceptionalCases"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="isNBFC" styleId="isNBFC"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="iFSCCode" styleId="iFSCCode"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="bankBranchName" styleId="bankBranchName"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="branchNameAddress" styleId="branchNameAddress"/>
	
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" styleId="cifId"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" styleId="status"/>
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
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" styleId="pan"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
	<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	
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
			<html:hidden property="event"></html:hidden>
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
		property="systemListEmpty" />
		
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="directorListEmpty" />
		
		<%if(partyGrpList!=null && partyGrpList.size()==0 && value.getSubLine().equals("OPEN")){ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" value="Y" />
		<%}else{ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" value="N" />
		<%} %>
		
		<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
		<html:hidden name="ManualInputCustomerInfoForm" property="form6061Checked"/>
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated"  />
<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
	<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />

		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
		
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


<!-- InstanceEnd -->

