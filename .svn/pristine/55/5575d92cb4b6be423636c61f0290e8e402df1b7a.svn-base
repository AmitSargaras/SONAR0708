<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.chktemplate.bus.ITemplateItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 org.apache.struts.util.LabelValueBean"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@page import="com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.checkList");
/*
    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);
*/
    String lastActionBy = checkListTrxVal.getUserInfo();
    String remarks = checkListTrxVal.getRemarks();
    if (remarks==null) remarks= "";
        List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.allCreditApproverList");

    int row = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
    }

    ICheckListItem array[] = null;
    if(checkListTrxVal.getCheckList()==null){
        array = null;
    }else{
        array = checkListTrxVal.getCheckList().getCheckListItemList();
    }
	List res = CompareOBUtil.compOBArray(checkListTrxVal.getStagingCheckList().getCheckListItemList(),array);

    ArrayList list = new ArrayList(res);
    pageContext.setAttribute("checkLists",list);
    String secType = "";
    String secSubType = "";
    String secName = "";
    SecurityTypeList list1 = SecurityTypeList.getInstance();
    SecuritySubTypeList list2 = SecuritySubTypeList.getInstance();
    UpdatePariPassuCheckListForm aForm = (UpdatePariPassuCheckListForm)request.getAttribute("UpdatePariPassuCheckListForm");
    if(aForm!=null){
        secType = list1.getSecurityTypeValue(aForm.getSecType(),request.getLocale());
        secSubType = list2.getSecuritySubTypeValue(aForm.getSecSubType(),request.getLocale());
        secName = aForm.getSecName();
    }



%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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


function refreshContent() {
	window.location="CCDocTemp(sscmaker,cty=hk).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
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

function processList()
{
	document.forms[0].action="ToDo.do";
    document.forms[0].event.value="searchtodo";
    document.forms[0].submit();
}
function goView(itemRef) {
    document.forms[0].event.value="chk_view";
    document.forms[0].itemRef.value=itemRef;
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<html:form action="UpdatePariPassuCheckListAction" >
<input type="hidden" name="event" />
<input type="hidden" name="itemRef"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>
<!--//CR-236-->
        Process
    <%  if (ICMSConstant.TRUE_VALUE.equals(((OBCheckList)checkList).getObsolete())){
            out.print("&nbsp;Delete Security Checklist");
        }else{
            out.print("&nbsp;Maintain ");
            if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus())){
                out.print("Deleted ");
            }
            out.print("Pari Passu Checklist");
        }%>
          </h3>
<!--//End CR-236    -->
         </td>
    </tr>
    <tr>
      <td><hr /></td>
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
                <td><%=checkList.getCheckListType() %></td>
               
            </tr>
           <tr class="odd">
                <td class="fieldname">Checklist Status</td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) == null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
            </tr>
<html:hidden property="lawFirmPanelFlag"  name="CAMReceiptForm" value="-" />
		    </tbody>
		  </table>
		 </td>
	  </tr>
    <tr>
      <td> <table width="160"  border="0" align="right" cellpadding="0" cellspacing="0" style="margin-top:5px">
          <tr>
            <td width="80" valign="baseline" align="right">&nbsp;</td>
            <td width="80" valign="baseline" align="right">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr>
	            <td>S/N</td>
	        	<td>Branch Name</td>
	        	<td>Bank Name</td>
	        	<td>Doc Due Date</td>
	        	<td>Doc Expiry Date</td>
        		<td>Received Date</td>
        		<td>Waiver Date</td>
        		<td>Deferred Date</td>
        		<td>Credit Approver</td>        		
        		<td>Doc Status</td>
				<td>Action</td>        		
            </tr>
          </thead>
          <tbody>
