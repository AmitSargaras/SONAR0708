<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                  com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.common.DeletedCheckListItemActionList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.ArrayList,java.util.HashMap,
                 java.util.Date,
                 com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	String list=(String)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.session.list");
	if(list==null)
		list="";
	String searchType=(String)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.session.searchType");
	if(searchType==null)
		searchType="";
	String search=(String)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.session.search");
	if(search==null)
		search="";
	
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.checkList");
  //  System.out.println("::::::::::::::checkList::::::::::::::::::"+checkList);
    ArrayList docIds = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.docNos");
    ArrayList deferCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.deferCreditApproverList");
    String limitId= (String)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.limitID");
	String limitName= (String)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.limitName");
    ArrayList waiverCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.waiverCreditApproverList");
    ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.allCreditApproverList");
    HashMap checkListIDMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.checkListIDMap");
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    ILimit[] limitList= limitProfile.getLimits();
    ILimit limit=null;
    if(limitId==null){
     limit = (ILimit) checkListIDMap.get(new Long(checkListTrxVal.getCheckList().getCheckListID()));
    }else{
    for(int ab=0;ab<limitList.length;ab++){
    	if(limitId.equals(String.valueOf(limitList[ab].getLimitID()))){
    		limit=limitList[ab];
    	}
    }
    }
    String docs[] = null;
    int length1=0 ;
    if(docIds!=null && docIds.size()>0){
    	docs = new String[docIds.size()];
    	for(int count = 0;count<docIds.size();count++){
    		docs[count] = (String)docIds.get(count);
    	}
    }
    if (docs!=null) {
    	for(int j=0;j<docs.length;j++){
     		length1 = docs.length;
    	}
    } else {
     	length1 = 0;
    }
     
    String remarks = "";
    String lastActionBy = "";
    if(checkList!=null) {
        pageContext.setAttribute("checkList",checkList);
    }
    ICheckListItem array[] = null;
    if(checkListTrxVal.getCheckList()==null){
        array = null;
    }else{
        array = checkListTrxVal.getCheckList().getCheckListItemList();
    }
	List res = CompareOBUtil.compOBArrayCheckList(checkList.getCheckListItemList(),array);

    ArrayList list2 = new ArrayList(res);
    pageContext.setAttribute("checkLists",list2);
    int row = 0;
    int itemIndex = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


    String cName = "";
    String entryEvent = request.getParameter("event");//+++
    if (entryEvent== null ) entryEvent ="";

    String secType = "";
    String secSubType = "";
    FacilityReceiptForm aForm = (FacilityReceiptForm)request.getAttribute("FacilityReceiptForm");
    
    if(cName.equals("")){
        cName = aForm.getLimitBkgLoc();
    }
    secType = aForm.getSecType();
    secSubType = aForm.getSecSubType();
    String secName = aForm.getSecName();
    SecurityTypeList secList = SecurityTypeList.getInstance();
    SecuritySubTypeList subList = SecuritySubTypeList.getInstance();
    secSubType = subList.getSecuritySubTypeValue(secSubType,null);

	//CR-380 starts
	//No mapper class could be created,So setting property manually
	if(checkList.getLegalFirm() != null && !checkList.getLegalFirm().equals("")){
//		aForm.setLegalFirm(checkList.getLegalFirm() );
	}
	//CR-380 ends

    ICheckListItem[] checkListItems = checkList.getCheckListItemList();
    String revRmkUpdUserInfo = "";
    String revRemarks = null;
    if (checkList != null)
    {
        revRemarks = checkList.getReversalRemarks();
        revRmkUpdUserInfo = checkList.getReversalRmkUpdatedUserInfo();
    }
    revRemarks = revRemarks==null?"-":revRemarks;



%>




<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.creditApproval.bus.ICreditApproval"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptForm"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
   //getlag();
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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function callSubmit(selObj,ind,shared,docNo) {
formObj = document.forms["FacilityReceiptForm"];
    temp = selObj.options[selObj.selectedIndex].value;

              
  <% int y = 0; %>
    var length = parseInt(<%=length1%>);
    
   var docNos = new Array(length);
    if(length>0 ){
    
  for(var p = 0; p<length ;p++){
  	<%if(docs!=null){%>
     docNos[p] =  "<%=docs[y]%>";
      <%y++;%>;
      <%}%>
    }
    }
    var found = false;
    for(var ct = 0;ct<length;ct++){
    	if(docNo==docNos[ct]){
    	found= true;
    	break;
   	}
    }
   
    if(temp=="") {
        return false;
    
   }else if (found == true && 
	      (selObj.options[selObj.selectedIndex].value == 'ALLOW_PERM_UPLIFT' ||
	       selObj.options[selObj.selectedIndex].value == 'DELETE')){
	       alert("The document must de-link linkage to Facility before deleting/perm-uplifting");
          
    }else if (shared == 'true' &&
              (selObj.options[selObj.selectedIndex].value == 'ALLOW_PERM_UPLIFT' ||
               selObj.options[selObj.selectedIndex].value == 'DELETE')) {
        alert("Action is not allowed as document is shared");
        
    }else if (selObj.options[selObj.selectedIndex].value == 'version') {
        if( confirm("Do you want to create version of this document ? ")){
       	 formObj.event.value = selObj.options[selObj.selectedIndex].value;
    		formObj.index.value = ind;
            formObj.actionTypeName.value = selObj.options[selObj.selectedIndex].value;
            if ((formObj.event.value == "CAVEAT_PRINT_REMINDER") ||
                (formObj.event.value == "VAL_PRINT_REMINDER")) {
                var obj = document.getElementById("<%= org.apache.struts.taglib.html.Constants.TOKEN_KEY %>");
                obj.value = "";
            }
    		formObj.submit();
           
       }else{
			// DO Nothing. 
           }
        
    }else if (selObj.options[selObj.selectedIndex].value == 'conform_inactive') {
        if( confirm("Do you want to make this document inactive ? ")){
          	 formObj.event.value = selObj.options[selObj.selectedIndex].value;
       		formObj.index.value = ind;
               formObj.actionTypeName.value = selObj.options[selObj.selectedIndex].value;
               if ((formObj.event.value == "CAVEAT_PRINT_REMINDER") ||
                   (formObj.event.value == "VAL_PRINT_REMINDER")) {
                   var obj = document.getElementById("<%= org.apache.struts.taglib.html.Constants.TOKEN_KEY %>");
                   obj.value = "";
               }
       		formObj.submit();
              
          }else{
   			// DO Nothing. 
       	   selObj.selectedIndex=0;
              }
           
       }else{
        formObj.event.value = selObj.options[selObj.selectedIndex].value;
		formObj.index.value = ind;
        formObj.actionTypeName.value = selObj.options[selObj.selectedIndex].value;
        if ((formObj.event.value == "CAVEAT_PRINT_REMINDER") ||
            (formObj.event.value == "VAL_PRINT_REMINDER")) {
            var obj = document.getElementById("<%= org.apache.struts.taglib.html.Constants.TOKEN_KEY %>");
            obj.value = "";
        }
		formObj.submit();
    } 


    }
    
