<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.ArrayList,
                 java.util.HashMap,
                 java.util.Date,
                 com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.LegalFirmList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.checkList");
	ArrayList deferCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.deferCreditApproverList");
    
    ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.allCreditApproverList");
    //System.out.println("::::::::::::::::"+allCreditApproverList);
    
    HashMap stockDocChkList = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.stockDocChkList");
   // ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.allCreditApproverList");
   
    int itemIndex2 = 0;
    //OFFICE Refresh
    String custTypeTrxID=(new  Long(checkListTrxVal.getTransactionID()) ).toString();
    String customerID=(new Long(checkListTrxVal.getCustomerID())).toString();
    String remarks = "";
    String lastActionBy = "";
    if(checkList!=null)
        pageContext.setAttribute("checkList",checkList);
    int row = 0;
    //String status = "";
    if(checkListTrxVal!=null){
		//status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    //String cCode = "";
    String cName = "";
    if(cName.equals("")){
        RecurrentDocReceiptForm aForm = (RecurrentDocReceiptForm)request.getAttribute("RecurrentDocReceiptForm");
        cName = aForm.getLimitBkgLoc();
    }
	String flag= "";
	flag = (String)request.getAttribute("flag");
    if(flag==null) {
        flag = request.getParameter("flag");
        if (flag == null) {
            flag = "";
        }
    }

    String secType = "";
    String secSubType = "";
    RecurrentDocReceiptForm aForm = (RecurrentDocReceiptForm)request.getAttribute("RecurrentDocReceiptForm");
    //System.out.println("::::::::::::::::"+aForm);
   
    secType = aForm.getSecType();
    secSubType = aForm.getSecSubType();
    String secName = aForm.getSecName();
    SecurityTypeList secList = SecurityTypeList.getInstance();
    secType = secList.getSecurityTypeValue(secType,null);
    SecuritySubTypeList subList = SecuritySubTypeList.getInstance();
    secSubType = subList.getSecuritySubTypeValue(secSubType,null);

    boolean toTrack = false;

    String previous = request.getParameter("previous");
    if (previous == null || previous.length() == 0) {
	    previous = request.getParameter("event");
    }
    if("to_track".equals(previous)){//OFFICE
        toTrack = true;
    }
    //System.out.println("::::::::previous::::::::"+previous);
	//Start CR-380
	String countryCode="none";
	if(checkList.getCheckListLocation()!=null && checkList.getCheckListLocation().getCountryCode() != null ){
		countryCode=checkList.getCheckListLocation().getCountryCode();
	}
	LegalFirmList lList = LegalFirmList.getInstance(countryCode);
	//End CR-380
    String revRmkUpdUserInfo = "";
    String revRemarks = null;
    if (checkList != null)
    {
        revRemarks = checkList.getReversalRemarks();
        revRmkUpdUserInfo = checkList.getReversalRmkUpdatedUserInfo();
    }
    revRemarks = revRemarks==null?"-":revRemarks;
    HashMap docCodeWithStocks = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.docCodeWithStocks");
%>




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

function goView(itemRef, checkListID){
    formObj = document.forms["RecurrentDocReceiptForm"];
    formObj.event.value="view_receipt";
    formObj.itemRef.value = itemRef;
    formObj.checkListID.value = checkListID;
    formObj.submit();
}

function view(itemRef) {
    formObj = document.forms["RecurrentDocReceiptForm"];
    formObj.event.value="view_receipt";
    formObj.itemRef.value = itemRef;
    formObj.submit();
}
function goViewImage(itemRef, checkListID,ind){
    formObj = document.forms["RecurrentDocReceiptForm"];
    formObj.event.value="view_image_page";
    formObj.itemRef.value = itemRef;
    formObj.checkListID.value = checkListID;
    document.forms[0].index.value=ind;
    formObj.submit();
}
function viewImage(itemRef,ind) {
    formObj = document.forms["RecurrentDocReceiptForm"];
    formObj.event.value="view_image_page";
    formObj.itemRef.value = itemRef;
    document.forms[0].index.value=ind;
    formObj.submit();
}
function refreshPage(index) {
    document.forms[0].event.value="track_refresh_comment";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

function setLawyerValue(){
	var a = document.getElementsByName("lawFirmPanelFlag")[0].checked;
	var b = document.getElementsByName("lawFirmPanelFlag")[1].checked;

	if(a){
		document.getElementById("select").style.display='block';
	//	document.getElementById("nonPanellawyerLegalFirm").style.display='none';
		document.getElementById("lawyer1").style.display='block';
		document.getElementById("lawyer2").style.display='none';
		document.getElementById("lawyer3").style.display='none';
	}else if(b){
		document.getElementById("select").style.display='none';
	//	document.getElementById("nonPanellawyerLegalFirm").style.display='block';
		document.getElementById("lawyer1").style.display='none';
		document.getElementById("lawyer2").style.display='block';
		document.getElementById("lawyer3").style.display='none';
	}else{
		document.getElementById("select").style.display='none';
	//	document.getElementById("nonPanellawyerLegalFirm").style.display='block';
		document.getElementById("lawyer1").style.display='none';
		document.getElementById("lawyer2").style.display='none';
		document.getElementById("lawyer3").style.display='block';
	}
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif','img/confirm2.gif','img/submit2.gif')">
<html:form action="RecurrentDocReceipt" >
<input type="hidden" name="event" />
<input type="hidden" name="flag" value="<%=flag%>"/>
<input type="hidden" name="commentIndexID"/>
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />
<input type="hidden" name="checkListItemRef" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />
<input type="hidden" name="actionTypeName" />

<input type="hidden" name="itemRef" />
<input type="hidden" name="checkListID"/>

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName" />
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />

<input type="hidden" name="previous" value="<%=previous%>"/>

<%-- //OFFICE Refresh: commented away because -99..99 customer id caused customer to be reset and thus, error when viewing items
<input type="hidden" name="custTypeTrxID" value="<%=custTypeTrxID%>"/>
<input type="hidden" name="customerID" value="<%=customerID%>"/> --%>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3><%=("Cancel".equals(flag)?"Close":flag)%> Recurrent Doc Receipt</h3>

      </td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>
   
<html:hidden property="lawFirmPanelFlag"  name="RecurrentDocReceiptForm" value="-" />

   
		<tr>
      <td>&nbsp; </td>
    </tr>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
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
            	<td width="8%">Doc Status</td>
<!--                <td width="6%">Txn Date</td>-->
                <td width="6%">Doc Date</td>
                <td width="6%">Doc Expiry Date</td>
<!--                <td width="8%">Action Party</td>-->
<!--				<td width="8%">Cust Status</td>-->
<!--                <td width="8%">Cust Txn Date</td>-->
                <td width="8%">Credit Approver</td>
                <td>Statement Type</td>
                 <td width="8%">View Images</td>
	            <td width="10%">Action</td>
            	
<!--            	
              <td width="2%">S/N</td>
              <td width="4%">Manda-tory for SCC</td>
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
              <td width="8%">Remarks</td>
-->
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <%
   boolean isDPL=false;
		//pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
   if(stockDocChkList.get(OB.getItemCode())!=null){
		isDPL=true;
	}
   %>
<%


if(!isDPL){
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

    CheckListItemActionList actList = CheckListItemActionList.getInstance(OB);
    ArrayList a1 = new ArrayList(actList.getOperationLabels());
    ArrayList a2 = new ArrayList(actList.getOperationValues());
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

    String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);

%>
			<tr class="<%=rowClass%>">
               <td class="index" ><%=row%></td>
    <%--         <td style="text-align:center">&nbsp;
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
				<integro:date object="<%=OB.getDocDate()%>" />
				<%} else {%> <center>-</center> <%}%>
              </td>
             <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
<!--             <td> &nbsp;<bean:write name="OB" property="actionParty" /></td>-->
             <td>&nbsp;
              <%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
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
          //   }
            /* if(OB.getItemStatus().trim().equalsIgnoreCase("WAIVED")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){
                    		*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% 
                   /* 	 }
                    	
                    	 }
                 }
                 }
           //  System.out.println("::::::::::::::in waived 3"+OB.getItemStatus());
             if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_WAIVER")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                		// System.out.println("::::::::::::::in waived 2:::::::: list value::"+creditApproval.getValue()+"compared with ::::::"+OB.getCreditApprover());
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% 
                    	/*        	System.out.println(	creditApproval.getLabel());
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
            	/* }
            	
            	 }
             }
             }*/
             %>
	          </td>

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
 			  <%if (false) {if(OB.getRemarks()!=null) {%>
              <td>&nbsp;<%=OB.getRemarks() %></td>
              <%} else{%>
               <td>&nbsp;</td>
               <%}}%>
               <td>
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)) { --%>
              <%  if ("view".equals(request.getParameter("event"))) {
                    String checkListID = request.getParameter("checkListID");
                     System.out.println("callSubmit id:"+OB.getCheckListItemID()); 
              %>
                <a href="#" onClick="goViewImage('<%=OB.getCheckListItemRef()%>', '<%=checkListID%>','<%=OB.getCheckListItemID() %>')">View Images</a>
              <% } else {
            	  System.out.println("callSubmit id:"+OB.getCheckListItemID()); 
            	  %>
                <a href="#" onClick="viewImage('<%=OB.getCheckListItemRef()%>','<%=OB.getCheckListItemID()%>')">View Images</a>
              <%-- } } else { --%>
                &nbsp;
              <%} %>
              </td>
              <td>
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)) { --%>
              <%  if ("view".equals(request.getParameter("event"))) {
                    String checkListID = request.getParameter("checkListID");
              %>
                <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>', '<%=checkListID%>')">View</a>
              <% } else { %>
                <a href="#" onClick="view('<%=OB.getCheckListItemRef()%>')">View</a>
              <%-- } } else { --%>
                &nbsp;
              <% } %>
              </td>
            </tr>
            <%} %>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="11">There are no securities linked</td>
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
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
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
            	<td width="8%">Doc Status</td>
