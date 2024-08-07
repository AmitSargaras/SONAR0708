<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
				 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.*,
                 com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.ui.common.LegalFirmList,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	//+OFFICE Refresh
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.checkList");
    ArrayList deferCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.deferCreditApproverList");
    String custTypeTrxID = (String) request.getAttribute("custTypeTrxID");
    ArrayList waiverCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.waiverCreditApproverList");
    ArrayList allCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.allCreditApproverList");
    int itemIndex = 0;
    String previous = (String)request.getParameter("previous");
    if (previous != null && previous.equals("null")) {
        previous = "";
    }

    boolean forwardRequest = false;//OFFICE

    String remarks = "";
    String lastActionBy = "";
    if(checkList!=null)
        pageContext.setAttribute("checkList",checkList);
    int row = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    String cName = "";
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
    secType = secList.getSecurityTypeValue(secType,null);
    SecuritySubTypeList subList = SecuritySubTypeList.getInstance();
    secSubType = subList.getSecuritySubTypeValue(secSubType,null);

    ICheckListItem array[] = null;
    if(checkListTrxVal.getCheckList()==null){
        array = null;
    }else{
        array = checkListTrxVal.getCheckList().getCheckListItemList();
    }
	List res = CompareOBUtil.compOBArray(checkListTrxVal.getStagingCheckList().getCheckListItemList(),array);

    ArrayList list = new ArrayList(res);
    pageContext.setAttribute("checkLists",list);

	//checkList.getCheckListItemList();

	//Start CR-380
	boolean isProcess = true;
	String countryCode="none";
	ICheckList OBCheckList		= (ICheckList)checkListTrxVal.getCheckList();
	ICheckList OBStagingCheckList   = (ICheckList)checkListTrxVal.getStagingCheckList();
		if(checkList.getCheckListLocation()!=null && checkList.getCheckListLocation().getCountryCode() != null ){
			countryCode=checkList.getCheckListLocation().getCountryCode();
		}
		LegalFirmList lList = LegalFirmList.getInstance(countryCode);
	//End CR-380
    //CR-34
    String revRmkUpdUserInfo = "";
    String revRemarks = null;
    if (checkList != null)
    {
        revRemarks = checkList.getReversalRemarks();
        revRmkUpdUserInfo = checkList.getReversalRmkUpdatedUserInfo();
    }
    revRemarks = revRemarks==null?"-":revRemarks;
    
    String lawFirmPanelFlag = checkList.getLawFirmPanelFlag()==null?"":checkList.getLawFirmPanelFlag();
    boolean ismandatory = false;
    if(lawFirmPanelFlag.equals("Y")){
    	ismandatory = true;
    }
    //End CR-34
    
%>




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
<script language="JavaScript" src="js/validation.js"></script>
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

function forward(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="forward_checklist_item";
    document.forms[0].submit();
}

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve_checklist_item";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject_checklist_item";
    document.forms[0].submit();
}

function goView(itemRef) {
    document.forms[0].event.value="chk_view";
    document.forms[0].itemRef.value=itemRef;
    document.forms[0].submit();
}

