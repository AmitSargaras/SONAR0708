<%@ page
	import="com.integrosys.cms.ui.docglobal.DocumentationGlobalForm,java.util.*,com.integrosys.cms.ui.collateral.CategoryCodeConstant,java.util.List,java.util.ArrayList,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.ui.common.CommonCodeList,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.diff.CompareOBUtil,com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,com.integrosys.cms.app.chktemplate.bus.IDocumentItem,com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,com.integrosys.cms.ui.ccglobal.CCGlobalForm"%>
<%
	/**
	 * Copyright Integro Technologies Pte Ltd
	 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/chk_global_doc_view.jsp,v 1.14 2006/10/27 08:13:10 hmbao Exp $
	 * @author $Author: hmbao $<br>
	 * @version $Revision: 1.14 $
	 * @since $Date: 2006/10/27 08:13:10 $
	 * Tag: $Name:  $
	 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	OBDocumentItemTrxValue trxVal = (OBDocumentItemTrxValue) session
			.getAttribute("com.integrosys.cms.ui.ccglobal.CCGlobalAction.docTrxObj");
	String remarks = trxVal.getRemarks();
	String lastActionBy = trxVal.getUserInfo();
	if (lastActionBy == null)
		lastActionBy = "";
	if (remarks == null)
		remarks = "";

	OBDocumentItem stageOb = (com.integrosys.cms.app.chktemplate.bus.OBDocumentItem) trxVal
			.getStagingDocumentItem();
	OBDocumentItem ob = (OBDocumentItem) trxVal.getDocumentItem();
	CCGlobalForm aForm = (CCGlobalForm) request.getAttribute("CCGlobalForm");
	boolean isDocCodePresent = false;
	if (aForm != null) {
		String docCode = aForm.getItemCode();
		if (docCode != null && docCode.length() > 0) {
			isDocCodePresent = true;
		}
	}
	
	Boolean docCodeNonUnique = (Boolean) request.getAttribute("docCodeNonUnique");
	if (docCodeNonUnique == null) {
		docCodeNonUnique = Boolean.FALSE;
	}	
	
	CommonCodeList commonCode = CommonCodeList.getInstance("APPLICATION_TYPE");
	
    List appCodeID   = (List) commonCode.getCommonCodeValues();
    List appCodeValue   = (List) commonCode.getCommonCodeLabels();
    
    Collection appListing = (Collection)request.getAttribute("appCodeValue");
    
    List savedAppCodeValue = new ArrayList();
    Iterator iter = appListing.iterator();
    while(iter.hasNext())
    {
    	com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
    	savedAppCodeValue.add(docAppItem.getAppType());
    }
%>


<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve_doc";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject_doc";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCGlobal.do">
	<input type="hidden" name="event" />
	<!-- InstanceBeginEditable name="Content" -->
	<p class="required"><font color="#0000FF">*</font> Mandatory for
	Submission&nbsp;</p>
	<br>
	<table class="tblFormSection" width="60%" border="0" align="center"
		cellpadding="0" cellspacing="0" style="margin-top: 10px">
		<thead>
			<tr>
				<td>
				<h3>Global Constitutional / Contractual Document Template -
				View</h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInfo">
					<thead>
					</thead>
					<tbody>
						<%
							if (isDocCodePresent) {
						%>
						<tr class="even">
							<td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemCode")? "fieldname":"fieldnamediff"%>"
							>Document Code&nbsp;<font
								color="#0000FF">* </font></td>
							<td>&nbsp;<bean:write name="CCGlobalForm" scope="request"
								property="itemCode" /><br /><html:errors property="itemCode" />
							</td>
						</tr>
						<%
							}
						%>
						<tr class="odd">
							<td
								class="<%=CompareOBUtil.compOB(stageOb,ob,"itemDesc")? "fieldname":"fieldnamediff"%>"
								>Document Description&nbsp;<font color="#0000FF">* </font></td>
							<td>&nbsp;<bean:write name="CCGlobalForm" scope="request"
								property="itemDesc" /></td>
						</tr>
						<tr class="even">
							<td  class="<%=CompareOBUtil.compOB(stageOb,ob,"documentVersion")? "fieldname":"fieldnamediff"%>"
							>Document Version</td>
							<td>&nbsp;<bean:write name="CCGlobalForm" scope="request"
								property="docVersion" /></td>
						</tr>
						<tr class="odd">
							<td
								class="<%=CompareOBUtil.compOB(stageOb,ob,"expiryDate")? "fieldname":"fieldnamediff"%>"
								>Expiry Date</td>
							<td>&nbsp;<bean:write name="CCGlobalForm" scope="request"
								property="expDate" />&nbsp;</td>
						</tr>
						<tr class="even">
							<td class="<%=(CompareOBUtil.compOB(stageOb,ob,"loanApplicationType"))? "fieldname":"fieldnamediff"%>"><bean:message key="label.cc.checklist.application.type"/></td>
							<td>
							 <select id="loanApplicationTypeAvail" name="loanApplicationTypeAvail" size="10" multiple="multiple" style="width:260">
						                <% for(int i=0; i<appCodeID.size(); i++){
						                	if(savedAppCodeValue!=null && savedAppCodeValue.contains(appCodeID.get(i))){
						                %>
						                  	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                  <%
						                	} }
						                  %>
		
		                			</select> 
							<!--<integro:common-code display="true" categoryCode="APPLICATION_CODE_CC" descWithCode="false" entryCode="<%=stageOb.getLoanApplicationType()%>"/>&nbsp;//-->
						</td>
						</tr>
						<tr class="odd">
							<td class="<%=(CompareOBUtil.compOB(stageOb,ob,"isForBorrower")&&
							CompareOBUtil.compOB(stageOb,ob,"isForPledgor"))? "fieldname":"fieldnamediff"%>"
							>Type&nbsp;<font color="#0000FF">*</font></td>
							<td><html:checkbox name="CCGlobalForm"
								property="isForBorrower" value="isBorrower" disabled="true" />Borrower
							<html:checkbox name="CCGlobalForm" property="isForPledgor"
								value="isPledgor" disabled="true" />Chargor/Pledgor/Guarantor</td>
						</tr>
						<tr class="even">
							<td class="<%=CompareOBUtil.compOB(stageOb,ob,"isPreApprove")? "fieldname":"fieldnamediff"%>"
							>Pre-Approval Document&nbsp;<font color="#0000FF">*
							</font></td>
							<td><html:radio name="CCGlobalForm" property="isPreApprove"
								value="Y" disabled="true" />Yes <html:radio
								name="CCGlobalForm" property="isPreApprove" value="N"
								disabled="true" />No</td>
						</tr>

					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<p />
	<p />
	<p />
	<table width="60%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblInfo">
		<tbody>
			<tr>
				<td class="fieldname">Remarks</td>
				<td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
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

	<table width="100" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td valign="baseline" align="center">&nbsp;</td>
			<td valign="baseline" align="center">&nbsp;</td>
			<td valign="baseline" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td width="100" valign="baseline" align="center"><a href="#"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)"
				onClick="<%=(docCodeNonUnique.booleanValue()) ? "javascript: alert('There is already an existing document with the same code [" + aForm.getItemCode() + "]. \\nPlease reject the transaction.')" : "approve()"%>"><img src="img/approve1.gif" name="Image4411"
				border="0" id="Image4411" /></a></td>
			<td width="100" valign="baseline" align="center"><a href="#"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)"
				onClick="reject()"><img src="img/reject1.gif" name="Image4411"
				border="0" id="Image4411" /></a></td>
			<td width="100" valign="baseline" align="center"><a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a></td>
		</tr>
		<tr>
			<td valign="baseline" align="center">&nbsp;</td>
		</tr>
	</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