/*function getlag(){
	var a = document.getElementsByName("lawFirmPanelFlag")[0].checked;
	var b = document.getElementsByName("lawFirmPanelFlag")[1].checked;
	if(a){
//  	alert("11");
	document.getElementById("select").style.display='block';
	document.getElementById("lawyer1").style.display='block';
	document.getElementById("lawyer2").style.display='none';
	document.getElementById("lawyer3").style.display='none';
	document.getElementById("text").style.display='none';
    document.forms[0].nonPanellawyerLegalFirm.value='';
    document.getElementById("legalFirmMandatoryID").style.visibility = "visible";
    document.getElementById("addressMandatoryID").style.visibility = "visible";
    setLawyerDisable(false);
	}else if(b){
//  	alert("22");
	document.getElementById("select").style.display='none';
	document.getElementById("lawyer1").style.display='none';
	document.getElementById("lawyer2").style.display='block';
	document.getElementById("lawyer3").style.display='none';
	document.getElementById("text").style.display='block';
    document.forms[0].panellawyerLegalFirm.value='';
    document.getElementById("legalFirmMandatoryID").style.visibility = "hidden";
    document.getElementById("addressMandatoryID").style.visibility = "hidden";
    setLawyerDisable(false);
	}else{
		document.getElementById("select").style.display='none';
		document.getElementById("text").style.display='block';
		document.forms[0].panellawyerLegalFirm.value='';
		document.forms[0].nonPanellawyerLegalFirm.value='';
		document.getElementById("lawyer1").style.display='none';
		document.getElementById("lawyer2").style.display='none';
		document.getElementById("lawyer3").style.display='block';
		document.getElementById("legalFirmMandatoryID").style.visibility = "hidden";
	    document.getElementById("addressMandatoryID").style.visibility = "hidden";
	    setLawyerDisable(true);
	}
}

function setLawyerDisable(isNA){
	if(isNA){
		setDisable("panellawyerLegalFirm",true);
	    setDisable("nonPanellawyerLegalFirm",true);
	    setDisable("lawyerReferenceNumber",true);
	    setDisable("lawyerInCharge",true);
	    setDisable("lawFirmAddress",true);
	    setDisable("lawFirmContactNumber",true);
	    setDisable("lawyerEmail",true);
	    setStrValue("lawyerReferenceNumber","");
	    setStrValue("lawyerInCharge","");
	    setStrValue("lawFirmAddress","");
	    setStrValue("lawFirmContactNumber","");
	    setStrValue("lawyerEmail","");
	}else{
		setDisable("panellawyerLegalFirm",false);
	    setDisable("nonPanellawyerLegalFirm",false);
	    setDisable("lawyerReferenceNumber",false);
	    setDisable("lawyerInCharge",false);
	    setDisable("lawFirmAddress",false);
	    setDisable("lawFirmContactNumber",false);
	    setDisable("lawyerEmail",false);
		
	}
}
*/
function setDisable(elementID,isDisable){
	document.getElementById(elementID).disabled = isDisable;
} 

function setStrValue(elementID,str){
	document.getElementById(elementID).value = str;
} 

function setVisibility(elementID1,elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
}

function undo(checkListItemRef) {
	formObj = document.forms["FacilityReceiptForm"];
    formObj.event.value = "undo";
	formObj.checkListItemRef.value = checkListItemRef;
	formObj.submit();
}

function submitForm(){

	formObj = document.forms["FacilityReceiptForm"];
    formObj.event.value = "submiting";
	formObj.submit();
}

function saveForm() {
	formObj = document.forms["FacilityReceiptForm"];
    formObj.event.value = "save";
	formObj.submit();
}

function refreshPage(index) {
    document.forms[0].event.value="maker_refresh_comment";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

function expressComplete() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";

    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'expressCheck') {
            var obj = formObj.elements[i];
            if ((obj.checked)) {           
                temp = temp + "," + obj.value;
            }
        }
    }

    if (temp == "") {
        alert('There is no record selected!');
        return false;
    }
    temp = temp.substring(1);
    formObj.event.value = "express_complete";
    formObj.expressCompletionIndex.value = temp;
    formObj.submit();

}
function searchDoc(){
	var list = document.getElementById("list").value;
	var searchType=document.getElementById("searchType").value;		
	var search=document.getElementById("criteria").value;		
	document.forms[0].action      	= "FacilityReceipt.do?list="+list+"&searchType="+searchType+"&search="+search;
 	document.forms[0].event.value 	= "search_facility_doc_checker_process";
 	document.forms[0].submit();
}

function checkForDate(){
	if(document.getElementById("searchType").value=="documentexpirydate"){
		document.getElementById("criteria").value='';
		document.getElementById("criteria").readOnly=true;
		document.getElementById("Image1a").style.display='';
	}
	else{
		document.getElementById("criteria").readOnly=false;
		document.getElementById("Image1a").style.display='none';
	}
}
//-->
</script>



<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="FacilityReceipt" >