function refreshPage(index) {
    document.forms[0].event.value="refresh_comment";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

function setLawyerValue(){
	var a = document.getElementsByName("lawFirmPanelFlag")[0].checked;
	var b = document.getElementsByName("lawFirmPanelFlag")[1].checked;

	if(a){
		document.getElementById("select").style.display='block';
		document.getElementById("lawyer1").style.display='block';
		document.getElementById("lawyer2").style.display='none';
		document.getElementById("lawyer3").style.display='none';
	}else if(b){
		document.getElementById("select").style.display='none';
		document.getElementById("lawyer1").style.display='none';
		document.getElementById("lawyer2").style.display='block';
		document.getElementById("lawyer3").style.display='none';
	}else{
		document.getElementById("select").style.display='none';
		document.getElementById("lawyer1").style.display='none';
		document.getElementById("lawyer2").style.display='none';
		document.getElementById("lawyer3").style.display='block';
	}
}
function callSubmit2(ind) {
	formObj = document.forms["LADReceiptForm"];
	  
	 formObj.event.value="checker_view_attach_image";
	      //  alert(selObj.options[selObj.selectedIndex].value);
			formObj.index.value = ind;
	      			formObj.submit();
	  	    }

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif','img/confirm2.gif','img/submit2.gif')">
<html:form action="LADReceipt" >
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
<input type="hidden" name="actionTypeName" />
<input type="hidden" name="itemRef"/>
<input type="hidden" name="previous" value="<%=previous%>"/>

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName" />
<html:hidden property="collateralID" />

<!-- OFFICE Refresh -->

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Process LAD Doc Receipt</h3>

      </td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
  </thead>
  <tbody>

    <tr>
      <td>&nbsp; </td>
    </tr>
    <tr>
<!--      <td><table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblinfo" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Legal Firm Handling the Case</td>-->
<!--		    </tr>-->
<!--		    </thead> <tbody>-->
<!--		    <tr class="even">-->
<!--		      <td class="fieldname">Panel Lawyer</td>-->
<!--		      <td width="763">-->
<!--		         <html:radio property="lawFirmPanelFlag" value="Y" disabled="true" />Yes &nbsp;-->
<!--                 <html:radio property="lawFirmPanelFlag" value="N" disabled="true"  />No &nbsp;-->
<!--				 <html:radio property="lawFirmPanelFlag" value="-" disabled="true"  />N/A -->
<!--		      </td>-->
<!--		    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>-->
<!--	  <tr>-->
<!--      <td>&nbsp; </td>-->
<!--    </tr>-->
<!--	<tr>-->
<!--      <td><table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblinfo" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" id="lawyer1" style="text-align:center">Panel Lawyer</td>-->
<!--		      <td colspan="2" class="fieldname" id="lawyer2" style="text-align:center">Non-Panel Lawyer</td>-->
<!--			  <td colspan="2" class="fieldname" id="lawyer3" style="text-align:center">Non Lawyer</td>-->
<!--		    </tr>-->
<!--		    </thead> <tbody>-->
<!--		    <tr class="odd">-->
<!--		      <td width="20%" class="fieldname">Name of Legal Firm-->
<!--				<%if(ismandatory){ %><font color="#0000FF" >*</font><%} %></td>-->
<!--				<td width="80%"> -->
<!--					<html:select property="panellawyerLegalFirm" styleId="select" disabled="true" >-->
<!--	                	<integro:common-code categoryCode="SOLICITOR" />-->
<!--			  	    </html:select>&nbsp;-->
<!--			  	  <%if(!ismandatory){%>-->
<!--			  	  <bean:write name="LADReceiptForm" property="nonPanellawyerLegalFirm" />&nbsp;-->
<!--			  	  <%} %>-->
<!--				</td>-->
<!--		     </tr>-->
<!--		     <tr class="even">-->
<!--	            <td width="30%" class="fieldname">Lawyer Reference Number</td>-->
<!--	            <td><bean:write name="LADReceiptForm" property="lawyerReferenceNumber" />&nbsp;</td>-->
<!--	          </tr>		-->
<!--            <tr class="odd">-->
<!--	            <td width="30%" class="fieldname">Person-In-Charge</td>-->
<!--	            <td><bean:write name="LADReceiptForm" property="lawyerInCharge" />&nbsp;</td>-->
<!--            </tr>		-->
<!--            <tr class="even">-->
<!--				<td width="30%" class="fieldname">Address-->
<!--				<%if(ismandatory){ %><font color="#0000FF" >*</font><%} %></td>-->
<!--				<td><integro:wrapper value="<%=aForm.getLawFirmAddress()%>" lineLength="200" />&nbsp;</td>-->
<!--			</tr>	-->
<!--			<tr class="odd">-->
<!--				<td width="30%" class="fieldname">Contact No</td>-->
<!--				<td><bean:write name="LADReceiptForm" property="lawFirmContactNumber" />&nbsp;</td>-->
<!--			</tr>	-->
<!--            <tr class="even">-->
<!--				<td width="30%" class="fieldname">Email</td>-->
<!--				<td><bean:write name="LADReceiptForm" property="lawyerEmail" />&nbsp;</td>-->
<!--			</tr>		-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	</tr>-->
<!--<tr>-->
<!--      <td>&nbsp; </td>-->
<!--    </tr>-->
<!--	<tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblinfo" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Valuer Firm Handling the Case</td>-->
<!--		    </tr>-->
<!--		    </thead> <tbody>-->
<!--		    <tr class="even">-->
<!--		      <td class="fieldname">Panel Valuer</td>-->
<!--		      <td width="763">-->
<!--		      <% 	
		      	//	boolean bb = false;
		      	//	String valuerFirmPanelFlag = checkList.getValuerFirmPanelFlag()==null?"":checkList.getValuerFirmPanelFlag(); 
		      //		if(valuerFirmPanelFlag.equals("Y")){
		      //			bb = true;
		    //  		}
		      %>
<!--				<html:radio property="valuerFirmPanelFlag"  name="LADReceiptForm" value="Y" disabled="true" />Yes &nbsp;-->
<!--                <html:radio property="valuerFirmPanelFlag"  name="LADReceiptForm" value="N" disabled="true" /> No &nbsp;-->
<!--				<html:radio property="valuerFirmPanelFlag"  name="LADReceiptForm" value="-"  disabled="true" /> N/A-->
<!--		      </td>-->
<!--		    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>-->
<!--	<tr>-->
<!--      <td>&nbsp; </td>-->
<!--    </tr>-->
<!--	<tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="6" class="fieldname" id="valuer1" style="text-align:center">Valuer Information</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>	-->
<!--				<tr class="odd">-->
<!--			      <td width="20%" class="fieldname">Name of Valuer Firm-->
<!--					<%//if(bb){ %><font color="#0000FF" >*</font><%//} %></td>-->
<!--					<td width="80%"> -->
<!--					  <html:select property="valuerFirm" styleId="select" disabled="true" >-->
<!--		                	<integro:common-code categoryCode="VALUER" />-->
<!--				  	    </html:select>-->
<!--					<%//if(!bb){ %>-->
<!--						<bean:write name="LADReceiptForm" property="nonPanelvaluerLegalFirm" />&nbsp;-->
<!--					<%//} %>-->
<!--					</td>-->
<!--			     </tr>-->
<!--			     <tr class="even">-->
<!--		            <td width="30%" class="fieldname">Valuer Reference Number</td>-->
<!--		            <td><bean:write name="LADReceiptForm" property="valuerReferenceNumber" />&nbsp;</td>-->
<!--		          </tr>		-->
<!--	            <tr class="odd">-->
<!--		            <td width="30%" class="fieldname">Person-In-Charge</td>-->
<!--		            <td><bean:write name="LADReceiptForm" property="valuerInCharge" />&nbsp;</td>-->
<!--	            </tr>		-->
<!--	            <tr class="even"> -->
<!--					<td width="30%" class="fieldname">Address-->
<!--					<%//if(bb){ %><font color="#0000FF" >*</font><%//} %></td>-->
<!--					<td><integro:wrapper value="<%=aForm.getValuerFirmAddress()%>" lineLength="200" />&nbsp;</td>-->
<!--				</tr>	-->
<!--				<tr class="odd"> -->
<!--					<td width="30%" class="fieldname">Contact No</td>-->
<!--					<td><bean:write name="LADReceiptForm" property="valuerFirmContactNumber" />&nbsp;</td>-->
<!--				</tr>	-->
<!--	            <tr class="even"> -->
<!--					<td width="30%" class="fieldname">Email</td>-->
<!--					<td><bean:write name="LADReceiptForm" property="valuerEmail" />&nbsp;</td>-->
<!--				</tr>	-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	</tr>-->
<!--	<tr>-->
<!--      <td>&nbsp; </td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblinfo" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="2" class="fieldname" style="text-align:center">Insurer Firm Handling the Case</td>-->
<!--		    </tr>-->
<!--		    </thead> <tbody>-->
<!--		    <tr class="even">-->
<!--		      <td class="fieldname">Panel Insurer</td>-->
<!--		      <td width="763">-->
		      <% 	
		      	//	boolean cc = false;
		      	//	String insurerFirmPanelFlag = checkList.getInsurerFirmPanelFlag()==null?"":checkList.getInsurerFirmPanelFlag(); 
		      	//	if(valuerFirmPanelFlag.equals("Y")){
		      	//		cc = true;
		      	//	}
		      %>
<!--				<html:radio property="insurerFirmPanelFlag"  name="LADReceiptForm" value="Y" disabled="true" />Yes &nbsp;-->
<!--                <html:radio property="insurerFirmPanelFlag"  name="LADReceiptForm" value="N" disabled="true" /> No &nbsp;-->
<!--				<html:radio property="insurerFirmPanelFlag"  name="LADReceiptForm" value="-"  disabled="true" /> N/A-->
<!--		      </td>-->
<!--		    </tr>-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	  </tr>  -->
<!--	<tr>-->
<!--      <td>&nbsp; </td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--      <td>-->
<!--      	<table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0" class="tblInput" >-->
<!--		    <thead>-->
<!--		    <tr align="left">-->
<!--		      <td colspan="6" class="fieldname" id="valuer1" style="text-align:center">Insurer Information</td>-->
<!--		    </tr>-->
<!--		    </thead> -->
<!--		    <tbody>	-->
<!--				<tr class="odd">-->
<!--			      <td width="20%" class="fieldname">Name of Insurer Firm-->
<!--					<%//if(cc){ %><font color="#0000FF" >*</font><%//} %></td>-->
<!--					<td width="80%"> -->
<!--					  <html:select property="insurerFirm" styleId="select" disabled="true" >-->
<!--		                	<integro:common-code categoryCode="INSURER_NAME" />-->
<!--				  	    </html:select>-->
<!--					<%//if(!cc){ %>-->
<!--						<bean:write name="LADReceiptForm" property="nonPanelinsurerLegalFirm" />&nbsp;-->
<!--					<%//} %>-->
<!--					</td>-->
<!--			     </tr>-->
<!--			     <tr class="even">-->
<!--		            <td width="30%" class="fieldname">Insurer Reference Number</td>-->
<!--		            <td><bean:write name="LADReceiptForm" property="insurerReferenceNumber" />&nbsp;</td>-->
<!--		          </tr>		-->
<!--	            <tr class="odd">-->
<!--		            <td width="30%" class="fieldname">Person-In-Charge</td>-->
<!--		            <td><bean:write name="LADReceiptForm" property="insurerInCharge" />&nbsp;</td>-->
<!--	            </tr>		-->
<!--	            <tr class="even"> -->
<!--					<td width="30%" class="fieldname">Address-->
<!--					<%//if(cc){ %><font color="#0000FF" >*</font><%//} %></td>-->
<!--					<td><integro:wrapper value="<%=aForm.getInsurerFirmAddress()%>" lineLength="200" />&nbsp;</td>-->
<!--				</tr>	-->
<!--				<tr class="odd"> -->
<!--					<td width="30%" class="fieldname">Contact No</td>-->
<!--					<td><bean:write name="LADReceiptForm" property="insurerFirmContactNumber" />&nbsp;</td>-->
<!--				</tr>	-->
<!--	            <tr class="even"> -->
<!--					<td width="30%" class="fieldname">Email</td>-->
<!--					<td><bean:write name="LADReceiptForm" property="insurerEmail" />&nbsp;</td>-->
<!--				</tr>		-->
<!--		    </tbody>-->
<!--		  </table>-->
<!--		 </td>-->
<!--	</tr>-->
<!--		<tr>-->
<!--      <td>&nbsp; </td>-->
<!--    </tr>-->
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
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
            	<td width="2%">S/N</td>

            	<td width="4%">Doc Code</td>
<!--            	<td width="4%">Doc No.</td>-->
            	<td width="10%">Description</td>
<!--            	<td width="4%">Pre-Approval Document</td>-->
            	<td width="8%">Doc Status</td>
            	<td width="6%">Doc Date</td>
            	 <td width="6%">Doc Generation Date</td>
<!--				<td width="8%">Custodian Doc Status</td>-->
	            <td width="6%">Doc Due Date</td>
	             <td width="6%">Doc Expiry Date</td>
	             <td width="8%">Credit Approver</td>
<!--	            <td width="6%">Txn Date</td>-->
<!--              	<td width="8%">Remarks</td>-->
              	<td width="8%">Action</td>
              	<td width="8%">View Images</td>
              	<td width="8%">Select</td>
            
            
 <%--
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
--%>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkLists"  >
		   <logic:iterate id="compResult" name="checkLists"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
		<%itemIndex++;
            ICheckListItem OB = (ICheckListItem) compResult.getObj();
            //Begin OFFICE
            if (!forwardRequest) {
                String st = OB.getItemStatus();
                if (st != null) {
                    if (st.equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER) || st.equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL)) {
                        forwardRequest = true;
                    }
                }
            }
            
            if (CheckListHelper.toDisplayCheckListItem(OB)) {
            
            //End OFFICE
            String rowClass = "";
            row++;
            
            
            if (row % 2 != 0) {
                rowClass = "odd";
            } else {
                rowClass = "even";
            }
            boolean mandatoryDisplay = false;
            boolean inherited = false;
            boolean mandatory = false;
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

            long docNoLong = OB.getCheckListItemRef();
            String docNoStr = String.valueOf(docNoLong);
            docNoStr = (docNoStr == null || docNoStr.equals("") || docNoStr.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNoStr;

            long parentDocNoLong = OB.getParentCheckListItemRef();
            String parentDocNo = String.valueOf(parentDocNoLong);
            parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

            //if current checklist item is linked (i.e. has a parent), get the master doc code
            String parentDocCode = "&nbsp;";
            if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
                ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
                parentDocCode = parentCheckListItem.getItem().getItemCode();
            }


            CheckListItemActionList actList = CheckListItemActionList.getInstance(OB);
            ArrayList a1 = new ArrayList(actList.getOperationLabels());
            ArrayList a2 = new ArrayList(actList.getOperationValues());
            if (a1 != null)
                pageContext.setAttribute("actionLabels", a1);
            if (a2 != null)
                pageContext.setAttribute("actionValues", a2);

            String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);

			String ccStatus = OB.getCPCCustodianStatus();
			if(ccStatus == null)
				ccStatus="";

            if (ccStatus.equals(ICMSConstant.STATE_RECEIVED)) {
                ccStatus = ICMSConstant.STATE_AWAITING; 
            }


        %>
			<tr class="<%=rowClass%>">
              <% if(OB.getViewable()) { %>
                <td class='<%=PropertyManager.getValue(CompareOBUtil.CSS_NAME_UNMODIFIED)%>'><%=row%></td>
              <% } else { %>
                <td class='<bean:write name="compResult" property="key" />'  ><%=row%></td>
              <% } %>
   <%--            <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled="true" />
            <%}%></td>
             <td style="text-align:center">&nbsp;
            <%if(mandatoryDisplay && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check12" value="<%=row-1%>" <%if(mandatoryDisplay){%> checked <%} %> disabled="true" />
            <%}%></td>

              <td><%=parentDocCode%><%=parentDocNo%></td>
