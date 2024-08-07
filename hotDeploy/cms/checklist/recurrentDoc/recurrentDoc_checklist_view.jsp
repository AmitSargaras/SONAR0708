<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.security.SecurityCheckListForm,
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
    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDoc.RecurrentDocCheckListAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDoc.RecurrentDocCheckListAction.checkList");
    CollateralCustodianInfo colowner = (CollateralCustodianInfo)request.getAttribute("colowner");
    ICheckListItem[] checkListItems = checkList.getCheckListItemList();
    Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
	boolean isViewFlag = false;
	if(isViewFlagObj!=null)
	{
		isViewFlag = isViewFlagObj.booleanValue();
	}
	 HashMap stockDocChkList = (HashMap) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDoc.RecurrentDocCheckListAction.stockDocChkList");
	   
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
    RecurrentDocCheckListForm aForm = (RecurrentDocCheckListForm)request.getAttribute("RecurrentDocCheckListForm");
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



<%@page import="com.integrosys.cms.ui.checklist.recurrentDoc.RecurrentDocCheckListForm"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html xmlns="http://www.w3.org/19009/xhtml"><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
<html:form action="RecurrentDocCheckList" >
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
            Maintain
            <% if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus())) {
                    out.print("Deleted ");
                } %>
            Recurrent Doc Checklist</h3></td>
    </tr>
    <tr >
<%--
                        <% if (countDeletable > 0) { %>
                            <td width="100" valign="baseline" align="right"><h6>Select All<input type="checkbox" name="selectAll" onClick="checkAll()"/><br/>
                                <font color="Red">Check Required Docs only</font></h6></td>
                        <% } %>
--%>
                        <td   align="right">
                            &nbsp;</td>
                    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>

<tr>
    <td>&nbsp;</td>
</tr>
<tr>
 
<tr>
    <td colspan="2"><hr/></td>
</tr>

<tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
        	<td>S/N</td>
<!--        	<td>Critical</td>-->
<!--        	<td>Mandatory</td>-->
        	<td>Doc Code</td>
<!--        	<td>Doc No</td>-->
        	<td>Description</td>
        	<td>Statement Type</td>
<!--        	<td>Pre-Approval Document</td>-->
<!--        	<td>In Vault</td>-->
<!--        	<td>Audit</td>-->
<!--        	<td>Action</td>-->
<!--        	<td>Delete</td>-->
<%--
            <td>S/N</td>
            <td>Mandatory for SCC</td>
            <td>Master Doc Code (Doc No)</td>
            <td>Doc Code<br>(Doc No)</td>
            <td>Description</td>
            <td>Action</td>
            <td>SCC Issued</td>
            <td>In Vault</td>
            <td>External Custodian</td>
            <td>Audit</td>
            <td>Required</td>