<input type="hidden" name="event" />
<input type="hidden" name="commentIndexID"/>
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />
<input type="hidden" name="checkListItemRef" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />
<input type="hidden" name="expressCompletionIndex" />
<input type="hidden" name="actionTypeName" />

<html:hidden property="limitProfileID" />
<html:hidden property="checkListID" /> <!-- +++ -->
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName" />
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />
<input type="hidden" name="<%=org.apache.struts.taglib.html.Constants.TOKEN_KEY%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Update Facility Doc Receipt</h3>
</br></br>
      </td>
    </tr>
   
  </thead>
  <tbody>
    
    
    <tr>
      <td>
      <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >
		    <thead>
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Legal Firm Handling the Case</td>-->
<!--		    </tr>-->
		    </thead> <tbody>
<!--		    <tr class="even">-->
<!--		      <td class="fieldname">Panel Lawyer <font color="#0000FF" >*</font></td>-->
<!--		      <td width="763">-->
<!--		         <html:radio property="lawFirmPanelFlag"  name="FacilityReceiptForm" value="Y" onclick="getlag()" />Yes &nbsp;-->
<!--                 <html:radio property="lawFirmPanelFlag"  name="FacilityReceiptForm" value="N" onclick="getlag()" /> No &nbsp;-->
<!--				<html:radio property="lawFirmPanelFlag"  name="FacilityReceiptForm" value="-" onclick="getlag()" /> N/A-->
<!--                 <html:errors property="lawFirmPanelFlag" />-->
<!--              </td>-->
<!--		    </tr>-->
  <tr class="even">
  
                <td class="fieldname">Facility ID</td>
                <td><integro:empty-if-null value="<%=String.valueOf(limit.getLimitRef()) %>" /></td>
                <td class="fieldname">Checklist Id</td>
                <td><integro:empty-if-null value="<%= String.valueOf(checkListTrxVal.getCheckList().getCheckListID())%>"/>
                </td>
            </tr>
            <tr class="odd">
            <td class="fieldname">Facility Name</td>
                <td><integro:empty-if-null value="<%=limit.getFacilityName()%>"/></td>
                
                <td class="fieldname">Facility Type</td>
                <td valign="top" >&nbsp;<integro:empty-if-null value="<%=limit.getFacilityType()%>"/></td>
            </tr>
<html:hidden property="lawFirmPanelFlag"  name="FacilityReceiptForm" value="-" />
		    </tbody>
		  </table>
		 </td>
	  </tr>
	  <tr>
      <td>&nbsp; </td>
    </tr>

<!--    <tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" id="lawyer1" style="text-align:center">Panel Lawyer</td>-->
<!--		      <td colspan="2" class="fieldname" id="lawyer2" style="text-align:center">Non-Panel Lawyer</td>-->
<!--			  <td colspan="2" class="fieldname" id="lawyer3" style="text-align:center">Non Lawyer</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>-->
<!--		    <tr class="odd">-->
<!--		      <td width="20%" class="fieldname">Name of Legal Firm <font color="#0000FF" id="legalFirmMandatoryID">*</font></td>-->
<!--				<td width="80%"> -->
<!--				  <html:select property="panellawyerLegalFirm" styleId="select">-->
<!--	                <integro:common-code categoryCode="SOLICITOR" />-->
<!--			  	  </html:select>-->
<!--			  	  <html:text property="nonPanellawyerLegalFirm"  size="40" maxlength="40" styleId="text" />-->
<!--                  <html:errors property="lawyerLegalFirm" />-->
<!--                </td>-->
<!--		     </tr>-->
<!--		     <tr class="even">-->
<!--	            <td width="30%" class="fieldname">Lawyer Reference Number</td>-->
<!--	            <td><html:text property="lawyerReferenceNumber" size="60" maxlength="50"/></td>-->
<!--	          </tr>		-->
<!--            <tr class="odd">-->
<!--	            <td width="30%" class="fieldname">Person-In-Charge</td>-->
<!--	            <td><html:text property="lawyerInCharge"  size="40" maxlength="20"/></td>-->
<!--            </tr>		-->
<!--            <tr class="even"> -->
<!--				<td width="30%" class="fieldname">Address <font color="#0000FF" id="addressMandatoryID">*</font></td>-->
<!--				<td><html:textarea property="lawFirmAddress" rows="3" style="width:80%" /><html:errors property="lawFirmAddress" /></td>-->
<!--			</tr>	-->
<!--			<tr class="odd"> -->
<!--				<td width="30%" class="fieldname">Contact No</td>-->
<!--				<td><html:text property="lawFirmContactNumber" size="40" maxlength="20"/></td>-->
<!--			</tr>	-->
<!--            <tr class="even"> -->
<!--				<td width="30%" class="fieldname">Email</td>-->
<!--				<td><html:text property="lawyerEmail" size="40" maxlength="50"/></td>-->
<!--			</tr>			-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	</tr>-->
	
<!--	<tr>-->
<!--      <td>-->
<!--      <br>&nbsp;<br>-->
<!--      <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Valuer Firm Handling the Case</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>-->
<!--			    <tr class="even">-->
<!--			      <td class="fieldname">Panel Valuer <font color="#0000FF" >*</font></td>-->
<!--			      <td width="763">-->
<!--			         <html:radio property="valuerFirmPanelFlag"  name="FacilityReceiptForm" value="Y" onclick="getlag()" />Yes &nbsp;-->
<!--	                 <html:radio property="valuerFirmPanelFlag"  name="FacilityReceiptForm" value="N" onclick="getlag()" /> No &nbsp;-->
<!--					<html:radio property="valuerFirmPanelFlag"  name="FacilityReceiptForm" value="-" onclick="getlag()" /> N/A-->
<!--	                 <html:errors property="valuerFirmPanelFlag" />-->
<!--	              </td>-->
<!--			    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>-->
<html:hidden property="valuerFirmPanelFlag"  name="FacilityReceiptForm" value="-"  />
	  <tr>
	  	<td>&nbsp;</td>
	  </tr> 
	  
