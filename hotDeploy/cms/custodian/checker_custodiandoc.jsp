<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header:
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.21 $
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
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.custodian.CustodianAction"%>
<%
    try{
    ICustodianTrxValue iCustTrxVal = (ICustodianTrxValue)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.custodianTrxVal");
    CustodianForm form = (CustodianForm)request.getAttribute("CustodianForm");

    //CR_34
    //ICustodianDoc cust = iCustTrxVal.getStagingCustodianDoc();
    String trxId = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.session.trxId");
    ICustodianDocItem stagingDocItem =  (ICustodianDocItem)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.stagingDocItem");
    ICustodianDocItem actualDocItem  =  (ICustodianDocItem)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.actualDocItem");
    ICustodianDoc stagingCustDoc = (ICustodianDoc)iCustTrxVal.getStagingCustodianDoc();
    ICustodianDoc actualCustDoc = (ICustodianDoc)iCustTrxVal.getCustodianDoc();
    //end CR-34

//    DefaultLogger.debug(this, " actualDocItem " + actualDocItem);
//    DefaultLogger.debug(this, " stagingDocItem " + stagingDocItem);

    String opcode = request.getParameter("opcode");
    String forId = "";
    if (stagingCustDoc != null)
        forId = stagingCustDoc.getDocType();
    else if (actualCustDoc != null)
        forId = actualCustDoc.getDocType();
        
//    String approveEvent = null;
//    String rejectEvent = "reject_custodian_checker";

    String screenLabel = "Process Updated ";
    if(forId.equals(ICMSConstant.DOC_TYPE_SECURITY)){
        screenLabel+="Security Doc - ";
    }else if(forId.equals(ICMSConstant.DOC_TYPE_CC)){
        screenLabel+="Constitutional / Contractual Doc - ";
    }
    if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE)){
//            approveEvent="lodge_approve_custodian_checker";
            screenLabel+="Lodge";
       }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE)){
//            approveEvent="relodge_approve_custodian_checker";
           screenLabel+="Relodge";
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT)){
//            approveEvent="tempuplift_approve_custodian_checker";
            screenLabel+="Temp Uplift";
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT)){
//            approveEvent="permuplift_approve_custodian_checker";
            screenLabel+="Perm Uplift";
        }else if(opcode.equals(ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW)){
//            approveEvent="";
//            rejectEvent="";
            screenLabel+="View";
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

function cancelPage(){
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_CUST_DOC_LIST_CHECKER%>&trxId=<%=trxId%>";
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='custodian.do?'>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<!-- InstanceBeginEditable name="Content" -->
<div id="xRateStore" style="display:none" class="userData"></div>

<table class="tblFormSection" width="75%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=screenLabel%></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
    <%
    String strDocType = "";
    String strDocSubType = "";
    if (stagingCustDoc != null){
        strDocType = stagingCustDoc.getDocType();
        strDocSubType = stagingCustDoc.getDocSubType();
    }
    else if (actualCustDoc != null){
        strDocType = actualCustDoc.getDocType();
        strDocSubType = actualCustDoc.getDocSubType();
    }
    if (ICMSConstant.DOC_TYPE_CC.equals(strDocType))
    {
        CCCustodianInfo ccowner = null;
        if (stagingCustDoc != null)
            ccowner = stagingCustDoc.getCCCustodianInfo();
        else if (actualCustDoc != null)
            ccowner = actualCustDoc.getCCCustodianInfo(); 
        if (ccowner != null)
        {
%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%">Customer Category</td>
              <td colspan="3"><%=strDocSubType%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Legal ID</td>
              <td>
<%          if (ccowner.getLegalReference() != null){
%>              <integro:empty-if-null value="<%= ccowner.getLegalReference()%>"/>
<%          }else{
%>              -
<%          }%>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Legal Name</td>
              <td><%= ccowner.getLegalName()%></td>
            </tr>
<%          //if (ICMSConstant.CHECKLIST_PLEDGER.equals(stagingDocItem.getDocSubType()))
            if (ICMSConstant.CHECKLIST_PLEDGER.equals(strDocSubType))
            {
%>          <tr class="odd">
              <td class="fieldname">Pledgor ID</td>
              <td><%= ccowner.getOwnerReference()%></td>
            </tr>
<%         }%>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%      }
    }
    else if (ICMSConstant.DOC_TYPE_SECURITY.equals(strDocType))
    {
        CollateralCustodianInfo colowner = null;
        if (stagingCustDoc != null)
            colowner = stagingCustDoc.getCollateralCustodianInfo();
        else if (actualCustDoc != null)
            colowner = actualCustDoc.getCollateralCustodianInfo();
        if (colowner != null)
        {
%>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%">Security Type</td>
              <td width="30%"> <integro:empty-if-null value="<%= colowner.getCollateralType().getTypeName()%>"/>&nbsp;</td>
              <td class="fieldname" width="20%">Security Sub-Type</td>
              <td width="30%"> <integro:empty-if-null value="<%= colowner.getCollateralSubType().getSubTypeName()%>"/> &nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Security ID</td>
              <td> <integro:empty-if-null value="<%= colowner.getCollateralReference()%>"/>&nbsp;</td>
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
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
                <tr class="odd" width="20%">
                  <td class="fieldname">Doc Code</td>
                  <td> <integro:empty-if-null value="<%=stagingDocItem.getDocNo()%>"/>&nbsp;</td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Doc No</td>
                  <td>  <% if (stagingDocItem.getCheckListItem() != null){%> <%=(stagingDocItem.getCheckListItem().getCheckListItemRef() > 0)?String.valueOf(stagingDocItem.getCheckListItem().getCheckListItemRef()):""%>  <%}%> &nbsp;</td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Doc Description</td>
                  <td> <integro:empty-if-null value="<%=stagingDocItem.getDocDescription()%>"/>&nbsp; </td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Doc Ref</td>
                  <td> <integro:empty-if-null value="<%=stagingDocItem.getDocRef()%>"/>&nbsp; </td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Form Code</td>
                  <td> <integro:empty-if-null value="<%=stagingDocItem.getFormNo()%>"/>&nbsp; </td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Doc Date</td>
                  <td> <integro:date object="<%=stagingDocItem.getDocDate()%>" />&nbsp</td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Doc Expire Date</td>
                  <td> <integro:date object="<%=stagingDocItem.getDocExpiryDate()%>" />&nbsp</td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Narration</td>
                  <td>
                    <integro:htmltext value="<%=stagingDocItem.getDocRemarks()%>" lineLength="80" />
                    &nbsp
                  </td>
                </tr>
                <tr class="odd">
                <%
                    String displayStatus = "";
                    try{
                        if (actualDocItem == null)
                            displayStatus = stagingDocItem.getDisplayStatus(null,stagingDocItem.getStatus());
                        else
                            displayStatus = stagingDocItem.getDisplayStatus(actualDocItem.getStatus(),stagingDocItem.getStatus());
                    } catch (Exception e){ displayStatus = stagingDocItem.getStatus();}
                    if (displayStatus == null)
                        displayStatus = stagingDocItem.getStatus();
                %>
                <%if (displayStatus != null && displayStatus.equals(ICMSConstant.STATE_RECEIVED)){%>
                    <td class="fieldname">Reasons</td>
                <%}else{%>
                    <td class="<%//=CompareOBUtil.compOB(iCustTrxVal.getStagingCustodianDoc(),iCustTrxVal.getCustodianDoc(),"reason")?"fieldname":"fieldnamediff" " outside%>
                    <%=CompareOBUtil.compOB(stagingDocItem,actualDocItem,"reason")?"fieldname":"fieldnamediff"%>"">Reasons</td>
                <%}%>
                    <td><integro:wrapper value="<%=stagingDocItem.getReason()%>" lineLength="80" />&nbsp;</td>
                </tr>
          </tbody>
        </table></td>
    </tr>

  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    <%// CR-34 %>
                      <tr>
                        <td colspan="2" width="100" valign="baseline" align="center"> <a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" border="0" id="Image2" /></a></td>
                      </tr>
                    <%// CR-34 %>
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