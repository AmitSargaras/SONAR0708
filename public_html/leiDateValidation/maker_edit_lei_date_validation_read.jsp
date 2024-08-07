<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page	import="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.leiDateValidation.LeiDateValidationForm,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.leiDateValidation.trx.ILeiDateValidationTrxValue,com.integrosys.cms.app.leiDateValidation.trx.OBLeiDateValidationTrxValue"%>
<%
LeiDateValidationForm leiDateValidationForm = (LeiDateValidationForm) request
			.getAttribute("LeiDateValidationForm");
	ILeiDateValidationTrxValue leiDateValidationTrx = (ILeiDateValidationTrxValue) session
			.getAttribute("com.integrosys.cms.ui.leiDateValidation.LeiDateValidationAction.ILeiDateValidationTrxValue");
	int sno = 0;
	int startIndex = 0;
	
	OBCustomerSearchResult searchResult = (OBCustomerSearchResult)session.getAttribute("com.integrosys.cms.ui.leiDateValidation.LeiDateValidationAction.customerObject");
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
    document.forms[0].action="leiDateValidation.do?event=maker_list_lei_date_validation&go=N";
	document.forms[0].submit();
	}
function submitForm() {
		document.forms[0].action = "leiDateValidation.do?event=maker_edit_lei_date_validation";
		document.forms[0].submit();
	}

function saveForm() {
		document.forms[0].action = "leiDateValidation.do?event=maker_draft_lei_date_validation";
		document.forms[0].submit();
	}
	
function searchCustomer(){ //v3.0
	//alert(document.getElementById("partyName").value +"searchCustomerName  : "+document.forms[0].partyName.value);
	if(document.getElementById("partyName").value==null){
		alert("Please enter customer name to search.");
	}
	document.forms[0].event.value="list";
	document.forms[0].submit();
}	
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='leiDateValidation.do'>
	<html:hidden property="startIndex" />
	<html:hidden property="event"/>
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
						<h3>Edit LEI Date Validation Period Master</h3>
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
								  <td class="fieldname" >Party Name<font color="red">*</font></td>
				                  <td width="20%">
				                  
				                  	<html:text property="partyName" readonly="true"/>									
									&nbsp;<html:errors property="customerNameError"/>
				                  	<html:hidden property="partyName" />
				                  	<html:errors property="partyNameLengthError" /> 
				                  	<html:errors property="partyNameError" /> 
				                  </td>
				                   
								  <td class="fieldname" width="30%">Party ID<font color="red">*</font></td>
								  <td width="20%">
									<html:text property="partyID" readonly="true"/>&nbsp; 									
									<br><html:hidden property="partyID" />
								  	<html:errors property="partyIDLengthError" /> 
				                  	<html:errors property="partyIDError" /> 
								  </td>
								</tr>
									<tr class="odd">
									<td class="fieldname">LEI Date Validation Periods(In Months)<font color="red">*</font></td>
									<td width="20%">
								  	<html:text property="leiDateValidationPeriod" size="50" maxlength="3" onkeypress="return isNumber(event);"></html:text>&nbsp; 
								  	<br>
								  	<html:errors property="leiDateValidationPeriodLengthError" /> 
				                  	<html:errors property="leiDateValidationPeriod" />
								  </td>
									<td class="fieldname"></td>
									<td>&nbsp;</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">Status&nbsp;</td>
									<td>
										<%if(leiDateValidationForm.getStatus().equals("ACTIVE")){%>
										Enable<input type="radio" checked="checked"
										id="status" name="status" value="ACTIVE">
										&nbsp; Disable<input type="radio" id="status" name="status"
										value="INACTIVE">&nbsp;
  				  	 					<%}else{ %>
  				  	 					Enable<input type="radio" 
										id="status" name="status" value="ACTIVE">
										&nbsp; Disable<input type="radio" id="status" name="status" checked="checked"
										value="INACTIVE">&nbsp;
  				  	 					<%} %>
									</td>
									<td class="fieldname"></td>
									<td>&nbsp;</td>
								</tr>
								<html:hidden name="LeiDateValidationForm" property="status" />
								<html:hidden name="LeiDateValidationForm" property="partyName" />
								<html:hidden name="LeiDateValidationForm" property="partyID" />
								<html:hidden name="LeiDateValidationForm" property="leiDateValidationPeriod" />
								
								<html:hidden name="LeiDateValidationForm" property="createBy" />
								<html:hidden name="LeiDateValidationForm" property="lastUpdateBy" />
								<html:hidden name="LeiDateValidationForm" property="lastUpdateDate" />
								<html:hidden name="LeiDateValidationForm" property="creationDate" />
								<html:hidden name="LeiDateValidationForm" property="id" />
								</tr>
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
						<a href="javascript:saveForm();" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
							src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					</center> &nbsp;
				</td>
				<td>
					<center>
						<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
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