<!--	 <tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="6" class="fieldname" id="valuer1" style="text-align:center">Valuer Information</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>	-->
<!--			<tr class="odd">-->
<!--		      <td width="20%" class="fieldname">Name of Valuer Firm <font color="#0000FF" id="valuerFirmMandatoryID">*</font></td>-->
<!--				<td width="80%"> -->
<!--				  <html:select property="valuerFirm" styleId="select">-->
<!--	                <integro:common-code categoryCode="VALUER" />-->
<!--			  	  </html:select>-->
<!--			  	  <html:text property="nonPanelvaluerLegalFirm"  size="40" maxlength="40" styleId="text" />-->
<!--                  <html:errors property="valuerLegalFirm" />-->
<!--                </td>-->
<!--		     </tr>-->
<!--		     <tr class="even">-->
<!--	            <td width="30%" class="fieldname">Valuer Reference Number</td>-->
<!--	            <td><html:text property="valuerReferenceNumber" size="60" maxlength="50"/></td>-->
<!--	          </tr>		-->
<!--            <tr class="odd">-->
<!--	            <td width="30%" class="fieldname">Person-In-Charge</td>-->
<!--	            <td><html:text property="valuerInCharge"  size="40" maxlength="20"/></td>-->
<!--            </tr>		-->
<!--            <tr class="even"> -->
<!--				<td width="30%" class="fieldname">Address <font color="#0000FF" id="valuerAddressMandatoryID">*</font></td>-->
<!--				<td><html:textarea property="valuerFirmAddress" rows="3" style="width:80%" /><html:errors property="valuerFirmAddress" /></td>-->
<!--			</tr>	-->
<!--			<tr class="odd"> -->
<!--				<td width="30%" class="fieldname">Contact No</td>-->
<!--				<td><html:text property="valuerFirmContactNumber" size="40" maxlength="20"/></td>-->
<!--			</tr>	-->
<!--            <tr class="even"> -->
<!--				<td width="30%" class="fieldname">Email</td>-->
<!--				<td><html:text property="valuerEmail" size="40" maxlength="50"/></td>-->
<!--			</tr>			-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	</tr>-->
	
<!--		<tr>-->
<!--      <td>-->
<!--      <br>&nbsp;<br>-->
<!--      <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Insurer Firm Handling the Case</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>-->
<!--			    <tr class="even">-->
<!--			      <td class="fieldname">Panel Insurer <font color="#0000FF" >*</font></td>-->
<!--			      <td width="763">-->
<!--			         <html:radio property="insurerFirmPanelFlag"  name="FacilityReceiptForm" value="Y" onclick="getlag()" />Yes &nbsp;-->
<!--	                 <html:radio property="insurerFirmPanelFlag"  name="FacilityReceiptForm" value="N" onclick="getlag()" /> No &nbsp;-->
<!--					<html:radio property="insurerFirmPanelFlag"  name="FacilityReceiptForm" value="-" onclick="getlag()" /> N/A-->
<!--	                 <html:errors property="insurerFirmPanelFlag" />-->
<!--	              </td>-->
<!--			    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>-->
<html:hidden property="insurerFirmPanelFlag"  name="FacilityReceiptForm" value="-" />
	  <tr>
	  	<td>&nbsp;</td>
	  </tr> 
<!--	<tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="6" class="fieldname" id="valuer1" style="text-align:center">Insurer Information</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>	-->
<!--				<tr class="odd">-->
<!--			      <td width="20%" class="fieldname">Name of Insurer Firm <font color="#0000FF" id="insurerFirmMandatoryID">*</font></td>-->
<!--					<td width="80%"> -->
<!--					  <html:select property="insurerFirm" styleId="select">-->
<!--		                <integro:common-code categoryCode="INSURER_NAME" />-->
<!--				  	  </html:select>-->
<!--				  	  <html:text property="nonPanelinsurerLegalFirm"  size="40" maxlength="40" styleId="text" />-->
<!--	                  <html:errors property="insurerLegalFirm" />-->
<!--	                </td>-->
<!--			     </tr>-->
<!--			     <tr class="even">-->
<!--		            <td width="30%" class="fieldname">Insurer Reference Number</td>-->
<!--		            <td><html:text property="insurerReferenceNumber" size="60" maxlength="50"/></td>-->
<!--		          </tr>		-->
<!--	            <tr class="odd">-->
<!--		            <td width="30%" class="fieldname">Person-In-Charge</td>-->
<!--		            <td><html:text property="insurerInCharge"  size="40" maxlength="20"/></td>-->
<!--	            </tr>		-->
<!--	            <tr class="even"> -->
<!--					<td width="30%" class="fieldname">Address <font color="#0000FF" id="insurerAddressMandatoryID">*</font></td>-->
<!--					<td><html:textarea property="insurerFirmAddress" rows="3" style="width:80%" /><html:errors property="insurerFirmAddress" /></td>-->
<!--				</tr>	-->
<!--				<tr class="odd"> -->
<!--					<td width="30%" class="fieldname">Contact No</td>-->
<!--					<td><html:text property="insurerFirmContactNumber" size="40" maxlength="20"/></td>-->
<!--				</tr>	-->
<!--	            <tr class="even"> -->
<!--					<td width="30%" class="fieldname">Email</td>-->
<!--					<td><html:text property="insurerEmail" size="40" maxlength="50"/></td>-->
<!--				</tr>		-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	</tr>-->
    <%
        //String applicationType = checkList.getApplicationType();
   // DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + applicationType);
        String expressProcessAppTypeList = PropertyManager.getValue("chklist.expressprocessing.applicationtype");
        boolean expressProcess = false;
        //DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + expressProcessAppTypeList);
       // if (expressProcessAppTypeList!=null ) {
          //  expressProcess = true;    

    %>
