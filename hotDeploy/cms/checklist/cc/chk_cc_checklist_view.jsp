<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.chktemplate.bus.ITemplateItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,                 
                 com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.cc.CCCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.cc.CCCheckListAction.checkList");
/*
    if(iTemplate!=null)
        pageContext.setAttribute("iTemplate",iTemplate);
*/
    String lastActionBy = checkListTrxVal.getUserInfo();
    String remarks = checkListTrxVal.getRemarks();

    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


    int row = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
    }
    CountryList cList = CountryList.getInstance();
    String countryName = cList.getCountryName(checkListTrxVal.getTrxContext().getTrxCountryOrigin());

//    System.out.println(" b4 after comp Ob Array");
    ICheckListItem array[] = null;
//        System.out.println("Array Length staging"+checkListTrxVal.getStagingCheckList().getCheckListItemList().length);
    if(checkListTrxVal.getCheckList()==null){
        array = null;
    }else{
        array = checkListTrxVal.getCheckList().getCheckListItemList();
//        System.out.println("Array Length actual"+array.length);
    }
	List res = CompareOBUtil.compOBArray(checkListTrxVal.getStagingCheckList().getCheckListItemList(),array);

//    System.out.println("after comp Ob Array");
    ArrayList list = new ArrayList(res);
    pageContext.setAttribute("checkLists",list);
    
    String checkListIDStr = "";
    if(checkListTrxVal!=null){
    	if(checkListTrxVal.getCheckList()!=null){
    		checkListIDStr = String.valueOf(checkListTrxVal.getCheckList().getCheckListID());
    	}
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

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<html:form action="CCCheckList" >
<input type="hidden" name="event" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>&nbsp;Process
<!--//CR-236          -->
       <% if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus()))
       {
           if (ICMSConstant.TRUE_VALUE.equals(((OBCheckList)checkList).getObsolete())){
            out.print("&nbsp;Delete");
          }else{
            out.print("&nbsp;Maintain Deleted");    
          }
       }%>
       Constitutional / Contractual Doc Checklist</h3></td>
      <td valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
<%
    ICheckListOwner owner = checkList.getCheckListOwner();
    if (owner instanceof ICCCheckListOwner) {
        ICCCheckListOwner ccowner = (ICCCheckListOwner) owner;
        //boolean isSubOwnerType = ICMSConstant.CHECKLIST_PLEDGER.equals(ccowner.getSubOwnerType());
        boolean isSubOwnerType = false;

        String categoryLabel = PropertyManager.getValue("cc.category." + ccowner.getSubOwnerType());
        categoryLabel = (categoryLabel == null) ? ccowner.getSubOwnerType() : categoryLabel;

%>
      <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td class="fieldname">Customer Category</td>
              <td colspan="3"><%=categoryLabel%></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname">CIF</td>
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
              <td class="fieldname">Customer Name</td>
              <td><%= ccowner.getLegalName()%></td>
            </tr>
			<tr class="even">
            <td class="fieldname">Checklist ID</td>
                <td><%=checkListIDStr %>&nbsp;</td>
            </tr>
<%          if (isSubOwnerType)
            {
%>          <tr class="odd"> 
              <td class="fieldname">Pledgor ID</td>
              <td><integro:empty-if-null value="<%= ccowner.getSubOwnerReference()%>"/></td>
            </tr>
<%         }%>    
            <tr class="<%= isSubOwnerType?"even":"odd" %>"  >
              <td class="fieldname">Checklist Status</td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) ==null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
            </tr>           
          </tbody>
        </table>
      </td>
    </tr>
<%  }%>
    <tr> 
      <td>&nbsp;</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
             <td>S/N</td>
	        <td>Mandatory for Borrower</td>
	        <td>Doc Code</td>
	        <td>Doc No.</td> 
	        <td>Description</td>
	        <td>Pre-Approval Document</td>
	        <td>In Vault</td>
	        <td>Audit</td>
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

         //if current checklist item is linked (i.e. has a parent), get the master doc code
         String parentDocCode = "&nbsp;";
         if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
             ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
             parentDocCode = parentCheckListItem.getItem().getItemCode();
         }

 %>
        <tr class="<%=rowClass%>">
          <td class='<bean:write name="compResult" property="key" />'  ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled />
            <%}%>
          </td>
         <!-- <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>  -->
         <td><bean:write name="compResult" property="obj.item.itemCode" /></td> 
          <td><%=docNo%></td>
          <td height="18" >&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
          <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%> disabled /></td>
          <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled /></td>
        </tr>
<%  }%>
</logic:iterate>
</logic:present>
<logic:notPresent name="checkLists" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
            </tr>
</logic:notPresent>

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
					  <td class="odd"><textarea name="remarks" rows="4" cols="120" onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
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
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel"  border="0" id="ImageCancel" /></a></td>
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
