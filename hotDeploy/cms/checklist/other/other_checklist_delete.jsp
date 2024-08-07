<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.security.SecurityCheckListForm,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList"%>
<%@ page import="com.integrosys.cms.app.checklist.bus.OBCheckList"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.security.SecurityCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.security.SecurityCheckListAction.checkList");
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
    SecurityCheckListForm aForm = (SecurityCheckListForm)request.getAttribute("SecurityCheckListForm");
    secType = aForm.getSecType();
    secSubType = aForm.getSecSubType();
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


<html xmlns="http://www.w3.org/19009/xhtml"><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function submitForm() {	
    <% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
	    document.forms[0].event.value="update_delete";
   <% } else {%>
	    document.forms[0].event.value="submit_delete";
   <% } %>
	    document.forms[0].submit();	
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/submit2.gif')">
<html:form action="SecurityCheckList" >
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
<html:hidden property="collateralID" />

<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>
    <%  if (ICMSConstant.TRUE_VALUE.equals(((OBCheckList)checkList).getObsolete())){
        out.print("&nbsp;Delete Security Checklist");
    }else{
        out.print("&nbsp;Maintain ");
        if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus())){
            out.print("Deleted ");
        }
        out.print("Security Checklist");
    }%>
          <!--Delete Maintain Security Checklist--></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%">Security Type</td>
              <td width="30%">&nbsp;<%=secType%></td>
              <td class="fieldname" width="20%">Security Sub-Type</td>
              <td width="30%">&nbsp;<%=secSubType%></td>
            </tr>
            <tr class="even">
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
              <td class="fieldname">Customer Category</td>
              <td><%=checkList.getCheckListOwner().getSubOwnerType()%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Security ID</td>
              <td><bean:write name="SecurityCheckListForm" property="collateralID" /></td>
              <td class="fieldname">Checklist Status</td>
              <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) == null) ?
                      checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
              </td>
            </tr>
          </tbody>
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
              <td width="5%">S/N</td>
              <td width="7%">Mandatory for SCC</td>
              <td width="5%">Code</td>
              <td>Description</td>
              <td width="6%">SCC Issued</td>
              <td width="6%">In Vault</td>
              <td width="6%">External Custodian</td>
              <td width="6%">Audit</td>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
<% if (!ICMSConstant.STATE_DELETED.equals(OB.getItemStatus())) {
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
%>
        <tr class="<%=rowClass%>">
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled />
            <%}%>
          </td>
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center"><% if(OB.getIsLockedInd()) {%>Y<%}else{%>N<%}%></td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled /></td>
          <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%> disabled /></td>
          <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%> disabled /></td>
        </tr>
<%}%>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="10">There are no securities linked</td>
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
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
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
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitForm()" ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>	
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>