<!--    <tr>-->
<!--      <td valign="bottom">-->
<!--          <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0">-->
<!--          <tr>-->
<!--            <td>&nbsp; </td>-->
<!--          </tr>-->
<!--          <tr>-->
<!--              <td width="98%" valign="baseline" align="right">-->
<!--                <input type="button" name="Submit" value="Complete" class="btnNormal" onclick="expressComplete()"/>-->
<!--              </td>-->
<!--          </tr>-->
<!--          </table>-->
<!--      </td>-->
<!--    </tr>-->
    <%
      //  }
    %>
    <tr>
    <td>&nbsp;&nbsp;
    <label ><b>List By :</b></label>&nbsp;
   <select id="list">
    <%if(list.equals("")) {%>
    <option value="" selected="selected">Please Select</option>
    <%}else{ %>
    <option value="">Please Select</option>
     <%}if(list.equals("ACTIVE")){ %>
    <option value="ACTIVE" selected="selected">Active</option>
    <%}else{ %>
    <option value="ACTIVE">Active</option>
    <%}if(list.equals("AWAITING")){ %>
    <option value="AWAITING" selected="selected">Pending</option>
    <%}else{ %>
    <option value="AWAITING">Pending</option>
    <%}if(list.equals("RECEIVED")){  %>
    <option value="RECEIVED" selected="selected">Received</option>
    <%}else{ %>
    <option value="RECEIVED">Received</option>
    <%}if(list.equals("DEFERRED")){ %>
    <option value="DEFERRED" selected="selected">Deferred</option>
    <%}else{ %>
    <option value="DEFERRED">Deferred</option>
    <%}if(list.equals("WAIVED")){ %>
    <option value="WAIVED" selected="selected">Waived</option>
    <%}else{ %>
    <option value="WAIVED">Waived</option>
    <%}if(list.equals("INACTIVE")){ %>
    <option value="INACTIVE" selected="selected">Inactive</option>
    <%}else{ %>
    <option value="INACTIVE">Inactive</option>
    <%} %>
   
    </select>&nbsp;&nbsp;
    <label><b>Search By :</b></label>&nbsp;
     <select name="searchType" id="searchType" onChange="return checkForDate();" >
			      		<option value="">Please Select</option>
			      		<option value="documentdescription" <% if (searchType.equalsIgnoreCase("documentdescription")){ %> selected="selected" <% } %>>Document Description</option>
			      		<option value="documentexpirydate" <% if (searchType.equalsIgnoreCase("documentexpirydate")){ %> selected="selected" <% } %>>Document Expiry Date</option>
			      	  </select>
     <input type="text" name="criteria" id="criteria" <%if(!searchType.equalsIgnoreCase("")) { %> value="<%=search%>" <% } else { %>  readonly="readonly" <% } %> >
     
      	<img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" <%if(!searchType.equalsIgnoreCase("documentexpirydate")) { %>style="display: none;" <% } %>onclick="return showCalendar('criteria', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" />
     <a onclick="searchDoc()"  >
                                <img align="middle" src="img/search1a.gif" name="Image1" border="0" id="Image1"/></a>
    </td>
    </tr>
    <tr>
      <td>&nbsp; </td>
    </tr>
      <td>  <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
                       <tr>
            	<td width="2%">S/N</td>
            	<td width="2%">C</td>
            	<td width="2%">M</td>
            	<!-- td width="8%">DocCode</td -->
<!--            	<td width="4%">Doc No</td>-->
            	<td>Description</td>
            	<td width="2%">Version</td>
            	<td width="2%">Active</td>
<!--            	<td width="4%">Pre-Approval Document</td>-->
<!--                <td width="5%">To Vault</td>-->
            	<td width="2%">Doc Status</td>
            	<td width="6%">Original Target Date</td>
<!--                <td width="6%">Txn Date</td>-->
				<td width="6%">Next Due Date</td>
                <td width="6%">Doc Date</td>
                <td width="6%">Doc Expiry Date</td>
<!--                <td width="8%">Action Party</td>-->
<!--				<td width="8%">Cust Status</td>-->
<!--                <td width="8%">Cust Txn Date</td>-->
                 <!-- td width="8%">Credit Approver</td-->
                <td width="8%">Doc Amount</td>
                <td width="8%">HDFC Amount</td>
                <td width="8%">Currency</td>
	            <td width="10%">Action</td>
                <% if(expressProcess) { %> <td width="10%">Select</td> <% } %>
 <%--
              <td width="2%">S/N</td>
              <td width="4%">Mandatory</td>
              <td width="4%">Master Doc Code (Doc No)</td>
              <td width="4%">Doc Code<br>(Doc No)</td>
              <td>Description</td>
              <td width="6%">SCC Issued</td>
              <td width="5%">In Vault</td>
              <td width="5%">Ext Cust</td>
              <td width="5%">Audit</td>
              <td width="8%">Doc Status</td>
              <td width="6%">CPC Txn Date</td>
              <td width="6%">Cust Status</td>
               <td width="6%">Cust Txn Date</td>
              <td width="6%">Identify Status</td>
              <td width="5%">Shared</td>
              <td width="5%">App-roved</td>
              <td width="8%">Action Party</td>
              <td width="10%">Action</td>
              <td width="5%">Undo</td>
--%>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkLists"  >
		   <logic:iterate id="compResult" name="checkLists"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
   <%
		itemIndex++;
   ICheckListItem OB = (ICheckListItem) compResult.getObj();
		pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
   %>
<logic:equal name="toDisplayCheckListItem" value="true">
		<%
            String rowClass = "";
            row++;
            if (row % 2 != 0) {
                rowClass = "odd";
            } else {
                rowClass = "even";
            }
            boolean inherited = false;
            boolean mandatory = false;
            boolean mandatoryDisplay = false;
            boolean inVault = false;
            boolean extCustodian = false;
            boolean audit = false;
            boolean approved = false;
            boolean shared = false;
            if (OB.getIsInherited()) {
                inherited = true;
            }
            if (OB.getIsMandatoryInd()) {
                mandatory = true;
            }
            if (OB.getIsMandatoryDisplayInd()) {
                mandatoryDisplay = true;
            }
            if (OB.getIsInVaultInd()) {
                inVault = true;
            }
            if (OB.getIsExtCustInd()) {
                extCustodian = true;
            }
            if (OB.getIsAuditInd()) {
                audit = true;
            }
            if (OB.getIsApprovedInd()) {
                approved = true;
            }
            if (OB.getShared()) {
                shared = true;
            }
            ArrayList a1 = null;
            ArrayList a2 = null;
            if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus())) {
                DeletedCheckListItemActionList delActList = DeletedCheckListItemActionList.getInstance(OB);
                a1 = new ArrayList(delActList.getOperationLabels());
                a2 = new ArrayList(delActList.getOperationValues());
            } else {
                CheckListItemActionList actList = CheckListItemActionList.getInstance(secType, aForm.getSecSubType(), OB);
                a1 = new ArrayList(actList.getOperationLabels());
                a2 = new ArrayList(actList.getOperationValues());
            }
            if (a1 != null)
                pageContext.setAttribute("actionLabels", a1);
            if (a2 != null)
                pageContext.setAttribute("actionValues", a2);


            long docNoLong = OB.getCheckListItemRef();
            String docNo = String.valueOf(docNoLong);
            docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

            long parentDocNoLong = OB.getParentCheckListItemRef();
            String parentDocNo = String.valueOf(parentDocNoLong);
            parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

            //if current checklist item is linked (i.e. has a parent), get the master doc code
            String parentDocCode = "&nbsp;";
            if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
                ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
                parentDocCode = parentCheckListItem.getItem().getItemCode();
            }

            //String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);

            IShareDoc[] shareCheckList = OB.getShareCheckList();
            String isShared = "N";
            boolean isShareDocViewable = false;
            if (shareCheckList != null && shareCheckList.length > 0) {
                if (OB.getViewable()) {
                    isShareDocViewable = true;
                }
                isShared = "Y";
            }

			    //String ccStatus = OB.getCPCCustodianStatus();
				//if(ccStatus == null)
				//	ccStatus="";
            //kc chin 26 aug 2010 ABCMS-955, Synchonize the rules to display CPCcustodianStatus with the view all document page
            String ccStatus = OB.getCPCCustodianStatus() == null ? "" : (OB.getCPCCustodianStatus().equals(ICMSConstant.STATE_RECEIVED) ? ICMSConstant.STATE_AWAITING : OB.getCPCCustodianStatus());


        %>
			<tr class="<%=rowClass%>">
              <td class='<bean:write name="compResult" property="key" />' ><%=row%></td>
              <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled="true" />
            <%}%></td>
             <td style="text-align:center">&nbsp;
            <%if(mandatoryDisplay && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check12" value="<%=row-1%>" <%if(mandatoryDisplay){%> checked <%} %> disabled="true" />
            <%}%></td>
