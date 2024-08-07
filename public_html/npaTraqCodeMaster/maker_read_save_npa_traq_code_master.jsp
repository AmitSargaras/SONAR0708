
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.npaTraqCodeMaster.NpaTraqCodeMasterForm,com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,
	com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.npaTraqCodeMaster.trx.INpaTraqCodeMasterTrxValue,
	com.integrosys.cms.app.npaTraqCodeMaster.trx.OBNpaTraqCodeMasterTrxValue,
	com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.cms.ui.collateral.CategoryCodeConstant
	"%>
<%
NpaTraqCodeMasterForm npaTraqCodeMasterForm = (NpaTraqCodeMasterForm) request
			.getAttribute("NpaTraqCodeMasterForm");
	INpaTraqCodeMasterTrxValue npaTraqCodeMasterTrx = (INpaTraqCodeMasterTrxValue) session
			.getAttribute("com.integrosys.cms.ui.npaTraqCodeMaster.NpaTraqCodeMasterAction.INpaTraqCodeMasterTrxValue");
	int sno = 0;
	int startIndex = 0;
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
<script language="JavaScript" type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgCheckForm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
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
function cancelPage(){
	document.forms[0].action="ToDo.do?event=prepare";
	document.forms[0].submit();
	}
function submitForm() {
		document.forms[0].action = "npaTraqCodeMaster.do?event=maker_save_update";
		document.forms[0].submit();
	}
function refreshSubType(dropdown){	
	var currVal = "";
	for(i=0; i<dropdown.options.length; i++){
		if (dropdown.options[i].selected == true){
			currVal = dropdown.options[i].value;	
		}
	}	
	var dep = 'securitySubType';

	var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name='+dep+'&code=<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>&ref='+currVal;

	sendLoadDropdownReq(dep, url);	
	
	if(currVal=="PT"){
		document.getElementById("propertyTypeCodeDesc").disabled=false;
	}else{
		document.getElementById("propertyTypeCodeDesc").disabled=true;
	}
	document.getElementById("securitySubType").disabled=false;
	
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='npaTraqCodeMaster.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
						<h3>NPA TRAQ Code Master</h3>
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
								  <td class="fieldname" >NPA TRAQ Code <font color="red">*</font></td>
				                  <td width="20%">
				                  	<html:text property="npaTraqCode"  maxlength="30"/>
				                  	<html:errors property="npaTraqCode"/>
				                  	<html:errors property="npaTraqCodeLengthError" /> 
				                  	<html:errors property="npaTraqCodeError" /> 
				                  </td>
				                   
								  <td class="fieldname" width="30%">Security Type<font color="red">*</font></td>
								  <td width="20%">
								  	<html:select property="securityType" onchange="refreshSubType(this);">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE %>" descWithCode="false" />
                                	</html:select> 
								  	<br><html:errors property="securityType" />
								  	<html:errors property="securityTypeLengthError" /> 
				                  	<html:errors property="securityTypeError" /> 
								  </td>
								</tr>
								
								<tr class="odd">
								  <td class="fieldname" >Security Sub-Type <font color="red">*</font></td>
				                  <td width="20%">
				                  	<html:select styleId="securitySubType" property="securitySubType" >
										<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE %>" 
										refEntryCode="<%= npaTraqCodeMasterForm.getSecurityType()%>" descWithCode="false"/>
                                	</html:select>
				                  	<html:errors property="securitySubType"/>
				                  	<html:errors property="securitySubTypeLengthError" /> 
				                  	<html:errors property="securitySubTypeError" /> 
				                  </td>
				                   
								  <td class="fieldname" width="30%">Property Type Code Description</td>
								  <%
								  if("PT".equalsIgnoreCase(npaTraqCodeMasterForm.getSecurityType())){
								  %>
								  <td width="20%">
								  	<html:select styleId="propertyTypeCodeDesc" property="propertyTypeCodeDesc" >
										<integro:common-code categoryCode="<%=CategoryCodeConstant.PROPERTY_TYPE %>" descWithCode="false" />
                                	</html:select>  
								  	<br><html:errors property="propertyTypeCodeDesc" />
								  	<html:errors property="propertyTypeCodeDescLengthError" /> 
				                  	<html:errors property="propertyTypeCodeDescError" /> 
								  </td>
								  <%}else{ %>
								  <td width="20%">
								  	<html:select styleId="propertyTypeCodeDesc" property="propertyTypeCodeDesc"  disabled="true">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.PROPERTY_TYPE %>" descWithCode="false" />
                                	</html:select>  
								  	<br><html:errors property="propertyTypeCodeDesc" />
								  	<html:errors property="propertyTypeCodeDescLengthError" /> 
				                  	<html:errors property="propertyTypeCodeDescError" /> 
								  </td>
								  <%} %>
								</tr>
								
								<html:hidden name="NpaTraqCodeMasterForm" property="status" />
								
								<html:hidden name="NpaTraqCodeMasterForm" property="npaTraqCode" />
								<html:hidden name="NpaTraqCodeMasterForm" property="securityType" />
								<html:hidden name="NpaTraqCodeMasterForm" property="securitySubType" />
								<html:hidden name="NpaTraqCodeMasterForm" property="propertyTypeCodeDesc" />
								
								<html:hidden name="NpaTraqCodeMasterForm" property="createBy" />
								<html:hidden name="NpaTraqCodeMasterForm" property="lastUpdateBy" />
								<html:hidden name="NpaTraqCodeMasterForm" property="lastUpdateDate" />
								<html:hidden name="NpaTraqCodeMasterForm" property="creationDate" />
								<html:hidden name="NpaTraqCodeMasterForm" property="deprecated" />
								<html:hidden name="NpaTraqCodeMasterForm" property="id" />
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
