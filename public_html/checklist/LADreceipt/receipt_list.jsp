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
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.checkList");
    ArrayList docIds = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.docNos");
    ArrayList deferCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.deferCreditApproverList");
    String event=(String)request.getAttribute("event");
    ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.allCreditApproverList");
	String isOperationAllowed=(String)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.isOperationAllowed");
    
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
    LADReceiptForm aForm = (LADReceiptForm)request.getAttribute("LADReceiptForm");
    
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

    //System.out.println("::::::::::::::::22222233333322222$$$$$$$$$$$$$$$$$$$$$$:::::::::::::");

%>




<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.creditApproval.bus.ICreditApproval"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
  // getlag();
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
function view(itemRef) {
    formObj = document.forms["LADReceiptForm"];
    formObj.event.value="view_image_page";
    formObj.itemRef.value = itemRef;
    formObj.submit();
}
function callSubmit(selObj,ind,shared,docNo) {
formObj = document.forms["LADReceiptForm"];
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
	       alert("The document must de-link linkage to LAD before deleting/perm-uplifting");
          
    }else if (shared == 'true' &&
              (selObj.options[selObj.selectedIndex].value == 'ALLOW_PERM_UPLIFT' ||
               selObj.options[selObj.selectedIndex].value == 'DELETE')) {
        alert("Action is not allowed as document is shared");
        
    }else{
        formObj.event.value = selObj.options[selObj.selectedIndex].value;
      //  alert(selObj.options[selObj.selectedIndex].value);
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
    
function callSubmit2(ind,docNo) {
	formObj = document.forms["LADReceiptForm"];
	  
	 formObj.event.value="view_image_page";
	      //  alert(selObj.options[selObj.selectedIndex].value);
			formObj.index.value = ind;
	      			formObj.submit();
	  	    }

function callSubmit1(ind,docNo) {
	formObj = document.forms["LADReceiptForm"];
	  
	 formObj.event.value="view_process_image_page";
	      //  alert(selObj.options[selObj.selectedIndex].value);
			formObj.index.value = ind;
	      			formObj.submit();
	  	    }

function callSubmit3(ind,docNo) {
	formObj = document.forms["LADReceiptForm"];
	  
	 formObj.event.value="process_draft_view_image";
	      //  alert(selObj.options[selObj.selectedIndex].value);
			formObj.index.value = ind;
	      			formObj.submit();
	  	    }
	    
function setDisable(elementID,isDisable){
	document.getElementById(elementID).disabled = isDisable;
} 
function generateLAD() {

 	document.forms[0].action="GenerateLAD.do?event=generate_lad";
    document.forms[0].submit();
}
function setStrValue(elementID,str){
	document.getElementById(elementID).value = str;
} 

function setVisibility(elementID1,elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
}

function undo(checkListItemRef) {
	formObj = document.forms["LADReceiptForm"];
    formObj.event.value = "undo";
	formObj.checkListItemRef.value = checkListItemRef;
	formObj.submit();
}

function submitForm(){

	formObj = document.forms["LADReceiptForm"];
    formObj.event.value = "submit";
	formObj.submit();
}

function saveForm() {
	formObj = document.forms["LADReceiptForm"];
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
function viewRec(ind) {
	 formObj = document.forms["LADReceiptForm"];
	    formObj.event.value="VIEW_RECEIVED";
	    formObj.index.value = ind;
	    formObj.submit();
}

//-->
</script>



<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="LADReceipt" >

<input type="hidden" name="event" />
<input type="hidden" name="commentIndexID"/>
<%-- for check boxes--%>
<input type="hidden" name="itemRef" />
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
      <td> <h3>Update LAD Doc Receipt</h3>

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
		    </br>
		    </br>
		     <tr class="odd">
                <td class="fieldname">Checklist Id</td>
                <td><%= checkList.getCheckListID()%>
                </td>
                </tr>
<tr class="even">
  
                <td class="fieldname">Checklist Type</td>
                <td>
                LAD</td>
               
            </tr>
           <tr class="odd">
                <td class="fieldname">Checklist Status</td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) == null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
            </tr>
<html:hidden property="lawFirmPanelFlag"  name="LADReceiptForm" value="-" />
		    </tbody>
		  </table>
		 </td>
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
<!--			         <html:radio property="valuerFirmPanelFlag"  name="LADReceiptForm" value="Y" onclick="getlag()" />Yes &nbsp;-->
<!--	                 <html:radio property="valuerFirmPanelFlag"  name="LADReceiptForm" value="N" onclick="getlag()" /> No &nbsp;-->
<!--					<html:radio property="valuerFirmPanelFlag"  name="LADReceiptForm" value="-" onclick="getlag()" /> N/A-->
<!--	                 <html:errors property="valuerFirmPanelFlag" />-->
<!--	              </td>-->
<!--			    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>-->
<html:hidden property="valuerFirmPanelFlag"  name="LADReceiptForm" value="-"  />
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
<!--			         <html:radio property="insurerFirmPanelFlag"  name="LADReceiptForm" value="Y" onclick="getlag()" />Yes &nbsp;-->
<!--	                 <html:radio property="insurerFirmPanelFlag"  name="LADReceiptForm" value="N" onclick="getlag()" /> No &nbsp;-->
<!--					<html:radio property="insurerFirmPanelFlag"  name="LADReceiptForm" value="-" onclick="getlag()" /> N/A-->
<!--	                 <html:errors property="insurerFirmPanelFlag" />-->
<!--	              </td>-->
<!--			    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>-->
<html:hidden property="insurerFirmPanelFlag"  name="LADReceiptForm" value="-" />
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
     //   String applicationType = checkList.getApplicationType();
  // DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + applicationType);
   //     String expressProcessAppTypeList = PropertyManager.getValue("chklist.expressprocessing.applicationtype");
   //     boolean expressProcess = false;
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
      <td>&nbsp; </td>
    </tr>
    <%if(!"REJECTED".equals(checkListTrxVal.getStatus()) && !"DRAFT".equals(checkListTrxVal.getStatus())){ %>
    <tr>
    <td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Generate LAD" class="btnNormal" onclick="generateLAD()"/>
										</br></br></td>
    
    </tr>
    <%} %>
    <tr>
    <td  valign="bottom" align="right">
											&nbsp;</td>
    
    </tr>
      <td>  <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
            	<td width="2%">S/N</td>
<!--            	<td width="2%">Critical</td>-->
<!--            	<td width="2%">Mandatory</td>-->
            	<td width="8%">DocCode</td>
<!--            	<td width="4%">Doc No</td>-->
            	<td>Description</td>
<!--            	<td width="4%">Pre-Approval Document</td>-->
<!--                <td width="5%">To Vault</td>-->
            	<td width="15%">Doc Status</td>
<!--                <td width="6%">Txn Date</td>-->
					<td width="6%">Doc Date</td>
                <td width="6%">Doc Generation Date</td>
                <td width="6%">Doc Due Date</td>
                <td width="6%">Doc Expiry Date</td>
<!--                <td width="8%">Action Party</td>-->
<!--				<td width="8%">Cust Status</td>-->
<!--                <td width="8%">Cust Txn Date</td>-->
                <td width="8%">Credit Approver</td>
	            <td width="10%">Action</td>
	            <td>View Images</td>
	            <td width="10%">Select</td>
              
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
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <% //System.out.println("::::::::::::::::111111111$$$$$$$$$$$$$$$$$$$$$$:::::::::::::"+OB);
		itemIndex++;
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
            //System.out.println("::::::::::::::::22222222$$$$$$$$$$$$$$$$$$$$$$:::::::::::::");
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
            //System.out.println("::::::::::::::::333333333$$$$$$$$$$$$$$$$$$$$$$:::::::::::::");
 //System.out.println("::::::::::::::::333333333$$$$$$$$$$$$$$$$$$$$$$:::::::::::::"+OB.getCompletedDate());
        %>
			<tr class="<%=rowClass%>">
              <td class="index" ><%=row%></td>
           <%--   <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled="true" />
            <%}%></td>
                <td style="text-align:center">&nbsp;
            <%if(mandatoryDisplay && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check12" value="<%=row-1%>" <%if(mandatoryDisplay){%> checked <%} %> disabled="true" />
            <%}%></td>   --%>