<%--              
              <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>
			  <!--              <td ><%=docNo%></td>-->
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
<!--              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>-->
<!--              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />-->
<%--
              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled="true" /></td>
--%>
              <td>&nbsp; V-<%=OB.getDocumentVersion() %></td>
			 <td>&nbsp; 
			 <%if(OB.getDocumentStatus()!=null){
				 if(OB.getDocumentStatus().equals("ACTIVE")){
				 %>
			 Y
			 <%}if(OB.getDocumentStatus().equals("PENDING_INACTIVE")
					 ||OB.getDocumentStatus().equals("INACTIVE")){ %>
			 N
			 <%}}else{ %>
			 -
			 <%} %>
			 </td>
			 <%String docStatus=OB.getItemStatus();
			 
			 if(docStatus.equalsIgnoreCase("AWAITING"))
				 docStatus="PENDING";
			 if(OB.getDocumentStatus().equals("PENDING_INACTIVE"))
				 docStatus="PENDING INACTIVE";
			 if(docStatus.equalsIgnoreCase("UPDATE_RECEIVED"))
				 docStatus="PENDING_RECEIVED";
			 
			 if(docStatus.equals("UPDATE_DISCREPANCY"))
				 docStatus="PENDING_DISCREPANCY";
			 %>
             <td>&nbsp;<%= docStatus%></td>
             <td>
				<%if(OB.getOriginalTargetDate()!=null){%>
				<integro:date object="<%=OB.getOriginalTargetDate()%>" />
				<%} else {%> <center>-</center> <%}%>
              </td>
              <td>
				<%if(OB.getExpectedReturnDate()!=null){%>
				<integro:date object="<%=OB.getExpectedReturnDate()%>" />
				<%} else {%> <center>-</center> <%}%>
              </td>
              
              <td>
				<%if(OB.getDocDate()!=null){%>
				<integro:date object="<%=OB.getDocDate()%>" />
				<%} else {%> <center>-</center> <%}%>
              </td>
             <td height="18" >
             	<% if(null !=OB.getExpiryDate() && ! "".equals(OB.getExpiryDate())){%> <%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%> <% } else { %> &nbsp; - &nbsp; <% } %>
             	</td>

<!--			 <td>&nbsp;<center><integro:empty-if-null value="<%=ccStatus%>"/></center></td>-->
            
				<td width="8%"><% if(null !=OB.getDocAmt() && ! "".equals(OB.getDocAmt())){%> <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(OB.getDocAmt()))%>" />
              
              <% } else { %> &nbsp; - &nbsp; <% } %></td>
                <td width="8%"><% if(null !=OB.getHdfcAmt()  && ! "".equals(OB.getHdfcAmt())){%>
                
                <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(OB.getHdfcAmt()))%>" />
               <% } else { %>&nbsp; - &nbsp;<% } %></td>
                <td width="8%"><% if(null !=OB.getCurrency() && ! "".equals(OB.getCurrency())){%> <%=OB.getCurrency()%> <% } else { %>&nbsp; - &nbsp;<% } %></td>
<!--			 <td>&nbsp;<center><integro:empty-if-null value="<%=ccStatus%>"/></center></td>-->
             

<%--
            <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=custDocStatus%>"/></td>
--%>

<%--
              <td style="text-align:center">&nbsp;
              <%if(OB.getIdentifyDate() != null) {%>
              Y
              <%}else{%>
              N
              <%}%></td>
--%>
<%--Start for  cr-17              
               <td style="text-align:center">&nbsp; <%if(shared) out.println("Y"); else out.print("N");%></td>
<%--End for  cr-17              
              <td style="text-align:center">&nbsp;<%if(approved) out.println("Y"); else out.print("N");%></td>