--%>
        </tr>
    </thead>
    <tbody>
    <logic:present name="checkList" property="checkListItemList">
    <logic:iterate id="OB" name="checkList" property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem">
    <%
    
 
    boolean isDPL=false;
    if(stockDocChkList.get(OB.getItemCode())!=null){
		isDPL=true;
	}
        String rowClass = "";
        row++;
        if (!isDPL&&!ICMSConstant.STATE_DELETED.equals(OB.getItemStatus()) && 
        	CheckListHelper.toDisplayCheckListItem(OB)) {
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
            boolean sharedViewOnly = false;

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
            if (OB.getShared() && OB.getViewable()) {
                sharedViewOnly = true;
            }

            long docNoLong = OB.getCheckListItemRef();
            long docPK = OB.getCheckListItemID();
            String docNo = String.valueOf(docNoLong);
            docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

            long parentDocNoLong = OB.getParentCheckListItemRef();
            String parentDocNo = String.valueOf(parentDocNoLong);
            parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

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

            Date expiryDate = OB.getExpiryDate();
            Calendar calendar = Calendar.getInstance();
            Date currentDate = calendar.getTime();
            //DefaultLogger.debug(this, "expiryDate="+expiryDate);
            if (expiryDate != null && expiryDate.before(currentDate)) {
                //DefaultLogger.debug(this, docNo + " has already expired!");
            }

            //DefaultLogger.debug(this, OB.getItemCode() + "parent id = " + OB.getParentItemID()  + " is inherited=" + inherited + " is mandatory=" + mandatory + " is shareViewOnly= " +sharedViewOnly );

    %>
    <tr class="<%=rowClass%>">
        <td class="index"><%=row%></td>
       <%-- <td style="text-align:center">&nbsp;
            <%if (mandatory && inherited) { %>
                <img src="img/tick(black).gif" width="18" height="16" border="0"/>
            <%}  else if (!inherited && sharedViewOnly && mandatory) { %>
                <input type="checkbox" name="check1" value="<%=row-1%>" checked disabled="true"/>
            <%}%>
        </td>
        <td style="text-align:center">&nbsp;
            <%if (mandatoryDisplay ) { %>
                <img src="img/tick(black).gif" width="18" height="16" border="0"/>
            <%}  else if (!inherited && sharedViewOnly && mandatoryDisplay) { %>
                <input type="checkbox" name="check12" value="<%=row-1%>" checked disabled="true"/>
            <%}%>
               
        </td>--%> 
 <%--
        <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>
		<td><bean:write name="OB" property="item.itemCode"/></td>
<!--        <td><%=docNo%></td>-->
        <td height="18">&nbsp;<bean:write name="OB" property="item.itemDesc"/></td>
         <td height="18">&nbsp;<integro:common-code-single display="true" categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=OB.getStatementType() %>" descWithCode="false" /></td>
<!--	 	<td style="text-align:center"><% if (OB.getItem().getIsPreApprove()) {%>Y<%} else {%>N<%}%></td>-->
<!--        <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>"
 <%
       //     if (inVault) {
           //     out.print(" Checked ");
         //   }
        %>  <%
           // if (inherited || !OB.isEditable() || sharedViewOnly) {
           //     out.print("disabled='true'");
          //  }
        %> /></td>
        <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%
          //  if (audit) {
         //       out.print(" Checked ");
         //   }
        %>  <%
          //  if (inherited || !OB.isEditable() || sharedViewOnly) {
         //       out.print("disabled='true'");
         //   }
        %>  /></td>-->
        
<!--        <td style="text-align:center">-->
            <% if (!ICMSConstant.STATE_ITEM_NOT_USED.equals(OB.getItemStatus())) {  %>
<!--            <select name="actionMenu" onChange="perform(this, '<%=row-1%>')">-->
<!--                <option value="" selected>Please Select</option>-->
                <% // CMS-2236
                    // Allow spawning of new items at any item. Even for expired doc
                    //if (expiryDate==null || currentDate.before(expiryDate)) //if item has not expired yet, allow spawning (Add)
                    //{
                %>
<!--                 <option value="add">Add Sub</option>-->
                <%-- //}

                    if (!CheckListHelper.isNewCheckListItem(actualItems, docNoLong, docPK))
                    //if (docNoLong!=0 && docNoLong!=ICMSConstant.LONG_INVALID_VALUE)
                    {
                %> <option value="link">Link/De-Link</option>
                <option value="replace">Replace</option>
                <% }
                --%>
<!--                </select>-->

            <!-- <input type="button" name="Submit322" value="Add" class="btnNormal" onclick="add('<%=row-1%>')"/> -->
            <%
            } else {
            %>
            (Expired)
            <%}%>
<!--        </td>-->
<%--       
        <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%
            if (inVault) {
                out.print(" Checked ");
            }
        %>  <%
            if (inherited || !OB.isEditable() || sharedViewOnly) {
                out.print("disabled='true'");
            }
        %> /></td>
        <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%
            if (extCustodian) {
                out.print(" Checked ");
            }
        %>  <%
            if (inherited || !OB.isEditable() || sharedViewOnly) {
                out.print("disabled='true'");
            }
        %> /></td>
        <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%
            if (audit) {
                out.print(" Checked ");
            }
        %>  <%
            if (inherited || !OB.isEditable() || sharedViewOnly) {
                out.print("disabled='true'");
            }
        %>  /></td> 
--%>
  
            <%--<td style="text-align:center" height="18" ><input name="removeID" type="checkbox" value="<%=(row-1)%>" /></td>--%>
    </tr>
    <% }%>
    </logic:iterate>
    </logic:present>
    <% if (row == 0) {%>
    <tr class="odd">
        <td colspan="11">There are no Recurrent Doc linked</td>
    </tr>
    <% }%>
    </tbody>
    </table>
 </td>
</tr>

<tr>
        <td><hr/></td>
    </tr>
 <tr>
        <td><h3>
            Maintain DP Checklist </h3></td>
    </tr>
<tr>
        <td><hr/></td>
    </tr>
<tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
        	<td>S/N</td>
<!--        	<td>Critical</td>-->
<!--        	<td>Mandatory</td>-->
        	<td>Doc Code</td>
<!--        	<td>Doc No</td>-->
        	<td>Description</td>
        	<td>Statement Type</td>
        	
<!--        	<td>Pre-Approval Document</td>-->
<!--        	<td>In Vault</td>-->
<!--        	<td>Audit</td>-->
<!--        	<td>Action</td>-->
<!--        	<td>Delete</td>-->
<%--
            <td>S/N</td>
            <td>Mandatory for SCC</td>
            <td>Master Doc Code (Doc No)</td>
            <td>Doc Code<br>(Doc No)</td>
            <td>Description</td>
            <td>Action</td>
            <td>SCC Issued</td>
            <td>In Vault</td>
            <td>External Custodian</td>
            <td>Audit</td>
            <td>Required</td>
