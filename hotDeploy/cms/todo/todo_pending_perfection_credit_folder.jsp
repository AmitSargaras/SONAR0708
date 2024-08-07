
<%@ page
	import="java.util.Iterator,
			java.util.Collection,
			com.integrosys.base.businfra.search.SearchResult,
			com.integrosys.cms.ui.common.constant.IGlobalConstant,
			com.integrosys.base.uiinfra.tag.PageIndex,
			com.integrosys.component.bizstructure.app.bus.ITeam,
			com.integrosys.base.uiinfra.common.ICommonEventConstant,
			com.integrosys.cms.app.transaction.OBPendingCasesSearchResult"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

	String legalName = request.getParameter("legalName");
	if (legalName == null) {
		legalName = "";
	}

	SearchResult result = (SearchResult) request.getAttribute("searchResult");

	if (result == null) {
		result = (SearchResult) session.getAttribute("com.integrosys.cms.ui.todo.TodoAction.session.searchResult");
	}

	Collection col = null;
	if (result != null) {
		col = result.getResultList();
	}
	
	String sii = (String) request.getAttribute("startIndex");
	int six = 0;
	if (sii != null) {
		six = Integer.parseInt(sii);
	}
%>

<html>
<head>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;

}
//-->
</script>

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

function goNextPrev(ind) {
    document.forms["WorkspaceForm"].userName.value='';
    document.forms["WorkspaceForm"].startIndex.value=ind;
}

function goPageIndex(ind) {
    document.forms["WorkspaceForm"].startIndex.value=ind;
    document.forms["WorkspaceForm"].submit();
}

function goAlphaIndex(ind) {
    document.forms["WorkspaceForm"].searchLeID.value='';
    document.forms["WorkspaceForm"].searchAANumber.value='';
    document.forms["WorkspaceForm"].searchCustomerName.value='';
    document.forms["WorkspaceForm"].legalName.value=ind;
    document.forms["WorkspaceForm"].startIndex.value=0;
    document.forms["WorkspaceForm"].isBtnClicked.value='Y';
    document.forms["WorkspaceForm"].submit();
}

function goPage(pageNo){
	document.forms[0].startIndex.value = pageNo*10;
}
function submitPage(idx) {
	if (idx == 1) {
		//document.forms[0].searchLeID.value='';
		//document.forms[0].searchCustomerName.value='';
	} else if (idx == 2) {
		document.forms[0].searchAANumber.value='';
		document.forms[0].isBtnClicked.value='Y';
	} else if (idx == 3) {
		document.forms[0].searchLeID.value='';
		document.forms[0].searchAANumber.value='';
		document.forms[0].isBtnClicked.value='Y';
	} else if (idx == 4) {
		document.forms[0].searchLeID.value='';
		//document.forms[0].searchLeIDType.value='';
		document.forms[0].searchCustomerName.value='';
		document.forms[0].isBtnClicked.value='Y';
	}

    document.forms["WorkspaceForm"].startIndex.value=0;
    document.forms["WorkspaceForm"].submit();
}

function handleEnter (field, event, itemPressed) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == "" || field.value == null) {
			//
		}
		else {
			submitPage(itemPressed);
		}
		return false;
	} 
	else
	return true;
}

