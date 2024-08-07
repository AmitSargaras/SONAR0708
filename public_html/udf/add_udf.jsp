<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:directive.page import="com.integrosys.cms.app.udf.bus.UDFConstants"/>
<%@page import="com.integrosys.cms.ui.udf.UdfForm"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>


<%
UdfForm actionForm = (UdfForm) pageContext.findAttribute("UdfForm");	
System.out.println(actionForm.getFieldTypeId());
 %>
<html>
<head>
	<script type="text/javascript">
		function MM_swapImgRestore() { //v3.0
  			var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
		}
			
		function MM_swapImage() { //v3.0
  			var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   			if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
		}
	
		function cancelPage(){
    		document.forms[0].action="udf.do?event=list_udf&customerID=-999999999&limitProfileID=-999999999";
    		document.forms[0].submit();
		}

		function submitForm() {
			var moduleId= document.forms[0].moduleId.value;
			if(3 == moduleId || 4 == moduleId){
				document.forms[0].fieldName.value = document.forms[0].fieldName.value.toUpperCase();
			}
		 	document.forms[0].action="udf.do?event=maker_create_udf";
    		document.forms[0].submit();
		}
	
	    function showOptions() {
			var value = document.forms[0].fieldTypeId.value;
			if (value == <%=Long.toString(UDFConstants.FIELDTYPEID_RADIOBUTTON) %> 
				|| value ==	<%=Long.toString(UDFConstants.FIELDTYPEID_SELECT) %>
				|| value ==	<%=Long.toString(UDFConstants.FIELDTYPEID_CHECKBOX) %>) {
					document.forms[0].options.value ="";
					document.forms[0].options.style.visibility="visible";
			}
			else {
				document.forms[0].options.value ="";
				document.forms[0].options.style.visibility="hidden";
			}
			if (value == <%=Long.toString(UDFConstants.FIELDTYPEID_NUMERIC_TEXT) %>
			|| value ==	<%=Long.toString(UDFConstants.FIELDTYPEID_TEXT) %>
			
					) {
				document.forms[0].numericLength.value ="";
				document.forms[0].numericLength.style.visibility="visible";
		}
		else {
			document.forms[0].numericLength.value ="";
			document.forms[0].numericLength.style.visibility="hidden";
		}
		}
		
		 
	</script>
