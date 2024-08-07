
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.*,
				 java.util.*,
				 org.apache.commons.lang.StringUtils,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 java.text.DateFormat,
				java.text.SimpleDateFormat,
				 com.integrosys.base.techinfra.util.DateUtil" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationForm,com.integrosys.cms.app.caseCreationUpdate.trx.ICaseCreationTrxValue,com.integrosys.cms.app.caseCreationUpdate.trx.OBCaseCreationTrxValue"%>
<%
boolean isCPUT=false;
boolean isBRANCH=false;
ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
	|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
	isBRANCH=true;
}

if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER 
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER 
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
){
	isCPUT=true;
}

boolean isCPUTMakerchecker=false;
String steamTypemembershipId=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
int teamTypemembershipId=  Integer.parseInt(steamTypemembershipId);
if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER_WFH){
	System.out.println("teamTypemembershipId  :"+teamTypemembershipId);
	if(teamTypemembershipId==ICMSConstant.CPU_MAKER
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
			){
		isCPUTMakerchecker=true;
    	}
}
String submitEvent="maker_confirm_resubmit_delete";
//if(isBRANCH){
//	submitEvent="maker_edit_caseCreationUpdate";
//}else{
//	submitEvent="maker_edit_caseCreationUpdate";
//}

MaintainCaseCreationForm caseCreationUpdateForm = (MaintainCaseCreationForm) request
			.getAttribute("MaintainCaseCreationForm");
ICaseCreationTrxValue caseCreationUpdateTrx = (ICaseCreationTrxValue)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.ICaseCreationTrxValue");
ICaseCreation caseCreation= caseCreationUpdateTrx.getStagingCaseCreation();
SearchResult searchResult = (SearchResult )session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.searchResultCaseCreation");
SearchResult searchResultActual = (SearchResult )session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.actualSearchResultCaseCreation");
HashMap typeMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.typeMap");
HashMap facilityNameMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.facilityNameMap");
HashMap securityTypeMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.securityTypeMap");
List receivedLists=(List) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.receivedList");
List branchList = (List)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.branchList");

pageContext.setAttribute("branchList",branchList);	
String coordinator1Name = (String) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.coordinator1Name"); 
String coordinator2Name = (String) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.coordinator2Name"); 
System.out.println("caseCreation:::1111111111::::::::"+caseCreation.getStatus());
	String rejectEvent = "checker_reject_edit";
	int counter = 0;
	int noofItems = 0;
	int index = 0;
	int sno = 0;
	int startInd = 0;

	Collection resultList = null;
	Collection actualResultList = null;
	int totalCount = 0;
	int listSize = 0;
	com.integrosys.cms.app.caseCreation.bus.ICaseCreation actualArray[]=null;
	//System.out.println("fdgdfgdfgdgdfgdf");
	if (searchResult != null) {
		
		resultList = searchResult.getResultList();
		Iterator itr = resultList.iterator();
		com.integrosys.cms.app.caseCreation.bus.ICaseCreation stageArray[]= new com.integrosys.cms.app.caseCreation.bus.ICaseCreation[resultList.size()];
		
		int i=0;
        while (itr.hasNext()) {
        	//System.out.println("fdgdfgdfgdgdfgdf");
        	stageArray[i]=(com.integrosys.cms.app.caseCreation.bus.ICaseCreation)itr.next();
        	//System.out.println("fdgdfgdfgdgdfgdf");
        	i++;
        }
        
        
        
        if(searchResultActual!=null){
        actualResultList = searchResultActual.getResultList();
        Iterator itrActual = actualResultList.iterator();
         actualArray= new com.integrosys.cms.app.caseCreation.bus.ICaseCreation[actualResultList.size()];
        
        int j=0;
        while (itrActual.hasNext()) {
        	actualArray[j]=(com.integrosys.cms.app.caseCreation.bus.ICaseCreation)itrActual.next();
        	j++;
        }
        
      
        }

		System.out.println("searchResult:::::::::::"+resultList.size());
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("imageListSize", Integer.toString(listSize));
		
		
		List res = CompareOBUtil.compOBArrayCase(stageArray,actualArray);
	    ArrayList list = new ArrayList(res);
	    pageContext.setAttribute("resultList",list);
	    
	}
	    
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	HashMap checklistItemMap = new HashMap();
	// System.out.println("value of records_per_page"+records_per_page);
	  ICheckListItem[] actualItems = new OBCheckListItem[receivedLists.size()];
    for(int i=0;i<receivedLists.size();i++){
    	actualItems[i]=(ICheckListItem)receivedLists.get(i);
    	checklistItemMap.put(String.valueOf(actualItems[i].getCheckListItemID()),actualItems[i]);
    }
    
    
    String event = (String)request.getAttribute("event");
    System.out.println("Event ===>"+event);
    String status1 = caseCreationUpdateForm.getStatus();
    System.out.println("Status=>"+caseCreationUpdateForm.getStatus());
    String[] array = caseCreationUpdateForm.getUpdatedDocBarcode();
    if(array != null){
    System.out.println("docBarArray=>"+array[0]);
    }
    
    String custId = (String)request.getAttribute("partyId");
    String custName = (String)request.getAttribute("partyName");
    System.out.println("CustId:==>"+custId+"  Cust Name:==>"+custName);
    
    String userEmployeeId = (String)request.getAttribute("userEmployeeId");
    String userEmployeeLoginId = (String)request.getAttribute("userEmployeeLoginId");
    System.out.println("userEmployeeId:==>"+userEmployeeId+"  userEmployeeLoginId:==>"+userEmployeeLoginId);
    
    DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
    
    
    List vaultLocationValueList=(List)request.getAttribute("vaultLocationValueList");
    System.out.println("vaultLocationValueList List : "+ vaultLocationValueList);
    pageContext.setAttribute("vaultLocationValueList", vaultLocationValueList);
%>



<%@page import="com.integrosys.cms.app.caseCreationUpdate.bus.ICaseCreation"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.cms.app.checklist.bus.ICheckListItem"%>
<%@page import="com.integrosys.cms.app.checklist.bus.OBCheckListItem"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		
		<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
		<script language="JavaScript" src="js/validation.js"></script>
  		<script type="text/javascript" src="js/ajaxCoordinator.js"></script>
  		<script language="JavaScript" src="js/calendar.js"></script>
	    <script language="JavaScript" src="js/calDriver.js"></script>
	    <script type="text/javascript" src="js/dateext.js"></script>
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

function approvePage() {
	
	    var formObj = document.forms[0];
		var k = 0;
		var temp = "";
		for (var i=0; i<formObj.elements.length; i++) {
	      var type = formObj.elements[i].type;
	      if (type == 'checkbox') {
			k++;
		  }
		}
		var m = k;
	    j = 0;
		if( k > 1) {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
		      if (type == 'checkbox') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.itemID[j].value);
			    	//temp = temp + "," + formObj.itemID.value;
			    	temp = temp + "," + obj.value;
				}
				j++;
		      }
			}
		} else {
		    for (var i=0; i<formObj.elements.length; i++) {
			  var type = formObj.elements[i].type;
		      if (type == 'checkbox') {
		        var obj = formObj.elements[i];
			    if (obj.checked) {
//					alert(formObj.itemID.value);
			    	//temp = temp + "," + formObj.itemID.value;
			    	temp = temp + "," + obj.value;
				}
		      }
			}
		}
//	    alert('j'+j);
if(m>0){
	    if(temp==""){
	        alert('Please select atleast one to submit.');
	        return ;
	    }
}
		temp=temp.substring(1);
		//alert(temp);
		formObj.hiddenItemID.value=temp;
		var tempStatus=document.getElementById('14').value;
		if(m>0){
		 if(tempStatus=="0"){
		        alert('Please select atleast one Document status to submit.');
		        return ;
		    }
		}
		
		
		var docDescLength=[];
		docDescLength=document.getElementsByName("docDesc");
		var ct = 1;
		var removedSrNums='';
		//alert(docDescLength.length);
		for(var i=0;i<docDescLength.length;i++){
			if(document.getElementById("26"+ct) == null){
				removedSrNums = removedSrNums + ct + ',';
				ct++;
		}
			ct++;
		}
		removeDisabled();
	   //CHANGES 09-03-2012
		//var tempStatus=document.getElementById('14').value;
		 //if(tempStatus=="0"){
		  //      alert('Please select atleast one to submit.');
		   //     return false;
		   // }

		// var tempRemark=document.getElementById('123').value;
		// //alert(tempRemark);
		// document.forms[0].remark.value=tempRemark;
		//document.forms[0].status.value=tempStatus;
		/////////////////////////////
		//document.forms[0].event.value="maker_edit_caseCreationUpdate";
		vaultLocationfunction();
		document.forms[0].removedSrNum.value = removedSrNums;
		document.forms[0].action="caseCreationUpdate.do?event=<%=submitEvent%>&status="+tempStatus+"&removedSrNum="+removedSrNums;
		document.forms[0].submit();
		newShowSilkScreen();
}


function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
    newShowSilkScreen();
}




function submitForm() {
	document.forms[0].action="caseCreationUpdate.do?event=maker_confirm_resubmit_delete";
    document.forms[0].submit();
}

function refreshCoordinatorDetail(dropdown) {
	//alert("ss");
    var curSel = "";
   
    for(i=0; i < dropdown.options.length; i++)   {
        if (dropdown.options[i].selected == true) {
            curSel = dropdown.options[i].value;
        }
    }  
    //alert("aa"+curSel);
    var dep = 'coordinator1Name';
    var url = '/cms/caseCreationUpdate.do?event=refresh_coordinator_detail&branchCode='+curSel;
    sendLoadCoordinatorReq(dep, url);
}