--%>              
             <td>
              <% String tempScr = "callSubmit(this,'"+(itemIndex-1)+"', '"+shared+"','"+docNo+"')"; %>
                  <html:select property="actionType" onchange='<%=tempScr%>' >
                	<option value="" >Please Select </option>
                	<%if(!OB.getItemStatus().equalsIgnoreCase("PENDING_VERSION")){ %>
                	<option value="view_image_page_to_do_process" >VIEW IMAGES</option>
                	<%} %>
<%-- show view only for share doc                    --%>
                  <%  if (isShareDocViewable){   %>
                      <option value="<%=ICMSConstant.STATE_ITEM_VIEW_COMPLETED%>"><%=ICMSConstant.ACTION_ITEM_VIEW %></option>
                  <% } %>
				<% if(OB.getDocumentStatus().equals("ACTIVE")){
				if(OB.getItemStatus().equalsIgnoreCase("AWAITING")){%>
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="RECEIVE" >RECEIVE</option>
				<option value="UPDATE" >UPDATE</option>
				<option value="DEFER" >DEFER</option>
				<option value="DISCREPANCY" >DISCREPANCY</option>
				<%if(!OB.getIsMandatoryDisplayInd()|| !OB.getIsMandatoryInd()){ %>
				<option value="WAIVER" >WAIVE</option>
				<%} %>				
				<option value="conform_inactive" >INACTIVE</option>
				<option value="version" >VERSION</option>
				<%}if(OB.getItemStatus().equalsIgnoreCase("RECEIVED")){%>
				<option value="VIEW_AWAITING" >VIEW</option>				
				<option value="RECEIVE" >UPDATE</option>
				<option value="conform_inactive" >INACTIVE</option>
				<option value="version" >VERSION</option>
				<%}if(OB.getItemStatus().equalsIgnoreCase("DEFERRED")){%>
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="RECEIVE" >RECEIVE</option>				
				<option value="DEFER" >DEFER</option>
				<%if(!OB.getIsMandatoryDisplayInd()|| !OB.getIsMandatoryInd()){ %>
				<option value="WAIVER" >WAIVE</option>
				<%} %>
				<option value="conform_inactive" >INACTIVE</option>
				<option value="version" >VERSION</option>
				<%}if(OB.getItemStatus().equalsIgnoreCase("WAIVED")){%>
				<option value="VIEW_AWAITING" >VIEW</option>	
				<option value="conform_inactive" >INACTIVE</option>			
				<option value="version" >VERSION</option>	
				<%}if(OB.getItemStatus().equalsIgnoreCase("PENDING_UPDATE")){%>		
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="UPDATE" >UPDATE</option>
			
				<%}if(OB.getItemStatus().equalsIgnoreCase("PENDING_RECEIVED")||OB.getItemStatus().equals("UPDATE_RECEIVED")){%>
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="RECEIVE" >UPDATE</option>
					
				<%}if(OB.getItemStatus().equalsIgnoreCase("PENDING_DEFER")){%>	
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="DEFER" >UPDATE</option>
				
				<%}if(OB.getItemStatus().equalsIgnoreCase("PENDING_WAIVER")){%>
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="WAIVER" >UPDATE</option>
				<%}if(OB.getItemStatus().equalsIgnoreCase("PENDING_VERSION")){%>
				<option value="VIEW_AWAITING" >VIEW</option>
				<%} if(OB.getItemStatus().equalsIgnoreCase("PENDING_DISCREPANCY") || OB.getItemStatus().equals("UPDATE_DISCREPANCY")){%>	
				<option value="VIEW_AWAITING" >VIEW</option>
				<option value="DISCREPANCY" >UPDATE</option>
					<%} if(OB.getItemStatus().equalsIgnoreCase("DISCREPANCY")){%>
					<option value="VIEW_AWAITING" >VIEW</option>
					<option value="RECEIVE" >RECEIVE</option>
					<option value="DISCREPANCY" >UPDATE</option>
					<option value="DEFER" >DEFER</option>
					
					<%if(!OB.getIsMandatoryDisplayInd()|| !OB.getIsMandatoryInd()){ %>
					<option value="WAIVER" >WAIVE</option>
					<%} %>				
					<option value="conform_inactive" >INACTIVE</option>
					<option value="version" >VERSION</option>
					<%}} %>
				<%if(OB.getDocumentStatus().equals("INACTIVE")){ %>
				<option value="VIEW_AWAITING" >VIEW</option>			
				<option value="version" >VERSION</option>
				<%} %>
				<%if(OB.getDocumentStatus().equals("PENDING_INACTIVE")){ %>
				<option value="VIEW_AWAITING" >VIEW</option>
				<%if(checkListTrxVal.getStatus().equalsIgnoreCase("DRAFT")){ %>
				<option value="version" >VERSION</option>					
				<%}} %>
				


				
                  </html:select>
              </td>
<%-- 
              <td style="text-align:center">
              <%  if (!isShareDocViewable){   %>
              <input type="button" name="Submit" value="Undo" onclick="undo('<%=OB.getCheckListItemRef()%>')" class="btnNormal"/>
              <%} %>&nbsp;
              </td>
--%>
                <% if(expressProcess) {
                        if((ICMSConstant.STATE_AWAITING.equals(OB.getItemStatus())
                        || ICMSConstant.STATE_RECEIVED.equals(OB.getItemStatus())
                        || ICMSConstant.STATE_ITEM_RENEWED.equals(OB.getItemStatus()))) { %>
                <td style="text-align:center">
                        <input type="checkbox" name="expressCheck" value="<%=itemIndex-1%>"/>
                </td>
                    <% } else { %>
                <td>&nbsp;</td>
              <% } }%>
            </tr>

</logic:equal>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="15">There are no facilities linked</td>
            </tr>
<% }%>

          </tbody>
        </table></td>
  </tbody>