//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td valign="top"><!-- Content --> <html:form action="ToDo.do">
			<input type="hidden" name="startIndex" value="0" />
			<input type="hidden" name="event"
				value="pending_perfection_credit_folder" />
			<input type="hidden" name="legalName" value="<%=legalName%>" />
			<input type="hidden" name="isBtnClicked" value="N" />

			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td valign="top">
						<table width="100%" class="tblFormSection" border="0"
							align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100%">
								<TABLE width="70%" class=tblinfo id=custsearch border="0"
									align="left" cellpadding="0" cellspacing="0"
									style="margin-top: 15px">
									<THEAD>
										<TR>
											<TD colSpan=3 width="100%">Please enter search criteria</TD>
										</TR>
									</THEAD>
									<TBODY>
										<TR class="odd">
											<TD class="fieldname"><bean:message key="label.customer.id" /> :</TD>
											<TD><html:text property="searchLeID" maxlength="20" size="30" onkeypress="return handleEnter(this, window.event||event, 2);" /> 
												<html:errors property="leIDError" />
											</TD>
											<td><input class=btnNormal id=Search2
												style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px"
												onclick=submitPage(2) type=button value=Go name=Search2>
											</td>
										</TR>
										<TR class="even">
											<TD class="fieldname" width="20%"><bean:message key="label.customer.name" /> :</TD>
											<TD><html:text property="searchCustomerName" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 3);" /> 
												<html:errors property="customerNameError" />
											</TD>
											<TD><input class=btnNormal id=Search3
												style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px"
												onclick=submitPage(3) type=button value=Go name=Search3>
											</TD>
										</TR>
										<TR class="odd">
											<TD class="fieldname" width="20%"><bean:message key="label.global.aa.number" /> :</TD>
											<TD><html:text property="searchAANumber" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 4);" /> 
												<html:errors property="aaNumberError" />
											</TD>
											<TD><input class=btnNormal id=Search3
												style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px"
												onclick=submitPage(4) type=button value=Go name=Search3>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<%
							String title = "Pending Perfection Credit Folder";
								int cols = 8;
						%>

						<td style="padding-left: 5">
						<h3><%=title%></h3>
						</td>
					</tr>
					<tr>
						<td align="center">
						<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center">
						<table width="100%" class="tblinfo" style="margin-top: 0"
							border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<td width="3%"><bean:message key="label.global.sn" /></td>
									<td width="23%"><bean:message key="label.todo.pending.customer.name" /></td>
									<td width="12%"><bean:message key="label.customer.id" /></td>
									<td width="12%"><bean:message key="label.global.los.aa.number" /></td>
									<td width="10%"><bean:message key="label.global.aa.number" /></td>
									<td width="6%"><bean:message key="label.global.approved.date" /></td>
									<td width="6%"><bean:message key="label.status" /></td>
									<td width="10%"><bean:message key="label.global.action" /></td>
								</tr>
							</thead>
							<tbody>
								<%
									if (col == null || col.size() < 1) {
								%>
								<tr>
									<td colspan="<%=cols%>"><bean:message
										key="label.global.not.found" /></td>
								</tr>
								<%
									} else {
											int count = 0;
											if (six > 0) {
												count+=six;
											}
											for (Iterator itr = col.iterator(); itr.hasNext();) {
												OBPendingCasesSearchResult pendingCase = (OBPendingCasesSearchResult) itr
														.next();
												count++;
								%>
								<tr class="<%=(count%2==0) ? "even" : "odd" %>">
									<td width="3%" class="index"><%=count%></td>
									<td width="23%"><%=pendingCase.getCustomerName()%></td>
									<td width="12%"><%=pendingCase.getLeID()%></td>
									<td width="12%"><integro:empty-if-null value="<%=pendingCase.getLosBcaRefNum()%>" />&nbsp;</td>
									<td width="10%"><integro:empty-if-null value="<%=pendingCase.getBcaRefNum()%>" />&nbsp;</td>
									<td width="6%"><integro:date object="<%=pendingCase.getBcaApprovedDate()%>" /></td>
									<td width="6%" style="text-align:center"><%=pendingCase.getTrxStatus()%></td>
									<td width="10%" style="text-align:center">
										<a href="CustomerProcess.do?event=view_borrower_list&customerID=<%=pendingCase.getCustomerID()%>&limitProfileID=<%=pendingCase.getLimitProfileID()%>">Process</a></td>
								</tr>
								<%
									}
										}
								%>
							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td align="center">&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</html:form></td>
	</tr>
	<!-- End Content -->

	<!-- General Purpose Bar -->

	<tr id="generalPurposeBarTR">
		<td height="25">
		<table width="100%" id="generalPurposeBar" border="0" cellspacing="0"
			cellpadding="5" align="center">

			<tr>

				<td width="580" valign="middle"><integro:alphaindex
					url='<%="ToDo.do?event=pending_perfection_credit_folder"%>'
					submitFlag='<%=new Boolean(true)%>' /></td>
				<td width="3" valign="middle" style="padding-right: 5px"><img
					src="img/icon/seprate_bar.gif" /></td>
				<td valign="middle"><integro:pageindex
					pageIndex='<%=new PageIndex(six, 10, result.getNItems())%>'
					url='<%="ToDo.do?event=pending_perfection_credit_folder"%>'
					submitFlag='<%=new Boolean(true)%>' /></td>

			</tr>

		</table>
		</td>
	</tr>

</table>

</body>
</html>