<%--              
              <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>
			  <td ><bean:write name="OB" property="item.itemCode" /></td>
<!--              <td ><%=docNo%></td>-->
              <td>&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
<!--              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>-->
<!--              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />-->
<%--
              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled="true" /></td>
--%>
             <td>&nbsp;<bean:write name="OB" property="itemDisplayStatus" /></td>
             <td>
				<%if(OB.getDocDate()!=null){%>
				<integro:date object="<%=OB.getDocDate()%>" />
				<%} else {%> <center>-</center> <%}%>
              </td>
             <td>
				<%if(OB.getIdentifyDate()!=null){%>
				<integro:date object="<%=OB.getIdentifyDate()%>"  dateFormat="DD-MMM-YYYY"/>
				<%} else {%> <center>-</center> <%}%>
              </td>
              <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getCompletedDate())%></td>
             <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
<!--             <td> &nbsp;<bean:write name="OB" property="actionParty" /></td>-->
<!--			 <td>&nbsp;<center><integro:empty-if-null value="<%=ccStatus%>"/></center></td>-->
             <td>&nbsp;
          <%
            // if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
              //System.out.println("::::::::::::::::44444444444$$$$$$$$$$$$$$$$$$$$$$:::::::::::::"+allCreditApproverList.size());
             for(int i=0; i<allCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) allCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){
            	%>	 
            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
            	<% 
            	 }
            	
            	 }
             }
             //}
            /* if(OB.getItemStatus().trim().equalsIgnoreCase("WAIVED")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){
                    		// System.out.println("::::::::::::::in waived 3");
                    		*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% 
                    	/* }
                    	
                    	 }
                 }
                 }
             if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_WAIVED")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                		// System.out.println("::::::::::::::in waived 2:::::::: list value::"+creditApproval.getValue()+"compared with ::::::"+OB.getCreditApprover());
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% 
                   /* 	System.out.println(	creditApproval.getLabel());
                    	 }
                    	
                    	 }
                 }
                 }
             if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_DEFER")){
             
             for(int i=0; i<deferCreditApproverList.size();i++){
            	 
            	 LabelValueBean  creditApproval= (LabelValueBean) deferCreditApproverList.get(i);
            	 if(creditApproval.getValue()!=null){
            	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){*/
            	%>	 