</table>
<%-- For CR CMS-380 Starts  
<p>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
    <thead>
    <tr>
      <td colspan="2">
        <div align="left">Legal Firm Handling the Case</div>
      </td>
    </tr>
    </thead> <tbody>
    <tr class="even">
      <td class="fieldname">Name of Legal Firm</td>
      <td width="763">
        <html:select property="legalFirm">
         <option value="" >Please Select</option>
		  <html:options name="legalFirmValues" labelName="legalFirmLabels"/>
        </html:select>
      </td>
    </tr>
    </tbody>
  </table>

<p/>
<p/>
<p/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
<%if(ICMSConstant.STATE_REJECTED.equals(status) || ICMSConstant.STATE_OFFICER_REJECTED.equals(status) || ICMSConstant.STATE_DRAFT.equals(status)) { %>
	<tr>
	  <td class="fieldname">Remarks</td>
	  <td class="odd"><textarea name="remarks" rows="4" cols="100"></textarea></td>
	</tr>
	<tr>
	  <td class="fieldname">Last Action By</td>
	  <td class="even">&nbsp;<%=lastActionBy%></td>
	</tr>
	<tr class="odd">
	  <td class="fieldname">Last Remarks Made</td>
	  <td><integro:htmltext value="<%=remarks%>" lineLength="100"/>&nbsp;</td>
	</tr>
<% } %>
    <tr class="even">
      <td class="fieldname">Last Reversal Remarks</td>
      <td><integro:htmltext value="<%=revRemarks%>" lineLength="100"/>&nbsp;</td>
    </tr>
    <tr class="odd">
      <td class="fieldname">Reversal Remarks Updated By</td>
      <td ><%if (revRmkUpdUserInfo != null && !revRmkUpdUserInfo.equals("")){%>
         <%=revRmkUpdUserInfo%>&nbsp;
         <%}else{%>
         -
         <%}%></td>
    </tr>
  </tbody>
</table>
<!-- Begin OFFICE HISTORY -->
  <% if (1==1) { %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td width="77%">
      <h3>History of Comments</h3>
    </td>
   </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="5%">S/N</td>
          <td width="19%"> Date/Time</td>
          <td width="22%">Made By</td>
          <td width="54%">Comments</td>
        </tr>
        </thead>
        <tbody>
        <%
            OBCMSTrxHistoryLog[] commentList = (OBCMSTrxHistoryLog[]) checkListTrxVal.getTransactionHistoryCollection().toArray(new OBCMSTrxHistoryLog[0]);
            if (commentList == null || commentList.length == 0) {
        %>
        <tr class="odd"><td colspan="4">There is no comment.</td></tr>
        <%
            } else {
                for (int i = 0; i < commentList.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" width="5%"><%=i + 1%></td>
          <td style="text-align:center" width="19%"><integro:empty-if-null value="<%=commentList[i].getLogDate()%>"/>&nbsp;</td>
          <td width="22%"><integro:empty-if-null value="<%=commentList[i].getLogUserName()%>"/>&nbsp;
          (<integro:empty-if-null value="<%=commentList[i].getLogGroupName()%>"/>)
          </td>
          <%
                    String commentStr = commentList[i].getRemarks();
                    if (commentStr != null && commentStr.length() > 65) {
                        commentStr = commentStr.substring(0,65)+"  ...";
                    }
          %>
          <td  width="54%">
          <% if (commentStr != null && commentStr.length() > 0) { %>
            <a href="#" onclick="refreshPage(<%=i%>)"><integro:empty-if-null value="<%=commentStr%>"/></a>
          <% }
          	 else if (commentStr==null || (commentStr!=null && commentStr.equals("")))
          	 {
          %>
          	 	-
          <% }
          %>
          </td>
        </tr>
        <%
                }
            }
        %>
        <tr class="odd">
          <td class="Total" style="text-align:center" width="5%">&nbsp;</td>
          <td width="19%" class="Total">&nbsp;</td>
          <td width="22%" class="Total">&nbsp;</td>
          <td width="54%" class="Total" style="text-align:right">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  <thead>
  </thead> <tbody>
  </tbody>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tr>
    <td width="77%">
      <h3>Comments Selected</h3>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <tr class="odd">
      <%
          String indexID = request.getParameter("commentIndexID");
          if (indexID == null || indexID.trim().length() == 0) {
      %>
      <td colspan="2">There is no comment selected.</td>
      <%
          } else {
              OBCMSTrxHistoryLog historylog = commentList[Integer.parseInt(indexID)];
      %>
          <td class="fieldname" width="11%">
            <integro:empty-if-null value="<%=historylog.getLogUserName()%>"/>&nbsp;
            (<integro:empty-if-null value="<%=historylog.getLogGroupName()%>"/>)
          </td>
          <td width="89%"><integro:wrapper value="<%=historylog.getRemarks()%>"/>&nbsp;
          </td>
        <%
          }
        %>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p>
<p>
<% } %>
--%>

<%if (ICMSConstant.STATE_REJECTED.equals(status)) { %>
    <p/><p/> <p/>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
            <tr>
                <td class="fieldname">Remarks</td>
                <td class="odd"><textarea name="remarks" rows="4" cols="100" onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
            </tr>
            <tr>
                <td class="fieldname">Last Action By</td>
                <td class="even">&nbsp;<%=lastActionBy%></td>
            </tr>
            <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
            </tr>
        </tbody>
    </table>
<% } %>

<br></br>
 <jsp:include page="view_audit_details.jsp"></jsp:include>
			
<!-- End OFFICE HISTORY -->
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
  
  <tr>
    <td><a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image12" width="75" height="22" border="0" id="Image12" /></a></td>
    <%if(!ICMSConstant.STATE_DRAFT.equals(status)){ %>   
<td><a href="#" onClick="saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2"  border="0" id="Image2" /></a></td>
<%} %>
     <%if (ICMSConstant.STATE_REJECTED.equals(status) || ICMSConstant.STATE_DRAFT.equals(status)) { %>
            <td width="100" valign="baseline" align="center">
                <a href="ToDo.do" onmouseout="MM_swapImgRestore()"  onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif"  name="Image1" border="0" id="Image1"/></a>
            </td>
        <%} else {%>
            &nbsp;
        <%}%>

  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>