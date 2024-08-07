
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.pincodemapping.PincodeMappingForm,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.pincodemapping.trx.IPincodeMappingTrxValue,com.integrosys.cms.app.pincodemapping.trx.OBPincodeMappingTrxValue"%>
<%
PincodeMappingForm pincodeMappingForm = (PincodeMappingForm) request
			.getAttribute("PincodeMappingForm");

	int sno = 0;
	int startIndex = 0;

	IPincodeMappingTrxValue pincodeMappingTrx = (IPincodeMappingTrxValue) session
			.getAttribute("com.integrosys.cms.ui.pincodemapping.PincodeMappingAction.IPincodeMappingTrxValue");
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
function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}
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
    document.forms[0].action="ToDo.do?event=prepare";
    
    document.forms[0].submit();
}
function submitForm() {
 	document.forms[0].action="StatePincodeMapping.do?event=maker_confirm_resubmit_edit&TrxId=<%=request.getAttribute("TrxId")%>";
    document.forms[0].submit();
}



//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='StatePincodeMapping.do'>
	<body>
	<!-- InstanceBeginEditable name="Content" -->
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
		
			<tr>
				<td>
				<h3>State Pincode Mapping</h3>
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
					class="tblInput">
					<thead>
					</thead>
					<tbody>

						<tr class="odd">

							<td class="fieldname" width="30%">State Name<font color="red">*</font></td>
				                  <td width="20%">
				                  	<html:select name="PincodeMappingForm" property="stateId" >
				                  		<option value="">Please Select</option>
				                  		<html:options collection="stateList" labelProperty="label" property="value" />
				                  	</html:select>
								<html:errors property="stateIdError"/>
								<html:errors property="dupStateIdError"/>&nbsp;</td>
							<td class="fieldname" width="30%">Pin Code<font color="red">*</font></td>
							<td width="20%"><html:text property="pincode" size="50"
								maxlength="1" onkeypress="return onlyNos(event,this);"></html:text>&nbsp;&nbsp;
							<br>	<html:errors property="pincodeError"/>
							
							</td>
								
								
						</tr>
						
						<tr>
							<td class="fieldname" width="30%">Remarks</td>
							<td class="even" colspan="3"><textarea name="remarks"
								rows="4" style="width: 100%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname" width="30%">Last Action By</td>
							<td class="odd" colspan="3"><%=pincodeMappingTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="even" width="60%">
							<td class="fieldname">Last Remarks Made</td>
							<td colspan="3"><%=pincodeMappingTrx.getRemarks() != null ? pincodeMappingTrx
									.getRemarks() : ""%>&nbsp;</td>
						</tr>
						<html:hidden name="PincodeMappingForm" property="status" />
						<%-- <html:hidden name="PincodeMappingForm" property="stateCode" /> --%>
						<html:hidden name="PincodeMappingForm" property="stateId" />
						<html:hidden name="PincodeMappingForm" property="pincode" />
						
						
						<html:hidden name="PincodeMappingForm" property="createdBy" />
						<html:hidden name="PincodeMappingForm" property="lastUpdateBy" />
						<html:hidden name="PincodeMappingForm" property="lastUpdateDate" />
						<html:hidden name="PincodeMappingForm" property="creationDate" />
						<html:hidden name="PincodeMappingForm" property="deprecated" />
						<html:hidden name="PincodeMappingForm" property="id" />
					</tbody>
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
			<center><a href="javascript:submitForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
			<img src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
			</a></center>
			&nbsp;</td>
			<td>
			<center><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
				src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
			</a></center>
			&nbsp;</td>
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