function editableFields(dropdown){
	//var val=document.getElementById('').value;
	var curSel = "";
            for(i=0; i < dropdown.options.length; i++)   {
                if (dropdown.options[i].selected == true) {
                    curSel = dropdown.options[i].value;
                }
            }
      
            var docDescLength=[];
            docDescLength=document.getElementsByName("docDesc");
            		
            var ct = 1;
            for(var i=0;i<docDescLength.length;i++){
            	if(document.getElementById("26"+ct) == null){
        			ct++;
        		}
            	var flag = document.getElementById("itemID"+ct).checked;
	//alert("dropdown=>"+curSel);
	if(curSel == "3" && flag == true){
		//document.getElementById("36").value='';
		document.getElementById("40"+ct).disabled=true;
		document.getElementById("40"+ct).style.display = 'none';
		document.getElementById("39"+ct).disabled=false;
		document.getElementById("39"+ct).style.display = '';
		
		document.getElementById("38"+ct).disabled=true;
		document.getElementById("38"+ct).style.display = 'none';
		document.getElementById("37"+ct).disabled=false;
		document.getElementById("37"+ct).style.display = '';
		
		document.getElementById("24"+ct).disabled=true;
		document.getElementById("24"+ct).style.display = 'none';
		document.getElementById("23"+ct).disabled=false;
		document.getElementById("23"+ct).style.display = '';
		
		/* document.getElementById("50"+ct).disabled=true;
		document.getElementById("50"+ct).style.display = 'none';
		document.getElementById("49"+ct).disabled=false;
		document.getElementById("49"+ct).style.display = ''; */
		
		document.getElementById("42"+ct).disabled=true;
		document.getElementById("42"+ct).style.display = 'none';
		document.getElementById("41"+ct).disabled=false;
		document.getElementById("41"+ct).style.display = '';
		
		document.getElementById("44"+ct).disabled=true;
		document.getElementById("44"+ct).style.display = 'none';
		document.getElementById("43"+ct).disabled=false;
		document.getElementById("43"+ct).style.display = '';
		
		document.getElementById("48"+ct).disabled=true;
		document.getElementById("48"+ct).style.display = 'none';
		document.getElementById("47"+ct).disabled=false;
		document.getElementById("47"+ct).style.display = '';
		
		document.getElementById("36"+ct).disabled=true;
		document.getElementById("36"+ct).style.display = 'none';
		document.getElementById("35"+ct).disabled=false;
		document.getElementById("35"+ct).style.display = '';
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		
		
	}else if(curSel == "6"  && flag == true){
		document.getElementById("42"+ct).disabled=true;
		document.getElementById("42"+ct).style.display = 'none';
		document.getElementById("41"+ct).disabled=false;
		document.getElementById("41"+ct).style.display = '';
		
		document.getElementById("44"+ct).disabled=true;
		document.getElementById("44"+ct).style.display = 'none';
		document.getElementById("43"+ct).disabled=false;
		document.getElementById("43"+ct).style.display = '';
		
		document.getElementById("48"+ct).disabled=true;
		document.getElementById("48"+ct).style.display = 'none';
		document.getElementById("47"+ct).disabled=false;
		document.getElementById("47"+ct).style.display = '';
		
		document.getElementById("36"+ct).disabled=true;
		document.getElementById("36"+ct).style.display = 'none';
		document.getElementById("35"+ct).disabled=false;
		document.getElementById("35"+ct).style.display = '';
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("24"+ct).disabled=false;
		document.getElementById("24"+ct).style.display = '';
		document.getElementById("23"+ct).disabled=true;
		document.getElementById("23"+ct).style.display = 'none';
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		
		
		
	}else if((curSel == "8" || curSel == "9")  && flag == true){
		document.getElementById("26"+ct).disabled=true;
		document.getElementById("26"+ct).style.display = 'none';
		document.getElementById("25"+ct).disabled=false;
		document.getElementById("25"+ct).style.display = '';
		
		document.getElementById("30"+ct).disabled=true;
		document.getElementById("30"+ct).style.display = 'none';
		document.getElementById("29"+ct).disabled=false;
		document.getElementById("29"+ct).style.display = '';
		
		document.getElementById("32"+ct).disabled=true;
		document.getElementById("32"+ct).style.display = 'none';
		document.getElementById("31"+ct).disabled=false;
		document.getElementById("31"+ct).style.display = '';
		
		/* document.getElementById("52"+ct).disabled=true;
		document.getElementById("52"+ct).style.display = 'none';
		document.getElementById("51"+ct).disabled=false;
		document.getElementById("51"+ct).style.display = ''; */
		
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("24"+ct).disabled=false;
		document.getElementById("24"+ct).style.display = '';
		document.getElementById("23"+ct).disabled=true;
		document.getElementById("23"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("36"+ct).disabled=false;
		document.getElementById("36"+ct).style.display = '';
		document.getElementById("35"+ct).disabled=true;
		document.getElementById("35"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("42"+ct).disabled=false;
		document.getElementById("42"+ct).style.display = '';
		document.getElementById("41"+ct).disabled=true;
		document.getElementById("41"+ct).style.display = 'none';
		
		document.getElementById("44"+ct).disabled=false;
		document.getElementById("44"+ct).style.display = '';
		document.getElementById("43"+ct).disabled=true;
		document.getElementById("43"+ct).style.display = 'none';
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		document.getElementById("48"+ct).disabled=false;
		document.getElementById("48"+ct).style.display = '';
		document.getElementById("47"+ct).disabled=true;
		document.getElementById("47"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
	}
	else if(curSel == "7"  && flag == true){
		
		document.getElementById("24"+ct).disabled=true;
		document.getElementById("24"+ct).style.display = 'none';
		document.getElementById("23"+ct).disabled=false;
		document.getElementById("23"+ct).style.display = '';
		
		document.getElementById("28"+ct).disabled=true;
		document.getElementById("28"+ct).style.display = 'none';
		document.getElementById("27"+ct).disabled=false;
		document.getElementById("27"+ct).style.display = '';
		
		document.getElementById("36"+ct).disabled=true;
		document.getElementById("36"+ct).style.display = 'none';
		document.getElementById("35"+ct).disabled=false;
		document.getElementById("35"+ct).style.display = '';
		
		document.getElementById("46"+ct).disabled=true;
		document.getElementById("46"+ct).style.display = 'none';
		document.getElementById("45"+ct).disabled=false;
		document.getElementById("45"+ct).style.display = '';
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("42"+ct).disabled=false;
		document.getElementById("42"+ct).style.display = '';
		document.getElementById("41"+ct).disabled=true;
		document.getElementById("41"+ct).style.display = 'none';
		
		document.getElementById("44"+ct).disabled=false;
		document.getElementById("44"+ct).style.display = '';
		document.getElementById("43"+ct).disabled=true;
		document.getElementById("43"+ct).style.display = 'none';
		
		document.getElementById("48"+ct).disabled=false;
		document.getElementById("48"+ct).style.display = '';
		document.getElementById("47"+ct).disabled=true;
		document.getElementById("47"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
	}
	else{
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("24"+ct).disabled=false;
		document.getElementById("24"+ct).style.display = '';
		document.getElementById("23"+ct).disabled=true;
		document.getElementById("23"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("36"+ct).disabled=false;
		document.getElementById("36"+ct).style.display = '';
		document.getElementById("35"+ct).disabled=true;
		document.getElementById("35"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("42"+ct).disabled=false;
		document.getElementById("42"+ct).style.display = '';
		document.getElementById("41"+ct).disabled=true;
		document.getElementById("41"+ct).style.display = 'none';
		
		document.getElementById("44"+ct).disabled=false;
		document.getElementById("44"+ct).style.display = '';
		document.getElementById("43"+ct).disabled=true;
		document.getElementById("43"+ct).style.display = 'none';
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		document.getElementById("48"+ct).disabled=false;
		document.getElementById("48"+ct).style.display = '';
		document.getElementById("47"+ct).disabled=true;
		document.getElementById("47"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
	}
	ct++;
            }
}

window.onload = function(){
	
	var docDescLength=[];
	docDescLength=document.getElementsByName("docDesc");
	//alert(climsLength.length);
	var ct = 1;
	var curSel = '<%=status1%>';
	var events = '<%=event%>';
	//alert("curSel=>"+curSel);
	/* if(events == "maker_prepare_resubmit_delete"){
		curSel = '0';
	} */
	
	
	for(var i=0;i<docDescLength.length;i++){
	/* document.getElementById("21"+ct).disabled=true;
	document.getElementById("23"+ct).disabled=true;
	document.getElementById("25"+ct).disabled=true;
	document.getElementById("27"+ct).disabled=true;
	document.getElementById("29"+ct).disabled=true;
	document.getElementById("31"+ct).disabled=true;
	document.getElementById("33"+ct).disabled=true;
	document.getElementById("35"+ct).disabled=true;
	document.getElementById("37"+ct).disabled=true;
	document.getElementById("39"+ct).disabled=true;
	document.getElementById("41"+ct).disabled=true;
	document.getElementById("43"+ct).disabled=true;
	document.getElementById("45"+ct).disabled=true;
	document.getElementById("47"+ct).disabled=true;
	document.getElementById("49"+ct).disabled=true;
	//document.getElementById("51"+ct).disabled=true;
	
	document.getElementById("21"+ct).style.display = 'none';
	document.getElementById("23"+ct).style.display = 'none';
	document.getElementById("25"+ct).style.display = 'none';
	document.getElementById("27"+ct).style.display = 'none';
	document.getElementById("29"+ct).style.display = 'none';
	document.getElementById("31"+ct).style.display = 'none';
	document.getElementById("33"+ct).style.display = 'none';
	document.getElementById("35"+ct).style.display = 'none';
	document.getElementById("37"+ct).style.display = 'none';
	document.getElementById("39"+ct).style.display = 'none';
	document.getElementById("41"+ct).style.display = 'none';
	document.getElementById("43"+ct).style.display = 'none';
	document.getElementById("45"+ct).style.display = 'none';
	document.getElementById("47"+ct).style.display = 'none';
	document.getElementById("49"+ct).style.display = 'none';
	//document.getElementById("51"+ct).style.display = 'none'; */
		if(document.getElementById("26"+ct) == null){
			ct++;
		}
		//alert(document.getElementById("itemID"+ct).checked);
		var flag = document.getElementById("itemID"+ct).checked;
		if(curSel == "3" && flag == true){
			//document.getElementById("36").value='';
			document.getElementById("40"+ct).disabled=true;
			document.getElementById("40"+ct).style.display = 'none';
			document.getElementById("39"+ct).disabled=false;
			document.getElementById("39"+ct).style.display = '';
			
			document.getElementById("38"+ct).disabled=true;
			document.getElementById("38"+ct).style.display = 'none';
			document.getElementById("37"+ct).disabled=false;
			document.getElementById("37"+ct).style.display = '';
			
			document.getElementById("24"+ct).disabled=true;
			document.getElementById("24"+ct).style.display = 'none';
			document.getElementById("23"+ct).disabled=false;
			document.getElementById("23"+ct).style.display = '';
			
			/* document.getElementById("50"+ct).disabled=true;
			document.getElementById("50"+ct).style.display = 'none';
			document.getElementById("49"+ct).disabled=false;
			document.getElementById("49"+ct).style.display = ''; */
			
			document.getElementById("42"+ct).disabled=true;
			document.getElementById("42"+ct).style.display = 'none';
			document.getElementById("41"+ct).disabled=false;
			document.getElementById("41"+ct).style.display = '';
			
			document.getElementById("44"+ct).disabled=true;
			document.getElementById("44"+ct).style.display = 'none';
			document.getElementById("43"+ct).disabled=false;
			document.getElementById("43"+ct).style.display = '';
			
			document.getElementById("48"+ct).disabled=true;
			document.getElementById("48"+ct).style.display = 'none';
			document.getElementById("47"+ct).disabled=false;
			document.getElementById("47"+ct).style.display = '';
			
			document.getElementById("36"+ct).disabled=true;
			document.getElementById("36"+ct).style.display = 'none';
			document.getElementById("35"+ct).disabled=false;
			document.getElementById("35"+ct).style.display = '';
			
			document.getElementById("22"+ct).disabled=false;
			document.getElementById("22"+ct).style.display = '';
			document.getElementById("21"+ct).disabled=true;
			document.getElementById("21"+ct).style.display = 'none';
			
			document.getElementById("26"+ct).disabled=false;
			document.getElementById("26"+ct).style.display = '';
			document.getElementById("25"+ct).disabled=true;
			document.getElementById("25"+ct).style.display = 'none';
			
			document.getElementById("28"+ct).disabled=false;
			document.getElementById("28"+ct).style.display = '';
			document.getElementById("27"+ct).disabled=true;
			document.getElementById("27"+ct).style.display = 'none';
			
			document.getElementById("30"+ct).disabled=false;
			document.getElementById("30"+ct).style.display = '';
			document.getElementById("29"+ct).disabled=true;
			document.getElementById("29"+ct).style.display = 'none';
			
			document.getElementById("32"+ct).disabled=false;
			document.getElementById("32"+ct).style.display = '';
			document.getElementById("31"+ct).disabled=true;
			document.getElementById("31"+ct).style.display = 'none';
			
			document.getElementById("34"+ct).disabled=false;
			document.getElementById("34"+ct).style.display = '';
			document.getElementById("33"+ct).disabled=true;
			document.getElementById("33"+ct).style.display = 'none';
			
			/* document.getElementById("52"+ct).disabled=false;
			document.getElementById("52"+ct).style.display = '';
			document.getElementById("51"+ct).disabled=true;
			document.getElementById("51"+ct).style.display = 'none'; */
			
			document.getElementById("46"+ct).disabled=false;
			document.getElementById("46"+ct).style.display = '';
			document.getElementById("45"+ct).disabled=true;
			document.getElementById("45"+ct).style.display = 'none';
			
			
			
		}else if(curSel == "6" && flag == true){
			document.getElementById("42"+ct).disabled=true;
			document.getElementById("42"+ct).style.display = 'none';
			document.getElementById("41"+ct).disabled=false;
			document.getElementById("41"+ct).style.display = '';
			
			document.getElementById("44"+ct).disabled=true;
			document.getElementById("44"+ct).style.display = 'none';
			document.getElementById("43"+ct).disabled=false;
			document.getElementById("43"+ct).style.display = '';
			
			document.getElementById("48"+ct).disabled=true;
			document.getElementById("48"+ct).style.display = 'none';
			document.getElementById("47"+ct).disabled=false;
			document.getElementById("47"+ct).style.display = '';
			
			document.getElementById("36"+ct).disabled=true;
			document.getElementById("36"+ct).style.display = 'none';
			document.getElementById("35"+ct).disabled=false;
			document.getElementById("35"+ct).style.display = '';
			
			document.getElementById("22"+ct).disabled=false;
			document.getElementById("22"+ct).style.display = '';
			document.getElementById("21"+ct).disabled=true;
			document.getElementById("21"+ct).style.display = 'none';
			
			document.getElementById("24"+ct).disabled=false;
			document.getElementById("24"+ct).style.display = '';
			document.getElementById("23"+ct).disabled=true;
			document.getElementById("23"+ct).style.display = 'none';
			
			document.getElementById("26"+ct).disabled=false;
			document.getElementById("26"+ct).style.display = '';
			document.getElementById("25"+ct).disabled=true;
			document.getElementById("25"+ct).style.display = 'none';
			
			document.getElementById("28"+ct).disabled=false;
			document.getElementById("28"+ct).style.display = '';
			document.getElementById("27"+ct).disabled=true;
			document.getElementById("27"+ct).style.display = 'none';
			
			document.getElementById("30"+ct).disabled=false;
			document.getElementById("30"+ct).style.display = '';
			document.getElementById("29"+ct).disabled=true;
			document.getElementById("29"+ct).style.display = 'none';
			
			document.getElementById("32"+ct).disabled=false;
			document.getElementById("32"+ct).style.display = '';
			document.getElementById("31"+ct).disabled=true;
			document.getElementById("31"+ct).style.display = 'none';
			
			document.getElementById("34"+ct).disabled=false;
			document.getElementById("34"+ct).style.display = '';
			document.getElementById("33"+ct).disabled=true;
			document.getElementById("33"+ct).style.display = 'none';
			
			document.getElementById("38"+ct).disabled=false;
			document.getElementById("38"+ct).style.display = '';
			document.getElementById("37"+ct).disabled=true;
			document.getElementById("37"+ct).style.display = 'none';
			
			document.getElementById("40"+ct).disabled=false;
			document.getElementById("40"+ct).style.display = '';
			document.getElementById("39"+ct).disabled=true;
			document.getElementById("39"+ct).style.display = 'none';
			
			document.getElementById("46"+ct).disabled=false;
			document.getElementById("46"+ct).style.display = '';
			document.getElementById("45"+ct).disabled=true;
			document.getElementById("45"+ct).style.display = 'none';
			
			/* document.getElementById("50"+ct).disabled=false;
			document.getElementById("50"+ct).style.display = '';
			document.getElementById("49"+ct).disabled=true;
			document.getElementById("49"+ct).style.display = 'none'; */
			
			/* document.getElementById("52"+ct).disabled=false;
			document.getElementById("52"+ct).style.display = '';
			document.getElementById("51"+ct).disabled=true;
			document.getElementById("51"+ct).style.display = 'none'; */
			
			
			
			
		}else if((curSel == "8" || curSel == "9") && flag == true){
			document.getElementById("26"+ct).disabled=true;
			document.getElementById("26"+ct).style.display = 'none';
			document.getElementById("25"+ct).disabled=false;
			document.getElementById("25"+ct).style.display = '';
			
			document.getElementById("30"+ct).disabled=true;
			document.getElementById("30"+ct).style.display = 'none';
			document.getElementById("29"+ct).disabled=false;
			document.getElementById("29"+ct).style.display = '';
			
			document.getElementById("32"+ct).disabled=true;
			document.getElementById("32"+ct).style.display = 'none';
			document.getElementById("31"+ct).disabled=false;
			document.getElementById("31"+ct).style.display = '';
			
			/* document.getElementById("52"+ct).disabled=true;
			document.getElementById("52"+ct).style.display = 'none';
			document.getElementById("51"+ct).disabled=false;
			document.getElementById("51"+ct).style.display = ''; */
			
			
			document.getElementById("22"+ct).disabled=false;
			document.getElementById("22"+ct).style.display = '';
			document.getElementById("21"+ct).disabled=true;
			document.getElementById("21"+ct).style.display = 'none';
			
			document.getElementById("24"+ct).disabled=false;
			document.getElementById("24"+ct).style.display = '';
			document.getElementById("23"+ct).disabled=true;
			document.getElementById("23"+ct).style.display = 'none';
			
			document.getElementById("28"+ct).disabled=false;
			document.getElementById("28"+ct).style.display = '';
			document.getElementById("27"+ct).disabled=true;
			document.getElementById("27"+ct).style.display = 'none';
			
			document.getElementById("34"+ct).disabled=false;
			document.getElementById("34"+ct).style.display = '';
			document.getElementById("33"+ct).disabled=true;
			document.getElementById("33"+ct).style.display = 'none';
			
			document.getElementById("36"+ct).disabled=false;
			document.getElementById("36"+ct).style.display = '';
			document.getElementById("35"+ct).disabled=true;
			document.getElementById("35"+ct).style.display = 'none';
			
			document.getElementById("38"+ct).disabled=false;
			document.getElementById("38"+ct).style.display = '';
			document.getElementById("37"+ct).disabled=true;
			document.getElementById("37"+ct).style.display = 'none';
			
			document.getElementById("40"+ct).disabled=false;
			document.getElementById("40"+ct).style.display = '';
			document.getElementById("39"+ct).disabled=true;
			document.getElementById("39"+ct).style.display = 'none';
			
			document.getElementById("42"+ct).disabled=false;
			document.getElementById("42"+ct).style.display = '';
			document.getElementById("41"+ct).disabled=true;
			document.getElementById("41"+ct).style.display = 'none';
			
			document.getElementById("44"+ct).disabled=false;
			document.getElementById("44"+ct).style.display = '';
			document.getElementById("43"+ct).disabled=true;
			document.getElementById("43"+ct).style.display = 'none';
			
			document.getElementById("46"+ct).disabled=false;
			document.getElementById("46"+ct).style.display = '';
			document.getElementById("45"+ct).disabled=true;
			document.getElementById("45"+ct).style.display = 'none';
			
			document.getElementById("48"+ct).disabled=false;
			document.getElementById("48"+ct).style.display = '';
			document.getElementById("47"+ct).disabled=true;
			document.getElementById("47"+ct).style.display = 'none';
			
			/* document.getElementById("50"+ct).disabled=false;
			document.getElementById("50"+ct).style.display = '';
			document.getElementById("49"+ct).disabled=true;
			document.getElementById("49"+ct).style.display = 'none'; */
			
		}
		else if(curSel == "7" && flag == true){
			
			document.getElementById("24"+ct).disabled=true;
			document.getElementById("24"+ct).style.display = 'none';
			document.getElementById("23"+ct).disabled=false;
			document.getElementById("23"+ct).style.display = '';
			
			document.getElementById("28"+ct).disabled=true;
			document.getElementById("28"+ct).style.display = 'none';
			document.getElementById("27"+ct).disabled=false;
			document.getElementById("27"+ct).style.display = '';
			
			document.getElementById("36"+ct).disabled=true;
			document.getElementById("36"+ct).style.display = 'none';
			document.getElementById("35"+ct).disabled=false;
			document.getElementById("35"+ct).style.display = '';
			
			document.getElementById("46"+ct).disabled=true;
			document.getElementById("46"+ct).style.display = 'none';
			document.getElementById("45"+ct).disabled=false;
			document.getElementById("45"+ct).style.display = '';
			
			document.getElementById("22"+ct).disabled=false;
			document.getElementById("22"+ct).style.display = '';
			document.getElementById("21"+ct).disabled=true;
			document.getElementById("21"+ct).style.display = 'none';
			
			document.getElementById("26"+ct).disabled=false;
			document.getElementById("26"+ct).style.display = '';
			document.getElementById("25"+ct).disabled=true;
			document.getElementById("25"+ct).style.display = 'none';
			
			document.getElementById("30"+ct).disabled=false;
			document.getElementById("30"+ct).style.display = '';
			document.getElementById("29"+ct).disabled=true;
			document.getElementById("29"+ct).style.display = 'none';
			
			document.getElementById("32"+ct).disabled=false;
			document.getElementById("32"+ct).style.display = '';
			document.getElementById("31"+ct).disabled=true;
			document.getElementById("31"+ct).style.display = 'none';
			
			/* document.getElementById("52"+ct).disabled=false;
			document.getElementById("52"+ct).style.display = '';
			document.getElementById("51"+ct).disabled=true;
			document.getElementById("51"+ct).style.display = 'none'; */
			
			document.getElementById("34"+ct).disabled=false;
			document.getElementById("34"+ct).style.display = '';
			document.getElementById("33"+ct).disabled=true;
			document.getElementById("33"+ct).style.display = 'none';
			
			document.getElementById("38"+ct).disabled=false;
			document.getElementById("38"+ct).style.display = '';
			document.getElementById("37"+ct).disabled=true;
			document.getElementById("37"+ct).style.display = 'none';
			
			document.getElementById("40"+ct).disabled=false;
			document.getElementById("40"+ct).style.display = '';
			document.getElementById("39"+ct).disabled=true;
			document.getElementById("39"+ct).style.display = 'none';
			
			document.getElementById("42"+ct).disabled=false;
			document.getElementById("42"+ct).style.display = '';
			document.getElementById("41"+ct).disabled=true;
			document.getElementById("41"+ct).style.display = 'none';
			
			document.getElementById("44"+ct).disabled=false;
			document.getElementById("44"+ct).style.display = '';
			document.getElementById("43"+ct).disabled=true;
			document.getElementById("43"+ct).style.display = 'none';
			
			document.getElementById("48"+ct).disabled=false;
			document.getElementById("48"+ct).style.display = '';
			document.getElementById("47"+ct).disabled=true;
			document.getElementById("47"+ct).style.display = 'none';
			
			/* document.getElementById("50"+ct).disabled=false;
			document.getElementById("50"+ct).style.display = '';
			document.getElementById("49"+ct).disabled=true;
			document.getElementById("49"+ct).style.display = 'none'; */
			
		}
		else{
			
			document.getElementById("26"+ct).disabled=false;
			document.getElementById("26"+ct).style.display = '';
			document.getElementById("25"+ct).disabled=true;
			document.getElementById("25"+ct).style.display = 'none';
			
			document.getElementById("30"+ct).disabled=false;
			document.getElementById("30"+ct).style.display = '';
			document.getElementById("29"+ct).disabled=true;
			document.getElementById("29"+ct).style.display = 'none';
			
			document.getElementById("32"+ct).disabled=false;
			document.getElementById("32"+ct).style.display = '';
			document.getElementById("31"+ct).disabled=true;
			document.getElementById("31"+ct).style.display = 'none';
			
			/* document.getElementById("52"+ct).disabled=false;
			document.getElementById("52"+ct).style.display = '';
			document.getElementById("51"+ct).disabled=true;
			document.getElementById("51"+ct).style.display = 'none'; */
			
			
			document.getElementById("22"+ct).disabled=false;
			document.getElementById("22"+ct).style.display = '';
			document.getElementById("21"+ct).disabled=true;
			document.getElementById("21"+ct).style.display = 'none';
			
			document.getElementById("24"+ct).disabled=false;
			document.getElementById("24"+ct).style.display = '';
			document.getElementById("23"+ct).disabled=true;
			document.getElementById("23"+ct).style.display = 'none';
			
			document.getElementById("28"+ct).disabled=false;
			document.getElementById("28"+ct).style.display = '';
			document.getElementById("27"+ct).disabled=true;
			document.getElementById("27"+ct).style.display = 'none';
			
			document.getElementById("34"+ct).disabled=false;
			document.getElementById("34"+ct).style.display = '';
			document.getElementById("33"+ct).disabled=true;
			document.getElementById("33"+ct).style.display = 'none';
			
			document.getElementById("36"+ct).disabled=false;
			document.getElementById("36"+ct).style.display = '';
			document.getElementById("35"+ct).disabled=true;
			document.getElementById("35"+ct).style.display = 'none';
			
			document.getElementById("38"+ct).disabled=false;
			document.getElementById("38"+ct).style.display = '';
			document.getElementById("37"+ct).disabled=true;
			document.getElementById("37"+ct).style.display = 'none';
			
			document.getElementById("40"+ct).disabled=false;
			document.getElementById("40"+ct).style.display = '';
			document.getElementById("39"+ct).disabled=true;
			document.getElementById("39"+ct).style.display = 'none';
			
			document.getElementById("42"+ct).disabled=false;
			document.getElementById("42"+ct).style.display = '';
			document.getElementById("41"+ct).disabled=true;
			document.getElementById("41"+ct).style.display = 'none';
			
			document.getElementById("44"+ct).disabled=false;
			document.getElementById("44"+ct).style.display = '';
			document.getElementById("43"+ct).disabled=true;
			document.getElementById("43"+ct).style.display = 'none';
			
			document.getElementById("46"+ct).disabled=false;
			document.getElementById("46"+ct).style.display = '';
			document.getElementById("45"+ct).disabled=true;
			document.getElementById("45"+ct).style.display = 'none';
			
			document.getElementById("48"+ct).disabled=false;
			document.getElementById("48"+ct).style.display = '';
			document.getElementById("47"+ct).disabled=true;
			document.getElementById("47"+ct).style.display = 'none';
			
			/* document.getElementById("50"+ct).disabled=false;
			document.getElementById("50"+ct).style.display = '';
			document.getElementById("49"+ct).disabled=true;
			document.getElementById("49"+ct).style.display = 'none'; */
			
		}
		ct++;
	}
	
}


function enableFieldsOnCheckboxSelect(count){
	var curSel = document.getElementById("14").value;
	var valOfcheckbox = document.getElementById("itemID"+count).checked;
	var ct = count;
	//alert(valOfDropDown);
	//alert(valOfcheckbox);selects
	
	if(valOfcheckbox){
		document.getElementById("selects"+count).value = 'checked';
	}else{
		document.getElementById("selects"+count).value = '';
	}
	
	if(curSel == "3" && valOfcheckbox){
		//document.getElementById("36").value='';
		
		document.getElementById("40"+ct).disabled=true;
		document.getElementById("40"+ct).style.display = 'none';
		document.getElementById("39"+ct).disabled=false;
		document.getElementById("39"+ct).style.display = '';
		
		document.getElementById("38"+ct).disabled=true;
		document.getElementById("38"+ct).style.display = 'none';
		document.getElementById("37"+ct).disabled=false;
		document.getElementById("37"+ct).style.display = '';
		
		document.getElementById("24"+ct).disabled=true;
		document.getElementById("24"+ct).style.display = 'none';
		document.getElementById("23"+ct).disabled=false;
		document.getElementById("23"+ct).style.display = '';
		
		/* document.getElementById("50"+ct).disabled=true;
		document.getElementById("50"+ct).style.display = 'none';
		document.getElementById("49"+ct).disabled=false;
		document.getElementById("49"+ct).style.display = ''; */
		
		document.getElementById("42"+ct).disabled=true;
		document.getElementById("42"+ct).style.display = 'none';
		document.getElementById("41"+ct).disabled=false;
		document.getElementById("41"+ct).style.display = '';
		
		document.getElementById("44"+ct).disabled=true;
		document.getElementById("44"+ct).style.display = 'none';
		document.getElementById("43"+ct).disabled=false;
		document.getElementById("43"+ct).style.display = '';
		
		document.getElementById("48"+ct).disabled=true;
		document.getElementById("48"+ct).style.display = 'none';
		document.getElementById("47"+ct).disabled=false;
		document.getElementById("47"+ct).style.display = '';
		
		document.getElementById("36"+ct).disabled=true;
		document.getElementById("36"+ct).style.display = 'none';
		document.getElementById("35"+ct).disabled=false;
		document.getElementById("35"+ct).style.display = '';
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		
	}else if(curSel == "6" && valOfcheckbox){
		document.getElementById("42"+ct).disabled=true;
		document.getElementById("42"+ct).style.display = 'none';
		document.getElementById("41"+ct).disabled=false;
		document.getElementById("41"+ct).style.display = '';
		
		document.getElementById("44"+ct).disabled=true;
		document.getElementById("44"+ct).style.display = 'none';
		document.getElementById("43"+ct).disabled=false;
		document.getElementById("43"+ct).style.display = '';
		
		document.getElementById("48"+ct).disabled=true;
		document.getElementById("48"+ct).style.display = 'none';
		document.getElementById("47"+ct).disabled=false;
		document.getElementById("47"+ct).style.display = '';
		
		document.getElementById("36"+ct).disabled=true;
		document.getElementById("36"+ct).style.display = 'none';
		document.getElementById("35"+ct).disabled=false;
		document.getElementById("35"+ct).style.display = '';
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("24"+ct).disabled=false;
		document.getElementById("24"+ct).style.display = '';
		document.getElementById("23"+ct).disabled=true;
		document.getElementById("23"+ct).style.display = 'none';
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		
		
		
	}else if((curSel == "8" || curSel == "9") && valOfcheckbox){
		document.getElementById("26"+ct).disabled=true;
		document.getElementById("26"+ct).style.display = 'none';
		document.getElementById("25"+ct).disabled=false;
		document.getElementById("25"+ct).style.display = '';
		
		document.getElementById("30"+ct).disabled=true;
		document.getElementById("30"+ct).style.display = 'none';
		document.getElementById("29"+ct).disabled=false;
		document.getElementById("29"+ct).style.display = '';
		
		document.getElementById("32"+ct).disabled=true;
		document.getElementById("32"+ct).style.display = 'none';
		document.getElementById("31"+ct).disabled=false;
		document.getElementById("31"+ct).style.display = '';
		
		/* document.getElementById("52"+ct).disabled=true;
		document.getElementById("52"+ct).style.display = 'none';
		document.getElementById("51"+ct).disabled=false;
		document.getElementById("51"+ct).style.display = ''; */
		
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("24"+ct).disabled=false;
		document.getElementById("24"+ct).style.display = '';
		document.getElementById("23"+ct).disabled=true;
		document.getElementById("23"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("36"+ct).disabled=false;
		document.getElementById("36"+ct).style.display = '';
		document.getElementById("35"+ct).disabled=true;
		document.getElementById("35"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("42"+ct).disabled=false;
		document.getElementById("42"+ct).style.display = '';
		document.getElementById("41"+ct).disabled=true;
		document.getElementById("41"+ct).style.display = 'none';
		
		document.getElementById("44"+ct).disabled=false;
		document.getElementById("44"+ct).style.display = '';
		document.getElementById("43"+ct).disabled=true;
		document.getElementById("43"+ct).style.display = 'none';
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		document.getElementById("48"+ct).disabled=false;
		document.getElementById("48"+ct).style.display = '';
		document.getElementById("47"+ct).disabled=true;
		document.getElementById("47"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
	}
	else if(curSel == "7" && valOfcheckbox){
		
		document.getElementById("24"+ct).disabled=true;
		document.getElementById("24"+ct).style.display = 'none';
		document.getElementById("23"+ct).disabled=false;
		document.getElementById("23"+ct).style.display = '';
		
		document.getElementById("28"+ct).disabled=true;
		document.getElementById("28"+ct).style.display = 'none';
		document.getElementById("27"+ct).disabled=false;
		document.getElementById("27"+ct).style.display = '';
		
		document.getElementById("36"+ct).disabled=true;
		document.getElementById("36"+ct).style.display = 'none';
		document.getElementById("35"+ct).disabled=false;
		document.getElementById("35"+ct).style.display = '';
		
		document.getElementById("46"+ct).disabled=true;
		document.getElementById("46"+ct).style.display = 'none';
		document.getElementById("45"+ct).disabled=false;
		document.getElementById("45"+ct).style.display = '';
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("42"+ct).disabled=false;
		document.getElementById("42"+ct).style.display = '';
		document.getElementById("41"+ct).disabled=true;
		document.getElementById("41"+ct).style.display = 'none';
		
		document.getElementById("44"+ct).disabled=false;
		document.getElementById("44"+ct).style.display = '';
		document.getElementById("43"+ct).disabled=true;
		document.getElementById("43"+ct).style.display = 'none';
		
		document.getElementById("48"+ct).disabled=false;
		document.getElementById("48"+ct).style.display = '';
		document.getElementById("47"+ct).disabled=true;
		document.getElementById("47"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
	}
	else{
		
		document.getElementById("26"+ct).disabled=false;
		document.getElementById("26"+ct).style.display = '';
		document.getElementById("25"+ct).disabled=true;
		document.getElementById("25"+ct).style.display = 'none';
		
		document.getElementById("30"+ct).disabled=false;
		document.getElementById("30"+ct).style.display = '';
		document.getElementById("29"+ct).disabled=true;
		document.getElementById("29"+ct).style.display = 'none';
		
		document.getElementById("32"+ct).disabled=false;
		document.getElementById("32"+ct).style.display = '';
		document.getElementById("31"+ct).disabled=true;
		document.getElementById("31"+ct).style.display = 'none';
		
		/* document.getElementById("52"+ct).disabled=false;
		document.getElementById("52"+ct).style.display = '';
		document.getElementById("51"+ct).disabled=true;
		document.getElementById("51"+ct).style.display = 'none'; */
		
		
		document.getElementById("22"+ct).disabled=false;
		document.getElementById("22"+ct).style.display = '';
		document.getElementById("21"+ct).disabled=true;
		document.getElementById("21"+ct).style.display = 'none';
		
		document.getElementById("24"+ct).disabled=false;
		document.getElementById("24"+ct).style.display = '';
		document.getElementById("23"+ct).disabled=true;
		document.getElementById("23"+ct).style.display = 'none';
		
		document.getElementById("28"+ct).disabled=false;
		document.getElementById("28"+ct).style.display = '';
		document.getElementById("27"+ct).disabled=true;
		document.getElementById("27"+ct).style.display = 'none';
		
		document.getElementById("34"+ct).disabled=false;
		document.getElementById("34"+ct).style.display = '';
		document.getElementById("33"+ct).disabled=true;
		document.getElementById("33"+ct).style.display = 'none';
		
		document.getElementById("36"+ct).disabled=false;
		document.getElementById("36"+ct).style.display = '';
		document.getElementById("35"+ct).disabled=true;
		document.getElementById("35"+ct).style.display = 'none';
		
		document.getElementById("38"+ct).disabled=false;
		document.getElementById("38"+ct).style.display = '';
		document.getElementById("37"+ct).disabled=true;
		document.getElementById("37"+ct).style.display = 'none';
		
		document.getElementById("40"+ct).disabled=false;
		document.getElementById("40"+ct).style.display = '';
		document.getElementById("39"+ct).disabled=true;
		document.getElementById("39"+ct).style.display = 'none';
		
		document.getElementById("42"+ct).disabled=false;
		document.getElementById("42"+ct).style.display = '';
		document.getElementById("41"+ct).disabled=true;
		document.getElementById("41"+ct).style.display = 'none';
		
		document.getElementById("44"+ct).disabled=false;
		document.getElementById("44"+ct).style.display = '';
		document.getElementById("43"+ct).disabled=true;
		document.getElementById("43"+ct).style.display = 'none';
		
		document.getElementById("46"+ct).disabled=false;
		document.getElementById("46"+ct).style.display = '';
		document.getElementById("45"+ct).disabled=true;
		document.getElementById("45"+ct).style.display = 'none';
		
		document.getElementById("48"+ct).disabled=false;
		document.getElementById("48"+ct).style.display = '';
		document.getElementById("47"+ct).disabled=true;
		document.getElementById("47"+ct).style.display = 'none';
		
		/* document.getElementById("50"+ct).disabled=false;
		document.getElementById("50"+ct).style.display = '';
		document.getElementById("49"+ct).disabled=true;
		document.getElementById("49"+ct).style.display = 'none'; */
		
	}
	
}

function removeDisabled(){
	
	var curSel = document.getElementById("14").value;
	var docDescLength=[];
	docDescLength=document.getElementsByName("docDesc");
	var ct = 1;
	
	for(var i=0;i<docDescLength.length;i++){
		if(document.getElementById("26"+ct) == null){
			ct++;
		}
		if(curSel == "3"){
			document.getElementById("39"+ct).disabled=false;
			document.getElementById("37"+ct).disabled=false;
			document.getElementById("23"+ct).disabled=false;
			/* document.getElementById("49"+ct).disabled=false; */
			document.getElementById("41"+ct).disabled=false;
			document.getElementById("43"+ct).disabled=false;
			document.getElementById("47"+ct).disabled=false;
			document.getElementById("35"+ct).disabled=false;
			
		}else if(curSel == "6"){
			document.getElementById("35"+ct).disabled=false;
			document.getElementById("41"+ct).disabled=false;
			document.getElementById("43"+ct).disabled=false;
			document.getElementById("47"+ct).disabled=false;
			/* document.getElementById("21"+ct).disabled=false; */
			
		}else if((curSel == "8" || curSel == "9")){
			document.getElementById("25"+ct).disabled=false;
			document.getElementById("29"+ct).disabled=false;
			document.getElementById("31"+ct).disabled=false;
			
		}
		else if(curSel == "7"){
			document.getElementById("35"+ct).disabled=false;
			/* document.getElementById("21"+ct).disabled=false; */
			document.getElementById("23"+ct).disabled=false;
			document.getElementById("27"+ct).disabled=false;
			document.getElementById("45"+ct).disabled=false;
		}
	
	ct++;
	}
	
}


function vaultLocationfunction(){
	var curSel = document.getElementById("14").value;
	var docDescLength=[];
	docDescLength=document.getElementsByName("docDesc");
	var ct = 1;
	if((curSel == "6" || curSel == "7" || curSel == "3")){
	for(var i=0;i<docDescLength.length;i++){
		if(document.getElementById("26"+ct) == null){
			ct++;
		}
		if(document.getElementById("vaultLocationss"+ct) != null){
			document.getElementById("vaultLocs"+ct).value = document.getElementById("vaultLocationss"+ct).value;
		}else{
			document.getElementById("vaultLocs"+ct).value = '';
		}
		
		ct++;
	}
	}
}





//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='caseCreationUpdate'>
	<input type="hidden" name="hiddenItemID" />
	<input type="hidden" name="event" />
<html:hidden property="status"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					
					<br>
					<br>
					<tr>
						<td>
							<h3>
								Maintain Case Creation
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
													Case Id
												</td>
												<td width="30%">
												<%if(caseCreationUpdateTrx.getCaseCreation()!=null){ %>
												<%=caseCreationUpdateTrx.getCaseCreation().getId()%>
												<%} %>
												&nbsp;
												</td>
												
											</tr>
											
											
																						<tr class="odd">
											 <td class="fieldname" >Status&nbsp;</td>
              <td ><%if(!caseCreationUpdateForm.getStatus().trim().equalsIgnoreCase("CLOSED")){ %>Open
              <%}else{ %>Closed<%} %>&nbsp;</td>
              </br></tr>	
             <tr><td colspan="2">&nbsp;</td></tr>
              <tr >
    <td colspan="2">
    
    <%if(resultList.size()>9){ %>
    <div  id="listingTable" style="width:100%; height:200px; overflow-x:hidden;overflow-y:scroll">
    <%} %>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
        	<td>S/N</td>
        
<!--        	<td>Doc Code</td>-->
        	<td>Description</td>
        	<td>Document Type</td>
        	<td>Facility Name</td>
        	<td>Security Type </br>-</br> Sub Type</td>
        	
<td>Status</td>
<td>CPUT Requested Date</td>
<td>Branch Sent Date</td>
<td>CPUT Received Date</td>
<td>Document Bar Code</td>
<td>Vault Number</td>
<td>Retrieval Date</td>
<td>Vault Receipt Date</td>
<td>User Name</td>
<td>Submitted To</td>
<td>Document Amount</td>
<td>Vault Location</td>
<td>Place of Execution</td>
<td>Stamp Duty</td>
<td>File Bar Code</td>
<td>Box Bar Code</td>
<td>Rack Number</td>
<td>Lot Number</td>
<td>Action</td>
        </tr>
    </thead>
    <tbody>
  <%int counter1 = 0; 
  String docBarcodeErrors = "";
  String 	 vaultNumberError = "";
  String  retrievaldateError = "";
  String  vaultReceiptDateError = "";
  String  userNameError  = "";
  String  submittedToError  = "";
  String  documentAmountError = "";
  String  vaultLocationError = "";
  String  stampDutyError = "";
  String  placeOfExecutionError = "";
  String 	 fileBarCodeError = "";
  String  boxBarCodeError  = "";
  String  rackNumberError  = "";
  String  lotNumberError = "";
  String  receivedDateError = "";
  
  %>
<logic:present name="resultList">
   <logic:iterate id="compResult" name="resultList"  type="com.integrosys.base.techinfra.diff.CompareResult" scope="page" length="<%=String.valueOf(resultList.size()) %>" offset="<%=String.valueOf(startIndex)%>" >
   <%
   com.integrosys.cms.app.caseCreation.bus.ICaseCreation OB =(com.integrosys.cms.app.caseCreation.bus.ICaseCreation) compResult.getObj();
   ICheckListItem actualItem=(ICheckListItem) checklistItemMap.get(String.valueOf(OB.getChecklistitemid()));
       String rowClass="";
   counter1++;
      if(counter1%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }
      boolean isCPUTRequested=false;
      boolean isBranchSent=false;
      boolean isCPUTReceived=false;
      boolean isDocMaintained=false;
      boolean isCaseDate=false;
      boolean isReqDate=false;
      boolean isSentDate=false;
      boolean isRecDate=false;
      boolean isWrongRequest=false;
      boolean isWrongRequestAccepted=false;
      boolean isPermanentRetrival=false;
      boolean isTemporaryRetrival=false;
      boolean isSenttovault=false;
      boolean isReceivedatVault=false;
      boolean itemNotFound= false;
      
      String[] docBarArr = caseCreationUpdateForm.getUpdatedDocBarcode();
      String[]  vaultNumberArr = caseCreationUpdateForm.getUpdatedVaultNumber();
      String[] retrievaldateArr = caseCreationUpdateForm.getUpdatedRetrievaldate();
      String[] vaultReceiptDateArr = caseCreationUpdateForm.getUpdatedVaultReceiptDate();
      String[] userNameArr  = caseCreationUpdateForm.getUpdatedUserName();
      String[] submittedToArr  = caseCreationUpdateForm.getUpdatedSubmittedTo();
 	 String[] documentAmountArr = caseCreationUpdateForm.getUpdatedDocAmount();
 	 String[] vaultLocationArr = caseCreationUpdateForm.getUpdatedVaultLocation();
 	 String[] stampDutyArr = caseCreationUpdateForm.getUpdatedStampDuty();
 	 String[] placeOfExecutionArr = caseCreationUpdateForm.getUpdatedPlaceOfExecution();
 	 String[] fileBarCodeArr = caseCreationUpdateForm.getUpdatedFileBarCode();
 	 String[] boxBarCodeArr  = caseCreationUpdateForm.getUpdatedBoxBarCode();
 	 String[] rackNumberArr  = caseCreationUpdateForm.getUpdatedRackNumber();
 	 String[] lotNumberArr = caseCreationUpdateForm.getUpdatedLotNumber();
 	String[] receivedDateArr = caseCreationUpdateForm.getUpdatedReceivedDate();
      
      if(actualItem!=null){
    	  
    	 isDocMaintained=true;

    	 if(OB.getCaseDate()!=null){
    	 	isCaseDate=true;
    	 }
    	 if(OB.getRequestedDate()!=null){
    	 	isReqDate=true;
    	 }
    	 if(OB.getDispatchedDate()!=null){
    	 	isSentDate=true;
    	 }
    	 if(OB.getReceivedDate()!=null){
    	 	isRecDate=true;
    	 }

    	 if("1".equals(OB.getStatus())){
    	 	isCPUTRequested=true;
    	 }
    	 if("2".equals(OB.getStatus())){
    	 	isBranchSent=true;
    	 }
    	 if("3".equals(OB.getStatus())){
    	 	isCPUTReceived=true;
    	 }
    	 if("4".equals(OB.getStatus())){
    		 isWrongRequest=true;
     	 } 
    	 if("5".equals(OB.getStatus())){
    		 isWrongRequestAccepted=true;
     	 }
    	 if("6".equals(OB.getStatus())){
    		 isSenttovault=true;
     	 }
    	 if("7".equals(OB.getStatus())){
    		 isReceivedatVault=true;
     	 }
    	 if("8".equals(OB.getStatus())){
    		 isPermanentRetrival=true;
     	 }
    	 if("9".equals(OB.getStatus())){
    		 isTemporaryRetrival=true;
     	 }
    	 }else{
    		 itemNotFound=true;
    	 }
      
      if(!itemNotFound){
      
      
   %>
  
    

   
<tr class="<%= rowClass%>">
<td class='<bean:write name="compResult" property="key" />' ><%=counter1+startIndex%></td>

<%int cnt=counter1+startIndex; 
String cntsVault = "vaultLocationss"+ Integer.toString(cnt);
%>

		<%--<td><%=actualItem.getItemCode()%></td> --%>
       <td height="18" id="52<%=cnt%>"><%=actualItem.getItemDesc()%><input type="hidden" name="docDesc" value="<%=actualItem.getItemDesc()%>" /></td>
        <td><integro:empty-if-null value="<%=typeMap.get(String.valueOf(OB.getChecklistitemid()))%>"/></td>
        <td><integro:empty-if-null value="<%=facilityNameMap.get(String.valueOf(OB.getChecklistitemid()))%>"/></td>
        <td><integro:empty-if-null value="<%=securityTypeMap.get(String.valueOf(OB.getChecklistitemid()))%>"/></td>
        <%System.out.println("Submitted To at rejected maker side Record=>"+OB.getSubmittedTo()); %>
        
        <%
 docBarcodeErrors = "docBarcodeError"+Integer.toString(cnt);
 vaultNumberError = "vaultNumberError"+Integer.toString(cnt);
 retrievaldateError = "retrievaldateError"+Integer.toString(cnt);
 vaultReceiptDateError = "vaultReceiptDateError"+Integer.toString(cnt);
 userNameError  = "userNameError"+Integer.toString(cnt);
 submittedToError  = "submittedToError"+Integer.toString(cnt);
 documentAmountError = "documentAmountError"+Integer.toString(cnt);
 vaultLocationError = "vaultLocationError"+Integer.toString(cnt);
 stampDutyError = "stampDutyError"+Integer.toString(cnt);
 placeOfExecutionError = "placeOfExecutionError"+Integer.toString(cnt);
 fileBarCodeError = "fileBarCodeError"+Integer.toString(cnt);
 boxBarCodeError  = "boxBarCodeError"+Integer.toString(cnt);
 rackNumberError  = "rackNumberError"+Integer.toString(cnt);
 lotNumberError = "lotNumberError"+Integer.toString(cnt);
 receivedDateError = "receivedDateError"+Integer.toString(cnt);
 
 %>
        
        <td height="18"><b><%
        if(isCPUTRequested){
        %>
       <font color="#7F4E52"> CPUT Requested</font>
        <%}
        if(isBranchSent){
            %>
            <font color="#1589FF">BRANCH Sent</font>
            <%}
             if(isCPUTReceived){
        %>
        <font color="#4AA02C">CPUT Received</font>
        <%} if(isWrongRequest){
            %>
            <font color="#FF0000">Wrong Request</font>
            <%}
                 if(isWrongRequestAccepted){
            %>
            <font color="#4AA02C">Wrong Request Accepted</font>
            <%}if(isSenttovault){
                %>
                <font color="#4AA02C">Sent to vault</font>
           <%}
       if(isReceivedatVault){
               %>
               <font color="#4AA02C">Received at Vault</font>
          <%}
       if(isPermanentRetrival){
           %>
           <font color="#4AA02C">Permanent Retrieval</font>
      <%}
       if(isTemporaryRetrival){
           %>
           <font color="#4AA02C">Temporary Retrieval</font>
      <%}
                 %>
        </b>
        </td>
      
          <td height="18">&nbsp;
        <%if(isReqDate){ %>
        <integro:date object="<%=OB.getRequestedDate()%>"></integro:date>
        
        <%} %>
        </td>
        <td height="18">&nbsp;
        <%if(isSentDate){ %>
        <integro:date object="<%=OB.getDispatchedDate()%>"></integro:date>
        
        <%} %>
        </td>
        
        <%-- <%if(isRecDate){ %>
        <td id="49<%=cnt%>"><input  property="receivedDate" size="12" maxlength="12" id="receivedDate<%=cnt%>" name="updatedReceivedDate" 
 <%if(receivedDateArr != null ){  if(receivedDateArr.length > 0){ %>    value="<%=receivedDateArr[cnt-1]%>"     <%}} %> />
                            <img src="img/calendara.gif" name="Image11<%=cnt%>" border="0" id="Image1<%=cnt%>" onclick="return showCalendar1('receivedDate<%=cnt%>', 'dd/mm/y','updatedReceivedDate');"
                                 onmouseover="MM_swapImage('Image11<%=cnt%>','','img/calendarb.gif',1)" >
                            <html:errors property="<%=receivedDateError%>"/></td> 
        
        <td height="18" id="50<%=cnt%>">&nbsp;
        <integro:date object="<%=OB.getReceivedDate()%>"><html:errors property="<%=receivedDateError%>"/></integro:date>
        </td>
        
        <%} else{ %>
        <td id="49<%=cnt%>"><input  property="receivedDate" size="12" maxlength="12" id="receivedDate<%=cnt%>" name="updatedReceivedDate" 
 <%if(receivedDateArr != null ){  if(receivedDateArr.length > 0){ %>    value="<%=receivedDateArr[cnt-1]%>"     <%}} %> />
                            <img src="img/calendara.gif" name="Image11<%=cnt%>" border="0" id="Image1<%=cnt%>" onclick="return showCalendar1('receivedDate<%=cnt%>', 'dd/mm/y','updatedReceivedDate');"
                                 onmouseover="MM_swapImage('Image11<%=cnt%>','','img/calendarb.gif',1)" >
                            <html:errors property="<%=receivedDateError%>"/></td> 
 		<td id="50<%=cnt%>"><integro:date object="<%=OB.getReceivedDate()%>"/><html:errors property="<%=receivedDateError%>"/></td>
        <%} %> --%>
        
         <td height="18">&nbsp;
        <%if(isRecDate){ %>
        <integro:date object="<%=OB.getReceivedDate()%>"></integro:date>
        
        <%} %>
        </td>
        
        
        
        
        <td id="21<%=cnt%>"><input type="text"  property="documentBarCode"  name="updatedDocBarcode" id="documentBarCodes<%=cnt%>" 
 <%if(docBarArr != null ){  if(docBarArr.length > 0){ %>    value="<%=docBarArr[cnt-1]%>"     <%}}else{ if(OB.getDocumentBarCode() == null){%>value="" <%}else{ %>value="<%=OB.getDocumentBarCode()%>" <%}} %> /><html:errors property="<%=docBarcodeErrors%>"/></td>
 
 <%if(docBarArr != null ){  if(docBarArr.length > 0){%>
 <td id="22<%=cnt%>"> <integro:empty-if-null value="<%=OB.getDocumentBarCode()%>"/> <html:errors property="<%=docBarcodeErrors%>"/></td>
 <%}}else{ %>
 <td id="22<%=cnt%>"> <integro:empty-if-null value="<%=OB.getDocumentBarCode()%>"/> <html:errors property="<%=docBarcodeErrors%>"/></td>
 <% }%>
 
 
 
 
 <td id="23<%=cnt%>"><input type="text"  property="vaultNumber" name="updatedVaultNumber" id="vaultNumber<%=cnt%>" 
 <%if(vaultNumberArr != null ){  if(vaultNumberArr.length > 0){ %>    value="<%=vaultNumberArr[cnt-1]%>"     <%}}else{ if(OB.getVaultNumber() == null){%>value="" <%}else{%>value="<%=OB.getVaultNumber()%>" <%}} %> /><html:errors property="<%=vaultNumberError%>"/></td>
 
 <%if(vaultNumberArr != null ){  if(vaultNumberArr.length > 0){%>
 <td id="24<%=cnt%>"> <integro:empty-if-null value="<%=OB.getVaultNumber()%>"/> <html:errors property="<%=vaultNumberError%>"/></td>
 <%}}else{ %>
 <td id="24<%=cnt%>"> <integro:empty-if-null value="<%=OB.getVaultNumber()%>"/> <html:errors property="<%=vaultNumberError%>"/></td>
 <% }%>
 
 
 
 <%-- <td id="25<%=cnt%>"><input type="text"  property="retrievalDate"  id="retrievalDate<%=cnt%>" name="updatedRetrievaldate"
 <%if(retrievaldateArr != null ){  if(retrievaldateArr.length > 0){ %>    value="<%=retrievaldateArr[cnt-1]%>"     <%}} %> /><html:errors property="<%=retrievaldateError%>"/></td> --%>
 
 
 
 
 <td id="25<%=cnt%>"><input  property="retrievalDate" size="12" maxlength="12" id="retrievalDate<%=cnt%>" name="updatedRetrievaldate" 
 <%if(retrievaldateArr != null ){  if(retrievaldateArr.length > 0){ %>    value="<%=retrievaldateArr[cnt-1]%>"     <%}}else{ if(OB.getRetrievaldate() != null && !"".equals(OB.getRetrievaldate())){%>value="<%=df.format(OB.getRetrievaldate())%>" <%}} %> />
                            <img src="img/calendara.gif" name="Image11<%=cnt%>" border="0" id="Image1<%=cnt%>" onclick="return showCalendar1('retrievalDate<%=cnt%>', 'dd/mm/y','updatedRetrievaldate');"
                            <%-- onclick="dateField('vaultReceiptDatess<%=cnt%>');" --%>
                                 onmouseover="MM_swapImage('Image11<%=cnt%>','','img/calendarb.gif',1)" >
                            <html:errors property="<%=retrievaldateError%>"/></td> 
 
 
 
 <%if(retrievaldateArr != null ){  if(retrievaldateArr.length > 0){%>
 <td id="26<%=cnt%>"> <integro:date object="<%=OB.getRetrievaldate()%>"/> <html:errors property="<%=retrievaldateError%>"/></td>
 <%}}else{ %>
 <td id="26<%=cnt%>"> <integro:date object="<%=OB.getRetrievaldate()%>"/> <html:errors property="<%=retrievaldateError%>"/></td>
 <% }%>


 
 <td id="27<%=cnt%>"><input  property="vaultReceiptDate" size="12" maxlength="12" id="vaultReceiptDate<%=cnt%>" name="updatedVaultReceiptDate" 
 <%if(vaultReceiptDateArr != null ){  if(vaultReceiptDateArr.length > 0){ %>    value="<%=vaultReceiptDateArr[cnt-1]%>"     <%}}else{ if(OB.getVaultReceiptDate() != null && !"".equals(OB.getVaultReceiptDate())){ %>value="<%=df.format(OB.getVaultReceiptDate())%>" <%}} %> />
                            <img src="img/calendara.gif" name="Image11<%=cnt%>" border="0" id="Image1<%=cnt%>" onclick="return showCalendar1('vaultReceiptDate<%=cnt%>', 'dd/mm/y','updatedVaultReceiptDate');"
                            <%-- onclick="dateField('vaultReceiptDatess<%=cnt%>');" --%>
                                 onmouseover="MM_swapImage('Image11<%=cnt%>','','img/calendarb.gif',1)" >
                            <html:errors property="<%=vaultReceiptDateError%>"/></td> 
                            
 <%-- <td id="27<%=cnt%>"><input type="text" property="vaultReceiptDate"  id="vaultReceiptDate<%=cnt%>" name="updatedVaultReceiptDate"    
 <%if(vaultReceiptDateArr != null ){  if(vaultReceiptDateArr.length > 0){ %>    value="<%=vaultReceiptDateArr[cnt-1]%>"     <%}} %> /><html:errors property="<%=vaultReceiptDateError%>"/></td>
  --%>
 <%if(vaultReceiptDateArr != null ){  if(vaultReceiptDateArr.length > 0){%>
 <td id="28<%=cnt%>"> <integro:date object="<%=OB.getVaultReceiptDate()%>"/> <html:errors property="<%=vaultReceiptDateError%>"/></td>
 <%}}else{ %>
 <td id="28<%=cnt%>"> <integro:date object="<%=OB.getVaultReceiptDate()%>"/> <html:errors property="<%=vaultReceiptDateError%>"/></td>
 <% }%>
                        
 
 <td id="29<%=cnt%>"><input type="text"  property="userName"  id="userName<%=cnt%>" name="updatedUserName" 
 <%if(userNameArr != null ){  if(userNameArr.length > 0){ %>    value="<%=userNameArr[cnt-1]%>"     <%}}else{ if(OB.getUserName() == null){%>value = "" <% }else{%>value = "<%=OB.getUserName() %>" <% }} %> /><html:errors property="<%=userNameError%>"/></td>
 
 <%if(userNameArr != null ){  if(userNameArr.length > 0){%>
 <td id="30<%=cnt%>"> <integro:empty-if-null value="<%=OB.getUserName()%>"/> <html:errors property="<%=userNameError%>"/></td>
 <%}}else{ %>
 <td id="30<%=cnt%>"> <integro:empty-if-null value="<%=OB.getUserName()%>"/> <html:errors property="<%=userNameError%>"/></td>
 <% }%>
 
 
 <td id="31<%=cnt%>"><input type="text"  property="submittedTo"  id="submittedTo<%=cnt%>" name="updatedSubmittedTo" 
 <%if(submittedToArr != null ){  if(submittedToArr.length > 0){ %>    value="<%=submittedToArr[cnt-1]%>"     <%}}else{   if(OB.getSubmittedTo() == null){%>value="" <%}else{  %>value="<%=OB.getSubmittedTo()%>" <%}} %> /><html:errors property="<%=submittedToError%>"/></td>
 
 <%if(submittedToArr != null ){  if(submittedToArr.length > 0){%>
 <td id="32<%=cnt%>"> <integro:empty-if-null value="<%=OB.getSubmittedTo()%>"/> <html:errors property="<%=submittedToError%>"/></td>
 <%}}else{ %>
 <td id="32<%=cnt%>"> <integro:empty-if-null value="<%=OB.getSubmittedTo()%>"/> <html:errors property="<%=submittedToError%>"/></td>
 <% }%>
 
 
 <td id="33<%=cnt%>"><input type="text"  property="documentAmount"  id="documentAmount<%=cnt%>" name="updatedDocumentAmount" 
 <%if(documentAmountArr != null ){  if(documentAmountArr.length > 0){ %>    value="<%=documentAmountArr[cnt-1]%>"     <%}}else{  if(OB.getDocumentAmount() == null){%>value="" <%}else{ %>value="<%=OB.getDocumentAmount()%>" <%}} %> /><html:errors property="<%=documentAmountError%>"/></td>
 
 <%if(documentAmountArr != null ){  if(documentAmountArr.length > 0){%>
 <td id="34<%=cnt%>"> <integro:empty-if-null value="<%=OB.getDocumentAmount()%>"/> <html:errors property="<%=documentAmountError%>"/></td>
 <%}}else{ %>
 <td id="34<%=cnt%>"> <integro:empty-if-null value="<%=OB.getDocumentAmount()%>"/> <html:errors property="<%=documentAmountError%>"/></td>
 <% }%>
 
 
  <%-- <td id="35<%=cnt%>"><input type="text"  property="vaultLocation"  id="vaultLocation<%=cnt%>" name="updatedVaultLocation" 
 <%if(vaultLocationArr != null ){  if(vaultLocationArr.length > 0){ %>    value="<%=vaultLocationArr[cnt-1]%>"     <%}}else{%>value="<%=OB.getVaultLocation()%>" <%} %> /><html:errors property="<%=vaultLocationError%>"/></td>
 
 <%if(vaultLocationArr != null ){  if(vaultLocationArr.length > 0){%>
 <td id="36<%=cnt%>"> <integro:empty-if-null value="<%=OB.getVaultLocation()%>"/> <html:errors property="<%=vaultLocationError%>"/></td>
 <%}}else{ %>
 <td id="36<%=cnt%>"> <integro:empty-if-null value="<%=OB.getVaultLocation()%>"/> <html:errors property="<%=vaultLocationError%>"/></td>
 <% }%>  --%>
 
 
 <%if(vaultLocationArr != null ){  if(vaultLocationArr.length > 0){ %>        
 <td id="35<%=cnt%>"><html:select property="vaultLocationss"  styleId="<%=cntsVault%>"  value="<%=vaultLocationArr[cnt-1]%>" >
                      	<html:option value="">Please Select</html:option> 
                        <html:options name="vaultLocationValueList"></html:options>
                        <input type="hidden" name="updatedVaultLocation" id="vaultLocs<%=cnt%>" />
                      </html:select>
                      <html:errors property="<%=vaultLocationError%>"/>
                      </td>
                      
      <%}}else{ %>
             <td id="35<%=cnt%>"><html:select property="vaultLocationss"  styleId="<%=cntsVault%>"    >
                      	<html:option value="">Please Select</html:option> 
                        <html:options name="vaultLocationValueList"></html:options>
                        <input type="hidden" name="updatedVaultLocation" id="vaultLocs<%=cnt%>" />
                      </html:select>
                      <html:errors property="<%=vaultLocationError%>"/>
                      </td>
                      <%} %>
                      
                      
                      
 <%if(vaultLocationArr != null ){  if(vaultLocationArr.length > 0){%>
 <td id="36<%=cnt%>"> <integro:empty-if-null value="<%=OB.getVaultLocation()%>"/> <html:errors property="<%=vaultLocationError%>"/></td>
 <%}}else{ %>
 <td id="36<%=cnt%>"> <integro:empty-if-null value="<%=OB.getVaultLocation()%>"/> <html:errors property="<%=vaultLocationError%>"/></td>
 <% }%>
 
 
 
 <td id="37<%=cnt%>"><input type="text"  property="placeOfExecution"  id="placeOfExecution<%=cnt%>" name="updatedPlaceOfExecution" 
 <%if(placeOfExecutionArr != null ){  if(placeOfExecutionArr.length > 0){ %>    value="<%=placeOfExecutionArr[cnt-1]%>"     <%}}else{   if(OB.getPlaceOfExecution() == null){%>value="" <%}else{   %>value="<%=OB.getPlaceOfExecution()%>" <%}} %> /><html:errors property="<%=placeOfExecutionError%>"/></td>
 
 <%if(placeOfExecutionArr != null ){  if(placeOfExecutionArr.length > 0){%>
 <td id="38<%=cnt%>"> <integro:empty-if-null value="<%=OB.getPlaceOfExecution()%>"/> <html:errors property="<%=placeOfExecutionError%>"/></td>
 <%}}else{ %>
 <td id="38<%=cnt%>"> <integro:empty-if-null value="<%=OB.getPlaceOfExecution()%>"/> <html:errors property="<%=placeOfExecutionError%>"/></td>
 <% }%>
 
 
 <td id="39<%=cnt%>"><input type="text"  property="stampDuty"  id="stampDuty<%=cnt%>" name="updatedStampDuty" 
 <%if(stampDutyArr != null ){  if(stampDutyArr.length > 0){ %>    value="<%=stampDutyArr[cnt-1]%>"     <%}}else{   if(OB.getStampDuty() == null){%>value="" <%}else{    %>value="<%=OB.getStampDuty()%>" <%}} %> /><html:errors property="<%=stampDutyError%>"/></td>
 
 <%if(stampDutyArr != null ){  if(stampDutyArr.length > 0){%>
 <td id="40<%=cnt%>"> <integro:empty-if-null value="<%=OB.getStampDuty()%>"/> <html:errors property="<%=stampDutyError%>"/></td>
 <%}}else{ %>
 <td id="40<%=cnt%>"> <integro:empty-if-null value="<%=OB.getStampDuty()%>"/> <html:errors property="<%=stampDutyError%>"/></td>
 <% }%>
 
 
 <td id="41<%=cnt%>"><input type="text"  property="fileBarCode"  id="fileBarCode<%=cnt%>" name="updatedFileBarCode" 
 <%if(fileBarCodeArr != null ){  if(fileBarCodeArr.length > 0){ %>    value="<%=fileBarCodeArr[cnt-1]%>"     <%}}else{   if(OB.getFileBarCode() == null){%>value="" <%}else{     %>value="<%=OB.getFileBarCode()%>" <%}} %> /><html:errors property="<%=fileBarCodeError%>"/></td>
 
 <%if(fileBarCodeArr != null ){  if(fileBarCodeArr.length > 0){%>
 <td id="42<%=cnt%>"> <integro:empty-if-null value="<%=OB.getFileBarCode()%>"/> <html:errors property="<%=fileBarCodeError%>"/></td>
 <%}}else{ %>
 <td id="42<%=cnt%>"> <integro:empty-if-null value="<%=OB.getFileBarCode()%>"/> <html:errors property="<%=fileBarCodeError%>"/></td>
 <% }%>
 
 
 <td id="43<%=cnt%>"><input type="text"  property="boxBarCode"  id="boxBarCode<%=cnt%>" name="updatedBoxBarCode" 
 <%if(boxBarCodeArr != null ){  if(boxBarCodeArr.length > 0){ %>    value="<%=boxBarCodeArr[cnt-1]%>"     <%}}else{    if(OB.getBoxBarCode() == null){%>value="" <%}else{      %>value="<%=OB.getBoxBarCode()%>" <%}} %> /><html:errors property="<%=boxBarCodeError%>"/></td>
 
 <%if(boxBarCodeArr != null ){  if(boxBarCodeArr.length > 0){%>
 <td id="44<%=cnt%>"> <integro:empty-if-null value="<%=OB.getBoxBarCode()%>"/> <html:errors property="<%=boxBarCodeError%>"/></td>
 <%}}else{ %>
 <td id="44<%=cnt%>"> <integro:empty-if-null value="<%=OB.getBoxBarCode()%>"/> <html:errors property="<%=boxBarCodeError%>"/></td>
 <% }%>
 
 
 <td id="45<%=cnt%>"><input type="text"  property="rackNumber"  id="rackNumber<%=cnt%>" name="updatedRackNumber" 
 <%if(rackNumberArr != null ){  if(rackNumberArr.length > 0){ %>    value="<%=rackNumberArr[cnt-1]%>"     <%}}else{   if(OB.getRackNumber() == null){%>value="" <%}else{       %>value="<%=OB.getRackNumber()%>" <%}} %> /><html:errors property="<%=rackNumberError%>"/></td>
 
 <%if(rackNumberArr != null ){  if(rackNumberArr.length > 0){%>
 <td id="46<%=cnt%>"> <integro:empty-if-null value="<%=OB.getRackNumber()%>"/> <html:errors property="<%=rackNumberError%>"/></td>
 <%}}else{ %>
 <td id="46<%=cnt%>"> <integro:empty-if-null value="<%=OB.getRackNumber()%>"/> <html:errors property="<%=rackNumberError%>"/></td>
 <% }%>
 
 
 <td id="47<%=cnt%>"><input type="text"  property="lotNumber"  id="lotNumber<%=cnt%>" name="updatedLotNumber" 
 <%if(lotNumberArr != null ){  if(lotNumberArr.length > 0){ %>    value="<%=lotNumberArr[cnt-1]%>"     <%}}else{   if(OB.getLotNumber() == null){%>value="" <%}else{   %>value="<%=OB.getLotNumber()%>" <%}} %> /><html:errors property="<%=lotNumberError%>"/></td>
 
 <%if(lotNumberArr != null ){  if(lotNumberArr.length > 0){%>
 <td id="48<%=cnt%>"> <integro:empty-if-null value="<%=OB.getLotNumber()%>"/> <html:errors property="<%=lotNumberError%>"/></td>
 <%}}else{ %>
 <td id="48<%=cnt%>"> <integro:empty-if-null value="<%=OB.getLotNumber()%>"/> <html:errors property="<%=lotNumberError%>"/></td>
 <% }%>
        
        
        
        
        
        
        
        
        
        <td style="text-align:center">&nbsp;
    
          <%if(isCPUT||isCPUTMakerchecker){
    	   if(isDocMaintained){
    		   
    	  
    	   %>
            <input type="checkbox" id="itemID<%=cnt%>" onclick="enableFieldsOnCheckboxSelect('<%=cnt%>');" name="itemID" value="<%=OB.getChecklistitemid()%>" <% if("indexdiff".equalsIgnoreCase(compResult.getKey())){ %> checked="checked" <%}else{ %>  disabled="disabled"  <%} %> <% if("indexadd".equalsIgnoreCase(compResult.getKey())){ %> disabled="disabled"  checked="checked" <%} %> />
            <input type="hidden" name="checkBoxValues" id="selects<%=cnt%>" />
            <% }else {
            	%>
       <input type="checkbox" id="itemID<%=cnt%>" name="itemID" onclick="enableFieldsOnCheckboxSelect('<%=cnt%>');" value="<%=OB.getChecklistitemid()%>" <% if("indexdiff".equalsIgnoreCase(compResult.getKey())){ %> checked="checked" <%} else{ %>  disabled="disabled"  <%} %> <% if("indexadd".equalsIgnoreCase(compResult.getKey())){ %> disabled="disabled" checked="checked" <%} %> />
       <input type="hidden" name="checkBoxValues" id="selects<%=cnt%>" />
     <% } }%>
             <%if(isBRANCH){
            	 if(isDocMaintained){
            		
            	 %>
            <input type="checkbox" id="itemID<%=cnt%>" name="itemID" onclick="enableFieldsOnCheckboxSelect('<%=cnt%>');" value="<%=OB.getChecklistitemid()%>" <% if("indexdiff".equalsIgnoreCase(compResult.getKey())){ %> checked="checked" <%} else{ %>  disabled="disabled"  <%} %> <% if("indexadd".equalsIgnoreCase(compResult.getKey())){ %> disabled="disabled" checked="checked" <%} %> />
           
            <% }%> <input type="hidden" name="checkBoxValues" id="selects<%=cnt%>" /> <% }%>
    
<!--            <input type="checkbox" name="itemID" value="<%=OB.getChecklistitemid()%>" />-->
            
          </td>
    </tr>
   
   <%} %>
   </logic:iterate>
   </logic:present>
   
   
   
   <%
   if(counter1 == 0) { %>

   <tr>
   <td colspan="11">
   No records found.
  
   </td>
   
   </tr>
   <% }else{%>
 
  
  <%} %>
    </tbody>
    </table>
     <%if(resultList.size()>9){ %>
    </div>
    <%} %>
 </td>
</tr>
  
              
              
              	
<html:hidden name="MaintainCaseCreationForm" property="status"/>
                   <html:hidden name="MaintainCaseCreationForm" property="description"/>
 <html:hidden name="MaintainCaseCreationForm" property="createBy"/>
 <html:hidden name="MaintainCaseCreationForm" property="lastUpdateBy"/>
  <html:hidden name="MaintainCaseCreationForm" property="lastUpdateDate"/>
    <html:hidden name="MaintainCaseCreationForm" property="creationDate"/>
     <html:hidden name="MaintainCaseCreationForm" property="deprecated"/>
      <html:hidden name="MaintainCaseCreationForm" property="id"/>
   <html:hidden name="MaintainCaseCreationForm" property="limitProfileId"/>
   <html:hidden name="MaintainCaseCreationForm" property="submittedssTo"/>
       <html:hidden name="MaintainCaseCreationForm" property="statusOfDocument"/>
	  <html:hidden name="MaintainCaseCreationForm" property="removedSrNum"/> 
										
								</tbody>
							</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>
								
								<tr>
     <td  class="fieldname" >
    Documents Status: 
    
    </td><td colspan="3">
    <select id="14" onchange="editableFields(this);">
     <option value="0" >--Please Select--</option>
     <%if(isCPUT||isCPUTMakerchecker){ %>
   <%if(caseCreationUpdateTrx.getCaseCreation()==null){ %>
   <option value="1" selected="selected"  >CPUT Requested</option>
   <%}else{ %>
    <option value="1" <% if(caseCreation.getStatus().equals("1")){ %> selected="selected" <%} %> >CPUT Requested</option>
    <option value="3" <% if(caseCreation.getStatus().equals("3")){ %> selected="selected" <%} %> >CPUT Received</option>
     <option value="5" <% if(caseCreation.getStatus().equals("5")){ %> selected="selected" <%} %> >CPUT Wrong Requested Accepted </option>
     <option value="6" <% if(caseCreation.getStatus().equals("6")){ %> selected="selected" <%} %> >Sent to vault</option>
     <option value="7" <% if(caseCreation.getStatus().equals("7")){ %> selected="selected" <%} %> >Received at Vault</option>
     <option value="8" <% if(caseCreation.getStatus().equals("8")){ %> selected="selected" <%} %> >Permanent Retrieval</option>
     <option value="9" <% if(caseCreation.getStatus().equals("9")){ %> selected="selected" <%} %> >Temporary Retrieval</option>
    <%}} %>
    <%if(isBRANCH){ %>
    <option value="2" <% if(caseCreation.getStatus().equals("2")){ %> selected="selected" <%} %>  >Branch Sent</option>
    <option value="4" <% if(caseCreation.getStatus().equals("4")){ %> selected="selected" <%} %>  >Wrong Request</option>
    <option value="7" <% if(caseCreation.getStatus().equals("7")){ %> selected="selected" <%} %> >Received at Vault</option>
     <option value="8" <% if(caseCreation.getStatus().equals("8")){ %> selected="selected" <%} %> >Permanent Retrieval</option>
     <option value="9" <% if(caseCreation.getStatus().equals("9")){ %> selected="selected" <%} %> >Temporary Retrieval</option>
    <%} %>
    </select> <html:errors property="caseCreationError"/>
   </td>
   
</tr>
<tr>
    <td class="fieldname">
    Case Creation Branch :
    </td><td colspan="3">
     <html:select property="branchCode" disabled="<%=isBRANCH %>" onchange="javascript:refreshCoordinatorDetail(this);" disabled="true">
    <html:options collection="branchList" labelProperty="label" property="value" />
    </html:select> <html:errors property="branchCodeError"/>
   </td>
   <html:hidden property="branchCode"/>
</tr>
<tr>
               <td class="fieldname"  >
               Co-Ordinator 1 Name
               </td>
               <td >
<!--               <integro:empty-if-null value="<%=coordinator1Name %>"/>-->
<html:text property="coordinator1Name" value="<%=coordinator1Name %>"  readonly="true"></html:text>
               &nbsp;
               </td>
              <td class="fieldname"  >
               Co-Ordinator 2 Name
               </td>
               <td >&nbsp;
<!--                <integro:empty-if-null value="<%=coordinator2Name %>"/>-->
<html:text property="coordinator2Name" value="<%=coordinator2Name %>"  readonly="true"></html:text>
               </td>
               
               </tr>  </tbody>
								</table>
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></br><html:errors property="caseCreationUpdateRemarksError"/></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=caseCreationUpdateTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=caseCreationUpdateTrx.getRemarks() != null
						? caseCreationUpdateTrx.getRemarks()
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
				onClick="approvePage()">
				<img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" />
				</a>&nbsp;
				  
				
				
				</td>
				<td colspan="2">
				<a
				href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)" onClick="cancelPage()" >
				<img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" />
				</a> &nbsp;
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
