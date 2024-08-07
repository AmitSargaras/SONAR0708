
<%@page import="com.integrosys.cms.app.udf.bus.UDFConstants"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.udf.UdfForm,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.udf.trx.IUdfTrxValue,com.integrosys.cms.app.udf.trx.OBUdfTrxValue"%>
<%
UdfForm udfForm = (UdfForm) request
			.getAttribute("UdfForm");
	IUdfTrxValue udfTrx = (IUdfTrxValue) session
			.getAttribute("com.integrosys.cms.ui.udf.UdfAction.IUdfTrxValue");
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
<script language="JavaScript" type="text/JavaScript">

/* function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
} */

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
		document.forms[0].action = "udf.do?event=maker_confirm_resubmit_delete";
		document.forms[0].submit();
	}

function checkMandatory(){
	if(document.getElementById("mandatory").value==''){
		document.getElementById("mandatory").value= "on";
	}else if(document.getElementById("mandatory").value==''){
		document.getElementById("mandatory").value= "on";
	}else{
		document.getElementById("mandatory").value= "";
	}
	
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='udf.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
					<%
					if ("PENDING_ENABLE".equals(udfTrx.getFromState())) {%>
						<h3>Enable User Defined Fields (UDFs)</h3>
						<%}else if("PENDING_DELETE"
					.equals(udfTrx.getFromState())){ %>
						<h3>Disable User Defined Fields (UDFs)</h3>
						<%}else{ %>
						<h3>Edit User Defined Fields (UDFs)</h3>
						<%} %>
					</td>
				</tr>
				<tr>
					<td>
						<hr />
					</td>
				</tr>
				 <tr>
					<td>
						 <html:errors property="udfError"/>
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
								<tr class="even">
								<%if ("PENDING_ENABLE".equals(udfTrx.getFromState()) || "PENDING_DELETE".equals(udfTrx.getFromState())){  %>
								 <td class="fieldname">Module Name</td>
							                        		 <td><%=udfForm.getModuleName()%> &nbsp;</td>
							                        		 
							                        	</tr>
							                        	<tr class="odd">
							                        		 <td class="fieldname">Field Name <font color="red">*</font></td>
							                        		  <td><%=udfForm.getFieldName()%> &nbsp;</td>
							                        	</tr>
							                        	<tr class="even">
							                        		 <td class="fieldname">Field Type</td>
							                        		 <td><%=udfForm.getFieldType()%> &nbsp;</td>
								                        		
							                        	</tr>
							                        	<tr class="odd">
							                        		 <td class="fieldname">Options (Comma Separated Values)</td>
							                        		 <%if(null!=udfForm.getOptions()) {%>
							                        		 <td><%=udfForm.getOptions()%> &nbsp;</td>
							                        		 <%}else{ %>
							                        		  <td>- </td>
							                        		 <%} %>
							                        	</tr>
							                        	<tr class="odd" >
							                        		 <td class="fieldname">Length </td>
							                        		  <%if(null!=udfForm.getNumericLength()) {%>
							                        		 <td><%=udfForm.getNumericLength()%> &nbsp;</td>
							                        		  <%}else{ %>
							                        		  <td>- </td>
							                        		 <%} %>
							                        	</tr>
							                        	<tr class="odd">
							                        		 <td class="fieldname">Field Mandatory </td>
							                        		 <%if("on".equals(udfForm.getMandatory())) {%>
							                        		 <td>Mandatory &nbsp;</td>
							                        		 <%}else{ %>
							                        		 <td>-</td>
							                        		 <%} %>
							                        	</tr>
							                        	<tr class="odd" >
							                        		 <td class="fieldname">Sequence <font color="red">*</font></td>
							                        		 <td><%=udfForm.getSequence()%> &nbsp;</td>
							                        	</tr>
								
								<%}else{ %>
							                        		 <td class="fieldname">Module Name</td>
							                        		 <td><%=udfForm.getModuleName()%> &nbsp;</td>
							                        		 
							                        	</tr>
							                        	<tr class="odd">
							                        		 <td class="fieldname">Field Name <font color="red">*</font></td>
							                        		  <td><%=udfForm.getFieldName()%> &nbsp;</td>
							                        	</tr>
							                        	<tr class="even">
							                        		 <td class="fieldname">Field Type</td>
							                        		 <td><%=udfForm.getFieldType()%> &nbsp;</td>
								                        		
							                        	</tr>
							                        	
							                        	<tr class="odd">
							                        		 <td class="fieldname">Options (Comma Separated Values)</td>
							                        		 <td>	
							                        		 	  <% String hidden = "";
							                        		 	  System.out.println("::::::::::udfForm.getFieldTypeId()::::::::::"+udfForm.getFieldTypeId());
							                        		 	   if (udfForm.getFieldTypeId() != null &&  ((udfForm.getFieldTypeId().equals("1")) || udfForm.getFieldTypeId().equals("2") || udfForm.getFieldTypeId().equals("6") || udfForm.getFieldTypeId().equals("7"))) { 
							                        		 	  	hidden="visibility:hidden";
							                        		 	  }%>
							                        		 	  
								                        		  <html:text property="options" size="100"  style="<%=hidden%>"/>
								                        		   <html:errors property="optionsError"/>
								                        		 
							                        		 </td>
							                        	</tr>
							                        	<tr class="odd" >
							                        	 <% String hiddenNum = "";
							                        	 boolean showMandatory=true;
							                        		 	   if (udfForm.getFieldTypeId() == null  ) { 
							                        		 		  hiddenNum="visibility:hidden";
							                        		 		 showMandatory=false;
							                        		 	  }else if(!(udfForm.getFieldTypeId().equals("7")||udfForm.getFieldTypeId().equals("1"))){
							                        		 		 hiddenNum="visibility:hidden";
							                        		 		showMandatory=false;
							                        		 	  }
							                        		 	  
							                        		 	  
							                        		 	  %>
							                        		 <td class="fieldname">Length <%if(showMandatory){ %><font color="red">*</font><%} %></td>
							                        		 <td>	
								                        		  <html:text property="numericLength" size="4"  style="<%=hiddenNum%>"/>
								                        		  <html:errors property="numericLengthError"/>
							                        		 </td>
							                        	</tr>
							                        	<tr class="odd">
							                        		 <td class="fieldname">Field Mandatory </td>
							                        		 <td>
							                        		 <%System.out.println("+++++++udfForm.getMandatory+++++"+udfForm.getMandatory()); %>
							                        		 <% if(udfForm.getMandatory()==null || "".equals(udfForm.getMandatory())){%>
							            	<input type="checkbox"  id="udfmandatory" onclick="checkMandatory()"></input> 
							            	<html:hidden property="mandatory" styleId="mandatory"/>           		 
								<% }if("on".equals(udfForm.getMandatory())){%>  
								<input type="checkbox"  id="udfmandatory"  checked="true" onclick="checkMandatory()"></input>
								<html:hidden property="mandatory" styleId="mandatory"/>
								<% }%>
								                        		 <br>
								                        		 
							                        		 </td>
							                        	</tr>
							                        	<tr class="odd" >
							                        		 <td class="fieldname">Sequence <font color="red">*</font></td>
							                        		 <td><%if(null!=udfTrx && null!=udfTrx.getReferenceID()){ %>	
								                        		 <%=udfForm.getSequence() %>
								                        		  <%}else{ %>
								                        		   <html:text property="sequence" size="2"  />
								                        		  <html:errors property="sequenceError"/>
								                        		  <%} %>
							                        		 </td>
							                        	</tr>
							                        	<%} %>
							                        	
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=udfTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=udfTrx.getRemarks() != null
						? udfTrx.getRemarks()
						: ""%>&nbsp;</td>
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
	
	<html:hidden name="UdfForm" property="fieldName" />
								<html:hidden name="UdfForm" property="fieldTypeId" />
								<html:hidden name="UdfForm" property="fieldType" />
								<html:hidden name="UdfForm" property="id" />
								<html:hidden name="UdfForm" property="moduleId" />
								<html:hidden name="UdfForm" property="moduleName" />
								<html:hidden name="UdfForm" property="options" />
								<html:hidden name="UdfForm" property="sequence" />
								<html:hidden name="UdfForm" property="status" />
								<html:hidden name="UdfForm" property="numericLength" />
								<html:hidden name="UdfForm" property="mandatory" />
								<html:hidden name="UdfForm" property="createBy" />
								<html:hidden name="UdfForm" property="lastUpdateBy" />
								<html:hidden name="UdfForm" property="lastUpdateDate" />
								<html:hidden name="UdfForm" property="creationDate" />	
								<html:hidden name="UdfForm" property="deprecated"/>
</html:form>
<!-- InstanceEnd -->
</html>