<!--            		 <integro:empty-if-null value=""/>-->
            	<% 
           /* 	 }
            	
            	 }
             }
             }*/
             %>
	          </td> 
	          

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
             <td>&nbsp;
             <%
             
             System.out.println("::::::::::::::::555555555$$$$$$$$$$$$$$$$$$$$$$:::::::::::::"+isOperationAllowed);
             
            
            	  if(!OB.getItemStatus().equals("RECEIVED")&& !OB.getItemStatus().equals("PENDING_RECEIVED")){
            	 
            	 
            	 %>
              <% String tempScr = "callSubmit(this,'"+(itemIndex-1)+"', '"+shared+"','"+docNo+"')"; %>
                  <html:select property="actionType" onchange='<%=tempScr%>' >
                	<option value="" >Please Select </option>
<!--                	<option value="view_image_page" >View Images</option>-->
<%-- show view only for share doc                    --%>
                  <%  if (isShareDocViewable){   %>
                      <option value="<%=ICMSConstant.STATE_ITEM_VIEW_COMPLETED%>"><%=ICMSConstant.ACTION_ITEM_VIEW %></option>
                  <% }else{  %>
<%-- End of  view only for share doc                    --%>
<%-- Below For LADs   --%>

<%				
				//System.out.println("::::::::::::::::66666666666$$$$$$$$$$$$$$$$$$$$$$:::::::::::::"+a2.size());
				for (int i=0; i<a2.size(); i++)
					{
						String optionVal = (String)a2.get(i);
						//System.out.println(":::::::::::::::::OB.getItemStatus() ::::::::::::::: "+a2.size());
						if (optionVal!=null)
						{   //System.out.println(":::::::::::::::::mandatory::::::::::::::: "+mandatory+":::::::mandatoryDisplay:::::::::::::::"+mandatoryDisplay);
							if(optionVal.trim().equals("WAIVER")){
							
					}else{
						 if (ICMSConstant.STATE_TEMP_UPLIFTED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal))
                         {%>
                                 <option value="<%=optionVal%>"><%=ICMSConstant.ACTION_RELODGE_CUSTODIAN_DOC %></option>
                         <%}
                         else if (ICMSConstant.STATE_PERM_UPLIFTED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal))
                         {%>
                         <option value="<%=optionVal%>"><%=ICMSConstant.ACTION_RELODGE_CUSTODIAN_DOC %></option>
                 		<%}
                         else if (ICMSConstant.STATE_ITEM_COMPLETED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal) && (OB.getIsInVaultInd() == false))
                         {
                         	//Documents that are not in vault are not allowed to be perform any cross modules
                         }
							//do not display DELETE option if checklist item is a parent
							else if (!optionVal.equals(ICMSConstant.ACTION_ITEM_DELETE)
								|| (optionVal.equals(ICMSConstant.ACTION_ITEM_DELETE) && !CheckListHelper.isParent(checkListItems, docNoLong)))
							{
								//System.out.println(":::::::::::::::::optionVal ::::::::::::::: "+optionVal);
							if(optionVal.trim().equals("COMPLETE")){
									
								}else{
								//System.out.print("::::optionVal::::"+optionVal+":::::::(String)a1.get(i)::::::::"+(String)a1.get(i));
%>								<option value="<%=optionVal%>"><%=(String)a1.get(i)%></option>
<%					}		}
					}
						}
					}
               }    // end of else