--%>
        </tr>
    </thead>
    <tbody>
    <logic:present name="checkList" property="checkListItemList">
    <logic:iterate id="OB" name="checkList" property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem">
    <%	
    boolean isDP=false;
    	if(stockDocChkList.get(OB.getItemCode())!=null){
    		isDP=true;
    	}
        String rowClass = "";
        row++;
       // System.out.print("OB.getItem().getStatementType()::::::::"+OB.getItem().getStatementType());
        if (isDP && !ICMSConstant.STATE_DELETED.equals(OB.getItemStatus()) && 
        	CheckListHelper.toDisplayCheckListItem(OB)) {
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
            boolean sharedViewOnly = false;

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
            if (OB.getShared() && OB.getViewable()) {
                sharedViewOnly = true;
            }

            long docNoLong = OB.getCheckListItemRef();
            long docPK = OB.getCheckListItemID();
            String docNo = String.valueOf(docNoLong);
            docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

            long parentDocNoLong = OB.getParentCheckListItemRef();
            String parentDocNo = String.valueOf(parentDocNoLong);
            parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

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

            Date expiryDate = OB.getExpiryDate();
            Calendar calendar = Calendar.getInstance();
            Date currentDate = calendar.getTime();
            //DefaultLogger.debug(this, "expiryDate="+expiryDate);
            if (expiryDate != null && expiryDate.before(currentDate)) {
                //DefaultLogger.debug(this, docNo + " has already expired!");
            }

            //DefaultLogger.debug(this, OB.getItemCode() + "parent id = " + OB.getParentItemID()  + " is inherited=" + inherited + " is mandatory=" + mandatory + " is shareViewOnly= " +sharedViewOnly );

    %>
    <tr class="<%=rowClass%>">
        <td class="index"><%=row%></td>
       
       
 <%--
        <td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>
--%>
		<td><bean:write name="OB" property="item.itemCode"/></td>
<!--        <td><%=docNo%></td>-->
        <td height="18">&nbsp;<bean:write name="OB" property="item.itemDesc"/></td>
         <td height="18">&nbsp;<integro:common-code-single display="true" categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=OB.getStatementType() %>" descWithCode="false" /></td>
<!--	 	<td style="text-align:center"><% if (OB.getItem().getIsPreApprove()) {%>Y<%} else {%>N<%}%></td>-->
<!--        <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>"
 <%
       //     if (inVault) {
           //     out.print(" Checked ");
         //   }
        %>  <%
           // if (inherited || !OB.isEditable() || sharedViewOnly) {
           //     out.print("disabled='true'");
          //  }
        %> /></td>
        <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%
          //  if (audit) {
         //       out.print(" Checked ");
         //   }
        %>  <%
          //  if (inherited || !OB.isEditable() || sharedViewOnly) {
         //       out.print("disabled='true'");
         //   }
        %>  /></td>-->
        
<!--        <td style="text-align:center">-->
            <% if (!ICMSConstant.STATE_ITEM_NOT_USED.equals(OB.getItemStatus())) {  %>
<!--            <select name="actionMenu" onChange="perform(this, '<%=row-1%>')">-->
<!--                <option value="" selected>Please Select</option>-->
                <% // CMS-2236
                    // Allow spawning of new items at any item. Even for expired doc
                    //if (expiryDate==null || currentDate.before(expiryDate)) //if item has not expired yet, allow spawning (Add)
                    //{
                %>
<!--                 <option value="add">Add Sub</option>-->
                <%-- //}

                    if (!CheckListHelper.isNewCheckListItem(actualItems, docNoLong, docPK))
                    //if (docNoLong!=0 && docNoLong!=ICMSConstant.LONG_INVALID_VALUE)
                    {
                %> <option value="link">Link/De-Link</option>
                <option value="replace">Replace</option>
                <% }
                --%>
<!--                </select>-->

            <!-- <input type="button" name="Submit322" value="Add" class="btnNormal" onclick="add('<%=row-1%>')"/> -->
            <%
            } else {
            %>
            (Expired)
            <%}%>
<!--        </td>-->
<%--       
        <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%
            if (inVault) {
                out.print(" Checked ");
            }
        %>  <%
            if (inherited || !OB.isEditable() || sharedViewOnly) {
                out.print("disabled='true'");
            }
        %> /></td>
        <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%
            if (extCustodian) {
                out.print(" Checked ");
            }
        %>  <%
            if (inherited || !OB.isEditable() || sharedViewOnly) {
                out.print("disabled='true'");
            }
        %> /></td>
        <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%
            if (audit) {
                out.print(" Checked ");
            }
        %>  <%
            if (inherited || !OB.isEditable() || sharedViewOnly) {
                out.print("disabled='true'");
            }
        %>  /></td> 
--%>

            <%--<td style="text-align:center" height="18" ><input name="removeID" type="checkbox" value="<%=(row-1)%>" /></td>--%>
    </tr>
    <% }%>
    </logic:iterate>
    </logic:present>
    <% if (row == 0) {%>
    <tr class="odd">
        <td colspan="11">There are no Recurrent Doc linked</td>
    </tr>
    <% }%>
    </tbody>
    </table>
 </td>
</tr>
<tr>
    <td colspan="9"><html:errors property="remove.error"/></td>
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
    <a href="RecurrentDocCheckList.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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
