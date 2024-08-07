<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.ArrayList,java.util.*"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
   <script type="text/javascript" src="js/jquery.min.js"></script>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,
	com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,
	com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector,com.integrosys.cms.app.customer.bus.OBIfscMethod"%>
<%
	int sno = 0;
	int no = 0;
	String event =(String) request.getAttribute("event");
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
			if("S".equals(ob.getBankType())){
				soretedMap.put(ob.getSystembank().getSystemBankName().toUpperCase(),ob);
			}
			else if("O".equals(ob.getBankType())){
				soretedMap.put(ob.getOtherbranch().getOtherBranchName().toUpperCase()+"+"+ob.getOtherbranch().getOtherBankCode(),ob);
			}
		}

		branchList = new ArrayList(soretedMap.values());
		}
	if (branchList != null) {

		pageContext.setAttribute("branchList", branchList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	else
	{
		pageContext.setAttribute("branchList", new ArrayList());
	}
	List partyGrpList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGrpList");

	if (!(partyGrpList == null)) {

		pageContext.setAttribute("partyGrpList", partyGrpList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	else
	{
		pageContext.setAttribute("partyGrpList", new ArrayList());
	}
	

	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");
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
	
	
	List bankMethodListNew1 =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.bankMethodListNew1");
	System.out.println("-bankMethodListNew1------------------------------>>>>>>>>>>>>>>"+bankMethodListNew1);
	pageContext.setAttribute("bankMethodListNew1",bankMethodListNew1);
	List bankMethodListNew2 =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.bankMethodListNew2");
	//List bankMethodListNew2 =new ArrayList();
	pageContext.setAttribute("bankMethodListNew2",bankMethodListNew2);
	//pageContext.setAttribute("bankMethodList2",bankMethodListNew2);
	
	//System.out.println("bankMethodListNew1=======>"+bankMethodListNew1);
	//System.out.println("bankMethodListNew2=======>"+bankMethodListNew2);
	
	String methodBanksList =value.getFinalBankMethodList();
	String methodBanksList22 =value.getBankingMethod();
System.out.println("value.getFinalBankMethodList()====>"+methodBanksList);
System.out.println("value.getBankingMethod()====>"+methodBanksList22);

 String bankMethodAllowed=value.getBankingMethod();

 if(null!=bankMethodListNew1 && null!=bankMethodListNew2) {
	 	for(int i=0;i<bankMethodListNew2.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)bankMethodListNew2.get(i);
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			bankMethodListNew1.add(lvBean1);
	 			bankMethodListNew2.remove(lvBean1);
	 	}
	}
 
 
 /* System.out.println("********bankMethodListNew1=======>"+bankMethodListNew1);
	System.out.println("**********bankMethodListNew2=======>"+bankMethodListNew2);
	 */
	ArrayList newArrBankMethod = new ArrayList();
 int cnt = bankMethodListNew1.size();
if(null!=bankMethodAllowed && null!=bankMethodListNew1) {
	List<String> items = Arrays.asList(bankMethodAllowed.split(","));
	
 	for(int i=0;i<cnt;i++) {
 		LabelValueBean lvBean=(LabelValueBean)bankMethodListNew1.get(i);
 	//	System.out.println("lvBean.getValue()="+lvBean.getValue()+"**lvBean.getLabel()="+lvBean.getLabel()+"**items="+items);
 		//if(items.contains(lvBean.getValue())) {
 			if(items.contains(lvBean.getLabel())) {
 			System.out.println("i="+i+" **true=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			System.out.println("lvBean1===>"+lvBean1);
 			//System.out.println("true lvBean1===>"+lvBean1);
 			bankMethodListNew2.add(lvBean1);
 			//bankMethodListNew1.remove(lvBean1);
 			newArrBankMethod.add(lvBean1);
 		}else{
 			System.out.println("i="+i+" **false=>items=>"+items+"**lvBean.getValue()=>"+lvBean.getValue());
 		}
 	}
}
System.out.println("newArrBankMethod=>"+newArrBankMethod.size());
System.out.println("bankMethodListNew1=>"+bankMethodListNew1.size());

if(null!=bankMethodListNew1 && null!=newArrBankMethod) {
 	for(int i=0;i<newArrBankMethod.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)newArrBankMethod.get(i);
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			//bankMethodListNew1.add(lvBean1);
 			bankMethodListNew1.remove(lvBean1);
 	}
}
System.out.println("After bankMethodListNew1=>"+bankMethodListNew1.size());
pageContext.setAttribute("bankMethodListNew1",bankMethodListNew1);
pageContext.setAttribute("bankMethodListNew2",bankMethodListNew2);

System.out.println("++bankMethodListNew1--=======>"+bankMethodListNew1);
System.out.println("++bankMethodListNew2--=======>"+bankMethodListNew2);

System.out.println("*****value.getRevisedEmailIdsArray()--=======>"+value.getRevisedEmailIdsArray());

 if(value != null){
	if(value.getRevisedEmailIdsArray() != null){
		for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
			System.out.println("+++++value.getRevisedEmailIdsArray()--=======>"+value.getRevisedEmailIdsArray()[i].toString()+" ** value.getRevisedEmailIdsArray().length=>"+value.getRevisedEmailIdsArray().length);
		}
	}
} 
 
 String[] revisedArr1 = value.getRevisedEmailIdsArray();
 String[] revisedArr = value.getRevisedEmailIdsArray();
 List listOfRevisedMailId = new ArrayList();
 int len = 0;
 int cnts = 0;
 if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			len = revisedArr1.length;
			revisedArr = new String[len];
			for(int i=0; i<value.getRevisedEmailIdsArray().length ;i++){
				revisedArr[i] = revisedArr1[i];
				listOfRevisedMailId.add(revisedArr1[i]);
				System.out.println("I="+i+"=>revisedArr[i]===>"+revisedArr[i]);
			}
		}
	}  
 
 if( revisedArr != null ){
	 cnts = revisedArr.length;
 }
 System.out.println("Revised ArrayList create banking method =>"+value.getRevisedArrayListN());
 String strss = "";
 System.out.println("Event=>"+value.getEvent());
 String eventFrom =(String) session.getAttribute("fromPage");
 System.out.println("From Event=>"+eventFrom);
String addBankMethod= "Add";
String deleteBankMethod= "Delete";

%>
<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->

<%@page
	import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBBankingMethod"%><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
    <script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script type="text/javascript" src="js/ajaxList.js"></script>
    <script type="text/javascript" src="js/ajaxFinancialAmount.js"></script>
    <!-- <script type="text/javascript" src="js/itgDualList.js"></script> -->
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