--%>
			  <td><bean:write name="compResult" property="obj.item.itemCode" /></td>
<!--              <td><%=docNoStr%></td>-->
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
              
<!--              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>-->
<%-- 
              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled="true" /></td>
--%> 
              <td>&nbsp;<bean:write name="compResult" property="obj.itemDisplayStatus" /></td>
              <td>
				<%if(OB.getDocDate()!=null){%>
				<integro:date object="<%=OB.getDocDate()%>" />
				<%} else {%> <center>-</center> <%}%>
              </td>
              <td>
				<%if(OB.getIdentifyDate()!=null){%>
				<integro:date object="<%=OB.getIdentifyDate()%>" />
				<%} else {%>- <%}%>
              </td>
              <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getCompletedDate())%></td>
<!--			  <td>&nbsp;<%=ccStatus%></td>-->
              <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
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
            // }
             /*if(OB.getItemStatus().trim().equalsIgnoreCase("WAIVED")){
            	 
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){
                    		 System.out.println("::::::::::::::in waived 3");*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% /*
                    	 }
                    	
                    	 }
                 }
                 }
             if(OB.getItemStatus().trim().equalsIgnoreCase("PENDING_WAIVER")){
                 for(int i=0; i<waiverCreditApproverList.size();i++){
                	 
                	 LabelValueBean  creditApproval= (LabelValueBean) waiverCreditApproverList.get(i);
                	 if(creditApproval.getValue()!=null){
                    	 if(creditApproval.getValue().trim().equals(OB.getCreditApprover())){*/
                    	%>	 