<!--                <td width="6%">Txn Date</td>-->
<!--                <td width="6%">Doc Date</td>-->
                <td width="6%">Doc Expiry Date</td>
<!--                <td width="8%">Action Party</td>-->
<!--				<td width="8%">Cust Status</td>-->
<!--                <td width="8%">Cust Txn Date</td>-->
                <td width="8%">Credit Approver</td>
                <td>Statement Type</td>
                 <td width="8%">View Images</td>
	            <td width="10%">Action</td>
            	
<!--            	
              <td width="2%">S/N</td>
              <td width="4%">Manda-tory for SCC</td>
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
              <td width="8%">Remarks</td>
-->
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <%
   boolean isDP=false;
   //System.out.println("###############################1#########################");
   if(stockDocChkList.get(OB.getItemCode())!=null){
		isDP=true;
	}
		/*if(isDP){
				pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
		}*/
		  // System.out.println("###############################2#########################");
   %>
<%if(isDP){
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

    CheckListItemActionList actList = CheckListItemActionList.getInstance(OB);
    ArrayList a1 = new ArrayList(actList.getOperationLabels());
    ArrayList a2 = new ArrayList(actList.getOperationValues());
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

    String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);

%>
<% 
String viewPath = new String();
String collateralId="";
    //String collateralId="20120209000002367";
      // System.out.println("###############################3#########################");
    String docdateCode=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())+","+OB.getItemCode();
    
  //  System.out.println("###############################4#########################"+docdateCode);
    viewPath = "RecurrentDocReceipt.do?event=read&dueDate=" + docdateCode + "&collateralID=" + collateralId + "&from=" + CollateralAction.READ_SECURITIES_2;
    
   // System.out.println("###############################5#########################"+viewPath);
