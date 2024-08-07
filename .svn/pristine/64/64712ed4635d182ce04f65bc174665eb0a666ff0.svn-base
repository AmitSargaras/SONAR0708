<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header:
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.25 $
     * @since $Date: 2006/10/27 08:42:56 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ page import="com.integrosys.cms.app.custodian.trx.ICustodianTrxValue,
                 com.integrosys.cms.app.custodian.bus.*,
                 com.integrosys.cms.ui.custodian.CustodianForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.custodian.CustodianAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.app.securityenvelope.bus.OBSecEnvelopeItem" %>
<%
    try{
    ILimitProfile limitprofile =(ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);    
    ICustodianTrxValue iCustTrxVal = (ICustodianTrxValue)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.custodianTrxVal");

    CCCustodianInfo ccowner = (CCCustodianInfo)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.session.ccowner");
    CollateralCustodianInfo colowner = (CollateralCustodianInfo)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.session.colowner"); 

    String trxId = request.getParameter("trxId");
    if (trxId == null || trxId.equals("") || trxId.equals("null"))
        trxId = iCustTrxVal.getTransactionID();
    CustodianForm form = (CustodianForm)request.getAttribute("CustodianForm");
    ICustodianDoc custDoc = iCustTrxVal.getCustodianDoc();
    if (custDoc == null)
    {
        custDoc = iCustTrxVal.getStagingCustodianDoc();
    }    
    //CR-34
    ICustodianDocItem stagingDocItem =  (ICustodianDocItem)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.stagingDocItem");
    ICustodianDocItem actualDocItem  =  (ICustodianDocItem)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.actualDocItem");
    OBSecEnvelopeItem secEnvItem  =  (OBSecEnvelopeItem)request.getAttribute("ISecEnvelopeItem");
   
    long custodianDocItemID = 0;
    long checkListItemID = 0;
    if (stagingDocItem != null){
        custodianDocItemID = stagingDocItem.getCustodianDocItemID();
        checkListItemID = stagingDocItem.getCheckListItemRefID();
    }
    //end CR-34
    String opcode = request.getParameter("opcode");
    String forId = request.getParameter("forId");
    String submitEvent = null;
    String screenLabel = "Update ";
    String event = request.getParameter("event");       
    boolean isRemarksNeeded=false;
    boolean isRemarksDisp=false;
    boolean isClose = false;
    boolean isView = false;
    String itemStatus = "";
    if(forId.equals("security")){
        screenLabel+="Security Doc - ";
        if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE)){
            submitEvent="lodge_custodian_maker";
            screenLabel+="Lodge";
            //itemStatus=ICMSConstant.STATE_PENDING_LODGE;
            itemStatus=ICMSConstant.STATE_AUTHZ_LODGE;
       }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE)){
            submitEvent="relodge_custodian_maker";
            screenLabel+="Relodge";
            //itemStatus=ICMSConstant.STATE_PENDING_RELODGE;
            itemStatus=ICMSConstant.STATE_AUTHZ_RELODGED;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_ALLOW_TEMPUPLIFT)){
            submitEvent="allowtempuplift_custodian_maker";
            screenLabel+="Allow Temp Uplift";
            itemStatus=ICMSConstant.STATE_PENDING_AUTHZ_TEMP_UPLIFT;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT)){
            submitEvent="tempuplift_custodian_maker";
            screenLabel+="Temp Uplift";
            //itemStatus=ICMSConstant.STATE_PENDING_TEMP_UPLIFT;
            itemStatus=ICMSConstant.STATE_AUTHZ_TEMP_UPLIFTED;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_ALLOW_PERMUPLIFT)){
            submitEvent="allowpermuplift_custodian_maker";
            screenLabel+="Allow Perm Uplift";
            itemStatus=ICMSConstant.STATE_PENDING_AUTHZ_PERM_UPLIFT;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT)){
            submitEvent="permuplift_custodian_maker";
            screenLabel+="Perm Uplift";
            //itemStatus=ICMSConstant.STATE_PENDING_PERM_UPLIFT;
            itemStatus=ICMSConstant.STATE_AUTHZ_PERM_UPLIFTED;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW)){
            submitEvent="";
            screenLabel+="View";
            isView=true;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE_REVERSAL)){
            submitEvent="lodgereversal_custodian_maker";
            screenLabel+="Reverse";
            itemStatus=ICMSConstant.STATE_CUST_LODGED_REVERSAL;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_PENDING_REVERSAL)){
            submitEvent="reverse_custodian_maker";
            screenLabel+="Reverse";
            //Check Previous Status and decide
            if (actualDocItem != null)
            {
                ICheckListItem chkItem = actualDocItem.getCheckListItem();
                if (chkItem != null)
                {   /*
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_ITEM_RECEIVED))
                        itemStatus=ICMSConstant.STATE_LODGED_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_ITEM_TEMP_UPLIFT_AUTHZ))
                        itemStatus=ICMSConstant.STATE_TEMP_UPLIFT_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_ITEM_PERM_UPLIFT_AUTHZ))
                        itemStatus=ICMSConstant.STATE_PERM_UPLIFT_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_ITEM_RELODGE_AUTHZ))
                        itemStatus=ICMSConstant.STATE_RELODGE_REVERSAL;
                    */
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_LODGE))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_lODGE_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_LODGED))
                        itemStatus=ICMSConstant.STATE_CUST_LODGED_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_TEMP_UPLIFT_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_PERM_UPLIFT_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_RELODGE))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_RELODGE_REVERSAL;
                }
            }
        }
    }else if(forId.equals("cc")){
        screenLabel+="Constitutional / Contractual Doc - ";
        if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE)){
            submitEvent="lodge_custodian_maker";
            screenLabel+="Lodge";
            //itemStatus=ICMSConstant.STATE_PENDING_LODGE;
            itemStatus=ICMSConstant.STATE_AUTHZ_LODGE;
       }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE)){
            submitEvent="relodge_custodian_maker";
            screenLabel+="Relodge";
            //itemStatus=ICMSConstant.STATE_PENDING_RELODGE;
            itemStatus=ICMSConstant.STATE_AUTHZ_RELODGED;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_ALLOW_TEMPUPLIFT)){
            submitEvent="allowtempuplift_custodian_maker";
            screenLabel+="Allow Temp Uplift";
            itemStatus=ICMSConstant.STATE_PENDING_AUTHZ_TEMP_UPLIFT;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT)){
            submitEvent="tempuplift_custodian_maker";
            screenLabel+="Temp Uplift";
            //itemStatus=ICMSConstant.STATE_PENDING_TEMP_UPLIFT;
            itemStatus=ICMSConstant.STATE_AUTHZ_TEMP_UPLIFTED;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_ALLOW_PERMUPLIFT)){
            submitEvent="allowpermuplift_custodian_maker";
            screenLabel+="Allow Perm Uplift";
            itemStatus=ICMSConstant.STATE_PENDING_AUTHZ_PERM_UPLIFT;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT)){
            submitEvent="permuplift_custodian_maker";
            screenLabel+="Perm Uplift";
            //itemStatus=ICMSConstant.STATE_PENDING_PERM_UPLIFT;
             itemStatus=ICMSConstant.STATE_AUTHZ_PERM_UPLIFTED;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW)){
            submitEvent="";
            screenLabel+="View";
            isView=true;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE_REVERSAL)){
            submitEvent="lodgereversal_custodian_maker";
            screenLabel+="Reverse";
            itemStatus=ICMSConstant.STATE_CUST_LODGED_REVERSAL;
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_PENDING_REVERSAL)){
            submitEvent="reverse_custodian_maker";
            screenLabel+="Reverse";
            //Check Previous Status and decide
            if (actualDocItem != null)
            {
                ICheckListItem chkItem = actualDocItem.getCheckListItem();
                if (chkItem != null)
                {
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_LODGE))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_lODGE_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_LODGED))
                        itemStatus=ICMSConstant.STATE_CUST_LODGED_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_TEMP_UPLIFT_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_PERM_UPLIFT_REVERSAL;
                    if (chkItem.getCPCCustodianStatus() != null &&
                        chkItem.getCPCCustodianStatus().equals(ICMSConstant.STATE_PENDING_RELODGE))
                        itemStatus=ICMSConstant.STATE_CUST_PENDING_RELODGE_REVERSAL;
                }
            }
        }
    }
    // CR-34 modification
    String prevLink = "";
    if(forId.equals("security")){
        prevLink="custodian.do?event=session_security_doc_list&checklistid="+custDoc.getCheckListID()+"&securityid="+custDoc.getCollateralID();
    }else if(forId.equals("cc")){
        prevLink="custodian.do?event=session_cc_doc_list&checklistid="+custDoc.getCheckListID();
    }
    // CR-34 modification end
    String cancelEvent = null;
    if(forId.equals("security")){
        cancelEvent="custodian.do?event=session_security_doc_list&checklistid="+custDoc.getCheckListID()+"&securityid="+custDoc.getCollateralID()+"&action=cancel";
    }else if(forId.equals("cc")){
        cancelEvent="custodian.do?event=session_cc_doc_list&checklistid="+custDoc.getCheckListID()+"&action=cancel";
    }
    if(event.equals("prepaare_edit_reject_doc")||event.equals("edit_reject_custodian_maker")){
        custDoc = iCustTrxVal.getStagingCustodianDoc();
        submitEvent="edit_reject_custodian_maker";
        cancelEvent="ToDo.do";
        prevLink="ToDo.do";
        isRemarksNeeded=true;
    }
    if(event.equals(CustodianAction.EVENT_VIEW_CUST_ITEM_TODO)){
        prevLink = "custodian.do?event="+CustodianAction.EVENT_CUST_DOC_LIST_MAKER+"&trxId="+trxId;
    }
    if(event.equals(CustodianAction.EVENT_VIEW_CUST_SEC_ITEM_TODO)){
        prevLink = "custodian.do?event="+CustodianAction.EVENT_CUST_SEC_DOC_LIST_MAKER+"&trxId="+trxId;
    }
    if(request.getParameter("isClose")!=null &&
    request.getParameter("isClose").length()>0 &&
    !request.getParameter("isClose").equals("null") ){
        prevLink+="&isClose=Y";
    }
    if(request.getParameter("totrack")!=null &&
    request.getParameter("totrack").length()>0 &&
    !request.getParameter("totrack").equals("null") ){
        prevLink+="&totrack=totrack";
    }

