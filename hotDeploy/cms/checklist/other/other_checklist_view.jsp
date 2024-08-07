<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList"%>
<%@ page import="com.integrosys.cms.app.checklist.bus.OBCheckList"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.OBCollateralCheckListOwner" %>
<%@ page import="com.integrosys.cms.app.custodian.bus.CollateralCustodianInfo" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.other.OtherCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.other.OtherCheckListAction.checkList");
    CollateralCustodianInfo colowner = (CollateralCustodianInfo)request.getAttribute("colowner");
    Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
	boolean isViewFlag = false;
	if(isViewFlagObj!=null)
	{
		isViewFlag = isViewFlagObj.booleanValue();
	}

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

    String secType = "";
    String secSubType = "";
    OtherCheckListForm aForm = (OtherCheckListForm)request.getAttribute("OtherCheckListForm");
    secType = aForm.getSecType();
    secSubType = aForm.getSecSubType();
    String secName = aForm.getSecName();
    SecurityTypeList secList = SecurityTypeList.getInstance();
    secType = secList.getSecurityTypeValue(secType,null);
    SecuritySubTypeList subList = SecuritySubTypeList.getInstance();
    secSubType = subList.getSecuritySubTypeValue(secSubType,null);

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



%>



<%@page import="com.integrosys.cms.ui.checklist.other.OtherCheckListForm"%><html xmlns="http://www.w3.org/19009/xhtml"><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function gotopage(aLocation) {
	window.location = aLocation ;
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/submit2.gif')">
<html:form action="OtherCheckList" >
<input type="hidden" name="event" />
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />

<html:hidden property="limitProfileID" />
<html:hidden property="checkListID" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />

<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>
   
         View Other Checklist
      
    </h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>

    <tr>
      <td> <table width="160"  border="0" align="right" cellpadding="0" cellspacing="0" style="margin-top:5px">
          <tr>
            <td width="80" valign="baseline" align="right">&nbsp;</td>
            <td width="80" valign="baseline" align="right">&nbsp;</td>
          </tr>
        </table></td>
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
            	<td><bean:message key="label.global.sn"/></td>
            	<td>Critical</td>
	        	<td><bean:message key="label.security.docitem.mandatory"/></td>
	        	<td><bean:message key="label.document.doccode"/></td>
<!--	        	<td><bean:message key="label.document.docno"/>.</td>-->
	        	<td><bean:message key="label.document.description"/></td>
<!--	        	<td><bean:message key="label.security.docitem.preapproval"/></td>-->
<!--	        	<td><bean:message key="label.security.docitem.tovault"/></td>-->
     <%--           <%
                if(!isViewFlag){
                %>
                    <td><bean:message key="label.security.docitem.audit"/></td>
                <%
                }
                %>
 --%>
           
 <!--           
              <td>S/N</td>
              <td>Mandatory for SCC</td>
              <td>Master Doc Code (Doc No)</td>
              <td>Doc Code<br>(Doc No)</td>
              <td>Description</td>
              <td>SCC Issued</td>
              <td>In Vault</td>
              <td>External Custodian</td>
              <td>Audit</td>
-->
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
<% if (!ICMSConstant.STATE_DELETED.equals(OB.getItemStatus())
	&& CheckListHelper.toDisplayCheckListItem(OB)) {
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
    boolean mandatoryDisplay = false;
    if (OB.getIsMandatoryDisplayInd()) {
        mandatoryDisplay = true;
    }
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

    ICheckListItem[] checkListItems = checkList.getCheckListItemList();
    //if current checklist item is linked (i.e. has a parent), get the master doc code
    String parentDocCode = null;
    if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
        for (int i = 0; i < checkListItems.length; i++) {
            if (parentDocNoLong == checkListItems[i].getCheckListItemRef()) {
                parentDocCode = checkListItems[i].getItemCode();
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
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled />
            <%}%>
          </td>
           <td style="text-align:center">&nbsp;
            <%if(mandatoryDisplay ){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check12" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled />
            <%}%>
          </td>
 <%-- 
          <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>		
			<td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
 <%-- 
          <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%> disabled /></td>
 
     <%
        if(!isViewFlag){
     %>
        <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%> disabled /></td>
     <%
         }
     %>--%>
     </tr>
<%}%>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="10"><bean:message key="error.security.nolink"/></td>
            </tr>
<% }%>          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%if(!toTrack && close) { %>
<p/>
<p/>
<p/>
				<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
  <td valign="baseline" align="center">
  <%if(!toTrack && close) { %>
    <a href="OtherCheckList.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else if(toTrack){%>
        <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{%>
    <a href="#" onclick="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}%>
	</td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>