%>
			<tr class="<%=rowClass%>">
               <td class="index" ><%=row%></td>
           
            
<%--              
              <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>
<% //System.out.println("###############################6#########################"+docCodeWithStocks); %>
			<%if("close_checklist_item".equals(previous)){ %>
			
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
			  <% //System.out.println("###############################7#########################"); %>
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
            
             <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
<!--             <td> &nbsp;<bean:write name="OB" property="actionParty" /></td>-->
             <td>&nbsp;
              <%
           //  if(OB.getItemStatus().trim().equalsIgnoreCase("DEFERRED")){
             
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
          //   }
            /* if(OB.getItemStatus().trim().equalsIgnoreCase("WAIVED")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){
                    		*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% 
                   /* 	 }
                    	
                    	 }
                 }
                 }
           //  System.out.println("::::::::::::::in waived 3"+OB.getItemStatus());
             if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_WAIVER")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                		// System.out.println("::::::::::::::in waived 2:::::::: list value::"+creditApproval.getValue()+"compared with ::::::"+OB.getCreditApprover());
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% 
                    	/*        	System.out.println(	creditApproval.getLabel());
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
            	/* }
            	
            	 }
             }
             }*/
             %>
	          </td>

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
 			  <%if (false) {if(OB.getRemarks()!=null) {%>
              <td>&nbsp;<%=OB.getRemarks() %></td>
              <%} else{%>
               <td>&nbsp;</td>
               <%}}%>
               <td>
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)) { --%>
              <%  if ("view".equals(request.getParameter("event"))) {
                    String checkListID = request.getParameter("checkListID");
              %>
                <a href="#" onClick="goViewImage('<%=OB.getCheckListItemRef()%>', '<%=checkListID%>','<%=OB.getCheckListItemID() %>')">View Images</a>
              <% } else { %>
                <a href="#" onClick="viewImage('<%=OB.getCheckListItemRef()%>','<%=OB.getCheckListItemID() %>')">View Images</a>
              <%-- } } else { --%>
                &nbsp;
              <% } %>
              </td>
              <td>
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)) { --%>
              <%  if ("view".equals(request.getParameter("event"))) {
                    String checkListID = request.getParameter("checkListID");
              %>
                <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>', '<%=checkListID%>')">View</a>
              <% } else { %>
                <a href="#" onClick="view('<%=OB.getCheckListItemRef()%>')">View</a>
              <%-- } } else { --%>
                &nbsp;
              <% }} %>
              </td>
            </tr>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="11">There are no Recurrent linked</td>
            </tr>
