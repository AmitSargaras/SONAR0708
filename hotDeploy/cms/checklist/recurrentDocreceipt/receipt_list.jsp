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
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.checkList");
    //System.out.println("::::::::::::::checkListTrxVal::::::::::::::::::"+checkListTrxVal.getStatus());
    ArrayList docIds = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.docNos");
    
    ArrayList deferCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.deferCreditApproverList");
    HashMap stockDocChkList = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.stockDocChkList");
    ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.allCreditApproverList");
    HashMap docCodeWithStocks = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.docCodeWithStocks");
    //System.out.println(">>>>>>>>>>>>>>>>>>>>>>?>>>>>>>>>>>>>>>>>>>>>>"+docCodeWithStocks.size());
   // System.out.println(">>>>>>>>>>>>>>>>>>>>>>docCodeWithStocks>>>>>>>>>>>>>>>>>>>>>>"+docCodeWithStocks);
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
    int row2 = 0;
    int itemIndex = 0;
    int itemIndex2 = 0;
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
    RecurrentDocReceiptForm aForm = (RecurrentDocReceiptForm)request.getAttribute("RecurrentDocReceiptForm");
    
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
<%
String actionStr1 = "com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>



<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.creditApproval.bus.ICreditApproval"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function callSubmit(selObj,ind,shared,docNo) {
formObj = document.forms["RecurrentDocReceiptForm"];
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
	       alert("The document must de-link linkage to RecurrentDoc before deleting/perm-uplifting");
          
    }else if (shared == 'true' &&
              (selObj.options[selObj.selectedIndex].value == 'ALLOW_PERM_UPLIFT' ||
               selObj.options[selObj.selectedIndex].value == 'DELETE')) {
        alert("Action is not allowed as document is shared");
        
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
	formObj = document.forms["RecurrentDocReceiptForm"];
    formObj.event.value = "undo";
	formObj.checkListItemRef.value = checkListItemRef;
	formObj.submit();
}

function submitForm(){

	formObj = document.forms["RecurrentDocReceiptForm"];
    formObj.event.value = "submit";
	formObj.submit();
}

function saveForm() {
	formObj = document.forms["RecurrentDocReceiptForm"];
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
//-->
</script>



<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="RecurrentDocReceipt" >

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
<html:hidden property="lawFirmPanelFlag"  name="CAMReceiptForm" value="-" />
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
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Update Recurrent Doc Receipt</h3>

      </td>
    </tr>
   <tr>
        <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    
    
    
 

<html:hidden property="valuerFirmPanelFlag"  name="RecurrentDocReceiptForm" value="-"  />
	  <tr>
	  	<td>&nbsp;</td>
	  </tr> 
	  
<html:hidden property="insurerFirmPanelFlag"  name="RecurrentDocReceiptForm" value="-" />
	  <tr>
	  	<td>&nbsp;</td>
	  </tr> 
    <%
        //String applicationType = checkList.getApplicationType();
   // DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + applicationType);
        String expressProcessAppTypeList = PropertyManager.getValue("chklist.expressprocessing.applicationtype");
        boolean expressProcess = false;
        //DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> checklist.applicationType=" + expressProcessAppTypeList);
       // if (expressProcessAppTypeList!=null ) {
          //  expressProcess = true;    

    %>
    <%
      //  }
    %>
    
    <tr>
      <td>&nbsp; </td>
    </tr>
    <tr>
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
                <td width="6%">Doc Expiry Date</td>
<!--                <td width="8%">Action Party</td>-->
<!--				<td width="8%">Cust Status</td>-->
<!--                <td width="8%">Cust Txn Date</td>-->
                <td width="8%">Credit Approver</td>
                <td>Statement Type</td>
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
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <%
		//itemIndex++;
		//pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
		
    boolean isDPL=false;
		 if(stockDocChkList.get(OB.getItemCode())!=null){
				isDPL=true;
			}
		/* if(!isDPL){
			 itemIndex++;
				pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
				
		 }*/
   %>
		<% if(!isDPL){
			itemIndex+=itemIndex2;
			itemIndex++;
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
              <td class="index" ><%=row%></td>
   <%--              <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled="true" />
            <%}%></td>
                <td style="text-align:center">&nbsp;
            <%if(mandatoryDisplay && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check12" value="<%=row-1%>" <%if(mandatoryDisplay){%> checked <%} %> disabled="true" />
            <%}%></td>
           
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
				<integro:date object="<%=OB.getDocDate()%>"  dateFormat="DD-MMM-YYYY"/>
				<%} else {%> <center>-</center> <%}%>
              </td>
             <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