%>
                  </html:select>
                  <%}else{
 %>           	  
 
  <center> <a href="#" onClick="viewRec('<%=(itemIndex-1)%>')">View</a></center>
 
             
   <%               }
             
             
            %>
              </td>
             
              <%if(checkListTrxVal.getStatus().equals("REJECTED")){ String tempScr1 = "callSubmit1('"+(itemIndex-1)+"','"+docNo+"')"; %>  
              <td><center><a href="#" onClick="<%=tempScr1%>">View Images </a></center></td>
              <%}else if(checkListTrxVal.getStatus().equals("DRAFT")){ String tempScr3 = "callSubmit3('"+(itemIndex-1)+"','"+docNo+"')";%>
                <td><center><a href="#" onClick="<%=tempScr3%>">View Images </a></center></td>
              <%}else{ String tempScr2 = "callSubmit2('"+(itemIndex-1)+"','"+docNo+"')"; %>              
                <td><center><a href="#" onClick="<%=tempScr2%>">View Images </a></center></td>
                <%}if(checkListTrxVal.getStatus().equals("REJECTED")){ %>
                 <td>               
            <center>  <a href="LADReceipt.do?event=prepare_view_process_lad_doc&operation=LADREC&id=<%=OB.getCheckListItemID()%>&checklistId=<%=checkList.getCheckListID() %>" >View&nbsp;</a></center>
              
              &nbsp;
              </td>
              <%}else if(checkListTrxVal.getStatus().equals("DRAFT")){ %>
              <td>               
            <center>  <a href="LADReceipt.do?event=draft_process_view__lad&operation=LADREC&id=<%=OB.getCheckListItemID()%>&checklistId=<%=checkList.getCheckListID() %>" >View&nbsp;</a></center>
              
              &nbsp;
              </td>
                <%}else{ %>
               <td>               
            <center>  <a href="LADReceipt.do?event=prepare_view_lad_doc&operation=LADREC&id=<%=OB.getCheckListItemID()%>&checklistId=<%=checkList.getCheckListID() %>" >View&nbsp;</a></center>
              
              &nbsp;
              </td>
              <%} %>
<%-- 
              <td style="text-align:center">
              <%  if (!isShareDocViewable){   %>
              <input type="button" name="Submit" value="Undo" onclick="undo('<%=OB.getCheckListItemRef()%>')" class="btnNormal"/>
              <%} %>&nbsp;
              </td>
--%>
                
            </tr>
</logic:equal>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="13">There are no LAD linked</td>
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
<td><a href="#" onClick="saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2"  border="0" id="Image2" /></a></td>
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