<% }%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- Start CR-380
<p/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
    <thead>
    <tr>
      <td colspan="2">
        <div align="left">Legal Firm Handling the Case</div>
      </td>
    </tr>
    </thead> <tbody>
    <tr class="odd">
      <td class="fieldname">Name of Legal Firm</td>
      <td> <integro:empty-if-null value= "<%= lList.getLegalFirmLabel(checkList.getLegalFirm())%>"/></td>
    </tr>
    </tbody>
  </table>
--%>
<%-- End CR-380 --%>
<%if(!toTrack && "Close".equals(flag)) { %>
<p/>
<p/>
<p/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>

	<tr>
	  <td class="fieldname">Last Action By</td>
	  <td class="even">&nbsp;<%=lastActionBy%></td>
	</tr>
	<tr class="odd">
	  <td class="fieldname">Last Remarks Made</td>
	  <td><integro:htmltext value="<%=remarks%>" lineLength="100"/>&nbsp;</td>
	</tr>

<%--
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
--%>
  </tbody>
</table>
<%} %>

<%if(toTrack ) { %>
<p/>
<p/>
<p/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>

	<tr>
	  <td class="fieldname">Last Action By</td>
	  <td class="even">&nbsp;<%=lastActionBy%></td>
	</tr>
	<tr class="odd">
	  <td class="fieldname">Last Remarks Made</td>
	  <td><integro:htmltext value="<%=remarks%>" lineLength="100"/>&nbsp;</td>
	</tr>

<%--
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
--%>
  </tbody>
</table>
<%} %>


<br></br>
 <jsp:include page="view_audit_details.jsp"></jsp:include>

<!-- OFFICE Holding -->
<p>
<%--
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
    <thead>
    <tr>
      <td colspan="2">
        <div align="left">Now in holding of </div>
      </td>
    </tr>
    </thead> <tbody>
    <tr class="even">
      <td class="fieldname">Name of User/Team</td>
      <td> <integro:empty-if-null value= "<%=checkListTrxVal.getToUserInfo()%>"/></td>
    </tr>
    </tbody>
  </table>

<!-- OFFICE Holding -->
<!-- Begin OFFICE HISTORY -->
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
            //OBCMSTrxHistoryLog[] commentList = (OBCMSTrxHistoryLog[]) checkListTrxVal.getTransactionHistoryCollection().toArray(new OBCMSTrxHistoryLog[0]);
            OBCMSTrxHistoryLog[] commentList = null;
	    if(checkListTrxVal.getTransactionHistoryCollection() != null)
            	commentList = (OBCMSTrxHistoryLog[]) checkListTrxVal.getTransactionHistoryCollection().toArray(new OBCMSTrxHistoryLog[0]);

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
          if (indexID == null) {
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
--%>
<!-- End OFFICE HISTORY -->
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
  <%if(!toTrack && "Close".equals(flag)) { %>
    <td><a href="RecurrentDocReceipt.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	<% } else if(!toTrack && "Cancel".equals(flag)) { %>
    <td><a href="RecurrentDocReceipt.do?event=cancel" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else if(toTrack){%>
     <td>  <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else{%>
    <td><a href="RecurrentDocReceipt.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a></a></td>
    <%} %>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<script>
	setLawyerValue();    
</script>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>