</head>
<body>
	<table width="100%" height="70%" border="0" cellpadding="0" cellspacing="0">
		<html:form action="udf.do">
			<tr>
				<td width="80%" height="100%" valign="bottom">
					<table width="100%" height="100%" border="0" align="center"	cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
						<tr height="95%">
							<td valign="top">
							    <div id="contentCanvas" style="height: 100%; width: 100%;">
							        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
							            <tr>
							                <td width="70%">
							                    <h3>Add User Defined Fields  (UDFs)</h3>
											</td>
										</tr>
										 <tr>
							                <td width="70%">
							                    <hr/>
											</td>
										</tr>
										 <tr>
							              <td width="70%">
							                    <html:errors property="udfError"/>
											</td>
										</tr>
										
										<tr>
											<td width="70%">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
							                        <tbody>
							                        	<tr class="even">
							                        		 <td class="fieldname">Module Name</td>
							                        		 <td>
							                        		 <html:select property="moduleId">
							                        			 <html:option value="<%=Long.toString(UDFConstants.MODULEID_PARTY) %>"><%= UDFConstants.MODULEDESC_PARTY%></html:option>							                        		 
							                        		 	 <html:option value="<%=Long.toString(UDFConstants.MODULEID_CAM) %>"><%= UDFConstants.MODULEDESC_CAM%></html:option>
							                        		 	 <html:option value="<%=Long.toString(UDFConstants.MODULEID_LIMIT) %>"><%= UDFConstants.MODULEDESC_LIMIT%></html:option>							                        		 
							                        			 <html:option value="<%=Long.toString(UDFConstants.MODULEID_LIMIT_2) %>"><%= UDFConstants.MODULEDESC_LIMIT_2%></html:option>							                        		 
							                        		
							                        		 </html:select>
							                        		 </td>
							                        	</tr>
							                        	<tr class="odd">
							                        		 <td class="fieldname">Field Name <font color="red">*</font></td>
							                        		 <td>
								                        		<html:text property="fieldName" size="30"/> <br>
								                        		 <html:errors property="fieldNameError"/>
							                        		 </td>
							                        	</tr>
							                        	<tr class="even">
							                        		 <td class="fieldname">Field Type</td>
							                        		 <td>
								                        		 <html:select property="fieldTypeId" onchange="showOptions()">
								                        		 <html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_SELECT) %>"><%= UDFConstants.FIELDTYPEDESC_SELECT%></html:option>		
							                        		 	 	<html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_TEXT) %>"><%= UDFConstants.FIELDTYPEDESC_TEXT%></html:option>							                        		 
							                        		 	 	<html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_TEXTAREA) %>"><%= UDFConstants.FIELDTYPEDESC_TEXTAREA%></html:option>
							                        		 	 	<html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_RADIOBUTTON) %>"><%= UDFConstants.FIELDTYPEDESC_RADIOBUTTON%></html:option>
							                        		 	 	<html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_CHECKBOX) %>"><%= UDFConstants.FIELDTYPEDESC_CHECKBOX%></html:option>		
							                        		 	 	<html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_DATE) %>"><%= UDFConstants.FIELDTYPEDESC_DATE%></html:option>	
							                        		 	 	<html:option value="<%=Long.toString(UDFConstants.FIELDTYPEID_NUMERIC_TEXT) %>"><%= UDFConstants.FIELDTYPEDESC_NUMERIC_TEXT%></html:option>	
							                        			 </html:select>
							                        		 </td>
							                        	</tr>
							                        	
							                        	<tr class="odd">
							                        		 <td class="fieldname">Options (Comma Separated Values)</td>
							                        		 <td>	
							                        		 	  <% String hidden = "";
							                        		 	  System.out.println("::::::::::actionForm.getFieldTypeId()::::::::::"+actionForm.getFieldTypeId());
							                        		 	   if (actionForm.getFieldTypeId() != null &&  ((actionForm.getFieldTypeId().equals("1")) || actionForm.getFieldTypeId().equals("2") || actionForm.getFieldTypeId().equals("6") || actionForm.getFieldTypeId().equals("7"))) { 
							                        		 	  	hidden="visibility:hidden";
							                        		 	  }%>
							                        		 	  
								                        		  <html:text property="options" size="100"  style="<%=hidden%>"/>
								                        		   <html:errors property="optionsError"/>
								                        		 
							                        		 </td>
							                        	</tr>
							                        	<tr class="odd" >
							                        	 <% String hiddenNum = "";
							                        	 boolean showMandatory=true;
							                        		 	   if (actionForm.getFieldTypeId() == null  ) { 
							                        		 		  hiddenNum="visibility:hidden";
							                        		 		 showMandatory=false;
							                        		 	  }else if(!(actionForm.getFieldTypeId().equals("7")||actionForm.getFieldTypeId().equals("1"))){
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
							                        		 <html:checkbox property="mandatory"></html:checkbox>
								                        		 <br>
								                        		 
							                        		 </td>
							                        	</tr>
							                        	<tr class="odd" >
							                        		 <td class="fieldname">Sequence <font color="red">*</font></td>
							                        		 <td>	
								                        		  <html:text property="sequence" size="2"  />
								                        		  <html:errors property="sequenceError"/>
							                        		 </td>
							                        	</tr>
							                        	
													</tbody>
												</table>
											</td>
										</tr>
							        </table>
							    </div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			
		</html:form>
	</table>
	
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
	
<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>

   <tr>
  
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                    
  
			<td colspan="2">

						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>