<logic:present name="checkLists"  >
   <logic:iterate id="compResult" name="checkLists"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
 <%
     ICheckListItem OB = (ICheckListItem) compResult.getObj();
     if (!ICMSConstant.STATE_DELETED.equals(OB.getItemStatus())) {
         String rowClass = "";
         row++;
         if (row % 2 != 0) {
             rowClass = "odd";
         } else {
             rowClass = "even";
         }
         boolean inherited = false;
         boolean mandatory = false;
         boolean inVault = false;
         boolean extCustodian = false;
         boolean audit = false;

         if (OB.getIsInherited()) {
             inherited = true;
         }
         if (OB.getIsMandatoryInd()) {
             mandatory = true;
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

         long docNoLong = OB.getCheckListItemRef();
         String docNo = String.valueOf(docNoLong);
         docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

         long parentDocNoLong = OB.getParentCheckListItemRef();
         String parentDocNo = String.valueOf(parentDocNoLong);
         parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

         ICheckListItem[] stageItems = checkListTrxVal.getStagingCheckList().getCheckListItemList();
         //if current checklist item is linked (i.e. has a parent), get the master doc code
         String parentDocCode = null;
         if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
             for (int i = 0; i < stageItems.length; i++) {
                 if (parentDocNoLong == stageItems[i].getCheckListItemRef()) {
                     parentDocCode = stageItems[i].getItemCode();
                 }
             }
             if (parentDocCode == null) {
                 ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
                 parentDocCode = parentCheckListItem.getItem().getItemCode();
             }
         }
         parentDocCode = parentDocCode == null ? "&nbsp;" : parentDocCode;

 %>
        <tr class="<%=rowClass%>">
          <td class='<bean:write name="compResult" property="key" />'  ><%=row%></td>          
	  
		  <td >&nbsp;<bean:write name="compResult" property="obj.item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
          <td style="text-align:center"><%=DateUtil.formatDate("dd-MM-yyyy",OB.getEffectiveDate())%></td>
          <td style="text-align:center"><%=DateUtil.formatDate("dd-MM-yyyy",OB.getExpiryDate())%></td>
 		  <td><integro:date simpleDateFormat="dd-MM-yyyy" object="<%=OB.getReceivedDate() %>"></integro:date></td>
 		  <td><integro:date simpleDateFormat="dd-MM-yyyy" object="<%=OB.getWaivedDate()%>"></integro:date></td>
 		  <td><integro:date simpleDateFormat="dd-MM-yyyy" object="<%= OB.getDeferExpiryDate() %>"></integro:date></td>
 		  <td>&nbsp;
 	     <%
           if(allCreditApproverList!=null){
        	for(int a=0; a<allCreditApproverList.size();a++){   
           LabelValueBean bean=(LabelValueBean) allCreditApproverList.get(a);
           if(bean.getValue()!=null){
          	 if(bean.getValue().trim().equals(OB.getCreditApprover())){
          		
          	%>	 
          		 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          	<% 
          	 }
          	 }          
        	}
        	} %>
 		  </td>
	  	  <td><%= OB.getItemStatus() %></td>
	  	  <td>
	      <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING) || (OB.getRemarks()!=null && !(OB.getRemarks().trim().length()==0))) {--%>
              <%if(OB.getItemStatus() != null || (OB.getRemarks()!=null && !(OB.getRemarks().trim().length()==0))) {%>
                <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>')" >view</a>
              <% } else {%>
                &nbsp;
              <% } %>
	  	  </td>
        </tr>
<%}%>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="10">There are no Pari Passu CheckList linked</td>
            </tr>
<% }%>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<p/>
<p/>
<p/>
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="120"  onkeyup="limitTextInput(this,250,'Remarks')"></textarea><html:errors property="remarks"></html:errors></td>
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

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageApprove','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="ImageApprove"  border="0" id="ImageApprove" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageReject','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="ImageReject"  border="0" id="ImageReject" /></a></td>
    <td width="100" valign="baseline" align="center">    <a onclick="processList()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel"  border="0" id="ImageCancel" /></a></td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