<!--                    		 <integro:empty-if-null value=""/>-->
                    	<% /*
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
               <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=custDocStatus%>"/></td>
              <td>
	            <% 
	               // CMS-2114 : take into consideration cpc cust status last update date
	               Date custTrxDate = OB.getDisplayCustodianTrxDate();
	               if (custTrxDate != null) { 
		        %>
	            <integro:date object="<%=custTrxDate%>" />
	            <%} else {%>- <%}%>
              </td>
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
--%>
  <%--End for  cr-17            
              <td style="text-align:center">&nbsp;<%if(approved) out.println("Y"); else out.print("N");%></td>
              <td> &nbsp;<bean:write name="compResult" property="obj.actionParty" /></td>

              <%if(OB.getRemarks()!=null) {%>
              <td>&nbsp;<%=OB.getRemarks() %></td>
              <%} else{%>
               <td>&nbsp;</td>
               <%} %>--%>
              <td>
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING) || (OB.getRemarks()!=null && !(OB.getRemarks().trim().length()==0))) {--%>
              <%if(OB.getItemStatus() != null || (OB.getRemarks()!=null && !(OB.getRemarks().trim().length()==0))) {%>
              <center>  <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>')" >View</a></center>
              <% } else {%>
                &nbsp;
              <% } %>
              </td>
              
               <% String tempScr2 = "callSubmit2('"+(itemIndex-1)+"')"; %>
                <td><center><a href="#" onClick="<%=tempScr2%>">View Images </a></center></td>
             
              <!--<td><center><a href="LADReceipt.do?event=checker_view_attach_image">View Images &nbsp;</a></center></td>
              --><td>
              <center>
              <a href="LADReceipt.do?event=prepare_checker_view_lad&operation=LADREC&id=<%=OB.getCheckListItemID()%>&custTypeTrxID=<%=custTypeTrxID %>" >View&nbsp;</a>
           </center>
              &nbsp;
              </td>
            </tr>
	<% } %>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="12">There are no securities linked</td>
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
    <tr class="even">
      <td class="<%=isProcess?(CompareOBUtil.compOB(OBStagingCheckList,OBCheckList,"legalFirm")?"fieldname":"fieldnamediff"):"fieldname"%>">Name of Legal Firm</td>
      <td> <integro:empty-if-null value= "<%= lList.getLegalFirmLabel(checkList.getLegalFirm())%>"/></td>
    </tr>
    </tbody>
  </table>
 --%>
<%-- End CR-380 --%>
<p/>
<p/>
<p/>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="120"  onkeyup="limitTextInput(this,250,'Remarks')"></textarea>
					  </br> <html:errors property="remarksError" />
					  </td>
					</tr>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<%--
<p/>
<p/>
<p/>
<% if (previous == null || previous.trim().length() == 0) { %>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
                    <tr class="even">
                        <td class="fieldname">Last Reversal Remarks</td>
                        <td><integro:htmltext value="<%=revRemarks%>"  lineLength="100"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Reversal Remarks Updated By</td>
                        <td ><%if (revRmkUpdUserInfo != null && !revRmkUpdUserInfo.equals("")){%>
                        <%=revRmkUpdUserInfo%>&nbsp;
                    <%}else{%>
                    -
                    <%}%></td>
                    </tr>

					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="even"><textarea name="remarks" rows="4" cols="120"  onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
					</tr>
<!--					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
-->

				  </tbody>
                </table>
<% } %>
--%>
<%-- 
<!-- Begin OFFICE HISTORY -->
  <% if (forwardRequest) { %>
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
<% } %>
<!-- End OFFICE HISTORY -->
<% if (previous == null || previous.trim().length() == 0) { %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
<% if ( !(status.equals(ICMSConstant.STATE_PENDING_VERIFY)) ) {%>
  <% if (forwardRequest) { %>
  <tr>

          <% if (status.equals(ICMSConstant.STATE_PENDING_UPDATE)) {%>

              <td valign="baseline" align="center">
                        <input name="forwardUser" type="hidden" value="13$-999999999$-999999999" >
                        <html:errors property="forwardUser"/>
              </td>
              <td align="left">
                  <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)" onClick="forward()"><img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" /></a>
              </td>
              <td valign="baseline" align="center">&nbsp;</td>

          <%} else {
                         request.setAttribute("forwardCollection",checkListTrxVal.getNextRouteCollection());
          %>
              <td valign="baseline" align="center" colspan=2>
                        <html:select property="forwardUser">
          	              <html:options collection="forwardCollection" property="valueOfUser" labelProperty="lableOfUser" />
                        </html:select>
                        <html:errors property="forwardUser"/>
              </td>
              <td align="left">
                  <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)" onClick="forward()"><img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" /></a>
              </td>
          <% } %>


  </tr>
  <% } %>
<% } %>
</table>
<% } %>
--%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
  %>
    <td colspan="3">
        <a href="Reassignment.do?event=search&reassignmentType=<%=ReassignmentConstant.TASK_TYPE_SCC%>&searchType=<%=ReassignmentConstant.TASK_SEARCH_KEY%>&scChecklistID=<%=OBCheckList.getCheckListID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a>
    </td>
  <% } else { %>

    <td width="100" valign="baseline" align="center">
<% if ( !(status.equals(ICMSConstant.STATE_PENDING_VERIFY)) ) {%>
    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a>
<% } %>
    </td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
 <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
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