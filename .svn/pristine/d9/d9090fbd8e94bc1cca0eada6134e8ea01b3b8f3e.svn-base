<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.chktemplate.bus.ITemplateItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
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
    
    if(checkList!=null)
        pageContext.setAttribute("checkList",checkList);

    String lastActionBy = "";
    String remarks = "";
    
    if (checkListTrxVal != null)
    {    
        lastActionBy = checkListTrxVal.getUserInfo();
        remarks = checkListTrxVal.getRemarks();
    }   
    //if(lastActionBy==null) lastActionBy = "";
    //if (remarks==null) remarks= "";
    
    int row = 0;
    String status = "";
    String countryCode = (String)request.getAttribute("limitBkgLoc");
    CountryList cList = CountryList.getInstance();
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
        countryCode = checkListTrxVal.getTrxContext().getTrxCountryOrigin();
    }       
    String countryName = cList.getCountryName(countryCode);
    
    String closeFlag = (String)request.getAttribute("closeFlag");
    boolean close = false;
    if("true".equals(closeFlag)){
        close = true;
    }

    boolean toTrack = false;
    String event = request.getParameter("event");
    if("to_track".equals(event)){
        toTrack = true;
    }  
    
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
    document.forms[0].event.value="approve_checklist_item";
    document.forms[0].submit();
}

function reject(){
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
      <td>
        <h3>
    <% if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus()))
       {
         if (ICMSConstant.TRUE_VALUE.equals(((OBCheckList)checkList).getObsolete())){
            //out.print("&nbsp;Delete Constitutional / Contractual Checklist");
         %>
            <bean:message key="title.ccdoc.doc.checklist.delete"/>
         <%
         }else{
            //out.print("&nbsp;Maintain Deleted Constitutional / Contractual Checklist");
         %>
            <bean:message key="title.ccdoc.doc.checklist.deleted"/>
         <%
         }
       }
       else {
          //out.print("&nbsp;Maintain Constitutional / Contractual Checklist");
       %>
          <bean:message key="title.ccdoc.doc.checklist.view"/>
       <%
       }%>
      </h3>
      </td>
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

%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td><%=categoryLabel%></td>
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.cif"/></td>
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
            <tr class="even"> 
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.custName"/></td>
              <td><%= ccowner.getLegalName()%></td>
              <td class="fieldname"><bean:message key="label.document.checklistID"/></td>
              <td><%=checkListIDStr %></td>
            </tr>
<%          if (isSubOwnerType)
            {
%>          <tr class="odd"> 
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.pledgorId"/></td>
              <td><integro:empty-if-null value="<%= ccowner.getSubOwnerReference()%>"/></td>
              <td class="fieldname"><bean:message key="label.security.docitem.checkliststatus"/></td>
               <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) ==null) ?
                       checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
               </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.document.application.type"/></td>
              <td>
                   <integro:common-code-single categoryCode="APPLICATION_TYPE" entryCode="<%=checkList.getApplicationType()%>" display="true" descWithCode="false"/>&nbsp;
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>nbsp;</td>  
            </tr>
<%         }else{%>
           <tr class="odd"  >
               <td class="fieldname"><bean:message key="label.security.docitem.checkliststatus"/></td>
               <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) ==null) ?
                       checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
               </td>
               <td class="fieldname"><bean:message key="label.document.application.type"/></td>
               <td>
                   <integro:common-code-single categoryCode="APPLICATION_TYPE" entryCode="<%=checkList.getApplicationType()%>" display="true" descWithCode="false"/>&nbsp;
               </td>
            </tr>
          <%}%>
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
            <td><bean:message key="label.global.sn"/></td>
	        <td><bean:message key="label.security.docitem.mandatory"/></td>
	        <td><bean:message key="label.document.doccode"/></td>
	        <td><bean:message key="label.document.docno"/>.</td> 
	        <td><bean:message key="label.document.description"/></td>
	        <td><bean:message key="label.security.docitem.preapproval"/></td>
	        <td><bean:message key="label.security.docitem.tovault"/></td>
	       <%  // customize for alliance, comment out unuse column
               // <td><bean:message key="label.security.docitem.audit"/></td>
           %>
           </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
<%
    if (!ICMSConstant.STATE_DELETED.equals(OB.getItemStatus()) &&
    	CheckListHelper.toDisplayCheckListItem(OB)) {
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
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled />
            <%}%>
          </td>
		  <!-- <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>  -->
          <td><bean:write name="OB" property="item.itemCode" /></td> 
          <td><%=docNo%></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%> disabled /></td>
          <!-- <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>disabled /></td> -->
         <!-- customize for alliance, commented unuse column-->
         <!-- <td style="text-align:center"><input type="checkbox" name="check4" value="<%//=row-1%>" <%//if(audit){ out.print(" Checked "); }%>disabled /></td>-->
        </tr>
<%}%>
</logic:iterate>
</logic:present>
<%
	if (row == 0) {
%>
    <tr class="odd">
      <td colspan="10"><bean:message key="error.document.no.document"/></td>
    </tr>
<% } %>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<%if(!toTrack && close) { %>
<p/>
<p/>
<p/>
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr class="even">
					  <td class="fieldname"><bean:message key="label.last.action.by"/></td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<% } %>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
  <%
    if(!toTrack && close) { %>
    <td valign="baseline" align="center"><a href="CCCheckList.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else if(toTrack){%>
        <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{%>
        <a href="#" onclick="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}%>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