function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}
function enbleBtn(ifChecked){
	if(ifChecked == 1){
		document.getElementById('detailBtn').disabled = false;
		document.getElementById('sblnDetails').style.display = ''
		document.getElementById('sblnDetailsEmpty').style.display = ''
	}else if (ifChecked == 2 ){
		document.getElementById('detailBtn').disabled = true;
		document.getElementById('sblnDetails').style.display = 'none'		
			document.getElementById('sblnDetailsEmpty').style.display = 'none'		
	}
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
	
	
	if(selobj.value == 'MULTIPLE' ){
	//	document.getElementById('bnklbl').style.display = '';
	//	document.getElementById('exceptionalCasesSpan').style.display = '';
		document.getElementById('isMultiple').style.visibility = "visible";
	//	document.getElementById('exceptional2').style.visibility = "visible";
	//	document.getElementById('exceptional1').style.visibility = "visible";
		
		
	//	document.getElementById('button2').style.display = '';
	//	document.getElementById('bnkdtltbl').style.display = '';
	//	document.getElementById("fundedSharePercent").value = '';
	//	document.getElementById("nonFundedSharePercent").value = '';
	}else if(selobj.value == 'CONSORTIUM'){
		document.getElementById('isConsortium').style.visibility = "visible";
		/* document.getElementById('isNBFC1').style.visibility = "hidden";
		document.getElementById('exceptional2').style.visibility = "hidden";
		document.getElementById('exceptional1').style.visibility = "hidden";
		
		//document.getElementById('bnkname').style.display = 'none';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = 'none';
		document.getElementById("fundedSharePercent").value = '100';
		document.getElementById("nonFundedSharePercent").value = '100'; */
		
	}else{
		document.getElementById('isConsortium').style.display = '';
		document.getElementById('isMultiple').style.display = '';
		document.getElementById('isConsortium').style.visibility = "hidden";
		document.getElementById('isMultiple').style.visibility = "hidden";
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

$(document).on('dblclick','.nodalLead',function(){
	    if(this.checked){
	        $(this).prop('checked', false);
	    }
	});
	
$(document).on('dblclick','.leadValue',function(){
	    if(this.checked){
	        $(this).prop('checked', false);
	    }
	});
	
	
	

function getAction(id,amt,ind) {
	
	
	
	var type = document.getElementById("actionType"+ind).value;
   
	 if(type =="Edit"){
		document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&amount="+amt;	
		
    	document.forms[0].event.value = "edit_subline_party";
    		
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&amount="+amt;		
    	document.forms[0].event.value = "delete_subline_party";
    	document.forms[0].submit();
	}	    
}
function getDelete(id,banktype,ind) {
	
	var type = document.getElementById("actionDelete"+ind).value;
  
   var answer = confirm("Are you sure you want to delete this branch ?")
   if(answer == true)	
   {
	   if( type == "Delete"){					
			document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&banktype="+banktype;		
	    	document.forms[0].event.value = "delete_banking_method";
	    	document.forms[0].submit();
		}	
   }
	    
}
function getDeleteIfsc(id,banktype,ind) {
	
   var type = document.getElementById("actionDelete"+ind).value;
   
   var answer = confirm("Are you sure you want to delete this branch ?")
   if(answer == true)	
   {
	   if (document.getElementById("nodalLead"+ind).checked) {
			 document.getElementById('nodalLead'+ind).checked=false;
	   }
	   if( type == "Delete"){					
			document.forms[0].action = "ManualInputCustomer.do?partyId=" +id +"&index="+ind+"&banktype="+banktype+"&ifscFlag=false";		
	    	document.forms[0].event.value = "delete_banking_method";
	    	document.forms[0].submit();
		}	
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
       var url = '/cms/ManualInputCustomer.do?event=calculate_financial_detail&totalNonFundedLimit='+totalNonFundedLimit+'&nonFundedSharePercent='+nonFundedSharePercent+'&memoExposure='+memoExposure+'&totalFundedLimit='+totalFundedLimit+'&fundedSharePercent='+fundedSharePercent;
       sendLoadSancAmountReq(dep, url);
}

function getBankList(name)
{	
	//alert("In getBankList");
	var exceptionalCase= document.getElementById("exceptionalCases").value;
	//alert("exceptionalCase in getBankList()"+exceptionalCase);
	var bankingMethod= document.getElementById("bankingMethod").value;
	//alert("Banking Method in getBankList()"+bankingMethod);
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
	      			var name1="display_bank_list_ifsc_code";  
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

function  calculateTotalNonFunded()
{
	var nonFundedAmt = document.getElementById("totalNonFundedLimit").value;
	

	if(nonFundedAmt !='undefined')
	{
		nonFundedAmt=eval(nonFundedAmt);
	}
	else
	{
		nonFundedAmt = 0;
	}
	var percent = document.getElementById("nonFundedSharePercent").value;
	 
	var memoExposure = document.getElementById("memoExposure").value;

	
	
	if(typeof(memoExposure) !='undefined')
	{
		memoExposure=eval(memoExposure);	
	}
	else
	{
		memoExposure = 0;
	}
	var fundedAmt = document.getElementById("totalFundedLimit").value;
	if(typeof(fundedAmt) !='undefined')
	{
		fundedAmt=eval(fundedAmt);
	}
	else
	{
		fundedAmt = 0;
	}

	    
	
	document.getElementById("nonFundedShareLimit").value = (nonFundedAmt*(percent/100));
	document.getElementById("totalSanctionedLimit").value = nonFundedAmt+fundedAmt+memoExposure;
}

function  calculateTotalFunded()
{
	
	var nonFundedAmt = document.getElementById("totalNonFundedLimit").value;
	if(typeof(nonFundedAmt) !='undefined')
	{
		nonFundedAmt=eval(nonFundedAmt);
		
	}
	else
	{
		nonFundedAmt =  0;
	}
	var memoExposure = document.getElementById("memoExposure").value;

	
	if(typeof(memoExposure) !='undefined')
	{
		memoExposure= eval(memoExposure);
	}
	else
	{
		memoExposure = 0;
	}
	var fundedAmt = document.getElementById("totalFundedLimit").value;
	
	if(typeof(fundedAmt) !='undefined')
	{
		fundedAmt=eval(fundedAmt);	
	}
	else
	{
		fundedAmt = 0;
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
	//alert('hiiiiiiss');
	var bankMetVal = '<%=methodBanksList22%>';
	var methodBanksList =  '<%=methodBanksList%>';
	
	 <%-- var revisedArrayLi = <%=revisedArr%>; --%>
	var counts = <%=cnts%>; 
	var str = '<%=listOfRevisedMailId%>';
	
	
	if(bankMetVal != null && bankMetVal != ''){
		document.getElementById("finalBankMethodList").value = bankMetVal;
		document.getElementById("bankingMethod").value = bankMetVal;
	}
	/* alert("methodBanksList=>"+methodBanksList);
	if(methodBanksList != null && methodBanksList != ''){
			document.getElementById("finalBankMethodList").value = methodBanksList;
			document.getElementById("bankingMethod").value = methodBanksList;
		} */
	var oper = 'Delete';
	shwdetailsOnSelectionSole(bankMetVal,oper);
	//var e = document.getElementById("bankingMethod");
	//onloadDetails(e);
	
	str=str.replace("[","");
	str=str.replace("]","");
	if(str != ''){
	//alert("str=>"+str);
	var aaStr = str.split(", Ljava.lang.String");
	var arString = aaStr[0].split(", **");
	 for(var i=0;i<counts;i++){
		//var val = revisedArrayLi[i];
		//alert(val);
		//alert(arString[i]);
		//var splits = arString[i].split(", Ljava.lang.String");
		var splits = arString[i];
		//alert("splits=>"+splits);
		//var splitStr = arString[i].split("-");
		if(typeof(splits) != 'undefined'){
		var splitStr = splits.split("-");
		var idStr = 'revisedEmailIds' + (i+1);
		var idStr1 = 'selects' + (i+1);
	//alert(typeof(idStr1));
	//alert('hmm=>'+splitStr);
	//alert('splitStr[1]=>'+splitStr[1]);
	if(splitStr[1] != 'undefined' && typeof(splitStr[1]) != 'undefined'){
		document.getElementById(idStr).value = splitStr[1];
		document.getElementById(idStr1).value ='**' + idStr1 +'-'+ splitStr[1]+'-'+ splitStr[2]+'-'+ splitStr[3];
	}
		}
	 }
	} 
	
	
	
	
}

function moveDualList( srcList, destList, moveAll,operation) 
{
	// Do nothing if source is empty
	var bankMethodVal = document.getElementById("bankingMethod");
	if (!hasOptions(srcList) ||
		(( srcList.selectedIndex == -1 ) && ( moveAll == false ) )) { return; } // or nothing is selected 
	var SelID='';
	var SelText='';
	// Move rows from srcList to destList from bottom to top
	for (i=srcList.options.length - 1; i>=0; i--)
	{ 
		if (srcList.options[i].selected == true || moveAll)
		{
			SelID=srcList.options[i].value;
			SelText=srcList.options[i].text;
			
			var newRow = new Option(SelText,SelID);
			//alert("newRow="+newRow.value);
			//Method for Others banking methods than SOLE and empty String while ADD.
			shwdetailsOnSelection(newRow,operation);
			destList.options[destList.length]=newRow;
			srcList.options[i]=null;
		}
	}
	sortSelect(destList);
	
	var temp="";
	if(operation=="Add"){
		
		//alert("if(operation==Add)"+operation)
		//alert("destList "+destList.length);
		for(var i=0;i<destList.length-1;i++){
			temp+=destList[i].value+",";
			//alert(temp);
		}
		temp+=destList[destList.length-1].value
		//alert("temp ------------------> : "+temp);
		//Method for SOLE and empty String while ADD and Delete.
		
		document.getElementById('finalBankMethodList').value=temp;
		//alert("Test 1"+document.getElementById("finalBankMethodList").value);
		document.getElementById("bankingMethod").value=temp;
		//alert("Test"+document.getElementById("bankingMethod").value);
		//shwdetailsOnSelectionSole(temp,operation);
	}
	if(operation=="Delete"){
		if(srcList.length==0)
			document.getElementById('finalBankMethodList').value="";
			document.getElementById("bankingMethod").value="";
		
		for(var i=0;i<srcList.length-1;i++){
			temp+=srcList[i].value+",";
		}
		//alert('hmm3='+srcList.length);
		if(srcList.length !== 0){
			temp+=srcList[srcList.length-1].value
		}
		///alert(temp);
		//Method for SOLE and empty String while ADD and Delete.
		//shwdetailsOnSelectionSole(temp,operation);
		document.getElementById('finalBankMethodList').value=temp;
		document.getElementById("bankingMethod").value=temp;
	}	
}

function hasOptions(obj) 
{
	if (obj!=null && obj.options!=null && obj.options.length>0) { return true; }
	return false;
}

function sortSelect(obj) 
{
	var o = new Array();
	if (!hasOptions(obj)) { return; }

	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
	}
	if (o.length==0) { return; }
	o = o.sort(
		function(a,b) {
			if ((a.text+"") < (b.text+"")) { return -1; }
			if ((a.text+"") > (b.text+"")) { return 1; }
			return 0;
		}
	);

	for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}
}


function shwdetailsOnSelection(selobj,val){
	if(val == "Add"){
		//alert("shwdetailsOnSelection=>"+selobj.value);
	if(selobj.value == 'MULTIPLE-MULTIPLE' || selobj.value == 'CONSORTIUM-CONSORTIUM' || selobj.value == 'OUTSIDEMULTIPLE-OUTSIDE MULTIPLE'
			||selobj.value == 'OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM'){
		
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
	}
	/* else if(temp == 'SOLE' || selobj.value == '' || temp == ''){
		
		document.getElementById('isNBFC1').style.visibility = "hidden";
		document.getElementById('exceptional2').style.visibility = "hidden";
		document.getElementById('exceptional1').style.visibility = "hidden";
		
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = 'none';
		document.getElementById("fundedSharePercent").value = '100';
		document.getElementById("nonFundedSharePercent").value = '100';
		
	} */
	
	if(selobj.value == 'MULTIPLE-MULTIPLE' ){
	
		document.getElementById('isMultiple').style.visibility = "visible";
		
	}else if(selobj.value == 'CONSORTIUM-CONSORTIUM'){
		document.getElementById('isConsortium').style.visibility = "visible";
	}
	
	/*  else {
		 if(!temp.includes('CONSORTIUM')){
	 
		document.getElementById('isConsortium').style.display = '';
		//document.getElementById('isMultiple').style.display = '';
		document.getElementById('isConsortium').style.visibility = "hidden";
		//document.getElementById('isMultiple').style.visibility = "hidden";
		 }
		 if(!temp.includes('MULTIPLE')){
			 document.getElementById('isMultiple').style.display = '';
			 document.getElementById('isMultiple').style.visibility = "hidden";
		 }
	}  */
	}
	
	/* if(val == "Delete"){
		if(temp == 'MULTIPLE' || temp == 'CONSORTIUM' || temp == 'OUTSIDEMULTIPLE'||temp == 'OUTSIDECONSORTIUM'){
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
		}
		else if(temp == 'SOLE' || selobj.value == '' || temp == ''){
			
			document.getElementById('isNBFC1').style.visibility = "hidden";
			document.getElementById('exceptional2').style.visibility = "hidden";
			document.getElementById('exceptional1').style.visibility = "hidden";
			
			document.getElementById('button2').style.display = '';
			document.getElementById('bnkdtltbl').style.display = 'none';
			document.getElementById("fundedSharePercent").value = '100';
			document.getElementById("nonFundedSharePercent").value = '100';
			
		} 
		 */
	/*	if(selobj.value == 'MULTIPLE' ){
			
			document.getElementById('isMultiple').style.display = '';
			document.getElementById('isMultiple').style.visibility = "hidden";
			
		}else if(selobj.value == 'CONSORTIUM'){
			document.getElementById('isConsortium').style.display = '';
			document.getElementById('isConsortium').style.visibility = "hidden";
			
		}
		/* else{
			document.getElementById('isConsortium').style.display = '';
			document.getElementById('isMultiple').style.display = '';
			document.getElementById('isConsortium').style.visibility = "hidden";
			document.getElementById('isMultiple').style.visibility = "hidden";
		} 
		} */
	 if(val == "Delete"){
		 
			if(selobj.value == 'MULTIPLE-MULTIPLE' || selobj.value == 'CONSORTIUM-CONSORTIUM' || selobj.value == 'OUTSIDEMULTIPLE-OUTSIDE MULTIPLE'||selobj.value == 'OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM'){
				document.getElementById('bnklbl').style.display = '';
				document.getElementById('exceptionalCasesSpan').style.display = '';
				document.getElementById('isNBFC1').style.visibility = "visible";
				document.getElementById('exceptional2').style.visibility = "visible";
				document.getElementById('exceptional1').style.visibility = "visible";
				
				//document.getElementById('bnkname').style.display = '';
				document.getElementById('button2').style.display = '';
				document.getElementById('bnkdtltbl').style.display = '';
//				document.getElementById("fundedSharePercent").value = '';
//				document.getElementById("nonFundedSharePercent").value = '';
			}/*
			else if(selobj.value == 'SOLE' || selobj.value == '' || selobj.value == ''){
				
				document.getElementById('isNBFC1').style.visibility = "hidden";
				document.getElementById('exceptional2').style.visibility = "hidden";
				document.getElementById('exceptional1').style.visibility = "hidden";
				
				document.getElementById('button2').style.display = '';
				document.getElementById('bnkdtltbl').style.display = 'none';
				document.getElementById("fundedSharePercent").value = '100';
				document.getElementById("nonFundedSharePercent").value = '100';
				
			} */
			
			if(selobj.value == 'MULTIPLE-MULTIPLE' ){
				
				document.getElementById('isMultiple').style.display = '';
				document.getElementById('isMultiple').style.visibility = "hidden";
				
			}else if(selobj.value == 'CONSORTIUM-CONSORTIUM'){
				document.getElementById('isConsortium').style.display = '';
				document.getElementById('isConsortium').style.visibility = "hidden";
				
			}
			/* else{
				document.getElementById('isConsortium').style.display = '';
				document.getElementById('isMultiple').style.display = '';
				document.getElementById('isConsortium').style.visibility = "hidden";
				document.getElementById('isMultiple').style.visibility = "hidden";
			} */
			} 
	
	
}

function shwdetailsOnSelectionSole(temp,operation){
	//alert(operation+"**"+temp+"*");
	if (temp == 'SOLE-SOLE' || temp == '') {

			document.getElementById('isNBFC1').style.visibility = "hidden";
			document.getElementById('exceptional2').style.visibility = "hidden";
			document.getElementById('exceptional1').style.visibility = "hidden";

			document.getElementById('button2').style.display = '';
			document.getElementById('bnkdtltbl').style.display = 'none';
			//document.getElementById("fundedSharePercent").value = '100';
			//document.getElementById("nonFundedSharePercent").value = '100';
			
			document.getElementById('isConsortium').style.display = '';
			document.getElementById('isMultiple').style.display = '';
			document.getElementById('isConsortium').style.visibility = "hidden";
			document.getElementById('isMultiple').style.visibility = "hidden";

		}
	
	if(operation == 'Delete'){
		//alert('Deletedddd=>'+temp);
	 if(temp.indexOf("MULTIPLE-MULTIPLE,") !== -1 || temp.indexOf(",MULTIPLE-MULTIPLE") !== -1 || temp == 'MULTIPLE-MULTIPLE'){
		document.getElementById('isMultiple').style.visibility = "visible";
	}else{
		document.getElementById('isMultiple').style.display = '';
		document.getElementById('isMultiple').style.visibility = "hidden";
	}
	 
	 if(temp.indexOf("CONSORTIUM-CONSORTIUM,") !== -1 || temp.indexOf(",CONSORTIUM-CONSORTIUM") !== -1 || temp == 'CONSORTIUM-CONSORTIUM'){
		 document.getElementById('isConsortium').style.visibility = "visible";
	}else{
			document.getElementById('isConsortium').style.display = '';
			document.getElementById('isConsortium').style.visibility = "hidden";
		}
	}
	 
	}
	
	
function revisedEmailIdFunction(val,id,bankType,bankId){
	//alert("val ="+val.value);
	//alert("id ="+id);
	document.getElementById(id).value ='**' + id +'-' + val.value + '-' + bankType + '-' +bankId;
}
</script>
<!-- InstanceEndEditable -->
</head>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>Banking Method</h3>
						<html:errors property="bankingMethodError"/>
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

			<tr id="financialdetails">
				<td>
				<table width="100%" height="100%" cellspacing="0" cellpadding="0"
					border="0">
					
					
					
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Start Banking Method >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
					
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo"
							width="100%">
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="25%">Banking Method<font color="red">*</font></td>
										<td width="30%">
										<html:select name="ManualInputCustomerInfoForm" size="10" multiple="multiple" style="width:260" property="bankMethodList1" >
						        <html:options collection="bankMethodListNew1" property="label" labelProperty="value" />
		                		</html:select>
										</td>
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(bankMethodList1,bankMethodList2, false,'Add')" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(bankMethodList2,bankMethodList1,false,'Delete')" 
													class="btnNormal"/>
										     </td>		               
										    <td>		
										    <html:select name="ManualInputCustomerInfoForm"  size="10" multiple="multiple" style="width:260" property="bankMethodList2"
										      >
							<html:options collection="bankMethodListNew2" property="label" labelProperty="value"/>  
							<%-- <html:options collection="bankMethodListNew2" labelProperty="label"  property="value" />  --%>
						</html:select> 
										&nbsp;
										</td>
								</tr>
				<!--onchange="javascript : shwdetails(this);"  -->
								<tr>
								<%
								System.out.println("value.getBankingMethod()===>"+value.getBankingMethod()+"*");
								%>
								<%--
								<%
								System.out.println("value.getBankingMethod()===>"+value.getBankingMethod()+"*");
								
								
									if (value.getBankingMethod().equals("MULTIPLE")
												|| value.getBankingMethod().equals("CONSORTIUM")
												|| value.getBankingMethod().equals("OUTSIDEMULTIPLE")
												|| value.getBankingMethod().equals("OUTSIDECONSORTIUM")) {%>
									<td class="fieldname" width="25%"><span id="bnklbl">Exceptional Cases </span>
									
									<%} else if (value.getBankingMethod().equals("")
												|| value.getBankingMethod().equals("SOLE")) {%>
									<td class="fieldname" width="25%">
										<span id="bnklbl">Exceptional Cases </span> 
									</td>
									<%}%>
									
									 <td class="even" width="25%">
									<%if (value.getBankingMethod().equals("MULTIPLE")
												|| value.getBankingMethod().equals("CONSORTIUM")
												|| value.getBankingMethod().equals("OUTSIDEMULTIPLE")
												|| value.getBankingMethod().equals("OUTSIDECONSORTIUM")) {%>
									<span id="exceptionalCasesSpan" style="text-align: center"> 
										<html:select property="exceptionalCases" styleId="exceptionalCases" style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.EXCEPTIONAL_CASES_ID%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
										<br><html:errors property="exceptionalCasesError"/>
									</span> 
									<%} else if (value.getBankingMethod().equals("") 
											|| value.getBankingMethod().equals("SOLE") || value.getBankingMethod().contains(",SOLE")
											|| value.getBankingMethod().contains("SOLE,")) {%>
									<span id="exceptionalCasesSpan"> 
										<html:select property="exceptionalCases" styleId="exceptionalCases" style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.EXCEPTIONAL_CASES_ID%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
										<br><html:errors property="exceptionalCasesError"/>
									</span> 
									<%}%>
									</td> --%>
									
									
									<td class="fieldname" width="25%">
										<span id="bnklbl">Exceptional Cases </span> 
									</td>
									<td class="even" width="25%">
									
									<span id="exceptionalCasesSpan" style="text-align: center"> 
										<html:select property="exceptionalCases" styleId="exceptionalCases" style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.EXCEPTIONAL_CASES_ID%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
										<br><html:errors property="exceptionalCasesError"/>
									</span> 
									</td>
									
								</tr>
								
								<%if (!value.getBankingMethod().equals("") && !value.getBankingMethod().equals("SOLE")) {%>
								<tr class="odd" id="isNBFC1">
									<td class="fieldname" width="25%">Bank Branch / NBFC without IFSC Code </td>
									<td> <input type="checkbox" name="isNBFC" id="isNBFC"   onclick="javascript:disableIfscCode()"></td>
									<td class="fieldname" width="25%">&nbsp;</td>
									<td width="25%">&nbsp;</td>
								</tr>
								<%} else{%>
								<tr class="odd" id="isNBFC1">
									<td class="fieldname" width="25%">Bank Branch / NBFC without IFSC Code </td>
									<td> <input type="checkbox" name="isNBFC" id="isNBFC"   onclick="javascript:disableIfscCode()"></td>
									<td class="fieldname" width="25%">&nbsp;</td>
									<td width="25%">&nbsp;</td>
								</tr>
								<%} %>
							</tbody>
						</table>
						</td>
					</tr>
					<tr class="even">
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<table border="0" cellspacing="0" cellpadding="0" class="tblInfo" width="100%">
								<tbody>
									<%if (!value.getBankingMethod().equals("") && !value.getBankingMethod().equals("SOLE")) {%>
									<tr id="exceptional2" class="odd">
										<td class="fieldname" width="30%">IFSC Code </td>
										<td> <html:text property="iFSCCode" styleId="iFSCCode"  maxlength="11" ></html:text>  </td>
										<td class="fieldname" width="35%">Bank Name </td>
										<td><html:text property="bankName"  styleId="bankName"  maxlength="25" ></html:text>   </td> 
										<td class="fieldname" width="35%">Bank Branch Name </td>
										<td ><html:text property="bankBranchName" styleId="bankBranchName"  maxlength="15"  ></html:text>  </td>
									</tr>
									<%} else{%>
									<tr id="exceptional2" class="odd">
										<td class="fieldname" width="30%">IFSC Code </td>
										<td> <html:text property="iFSCCode" styleId="iFSCCode"  maxlength="11" ></html:text>  </td>
										<td class="fieldname" width="35%">Bank Name </td>
										<td><html:text property="bankName"  styleId="bankName"  maxlength="25" ></html:text>   </td> 
										<td class="fieldname" width="35%">Bank Branch Name </td>
										<td ><html:text property="bankBranchName" styleId="bankBranchName" maxlength="15"  ></html:text>  </td>
									</tr>	
									<%} %>
								</tbody>
							</table>
						</td>
					</tr>
					<tr class="even">
						<td>&nbsp;</td>
					</tr>
					<%if (!value.getBankingMethod().equals("") && !value.getBankingMethod().equals("SOLE")) {%>
					<tr class="odd" id="exceptional1">
						<td align="right" width="100%">
							<input type="button"  class="btnNormal" onclick="javascript:getBankList('display_bank_list')"
									name="button2" id="button2" value="   Go   " >
						</td>
					</tr>
					
					<%} else{%>
					<tr class="odd" id="exceptional1">
						<td align="right" width="100%">
							<input type="button"  class="btnNormal" onclick="javascript:getBankList('display_bank_list')"
									name="button2" id="button2" value="   Go   " >
						</td>
					</tr>
					
					<%} %>
					<tr class="even">
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>
							<%if (value.getBankingMethod().equals("MULTIPLE")
									|| value.getBankingMethod().equals("CONSORTIUM")
									|| value.getBankingMethod().equals("OUTSIDEMULTIPLE")
									|| value.getBankingMethod().equals("OUTSIDECONSORTIUM")
									
									|| value.getBankingMethod().contains(",MULTIPLE-MULTIPLE")
									|| value.getBankingMethod().contains(",CONSORTIUM-CONSORTIUM")
									|| value.getBankingMethod().contains(",OUTSIDEMULTIPLE-OUTSIDE MULTIPLE")
									|| value.getBankingMethod().contains(",OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM")
									
									|| value.getBankingMethod().contains("MULTIPLE-MULTIPLE,")
									|| value.getBankingMethod().contains("CONSORTIUM-CONSORTIUM,")
									|| value.getBankingMethod().contains("OUTSIDEMULTIPLE-OUTSIDE MULTIPLE,")
									|| value.getBankingMethod().contains("OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM,")
									
									|| value.getBankingMethod().equals("MULTIPLE-MULTIPLE")
									|| value.getBankingMethod().equals("CONSORTIUM-CONSORTIUM")
									|| value.getBankingMethod().equals("OUTSIDEMULTIPLE-OUTSIDE MULTIPLE")
									|| value.getBankingMethod().equals("OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM")
									) {%>
							<html:errors property="nodalLeadError"/>
							<html:errors property="leadValueError"/>
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo" id="bnkdtltbl">
								<thead>
										<tr>
										<p style="color: blue;font-style: italic;font-weight: bold;font-size: 12px;">*Note-Double Click to  unselect the selected radio button for Nodal and Lead </p>
										</tr>
									<tr>
										<td>Sr. No.</td>
										<td>IFSC Code</td>
										<td>Bank Name</td>
										<td>Branch Name</td>
										<td>Address</td>
										<td>Email Id</td>
										<td>Revised Email Id</td>
										<td>Nodal</td>
										<td>Lead</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
								
									<logic:present name="branchList">
										<logic:iterate id="ob" name="branchList"
											type="com.integrosys.cms.app.customer.bus.OBBankingMethod" scope="page">
										<% String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
										%>
										
										<%if (ob.getBankType().equals("S")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getAddress()%>" />&nbsp;</center></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getContactMail()%>" />&nbsp;</center></td>
												
												<!-- Revised Mail Id -->
												<%-- <integro:empty-if-null value="<%=ob.getSystembank().getContactMail()%>" />  --%>
												<% strss = "revisedEmailIds" + no; %>
												<td>
												<%if(!(ob.getSystembank().getRevisedContactMail()==null || ob.getSystembank().getRevisedContactMail().isEmpty())){ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMail" value="<%=ob.getSystembank().getRevisedContactMail()%>" onblur="revisedEmailIdFunction(this,'selects<%=no%>','s','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="<%=ob.getSystembank().getRevisedContactMail()%>" />
												<%-- <html:hidden property="revisedContactMail" /> --%>
												<%}else{ %>
												<center>
													<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMail" value="" onblur="revisedEmailIdFunction(this,'selects<%=no%>','s','<%=ob.getBankId()%>');"/> &nbsp;</center>
													<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="<%="**selects" + no +"-" +""+ "-s-" +ob.getBankId()%>" />
												<%} %>
												</td>
												
											<td>
											<center>
											<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   String[] array = value.getNodalLead().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getNodalLead().startsWith("s") && Long.toString(ob.getBankId()).equals(bankId)) {%>
			
											<input type="radio" id="nodalLead" name="nodalLead" class="nodalLead" onclick="javascript:leadNodalCheck()" value="<%="s" + "," + ob.getBankId()%>" checked="checked" >
											<%}else{ %>
												<input type="radio" id="nodalLead" name="nodalLead" class="nodalLead" onclick="javascript:leadNodalCheck()" value="<%="s" + "," + ob.getBankId()%>">
											
											<%} %>
											<%}else{ %>
											<input type="radio" id="nodalLead" name="nodalLead"  class="nodalLead" value="<%="s" + "," + ob.getBankId()%>" onclick="javascript:leadNodalCheck()">
											<%} %>
											</center>
											</td>
											
											
											<!--Lead New Field  -->
											
											<td>
											<center>
											<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   String[] array = value.getLeadValue().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getLeadValue().startsWith("s") && Long.toString(ob.getBankId()).equals(bankId)) {%>
			
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="s" + "," + ob.getBankId()%>" checked="checked">
											<%}else{ %>
												<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="s" + "," + ob.getBankId()%>">
											
											<%} %>
											<%}else{ %>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="s" + "," + ob.getBankId()%>">
											<%} %>
											</center>
											</td>
											
											
                                        
                                        	<td>
                                       		<center>
                                        	<select id="actionDelete<%=no%>"
												onchange="getDelete('<%=ob.getBankId()%>','S','<%=no%>')">
												<option value="">-Select-</option>
												<option value="Delete">Delete</option>
											</select>
											</center>
                                        	</td>
										</tr>
										<%} else if (ob.getBankType().equals("O")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBranchName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getAddress()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getContactMailId()%>" />&nbsp;</center></td>
												
												
												<!--Revised Mail Id  -->
												
												<%-- <td><center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getContactMailId()%>" />&nbsp;</center></td> --%>
												<% strss = "revisedEmailIds" + no; %>
												<td>
												<%if(!(ob.getOtherbranch().getRevisedContactMailId()==null || ob.getOtherbranch().getRevisedContactMailId().isEmpty())){ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMailId" value="<%=ob.getOtherbranch().getRevisedContactMailId()%>" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>"  value="<%=ob.getOtherbranch().getRevisedContactMailId()%>"/>
												<%-- <html:hidden property="revisedContactMailId" /> --%>
												<%}else{ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMailId" value="" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>"  value="<%="**selects" + no +"-" +""+ "-o-" +ob.getBankId()%>"/>
												<%-- <html:hidden property="revisedContactMailId" /> --%>
												<%} %>
												</td>
											<td>
											<center>
											
											<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   String[] array = value.getNodalLead().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getNodalLead().startsWith("o") && Long.toString(ob.getBankId()).equals(bankId)) {%>
											<input type="radio" id="nodalLead" name="nodalLead" class="nodalLead" value="<%="o" + "," + ob.getBankId()%>" checked="checked">
											<%}else {%>
											<input type="radio" id="nodalLead" name="nodalLead" class="nodalLead" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											<%}else {%>
											<input type="radio" id="nodalLead" name="nodalLead" class="nodalLead" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											</center>
												
											</td>
											<!--Lead New Field  -->
											
											<td>
											<center>
											
											<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   String[] array = value.getLeadValue().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getLeadValue().startsWith("o") && Long.toString(ob.getBankId()).equals(bankId)) {%>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getBankId()%>" checked="checked">
											<%}else {%>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											<%}else {%>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											</center>
												
											</td>
											
											
											 <td>
                                       		<center>
                                        	<select id="actionDelete<%=no%>"
												onchange="getDelete('<%=ob.getBankId()%>','O','<%=no%>')">
												<option value="">-Select-</option>
												<option value="Delete">Delete</option>
											</select>
											</center>
                                        	</td>
										</tr>
										<%}%>
									</logic:iterate>
								</logic:present>
         						
         			<!-- @@@@@@@@@@@@@@@@@@@@  IFSC CODE @@@@@@@@@@@@@@@@@@@@@@@@@  -->               
                        		<logic:present name="ifscBranchList">
									<logic:iterate id="ob" name="ifscBranchList"
											type="com.integrosys.cms.app.customer.bus.OBIfscMethod" scope="page">
										<% String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
										%>
										<%if (ob.getBankType().equals("O")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getIfscCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBranchName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBranchNameAddress()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getEmailID()%>" />&nbsp;</center></td>
												
												<!--Revised Mail Id  -->
												
											<% strss = "revisedEmailIds" + no; %>
											<td>
											<%if(!(ob.getRevisedEmailID()==null || ob.getRevisedEmailID().isEmpty())){ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" name="revisedEmailID" property="revisedEmailID" value="<%=ob.getRevisedEmailID()%>" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getIfscCode()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="<%=ob.getRevisedEmailID()%>" />
												<%}else{ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" name="revisedEmailID" property="revisedEmailID" value="" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getIfscCode()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="" />
												<%} %>
												</td>
												<td>
											 <center>
											<%System.out.println("111111111111111111222222222222222");
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{System.out.println("1111====");
			                                   	String[] array = value.getNodalLead().split(",");
		                                       	String bankId = array[1];
			                                   	if (value.getNodalLead().startsWith("o") && ob.getIfscCode().equals(bankId)) { System.out.println("ifffff ++++");%>
												<input type="radio" id="nodalLead<%=no%>" name="nodalLead" class="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>" checked="checked">
												<%}else { System.out.println("else ++++");%>
												<input type="radio" id="nodalLead<%=no%>" name="nodalLead" class="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>">
												<%} %>
											<%}else {System.out.println("1111++++");%>
												<input type="radio" id="nodalLead<%=no%>" name="nodalLead" class="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>">
											<%} %>
											</center> 
												
											</td>
											
											
											<!--Lead New Field  -->
											
											<td>
											 <center>
											<%System.out.println("Lead  === 111111111111111111222222222222222");
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   	String[] array = value.getLeadValue().split(",");
		                                       	String bankId = array[1];
			                                   	if (value.getLeadValue().startsWith("o") && ob.getIfscCode().equals(bankId)) {%>
												<input type="radio" id="leadValue<%=no%>" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getIfscCode()%>" checked="checked">
												<%}else {%>
												<input type="radio" id="leadValue<%=no%>" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getIfscCode()%>">
												<%} %>
											<%}else {%>
												<input type="radio" id="leadValue<%=no%>" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getIfscCode()%>">
											<%} %>
											</center> 
												
											</td>
											
											
											 <td>
                                       		<center>
                                        	<select id="actionDelete<%=no%>"
												onchange="getDeleteIfsc('<%=ob.getIfscCode()%>','O','<%=no%>')">
												<option value="">-Select-</option>
												<option value="Delete">Delete</option>
											</select>
											</center>
                                        	</td>
										</tr>
										<%}%>
									</logic:iterate>
								</logic:present>
                <!-- @@@@@@@@@@@@@@@@@@@@  IFSC CODE @@@@@@@@@@@@@@@@@@@@@@@@@  -->           		
								 <%if(branchList !=null && branchList.size()==0 && ifscBranchList !=null && ifscBranchList.size()==0 ){ %>
									<tr class="odd">
										<td colspan="10"><bean:message
											key="label.global.not.found" /></td>
									</tr>
								<%}%>
							</tbody>
						</table>
						<%} else if (value.getBankingMethod().equals("") || value.getBankingMethod().equals("SOLE") || 
								 value.getBankingMethod().equals("SOLE-SOLE")) {%>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="bnkdtltbl" style="display: none;">
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>IFSC Code</td>
									<td>Bank Name</td>
									<td>Branch Name</td>
									<td>Address</td>
									<td>Email Id</td>
									<td>Revised Email Id</td>
									<td>Nodal</td>
									<td>Lead</td>
									<td>Action</td>
								</tr>
							</thead>
							<tbody>
								<logic:present name="branchList">
									<logic:iterate id="ob" name="branchList"
											type="com.integrosys.cms.app.customer.bus.OBBankingMethod" scope="page">
										<% String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
										%>
										
										<%if (ob.getBankType().equals("S")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getAddress()%>" />&nbsp;</center></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getContactMail()%>" />&nbsp;</center></td>
												
												<!--Revised Mail Id  -->
												
												<%-- <td><center><integro:empty-if-null
												value="<%=ob.getSystembank().getContactMail()%>" />&nbsp;</center></td> --%>
												<% strss = "revisedEmailIds" + no; %>
												<td>
												<%if(!(ob.getSystembank().getRevisedContactMail()==null || ob.getSystembank().getRevisedContactMail().isEmpty())){ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMail" value="<%=ob.getSystembank().getRevisedContactMail()%>" onblur="revisedEmailIdFunction(this,'selects<%=no%>','s','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="<%=ob.getSystembank().getRevisedContactMail()%>" />
												<%-- <html:hidden property="revisedContactMail" /> --%>
												<%}else{ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMail" value="" onblur="revisedEmailIdFunction(this,'selects<%=no%>','s','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="" />
												<%} %>
												</td>
												
											<td>
											<center>
											<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   String[] array = value.getNodalLead().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getNodalLead().startsWith("s") && Long.toString(ob.getBankId()).equals(bankId)) {%>
			
											<input type="radio" id="nodalLead" class="nodalLead" name="nodalLead" value="<%="s" + "," + ob.getBankId()%>" checked="checked">
											<%}else{ %>
												<input type="radio" id="nodalLead" class="nodalLead" name="nodalLead" value="<%="s" + "," + ob.getBankId()%>">
											
											<%} %>
											<%}else{ %>
											<input type="radio" id="nodalLead" class="nodalLead" name="nodalLead" value="<%="s" + "," + ob.getBankId()%>">
											<%} %>
											</center>
											</td>
                                        
                                        
                                        <!--Lead New Field  -->
                                        
                                        <td>
											<center>
											<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   String[] array = value.getLeadValue().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getLeadValue().startsWith("s") && Long.toString(ob.getBankId()).equals(bankId)) {%>
			
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="s" + "," + ob.getBankId()%>" checked="checked">
											<%}else{ %>
												<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="s" + "," + ob.getBankId()%>">
											
											<%} %>
											<%}else{ %>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="s" + "," + ob.getBankId()%>">
											<%} %>
											</center>
											</td>
                                        
                                        	<td>
                                       		<center>
                                        	<select id="actionDelete<%=no%>"
												onchange="getDelete('<%=ob.getBankId()%>','S','<%=no%>')">
												<option value="">-Select-</option>
												<option value="Delete">Delete</option>
											</select>
											</center>
                                        	</td>
										</tr>
										<%} else if (ob.getBankType().equals("O")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBranchName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getAddress()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getContactMailId()%>" />&nbsp;</center></td>
												
											<!--Revised Mail Id  -->	
											<% strss = "revisedEmailIds" + no; %>
											<td>
											<%if(!(ob.getOtherbranch().getRevisedContactMailId()==null || ob.getOtherbranch().getRevisedContactMailId().isEmpty())){ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMailId" value="<%=ob.getOtherbranch().getRevisedContactMailId()%>" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="<%=ob.getOtherbranch().getRevisedContactMailId()%>" />
												<%-- <html:hidden property="revisedContactMailId" /> --%>
											<%}else{ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedContactMailId" value="" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getBankId()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="" />
												
											<%} %>	
												</td>
											<td>
											<center>
											
											<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   String[] array = value.getNodalLead().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getNodalLead().startsWith("o") && Long.toString(ob.getBankId()).equals(bankId)) {%>
											<input type="radio" id="nodalLead" class="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getBankId()%>" checked="checked">
											<%}else {%>
											<input type="radio" id="nodalLead" class="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											<%}else {%>
											<input type="radio" id="nodalLead" class="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											</center>
												
											</td>
											
											<!--Lead New Field  -->
											<td>
											<center>
											
											<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   String[] array = value.getLeadValue().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getLeadValue().startsWith("o") && Long.toString(ob.getBankId()).equals(bankId)) {%>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getBankId()%>" checked="checked">
											<%}else {%>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											<%}else {%>
											<input type="radio" id="leadValue" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getBankId()%>">
											<%} %>
											</center>
												
											</td>
											 <td>
                                       		<center>
                                        	<select id="actionDelete<%=no%>"
												onchange="getDelete('<%=ob.getBankId()%>','O','<%=no%>')">
												<option value="">-Select-</option>
												<option value="Delete">Delete</option>
											</select>
											</center>
                                        	</td>
										</tr>
										<%}%>
									</logic:iterate>
								</logic:present>
         						
         			<!-- @@@@@@@@@@@@@@@@@@@@  IFSC CODE @@@@@@@@@@@@@@@@@@@@@@@@@  -->               
                        		<logic:present name="ifscBranchList">
									<logic:iterate id="ob" name="ifscBranchList"
											type="com.integrosys.cms.app.customer.bus.OBIfscMethod" scope="page">
										<% String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
										%>
										<%if (ob.getBankType().equals("O")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getIfscCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBranchName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBranchNameAddress()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getEmailID()%>" />&nbsp;</center></td>
											<td>
											<td><center><integro:empty-if-null
												value="<%=ob.getRevisedEmailID()%>" />&nbsp;</center></td>
											<td>
											<% strss = "revisedEmailIds" + no; %>
											<td>
											<%if(!(ob.getRevisedEmailID()==null || ob.getRevisedEmailID().isEmpty())){ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedEmailID" value="<%=ob.getRevisedEmailID()%>" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getIfscCode()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="<%=ob.getRevisedEmailID()%>" />
											<%}else{ %>
												<center>
												<input type="text" id="revisedEmailIds<%=no%>" property="revisedEmailID" value="" onblur="revisedEmailIdFunction(this,'selects<%=no%>','o','<%=ob.getIfscCode()%>');"/> &nbsp;</center>
												<input type="hidden" name="revisedEmailIdsArray" id="selects<%=no%>" value="" />
											<%} %>	
												</td>
												<td>
											 <center>
											<%
											System.out.println("33333333333334444444444444444");
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   	String[] array = value.getNodalLead().split(",");
		                                       	String bankId = array[1];
			                                   	if (value.getNodalLead().startsWith("o") && ob.getIfscCode().equals(bankId)) {%>
												<input type="radio" id="nodalLead<%=no%>" name="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>" checked="checked">
												<%}else {%>
												<input type="radio" id="nodalLead<%=no%>" name="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>">
												<%} %>
											<%}else {%>
												<input type="radio" id="nodalLead<%=no%>" name="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>">
											<%} %>
											</center> 
												
											</td>
											
											<!--Lead New Field  -->
											
											<td>
											 <center>
											<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   	String[] array = value.getLeadValue().split(",");
		                                       	String bankId = array[1];
			                                   	if (value.getLeadValue().startsWith("o") && ob.getIfscCode().equals(bankId)) {%>
												<input type="radio" id="leadValue<%=no%>" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getIfscCode()%>" checked="checked">
												<%}else {%>
												<input type="radio" id="leadValue<%=no%>" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getIfscCode()%>">
												<%} %>
											<%}else {%>
												<input type="radio" id="leadValue<%=no%>" name="leadValue" class="leadValue" value="<%="o" + "," + ob.getIfscCode()%>">
											<%} %>
											</center> 
												
											</td>
											
											 <td>
                                       		<center>
                                        	<select id="actionDelete<%=no%>"
												onchange="getDeleteIfsc('<%=ob.getIfscCode()%>','O','<%=no%>')">
												<option value="">-Select-</option>
												<option value="Delete">Delete</option>
											</select>
											</center>
                                        	</td>
										</tr>
										
										<%}%>
									</logic:iterate>
								</logic:present>
                <!-- @@@@@@@@@@@@@@@@@@@@  IFSC CODE @@@@@@@@@@@@@@@@@@@@@@@@@  -->           		
								 <%if(branchList !=null && branchList.size()==0 && ifscBranchList !=null && ifscBranchList.size()==0 ){ %>
									<tr class="odd">
										<td colspan="10"><bean:message
											key="label.global.not.found" /></td>
									</tr>
								<%}%>
							</tbody>
						</table>
						
						<%}%>
						
						
					</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
				</tr>
				
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<End Banking Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>style="display: none;"-->	
<span><table width="100%">

 
<tr colspan="1">
<td >