%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width :150px ;
}


</style>


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

function submitPage() {
    //need to check on the Doc Bar Code is it same to the existing one when Re-Lodge. This should be only the informative message.

    var tempEvent = "<%=submitEvent%>";
    if (tempEvent.toUpperCase().indexOf("RELODGE") != -1) {
        var docBarcodeInputFieldObj = document.getElementById("custDocItemBarcode_DOM");
        var existDocBarcode = docBarcodeInputFieldObj.value;

        var inputsDOM = docBarcodeInputFieldObj.parentNode.getElementsByTagName("INPUT");
        //the first DOM is the input field for Doc Bar Code
        if (inputsDOM[0].value.replace(/^\s+|\s+$/g,"").length != 0) {
            if (inputsDOM[0].value != existDocBarcode) {
                var cont = confirm("The stored document bar code is different from '" + inputsDOM[0].value + "'! Continue?");
                if (!cont) {
                    return;
                }
            }
        }
    }

    document.forms[0].action="custodian.do?event=<%=submitEvent%>&checkListItemRef=<%=checkListItemID%>&custodianDocItemID=<%=custodianDocItemID%>&opcode=<%=opcode%>&forId=<%=forId%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="<%=cancelEvent%>&checkListItemRef=<%=checkListItemID%>";
    document.forms[0].submit();
}
function fnOk(){
    document.forms[0].action="<%=prevLink%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='custodian.do?'>
<input type="hidden" name="isTodo" value="<%=request.getParameter("isTodo")%>"/>
<input type="hidden" name="limitProfile" value="<%=String.valueOf(limitprofile.getLimitProfileID())%>"/>
<input type="hidden" name="docItemSecEnvBarcode" value="<%=secEnvItem.getSecEnvelopeItemBarcode()%>"/>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
<!-- InstanceBeginEditable name="Content" -->
<div id="xRateStore" style="display:none" class="userData"></div>

<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>

<table class="tblFormSection" width="85%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=screenLabel%></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
<%
    if (ICMSConstant.DOC_TYPE_CC.equals(custDoc.getDocType()))
    {
       // CCCustodianInfo ccowner = custDoc.getCCCustodianInfo();
        if (ccowner != null)
        {    
%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td width="80%"><%=custDoc.getDocSubType()%></td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.legalid"/></td>
              <td>
<%          if (ccowner.getLegalReference() != null)
            {
%>              <%= ccowner.getLegalReference()%>
<%          }
            else
            {
%>              -
<%          }%>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.custName"/></td>
              <td><%= ccowner.getLegalName()%></td>
            </tr>
<%          if (ICMSConstant.CHECKLIST_PLEDGER.equals(custDoc.getDocSubType()))
            {
%>          <tr class="odd">
              <td class="fieldname">Pledgor ID</td>
              <td><%= ccowner.getOwnerReference()%></td>
            </tr>
<%         }%>
           <tr class="even">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.cif"/></td>
              <td><%=limitprofile.getLEReference()%></td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%      }
    }
    else if (ICMSConstant.DOC_TYPE_SECURITY.equals(custDoc.getDocType()))
    {
       //CollateralCustodianInfo colowner = custDoc.getCollateralCustodianInfo();
        if (colowner != null)
        {    
%>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.security.docitem.securitytype"/></td>
              <td width="30%"><%= colowner.getCollateralType().getTypeName()%></td>
              <td class="fieldname" width="20%"><bean:message key="label.security.docitem.securitysubtype"/></td>
              <td width="30%"><%= colowner.getCollateralSubType().getSubTypeName()%></td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.docitem.securityID"/></td>
              <td><%= colowner.getCollateralReference()%></td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp; </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%      }
    }%>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
                <tr class="odd">
                  <td width="20%" class="fieldname"><bean:message key="label.document.doccode"/></td>
                  <td width="80%"> <integro:empty-if-null value="<%=stagingDocItem.getDocNo()%>"/>&nbsp</td>
                </tr>
                <tr class="even">
                  <td class="fieldname"><bean:message key="label.document.docnumber"/></td>
                  <td> <%if (stagingDocItem.getCheckListItem() != null){%><%=(stagingDocItem.getCheckListItem().getCheckListItemRef() > 0)?String.valueOf(stagingDocItem.getCheckListItem().getCheckListItemRef()):" "%><%}%>&nbsp;</td>
                </tr>
                <tr class="odd">
                  <td class="fieldname"><bean:message key="label.document.description"/></td>
                  <td> <integro:empty-if-null value="<%=stagingDocItem.getDocDescription()%>"/>&nbsp </td>
                </tr>
               <!-- commented for alliance bank, column not needed 
                <tr class="even">
                  <td class="fieldname">Doc Ref</td>
                  <td>--><% //<integro:empty-if-null value="%><//%=stagingDocItem.getDocRef()%><%//"/>%> 
                <!--
                  </td>
                </tr>-->

                <tr class="even">
                  <td class="fieldname"><bean:message key="label.ccdoc.docitem.formNo"/></td>
                  <td> <integro:empty-if-null value="<%=stagingDocItem.getFormNo()%>"/>&nbsp </td>
                </tr>
                <tr class="odd">
                  <td class="fieldname"><bean:message key="label.document.docdate"/></td>
                  <td> <integro:date object="<%=stagingDocItem.getDocDate()%>" />&nbsp</td>
                </tr>
                <tr class="even">
                  <td class="fieldname"><bean:message key="label.document.docexpiredate"/></td>
                  <td> <integro:date object="<%=stagingDocItem.getDocExpiryDate()%>" />&nbsp</td>
                </tr>
                <tr class="odd">
                  <td class="fieldname"><bean:message key="label.document.narration"/></td>
                  <td>
                  <integro:htmltext value="<%=stagingDocItem.getDocRemarks()%>" lineLength="65" />
                  &nbsp
                  </td>
                </tr>

          <%   //barcode for both document item and envelope are not to be displayed during view
               /*
               * History : Should showing Doc BarCode & Security Envelope BarCode fields when hit 'view' event. Just uncomment the outter level, remain the logic inside. - By Chee Hong (JIRA ABCMS - 816)
               * */
               //if(!isView){
          %>
                <tr class="even">
                    <%if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE) || opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE)){
                        String lbl = opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE) ? "label.document.docbarcode" : "label.document.docbarcode.verify";
                    %>
                  <td class="fieldname">
                      <bean:message key="<%=lbl%>"/>&nbsp;<font color="#0000FF">*</font>
                  </td>
                  <td>
                    <html:text property="custDocItemBarcode" maxlength="100"/>
                    <html:errors property="custDocItemBarcodeError" />&nbsp;
                    <input type="hidden" name="custDocItemBarcode_DOM" id="custDocItemBarcode_DOM" value="<%=stagingDocItem.getCustodianDocItemBarcode()%>">  
                  </td>
                    <%}else if (!isView){%> 
                  <td class="fieldname">
                      <bean:message key="label.document.docbarcode.verify"/>&nbsp;<font color="#0000FF">*</font>
                  </td>  
                  <td>
                    <html:text property="custDocItemBarcodeTmp" maxlength="100"/>
                    <html:errors property="custDocItemBarcodeError" />&nbsp;
                    <input type="hidden" name="custDocItemBarcode" value="<%=stagingDocItem.getCustodianDocItemBarcode()%>">
                  </td>
                    <%}else{%>
                  <td class="fieldname">
                      <bean:message key="label.document.docbarcode"/>&nbsp;<font color="#0000FF">*</font>
                  </td>  
                  <td>
                    <integro:htmltext value="<%=stagingDocItem.getCustodianDocItemBarcode()%>" lineLength="65" />
                    &nbsp;
                  </td>
                    <%}%>                                       
                </tr>
                
                <tr class="odd">
                    <% if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE) || opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE)){
                        String lbl = opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE) ? "label.document.envbarcode" : "label.document.envbarcode.verify";
                    %>
                  <td class="fieldname">
                      <bean:message key="<%=lbl%>"/>&nbsp;<font color="#0000FF">*</font>
                  </td>
                  <td>
                    <html:text property="secEnvelopeBarcode" maxlength="100"/>
                    <html:errors property="secEnvBarcodeError" />&nbsp;
                  </td>
                    <%}else if(!isView){%>
                  <td class="fieldname">
                      <bean:message key="label.document.envbarcode.verify"/>&nbsp;<font color="#0000FF">*</font>
                  </td>  
                  <td>
                    <html:text property="secEnvelopeBarcodeTmp" maxlength="100"/>
                    <html:errors property="secEnvBarcodeError" />&nbsp;
                    <input type="hidden" name="secEnvelopeBarcode" value="<%=stagingDocItem.getSecEnvelopeBarcode()%>">
                  </td>
                    <%}else{%>
                  <td class="fieldname">
                      <bean:message key="label.document.envbarcode"/>&nbsp;<font color="#0000FF">*</font>
                  </td>
                  <td>
                    <integro:htmltext value="<%=stagingDocItem.getSecEnvelopeBarcode()%>" />
                    &nbsp;
                  </td>
                    <%}%>
                </tr>
          <%//}%>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.remarks"/></td>
              <%if(!isView){%>
              <td><textarea name="docReasons" cols="60" rows="3" ><%=(form!=null && form.getDocReasons().length()<1)?(stagingDocItem.getReason()!=null?stagingDocItem.getReason():""):form.getDocReasons() %></textarea>
                <html:errors property="reasonError" />&nbsp;</td>
              <input type="hidden" name="itemStatus" value="<%=itemStatus%>"/>
              <%System.out.println("Item Status : " + itemStatus);}else{%>
              <td>
                <integro:htmltext value="<%=stagingDocItem.getReason()%>" lineLength="65" />
                &nbsp;
              </td>
              <%}%>
            </tr>
          </tbody>
        </table></td>
    </tr>

  <%if(isRemarksNeeded){%>

            <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                              <tbody>
                              <%if(isRemarksDisp){%>
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.remarks"/></td>
                                  <td ><textarea name="remarks"  cols="60" rows="3"></textarea></td>
                                </tr>
                                <%}%>
                                <tr class="even">
                                  <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                                  <td ><%=iCustTrxVal.getUserInfo()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                                  <td><%=iCustTrxVal.getRemarks()!=null?iCustTrxVal.getRemarks():""%>&nbsp;</td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>

<%}else{DefaultLogger.debug("maker_custodiandoc.jsp"," In Edit mode: Remarks are >> "+iCustTrxVal.getRemarks());%>

<%}%>
<%--<%if(!opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE) && !opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE)){%>--%>
<%if(!opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE)){%>
<tr>
      <td>&nbsp;</td>
</tr>
<tr>
      <td><h3><bean:message key="title.security.envelope.custodian"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
<tr>
    <td>
    <!-- Customize for alliance - Add security envelope location display -->
    <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
    <tr class="odd">
	    <td class="fieldname" width="50%"><bean:message key="label.security.envelope.address"/></td>
        <td>
            <integro:common-code-single categoryCode="SEC_ENVELOPE_ADDRESS" entryCode="<%=secEnvItem.getSecEnvelopeItemAddr()%>" display="true" descWithCode="false"/>&nbsp;
        </td>
    </tr>

    <tr class="even">
        <td class="fieldname"><bean:message key="label.security.envelope.cabinet"/></td>
	    <td>
            <integro:common-code-single categoryCode="SEC_ENVELOPE_CABINET" entryCode="<%=secEnvItem.getSecEnvelopeItemCab()%>" display="true" descWithCode="false"/>&nbsp;
	    </td>
    </tr>

    <tr class="odd">
         <td class="fieldname"><bean:message key="label.security.envelope.drawer"/></td>
         <td>
            <integro:common-code-single categoryCode="SEC_ENVELOPE_DRAWER" entryCode="<%=secEnvItem.getSecEnvelopeItemDrw()%>" display="true" descWithCode="false"/>&nbsp;
	     </td>
	</tr>
    </table>
    </td>
</tr>
<%}%>
</tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                      <%if(!isView){%>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        </td>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        </td>
                      <%//}else if(isClose){%>
<!--                        <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        </td>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        </td>
-->
                      <%}else{%>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:fnOk();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" border="0" id="Image2" /></a></td>
                      <%}%>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
<%}catch(Exception e){e.printStackTrace();}%>