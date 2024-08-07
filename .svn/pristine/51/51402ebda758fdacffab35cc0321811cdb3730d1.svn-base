
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.segmentWiseEmail.SegmentWiseEmailForm,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,
	java.util.Locale,
	java.util.Arrays,
	com.integrosys.cms.app.segmentWiseEmail.trx.ISegmentWiseEmailTrxValue,
	com.integrosys.cms.app.segmentWiseEmail.trx.OBSegmentWiseEmailTrxValue"%>
<%
	SegmentWiseEmailForm segmentWiseEmailForm = (SegmentWiseEmailForm) request.getAttribute("SegmentWiseEmailForm");
ISegmentWiseEmailTrxValue segmentWiseEmailTrx = (ISegmentWiseEmailTrxValue) session
			.getAttribute("com.integrosys.cms.ui.segmentWiseEmail.SegmentWiseEmailAction.ISegmentWiseEmailTrxValue");
	int sno = 0;
	int startIndex = 0;
	List segmentWiseEmailList = null;
	//segmentWiseEmailForm.getEmailList()
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
	var addedEmailList=new Array();
	var deletedEmailList=new Array();
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}

	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
 
	function cancelPage() {
		document.forms[0].action = "segmentWiseEmail.do?event=maker_list_segment_wise_email&go=N";
		document.forms[0].submit();
	}
	function submitForm() {
		document.forms[0].action = "segmentWiseEmail.do?event=maker_create_segment_wise_email";
		
		for (var i = 0; i < deletedEmailList.length; i++) {
		    var index = addedEmailList.indexOf(deletedEmailList[i]);
			if (index > -1) {
				addedEmailList.splice(index, 1);
			}
		}
		document.forms[0].segmentWiseEmailList.value=addedEmailList;
		
		if(document.forms[0].segmentWiseEmailList.value==""){
			alert("Please add a Email ID.");
		}else{
			document.forms[0].submit(); 
		}
	}

	function addRow() {
		var emailID=document.getElementById("emailList").value;
		if(emailID=="")
			alert("Please Enter Email-ID");
		else{
			if(ValidateEmail()){
				var table = document.getElementById('listTable');
				var rowCount = table.rows.length;
				var row = table.insertRow(rowCount);
				
				var cell1 = row.insertCell(0);
				var element1 = document.createElement("span");
				element1.innerHTML =document.getElementById("emailList").value;
				cell1.appendChild(element1);
			
				var cell2 = row.insertCell(1);
				var element2 = document.createElement("input");
				element2.setAttribute('type', 'button');							
				element2.setAttribute('value', 'Remove');
				element2.setAttribute('onclick', 'removeRow(this)');							
				cell2.appendChild(element2);
				
				document.getElementById("emailList").value="";
				document.getElementById("emailList").focus();
				
				addedEmailList.push(emailID);
			}
			else{
				document.getElementById("emailList").value="";
				document.getElementById("emailList").focus();
			}
		}
	}
	//VALIDATE EMAIL
	function ValidateEmail() 
	{
		var emailID=document.getElementById("emailList").value;
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailID))
		{
			return (true);
		}
		else{
			alert("You have entered an invalid email address!");
			return (false)
		}
	}
    // DELETE TABLE ROW.
    function removeRow(oButton) {
        var empTab = document.getElementById('listTable');
        deletedEmailList.push(empTab.rows[oButton.parentNode.parentNode.rowIndex].cells[0].innerText);
        empTab.deleteRow(oButton.parentNode.parentNode.rowIndex);    
    }

</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='segmentWiseEmail.do'>
	<html:hidden property="startIndex" />
	<html:hidden property="segmentWiseEmailList" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
						<h4>Add Segment wise Email ID</h4>
						<hr>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblInput">
							<thead>
							</thead>
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="20%">Segment</td>
									<td width="100%"><html:text property="segment" readonly="true" size="80"/></td>
								</tr>
								<tr>
									<td class="fieldname" width="20%">Email ID</td>
									<td width="80%">
										<html:text property="emailList" styleId="emailList" size="60" maxlength="60"></html:text>&nbsp; 
										<input type="button" name="Submit" value="Add" class="btnNormal" onclick="addRow()" />
									</td>
								</tr>
								<!-- <tr>
									<td align="center">
										<table width="100%" id="listTable" border="0" cellspacing="0" cellpadding="0">
											
										</table>
									</td>
								</tr> -->
								<html:hidden name="SegmentWiseEmailForm" property="segment" />
								<html:hidden name="SegmentWiseEmailForm" property="emailList" />

								<html:hidden name="SegmentWiseEmailForm" property="createdBy" />
								<html:hidden name="SegmentWiseEmailForm" property="lastUpdatedBy" />
								<html:hidden name="SegmentWiseEmailForm" property="lastUpdateDate" />
								<html:hidden name="SegmentWiseEmailForm" property="creationDate" />
								<html:hidden name="SegmentWiseEmailForm" property="ID" />
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
				<td><br><hr><br></td>
				</tr>
				<tr>
					<td align="center">
						<table width="60%" id="listTable" border="1px" cellspacing="0" cellpadding="0" class="tblInput">
											
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td>
					<center>
						<a href="javascript:submitForm();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
							<img src="img/submit1.gif" name="Image3311" border="0"
							id="Image3311" />
						</a>
					</center> &nbsp;
				</td>
				<td>
					<center>
					<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</center> &nbsp;
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>


		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