<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo"  id="isMultiple">
							
							
								
							
							<tbody>
							<thead>
							<tr>
							
							
							
							
									<td colspan="3">MULTIPLE BANKING</td>
									
								</tr>
								<tr>
									<td colspan="1">Share %</td>
									<td colspan="2">Proposed</td>
								</tr>
								</thead>
								<tr>
								
									<td colspan="1" style="background-color: #D1D0CE"></td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">
									Fund Based %
									</td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">Non Fund Based %</td>
									
								</tr>
								<tr>
									<td colspan="1" style="background-color: #D1D0CE; color:black;">Lead Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<input type="text" name="multBankFundBasedLeadBankPer" id="multBankFundBasedLeadBankPer1" property='multBankFundBasedLeadBankPer' value="<%=value.getMultBankFundBasedLeadBankPer()%>">
									<html:errors property="multBankFundBasedLeadBankPerError"/>
									</td colspan="1" style="background-color: #E5E4E2">
									<td style="background-color: #E5E4E2">
									<input type="text" name="multBankNonFundBasedLeadBankPer" id="multBankNonFundBasedLeadBankPer1" property='multBankNonFundBasedLeadBankPer' value="<%=value.getMultBankNonFundBasedLeadBankPer()%>">
									<html:errors property="multBankNonFundBasedLeadBankPerError"/>
									</td>
									
								</tr>
								<tr>
									<td colspan="1" style="background-color: #D1D0CE;color:black;">HDFC Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<input type="text" name="multBankFundBasedHdfcBankPer" id="multBankFundBasedHdfcBankPer1" property='multBankFundBasedHdfcBankPer' value="<%=value.getMultBankFundBasedHdfcBankPer()%>" >
									<html:errors property="multBankFundBasedHdfcBankPerError"/>
									</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<input type="text" name="multBankNonFundBasedHdfcBankPer" id="multBankNonFundBasedHdfcBankPer1"  property='multBankNonFundBasedHdfcBankPer' value="<%=value.getMultBankNonFundBasedHdfcBankPer()%>">
									<html:errors property="multBankNonFundBasedHdfcBankPerError"/>
									</td>
									
								</tr>
								      		
							</tbody>
						</table>