<!--             <td> &nbsp;<bean:write name="OB" property="actionParty" /></td>-->
<!--			 <td>&nbsp;<center><integro:empty-if-null value="<%=ccStatus%>"/></center></td>-->
             <td>&nbsp;
             <%
            // if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
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
<td height="18">&nbsp;<integro:common-code-single display="true" categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=OB.getStatementType() %>" descWithCode="false" /></td>  
             <td>
              <% String tempScr = "callSubmit(this,'"+OB.getCheckListItemID()+"', '"+shared+"','"+docNo+"')"; %>
                  <html:select property="actionType" onchange='<%=tempScr%>' >
                	<option value="" >Please Select </option>
                	<% System.out.println("callSubmit id:"+OB.getCheckListItemID()); %>
                	<option value="view_image_page" >View Images</option>
<%-- show view only for share doc                    --%>

                  <%  if (isShareDocViewable){   %>
                      <option value="<%=ICMSConstant.STATE_ITEM_VIEW_COMPLETED%>"><%=ICMSConstant.ACTION_ITEM_VIEW %></option>
                  <% }else if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_RECEIVED")){%>
                  <option value="VIEW_AWAITING" >VIEW</option>
<!--				<option value="RECEIVE" >RECEIVE</option>-->
				<option value="UPDATE" >UPDATE</option>
				<option value="COMPLETE" >COMPLETE</option>
<!--				<option value="DEFER" >DEFER</option>-->
				
                  
                  <%}else{  %>
<%-- End of  view only for share doc                    --%>
<%-- Below For RecurrentDocs   --%>
<%					for (int i=0; i<a2.size(); i++)
					{
						String optionVal = (String)a2.get(i);
						if (optionVal!=null)
						{   
							if(optionVal.trim().equals("WAIVER")){
							//if(mandatory && mandatoryDisplay){
							
							//}else{
							
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
%>								<option value="<%=optionVal%>"><%=(String)a1.get(i)%></option>
<%							}
						//}
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
%>								<option value="<%=optionVal%>"><%=(String)a1.get(i)%></option>
<%							}
					}
						}
					}
               }    // end of else
%>
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
<%} %>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="13">There are no recurrent doc linked</td>
            </tr>
<% }%>
          </tbody>
        </table></td>
        </tr>
        <tr>
        <td>
        &nbsp;
        </td>
        </tr>
        <tr>
      <td> <h3>Update DP Doc Receipt</h3>

      </td>
    </tr>
   <tr>
        <td><hr/></td>
    </tr>
      <tr>
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
<!--                <td width="6%">Doc Date</td>-->
                <td width="6%">Doc Expiry Date</td>
<!--                <td width="8%">Action Party</td>-->
<!--				<td width="8%">Cust Status</td>-->
<!--                <td width="8%">Cust Txn Date</td>-->
                <td width="8%">Credit Approver</td>
                <td>Statement Type</td>
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
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <%
		//itemIndex++;
		//pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
		 boolean isDP=false;
		 if(stockDocChkList.get(OB.getItemCode())!=null){
				isDP=true;
			}
	/*	 if(isDP){
			 itemIndex2+=itemIndex;
			 itemIndex2++;
				pageContext.setAttribute("toDisplayCheckListItem2", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
				
		 }*/
   %>
		<%
		if(isDP){
            String rowClass = "";
            itemIndex2+=itemIndex;
            itemIndex2++;
            row2++;
            if (row2 % 2 != 0) {
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
              <td class="index" ><%=row2%></td>
<!--              <td style="text-align:center">&nbsp;-->
            <%--  
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row2-1%>" <%if(mandatory){%> checked <%} %> disabled="true" />
            <%}%>
             --%>
            
<!--            </td>-->
<!--                <td style="text-align:center">&nbsp;-->
            
            <%--
            <%if(mandatoryDisplay && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check12" value="<%=row2-1%>" <%if(mandatoryDisplay){%> checked <%} %> disabled="true" />
            <%}%>
             --%>
            
<!--            </td>-->
<%--              
              <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>
<% 
String viewPath = new String();
String collateralId="";
    //String collateralId="20120209000002367";
    String docdateCode=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())+","+OB.getItemCode();
    viewPath = "RecurrentDocReceipt.do?event=read&dueDate=" + docdateCode + "&collateralID=" + collateralId + "&from=" + CollateralAction.READ_SECURITIES_2;