</td><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="isConsortium" >
							<thead>
							
								<tr>
								
							
							
							
									<td colspan="3">CONSORTIUM BANKING</td>
									
								</tr>
								<tr>
									<td colspan="1">Share %</td>
									<td colspan="2">Proposed</td>
								</tr>
								</thead>
							
							<tbody>
								    <tr>
								
									<td colspan="1" style="background-color: #D1D0CE"></td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">
									Fund Based %
									</td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">Non Fund Based %</td>
									
								</tr>
								
								<tr>
									<td colspan="1" style="background-color: #D1D0CE; color:black;">Lead Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<input type="text" name="consBankFundBasedLeadBankPer" id="consBankFundBasedLeadBankPer1" property='consBankFundBasedLeadBankPer' value="<%=value.getConsBankFundBasedLeadBankPer()%>">
									<html:errors property="consBankFundBasedLeadBankPerError"/>
									</td colspan="1" style="background-color: #E5E4E2">
									<td style="background-color: #E5E4E2">
									<input type="text" name="consBankNonFundBasedLeadBankPer" id="consBankNonFundBasedLeadBankPer1" property='consBankNonFundBasedLeadBankPer'  value="<%=value.getConsBankNonFundBasedLeadBankPer()%>">
									<html:errors property="consBankNonFundBasedLeadBankPerError"/>
									</td>
									
								</tr>
								<tr>
									<td colspan="1" style="background-color: #D1D0CE;color:black;">HDFC Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<input type="text" name="consBankFundBasedHdfcBankPer" id="consBankFundBasedHdfcBankPer1"  property='consBankFundBasedHdfcBankPer'   value="<%=value.getConsBankFundBasedHdfcBankPer()%>">
									<html:errors property="consBankFundBasedHdfcBankPerError"/>
									</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<input type="text" name="consBankNonFundBasedHdfcBankPer" id="consBankNonFundBasedHdfcBankPer1" property='consBankNonFundBasedHdfcBankPer'   value="<%=value.getConsBankNonFundBasedHdfcBankPer()%>" >
									<html:errors property="consBankNonFundBasedHdfcBankPerError"/>
									</td>
									
								</tr>  		
							</tbody>
						</table>
						

</td></tr>

</table> </span>






				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="udf_hidden_details.jsp"></jsp:include>
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" styleId="cifId"/>
	
	   <html:hidden name="ManualInputCustomerInfoForm" property="finalBankMethodList" styleId="finalBankMethodList"/>
	 
	<html:hidden name="ManualInputCustomerInfoForm"
		property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
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
		<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />	
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="rbiIndustryCode" />
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
	<html:hidden name="ManualInputCustomerInfoForm"
		property="bankingMethod" styleId="bankingMethod"/>
		<html:hidden name="ManualInputCustomerInfoForm" property="bankingMethodAll" styleId="bankingMethodAll"/>
		<html:hidden name="ManualInputCustomerInfoForm" property="bankingMethodAllValue" styleId="bankingMethodAllValue"/>
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
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI"  styleId="deferLEI"/>
	<!--End Santosh LEI CR  -->		
	<html:hidden property="event"></html:hidden>
	<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
	<html:hidden name="ManualInputCustomerInfoForm" property="leadValue" />
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

	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfSuit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="suitAmount" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
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
		property="branchCode" />
		
			<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
		
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
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="form6061Checked" />
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
		
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="legalConstitution" />
		<%if(partyGrpList!=null && partyGrpList.size()==0 && value.getSubLine().equals("OPEN")){ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" value="Y" />
		<%}else{ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" value="N" />
		<%} %>
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
</table>


<!-- InstanceEnd -->