%>

			<%if("REJECTED".equals(checkListTrxVal.getStatus().trim())){ %>
			
			 <td ><bean:write name="OB" property="item.itemCode" /></td>
			 <%
				}else{
				if(docCodeWithStocks!=null){	
			 if(docCodeWithStocks.containsKey(OB.getItemCode())){ %>
			  <td ><a href="<%=viewPath%>"><bean:write name="OB" property="item.itemCode" /></a></td>
			  <%}
			 else{ %>
			  <td ><bean:write name="OB" property="item.itemCode" /></td>
			  <%}
				}else{ %>
			  <td ><bean:write name="OB" property="item.itemCode" /></td>
			  <%} }%>
<!--              <td ><%=docNo%></td>-->
              <td>&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
                
<!--              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>-->
<!--              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row2-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />-->
<%--
              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled="true" /></td>
--%>
             <td>&nbsp;<bean:write name="OB" property="itemDisplayStatus" /></td>
            
             <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
<!--             <td> &nbsp;<bean:write name="OB" property="actionParty" /></td>-->
<!--			 <td>&nbsp;<center><integro:empty-if-null value="<%=ccStatus%>"/></center></td>-->
             <td>&nbsp;
             <%
            // if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
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
<td height="18">&nbsp;<integro:common-code-single display="true" categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=OB.getStatementType() %>" descWithCode="false" /></td>
             <td>
              <% String tempScr = "callSubmit(this,'"+OB.getCheckListItemID()+"', '"+shared+"','"+docNo+"')"; %>
                  <html:select property="actionType" onchange='<%=tempScr%>' >
                	<option value="" >Please Select </option>
                	<option value="view_image_page" >View Images</option>
<%-- show view only for share doc                    --%>
                  <%  if (isShareDocViewable){   %>
                      <option value="<%=ICMSConstant.STATE_ITEM_VIEW_COMPLETED%>"><%=ICMSConstant.ACTION_ITEM_VIEW %></option>
                  <% }else{  %>
<%-- End of  view only for share doc                    --%>
<%-- Below For RecurrentDocs   --%>
<%					for (int i=0; i<a2.size(); i++)
					{
						String optionVal = (String)a2.get(i);
						//System.out.println("OB.getItemStatus() : "+ OB.getItemStatus());
						if (optionVal!=null)
						{   
							if(optionVal.trim().equals("WAIVER")){
							//if(mandatory && mandatoryDisplay){
							
							//}else{
							
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
%>								<option value="<%=optionVal%>"><%=(String)a1.get(i)%></option>
<%							}
						//}
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
							if(!optionVal.equalsIgnoreCase("RECEIVE")&&!optionVal.equalsIgnoreCase("UPDATE")&&!optionVal.equalsIgnoreCase("COMPLETE")){	
%>								<option value="<%=optionVal%>"><%=(String)a1.get(i)%></option>
<%							
							}
							}
					}
						}
					}
               }    // end of else
%>
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
                        <input type="checkbox" name="expressCheck" value="<%=itemIndex2-1%>"/>
                </td>
                    <%} else { %>
                <td>&nbsp;</td>
              <% } }}%>
            </tr>
</logic:iterate>
</logic:present>
<% if(row2==0){%>
            <tr class="odd">
              <td colspan="13">There are no recurrent doc linked</td>
            </tr>
<% }%>
          </tbody>
        </table></td>
        </tr>      														
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